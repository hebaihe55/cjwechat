<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="selectAddress.aspx.cs"
    Inherits="QLWeiXin.lsjyWeb.selectAddress" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>绿色家园</title>
    <script src="js/suit.js" type="text/javascript"></script>
    <script src="js/scroll.js" type="text/javascript"></script>
    <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script src="js/selectAddress.js" type="text/javascript"></script>
    <link href="css/selectAddress.css" rel="stylesheet" type="text/css" />
</head>
<body onload="loaded()">
    <form id="form1" runat="server">
    <div class="bodys" align="center">
        <div class="backgrounds" align="center">
            <!-----------------------------------页头---------------------------------------->
            <div class="title">
                <div class="title_name">
                    <div id="title_name_ico">
                        <a href="javascript:history.go(-1);">      <img src="img/return_button.png" /></a>
                    </div>
                    <div id="title_name_font">
                        门店选择
                    </div>
                </div>
                <div class="gray_area">
                    GPS定位到离你最近的分店
                </div>
                <div class="near">
                    <asp:Label runat="server" Text="Label" ID="shopName"></asp:Label>
                    <asp:Label runat="server" Text="Label" ID="shopAddress"></asp:Label>
                </div>
                <div class="gray_area">
                    全部列表
                </div>
                <div class="content_area">
                    <div id="wrapper">
                        <div id="scroller">
                            <% for (int i = 0; i < shopAll.Rows.Count; i++)
                               {%>
                            <div class="smallDiv" onclick="test(this)">
                                <%Response.Write(shopAll.Rows[i][1].ToString()); %>
                                ——<%Response.Write(shopAll.Rows[i][7].ToString()); %></div>
                            <%} %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
