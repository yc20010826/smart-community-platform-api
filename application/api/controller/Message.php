<?php

namespace app\api\controller;

class Message extends \app\common\controller\Api
{
    protected $noNeedRight = '*';

    /**
     * 获取我的消息
     * @return void
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function get_list(){
        $limit = $this->request->get('limit',15);
        $msgType = $this->request->get('msgType',1);
        $data = \app\common\model\Message::where('receive_user',$this->auth->id)
            ->where('status','in',['0','1'])
            ->where('type',$msgType)
            ->order('status','ASC')
            ->order('createtime','DESC')
            ->paginate($limit)
        ;
        $this->success('获取成功',$data);
    }

    /**
     * 获取详情
     * @return void
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function get_msg_data(){
        $id = $this->request->get('id');
        $data = \app\common\model\Message::where('receive_user',$this->auth->id)
            ->where('id','=',$id)
            ->find()
        ;
        $this->success('获取成功',$data);
    }

    /**
     * 阅读成功
     * @return void
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function read_msg_data(){
        $id = $this->request->get('id');
        $data = \app\common\model\Message::where('receive_user',$this->auth->id)
            ->where('id','=',$id)
            ->find()
        ;
        if($data && $data->status==0){
            $data->status = 1;
            $data->readtime = time();
            $data->save();
        }
        $this->success('阅读成功');
    }

}