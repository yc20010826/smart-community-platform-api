<?php

namespace app\api\controller;

use app\common\controller\Api;
use app\common\model\Cart;
use app\common\model\CartGoods;
use app\common\model\Classif;
use app\common\model\Goods;
use app\common\model\Merchant;
use think\Db;
use think\Request;

class Shop extends Api
{
    protected $noNeedRight = '*';
    protected $model = null;

    public function __construct(Request $request = null)
    {
        $this->model = new Merchant();
        parent::__construct($request);
    }

    /**
     * 获取商户信息
     * @return void
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function get_merchant_info(){
        $id = $this->request->get('id');
        $lng = $this->request->param('lng');
        $lat = $this->request->param('lat');
        $data = $this->model
            ->with(['category'])
            ->where('merchant.id',$id)
            ->find();
        $data->visible(['id','category_id','mer_name','mer_avatar_image','mer_bg_image','mer_address','mer_phone','is_business','sales_daterange','distribution_mode','sales_scope','sales_volume','sales_amount','status','status_msg','createtime','mer_notice','mer_longitude','mer_latitude']);
        $data->visible(['category']);
        $data->getRelation('category')->visible(['name','nickname']);
        $data = $data->toArray();
        // 计算距离
        $data['distance'] = 0;
        if($lng && $lat && $data['mer_longitude'] && $data['mer_latitude']){
            $data['distance'] = get_distance($lng,$lat,$data['mer_longitude'],$data['mer_latitude']);
            $data['distance'] = round($data['distance']/1000,2);
        }
        $this->success('获取成功',$data);
    }

    /*
     * 获取商户下商品列表
     */
    public function get_merchant_goods(){
        $merchant_id = $this->request->get('merchant_id');
        // 先获取分类
        $left_data = Classif::where('merchant_id',$merchant_id)->where('status',1)->select();
        // 获取每个分类下面的商品，将分类和商品分别压入数组
        $left = [];
        $main = [];
        if($left_data){
            $left_data = collection($left_data)->toArray();
            foreach ($left_data as $item){
                $left[] = $item;
                // 获取分类下商品
                $goods = Goods::where('classif_id',$item['id'])->where('merchant_id',$merchant_id)->select();
                // 处理商品图片转为数组
                if($goods){
                    $goods = collection($goods)->toArray();
                    foreach ($goods as &$vo){
                        $vo['cover_images'] = explode(',',$vo['cover_images']);
                        if(!$this->auth->isLogin()){
                            $vo['cart_num'] = 0;
                        }
                        $vo['cart_num'] = \app\common\model\Cart::queryGoodsCartNum($vo['id'],$this->auth->id);
                    }
                }
                // 压入数组
                $arr = [
                    'list' => $goods,
                    'title' => $item['classif_name']
                ];
                $main[] = $arr;
            }
        }
        // 抛出
        $this->success('获取成功',[
            'left' => $left,
            'main' => $main,
        ]);
    }

    /**
     * 获取购物车
     * @return void
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function get_cart(){
        $merchant_id = $this->request->get('merchant_id');
        $data = Cart::where('user_id',$this->auth->id)->where('merchant_id',$merchant_id)->find();
        Cart::updateCart($data['id']); // 更新购物车
        $data = Cart::where('user_id',$this->auth->id)->find();
        if(!$data){
            $this->success('NULL',[]);
        }
        $data['goods'] = CartGoods::where('cart_id',$data->id)->field('cart_id,goods_id,num,subtotal')->select();
        $data['total_price'] = round($data['total_price'],2);
        // 计算合计划线价
        $scr_price_count = 0;
        $data['goods'] = collection($data['goods']);
        foreach ($data['goods'] as &$g){
            $scr_price = Goods::where('id',$g['goods_id'])->value('scr_price');
            $scr_price_count+=($scr_price*$g['num']);
            $g['info'] = Goods::getGoodsFind($g['goods_id']);
            $g['info']['cover_images'] = explode(',', $g['info']['cover_images']);
        }
        $data['total_scr_price'] = round($scr_price_count,2);
        $this->success('SUCCESS',$data);
    }

    /**
     * 加入购物车
     */
    public function cartAddGoods(){
        $goods_id = $this->request->post('goods_id');
        if(empty($goods_id)){
            $this->error('商品ID异常');
        }
        Db::startTrans();
        try {
            if(!\app\common\model\Cart::addGoods($goods_id,$this->auth->id)){
                throw new \think\Exception('加入购物车失败', 20001);
            }
            Db::commit();
        }catch (\Exception $exception){
            Db::rollback();
            $this->error($exception->getMessage());
        }
        $this->success('加入购物车成功');
    }

