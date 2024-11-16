<?php
namespace app\api\controller;

use app\common\controller\Api;
use think\Config;
use YangChengEasyComposer\WechatWork\App\WechatCustomerService\Entrance as WechatCustomerServiceEntrance;
use think\Log;

class WechatWork extends Api
{
    protected $noNeedLogin = ['WechatCustomerServiceApi'];
    protected $noNeedRight = '*';

    /**
     * 微信客服应用回调地址
     * @return false|string
     */
    public function WechatCustomerServiceApi(){
        $config = [
            'token' => Config::get('site.qy_wechat_app1_token'),
            'encodingAesKey' => Config::get('site.qy_wechat_app1_encodingAESKey'),
            'corpid' => Config::get('site.qy_wechat_corpid'),
            'corpSecret' => Config::get('site.qy_wechat_app1_secret'),
        ];
        $WechatCustomerServiceClass = new WechatCustomerServiceEntrance($config);
        if($this->request->isGet()){
            // 验证域名
            $param = $this->request->get();
            try {
                $result = $WechatCustomerServiceClass->decryptUrl($param['msg_signature'], $param['timestamp'], $param['nonce'], $param['echostr']);
                return $result;
            }catch (\Exception $e){
                $this->error('数据异常:'.$e->getMessage());
            }
        }else{
            return 'success';
        }
        $this->success('API正常');
    }

    /**
     * 获取客服链接
     * @throws \think\Exception
     */
    public function GetCustomerServiceUrl(){
        $config = [
            'token' => Config::get('site.qy_wechat_app1_token'),
            'encodingAesKey' => Config::get('site.qy_wechat_app1_encodingAESKey'),
            'corpid' => Config::get('site.qy_wechat_corpid'),
            'corpSecret' => Config::get('site.qy_wechat_app1_secret'),
        ];
        $WechatCustomerServiceClass = new WechatCustomerServiceEntrance($config);
        // 获取客服列表
        $kf_list = $WechatCustomerServiceClass->list_contact_way();
        if(empty($kf_list)){
            $this->error('暂无客服在线哟');
        }
        $open_kfid = $kf_list[0]['open_kfid'];
        if(empty($open_kfid)){
            $this->error('暂无客服在线哟~');
        }
        $resUrl = $WechatCustomerServiceClass->add_contact_way($open_kfid);
        $this->success('获取成功',[
            'extInfo'=>[
                'url'=>$resUrl
            ],
            'corpId'=>Config::get('site.qy_wechat_corpid')
        ]);
    }

}