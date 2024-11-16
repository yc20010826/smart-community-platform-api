<?php

namespace app\common\controller;

use think\Cache;
use think\Config;
use think\Log;
use think\Request;

class BaiduAi
{
    protected $access_token = null;

    public function __construct(Request $request = null)
    {
        $this->access_token = $this->get_token();
    }

    /**
     * 发起一个请求
     * @param $url
     * @param $params
     * @param string $method
     * @param array $header
     * @param false $multi
     * @return bool|string
     */
    protected function http($url, $params, $method = 'GET', $header = array(), $multi = false){
        $opts = array(
            CURLOPT_TIMEOUT        => 30,
            CURLOPT_RETURNTRANSFER => 1,
            CURLOPT_SSL_VERIFYPEER => false,
            CURLOPT_SSL_VERIFYHOST => false,
            CURLOPT_HTTPHEADER     => $header
        );
        switch(strtoupper($method)){
            case 'GET':
                $opts[CURLOPT_URL] = $url . '?' . http_build_query($params);
                break;
            case 'POST':
                $params = $multi ? $params : http_build_query($params);
                $opts[CURLOPT_URL] = $url;
                $opts[CURLOPT_POST] = 1;
                $opts[CURLOPT_POSTFIELDS] = $params;
                break;
            default:
                return false;
        }
        $ch = curl_init();
        curl_setopt_array($ch, $opts);
        $data  = curl_exec($ch);
        $error = curl_error($ch);
        curl_close($ch);
        if ($error){
            return false;
        }
        return  $data;
    }


    /**
     * 获取access_token
     * @return mixed
     * @throws \think\Exception
     */
    public function get_token(){
        if(Cache::get('baidu_ai_access_token')){
            return Cache::get('baidu_ai_access_token');
        }
        $url = 'https://aip.baidubce.com/oauth/2.0/token';
        // 参数
        $request_pram = [
            'grant_type' => 'client_credentials',
            'client_id' => Config::get('site.baidu_ai_appKey'),
            'client_secret' => Config::get('site.baidu_ai_secretKey'),
        ];
        $result = $this->http($url, $request_pram,'POST',array());
        $result = json_decode($result,true);
        if (!isset($result['access_token'])){
            throw new \think\Exception($result['error_description']);
        }
        Cache::set('baidu_ai_access_token',$result['access_token'],2591000);
        return $result['access_token'];
    }

    /**
     * 检测文本是否合规
     * @param string $text
     * @return array
     * @throws \think\Exception
     */
    public function check_text($text=''){
        $url = 'https://aip.baidubce.com/rest/2.0/solution/v1/text_censor/v2/user_defined?access_token='.$this->access_token;
        // 参数
        $request_pram = [
            'text' => $text,
        ];
        $result = \YangChengEasyComposer\Utils\Request::send_request($url, $request_pram,'POST');
        if (!isset($result['conclusionType'])){
            throw new \think\Exception($result['error_msg']);
        }
        $data = [
            'code' => 0,
            'msg' => '未检出异常'
        ];
        switch ($result['conclusionType']){
            case 1:
                $data = [
                    'code' => 1,
                    'msg' => ''
                ];
                break;
            case 2:
                $data['code'] = 2;
                if(!empty($result['data'])){
                    $data['msg'] = $result['data'][0]['msg'];
                }
                break;
            default:
                $data['code'] = 3;
                if(!empty($result['data'])){
                    $data['msg'] = $result['data'][0]['msg'].'，需要送审';
                }
                break;
        }
        return $data;
    }
}