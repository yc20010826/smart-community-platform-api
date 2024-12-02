<?php

namespace app\api\controller;

use app\common\controller\Api;
use think\Log;

class Chat extends Api
{
    protected $noNeedRight = ['*'];

    protected static $imBaseUrl = 'https://im.ipv4net.com'; // IM地址
    protected static $APP_ID = '511622103457661001'; // 应用ID
    protected static $APP_SECRET = 'jioshdfuhhfh2514sgda'; // 应用密钥

    /**
     * POST请求
     * @param $url
     * @param $params
     * @return mixed
     */
    public static function API_POST($url, $params)
    {
        // 先创建IM账户
        $sign = md5(self::$APP_ID.time().self::$APP_SECRET);
        $header=[
            'Content-Type:application/json',
            'X-Im-AppId:'.self::$APP_ID,
            'X-Im-Sign:'.$sign,
            'X-Im-TimeStamp:'.time(),
        ];
        $url = self::$imBaseUrl.$url;
        $ch = curl_init ();
        curl_setopt ( $ch, CURLOPT_URL, $url );
        curl_setopt ( $ch, CURLOPT_RETURNTRANSFER, 1 );
        curl_setopt ( $ch, CURLOPT_CUSTOMREQUEST, 'POST' );
        curl_setopt ( $ch, CURLOPT_POSTFIELDS, json_encode($params) );
        curl_setopt ( $ch, CURLOPT_HTTPHEADER, $header );
        curl_setopt ( $ch, CURLOPT_TIMEOUT, 60 );
        $result = curl_exec ( $ch );
        curl_close ( $ch );
        return json_decode($result, true);
    }

    /**
     * 创建IM账户
     * @param $uid
     * @return false|mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function createUser($uid){
        try {
            $betUser = \app\common\model\User::where('id', $uid)->field('id, username, avatar, mobile, nickname, chat_open_id, chat_user_id')->find();
            $url = '/common/api/createUser';
            $params = [
                'account' => $betUser['mobile'],
                'realname' => $betUser['nickname'],
                'avatar' => $betUser['avatar'],
            ];
            $res = self::API_POST($url, $params);
            if ($res['code'] == 0) {
                $openId = $res['data']['open_id'];
                $chatUserId = $res['data']['user_id'];
                $betUser->chat_open_id = $openId;
                $betUser->chat_user_id = $chatUserId;
                $betUser->save();
            } else {
                Log::error('创建IM账户失败'.json_encode($res));
                return false;
            }
        }catch (\Exception $e){
            Log::error('创建IM账户失败'.$e->getMessage());
            return false;
        }
        return ['chatUserId'=>$chatUserId, 'openId'=>$openId];
    }

    /**
     * 登录IM账户
     * @param $uid
     * @param $is_mobile
     * @return false|mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function loginUser($uid, $is_mobile = true){
        try {
            $betUser = \app\common\model\User::where('id', $uid)->field('id, username, mobile, nickname, chat_open_id, chat_user_id')->find();
            $url = '/common/api/login';
            $params = [
                'account' => $betUser['mobile'],
                'open_id' => $betUser['chat_open_id'],
                'is_mobile' => $is_mobile?1:0,
            ];
            $res = self::API_POST($url, $params);
            if ($res['code'] == 0) {
                $login = $res['data'];
            } else {
                Log::error('登录IM账户失败'.json_encode($res).$betUser['mobile']);
                return false;
            }
        }catch (\Exception $e){
            Log::error('登录IM账户失败'.$e->getMessage());
            return false;
        }
        return $login;
    }

    /**
     * 建立好友
     * @param $chatUid
     * @param $chatToUid
     * @return bool
     */
    public static function createFriend($chatUid, $chatToUid)
    {
        try {
            $url = '/common/api/createFriend';
            $params = [
                'betUid' => $chatUid,
                'toUid' => $chatToUid,
            ];
            $res = self::API_POST($url, $params);
            if ($res['code'] != 0) {
                Log::error('建立沟通失败'.json_encode($res));
                return false;
            }
        }catch (\Exception $e){
            Log::error('建立沟通失败'.$e->getMessage());
            return false;
        }
        return true;
    }

    /**
     * 获取IM登录地址
     * @param $uid
     * @param $is_mobile
     * @param $infoId
     * @return void
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getChatUrl($uid, $is_mobile = true, $infoId = 0)
    {
        // 先判断是否具有IM账户
        $betUser = \app\common\model\User::where('id', $this->auth->id)->field('id, username, mobile, nickname, chat_open_id')->find();
        if (!$betUser) {
            $this->error('请先登录');
        }
        if (empty($betUser['nickname'])) {
            $this->error('您的昵称为空，请先设置昵称后尝试！',[],2);
        }
        if (empty($betUser['mobile'])) {
            $this->error('按照相关要求，您需要绑定手机号之后才能使用本功能，请前往个人中心绑定！',[],2);
        }
        if (!$betUser['chat_open_id']) {
            // 创建IM账户
            $rel = self::createUser($this->auth->id);
            $openId = $rel['openId'];
            if (!$openId) {
                $this->error('创建IM账户失败，请重试！');
            }
        }
        if(empty($uid)){
            // 登录IM,获取登录地址，没有目标，直到登录界面
            $login = self::loginUser($this->auth->id, $is_mobile);
            $loginUrl = $login['loginUrl'];
            $chatBetUid = $login['userId'];
            if (!$loginUrl) {
                $this->error('登录IM账户失败，请重试！ERR3');
            }
            $this->success('获取成功', ['loginUrl' => $loginUrl, 'chatUrl' => '']);
        }
        // 判断对方是否有账户
        $betUser2 = \app\common\model\User::where('id', $uid)->field('id, username, mobile, nickname, chat_open_id, chat_user_id')->find();
        if (!$betUser2) {
            $this->error('对方账户状态异常，暂时无法沟通！');
        }
        $chatToUid = $betUser2['chat_user_id'];
        if (empty($betUser2['chat_open_id'])) {
            if (empty($betUser2['mobile'])||empty($betUser2['nickname'])) {
                $this->error('对方信息不完善，无法在线沟通，建议您使用其他方式沟通！',[],2);
            }
            // 创建IM账户
            $rel = self::createUser($uid);
            $openId = $rel['openId'];
            $chatToUid = $rel['chatUserId'];
            if (!$openId) {
                $this->error('创建IM账户失败，请重试！ERR2');
            }
        }
        // 登录IM,获取登录地址
        $login = self::loginUser($this->auth->id, $is_mobile);
        $loginUrl = $login['loginUrl'];
        $chatBetUid = $login['userId'];

        if (!$loginUrl) {
            $this->error('登录IM账户失败，请重试！ERR3');
        }
        // 建立好友关系
        if (!self::createFriend($chatBetUid, $chatToUid)) {
            $this->error('建立沟通失败，请重试！ERR4');
        }
        // 拼接下一步链接
        $chatUrl = self::$imBaseUrl."/h5/#/pages/message/chat?id=" . $chatToUid;

        $this->success('获取成功', ['loginUrl' => $loginUrl, 'chatUrl' => $chatUrl]);
    }
}