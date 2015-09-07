<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="QLWeiXin.lsjyWeb.login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <link href="css/login.css" rel="stylesheet" type="text/css" />
    <script src="js/login.js" type="text/javascript"></script>
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
                    登录
                </div>
            </div>
            <div id="logo">
                <img src="img/logo icon.png.png" />
            </div>
            <div id="txtDiv">
                <div class="txt">
                    <div class="txt_ico">
                        <img src="img/usernameicon.png.png" />
                    </div>
                    <div class="txt_textbox">
                        <asp:TextBox runat="server" class="tb" ID="username" onfocus="clearDiv(this)" placeholder="请输入手机号"
                            onblur="blurUser(this)" MaxLength="11"></asp:TextBox>
                    </div>
                </div>
                <div class="txt">
                    <div class="txt_ico">
                        <img src="img/unlock icon.png.png" />
                    </div>
                    <div class="txt_textbox">
                        <asp:TextBox runat="server" placeholder="请输入密码" class="tb" ID="pass" TextMode="Password"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div id="gray">
                <label onclick="location.href=''">
                    <font style="text-decoration: underline;"><a href="updatePass.aspx">忘记密码</a></font></label>
            </div>
            <div id="bt">
                <div class="bt_div">
                    <asp:Button runat="server" ID="loginBt" Text="" onclick="loginBt_Click" />
                </div>
                <div class="bt_div">
                    <asp:Button runat="server" ID="regBt" Text="" onclick="regBt_Click" />
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
