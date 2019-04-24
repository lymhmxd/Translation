function modifyDb(item) {
    var x = document.getElementsByName("checked");
    //如果method=3,不能超过一个勾选。
    var length = 0;
    for (var i = 0; i < x.length; i++) {
        if (x[i].checked) {
            length += 1;
        }
    }
    if (item == 2) {
        if (length > 1) {
            alert("您勾选了多行，无法修改翻译啊！")
            return false;
        }
        else {
            var itemid = 0;
            for (var i = 0; i < x.length; i++) {
                if (x[i].checked) {
                    itemid = x[i].value
                }
            }
        }
    }

    //读取选择了那些行
    var num = 0;
    for (var i = 0; i < x.length; i++) {
        if (x[i].checked) {
            num = num + "," + Number(x[i].value);
        }
    }
    function getQueryVariable(variable) {
        var query = window.location.search.substring(1);
        var vars = query.split("&");
        for (var i = 0; i < vars.length; i++) {
            var pair = vars[i].split("=");
            if (pair[0] == variable) { return pair[1]; }
        }
        return (false);
    }
    var jsPost = function (action, values) {
        var id = Math.random();
        document.write('<form id="post' + id + '" name="post' + id + '" action="' + action + '" method="post">');
        for (var key in values) {
            document.write('<input type="hidden" name="' + key + '" value="' + values[key] + '" />');
        }
        document.write('</form>');
        document.getElementById('post' + id).submit();
    }
    var editvalue;
    if (item == 2) {
        editvalue = decodeURI(document.getElementById("input" + itemid).value);
    }
    else {
        editvalue = 0;
    }
    jsPost('action.asp', {
        'id': num,
        'dbname': 'StdTranslationCore_Mxd',
        'direct': location.href,
        'item': getQueryVariable("item"),
        'code': getQueryVariable("code"),
        'editvalue': editvalue,
        'method': item
    });
}
