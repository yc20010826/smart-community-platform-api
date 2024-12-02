<?php

namespace app\api\controller;

use app\common\controller\AliSms;
use app\common\controller\BaiduAi;
use app\common\model\Comment;
use app\common\model\Community;
use think\Cache;
use think\Config;
use think\Db;
use think\Log;
use think\Request;
use YangChengEasyComposer\Wechat\WehatMini;

class Information extends \app\common\controller\Api
{
    /**
     * 无需鉴权的方法,但需要登录
     * @var array
     */
    protected $noNeedRight = ['*'];
    protected $noNeedLogin = ['get_list', 'get_details'];
    protected $model = null;

    protected $EARTH = 6378.137; //固定参数 地球半径
    protected $PI = 3.1415926535898; //固定参数 圆周率

    public function __construct(Request $request = null)
    {
        $this->model = new \app\common\model\Information();
        parent::__construct($request);
    }

    /**
     * 获取信息列表
     * @throws \think\exception\DbException
     */
    public function get_list()
    {
        $community_id = $this->request->param('community_id');
        $lng = $this->request->param('lng');
        $lat = $this->request->param('lat');

        $key = $this->request->param('key');
        $category_id = $this->request->param('category_id');
        $limit = $this->request->param('limit', 20);
        $commWhere = [];
        $commOrder = [];
        if ($key) {
            $commWhere['information.title|information.substance'] = ['like', '%' . $key . '%'];
        }
        if ($category_id) {
            $commWhere['information.category_id'] = ['=', $category_id];
        }

        // 快捷排序筛选
        $seach_type = $this->request->param('seach_type');
        if ($seach_type) {
            switch ($seach_type) {
                case "0":
                    $commOrder = ['information.updatetime' => 'DESC'];
                    break;
                case "1":
                    $commOrder = ['information.look_num' => 'DESC', 'information.updatetime' => 'DESC'];
                    break;
                case "2":
                    $commWhere['information.community_id'] = ['=', $community_id];
                    break;
            }
        }
        // 列表筛选
        $seach_content = $this->request->param('seach_content/a');
        if (!empty($seach_content['other_screening'])) {
            foreach ($seach_content['other_screening'] as $searchItem) {
                switch ($searchItem) {
                    case "only_my_community":
                        if (empty($this->auth->id)) {
                            $this->error('此功能需登录后使用');
                        }
                        // 只看我的小区
                        $community_id = \app\common\model\User::where('id', $this->auth->id)->value('community_id');
                        if (!$community_id) {
                            $community_id = 'un';
                        }
                        $commWhere['information.community_id'] = ['=', $community_id];
                        break;
                    case "only_bet_community":
                        // 只看当前小区
                        if (!$community_id) {
                            $community_id = 'un';
                        }
                        $commWhere['information.community_id'] = ['=', $community_id];
                        break;
                    case "price_desc":
                        // 价格从高到低
                        $commOrder = ['information.price' => 'DESC'];
                        break;
                    case "price_asc":
                        // 价格从低到高
                        $commOrder = ['information.price' => 'ASC'];
                        break;
                    case "not_look_price":
                        // 不看价格为0的
                        $commWhere['information.price'] = ['>', 0];
                        break;
                }
            }
        }

        switch ($seach_content['fast_sort']) {
            case "1":
                $commOrder = ['information.look_num' => 'DESC'];
                break;
            case "0":
                $commOrder = ['information.updatetime' => 'DESC'];
                break;
        }

        // 距离排序
        if ($seach_content['distance'] == 1) {
            // 从近到远
            $commOrder = ['distance' => 'ASC'];
        }
        if ($seach_content['distance'] == 2) {
            // 从近到远
            $commOrder = ['distance' => 'DESC'];
        }

        // 计算距离语句
        $distanceSql = "ROUND((2 * $this->EARTH* ASIN(SQRT(POW(SIN($this->PI*(" . $lat . "-information.latitude)/360),2)+COS($this->PI*" . $lat . "/180)* COS(information.latitude * $this->PI/180)*POW(SIN($this->PI*(" . $lng . "-information.longitude)/360),2)))), 2)";

        // 复杂查询语句
        $commWhereStr = "";

        // 距离范围
        if (!empty($seach_content['range'])) {
            if(!empty($commWhereStr)){
                $commWhereStr .= " AND ";
            }
            $commWhereStr .= $distanceSql." <= " . $seach_content['range'];
        }

        $list = $this->model
            ->field("*, {$distanceSql} as distance")
            ->with(['user', 'category', 'community'])
            ->where($commWhere)
            ->where('information.status', "1")
            ->where($commWhereStr)
            ->order($commOrder)
            ->order('information.weigh', 'DESC')
            ->paginate($limit);
        foreach ($list as $row) {
            $row->visible([
                'id',
                'category_id',
                'look_num',
                'longitude',
                'latitude',
                'distance',
                'community_id',
                'title',
                'substance',
                'images',
                'price',
                'cycle',
                'contact',
                'status',
                'status_msg', 'weigh', 'is_thiscom', 'createtime', 'updatetime']);
            $row->visible(['user']);
            $row->getRelation('user')->visible(['nickname', 'avatar', 'community_id']);
            $row->visible(['category']);
            $row->getRelation('category')->visible(['name']);
            $row->visible(['community']);
            $row->getRelation('community')->visible(['name']);
        }
        $list = $list->items();
        $data_list = [];
        $total_data = 0;
        if ($list) {
            $list = collection($list)->toArray();
            foreach ($list as $item) {
                // 判断是否仅小区可见
                if ($item['is_thiscom'] && $item['community_id'] != $community_id) {
                    continue;
                }

                $item['images_arr'] = !empty($item['images']) ? explode(',', $item['images']) : [];
                foreach ($item['images_arr'] as &$img) {
                    if (!preg_match("/^(http:\/\/|https:\/\/).*$/", $img)) {
                        $img = Config::get('site.baseImgUrl') . $img;
                    }
                    $img .= '?x-oss-process=image/resize,m_fill,w_500,quality,q_80';
                }
                // 获取评论数量
                $item['comment_count'] = Comment::where('information_id', $item['id'])->where('status', 1)->count();

                // 截取简要描述
                $limitedText = mb_substr($item['substance'], 0, 30);
                if (strlen($item['substance']) > 30) {
                    $limitedText .= "...";
                }
                $item['desc'] = $limitedText;

                $data_list[] = $item;
                $total_data++;
            }
        }
        $result = array("total" => $total_data, "rows" => $data_list);

        $this->success('获取成功', $result);
    }

