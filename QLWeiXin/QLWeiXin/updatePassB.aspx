<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="updatePassB.aspx.cs" Inherits="QLWeiXin.updatePassB" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="lsjyWeb/css/handleResult.css" rel="stylesheet" type="text/css" />
    <script src="lsjyWeb/js/suit.js" type="text/javascript"></script>
    <script src="lsjyWeb/js/identifyingCode.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="bodys" align="center">
        <div class="backgrounds" align="center">
            <div class="title_name">
                <div id="title_name_ico">
                        <img src="img/return_button.png" />
                </div>
                <div id="title_name_font">
                    修改密码
                </div>
            </div>
            <div id="regb_txt_count">
                <div class="regb_txt_div">
                    <asp:TextBox runat="server" class="regb_txtbox" placeholder="请输入验证码" ID="code"></asp:TextBox>
                </div>
                <div class="regb_txt_div">
                    <asp:TextBox runat="server" class="regb_txtbox" placeholder="请输入密码（6-16位字符或字符+数字）" ID="pwd"></asp:TextBox>
                </div>
                <div class="regb_txt_div">
                    <asp:TextBox runat="server" class="regb_txtbox" placeholder="确认密码" ID="repwd"></asp:TextBox>
                </div>
            </div>
            <div id="bt">
                <div class="bt_div">
                    <asp:Button runat="server" ID="regBt" Text="" onclick="regBt_Click" />
                </div>
                <div class="bt_div">
                    <asp:Button runat="server" ID="repeatBt" onclick="repeatBt_Click" />
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
