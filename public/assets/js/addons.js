define([], function () {
    require([], function () {
    //绑定data-toggle=addresspicker属性点击事件

    $(document).on('click', "[data-toggle='addresspicker']", function () {
        var that = this;
        var callback = $(that).data('callback');
        var input_id = $(that).data("input-id") ? $(that).data("input-id") : "";
        var lat_id = $(that).data("lat-id") ? $(that).data("lat-id") : "";
        var lng_id = $(that).data("lng-id") ? $(that).data("lng-id") : "";
        var lat = lat_id ? $("#" + lat_id).val() : '';
        var lng = lng_id ? $("#" + lng_id).val() : '';
        var url = "/addons/address/index/select";
        url += (lat && lng) ? '?lat=' + lat + '&lng=' + lng : '';
        Fast.api.open(url, '位置选择', {
            callback: function (res) {
                input_id && $("#" + input_id).val(res.address).trigger("change");
                lat_id && $("#" + lat_id).val(res.lat).trigger("change");
                lng_id && $("#" + lng_id).val(res.lng).trigger("change");
                try {
                    //执行回调函数
                    if (typeof callback === 'function') {
                        callback.call(that, res);
                    }
                } catch (e) {

                }
            }
        });
    });
});

require.config({
    paths: {
        'simditor': '../addons/simditor/js/simditor.min',
    },
    shim: {
        'simditor': [
            'css!../addons/simditor/css/simditor.min.css'
        ]
    }
});
require(['form'], function (Form) {
    var _bindevent = Form.events.bindevent;
    Form.events.bindevent = function (form) {
        _bindevent.apply(this, [form]);
        if ($(".editor", form).size() > 0) {
            //修改上传的接口调用
            require(['upload', 'simditor'], function (Upload, Simditor) {
                var editor, mobileToolbar, toolbar;
                Simditor.locale = 'zh-CN';
                Simditor.list = {};
                toolbar = ['title', 'bold', 'italic', 'underline', 'strikethrough', 'fontScale', 'color', '|', 'ol', 'ul', 'blockquote', 'code', 'table', '|', 'link', 'image', 'hr', '|', 'indent', 'outdent', 'alignment'];
                mobileToolbar = ["bold", "underline", "strikethrough", "color", "ul", "ol"];
                $(".editor", form).each(function () {
                    var id = $(this).attr("id");
                    editor = new Simditor({
                        textarea: this,
                        toolbarFloat: false,
                        toolbar: toolbar,
                        pasteImage: true,
                        defaultImage: Config.__CDN__ + '/assets/addons/simditor/images/image.png',
                        upload: {url: '/'}
                    });
                    editor.uploader.on('beforeupload', function (e, file) {
                        Upload.api.send(file.obj, function (data) {
                            var url = Fast.api.cdnurl(data.url);
                            editor.uploader.trigger("uploadsuccess", [file, {success: true, file_path: url}]);
                        });
                        return false;
                    });
                    editor.on("blur", function () {
                        this.textarea.trigger("blur");
                    });
                    Simditor.list[id] = editor;
                });
            });
        }
    }
});
});