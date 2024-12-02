<?php

namespace app\api\controller;

use app\common\controller\Api;
use app\common\controller\BaiduAi;
use app\common\library\Ems;
use app\common\library\Sms;
use app\common\model\Community;
use app\common\model\Message;
use fast\Random;
use think\Config;
use think\Db;
use think\Exception;
use think\Validate;
use YangChengEasyComposer\Wechat\WehatMini;

/**
 * 会员接口
 */
class User extends Api
{
    protected $noNeedLogin = ['getUserInfo', 'miniWeChatLogin', 'miniBindMobile', 'login', 'mobilelogin', 'register', 'resetpwd', 'changeemail', 'changemobile', 'third'];
    protected $noNeedRight = '*';

    public function _initialize()
    {
        parent::_initialize();

        if (!Config::get('fastadmin.usercenter')) {
            $this->error(__('User center already closed'));
        }

    }

    /**
     * 获取最新未读数量
     * @return void
     * @throws Exception
     */
    public function get_un_read_msg_num(){
        $class_num = [0,0,0,0];
        $num = Message::where('receive_user',$this->auth->id)->where('status','=','0')->count();
        $class_num[0] = Message::where('receive_user',$this->auth->id)->where('status','=','0')->where('type', '0')->count();
        $class_num[1] = Message::where('receive_user',$this->auth->id)->where('status','=','0')->where('type', '1')->count();
        $class_num[2] = Message::where('receive_user',$this->auth->id)->where('status','=','0')->where('type', '2')->count();
        $class_num[3] = Message::where('receive_user',$this->auth->id)->where('status','=','0')->where('type', '3')->count();
        $this->success('获取成功',[
            'un_count' => (String)$num,
            'class_num' => $class_num,
        ]);
    }

    /**
     * 绑定小区
     * @param string $bind_bind_community_id
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function bind_community($bind_bind_community_id=''){
        if(empty($bind_bind_community_id)){
            $this->error('请先选择小区');
        }
        $community = Community::get($bind_bind_community_id);
        if(!$community || $community->status != 1){
            $this->error('所选小区暂未开放');
        }
        $data = \app\common\model\User::where('id',$this->auth->id)->find();
        $data->community_id = $bind_bind_community_id;
        $data->save();
        $this->success('绑定成功');
    }

    /**
     * 获取用户信息
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getUserInfo(){
        $data = \app\common\model\User::where('id',$this->auth->id)->find();
        if($data['community_id']){
            $data['community_name'] = Community::where('id',$data['community_id'])->cache(180)->value('name');
        }
        unset($data['password']);
        unset($data['salt']);
        $this->success('获取成功',$data);
    }

    /**
     * 更新资料
     * @param $avatarUrl
     * @param $nickname
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function updateUserFile($avatarUrl,$nickname){
        $user = \app\common\model\User::where('id',$this->auth->id)->find();
        if(empty($user->nickname)){
            $user->level++;
            $user->score+= 100;
        }
        $user->avatar = $avatarUrl;
        $user->nickname = $nickname;
        $user->save();
        $this->success('更新成功');
    }

    /**
     * 微信小程序登录
     * @throws Exception
     */
    public function miniWeChatLogin(){
        $code = $this->request->post('loginCode');
        $community_id = $this->request->post('community_id');
        if(empty($code)){
            $this->error('授权失败，请重试');
        }
        Db::startTrans();
        try {
            $weChatMiniClass = new WehatMini(['appid'=>Config::get('site.miniapp_appid'),'secret'=>Config::get('site.miniapp_secret')]);
            $wechatUser = $weChatMiniClass->getUserOpenId($code);
            // 判断openid是否存在于数据库
            $thisUser = \app\common\model\User::where('mini_openid',$wechatUser['openid'])->find();
            if(!$thisUser){
                // 需要注册
                $salt = Random::alnum();
                $thisUser = new \app\common\model\User();
                $thisUser->community_id = $community_id;
                $thisUser->group_id = 1;
                $thisUser->username = $wechatUser['openid'];
                $thisUser->nickname = '';
                $thisUser->password = \app\common\library\Auth::instance()->getEncryptPassword(123456, $salt);
                $thisUser->salt = $salt;
                $thisUser->mobile = '';
                $thisUser->status = 'normal';
                $thisUser->jointime = time();
                $thisUser->mini_openid = $wechatUser['openid'];
                $thisUser->save();
            }
            // 判断如果没有默认小区则设置当前小区为默认
            if(empty($thisUser->community_id)){
                $thisUser->community_id = $community_id;
                $thisUser->save();
            }
            $thisUser->mini_session_key = $wechatUser['session_key'];
            $thisUser->save();
            Db::commit();
        } catch (Exception $e) {
            Db::rollback();
            $this->error($e->getMessage(),[],$e->getCode());
        }
        if($thisUser->status == 'hidden'){
            $this->error('您的账号违反相关规定，已被系统封禁，请联系客服处理');
        }
        $this->auth->direct($thisUser->id);
        $token = $this->auth->getToken();
        $thisUser = $thisUser->toArray();
        unset($thisUser['password']);
        unset($thisUser['salt']);
        $this->success('登录成功',[
            'token' => $token,
            'user_id' => $thisUser['id'],
            'userInfo' => $thisUser
        ]);
    }

