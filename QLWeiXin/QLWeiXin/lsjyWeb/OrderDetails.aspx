<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderDetails.aspx.cs" Inherits="QLWeiXin.lsjyWeb.OrderDetails" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/OrderDetails.css" rel="stylesheet" type="text/css" />
    <script src="js/suit.js" type="text/javascript"></script>
    <script src="js/scroll.js" type="text/javascript"></script>
    <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
</head>
<body onload="loaded()">
    <form id="form1" runat="server">
    <div class="bodys" align="center">
        <div class="backgrounds" align="center">
            <div class="title_name">
                <div id="title_name_font">
                    订单详情
                </div>
            </div>
            <div id="wrapper">
                <div id="scroller">
                    <table border="0" cellspacing="0">
                        <tr class="hang_same">
                            <td class="left_same" style="background-color: rgb(240,240,240); color: #969595;">
                                订单号
                            </td>
                            <td class="same" style="background-color: rgb(240,240,240); color: #969595;">
                                20150827241
                            </td>
                        </tr>
                        <tr class="hang_same">
                            <td class="left_same">
                                下单时间
                            </td>
                            <td class="same">
                                2015-08-31
                            </td>
                        </tr>
                        <tr class="hr">
                            <td colspan="2">
                                <hr class="xian" />
                            </td>
                        </tr>
                        <tr class="hang_same">
                            <td class="left_same">
                                支付方式
                            </td>
                            <td class="same">
                                微信端
                            </td>
                        </tr>
                        <tr class="hr">
                            <td colspan="2">
                                <hr class="xian" />
                            </td>
                        </tr>
                        <tr class="hang_same">
                            <td class="left_same">
                                支付状态
                            </td>
                            <td class="same">
                                已支付
                            </td>
                        </tr>
                        <tr class="hr">
                            <td colspan="2">
                                <hr class="xian" />
                            </td>
                        </tr>
                        <tr class="hang_same">
                            <td class="left_same">
                                优惠券抵扣
                            </td>
                            <td class="same">
                                ￥0.0
                            </td>
                        </tr>
                        <tr class="hr">
                            <td colspan="2">
                                <hr class="xian" />
                            </td>
                        </tr>
                        <tr class="hang_same">
                            <td class="left_same">
                                订单总额
                            </td>
                            <td class="same">
                                ￥33
                            </td>
                        </tr>
                        <tr class="hang_same">
                            <td colspan="2" class="left_same" style="background-color: rgb(240,240,240); color: #969595;">
                                品果清单
                            </td>
                        </tr>
                    </table>
                    <table cellspacing="0" border="0">
                        <tr>
                            <td class="chanpin">
                            苹果<br />赠：葡萄
                            </td>
                            <td class="chanpin" style="text-align:center;">
                            1份<br />1份
                            </td>
                            <td class="chanpin" style=" text-align:right; padding-right:30px;">
                            ￥15
                            </td>
                        </tr>
                    </table>
                    <table border="0" cellspacing="0">
                        <tr class="hang_same">
                            <td colspan="2" class="left_same" style="background-color: rgb(240,240,240); color: #969595;">
                                自提信息
                            </td>
                        </tr>
                        <tr class="hang_same">
                            <td class="left_same">
                                自提时间
                            </td>
                            <td class="same">
                                2015-08-31
                            </td>
                        </tr>
                        <tr class="hang_same">
                            <td class="left_same">
                                自提点
                            </td>
                            <td class="same">
                                店名
                            </td>
                            <tr class="hang_same">
                            <td class="left_same">
                                自提地址
                            </td>
                            <td class="same">
                                无名路19号
                            </td>
                        </tr>
                        </tr>
                        </table>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
