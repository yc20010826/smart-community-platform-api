<?php

namespace app\common\model;

use app\common\model\cart\Goods;
use think\Model;


class Cart extends Model
{

    // 表名
    protected $name = 'cart';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';

    // 定义时间戳字段名
    protected $createTime = 'createtime';
    protected $updateTime = false;
    protected $deleteTime = false;

    // 追加属性
    protected $append = [

    ];


    /**
     * 新增商品到购物车
     * @param $goods_id
     * @param $user_id
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function addGoods($goods_id,$user_id){
        // 查询商品
        $goods = \app\common\model\Goods::getGoodsFind($goods_id);
        if(!$goods){
            throw new \think\Exception('商品无库存或不存在，请刷新再试~', 10001);
        }
        // 查询用户是否已经有购物车
        $cart = \app\common\model\Cart::where('user_id',$user_id)->find();
        if (!$cart){
            // 没有购物车，需要增加购物车
            $cart = new Cart();
            $cart->merchant_id = $goods['merchant_id'];
            $cart->user_id = $user_id;
            $cart->total_price = $goods['price'];
            $cart->total_num = 1;
            $cart->save();
        }else{
            $cart->total_price += $goods['price'];
            $cart->total_num ++;
            $cart->save();
        }
        // 判断这个商品是否已经在购物车下商品数据里面存在了
        $cart_goods = CartGoods::where('goods_id',$goods_id)->where('cart_id',$cart['id'])->find();
        if(!$cart_goods){
            $cart_goods = new CartGoods();
            $cart_goods->cart_id = $cart['id'];
            $cart_goods->goods_id = $goods_id;
            $cart_goods->num = 1;
            $cart_goods->subtotal = $goods['price'];
            $cart_goods->save();
        }else{
            $cart_goods->subtotal += $goods['price'];
            $cart_goods->num += 1;
            if($goods['stock']<$cart_goods->num){
                throw new \think\Exception('商品库存不足啦，不要加啦~', 10002);
            }
            $cart_goods->save();
        }

        return true;
    }


    /**
     * 删除购物车商品
     * @param $goods_id
     * @param $user_id
     * @param $is_all 是否商品删除
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function delGoods($goods_id,$user_id,$is_all=false){
        // 查询用户是否已经有购物车
        $cart = Cart::where('user_id',$user_id)->find();
        if (!$cart){
            return true;
        }
        // 删除一次该商品
        $cart_goods = CartGoods::where('goods_id',$goods_id)->where('cart_id',$cart['id'])->find();
        if($cart_goods){
            if($is_all){
                $cart_goods->delete();
                self::updateCart($cart['id']);
                return true;
            }
            if($cart_goods->num == 1){
                $cart_goods->delete();
            }else{
                $cart_goods->num--;
                $cart_goods->save();
            }
        }
        self::updateCart($cart['id']);
        return true;
    }

    /**
     * 更新购物车
     * @param $cart_id
     * @return bool
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function updateCart($cart_id){
        // 查询用户是否已经有购物车
        $cart = Cart::where('id',$cart_id)->find();
        if (!$cart){
            return true;
        }
        // 判断购物车下还有没有商品，如果没有就把车也不要了
        $cart_goods = CartGoods::where('cart_id',$cart['id'])->select();
        if (!$cart_goods){
            $cart->delete();
            return true;
        }
        // 否则需要重新计算购物车剩余商品总价
        $total_price = 0;
        $total_num = 0;
        foreach ($cart_goods as $v){
            $goods = \app\common\model\Goods::getGoodsFind($v["goods_id"]);
            if(!$goods || $goods['status']!=1){
                // 如果商品不存在了，就删掉车内这个
                $v->delete();
                continue;
            }
            $v->subtotal = $v['num']*$goods['price'];
            $v->num = $v['num'];
            $v->save();
            $total_price += $v['num']*$goods['price'];
            $total_num+=$v['num'];
        }
        $cart->total_price = $total_price;
        $cart->total_num = $total_num;
        $cart->save();
        return true;
    }

    /**
     * 查询商品在购物车内数量
     * @param $goods_id
     * @param $user_id
     * @return int|mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function queryGoodsCartNum($goods_id,$user_id){
        // 查询用户是否已经有购物车
        $cart = Cart::where('user_id',$user_id)->find();
        if (!$cart){
            return 0;
        }
        // 判断购物车下还有没有商品，如果没有就把车也不要了
        $cart_goods = CartGoods::where('cart_id',$cart['id'])->where('goods_id',$goods_id)->find();
        if (!$cart_goods){
            return 0;
        }
        return $cart_goods['num'];
    }

    /**
     * 删除购物车
     * @param $cart_id
     * @param $user_id
     * @param $goods_ids 部分商品ID
     * @return bool
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function clearCart($cart_id,$user_id,$goods_ids): bool
    {
        // 查询用户是否已经有购物车
        $cart = Cart::where('user_id',$user_id)->where('id',$cart_id)->find();
        if (!$cart){
            return true;
        }
        if(empty($goods_ids)){
            $del_cart_goods = CartGoods::where('cart_id',$cart_id)->delete();
            if(!$del_cart_goods){
                return false;
            }
            $cart->delete();
            return true;
        }else{
            $del_cart_goods = CartGoods::where('cart_id',$cart_id)->where('goods_id','in',$goods_ids)->delete();
            if(!$del_cart_goods){
                return false;
            }
            Cart::updateCart($cart_id);
            return true;
        }

    }

    public function merchant()
    {
        return $this->belongsTo('Merchant', 'merchant_id', 'id', [], 'LEFT')->setEagerlyType(0);
    }


    public function user()
    {
        return $this->belongsTo('User', 'user_id', 'id', [], 'LEFT')->setEagerlyType(0);
    }
}
