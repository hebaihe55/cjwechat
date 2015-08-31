<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="QLWeiXin.lsjyWeb.index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="css/index.css" rel="stylesheet" type="text/css" />
    <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script src="js/JScript1.js" type="text/javascript"></script>
    <script src="js/position.js" type="text/javascript"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
    <title>绿色家园</title>
    <script>
        var _width = parseInt(window.screen.width);
        var scale = _width / 640;
        var ua = navigator.userAgent.toLowerCase();
        var result = /android (\d+\.\d+)/.exec(ua);
        if (result) {
            var version = parseFloat(result[1]);
            if (version > 2.3) {
                document.write('<meta name="viewport" content="width=640, minimum-scale = ' + scale + ', maximum-scale = ' + scale + ', target-densitydpi=device-dpi">');
            } else {
                document.write('<meta name="viewport" content="width=640, target-densitydpi=device-dpi">');
            }
        } else {
            document.write('<meta name="viewport" content="width=640, user-scalable=no, target-densitydpi=device-dpi">');
        }
    </script>
</head>
<body onload="loaded()">
    <form id="form1" runat="server">
    <asp:Label runat="server" Text="" ID="address_info" Style="display: none"></asp:Label>
    <div class="bodys" align="center">
        <div class="backgrounds" align="center">
            <!-----------------------------------页头（定位）---------------------------------------->
            <div id="map">
                <div id="address">
                    最近门店：<asp:Label ID="shop_name" runat="server"><font color="white"></font></asp:Label>
                    <img src="img/arrow.png" /></div>
                    <div id="logon_ico">
                    <img src="img/login_ico.png" />
                    </div>
            </div>
            <!-----------------------------------页中左边（菜单、展示窗）---------------------------------------->
            <div id="content">
                <div id="menu">
                    <div class="menu_once" id="menu_1">
                        国产水果</div>
                    <div class="menu_once" id="menu_2">
                        国产水果</div>
                    <div class="menu_once" id="menu_3">
                        国产水果</div>
                    <div class="menu_once" id="menu_4">
                        国产水果</div>
                    <div class="menu_once" id="menu_5">
                        国产水果</div>
                </div>
                <!-----------------------------------页中右边菜单一的内容---------------------------------------->
                <div id="product">
                    <div id="wrapper">
                        <div id="scroller">
                            <div class="pro_div_same">
                                <table cellpadding="0" cellspacing="0" border="0" width="457" id="pro_1">
                                    <tr>
                                        <td>
                                            <div class="cover">
                                                <div class="pro_name">
                                                    美国车厘子
                                                </div>
                                                <div class="pro_component">
                                                    2个/一份
                                                </div>
                                                <div class="pro_price">
                                                    ￥<font style="font-size: 36px;"><label class="once_price">26.9</label></font>
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
                                </table>
                            </div>

                            <!-----------------------------------菜单二的内容---------------------------------------->
                            <div class="pro_div_same">
                                <table cellpadding="0" cellspacing="0" border="0" width="457" id="pro_2">
                                    <tr>
                                        <td>
                                            <div class="cover">
                                                <div class="pro_name">
                                                    putya
                                                </div>
                                                <div class="pro_component">
                                                    3个/一份
                                                </div>
                                                <div class="pro_price">
                                                    ￥<font style="font-size: 36px;"><label class="once_price">26.9</label></font>
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
                                </table>
                            </div>

                            <!-----------------------------------菜三的内容---------------------------------------->
                            <div class="pro_div_same">
                                <table cellpadding="0" cellspacing="0" border="0" width="457" id="pro_3">
                                    <tr>
                                        <td>
                                            <div class="cover">
                                                <div class="pro_name">
                                                    asd
                                                </div>
                                                <div class="pro_component">
                                                    3个/一份
                                                </div>
                                                <div class="pro_price">
                                                    ￥<font style="font-size: 36px;"><label class="once_price">26.9</label></font>
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
                                </table>
                            </div>
                            <!-----------------------------------菜四的内容---------------------------------------->
                            <div class="pro_div_same">
                                <table cellpadding="0" cellspacing="0" border="0" width="457" id="pro_4">
                                    <tr>
                                        <td>
                                            <div class="cover">
                                                <div class="pro_name">
                                                    juzi
                                                </div>
                                                <div class="pro_component">
                                                    3个/一份
                                                </div>
                                                <div class="pro_price">
                                                    ￥<font style="font-size: 36px;"><label class="once_price">26.9</label></font>
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
                                </table>
                            </div>

                            <!-----------------------------------菜五的内容---------------------------------------->
                            <div class="pro_div_same">
                                <table cellpadding="0" cellspacing="0" border="0" width="457" id="pro_5">
                                    <tr>
                                        <td>
                                            <div class="cover">
                                                <div class="pro_name">
                                                    liyuansjk
                                                </div>
                                                <div class="pro_component">
                                                    3个/一份
                                                </div>
                                                <div class="pro_price">
                                                    ￥<font style="font-size: 36px;"><label class="once_price">26.9</label></font>
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
                                </table>
                            </div>

                        </div>
                    </div>
                </div>
                <!-----------------------------------页尾（购买状态）---------------------------------------->
                <div id="bottom">
                    <div id="go_sale">
                        <div id="go_sale_money">
                            ￥<label class="sum">0</label>
                        </div>
                        <div id="go_sale_img">
                            <div id="go_sale_img_1">
                                <asp:TextBox runat="server" ID="go_sale_img_1_label" ReadOnly="true"></asp:TextBox>
                            </div>
                            <div id="go_sale_img_2">
                            </div>
                            <div id="go_sale_img_3">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
