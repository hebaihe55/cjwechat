<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="confirm.aspx.cs" Inherits="QLWeiXin.lsjyWeb.confirm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script src="js/suit.js" type="text/javascript"></script>
    <link href="css/handleResult.css" rel="stylesheet" type="text/css" />
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
                    确认支付
                </div>
            </div>
            <div id="order">
                订单号：201508261234
            </div>
            <div id="confirm_price">
                ￥18</div>
            <div id="payment">
                <div id="confirm_title">
                    收款方<br />
                    商品
                </div>
                <div id="confirm_titleName">
                    绿色家园<br />
                    绿色家园20150826124
                </div>
            </div>
            <div id="confirm_submit">
                <asp:Button runat="server" Text="" ID="confirm_submitBt" />
            </div>
        </div>
    </div>
    </form>
</body>
</html>
