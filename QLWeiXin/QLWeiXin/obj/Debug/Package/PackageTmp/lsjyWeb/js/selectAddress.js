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
        location.href = '../index.aspx?shopName=' + arr[0].replace(/[ ]/g, "") + '&Latitude=' + $("#nowLatitudes").val() + '&Longitude=' + $("#nowLongitudes").val() + '&addr=' + arr[1];
    } else {
        //alert("取消");
        obj.style.backgroundColor = 'white';
    }
}



function clickmap() {
    location.href = 'SinceSomeMap.aspx';
}



function since_menu_click(obj) {
    obj.style.width = '176px';
    obj.style.borderLeft = '4px solid #669d36';
    obj.style.backgroundColor = 'white';
    obj.style.color = '#669d36';

    
    var table=document.getElementById("since_table");
    for (var i = 0; i < table.rows.length; i++) {
        if (table.rows[i].cells[0] != obj) {
            table.rows[i].cells[0].style.width = '180px';
            table.rows[i].cells[0].style.borderBottom = '1px solid rgb(200,200,200)';
            table.rows[i].cells[0].style.borderLeft = '0px';
            table.rows[i].cells[0].style.backgroundColor = '#f4f4f4';
            table.rows[i].cells[0].style.color = 'black';
        }
    }
}