    /**
     * 微信小程序绑定手机号
     * @throws Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function miniBindMobile(){
        $user_id = $this->request->post('user_id');
        if(!$user_id){
            $user_id = $this->auth->id;
        }
        $encryptedData = $this->request->post('encryptedData');
        $iv = $this->request->post('iv');
        $thisUser = \app\common\model\User::where('id',$user_id)->find();
        if(!$thisUser || empty($thisUser->mini_session_key)){
            $this->error('登录态失效，请重新登录',[],403);
        }
        try {
            $weChatMiniClass = new WehatMini(['appid'=>Config::get('site.miniapp_appid'),'secret'=>Config::get('site.miniapp_secret')]);
            $userData = $weChatMiniClass->dataDecryption($thisUser->mini_session_key, $encryptedData, $iv);
            if(\app\common\model\User::where('username|mobile', $userData['phoneNumber'])->value('id')){
                throw new Exception('该手机号已绑定其他账号，请更换其他手机号！',400);
            }
            $thisUser->username = $userData['phoneNumber'];
            $thisUser->mobile = $userData['phoneNumber'];
            $thisUser->save();
        } catch (Exception $e) {
            if($e->getCode() == 41001){
                $this->error('登录态失效，请重新登录',[],403);
            }
            $this->error('网络异常:'.$e->getMessage());
        }
        $this->success('绑定成功');
    }


    /**
     * 会员中心
     */
    public function index()
    {
        $this->success('', ['welcome' => $this->auth->nickname]);
    }

    /**
     * 会员登录
     *
     * @ApiMethod (POST)
     * @param string $account  账号
     * @param string $password 密码
     */
    public function login()
    {
        $account = $this->request->post('account');
        $password = $this->request->post('password');
        if (!$account || !$password) {
            $this->error(__('Invalid parameters'));
        }
        $ret = $this->auth->login($account, $password);
        if ($ret) {
            $thisUser = \app\common\model\User::where('id',$this->auth->id)->find();
            $token = $this->auth->getToken();
            $thisUser = $thisUser->toArray();
            unset($thisUser['password']);
            unset($thisUser['salt']);
            $this->success('登录成功',[
                'token' => $token,
                'user_id' => $thisUser['id'],
                'userInfo' => $thisUser
            ]);
        } else {
            $this->error($this->auth->getError());
        }
    }

    /**
     * 手机验证码登录
     *
     * @ApiMethod (POST)
     * @param string $mobile  手机号
     * @param string $captcha 验证码
     */
    public function mobilelogin()
    {
        $mobile = $this->request->post('mobile');
        $captcha = $this->request->post('captcha');
        if (!$mobile || !$captcha) {
            $this->error(__('Invalid parameters'));
        }
        if (!Validate::regex($mobile, "^1\d{10}$")) {
            $this->error(__('Mobile is incorrect'));
        }
        if (!Sms::check($mobile, $captcha, 'mobilelogin')) {
            $this->error(__('Captcha is incorrect'));
        }
        $user = \app\common\model\User::getByMobile($mobile);
        if ($user) {
            if ($user->status != 'normal') {
                $this->error(__('Account is locked'));
            }
            //如果已经有账号则直接登录
            $ret = $this->auth->direct($user->id);
        } else {
            $ret = $this->auth->register($mobile, Random::alnum(), '', $mobile, []);
        }
        if ($ret) {
            Sms::flush($mobile, 'mobilelogin');
            $data = ['userinfo' => $this->auth->getUserinfo()];
            $this->success(__('Logged in successful'), $data);
        } else {
            $this->error($this->auth->getError());
        }
    }

