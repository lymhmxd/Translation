autodivheight();
function autodivheight() {
    if (window.location.href.indexOf("result") > 0) {
        document.getElementById("input").style.lineHeight = "100px";
        document.getElementById("input").style.textAlign = "left";
        document.getElementById("select").style.marginRight = "3px";
        document.getElementById("search").style.height = "100px";
        document.getElementById("research").style.height = "100px";
    }
    else {
        var winHeight = 0;
        if (window.innerHeight)
            winHeight = window.innerHeight;
        else if ((document.body) && (document.body.clientHeight))
            winHeight = document.body.clientHeight;
        if (document.documentElement && document.documentElement.clientHeight)
            winHeight = document.documentElement.clientHeight;
        var a = document.getElementById("input");
        a.style.lineHeight = winHeight - 200 + "px";
        document.getElementById("search").style.height = "100%";
        document.getElementById("searchitem").style.width = "500px";
        window.onresize = autodivheight;
    }
}