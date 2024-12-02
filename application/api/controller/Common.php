<?php

namespace app\api\controller;

use app\common\controller\Api;
use app\common\exception\UploadException;
use app\common\library\Upload;
use app\common\model\Area;
use app\common\model\Banner;
use app\common\model\Community;
use app\common\model\Modular;
use app\common\model\Version;
use fast\Random;
use think\Config;
use think\Hook;

/**
 * 公共接口
 */
class Common extends Api
{
    protected $noNeedLogin = ['init','get_community','get_community_v2','get_banner','get_modular','get_information_type','get_customer_service','reset_user_sms_upper_limit'];
    protected $noNeedRight = '*';


    protected $EARTH = 6378.137; //固定参数 地球半径
    protected $PI = 3.1415926535898; //固定参数 圆周率

    /**
     * 加载初始化
     *
     * @param string $version 版本号
     * @param string $lng     经度
     * @param string $lat     纬度
     */
    public function init()
    {
        if ($version = $this->request->request('version')) {
            $lng = $this->request->request('lng');
            $lat = $this->request->request('lat');

            //配置信息
            $upload = Config::get('upload');
            //如果非服务端中转模式需要修改为中转
            if ($upload['storage'] != 'local' && isset($upload['uploadmode']) && $upload['uploadmode'] != 'server') {
                //临时修改上传模式为服务端中转
                set_addon_config($upload['storage'], ["uploadmode" => "server"], false);

                $upload = \app\common\model\Config::upload();
                // 上传信息配置后
                Hook::listen("upload_config_init", $upload);

                $upload = Config::set('upload', array_merge(Config::get('upload'), $upload));
            }

            $upload['cdnurl'] = $upload['cdnurl'] ? $upload['cdnurl'] : cdnurl('', true);
            $upload['uploadurl'] = preg_match("/^((?:[a-z]+:)?\/\/)(.*)/i", $upload['uploadurl']) ? $upload['uploadurl'] : url($upload['storage'] == 'local' ? '/api/common/upload' : $upload['uploadurl'], '', false, true);

            $content = [
                'citydata'    => Area::getCityFromLngLat($lng, $lat),
                'versiondata' => Version::check($version),
                'uploaddata'  => $upload,
                'coverdata'   => Config::get("cover"),
            ];
            $this->success('', $content);
        } else {
            $this->error(__('Invalid parameters'));
        }
    }

    /**
     * 上传文件
     * @ApiMethod (POST)
     * @param File $file 文件流
     */
    public function upload()
    {
        Config::set('default_return_type', 'json');
        //必须设定cdnurl为空,否则cdnurl函数计算错误
        Config::set('upload.cdnurl', '');
        $chunkid = $this->request->post("chunkid");
        if ($chunkid) {
            if (!Config::get('upload.chunking')) {
                $this->error(__('Chunk file disabled'));
            }
            $action = $this->request->post("action");
            $chunkindex = $this->request->post("chunkindex/d");
            $chunkcount = $this->request->post("chunkcount/d");
            $filename = $this->request->post("filename");
            $method = $this->request->method(true);
            if ($action == 'merge') {
                $attachment = null;
                //合并分片文件
                try {
                    $upload = new Upload();
                    $attachment = $upload->merge($chunkid, $chunkcount, $filename);
                } catch (UploadException $e) {
                    $this->error($e->getMessage());
                }
                $this->success(__('Uploaded successful'), ['url' => $attachment->url, 'fullurl' => cdnurl($attachment->url, true)]);
            } elseif ($method == 'clean') {
                //删除冗余的分片文件
                try {
                    $upload = new Upload();
                    $upload->clean($chunkid);
                } catch (UploadException $e) {
                    $this->error($e->getMessage());
                }
                $this->success();
            } else {
                //上传分片文件
                //默认普通上传文件
                $file = $this->request->file('file');
                try {
                    $upload = new Upload($file);
                    $upload->chunk($chunkid, $chunkindex, $chunkcount);
                } catch (UploadException $e) {
                    $this->error($e->getMessage());
                }
                $this->success();
            }
        } else {
            $attachment = null;
            //默认普通上传文件
            $file = $this->request->file('file');
            try {
                $upload = new Upload($file);
                $attachment = $upload->upload();
            } catch (UploadException $e) {
                $this->error($e->getMessage());
            }

            $this->success(__('Uploaded successful'), ['url' => $attachment->url, 'fullurl' => cdnurl($attachment->url, true)]);
        }

    }