    /**
     * 注册会员
     *
     * @ApiMethod (POST)
     * @param string $username 用户名
     * @param string $password 密码
     * @param string $email    邮箱
     * @param string $mobile   手机号
     * @param string $code     验证码
     */
    public function register()
    {
        $username = $this->request->post('username');
        $password = $this->request->post('password');
        $email = $this->request->post('email');
        $mobile = $this->request->post('mobile');
        $code = $this->request->post('code');
        if (!$username || !$password) {
            $this->error(__('Invalid parameters'));
        }
        if ($email && !Validate::is($email, "email")) {
            $this->error(__('Email is incorrect'));
        }
        if ($mobile && !Validate::regex($mobile, "^1\d{10}$")) {
            $this->error(__('Mobile is incorrect'));
        }
        $ret = Sms::check($mobile, $code, 'register');
        if (!$ret) {
            $this->error(__('Captcha is incorrect'));
        }
        $ret = $this->auth->register($username, $password, $email, $mobile, []);
        if ($ret) {
            $data = ['userinfo' => $this->auth->getUserinfo()];
            $this->success(__('Sign up successful'), $data);
        } else {
            $this->error($this->auth->getError());
        }
    }

    /**
     * 退出登录
     * @ApiMethod (POST)
     */
    public function logout()
    {
        if (!$this->request->isPost()) {
            $this->error(__('Invalid parameters'));
        }
        $this->auth->logout();
        $this->success(__('Logout successful'));
    }

    /**
     * 修改会员个人信息
     *
     * @ApiMethod (POST)
     * @param string $avatar   头像地址
     * @param string $username 用户名
     * @param string $nickname 昵称
     * @param string $bio      个人简介
     */
    public function profile()
    {
        $user = $this->auth->getUser();
        $username = $this->request->post('username');
        $nickname = $this->request->post('nickname');
        $bio = $this->request->post('bio');
        $avatar = $this->request->post('avatar', '', 'trim,strip_tags,htmlspecialchars');
        if ($username) {
            $exists = \app\common\model\User::where('username', $username)->where('id', '<>', $this->auth->id)->find();
            if ($exists) {
                $this->error(__('Username already exists'));
            }
            $user->username = $username;
        }
        if ($nickname) {
            $exists = \app\common\model\User::where('nickname', $nickname)->where('id', '<>', $this->auth->id)->find();
            if ($exists) {
                $this->error(__('Nickname already exists'));
            }
            $user->nickname = $nickname;
        }
        $user->bio = $bio;
        $user->avatar = $avatar;
        $user->save();
        $this->success();
    }

    /**
     * 修改邮箱
     *
     * @ApiMethod (POST)
     * @param string $email   邮箱
     * @param string $captcha 验证码
     */
    public function changeemail()
    {
        $user = $this->auth->getUser();
        $email = $this->request->post('email');
        $captcha = $this->request->post('captcha');
        if (!$email || !$captcha) {
            $this->error(__('Invalid parameters'));
        }
        if (!Validate::is($email, "email")) {
            $this->error(__('Email is incorrect'));
        }
        if (\app\common\model\User::where('email', $email)->where('id', '<>', $user->id)->find()) {
            $this->error(__('Email already exists'));
        }
        $result = Ems::check($email, $captcha, 'changeemail');
        if (!$result) {
            $this->error(__('Captcha is incorrect'));
        }
        $verification = $user->verification;
        $verification->email = 1;
        $user->verification = $verification;
        $user->email = $email;
        $user->save();

        Ems::flush($email, 'changeemail');
        $this->success();
    }

    /**
     * 修改手机号
     *
     * @ApiMethod (POST)
     * @param string $mobile  手机号
     * @param string $captcha 验证码
     */
    public function changemobile()
    {
        $user = $this->auth->getUser();
        $mobile = $this->request->post('mobile');
        $captcha = $this->request->post('captcha');
        if (!$mobile || !$captcha) {
            $this->error(__('Invalid parameters'));
        }
        if (!Validate::regex($mobile, "^1\d{10}$")) {
            $this->error(__('Mobile is incorrect'));
        }
        if (\app\common\model\User::where('mobile', $mobile)->where('id', '<>', $user->id)->find()) {
            $this->error(__('Mobile already exists'));
        }
        $result = Sms::check($mobile, $captcha, 'changemobile');
        if (!$result) {
            $this->error(__('Captcha is incorrect'));
        }
        $verification = $user->verification;
        $verification->mobile = 1;
        $user->verification = $verification;
        $user->mobile = $mobile;
        $user->save();

        Sms::flush($mobile, 'changemobile');
        $this->success();
    }

