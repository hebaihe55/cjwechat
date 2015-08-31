<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="QLWeiXin.dazhuanpan.index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<script>
    window.onload = function () {
        document.getElementById('content_info').style.display = 'none';
    }

</script>
    <title>赶快来测一测你的克拉恋人是什么类型吧！</title>
    <link rel="SHORTCUT ICON" href="./laodas.jpg">
　　<link rel="BOOKMARK" href="./laodas.jpg">
<div id='wx_pic' style='margin:0 auto;display:none;'>
<img src="laodas.jpg" />
</div>
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
    <style>
        *
        {
            padding: 0;
            margin: 0;
        }
        
        #bodys
        {
            width: 100%;
        }
        #content
        {
            width: 640px;
            height: 1030px;
            background-image: url(ly-plate.png);
            position:relative;
            z-index:1;
        }
        .lottery-star
        {
            width: 214px;
            height: 214px; 
            position: relative;
            float: left;
            left: 320px;
            top: 360px;
            outline: none;
        }
        #lotteryBtn
        {
            cursor: pointer;
            position: absolute;
            z-index:2;
            top: 0;
            left: -107px;
        }
        #content_info
        {
            width: 640px;
            height: 1030px;
            font-family: 微软雅黑;
            color: White;
            background-image:url(click.png);
            background-repeat:repeat;
            position:relative;
            z-index:3;
        }
    </style>
</head>
<body>
<form runat="server">
    <div id="bodys" align="center">
        <div id="content" align="center">
            <div class="lottery-star">
                <img src="rotate-static.png" id="lotteryBtn">
            </div>
            <div id="content_info" align="left" runat="server">
               
            </div>
            <input type="hidden" id="hidden_name" value="value">
        <asp:TextBox runat="server" ID="signature" Style="display: none"></asp:TextBox>
        <asp:TextBox runat="server" ID="timestamp" Style="display: none"></asp:TextBox>
        <asp:TextBox runat="server" ID="straa" Style="display: none"></asp:TextBox>
        <asp:TextBox runat="server" ID="toke" Style="display: none"></asp:TextBox>

        </div>
    </div>
    <!------------------------------------【微信分享JS代码】-------------------------------------------->
    <script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
    <script language="javascript">

        var dengji;
        //生成随机数函数
        function rd(n, m) {
            var c = m - n + 1;
            return Math.floor(Math.random() * c + n);
        }
        var num = rd(70, 100); //随机数
        //微信分享事件
        wx.config({
            debug: false,
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
                title: '赶快来测一测你的克拉恋人是什么类型吧！',
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
                title: '赶快来测一测你的克拉恋人是什么类型吧！',
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
    </form>
</body>
<!------------------------------------【大转盘JS实现代码】-------------------------------------------->
<script src="jquery-1.7.2.min.js"></script>
<script src="jQueryRotate.2.2.js"></script>
<script>
    function block() {
        document.getElementById("content_info").style.display = 'block';
     }
    var flag = true;
    $(function () {
        var timeOut = function () {  //超时函数
            $("#lotteryBtn").rotate({
                angle: 0,
                duration: 10000,
                animateTo: 2160,  //这里是设置请求超时后返回的角度，所以应该还是回到最原始的位置，2160是因为我要让它转6圈，就是360*6得来的
                callback: function () {
                    alert('网络超时')
                }
            });
        };
        var rotateFunc = function (awards, angle) {  //awards:奖项，angle:奖项对应的角度，text:提示文字
            dengji = awards;
            $('#lotteryBtn').stopRotate();
            $("#lotteryBtn").rotate({
                angle: 0,
                duration: 5000,
                animateTo: angle + 2160, //angle是图片上各奖项对应的角度，1440是我要让指针旋转4圈。所以最后的结束的角度就是这样子^^
                callback: function () {
                    var id = window.setTimeout(block, 2000);
                    
                }
            });
        };

        $("#lotteryBtn").rotate({
            bind:
           {
               click: function () {
                   if (flag) {
                       var time = 1;
                       //time = time[Math.floor(Math.random() * time.length)];
                       if (time == 0) {
                           timeOut(); //网络超时
                       }

                       if (time == 1) {
                           var data = [1, 2, 3, 5, 6, 7, 8, 9, 10, 11, 12]; //返回的数组
                           data = data[Math.floor(Math.random() * data.length)];
                           if (data == 1) {
                               rotateFunc(1, 15);
                           }
                           if (data == 2) {
                               rotateFunc(2, 45)
                           }
                           if (data == 3) {
                               rotateFunc(3, 75)
                           }
                           if (data == 4) {
                               rotateFunc(4, 105)
                           }
                           if (data == 5) {
                               rotateFunc(5, 135)
                           }
                           if (data == 6) {
                               rotateFunc(6, 165)
                           }
                           if (data == 7) {
                               rotateFunc(7, 195)
                           }
                           if (data == 8) {
                               rotateFunc(8, 225)
                           }
                           if (data == 9) {
                               rotateFunc(9, 255)
                           }
                           if (data == 10) {
                               rotateFunc(10, 285)
                           }
                           if (data == 11) {
                               rotateFunc(11, 315)
                           }
                           if (data == 12) {
                               rotateFunc(12, 345)
                           }
                           flag = false;
                       }
                   }
               }
           }

        });
    })
</script>
<!---------------------------------------------------------------------------------------------------->
</html>