    /**
     * 获取附近的小区V2
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function get_community_v2(){
        $lng = $this->request->param('lng');
        $lat = $this->request->param('lat');

        $key = $this->request->param('key');
        $limit = $this->request->param('limit', 20);

        // 计算距离语句
        $distanceSql = "ROUND((2 * $this->EARTH* ASIN(SQRT(POW(SIN($this->PI*(" . $lat . "-latitude)/360),2)+COS($this->PI*" . $lat . "/180)* COS(latitude * $this->PI/180)*POW(SIN($this->PI*(" . $lng . "-longitude)/360),2)))), 2)";

        $community_list = Community::field("*, {$distanceSql} as distance")
            ->where('status','in',["0","1"])
            ->where('name','like','%'.$key.'%')
            ->where("$distanceSql <= 30")
            ->order('distance ASC')
            ->paginate($limit);

        // 如果登录了的，判断如果没有默认小区则设置当前小区为默认
        if($this->auth->isLogin() && !empty($data_list)){
            $thisUser = \app\common\model\User::where('id',$this->auth->id)->find();
            if(empty($thisUser->community_id)){
                $thisUser->community_id = $community_list->items()[0]['id'];
                $thisUser->save();
            }
        }

        $this->success('获取成功',$community_list);
    }

    /**
     * 获取附近的小区
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function get_community(){
        $lng = $this->request->param('lng');
        $lat = $this->request->param('lat');

        $key = $this->request->param('key');
        $limit = $this->request->param('limit', 20);

        // 计算距离语句
        $distanceSql = "ROUND((2 * $this->EARTH* ASIN(SQRT(POW(SIN($this->PI*(" . $lat . "-latitude)/360),2)+COS($this->PI*" . $lat . "/180)* COS(latitude * $this->PI/180)*POW(SIN($this->PI*(" . $lng . "-longitude)/360),2)))), 2)";

        $community_list = Community::field("*, {$distanceSql} as distance")
            ->where('status','in',["0","1"])
            ->where('name','like','%'.$key.'%')
            ->where("$distanceSql <= 30")
            ->order('distance ASC')
            ->paginate($limit);

        $data_list = [];
        if(!empty($community_list)){
            $data_list = $community_list->items();
        }

        // 如果登录了的，判断如果没有默认小区则设置当前小区为默认
        if($this->auth->isLogin() && !empty($data_list)){
            $thisUser = \app\common\model\User::where('id',$this->auth->id)->find();
            if(empty($thisUser->community_id)){
                $thisUser->community_id = $data_list[0]['id'];
                $thisUser->save();
            }
        }

        $this->success('获取成功',$data_list);
    }

    /**
     * 获取首页banner
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function get_banner(){
        $community_id = $this->request->param('community_id');
        $ids = Banner::where('status',1)->where('community_id',0)->column('id');
        $ids2 = [];
        if(!empty($community_id)){
            $ids2 = Banner::where('status',1)->where('community_id',$community_id)->column('id');
        }
        $banner_ids = array_merge($ids,$ids2);
        $banner_list = Banner::where('id','in',$banner_ids)->order('weigh','DESC')->select();
        $this->success('获取成功',$banner_list);
    }

    /**
     * 获取首页功能模块
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function get_modular(){
        $community_id = $this->request->param('community_id');
        $ids = Modular::where('status',1)->where('community_id',0)->column('id');
        $ids2 = [];
        if(!empty($community_id)){
            $ids2 = Modular::where('status',1)->where('community_id',$community_id)->column('id');
        }
        $ids_all = array_merge($ids,$ids2);
        $data_list = Modular::where('id','in',$ids_all)->order('weigh','DESC')->select();
        $this->success('获取成功',$data_list);
    }

    /**
     * 获取信息发布分类
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function get_information_type(){
        $category = \app\common\model\Category::where('type','information')->where('status','normal')->select();
        $this->success('获取成功',$category);
    }

    /*
     * 提交建点申请
     */
    public function add_community(){
        $param = $this->request->post();
        $param['user_id'] = $this->auth->id;
        // 判断是否已经有人提交过
        $find = Community::where('name',$param['name'])->find();
        if($find){
            if($find->status == 0){
                $this->error('该地点已有申请，目前待审核，请耐心等待');
            }
            if($find->status == 1){
                $this->error('该地点已经存在啦，您可直接选择使用');
            }
        }
        // 建立
        $find = (new Community())->allowField(true)->save($param);
        if($find){
            // 给管理员发一条信息，请求审核
            \YangChengEasyComposer\Utils\Request::send_request('https://www.wangyunzhi.cn/api/wechat/send_approve_information_template',[
                'title' => '建点申请：'.$param['name'],
                'signKey' => '154fmj755s7fs78c478aa7',
            ]);
            $this->success('申请成功，请耐心等待审核',[
                'tmplIds' => [Config::get('site.miniSubMsg_community_approve')]
            ]);
        }
        $this->error('网络异常');
    }

    /**
     * 每日重置频繁类短信接收上限（GET传入UserId则指定重置）
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function reset_user_sms_upper_limit(){
        $init_num = Config::get('site.user_sms_upper_limit');
        $userId = $this->request->get('uid');
        if(empty($userId)){
            $userSelect = \app\common\model\User::where('sms_upper_limit','<',$init_num)->select();
        }else{
            $userSelect = \app\common\model\User::where('sms_upper_limit','<',$init_num)->where('id',$userId)->select();
        }
        foreach ($userSelect as $item){
            $item->sms_upper_limit = $init_num;
            $item->save();
        }
        $this->success('重置成功');
    }
}
