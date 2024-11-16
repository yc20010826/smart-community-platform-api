<?php

namespace app\common\controller;

use AlibabaCloud\Client\AlibabaCloud;
use AlibabaCloud\Client\Exception\ClientException;
use AlibabaCloud\Client\Exception\ServerException;
use AlibabaCloud\Dysmsapi\Dysmsapi;
use think\Cache;
use think\Config;
use think\Log;
use think\Request;

class AliSms
{
    /**
     * 发送审核短信
     * @param string $phone 用户手机号
     * @param integer $type 审核通过=1，其他为失败
     * @param string $msg 失败原因
     * @return false|void
     * @throws ClientException
     */
    public static function send_information_approve($phone, $type, $msg=''){
        AlibabaCloud::accessKeyClient(Config::get('site.alioss_sms_accessKeyId'), Config::get('site.alioss_sms_accessKeySecret'))
            ->regionId(Config::get('site.alioss_sms_city_value'))
            ->asDefaultClient();
        try {
            $request = Dysmsapi::v20170525()->sendSms();
            if($type == 1){
                // 审核通过
                $request
                    ->withPhoneNumbers($phone)
                    ->withTemplateCode("SMS_240376552")
                    ->withSignName("渝快同城")
                    ->debug(false)
                    ->connectTimeout(1)
                    ->timeout(1)
                    ->request();
            }else{
                $request
                    ->withPhoneNumbers($phone)
                    ->withTemplateCode("SMS_240381538")
                    ->withSignName("渝快同城")
                    ->withTemplateParam(json_encode([
                        'content' => $msg
                    ]))
                    ->debug(false)
                    ->connectTimeout(1)
                    ->timeout(1)
                    ->request();
            }
        } catch (ClientException $e) {
            return false;
        } catch (ServerException $e) {
            return false;
        }
    }

    /**
     * 发送小区审核短信
     * @param string $phone 用户手机号
     * @param integer $type 审核通过=1，其他为失败
     * @param string $msg 失败原因
     * @return false|void
     * @throws ClientException
     */
    public static function send_community_approve($phone, $type, $msg=''){
        AlibabaCloud::accessKeyClient(Config::get('site.alioss_sms_accessKeyId'), Config::get('site.alioss_sms_accessKeySecret'))
            ->regionId(Config::get('site.alioss_sms_city_value'))
            ->asDefaultClient();
        try {
            $request = Dysmsapi::v20170525()->sendSms();
            if($type == 1){
                // 审核通过
                $request
                    ->withPhoneNumbers($phone)
                    ->withTemplateCode("SMS_240381563")
                    ->withSignName("渝快同城")
                    ->debug(false)
                    ->connectTimeout(1)
                    ->timeout(1)
                    ->request();
            }
        } catch (ClientException $e) {
            return false;
        } catch (ServerException $e) {
            return false;
        }
    }

    /**
     * 发送收到评论通知
     * @param string $phone 用户手机号
     * @return false|void
     * @throws ClientException
     */
    public static function send_information_received_comment($phone){
        AlibabaCloud::accessKeyClient(Config::get('site.alioss_sms_accessKeyId'), Config::get('site.alioss_sms_accessKeySecret'))
            ->regionId(Config::get('site.alioss_sms_city_value'))
            ->asDefaultClient();
        try {
            $request = Dysmsapi::v20170525()->sendSms();
            $request
                ->withPhoneNumbers($phone)
                ->withTemplateCode("SMS_241348436")
                ->withSignName("渝快同城")
                ->debug(false)
                ->connectTimeout(1)
                ->timeout(1)
                ->request();
        } catch (ClientException $e) {
            return false;
        } catch (ServerException $e) {
            return false;
        }
    }
}