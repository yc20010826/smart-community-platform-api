<?php

namespace app\common\model;

use think\Model;


class Banner extends Model
{
    // 表名
    protected $name = 'banner';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';

    // 定义时间戳字段名
    protected $createTime = 'createtime';
    protected $updateTime = false;
    protected $deleteTime = false;

    // 追加属性
    protected $append = [
        'jump_type_text',
        'status_text'
    ];
    

    protected static function init()
    {
        self::afterInsert(function ($row) {
            $pk = $row->getPk();
            $row->getQuery()->where($pk, $row[$pk])->update(['weigh' => $row[$pk]]);
        });
    }

    
    public function getJumpTypeList()
    {
        return ['0' => __('Jump_type 0'), '1' => __('Jump_type 1'), '2' => __('Jump_type 2')];
    }

    public function getStatusList()
    {
        return ['0' => __('Status 0'), '1' => __('Status 1')];
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




    public function community()
    {
        return $this->belongsTo('Community', 'community_id', 'id', [], 'LEFT')->setEagerlyType(0);
    }
}
