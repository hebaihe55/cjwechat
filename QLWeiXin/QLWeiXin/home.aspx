﻿<input type="button" id="btn" value="免费获取验证码" />
<script type="text/javascript">
    var wait = 60;
    function time(o) {
        if (wait == 0) {
            o.removeAttribute("disabled");
            o.value = "免费获取验证码";
            wait = 60;
        } else {
            o.setAttribute("disabled", true);
            o.value = "重新发送(" + wait + ")";
            wait--;
            setTimeout(function () {
                time(o)
            },
			1000)
        }
    }
    document.getElementById("btn").onclick = function () { time(this); }
</script>