    /**
     * 第三方登录
     *
     * @ApiMethod (POST)
     * @param string $platform 平台名称
     * @param string $code     Code码
     */
    public function third()
    {
        $url = url('user/index');
        $platform = $this->request->post("platform");
        $code = $this->request->post("code");
        $config = get_addon_config('third');
        if (!$config || !isset($config[$platform])) {
            $this->error(__('Invalid parameters'));
        }
        $app = new \addons\third\library\Application($config);
        //通过code换access_token和绑定会员
        $result = $app->{$platform}->getUserInfo(['code' => $code]);
        if ($result) {
            $loginret = \addons\third\library\Service::connect($platform, $result);
            if ($loginret) {
                $data = [
                    'userinfo'  => $this->auth->getUserinfo(),
                    'thirdinfo' => $result
                ];
                $this->success(__('Logged in successful'), $data);
            }
        }
        $this->error(__('Operation failed'), $url);
    }

    /**
     * 重置密码
     *
     * @ApiMethod (POST)
     * @param string $mobile      手机号
     * @param string $newpassword 新密码
     * @param string $captcha     验证码
     */
    public function resetpwd()
    {
        $type = $this->request->post("type");
        $mobile = $this->request->post("mobile");
        $email = $this->request->post("email");
        $newpassword = $this->request->post("newpassword");
        $captcha = $this->request->post("captcha");
        if (!$newpassword || !$captcha) {
            $this->error(__('Invalid parameters'));
        }
        //验证Token
        if (!Validate::make()->check(['newpassword' => $newpassword], ['newpassword' => 'require|regex:\S{6,30}'])) {
            $this->error(__('Password must be 6 to 30 characters'));
        }
        if ($type == 'mobile') {
            if (!Validate::regex($mobile, "^1\d{10}$")) {
                $this->error(__('Mobile is incorrect'));
            }
            $user = \app\common\model\User::getByMobile($mobile);
            if (!$user) {
                $this->error(__('User not found'));
            }
            $ret = Sms::check($mobile, $captcha, 'resetpwd');
            if (!$ret) {
                $this->error(__('Captcha is incorrect'));
            }
            Sms::flush($mobile, 'resetpwd');
        } else {
            if (!Validate::is($email, "email")) {
                $this->error(__('Email is incorrect'));
            }
            $user = \app\common\model\User::getByEmail($email);
            if (!$user) {
                $this->error(__('User not found'));
            }
            $ret = Ems::check($email, $captcha, 'resetpwd');
            if (!$ret) {
                $this->error(__('Captcha is incorrect'));
            }
            Ems::flush($email, 'resetpwd');
        }
        //模拟一次登录
        $this->auth->direct($user->id);
        $ret = $this->auth->changepwd($newpassword, '', true);
        if ($ret) {
            $this->success(__('Reset password successful'));
        } else {
            $this->error($this->auth->getError());
        }
    }


    /**
     * 设置个人信息
     * @return void
     */
    public function setUserInfo()
    {
        $data = $this->request->only(['nickname', 'avatar', 'gender', 'birthday','is_sms_consume', 'is_sms_money', 'is_sms_active']);
//        $data['is_sms_consume'] = (int)$data['is_sms_consume'];
//        $data['is_sms_money'] = (int)$data['is_sms_money'];
//        $data['is_sms_active'] = (int)$data['is_sms_active'];
        $user = $this->auth->getUser();
        if(empty($data['nickname'])){
            $this->error('昵称不能为空');
        }
        $data['nickname'] = htmlspecialchars($data['nickname']);
        $baiduAiClass = new BaiduAi();
        $checkResult = $baiduAiClass->check_text($data['nickname']);
        if($checkResult['code'] == 2){
            $this->error('昵称审核不通过：'.$checkResult['msg']);
        }
        if(empty($data['birthday'])){
            $data['birthday'] = null;
        }
        if(!empty($user['birthday']) && $user['birthday'] != $data['birthday']){
            unset($data['birthday']);
            $user->save($data);
            $this->success('生日设置失败, 只能设置一次, 您已经设置过了');
        }
        $user->save($data);
        $this->success('设置成功');
    }

}
