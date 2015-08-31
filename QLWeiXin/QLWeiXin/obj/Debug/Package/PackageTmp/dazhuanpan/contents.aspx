<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contents.aspx.cs" Inherits="QLWeiXin.dazhuanpan.content" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body
        {
            margin: 0px;
            padding: 0px;
        }
        #bodys
        {
            width: 100%;
        }
        #content
        {
            width: 640PX;
            height: 1030PX;
            background-image: URL(fonts.png);
        }
        #fonts
        {
            width: 420px;
            height: 300px;
            background-color: transparent;
            font-family: 微软雅黑;
            text-align: left;
            float: left;
            margin-top: 350px;
            padding-left: 120px;
            padding-right: 100px;
            font-size: 30px;
            line-height: 80px;
            color: rgb(94,47,0);
            font-weight: bold;
        }
    </style>
    <script language="javascript" type="text/javascript">
        ///////////////////////////////////////////////////////屏幕尺寸//////////////////////////////////////////////////
        var phoneWidth = parseInt(window.screen.width);
        var phoneScale = phoneWidth / 640;
        var ua = navigator.userAgent;
        if (/Android (\d+\.\d+)/.test(ua)) {
            var version = parseFloat(RegExp.$1);
            // andriod 2.3
            if (version > 2.3) {
                document.write('<meta name="viewport" content="width=640, minimum-scale = ' + phoneScale + ', maximum-scale = ' + phoneScale + ', target-densitydpi=device-dpi">');
                // andriod 2.3以上
            } else {
                document.write('<meta name="viewport" content="width=640, target-densitydpi=device-dpi">');
            }
            // 其他系统
        } else {
            document.write('<meta name="viewport" content="width=640, user-scalable=no, target-densitydpi=device-dpi">');
        }
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    </script>
</head>
<body>
    <script>
        window.onload = function () {

            var num = document.getElementById("hidd").value;
            var txt = document.getElementById("proContent").value;
            if (txt == '1') {
                document.getElementById("fonts").innerHTML = "你的克拉水果恋人是：甘蔗<br />特点：优越、聪慧、实际<br />弱点：顽固、自闭<br />爱情：对自己和对方的要求很高。<br />匹配指数：" + num + "%";
            }
            else if (txt == '2') {
                document.getElementById("fonts").innerHTML = "你的克拉水果恋人是：菠萝<br />特点：热情 、组织能力、正义感、爱心丰富<br />弱点：高傲、虚荣心<br />爱情：追求轰轰烈烈的爱情。<br />匹配指数：" + num + "%";
            }
            else if (txt == '3') {
                document.getElementById("fonts").innerHTML = "你的克拉水果恋人是：草莓<br />特点：联想力、开朗、反映机智<br />弱点：喜新厌旧、投机取巧<br />爱情：认为爱情是最美好的东西<br />匹配指数：" + num + "%";
            }
            else if (txt == "4") {
                document.getElementById("fonts").innerHTML = "你的克拉水果恋人是：木瓜<br />特点：浪漫、决断能力、逻辑思考<br />弱点：偏见、死脑筋<br />爱情：沉默、安逸、踏实、耐性<br />匹配指数：" + num + "%";
            }
            else if (txt == '5') {
                document.getElementById("fonts").innerHTML = "你的克拉水果恋人是：柠檬<br />特点：调皮、热情、害羞，细心、温柔大方、开朗<br />弱点：好管闲事、拘泥、挑剔、媚于俗世<br />爱情：细心追求完美。<br />匹配指数：" + num + "%";
            }
            else if (txt == '6') {
                document.getElementById("fonts").innerHTML = "你的克拉水果恋人是：葡萄<br />特点：慎重 、友善、有爱心<br />弱点：敏感、马虎、拘束、占有欲强<br />爱情：喜欢优越和成功的对象<br />匹配指数：" + num + "%";
            }
            else if (txt == '7') {
                document.getElementById("fonts").innerHTML = "你的克拉水果恋人是：西瓜<br />特点：勇敢、火热、大方<br />弱点：稚拙、刚愎自用<br />爱情：感情充沛、富于很强的表达力<br />匹配指数：" + num + "%";
            }
            else if (txt == '8') {
                document.getElementById("fonts").innerHTML = "你的克拉水果恋人是：猕猴桃<br />特点：宽容、理想、冷静<br />弱点：草率、叛逆<br />爱情：遇到爱情，不会把握。<br />匹配指数：" + num + "%";
            }
            else if (txt == '9') {
                document.getElementById("fonts").innerHTML = "你的克拉水果恋人是：杨梅<br />特点：自觉、唯美<br />弱点：畏缩、逃避困难<br />爱情：爱情生活充满神秘色彩。<br />匹配指数：" + num + "%";
            }
            else if (txt == '10') {
                document.getElementById("fonts").innerHTML = "你的克拉水果恋人是：哈密瓜<br />特点：感觉敏锐，深谋远虑<br />弱点：花心、多变<br />爱情：在爱情中占主导地位。<br />匹配指数：" + num + "%";
            }
            else if (txt == '11') {
                document.getElementById("fonts").innerHTML = "你的克拉水果恋人是：荔枝<br />特点：魅力、 艺术力强、美丽<br />弱点：自恋、爱美、敷衍<br />爱情：爱情博大。<br />匹配指数：" + num + "%";
            }
            else if (txt == '12') {
                document.getElementById("fonts").innerHTML = "你的克拉水果恋人是：蓝莓<br />特点：智慧、理智、领导能力<br />弱点：城府深、难深交<br />爱情：在爱情中占主导地位。<br />匹配指数：" + num + "%";
            }


        }

    </script>
    <form id="form1" runat="server">
    <asp:TextBox runat="server" ID="proContent" Style="display: none;"></asp:TextBox>
    <div id="bodys" align="center">
        <div id="content" align="center">
            <div id="fonts" runat="server">
            </div>
        </div>
    </div>
    <asp:TextBox runat="server" ID="hidd" Style="display: none;"></asp:TextBox>
    <asp:TextBox runat="server" ID="signature" Style="display: none"></asp:TextBox>
    <asp:TextBox runat="server" ID="timestamp" Style="display: none"></asp:TextBox>
    <asp:TextBox runat="server" ID="straa" Style="display: none"></asp:TextBox>
    <asp:TextBox runat="server" ID="toke" Style="display: none"></asp:TextBox>
    </form>
    <!------------------------------------【微信分享JS代码】-------------------------------------------->
    <script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
    <script language="javascript">
        var num = document.getElementById("hidd").value;
        //微信分享事件
        wx.config({
            debug: true,
            appId: 'wxa0e7d758fa3dbcf1',
            timestamp: document.getElementById("timestamp").value,
            nonceStr: document.getElementById("straa").value,
            signature: document.getElementById("signature").value,
            jsApiList: ['onMenuShareTimeline', 'onMenuShareAppMessage']
        });

        wx.ready(function () {
            wx.checkJsApi({
                jsApiList: ['onMenuShareTimeline', 'onMenuShareAppMessage'],
                success: function () {
                }
            });

            wx.onMenuShareTimeline({
                title: '我的匹配指数是' + num + '%',
                link: 'http://www.zglsjy.com/item/dazhuanpan/index.aspx',
                imgUrl: 'http://www.zglsjy.com/item/dazhuanpan/laodas.jpg',
                trigger: function () {
                },
                success: function () {
                    location.href = 'contents.aspx?awards=' + dengji;
                },
                cancel: function () {
                    //取消了
                },
                fail: function () {
                }
            });

            wx.onMenuShareAppMessage({
                title: '我的匹配指数是' + num + '%',
                desc: "点击进入测试页面", // 分享描述
                link: 'http://www.zglsjy.com/item/dazhuanpan/index.aspx',
                imgUrl: 'http://www.zglsjy.com/item/dazhuanpan/laodas.jpg',
                type: 'link',
                trigger: function () {
                },
                success: function () {
                    location.href = 'contents.aspx?awards=' + dengji;
                },
                cancel: function () {
                    //取消了
                },
                fail: function () {
                }
            });
        });
    </script>
    <!---------------------------------------------------------------------------------------------------->
</body>
</html>
