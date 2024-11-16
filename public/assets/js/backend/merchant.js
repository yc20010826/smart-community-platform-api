define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'merchant/index' + location.search,
                    add_url: 'merchant/add',
                    edit_url: 'merchant/edit',
                    del_url: 'merchant/del',
                    multi_url: 'merchant/multi',
                    import_url: 'merchant/import',
                    table: 'merchant',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'id',
                fixedColumns: true,
                fixedRightNumber: 1,
                columns: [
                    [
                        {checkbox: true},
                        {field: 'id', title: __('Id')},
                        {field: 'category.name', title: __('商户分类')},
                        {field: 'mer_name', title: __('Mer_name'), operate: 'LIKE'},
                        {field: 'mer_avatar_image', title: __('Mer_avatar_image'), operate: false, events: Table.api.events.image, formatter: Table.api.formatter.image},
                        {field: 'mer_address', title: __('Mer_address'), operate: 'LIKE'},
                        {field: 'mer_phone', title: __('Mer_phone'), operate: 'LIKE'},
                        {field: 'is_business', title: __('Is_business'), searchList: {"1":__('Is_business 1'),"2":__('Is_business 2')}, formatter: Table.api.formatter.normal},
                        {field: 'sales_daterange', title: __('Sales_daterange'), operate: 'LIKE'},
                        {field: 'distribution_mode', title: __('Distribution_mode'), searchList: {"1":__('Distribution_mode 1'),"2":__('Distribution_mode 2'),"3":__('Distribution_mode 3')}, formatter: Table.api.formatter.normal},
                        {field: 'sales_scope', title: __('Sales_scope')},
                        {field: 'sales_volume', title: __('Sales_volume'), operate:'BETWEEN'},
                        {field: 'sales_amount', title: __('Sales_amount'), operate:'BETWEEN'},
                        {field: 'status', title: __('Status'), searchList: {"0":__('Status 0'),"1":__('Status 1'),"2":__('Status 2'),"3":__('Status 3')}, formatter: Table.api.formatter.status},
                        {field: 'status_msg', title: __('Status_msg'), operate: 'LIKE'},
                        {field: 'user.username', title: __('绑定用户'), operate: 'LIKE'},
                        {field: 'user.nickname', title: __('用户昵称'), operate: 'LIKE'},
                        {field: 'createtime', title: __('入驻时间'), formatter: Table.api.formatter.datetime, operate: 'RANGE', addclass: 'datetimerange', sortable: true},
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
