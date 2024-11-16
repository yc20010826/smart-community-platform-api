<?php

namespace app\common\model;

use think\Model;


class Message extends Model
{

    // 表名
    protected $name = 'message';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';

    // 定义时间戳字段名
    protected $createTime = 'createtime';
    protected $updateTime = false;
    protected $deleteTime = false;

    // 追加属性
    protected $append = [
        'type_text',
        'jump_type_text',
        'status_text',
        'readtime_text'
    ];
    

    
    public function getTypeList()
    {
        return ['1' => __('Type 1'), '2' => __('Type 2'), '3' => __('Type 3'), '0' => __('Type 0')];
    }

    public function getJumpTypeList()
    {
        return ['0' => __('Jump_type 0'), '1' => __('Jump_type 1'), '2' => __('Jump_type 2')];
    }

    public function getStatusList()
    {
        return ['0' => __('Status 0'), '1' => __('Status 1'), '2' => __('Status 2')];
    }


    public function getTypeTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['type']) ? $data['type'] : '');
        $list = $this->getTypeList();
        return isset($list[$value]) ? $list[$value] : '';
    }


    public function getJumpTypeTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['jump_type']) ? $data['jump_type'] : '');
        $list = $this->getJumpTypeList();
        return isset($list[$value]) ? $list[$value] : '';
    }


    public function getStatusTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['status']) ? $data['status'] : '');
        $list = $this->getStatusList();
        return isset($list[$value]) ? $list[$value] : '';
    }


    public function getReadtimeTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['readtime']) ? $data['readtime'] : '');
        return is_numeric($value) ? date("Y-m-d H:i:s", $value) : $value;
    }

    protected function setReadtimeAttr($value)
    {
        return $value === '' ? null : ($value && !is_numeric($value) ? strtotime($value) : $value);
    }


    public function user()
    {
        return $this->belongsTo('User', 'receive_user', 'id', [], 'LEFT')->setEagerlyType(0);
    }

    /**
     * 评论留言通知
     * @param $user_id
     * @param $info_id
     * @return bool
     */
    public static function send_comment_msg($user_id, $info_id){
        $info = Information::get($info_id);
        self::create([
           'type' => 3,
           'receive_user' => $user_id,
           'title' => $info['title'],
           'content' => '您的内容收到了新评论，快快点击查看~',
           'jump_type' => 1,
           'jump_url' => '/pages/information/information?information_id='.$info_id,
        ]);
        return true;
    }

}