    /**
     * 移除购物车
     */
    public function cartDelGoods(){
        $goods_id = $this->request->post('goods_id');
        $is_all = $this->request->post('is_all');
        if(empty($goods_id)){
            $this->error('商品ID异常');
        }
        Db::startTrans();
        try {
            if(!\app\common\model\Cart::delGoods($goods_id,$this->auth->id,$is_all)){
                throw new \think\Exception('移除商品失败', 20001);
            }
            Db::commit();
        }catch (\Exception $exception){
            Db::rollback();
            $this->error($exception->getMessage());
        }
        $this->success('移除商品成功');
    }

    /**
     * 购物车结算（还没好）
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
//    public function cartSettlement(){
//        $cart_id = $this->request->post('cart_id');
//        $receiver_id = $this->request->post('receiver_id');
//        $goods_ids = $this->request->post('goods_ids'); // 部分商品结算
//        if(empty($cart_id)){
//            $this->error('参数异常');
//        }
//        if(empty($receiver_id)){
//            $this->error('请选择收货地址');
//        }
//        // 购物车提取
//        \app\common\model\Cart::updateCart($cart_id); // 先更新一次购物车
//        $cartInfo = \app\common\model\Cart::where('user_id',$this->auth->id)->where('id',$cart_id)->find();
//        if (!$cartInfo){
//            $this->error('购物车不存在');
//        }
//        // 收货地址提取
//        $receiverInfo = Receiver::where('user_id',$this->auth->id)->where('id',$receiver_id)->find();
//        if (!$receiverInfo){
//            $this->error('收货地址异常，请重新选择');
//        }
//        $orderCreate = [];
//        Db::startTrans();
//        try {
//            // 生成唯一订单号
//            $orderNo = Orders::createOrderNo();
//            // 母单数据
//            $orderArr = [
//                'user_id'=>$this->auth->id,
//                'order_no'=>$orderNo,
//                'receiver_name'=>$receiverInfo['receiver_name'],
//                'receiver_mobile'=>$receiverInfo['receiver_mobile'],
//                'receiver_city'=>$receiverInfo['receiver_city'],
//                'receiver_address'=>$receiverInfo['receiver_address'],
//                'total_amount'=>$cartInfo['total_price'],
//                'goods_num'=>$cartInfo['total_num'],
//            ];
//            // 母单入库
//            $orderCreate = Orders::create($orderArr);
//            if(!$orderCreate){
//                throw new \think\Exception('订单生产失败，请重试！', 10001);
//            }
//            // 获取购物车下挂商品
//            if(!empty($goods_ids)){
//                $cart_goods = \app\common\model\cart\Goods::where('cart_id',$cart_id)->where('goods_id','in',$goods_ids)->select();
//            }else{
//                $cart_goods = \app\common\model\cart\Goods::where('cart_id',$cart_id)->select();
//            }
//            $total_amount = 0; // 订单总价计算
//            foreach ($cart_goods as $item){
//                // 入母单商品数据
//                $goodsArr = [
//                    'orders_id'=>$orderCreate['id'],
//                    'goods_id'=>$item['goods_id'],
//                    'goods_price'=>$item['goods_info']['price'],
//                    'goods_num'=>$item['num'],
//                    'goods_total'=>$item['goods_info']['price']*$item['num'],
//                ];
//                Ordersgoods::create($goodsArr);
//                $total_amount += ($item['goods_info']['price']*$item['num']);
//            }
//            $orderCreate->total_amount = $total_amount;
//            $orderCreate->save();
//            \app\common\model\cart\Cart::clearCart($cart_id,$this->auth->id,$goods_ids);// 清除购物车
//            Db::commit();
//        }catch (\Exception $exception){
//            Db::rollback();
//            $this->error('网络异常：'.$exception->getMessage());
//        }
//        $this->success('下单成功，请前往支付~',$orderCreate);
//    }
}