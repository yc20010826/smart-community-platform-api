define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'cart.goods/index' + location.search,
                    add_url: 'cart.goods/add',
                    edit_url: 'cart.goods/edit',
                    del_url: 'cart.goods/del',
                    multi_url: 'cart.goods/multi',
                    import_url: 'cart.goods/import',
                    table: 'cart_goods',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'id',
                columns: [
                    [
                        {checkbox: true},
                        {field: 'id', title: __('Id')},
                        {field: 'num', title: __('Num')},
                        {field: 'subtotal', title: __('Subtotal'), operate:'BETWEEN'},
                        {field: 'createtime', title: __('Createtime'), operate:'RANGE', addclass:'datetimerange', autocomplete:false, formatter: Table.api.formatter.datetime},
                        {field: 'goods.title', title: __('Goods.title'), operate: 'LIKE'},
                        {field: 'goods.price', title: __('Goods.price'), operate:'BETWEEN'},
                        {field: 'cart.id', title: __('Cart.id')},
                        {field: 'cart.user_id', title: __('Cart.user_id')},
                        {field: 'cart.merchant_id', title: __('Cart.merchant_id')},
                        {field: 'cart.total_amount', title: __('Cart.total_amount'), operate:'BETWEEN'},
                        {field: 'cart.createtime', title: __('Cart.createtime'), operate:'RANGE', addclass:'datetimerange', autocomplete:false, formatter: Table.api.formatter.datetime},
                        {field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate, formatter: Table.api.formatter.operate}
                    ]
                ]
            });

            // 为表格绑定事件
            Table.api.bindevent(table);
        },
        add: function () {
            Controller.api.bindevent();
        },
        edit: function () {
            Controller.api.bindevent();
        },
        api: {
            bindevent: function () {
                Form.api.bindevent($("form[role=form]"));
            }
        }
    };
    return Controller;
});
