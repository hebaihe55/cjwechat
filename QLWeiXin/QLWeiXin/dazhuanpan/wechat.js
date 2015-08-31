
function weixin_share(title, desc, imgUrl) {

    var wanted_id = "fe"
    var link = document.location.href;
    var dataForWeixin = {
        appId: '',
        MsgImg: imgUrl,
        TLImg: imgUrl,
        link: link,
        title: title,
        desc: desc,
        callback: function (channel) {

        }

    };

    var onBridgeReady = function () {
        WeixinJSBridge.on('menu:share:appmessage', function (argv) {
            WeixinJSBridge.invoke('sendAppMessage', {
                "appid": dataForWeixin.appId,
                "img_url": dataForWeixin.MsgImg,
                "img_width": "60",
                "img_height": "60",
                "link": dataForWeixin.link,
                "desc": dataForWeixin.desc,
                "title": dataForWeixin.title
            }, function (res) { (dataForWeixin.callback("wechat"))(); });
        });

        WeixinJSBridge.on('menu:share:timeline', function (argv) {
            // (dataForWeixin.callback)();
            WeixinJSBridge.invoke('shareTimeline', {
                "img_url": dataForWeixin.TLImg,
                "img_width": "60",
                "img_height": "60",
                "link": dataForWeixin.link,
                "desc": dataForWeixin.desc,
                "title": dataForWeixin.title
            });

            (dataForWeixin.callback)();
        });


        WeixinJSBridge.on('menu:share:weibo', function (argv) {
            WeixinJSBridge.invoke('shareWeibo', {
                "content": "#???#" + dataForWeixin.title + " " + dataForWeixin.link,
                "url": dataForWeixin.link,
                "img_url": dataForWeixin.MsgImg,
                "pic": dataForWeixin.MsgImg,
                "img": dataForWeixin.MsgImg
            }, function (res) { (dataForWeixin.callback("tencent"))(); });
        });

        WeixinJSBridge.on('menu:share:facebook', function (argv) {
            (dataForWeixin.callback)();
            WeixinJSBridge.invoke('shareFB', {
                "img_url": dataForWeixin.TLImg,
                "img_width": "60",
                "img_height": "60",
                "link": dataForWeixin.link,
                "desc": dataForWeixin.desc,
                "title": dataForWeixin.title
            }, function (res) { });
        });
    };

    if (document.addEventListener) {
        document.addEventListener('WeixinJSBridgeReady', onBridgeReady, false);
    } else if (document.attachEvent) {
        document.attachEvent('WeixinJSBridgeReady', onBridgeReady);
        document.attachEvent('onWeixinJSBridgeReady', onBridgeReady);
    }

    var key = "resume_" + wanted_id;
    var share_flag = getCookie(key);
    if (share_flag == wanted_id) {
        //啥都不做
    }
    //更新缉拿令查看次数
    else {

    }

};

function setCookie(c_name, value, expiredays) {
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + expiredays);
    document.cookie = c_name + "=" + escape(value) + ((expiredays == null) ? "" : ";expires=" + exdate.toGMTString());
}

function getCookie(c_name) {
    if (document.cookie.length > 0) {
        c_start = document.cookie.indexOf(c_name + "=");
        if (c_start != -1) {
            c_start = c_start + c_name.length + 1;
            c_end = document.cookie.indexOf(";", c_start);
            if (c_end == -1) c_end = document.cookie.length;
            return unescape(document.cookie.substring(c_start, c_end));
        }
    }
    return "";
}