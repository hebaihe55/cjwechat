<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="myOrder.aspx.cs" Inherits="QLWeiXin.lsjyWeb.myOrder" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/handleResult.css" rel="stylesheet" type="text/css" />
    <link href="css/myOrder.css" rel="stylesheet" type="text/css" />
    <script src="js/suit.js" type="text/javascript"></script>
    <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script src="js/scroll.js" type="text/javascript"></script>

 

</head>
<body onload="loaded()">
    <form id="form1" runat="server">
    <div class="bodys" align="center">
        <div class="backgrounds" align="center">
            <div class="title_name">
                <div id="title_name_ico">
                    <a href="javascript:history.go(-1);">      <img src="img/return_button.png" /></a>
                </div>
                <div id="title_name_font">
                    我的订单
                </div>
            </div>
            <div class="content_area">
                <div id="wrapper">
                    <div id="scroller">
                        <table border="0 " cellspacing="0">
                            <!--从TR开始用/</% /%>循环出来-->
                            <asp:Repeater ID="Repeater1" runat="server" 
                                onitemcommand="Repeater1_ItemCommand">
                            <ItemTemplate>
                            
                          


                            <tr>
                                <td class="tdSate">
                                    <div class="tdSateDiv" align="center">
                                        <div class="tdSateDiv_title">
                                            <div class="time_ico">
                                            </div>
                                            <div class="tdSateDiv_time">
                                               <%#Eval("createDate")%>
                                            </div>
                                            <div class="order_num">
                                                订单号：<a href='OrderDetails.aspx?oid=<%#Eval("order_id")%>' > <%#Eval("order_code")%></a>
                                            </div>
                                        </div>
                                        <div class="tdSateDiv_proname">
                                            <label class="count">
                                                共  <%#  getorderNum(  Eval("goods_list").ToString())%>   份果品</label>
                                            <label class="price">
                                                ￥ <%#Eval("price")%></label>
                                        </div>
                                        <div class="tdSateDiv_state">
                                       
                                     
                                            <img src= '<%# getOrderStatusImg( Eval("orderstatus").ToString()) %>' /><br />
                                            已提交&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;已支付&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;果品到点&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;门店自提
                                        </div>
                                        <div class="tdSateDiv_bt">
                                         
                                                
                                                
                                                  <asp:ImageButton ImageUrl="~/lsjyWeb/img/button_zhif2.png"  ID="ImageButton2" runat="server"  Visible='<%# isDisply1(Eval("orderstatus").ToString())%>'  />


                         

                                                  <asp:ImageButton ImageUrl="~/lsjyWeb/img/button_weixing.png"   ID="ImageButton1" runat="server"  Visible='<%# isDisply1(Eval("orderstatus").ToString())%>'  />


                                           <asp:ImageButton ImageUrl="~/lsjyWeb/img/button_qren.png"   ID="Button1" runat="server"  Visible='<%# isDisply(Eval("orderstatus").ToString())%>' OnClientClick="return confirm('是否确定收货？');" CommandName="okOrder" CommandArgument='<%#Eval("order_id")%>' />
                                         

                                            <asp:Button runat="server" Text="" OnClientClick="return confirm('是否确定删除？');" class="btSubmit" CommandName="deleteOrder" CommandArgument='<%#Eval("order_id")%>' />
                                            <%#Eval("orderstatus")%>

                                        </div>
                                    </div>
                                </td>
                            </tr>


                              </ItemTemplate>
                            </asp:Repeater>

                            <!--这里结束 算一个订单的布局-->
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
