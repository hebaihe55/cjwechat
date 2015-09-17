<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="confirm.aspx.cs" Inherits="QLWeiXin.lsjyWeb.confirm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script src="js/suit.js" type="text/javascript"></script>
    <link href="css/handleResult.css" rel="stylesheet" type="text/css" />

     <script type="text/javascript">


         wx.config({
             debug: true,
             appId: 'wxf8b4f85f3a794e77',
             timestamp: 1423012878,
             nonceStr: 'QdFNpHrKRW8yhDsb',
             signature: 'e6acdd9cf4239b5fdefab504d1fddb9b24c83c7f',
             jsApiList: ['checkJsApi','chooseWXPay']
         });






               //调用微信JS api 支付
               function jsApiCall()
               {
                   WeixinJSBridge.invoke(
                   'getBrandWCPayRequest',
                  {
                      "appId": $("#appid").val(),     //公众号名称，由商户传入     
                      "timeStamp": $("#timeStamp").val(),         //时间戳，自1970年以来的秒数     
                      "nonceStr": $("#noncestr").val(), //随机串     
                      "package": $("#prepay_id").val(),     
           "signType" : "MD5",         //微信签名方式：     
           "paySign": $("#appsign").val() //微信签名 
                  },
                    function (res)
                    {
                        WeixinJSBridge.log(res.err_msg);
                        alert(res.err_code + res.err_desc + res.err_msg);
                     }
                    );
               }

               function callpay()
               {
                   if (typeof WeixinJSBridge == "undefined")
                   {
                       if (document.addEventListener)
                       {
                           document.addEventListener('WeixinJSBridgeReady', jsApiCall, false);
                       }
                       else if (document.attachEvent)
                       {
                           document.attachEvent('WeixinJSBridgeReady', jsApiCall);
                           document.attachEvent('onWeixinJSBridgeReady', jsApiCall);
                       }
                   }
                   else
                   {
                       jsApiCall();
                   }
               }
               
     </script>


</head>
<body>
    <form id="form1" runat="server">
    <div class="bodys" align="center">
        <div class="backgrounds" align="center">
            <div class="title_name">
                <div id="title_name_ico">
                    <a href="javascript:history.go(-1);">      <img src="img/return_button.png" /></a>
                </div>
                <div id="title_name_font">
                    确认支付
                </div>
            </div>
            <div id="order">
                 订单号：<asp:Label ID="Label1" runat="server" Text="297264"></asp:Label>
            </div>
            <div id="confirm_price">
                ￥<asp:Label ID="Label2" runat="server" Text="0.01"></asp:Label></div>
            <div id="payment">
                <div id="confirm_title">
                    收款方<br />
                    商品
                </div>
                <div id="confirm_titleName">
                    绿色家园<br />
                    绿色家园20150826124
                </div>
            </div>
            <div id="confirm_submit">
                <asp:Button runat="server" Text="" ID="confirm_submitBt" OnClientClick="callpay()" />
            </div>
        </div>
    </div>
    <asp:HiddenField ID="prepay_id" runat="server" />
    <asp:HiddenField ID="sign" runat="server" />
    <asp:HiddenField ID="appsign" runat="server" />
    <asp:HiddenField ID="timeStamp" runat="server" />
    <asp:HiddenField ID="noncestr" runat="server" />
      <asp:HiddenField ID="appid" runat="server" />
          <asp:HiddenField ID="mch_id" runat="server" />
    </form>
</body>
</html>
