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
    <asp:HiddenField ID="acid" runat="server" />
  
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
                     <a  href="javascript:void(0)" onclick='subgo(<%#Eval("id") %>)'><%#Eval("name") %></a>  </div>
                        </ItemTemplate>
     </asp:Repeater>

                   
                </div>
                <!-----------------------------------页中右边菜单一的内容---------------------------------------->
                <div id="product">
                    <div id="wrapper">
                        <div id="scroller">
                            <table cellpadding="0" cellspacing="0" border="0" width="457" id="pro_1">
                             <% foreach (QLWeiXin.Code.productList pl in p1)
                                { %>
                             
                                
                                <tr>
                                    <td >
                                        <div class="cover" style='background-image:url( <%= pl.img %>)'>
                                            <div class="pro_name">
                                                 <%= pl.name %>
                                            </div>
                                            <div class="pro_component">
                                                <%= pl.integral%>
                                            </div>
                                            <div class="pro_price">
                                                ￥<font style="font-size: 36px;"><label class="once_price">   <%= pl.price%></label></font>
                                            </div>
                                            <div class="buttons">
                                         
                                               <div class="jia" onclick="funJia(this)">
                                                </div>
                                                <div class="innerCount">
                                                    1
                                                </div>
                                                <div class="jian">
                                                </div>

                                               
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                             
                             <%} %>

                            </table>

                               <table cellpadding="0" cellspacing="0" border="0" width="457" id="pro_2">
                             <% foreach (QLWeiXin.Code.productList pl in p2)
                                { %>
                             
                                
                                <tr>
                                    <td >
                                        <div class="cover" style='background-image:url( <%= pl.img %>)'>
                                            <div class="pro_name">
                                                 <%= pl.name %>
                                            </div>
                                            <div class="pro_component">
                                                <%= pl.integral%>
                                            </div>
                                            <div class="pro_price">
                                                ￥<font style="font-size: 36px;"><label class="once_price">   <%= pl.price%></label></font>
                                            </div>
                                            <div class="buttons">
                                         
                                               <div class="jia" onclick="funJia(this)">
                                                </div>
                                                <div class="innerCount">
                                                    1
                                                </div>
                                                <div class="jian">
                                                </div>

                                               
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                             
                             <%} %>

                            </table>
                             <table cellpadding="0" cellspacing="0" border="0" width="457" id="pro_3">
                             <% foreach (QLWeiXin.Code.productList pl in p3)
                                { %>
                             
                                
                                <tr>
                                    <td >
                                        <div class="cover" style='background-image:url( <%= pl.img %>)'>
                                            <div class="pro_name">
                                                 <%= pl.name %>
                                            </div>
                                            <div class="pro_component">
                                                <%= pl.integral%>
                                            </div>
                                            <div class="pro_price">
                                                ￥<font style="font-size: 36px;"><label class="once_price">   <%= pl.price%></label></font>
                                            </div>
                                            <div class="buttons">
                                         
                                                    <div class="jia" onclick="funJia(this)">
                                                </div>
                                                <div class="innerCount">
                                                    1
                                                </div>
                                                <div class="jian">
                                                </div>

                                               
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                             
                             <%} %>

                            </table>
                             <table cellpadding="0" cellspacing="0" border="0" width="457" id="pro_4">
                             <% foreach (QLWeiXin.Code.productList pl in p4)
                                { %>
                             
                                
                                <tr>
                                    <td >
                                        <div class="cover" style='background-image:url( <%= pl.img %>)'>
                                            <div class="pro_name">
                                                 <%= pl.name %>
                                            </div>
                                            <div class="pro_component">
                                                <%= pl.integral%>
                                            </div>
                                            <div class="pro_price">
                                                ￥<font style="font-size: 36px;"><label class="once_price">   <%= pl.price%></label></font>
                                            </div>
                                            <div class="buttons">
                                         
                                                    <div class="jia" onclick="funJia(this)">
                                                </div>
                                                <div class="innerCount">
                                                    1
                                                </div>
                                                <div class="jian">
                                                </div>

                                               
                                            </div>
                                        </div>
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
                        <table width="580" border="0">
                            <!--弹出的购物车-->
                         
                       


                            <asp:Repeater ID="Repeater3" runat="server" 
                                onitemcommand="Repeater3_ItemCommand">
                            <ItemTemplate>
                            
                                <tr>
                                <td class="footer_content_left">
                                   <%#Eval("name")%>
                                </td>
                                    <td class="footer_content_left">
                                    <%#Eval("price")%>
                                </td>
                                <td class="footer_content_right">
                                   
                                   
                                    <asp:ImageButton ID="ImageButn3" runat="server" ImageUrl="~/lsjyWeb/img/ade.png" CommandArgument='<%#Eval("id")%>' CommandName="deleteCar1"/>
                                  
                                    <asp:Label ID="Label4" runat="server" Text='<%#Eval("num")%>' class="footer_content_font"></asp:Label>
                                     <asp:ImageButton ID="ImageBton4" runat="server" ImageUrl="~/lsjyWeb/img/abe.png" CommandArgument='<%#Eval("id")%>'  CommandName="addCar1"/>
                                </td>
                            </tr>
                            </ItemTemplate>
                            </asp:Repeater>

                          
                        
                        </table>
                    </div>
                    <div id="footer_jiesuan">
                        <div class="footer_jiesuan_left">
                         水果   <asp:Label ID="Label2" runat="server" Text=" 29"></asp:Label>  </div>
                        <div class="footer_jiesuan_right">
                          <asp:ImageButton ID="ImageButton6" runat="server" ImageUrl="~/lsjyWeb/img/anniu_gray.png"/></div>
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
                 水果      <asp:Label ID="Label3" runat="server" Text=" 29"></asp:Label> </div>
                    <div class="footer_jiesuan_right">
                      
                        <asp:ImageButton ID="ImageButton5" runat="server" 
                            ImageUrl="~/lsjyWeb/img/anniu_gray.png" onclick="ImageButton5_Click"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
   
    </form>
</body>
</html>