    /**
     * 获取信息详情
     * @throws \think\exception\DbException
     */
    public function get_details()
    {
        //当前是否为关联查询
        $this->relationSearch = true;
        $information_id = $this->request->get('information_id');
        $old_community_id = $this->request->get('community_id');
        $lng = $this->request->param('lng');
        $lat = $this->request->param('lat');
        $score = $this->request->param('score');

        $where = [];
        $where['information.status'] = ['=', "1"];
        if ($score == 'edit') {
            unset($where['information.status']);
        }
        $row = $this->model
            ->field("*,ROUND(
                (2 * $this->EARTH* ASIN(SQRT(POW(SIN($this->PI*(" . $lat . "-information.latitude)/360),2)+COS($this->PI*" . $lat . "/180)* COS(information.latitude * $this->PI/180)*POW(SIN($this->PI*(" . $lng . "-information.longitude)/360),2))))
                , 2)as distance")
            ->with(['user', 'category', 'community'])
            ->where('information.id', $information_id)
            ->where($where)
            ->find();
        if (empty($row)) {
            $this->error('内容不存在啦，看看其他的吧');
        }
        $row->visible([
            'id', 'look_num', 'user_id', 'look_num',
            'category_id', 'longitude', 'latitude', 'distance', 'category_id',
            'community_id', 'title', 'substance', 'images', 'price', 'cycle', 'contact',
            'status', 'status_msg', 'weigh', 'is_thiscom', 'createtime', 'updatetime']);
        $row->visible(['user']);
        $row->getRelation('user')->visible(['nickname', 'avatar', 'community_id']);
        $row->visible(['category']);
        $row->getRelation('category')->visible(['name']);
        $row->visible(['community']);
        $row->getRelation('community')->visible(['name', 'longitude', 'latitude']);
        if (!empty($row)) {
            // 判断是否仅小区可见
            if ($row['is_thiscom'] && $row['community_id'] != $old_community_id) {
                $this->error('信息仅指定区域可见');
            }
            $row->look_num += rand(1, 15);
            $row->save();
            $row = $row->toArray();
            // 计算距离
            $row['images_arr'] = !empty($row['images']) ? explode(',', $row['images']) : [];
            $row['images_arr_original'] = [];
            foreach ($row['images_arr'] as &$img) {
                if (!preg_match("/^(http:\/\/|https:\/\/).*$/", $img)) {
                    $img = Config::get('site.baseImgUrl') . $img;
                }
                $row['images_arr_original'][] = $img;
                $img .= '?x-oss-process=image/resize,m_fill,w_800,quality,q_90';
            }

            // 经纬度转number，非字符串
            $row['longitude'] = floatval($row['longitude']);
            $row['latitude'] = floatval($row['latitude']);
            $row['community']['longitude'] = floatval($row['community']['longitude']);
            $row['community']['latitude'] = floatval($row['community']['latitude']);
        }
        $this->success('获取成功', $row);
    }

