<?php


namespace app\api\controller;


use think\Request;

class Pages extends \app\common\controller\Api
{
    /**
     * 无需鉴权的方法,但需要登录
     * @var array
     */
    protected $noNeedRight = ['*'];
    protected $model = null;

    public function __construct(Request $request = null)
    {
        $this->model = new \app\common\model\Pages();
        parent::__construct($request);
    }

    /**
     * 获取单页面详情
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function get_details(){
        $identification = $this->request->get('identification');
        $data = $this->model->where('identification',$identification)->find();
        $this->success('获取成功',$data);
    }
}