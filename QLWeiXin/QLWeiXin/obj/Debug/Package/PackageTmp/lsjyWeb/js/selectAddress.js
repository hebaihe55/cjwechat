$(document).ready(function () {
    $("#title_name_ico").click(function () {
        location.href = 'index.aspx';
    });
});
function test(obj) {
    obj.style.backgroundColor = 'rgb(222,222,222)';
    var shopName = obj.innerHTML;
    var arr = new Array();
    arr = shopName.split("——");

    if (window.confirm('你确定要将地址改为' + arr[0].replace(/[ ]/g, "") + '吗?')) {
        //alert("确定");
        location.href = 'index.aspx?shopName=' + arr[0].replace(/[ ]/g, "");
    } else {
        //alert("取消");
        obj.style.backgroundColor = 'white';
    }
    alert('test');
}