<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="fail.aspx.cs" Inherits="QLWeiXin.lsjyWeb.fail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/handleResult.css" rel="stylesheet" type="text/css" />
    <script src="js/suit.js" type="text/javascript"></script>
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
                    支付失败
                </div>
            </div>
            <div id="success_ok">
                <img src="img/i_look.png" /><br />
                支付失败<br />
                亲，请检查网络是否出错
            </div>
        </div>
    </form>
</body>
</html>