    /**
     * 发布信息
     * @throws \think\Exception
     * @throws \think\exception\DbException
     */
    public function release()
    {
        $param = $this->request->post();
        $lng = $this->request->param('lng');
        $lat = $this->request->param('lat');
        $userInfo = \app\common\model\User::get($this->auth->id);
        $community_id = empty($param['community_id']) ? '' : $param['community_id'];
        if($community_id){
            // 获取当前小区经纬度信息
            $community_info = Community::get($community_id);
            if (empty($community_info)) {
                $this->error('当前位置不允许使用');
            }
            $lng = $community_info['longitude'];
            $lat = $community_info['latitude'];
        }

        $param['is_thiscom'] = $param['is_thiscom'] ? 1 : 0;
        $param['user_id'] = $this->auth->id;
        $param['community_id'] = $community_id;
        $param['longitude'] = $lng;
        $param['latitude'] = $lat;

        if (empty($param['contact'])) {
            // 使用账号手机号
            $param['contact'] = $userInfo['mobile'];
        }

        if (!empty($param['is_hide_location'])) {
            // 如果开启了隐藏地理位置
            unset($param['community_id']);
        }

        if (in_array($param['category_id'], [14, 23]) && empty($param['price'])) {
            $this->error('发布本板块类型需要设置价格');
        }

        try {
            // 是否自动审核（是否自动通过）
            $is_auto_approve = Config::get('site.is_auto_approve');
            if ($is_auto_approve) {
                $baiduAiClass = new BaiduAi();
                $checkResult = $baiduAiClass->check_text($param['title'] . $param['substance']);
                if ($checkResult['code'] == 2) {
                    // 需要直接驳回
                    throw new \think\Exception('发布失败：' . $checkResult['msg']);
                }
                if (in_array($checkResult['code'], [3, 0])) {
                    $is_auto_approve = false;
                    $param['status'] = 0;
                    $param['status_msg'] = $checkResult['msg'];
                }
                if ($checkResult['code'] == 1) {
                    $is_auto_approve = true;
                    $param['status'] = 1;
                }
            }
            (new \app\common\model\Information())->allowField(true)->save($param);
        } catch (\Exception $e) {
            Log::error('错误', $e->getMessage());
            $this->error($e->getMessage());
        }
        if (!$is_auto_approve) {
            // 给管理员发一条信息，请求审核
            \YangChengEasyComposer\Utils\Request::send_request('https://www.wangyunzhi.cn/api/wechat/send_approve_information_template', [
                'title' => $param['title'],
                'signKey' => '154fmj755s7fs78c478aa7',
            ]);
        }
        $this->success('发布成功', ['tmplIds' => [Config::get('site.miniSubMsg_information_approve')]], $is_auto_approve ? 1 : 2);
    }

