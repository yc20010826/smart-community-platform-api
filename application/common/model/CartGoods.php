<?php

namespace app\common\model;

use think\Model;


class CartGoods extends Model
{

    

    

    // 表名
    protected $name = 'cart_goods';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';

    // 定义时间戳字段名
    protected $createTime = 'createtime';
    protected $updateTime = false;
    protected $deleteTime = false;

    // 追加属性
    protected $append = [

    ];
    

    







    public function goods()
    {
        return $this->belongsTo('Goods', 'goods_id', 'id', [], 'LEFT')->setEagerlyType(0);
    }


    public function cart()
    {
        return $this->belongsTo('Cart', 'cart_id', 'id', [], 'LEFT')->setEagerlyType(0);
    }
}
