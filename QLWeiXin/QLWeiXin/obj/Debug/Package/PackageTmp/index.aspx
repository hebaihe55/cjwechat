<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="QLWeiXin.index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="lsjyWeb/css/index.css" rel="stylesheet" type="text/css" />
    <script src="lsjyWeb/js/suit.js" type="text/javascript"></script>
    <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
 
    <script src="lsjyWeb/js/position.js" type="text/javascript"></script>
    <script src="lsjyWeb/js/dong.js" type="text/javascript"></script>
    <script src="lsjyWeb/js/indexMenuClick.js" type="text/javascript"></script>
       <script src="lsjyWeb/js/JScript1.js" type="text/javascript"></script>
    <title>绿色家园</title>
</head>
<body onload="loaded()">
    <form id="form1" runat="server">
    <asp:Label runat="server" Text="" ID="address_info" Style="display: none"></asp:Label>
    <input type="text" runat="server" id="nowLatitudes" style="display: none" />
    <input type="text" runat="server" id="nowLongitudes" style="display: none" />
    <asp:HiddenField ID="addr1" runat="server" />

    <asp:HiddenField ID="acid" runat="server" />
    <div class="bodys" align="center">
        <div class="backgrounds" align="center">
            <!-----------------------------------页头（定位）---------------------------------------->
            <div id="map">
                <div id="address">
                    最近门店：<asp:Label ID="shop_name" runat="server"><font color="white"></font></asp:Label>
                    <img src="lsjyWeb/img/arrow.png" /></div>
                <div id="logon_ico">
                    <a href="lsjyWeb/personalCenter.aspx">
                        <img src="lsjyWeb/img/login_ico.png" /></a>

                </div>
            </div>
            <!-----------------------------------页中左边（菜单、展示窗）---------------------------------------->
            <div id="content">
                <div id="menu">
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <div class="menu_once" id="menu_<%# Container.ItemIndex + 1%>">
                                <%#Eval("name") %> <br />
                                <font style="font-size:22px;"><%#Eval("ShortDescription")%></font>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <!-----------------------------------页中右边菜单一的内容---------------------------------------->
                <div id="product">
                    <div id="wrapper">
                        <div id="scroller">
                            <table cellpadding="0" cellspacing="0" border="0" width="457" id="1">
                                <% foreach (QLWeiXin.Code.productList pl in p1)
                                   { %>
                                <tr>
                                    <td style="width: 457px; height: 260px;">
                                        <table cellpadding="0" cellspacing="0" border="0" width="457" id="view1" style="background-image: url( <%= pl.img %>);
                                            height: 260px;">
                                            <tr>
                                                <td align="right" colspan="3" class="content_name">
                                                    <%= pl.name %>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" colspan="3" class="content_size">
                                                    <%= pl.integral%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" colspan="3" class="content_price">
                                                    <%= pl.price%>元
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" colspan="3" style="text-decoration: line-through" class="content_originalprice">
                                                    <%= Convert.ToDouble(pl.originalprice).ToString("0.00") %>
                                                </td>
                                            </tr>
                                            <tr style="height: 80px;">
                                                <td class="td_jian" align="right" onclick="jian(this)">
                                                    <div class="same_bt">
                                                        <img src="lsjyWeb/img/ade.png" /></div>
                                                </td>
                                                <td class="td_count">
                                                    <div class="same_bt">
                                                        <label>
                                                            1</label></div>
                                                </td>
                                                <td class="td_jia" onclick="jia(this)">
                                                    <img src="lsjyWeb/img/abe.png" />
                                                </td>
                                                <td style="display: none;">
                                                    <%= pl.MaximumOrder%>
                                                </td>
                                                <td style="display: none;">
                                                    1
                                                </td>
                                                <td style="display: none;">
                                                    <%=pl.id %>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <%} %>
                            </table>
                            <table cellpadding="0" cellspacing="0" border="0" width="457" id="2">
                                <% foreach (QLWeiXin.Code.productList pl in p2)
                                   { %>
                                <tr>
                                    <td style="width: 457px; height: 260px;">
                                        <table cellpadding="0" cellspacing="0" border="0" width="457" id="view2" style="background-image: url( <%= pl.img %>);
                                            height: 260px;">
                                            <tr>
                                                <td align="right" colspan="3" class="content_name">
                                                    <%= pl.name %>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" colspan="3" class="content_size">
                                                    <%= pl.integral%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" colspan="3" class="content_price">
                                                    <%= pl.price%>元
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" colspan="3" style="text-decoration: line-through" class="content_originalprice">
                                                    <%= Convert.ToDouble(pl.originalprice).ToString("0.00") %>
                                                </td>
                                            </tr>
                                            <tr style="height: 80px;">
                                                <td class="td_jian" align="right" onclick="jian(this)">
                                                    <div class="same_bt">
                                                        <img src="lsjyWeb/img/ade.png" /></div>
                                                </td>
                                                <td class="td_count">
                                                    <div class="same_bt">
                                                        <label>
                                                            1</label></div>
                                                </td>
                                                <td class="td_jia" onclick="jia(this)">
                                                    <img src="lsjyWeb/img/abe.png" />
                                                </td>
                                                <td style="display: none;">
                                                    <%= pl.MaximumOrder%>
                                                </td>
                                                <td style="display: none;">
                                                    2
                                                </td>
                                                <td style="display: none;">
                                                    <%=pl.id %>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <%} %>
                            </table>
                            <table cellpadding="0" cellspacing="0" border="0" width="457" id="3">
                                <% foreach (QLWeiXin.Code.productList pl in p3)
                                   { %>
                                <tr>
                                    <td>
                                        <table cellpadding="0" cellspacing="0" border="0" width="457" id="view3" style="background-image: url( <%= pl.img %>);
                                            height: 260px;">
                                            <tr>
                                                <td align="right" colspan="3" class="content_name">
                                                    <%= pl.name %>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" colspan="3" class="content_size">
                                                    <%= pl.integral%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" colspan="3" class="content_price">
                                                    <%= pl.price%>元
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" colspan="3" style="text-decoration: line-through" class="content_originalprice">
                                                    <%= Convert.ToDouble(pl.originalprice).ToString("0.00") %>
                                                </td>
                                            </tr>
                                            <tr style="height: 80px;">
                                                <td class="td_jian" align="right" onclick="jian(this)">
                                                    <div class="same_bt">
                                                        <img src="lsjyWeb/img/ade.png" /></div>
                                                </td>
                                                <td class="td_count">
                                                    <div class="same_bt">
                                                        <label>
                                                            1</label></div>
                                                </td>
                                                <td class="td_jia" onclick="jia(this)">
                                                    <img src="lsjyWeb/img/abe.png" />
                                                </td>
                                                <td style="display: none;">
                                                    <%= pl.MaximumOrder%>
                                                </td>
                                                <td style="display: none;">
                                                    3
                                                </td>
                                                <td style="display: none;">
                                                    <%=pl.id %>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <%} %>
                            </table>
                            <table cellpadding="0" cellspacing="0" border="0" width="457" id="4">
                                <% foreach (QLWeiXin.Code.productList pl in p4)
                                   { %>
                                <tr>
                                    <td>
                                        <table cellpadding="0" cellspacing="0" border="0" id="view4" width="457" style="background-image: url( <%= pl.img %>);
                                            height: 260px;">
                                            <tr>
                                                <td align="right" colspan="3" class="content_name">
                                                    <%= pl.name %>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" colspan="3" class="content_size">
                                                    <%= pl.integral%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" colspan="3" class="content_price">
                                                    <%= pl.price%>元
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" colspan="3" style="text-decoration: line-through" class="content_originalprice">
                                                    <%= Convert.ToDouble(pl.originalprice).ToString("0.00") %>
                                                </td>
                                            </tr>
                                            <tr style="height: 80px;">
                                                <td class="td_jian" align="right" onclick="Onejian(this)">
                                                    <div class="same_bt">
                                                        <img src="lsjyWeb/img/ade.png" /></div>
                                                </td>
                                                <td class="td_count">
                                                    <div class="same_bt">
                                                        <label>
                                                            1</label></div>
                                                </td>
                                                <% if (pl.MaximumOrder == "0")
                                                   { %>
                                                <td class="td_jia" onclick="alertOne()">
                                                    <img src="lsjyWeb/img/ace.png" class="Onejias" />
                                                </td>
                                                <%}
                                                   else
                                                   { %>
                                                <td class="td_jia" onclick="Onejia(this)">
                                                    <img src="lsjyWeb/img/abe.png" class="Onejias" />
                                                </td>
                                                <%} %>
                                                <td style="display: none;">
                                                    <%= pl.MaximumOrder%>
                                                </td>
                                                <td style="display: none;">
                                                    4
                                                </td>
                                                <td style="display: none;">
                                                    <%=pl.id %>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <%} %>
                            </table>
                        </div>
                    </div>
                </div>
                <!-----------------------------------页尾（购买状态）---------------------------------------->
                <div id="shade" runat="server">
                </div>
                <div class="footer-detail-iscroll" style="display: none;">
                    <div id="footer_content">
                        <table width="580" border="0" id="DivShopMall" cellspacing="0">
                        </table>
                    </div>
                    <div id="footer_jiesuan">
                        <div class="footer_jiesuan_left">
                            总价
                            <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="footer_jiesuan_right">
                            <asp:ImageButton Style="display: none;" ID="ImageButton6" runat="server" ImageUrl="~/lsjyWeb/img/anniu_11.png" />
                            <input type="button" id="indexSub6" class="indexSub" style="background-image: url(/img/anniu_11.png)" />
                        </div>
                    </div>
                </div>
                <!--小苹果-->
                <div id="go_sale_img">
                    <div id="go_sale_img_1">
                        <asp:TextBox runat="server" ID="go_sale_img_1_label" ReadOnly="true" Text="0"></asp:TextBox>
                    </div>
                    <div id="go_sale_img_2">
                    </div>
                </div>
                <!--透明的DIV-->
                <div id="bottom_90">
                </div>
                <!--透明上面的东西 按钮、总价-->
                <div id="bottom_90_sub_div">
                    <div class="footer_jiesuan_left">
                        总价
                        <asp:Label ID="Label3" runat="server">0</asp:Label>
                    </div>
                    <div class="footer_jiesuan_right">
                        <asp:ImageButton ID="ImageButton5" runat="server" ImageUrl="~/lsjyWeb/img/anniu_11.png"
                            Style="display: none;" />
                        <input type="button" id="indexSub5" class="indexSub" style="background-image: url(lsjyWeb/img/anniu_11.png)" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
