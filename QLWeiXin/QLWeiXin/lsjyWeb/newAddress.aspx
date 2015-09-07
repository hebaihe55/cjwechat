<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="newAddress.aspx.cs" Inherits="QLWeiXin.lsjyWeb.newAddress" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/updateAddress.css" rel="stylesheet" type="text/css" />
    <script src="js/suit.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="bodys" align="center">
        <div class="backgrounds" align="center">
            <div class="title_name">
                <div id="title_name_ico">
                 <a href="addressManage.aspx"> <img src="img/return_button.png" /></a>  
                </div>
                <div id="title_name_font">
                    新建地址
                </div>
            </div>
            <div class="updateAddressContent">
                <div class="hang">
                    收货人&nbsp;&nbsp;<input type="text" class="txt" runat="server" id="name" />
                </div>
                <div class="hang">
                    手机号码&nbsp;&nbsp;<input type="text" class="txt" runat="server" id="mobile"  />
                </div>
                <div class="hang">
                    所在区域&nbsp;&nbsp;<input type="text" class="txt" runat="server" id="area" />
                </div>
                <div class="end">
                    详细地址&nbsp;&nbsp;<textarea class="txts" runat="server" id="address" ></textarea>
                </div>
                <div id="address_button">
                    <asp:Button runat="server" Text="" ID="address_bt" onclick="address_bt_Click" />
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
