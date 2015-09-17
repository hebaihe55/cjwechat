<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="success.aspx.cs" Inherits="QLWeiXin.lsjyWeb.success" %>

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
                    <a href="javascript:history.go(-1);">      <img src="img/return_button.png" /></a>
                </div>
                <div id="title_name_font">
                </div>
            </div>
            <div id="success_ok">
                <img src="img/icon_paymen completion.png" /><br />
                支付成功
            </div>
            <div id="success_bt">
                <asp:Button runat="server" Text="" ID="success_submit" />
            </div>
        </div>
    </div>
    </form>
</body>
</html>
