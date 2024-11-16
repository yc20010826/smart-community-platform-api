<?php


namespace app\api\controller;


use AlibabaCloud\Client\AlibabaCloud;
use AlibabaCloud\Client\Exception\ClientException;
use AlibabaCloud\Client\Exception\ServerException;
use AlibabaCloud\Sts\Sts;
use app\common\controller\Api;
use think\Cache;
use think\Config;
use think\Request;

class AliOss extends Api
{
    protected $noNeedLogin = '*';
    protected $noNeedRight = '*';

    protected $region = null;
    protected $accessKeyId = null;
    protected $accessKeySecret = null;
    protected $bucket = null;
    protected $city_value = null;

    protected $roleArn;//指定角色的 ARN ，角色策略权限
    protected $roleSessionName = 'api_alioss';//用户自定义参数。此参数用来区分不同的 token，可用于用户级别的访问审计。格式：^[a-zA-Z0-9\.@\-_]+$
    protected $durationSeconds = '1800';//指定的过期时间
    protected $us;

    public function __construct(Request $request = null)
    {
        $this->region = Config::get('site.alioss_region');
        $this->accessKeyId = Config::get('site.alioss_accessKeyId');
        $this->accessKeySecret = Config::get('site.alioss_accessKeySecret');
        $this->bucket = Config::get('site.alioss_bucket');
        $this->city_value = Config::get('site.alioss_city_value');
        $this->roleArn = Config::get('site.alioss_roleArn');

        parent::__construct($request);
    }

    /**
     * 获取临时调用凭证
     * @throws ClientException
     */
    public function getStsToken(){
        $SecurityToken = '';
        if(Cache::get('stsToken')){
            $SecurityToken = Cache::get('stsToken');
            return $SecurityToken;
        }
        AlibabaCloud::accessKeyClient($this->accessKeyId, $this->accessKeySecret)->regionId($this->city_value)->asDefaultClient();
        try {
            $request = Sts::v20150401()->assumeRole();
            $result = $request
                ->withRoleArn($this->roleArn)
                ->withRoleSessionName($this->roleSessionName)
                ->debug(false)
                ->connectTimeout(1)
                ->timeout(1)
                ->request();
            $data = $result->toArray();
            $SecurityToken = $data['Credentials']['SecurityToken'];
            Cache::set('stsToken',$SecurityToken,2700);
            return $SecurityToken;
        } catch (ClientException $e) {
            return $SecurityToken;
        } catch (ServerException $e) {
            return $SecurityToken;
        }
    }

    /**
     * 获取OSS上传凭证
     * @throws ClientException
     */
    public function getUploadConfig(){
        $data = [
            'region' => $this->region,
            'accessKeyId' => $this->accessKeyId,
            'accessKeySecret' => $this->accessKeySecret,
            'stsToken' => $this->getStsToken(),
            'bucket' => $this->bucket,
        ];
        $this->success('获取成功',$data);
    }
}