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
                    <img src="img/return_button.png" />
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
                            <tr>
                                <td class="tdSate">
                                    <div class="tdSateDiv" align="center">
                                        <div class="tdSateDiv_title">
                                            <div class="time_ico">
                                            </div>
                                            <div class="tdSateDiv_time">
                                                2015-08-26 16:50
                                            </div>
                                            <div class="order_num">
                                                订单号：20150826321
                                            </div>
                                        </div>
                                        <div class="tdSateDiv_proname">
                                            <label class="count">
                                                共两份果品</label>
                                            <label class="price">
                                                ￥125</label>
                                        </div>
                                        <div class="tdSateDiv_state">
                                            <img src="img/cn.png" /><br />
                                            已提交&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;已支付&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;果品到点&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;门店自提
                                        </div>
                                        <div class="tdSateDiv_bt">
                                            <asp:Button runat="server" Text="" class="btSubmit" />
                                        </div>
                                    </div>
                                </td>
                            </tr>
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
