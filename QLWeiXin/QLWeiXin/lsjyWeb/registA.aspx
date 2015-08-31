<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registA.aspx.cs" Inherits="QLWeiXin.lsjyWeb.registA" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <link href="css/regist.css" rel="stylesheet" type="text/css" />
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
                <div id="title_name_font">
                    注册
                </div>
            </div>
            <div id="txtDiv" align="center">
                <div id="txtDiv_content" align="center">
                    <div id="img_ico">
                    <img src="img/icon.png.png" />
                    </div>
                    <div id="cellphone">
                        <input type="text" runat="server" id="cell_txt" placeholder="请输入手机号" maxlength="11" />
                    </div>
                </div>
            </div>
            <div id="reg_send">
            <input type="button" id="reg_send_submit" />
            
            </div>
        </div>
    </div>
    </form>
</body>
</html>
