<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="balance.aspx.cs" Inherits="QLWeiXin.lsjyWeb.balance" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script src="js/suit.js" type="text/javascript"></script>
    <script src="js/balance.js" type="text/javascript"></script>
    <link href="css/balance.css" rel="stylesheet" type="text/css" />
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
                    结算
                </div>
            </div>
            <div id="wrapper">
                <div id="scroller">
                    <table border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td>
                                <div class="gray">
                                    送货地址
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div id="balance_address">
                                    <div id="balance_address_userinfo">
                                        某某 13917483303
                                    </div>
                                    <div id="balance_address_info">
                                        上海市普陀区武宁路长寿路
                                    </div>
                                    <div class="jiantou">
                                        <img src="img/morethan.png.png" />
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="gray">
                                    配送信息
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="select_div">
                                    配送方式：<font style="color: rgb(100,100,100); font-size: 26px;">门店自提</font>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="select_div">
                                    配送时间：<font style="color: rgb(100,100,100); font-size: 26px;">下单次日10:30——21:00</font>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="alert">
                                    <font style="color: Red;">温馨提示：线上下单，线下自提</font><br />
                                    当日00:00至12:00的订单，可于当日16:30至21:00领取<br />
                                    当日12:00至24:00的订单，可于当日10:30至21:00领取
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="gray">
                                    支付信息
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="buy_type" onclick="clickWechat()">
                                    <div class="buy_ico">
                                        <img src="img/wechat.png.png" />
                                    </div>
                                    <div class="buy_select" id="selectWechat">
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="buy_type" onclick="clickAlipay()">
                                    <div class="buy_ico">
                                        <img src="img/alipay.png.png" />
                                    </div>
                                    <div class="buy_select" id="selectAlipay">
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="select_div" style="border-bottom: 0px;">
                                    邮费：<font style="color: rgb(100,100,100); font-size: 26px;">￥0.00</font>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="gray">
                                    果品清单
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div id="pro_info">
                                    <table border="0" cellspacing="0">
                                        <tr>
                                            <td>
                                                辽宁西梅
                                            </td>
                                            <td>
                                                1份
                                            </td>
                                            <td>
                                                6.9元
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div id="foot">
                <div id="heji">
                    合计：￥18
                </div>
                <div id="submit">
                    <asp:Button runat="server" Text="" ID="bal_sub" />
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
