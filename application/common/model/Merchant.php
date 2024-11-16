<?php

namespace app\common\model;

use think\Model;


class Merchant extends Model
{

    

    

    // 表名
    protected $name = 'merchant';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = true;

    // 定义时间戳字段名
    protected $createTime = 'createtime';
    protected $updateTime = false;
    protected $deleteTime = false;

    // 追加属性
    protected $append = [
        'is_business_text',
        'distribution_mode_text',
        'status_text'
    ];
    

    
    public function getIsBusinessList()
    {
        return ['1' => __('Is_business 1'), '2' => __('Is_business 2')];
    }

    public function getDistributionModeList()
    {
        return ['1' => __('Distribution_mode 1'), '2' => __('Distribution_mode 2'), '3' => __('Distribution_mode 3')];
    }

    public function getStatusList()
    {
        return ['0' => __('Status 0'), '1' => __('Status 1'), '2' => __('Status 2'), '3' => __('Status 3')];
    }


    public function getIsBusinessTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['is_business']) ? $data['is_business'] : '');
        $list = $this->getIsBusinessList();
        return isset($list[$value]) ? $list[$value] : '';
    }


    public function getDistributionModeTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['distribution_mode']) ? $data['distribution_mode'] : '');
        $list = $this->getDistributionModeList();
        return isset($list[$value]) ? $list[$value] : '';
    }


    public function getStatusTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['status']) ? $data['status'] : '');
        $list = $this->getStatusList();
        return isset($list[$value]) ? $list[$value] : '';
    }

    public function category()
    {
        return $this->belongsTo('Category', 'category_id', 'id', [], 'LEFT')->setEagerlyType(0);
    }

    public function user()
    {
        return $this->belongsTo('User', 'user_id', 'id', [], 'LEFT')->setEagerlyType(0);
    }
}
