function openmodifyBt(item) {
    //判断是否有勾选
    var ck = document.getElementsByName("checked")
    var x = document.getElementById("operation")
    var length = 0;
    for (var i = 0; i < ck.length; i++) {
        if (ck[i].checked) {
            length += 1;
        }
    }
    //判断是否显示按钮及是否显示保存按钮（多勾选时只提供删除功能）
    if (length > 0) {
        x.style.display = "inline-block";
        if (length > 1) {
            document.getElementById("transmodify").style.display = "none";
        }
        else {
            document.getElementById("transmodify").style.display = "inline-block";
        }
    }
    else {
        x.style.display = "none";
    }
    //当前被勾选的行的翻译值区域应该是可编辑的文本框
    var tvalue = document.getElementsByName("value");
    var tevalue = document.getElementsByName("editvalue");
    var checkedstatus = document.getElementById("checkbox" + item);
    if (checkedstatus.checked) {
        for (var i = 0; i < tvalue.length; i++) {
            tvalue[i].style.display = 'table-cell';
        }
        for (var i = 0; i < tevalue.length; i++) {
            tevalue[i].style.display = 'none';
        }
        document.getElementById("span" + item).style.display = "none";
        document.getElementById("input" + item).style.display = "table-cell";
        document.getElementById("input" + item).style.cursor = "text";
        document.getElementById("input" + item).style.fontWeight = "bold";
        document.getElementById("input" + item).style.backgroundColor = "burlywood";
    }
    else {
        document.getElementById("span" + item).style.display = "table-cell";
        document.getElementById("input" + item).style.display = "none";
    }
}