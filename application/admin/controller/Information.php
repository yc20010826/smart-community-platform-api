<?php

namespace app\admin\controller;

use app\common\controller\AliSms;
use app\common\controller\Backend;
use app\common\model\User;
use think\Config;
use think\Db;
use think\Exception;
use think\exception\PDOException;
use think\exception\ValidateException;
use think\Log;
use YangChengEasyComposer\Utils\Request;
use YangChengEasyComposer\Wechat\WehatMini;

/**
 * 信息管理
 *
 * @icon fa fa-circle-o
 */
class Information extends Backend
{

    /**
     * Information模型对象
     * @var \app\common\model\Information
     */
    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\common\model\Information;
        $this->view->assign("statusList", $this->model->getStatusList());

        $category = \app\common\model\Category::where('type','information')->where('status','normal')->select();
        $category_list = [];
        foreach ($category as $item){
            $category_list[$item['id']] = $item['name'];
        }
        $this->assignconfig('category_list',$category_list);
    }



    /**
     * 默认生成的控制器所继承的父类中有index/add/edit/del/multi五个基础方法、destroy/restore/recyclebin三个回收站方法
     * 因此在当前控制器中可不用编写增删改查的代码,除非需要自己控制这部分逻辑
     * 需要将application/admin/library/traits/Backend.php中对应的方法复制到当前控制器,然后进行修改
     */


    /**
     * 查看
     */
    public function index()
    {
        //当前是否为关联查询
        $this->relationSearch = true;
        //设置过滤方法
        $this->request->filter(['strip_tags', 'trim']);
        if ($this->request->isAjax()) {
            //如果发送的来源是Selectpage，则转发到Selectpage
            if ($this->request->request('keyField')) {
                return $this->selectpage();
            }
            list($where, $sort, $order, $offset, $limit) = $this->buildparams();

            $list = $this->model
                    ->with(['user','category','community'])
                    ->where($where)
                    ->order($sort, $order)
                    ->paginate($limit);

            foreach ($list as $row) {
                $row->visible(['id','community_id','title','substance','images','contact','status','status_msg','look_num','weigh','createtime','updatetime']);
                $row->visible(['user']);
				$row->getRelation('user')->visible(['nickname']);
                $row->visible(['category']);
				$row->getRelation('category')->visible(['name']);
                $row->visible(['community']);
				$row->getRelation('community')->visible(['name']);
            }

            $result = array("total" => $list->total(), "rows" => $list->items());

            return json($result);
        }
        return $this->view->fetch();
    }


    /**
     * 编辑
     */
    public function edit($ids = null)
    {
        $row = $this->model->get($ids);
        if (!$row) {
            $this->error(__('No Results were found'));
        }
        $adminIds = $this->getDataLimitAdminIds();
        if (is_array($adminIds)) {
            if (!in_array($row[$this->dataLimitField], $adminIds)) {
                $this->error(__('You have no permission'));
            }
        }
        if ($this->request->isPost()) {
            $params = $this->request->post("row/a");
            if ($params) {
                $params = $this->preExcludeFields($params);
                $result = false;
                Db::startTrans();
                try {
                    //是否采用模型验证
                    if ($this->modelValidate) {
                        $name = str_replace("\\model\\", "\\validate\\", get_class($this->model));
                        $validate = is_bool($this->modelValidate) ? ($this->modelSceneValidate ? $name . '.edit' : $name) : $this->modelValidate;
                        $row->validateFailException(true)->validate($validate);
                    }
                    $oldStatus = $row->status; // 原始状态时
                    $result = $row->allowField(true)->save($params);
                    // 判断是否为审核
                    if($oldStatus == 0 && $params['status'] != $oldStatus){
                        $userInfo = User::get($row->user_id);
                        $category_name = \app\common\model\Category::where('id', $row->category_id)->value('name');
                        $send_content = [
                            'category_name' => $category_name,
                            'title' => $row->title,
                            'status_msg' => $params['status']==2?$params['status_msg']:'',
                        ];
                        $sqlContent = "您发布的内容《{$row->title}》".($params['status'] == 1 ? "已通过":"未通过")."审核！";
                        if($params['status'] == 2){
                            $sqlContent .= "原因：{$params['status_msg']}，请修改后再次提交，或联系客服申诉！";
                        }
                        \app\common\model\Message::create([
                            'type' => 1,
                            'send_user' => 0,
                            'receive_user' => $row->user_id,
                            'title' => "内容审核结果通知",
                            'content' => $sqlContent,
                            'jump_type' => 1,
                        ]);
                        $send_sub_msg = $this->send_mini_subMsg_information_approve($userInfo->mini_openid, $send_content, !($params['status'] == 2));
                        // 发送短信通知
                        if($params['status'] == 1 && !$send_sub_msg){
                            AliSms::send_information_approve($row->contact, 1);
                        }
                        if($params['status'] == 2 && !$send_sub_msg){
                            AliSms::send_information_approve($row->contact, 0, $params['status_msg']);
                        }
                    }
                    Db::commit();
                } catch (ValidateException $e) {
                    Db::rollback();
                    $this->error($e->getMessage());
                } catch (PDOException $e) {
                    Db::rollback();
                    $this->error($e->getMessage());
                } catch (Exception $e) {
                    Db::rollback();
                    $this->error($e->getMessage());
                }
                if ($result !== false) {
                    $this->success();
                } else {
                    $this->error(__('No rows were updated'));
                }
            }
            $this->error(__('Parameter %s can not be empty', ''));
        }
        $this->view->assign("row", $row);
        return $this->view->fetch();
    }


    /**
     * 发送审核消息
     * @param $miniOpenid
     * @param $content
     * @param $status
     * @return bool
     * @throws Exception
     */
    public function send_mini_subMsg_information_approve($miniOpenid, $content, $status){
        $title = mb_substr($content['title'] , 0 , 19, 'utf-8');
        $tempData = [
            'touser' => $miniOpenid,
            'template_id' => Config::get('site.miniSubMsg_information_approve'),
            'page' => 'pages/index/index',
            'data' => [
                'thing7' => [
                    'value' => $title
                ],
                'thing2' => [
                    'value' => $status?'审核通过':'审核不通过'
                ],
                'thing5' => [
                    'value' => empty($content['status_msg'])?'点击查看详情':$content['status_msg']
                ],
                'time4' => [
                    'value' => date('Y-m-d H:i:s')
                ],
            ]
        ];
        $weChatMiniClass = new WehatMini(['appid'=>Config::get('site.miniapp_appid'),'secret'=>Config::get('site.miniapp_secret')]);
        try{
            $result = Request::send_request('https://api.weixin.qq.com/cgi-bin/message/subscribe/send?access_token='.$weChatMiniClass->getAccessToken(),json_encode($tempData),'POST');
            if (isset($result['errcode']) && $result['errcode'] != 0 || !$result){
                Log::error('订阅消息发送方法出现错误：'.$result['errmsg']);
                throw new \think\Exception($result['errmsg']);
            }
            return true;
        }catch (\Exception $e){
            Log::error('订阅消息发送方法出现错误：'.$e);
            return false;
        }
    }
}
