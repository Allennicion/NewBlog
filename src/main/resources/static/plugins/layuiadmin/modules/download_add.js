
layui.define(['element', 'form', 'layer', 'formSelects'], function (exports) {
    var form = layui.form,
        element = layui.element,
        formSelects = layui.formSelects;

    element.render();
    form.render();

    formSelects.btns('downloadCateId', []);

    formSelects.maxTips('downloadCateId', function (id, vals, val, max) {
        layer.alert("最多只能选择3个");
    });


    $("#refreshDownloadCate").click(function () {
        $.get("/management/dict/downloadCate/list", function (resp) {
            if (resp.code === 200) {
                formSelects.data('downloadCateId', 'local', {
                    arr: resp.data
                })
            }
        });
    });


    //监听提交
    form.on('submit(downloadSubmit)', function (data) {
        data.field.downloadCateIds = formSelects.value('downloadCateId', 'val');
        NBV5.post("/management/download/create", data.field);
        return false;
    });

    exports('download_add', {});

});



