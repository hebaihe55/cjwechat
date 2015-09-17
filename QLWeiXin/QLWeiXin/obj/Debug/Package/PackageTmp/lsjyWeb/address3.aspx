<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="address3.aspx.cs" Inherits="QLWeiXin.lsjyWeb.address3" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
                    自提点选择
                </div>
            </div>
            <div id="manage_gray">
                默认地址
            </div>
            <asp:Repeater ID="Repeater1" runat="server" >
               
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
                    <a href='balance.aspx?addr=<%# Eval("id") %>'

                   
                </div>
            </div>
            
            </ItemTemplate>


            </asp:Repeater>
      





        </div>
    </div>
    </form>
</body>
</html>
