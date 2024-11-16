define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'modular/index' + location.search,
                    add_url: 'modular/add',
                    edit_url: 'modular/edit',
                    del_url: 'modular/del',
                    multi_url: 'modular/multi',
                    import_url: 'modular/import',
                    table: 'modular',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'weigh',
                columns: [
                    [
                        {checkbox: true},
                        {field: 'id', title: __('Id')},
                        {field: 'community.name', title: __('Community.name'), operate: 'LIKE'},
                        {field: 'title', title: __('Title'), operate: 'LIKE'},
                        {field: 'ico_image', title: __('Ico_image'), operate: false, events: Table.api.events.image, formatter: Table.api.formatter.image},
                        {field: 'jump_type', title: __('Jump_type'), searchList: {"0":__('Jump_type 0'),"1":__('Jump_type 1'),"2":__('Jump_type 2')}, formatter: Table.api.formatter.normal},
                        {field: 'jump_url', title: __('Jump_url'), operate: 'LIKE', formatter: Table.api.formatter.url},
                        {field: 'status', title: __('Status'), searchList: {"0":__('Status 0'),"1":__('Status 1')}, formatter: Table.api.formatter.status},
                        {field: 'weigh', title: __('Weigh'), operate: false},
                        {field: 'createtime', title: __('Createtime'), operate:'RANGE', addclass:'datetimerange', autocomplete:false, formatter: Table.api.formatter.datetime},
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
