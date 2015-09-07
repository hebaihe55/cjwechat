<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="QLWeiXin.lsjyWeb.index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="css/index.css" rel="stylesheet" type="text/css" />
    <script src="js/suit.js" type="text/javascript"></script>
    <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script src="js/JScript1.js" type="text/javascript"></script>
    <script src="js/position.js" type="text/javascript"></script>
    <script src="js/dong.js" type="text/javascript"></script>
    <title>绿色家园</title>
</head>
<body onload="loaded()">
    <form id="form1" runat="server">
    <asp:Label runat="server" Text="" ID="address_info" Style="display: none"></asp:Label>
    <input type="text" runat="server" id="nowLatitudes" style="display: none" />
    <input type="text" runat="server" id="nowLongitudes" style="display: none" />
    <div class="bodys" align="center">
        <div class="backgrounds" align="center">
            <!-----------------------------------页头（定位）---------------------------------------->
            <div id="map">
                <div id="address">
                    最近门店：<asp:Label ID="shop_name" runat="server"><font color="white"></font></asp:Label>
                    <img src="img/arrow.png" /></div>
                <div id="logon_ico">
                 <a href="personalCenter.aspx">  <img src="img/login_ico.png" /></a> 
                </div>
            </div>
            <!-----------------------------------页中左边（菜单、展示窗）---------------------------------------->
            <div id="content">
                <div id="menu">
                    <asp:Repeater ID="Repeater1" runat="server">
               <ItemTemplate>
                    <div class="menu_once" id="menu_<%# Container.ItemIndex + 1%>" >
                     <a  href='index.aspx?cid=<%#Eval("id") %>'>  <%#Eval("name") %></a> </div>
                        </ItemTemplate>
     </asp:Repeater>

                   
                </div>
                <!-----------------------------------页中右边菜单一的内容---------------------------------------->
                <div id="product">
                    <div id="wrapper">
                        <div id="scroller">
                            <table cellpadding="0" cellspacing="0" border="0" width="457" id="pro_1">
                                <asp:Repeater ID="Repeater2" runat="server">
                                <ItemTemplate>
                             
                                
                                <tr>
                                    <td>
                                        <div class="cover" style='background-image:url(<%#Eval("img") %>)'>
                                            <div class="pro_name">
                                                 <%#Eval("name") %>
                                            </div>
                                            <div class="pro_component">
                                                <%#Eval("integral")%>
                                            </div>
                                            <div class="pro_price">
                                                ￥<font style="font-size: 36px;"><label class="once_price"> <%#Eval("price")%></label></font>
                                            </div>
                                            <div class="buttons">
                                                <div class="jia" onclick="funJia(this)">
                                                </div>
                                                <div class="innerCount">
                                                    <%#Eval("name") %>
                                                </div>
                                                <div class="jian">
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                   </ItemTemplate>
                                </asp:Repeater> 


                            </table>
                          
                        </div>
                    </div>
                </div>
                <!-----------------------------------页尾（购买状态）---------------------------------------->
                <div id="shade" runat="server">
                </div>
                <div class="footer-detail-iscroll" style="display: none;">
                    <div id="footer_content">
                        <table width="580" border="0">
                            <!--弹出的购物车-->
                            <tr>
                                <td class="footer_content_left">
                                    水果
                                </td>
                                <td class="footer_content_right">
                                    <img src="img/ade.png" /><label class="footer_content_font">12</label><img src="img/abe.png" />
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div id="footer_jiesuan">
                        <div class="footer_jiesuan_left">
                            苹果29元</div>
                        <div class="footer_jiesuan_right">
                            <input type="button" id="footer_anniu" /></div>
                    </div>
                </div>
                <!--小苹果-->
                <div id="go_sale_img">
                    <div id="go_sale_img_1">
                        <asp:TextBox runat="server" ID="go_sale_img_1_label" ReadOnly="true"></asp:TextBox>
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
                        苹果29元</div>
                    <div class="footer_jiesuan_right">
                        <input type="button" id="footer_anniu" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