    /**
     * 获取各个状态数量
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function get_count_num()
    {
        $data = \app\common\model\Information::where('user_id', $this->auth->id)
            ->field('count(status) as status_count,status')
            ->group('status')
            ->select();
        $this->success('获取成功', $data);
    }


    /**
     * 获取我的信息列表
     * @throws \think\exception\DbException
     */
    public function get_my_list()
    {
        $key = $this->request->param('key');
        $status = $this->request->param('status');
        $limit = $this->request->param('limit', 10);
        $commWhere = [];
        $commWhere['information.user_id'] = ['=', $this->auth->id];
        if ($key) {
            $commWhere['information.title|information.substance'] = ['like', '%' . $key . '%'];
        }
        if ($status != null) {
            $commWhere['information.status'] = ['=', $status];
        }
        $list = $this->model
            ->with(['user', 'category', 'community'])
            ->where($commWhere)
            ->order('information.updatetime', 'DESC')
            ->order('information.weigh', 'DESC')
            ->paginate($limit);
        foreach ($list as $row) {
            $row->visible(['id', 'look_num', 'longitude', 'latitude', 'community_id', 'title', 'substance', 'images', 'contact', 'status', 'status_msg', 'weigh', 'is_thiscom', 'createtime', 'updatetime']);
            $row->visible(['user']);
            $row->getRelation('user')->visible(['nickname', 'avatar', 'community_id']);
            $row->visible(['category']);
            $row->getRelation('category')->visible(['name']);
            $row->visible(['community']);
            $row->getRelation('community')->visible(['name']);
        }
        $list = $list->items();
        $data_list = [];
        $total_data = 0;
        if ($list) {
            $list = collection($list)->toArray();
            foreach ($list as $item) {
                $item['images_arr'] = !empty($item['images']) ? explode(',', $item['images']) : [];
                foreach ($item['images_arr'] as &$img) {
                    if (!preg_match("/^(http:\/\/|https:\/\/).*$/", $img)) {
                        $img = Config::get('site.baseImgUrl') . $img;
                    }
                }
                // 获取评论数量
                $item['comment_count'] = Comment::where('information_id', $item['id'])->where('status', 1)->count();

                $data_list[] = $item;
                $total_data++;
            }
        }
        $result = array("total" => $total_data, "rows" => $data_list);

        $this->success('获取成功', $result);
    }

    /**
     * 删除信息
     * @param $information_id
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function del_information($information_id)
    {
        $information = $this->model->where('id', $information_id)->where('user_id', $this->auth->id)->find();
        $information->delete();
        $this->success('删除成功');
    }

    /**
     * 信息上下架
     * @param $information_id
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function set_information_status($information_id)
    {
        $information = $this->model->where('id', $information_id)->where('user_id', $this->auth->id)->find();
        if ($information->status == 0) {
            $this->error('信息尚未过审，请耐心等待');
        }
        if ($information->status == 3) {
            $information->status = 1;
        } else {
            $information->status = 3;
        }
        $information->save();
        $this->success('处理成功');
    }

    /**
     * 修改信息
     * @throws \think\Exception
     * @throws \think\exception\DbException
     */
    public function edit_information()
    {
        $param = $this->request->post();
        $id = $param['id'];
        $information = $this->model->where('id', $id)->where('user_id', $this->auth->id)->find();
        if (!$information || $information->status == 0) {
            $this->error('该信息当前状态不可编辑');
        }
        $lng = $this->request->param('lng');
        $lat = $this->request->param('lat');
        $userInfo = \app\common\model\User::get($this->auth->id);

        $community_id = empty($param['community_id']) ? '' : $param['community_id'];
        if($community_id){
            // 获取当前小区经纬度信息
            $community_info = Community::get($community_id);
            if (empty($community_info)) {
                $this->error('当前位置不允许使用');
            }
            $lng = $community_info['longitude'];
            $lat = $community_info['latitude'];
        }

        $param['is_thiscom'] = $param['is_thiscom'] ? 1 : 0;
        $param['user_id'] = $this->auth->id;
        $param['community_id'] = $community_id;
        $param['longitude'] = $lng;
        $param['latitude'] = $lat;

        if (empty($param['contact'])) {
            // 使用账号手机号
            $param['contact'] = $userInfo['mobile'];
        }
        if (!empty($param['is_hide_location'])) {
            // 如果开启了隐藏地理位置
            $param['community_id'] = null;
        }

        if (in_array($param['category_id'], [14, 23]) && empty($param['price'])) {
            $this->error('发布本板块类型需要设置价格');
        }

        $param['status'] = 0;
        // 是否自动审核（是否自动通过）
        $is_auto_approve = Config::get('site.is_auto_approve');
        // 发起请求
        try {
            if ($is_auto_approve) {
                $baiduAiClass = new BaiduAi();
                $checkResult = $baiduAiClass->check_text($param['title'] . $param['substance']);
                if ($checkResult['code'] == 2) {
                    // 需要直接驳回
                    throw new \think\Exception('发布失败：' . $checkResult['msg']);
                }
                if (in_array($checkResult['code'], [3, 0])) {
                    $is_auto_approve = false;
                    $param['status'] = 0;
                    $param['status_msg'] = $checkResult['msg'];
                }
                if ($checkResult['code'] == 1) {
                    $is_auto_approve = true;
                    $param['status'] = 1;
                }
            }
            unset($param['category']);
            unset($param['community']);
            unset($param['images_arr']);
            unset($param['user']);
            $is_update = (new \app\common\model\Information())->allowField(true)->save($param, ['id' => $id]);
            if (!$is_update) {
                throw new \think\Exception('请修改点东西再提交');
            }
        } catch (\Exception $e) {
            $this->error($e->getMessage());
        }
        if (!$is_auto_approve) {
            // 给管理员发一条信息，请求审核
            \YangChengEasyComposer\Utils\Request::send_request('https://www.wangyunzhi.cn/api/wechat/send_approve_information_template', [
                'title' => $param['title']
            ]);
        }
        $this->success('修改成功', ['tmplIds' => [Config::get('site.miniSubMsg_information_approve')]], $is_auto_approve ? 1 : 2);
    }

