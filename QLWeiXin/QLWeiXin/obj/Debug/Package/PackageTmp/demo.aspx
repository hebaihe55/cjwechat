<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="demo.aspx.cs" Inherits="QLWeiXin.demo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script>
        function aa(obj) {
            obj.parentElement.children[1].style.display = 'none';
            
        }
    
    </script>
</head>
<body onload="loaded()">
    <form id="form1" runat="server">
    <div id="gg">
        <div id="bb">
            asdasd
        </div>
        <div id="aa">
            asd
        </div>
        <div id="cc" onclick="aa(this)">
            dfgdfg
        </div>
    </div>
    </form>
</body>
</html>
