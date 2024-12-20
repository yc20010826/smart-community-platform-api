<?php

return [
    [
        'name' => 'maptype',
        'title' => '默认地图类型',
        'type' => 'radio',
        'content' => [
            'baidu' => '百度地图',
            'amap' => '高德地图',
            'tencent' => '腾讯地图',
        ],
        'value' => 'amap',
        'rule' => 'required',
        'msg' => '',
        'tip' => '',
        'ok' => '',
        'extend' => '',
    ],
    [
        'name' => 'location',
        'title' => '默认检索城市',
        'type' => 'string',
        'content' => [],
        'value' => '重庆',
        'rule' => 'required',
        'msg' => '',
        'tip' => '',
        'ok' => '',
        'extend' => '',
    ],
    [
        'name' => 'zoom',
        'title' => '默认缩放级别',
        'type' => 'string',
        'content' => [],
        'value' => '12',
        'rule' => 'required',
        'msg' => '',
        'tip' => '',
        'ok' => '',
        'extend' => '',
    ],
    [
        'name' => 'lat',
        'title' => '默认Lat',
        'type' => 'string',
        'content' => [],
        'value' => '29.532681764428744',
        'rule' => 'required',
        'msg' => '',
        'tip' => '',
        'ok' => '',
        'extend' => '',
    ],
    [
        'name' => 'lng',
        'title' => '默认Lng',
        'type' => 'string',
        'content' => [],
        'value' => '106.57425979572295',
        'rule' => 'required',
        'msg' => '',
        'tip' => '',
        'ok' => '',
        'extend' => '',
    ],
    [
        'name' => 'baidukey',
        'title' => '百度地图KEY',
        'type' => 'string',
        'content' => [],
        'value' => '',
        'rule' => '',
        'msg' => '',
        'tip' => '',
        'ok' => '',
        'extend' => '',
    ],
    [
        'name' => 'amapkey',
        'title' => '高德地图KEY',
        'type' => 'string',
        'content' => [],
        'value' => '6b6bf36e207a07dc5cd40e1d9ee38734',
        'rule' => '',
        'msg' => '',
        'tip' => '',
        'ok' => '',
        'extend' => '',
    ],
    [
        'name' => 'tencentkey',
        'title' => '腾讯地图KEY',
        'type' => 'string',
        'content' => [],
        'value' => '',
        'rule' => '',
        'msg' => '',
        'tip' => '',
        'ok' => '',
        'extend' => '',
    ],
    [
        'name' => '__tips__',
        'title' => '温馨提示',
        'type' => '',
        'content' => [],
        'value' => '请先申请对应地图的Key，配置后再使用',
        'rule' => '',
        'msg' => '',
        'tip' => '',
        'ok' => '',
        'extend' => 'alert-danger-light',
    ],
];
