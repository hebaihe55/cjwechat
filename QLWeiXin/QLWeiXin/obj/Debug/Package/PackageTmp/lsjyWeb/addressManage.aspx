<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addressManage.aspx.cs"
    Inherits="QLWeiXin.lsjyWeb.addressManage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/addressManage.css" rel="stylesheet" type="text/css" />
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
                    地址管理
                </div>
            </div>
            <div id="manage_gray">
                默认地址
            </div>
            <asp:Repeater ID="Repeater1" runat="server" 
                onitemcommand="Repeater1_ItemCommand">
            <ItemTemplate>
                  <div class="manage_content">
                <div class="manage_font">
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("name") %>'></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label2" runat="server" Text='<%# Eval("phone") %>'></asp:Label><br />
                    <br />
                    <font style="font-size: 26px; color: #6e6e6e;"> <asp:Label ID="Label3" runat="server" Text='<%# Eval("address") %>'></asp:Label></font>
                </div>
                <div class="manage_update">
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <asp:Button ID="Button1" class="manage_bt" CommandArgument='<%# Eval("id") %>' runat="server" Text="" />
                </div>
            </div>
            
            </ItemTemplate>


            </asp:Repeater>
      





            <div id="manage_subDiv">
                <asp:Button runat="server" Text="" ID="manage_submit" 
                    onclick="manage_submit_Click" />
            </div>
        </div>
    </div>
    </form>
</body>
</html>
