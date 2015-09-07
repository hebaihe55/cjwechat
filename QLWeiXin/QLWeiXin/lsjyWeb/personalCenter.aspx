<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="personalCenter.aspx.cs"
    Inherits="QLWeiXin.lsjyWeb.personalCenter" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="css/personal.css" rel="stylesheet" type="text/css" />
    <script src="js/personCenter.js" type="text/javascript"></script>
    <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script>
        var _width = parseInt(window.screen.width);
        var scale = _width / 640;
        var ua = navigator.userAgent.toLowerCase();
        var result = /android (\d+\.\d+)/.exec(ua);
        if (result) {
            var version = parseFloat(result[1]);
            if (version > 2.3) {
                document.write('<meta name="viewport" content="width=640, minimum-scale = ' + scale + ', maximum-scale = ' + scale + ', target-densitydpi=device-dpi">');
            } else {
                document.write('<meta name="viewport" content="width=640, target-densitydpi=device-dpi">');
            }
        } else {
            document.write('<meta name="viewport" content="width=640, user-scalable=no, target-densitydpi=device-dpi">');
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="bodys" align="center">
        <div class="backgrounds" align="center">
            <div class="title_name">
                <div id="title_name_ico">
                    <img src="img/return_button.png" />
                </div>
                <div id="title_name_font">
                    个人中心
                </div>
            </div>
            <div id="person_title">
                <div id="person_img">
                </div>
                <div id="person_uid">
                    <asp:Label ID="Label1" runat="server" Text="绿色家园"></asp:Label><br />
                    <asp:Label ID="mobile" runat="server" Text="ID:13917483303"></asp:Label>
                </div>
            </div>
            <div class="gray">
            </div>
            <div id="person_content">
                <div class="person_tr" onclick="clickDiv(this)">
                    <div class="tr_ico">
                        <img src="img/person_txt.png" /></div>
                    <div class="tr_name">
            <a href="myOrder.aspx">            我的订单</a> </div>
                </div>
                <div class="person_tr" onclick="clickDiv(this)">
                    <div class="tr_ico">
                        <img src="img/personal_posi.png" /></div>
                    <div class="tr_name">
                   <a href="addressManage.aspx">     我的收货地址</a></div>
                </div>
                <div class="person_tr" onclick="clickDiv(this)">
                    <div class="tr_ico">
                        <img src="img/person_like.png" /></div>
                    <div class="tr_name">
                <a href="updatePass.aspx">       修改密码</a> </div>
                </div>
            </div>
            <div class="gray">
            </div>
            <div id="person_content2">
                <div class="person_tr" onclick="clickDiv(this)">
                    <div class="tr_ico">
                        <img src="img/person_man.png" /></div>
                    <div class="tr_name">
                  <a>      关于我们</a></div>
                </div>
                <div class="person_tr" onclick="clickDiv(this)">
                    <div class="tr_ico">
                        <img src="img/person_tel.png" /></div>
                    <div class="tr_name">
                <a href="custom.aspx">       联系客服</a> </div>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>