    /*
     * 获取评论列表
     */
    public function get_comment($information_id)
    {
        $list = Comment::where('information.status', '=', "1")
            ->where('information.id', '=', $information_id)
            ->with(['user', 'information'])
            ->where('comment.status', '=', "1")
            ->order('comment.createtime', 'ASC')
            ->paginate(1000);
        foreach ($list as $row) {
            $row->visible(['id', 'pid', 'user_id', 'content', 'createtime', 'status']);
            $row->visible(['user']);
            $row->getRelation('user')->visible(['nickname', 'avatar']);
            $row->visible(['information']);
            $row->getRelation('information')->visible(['title', 'user_id']);
        }
        $this->success('ok', [
            'count' => $list->total(),
            'list' => $list->items()
        ]);
    }

    /**
     * 发布评论
     * @param $information_id
     */
    public function add_comment($information_id)
    {
        $pid = $this->request->post('pid');
        $content = $this->request->post('content');
        $user_id = $this->auth->id;
        $baiduAiClass = new BaiduAi();
        $checkResult = $baiduAiClass->check_text($content);
        if ($checkResult['code'] == 2) {
            $this->error('发布内容包含不符合社区规定内容：' . $checkResult['msg']);
        }
        $find = Comment::where('content', $content)->where('user_id', $user_id)->find();
        if ($find && (time() - $find['createtime']) < 60) {
            $this->error('请问重复评论同一内容');
        }
        Comment::create([
            'information_id' => $information_id,
            'pid' => $pid,
            'content' => $content,
            'status' => 1,
            'user_id' => $user_id
        ]);
        $onceUserId = \app\common\model\Information::where('id', $information_id)->value('user_id');
        $onceUserInfo = \app\common\model\User::get($onceUserId);
        // 写入站内信
        if (empty($pid)) {
            \app\common\model\Message::send_comment_msg($onceUserId, $information_id);
        } else {
            $p_user_id = Comment::where('id', $pid)->value('user_id');
            \app\common\model\Message::send_comment_msg($p_user_id, $information_id);
        }

        // 发送短信通知，且不高于短信上限
        if ($onceUserInfo && empty($pid) && $user_id != $onceUserId && $onceUserInfo['sms_upper_limit'] > 0) {
            $onceUserInfo->sms_upper_limit--;
            $onceUserInfo->save();
            // 发送
            AliSms::send_information_received_comment($onceUserInfo['mobile']);
        }
        $this->success('评论成功');
    }

    /**
     * 删除评论
     * @param $comment_id
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function del_comment($comment_id)
    {
        $find = Comment::get($comment_id);
        $information = \app\common\model\Information::where('id', $find['information_id'])->find();
        if ($this->auth->id != $information['user_id']) {
            if ($this->auth->id != $find['user_id']) {
                $this->error('无权限删除');
            }
        }
        $find->delete();
        $this->success('删除成功');
    }
}