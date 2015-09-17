<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="QLWeiXin.lsjyWeb.index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="/lsjyWeb/css/index.css" rel="stylesheet" type="text/css" />
    <script src="/lsjyWeb/js/suit.js" type="text/javascript"></script>


  
    <title>绿色家园</title>
 

</head>
<body >
    <form id="form1" runat="server">



  
    <div class="bodys" align="center">
        <div class="backgrounds" align="center">
            <!-----------------------------------页头（定位）---------------------------------------->
            <div id="map">
                <div id="address">
                 
               
                    <asp:HiddenField ID="geoid" runat="server" />
                 
                    <asp:HiddenField ID="maich" runat="server" />
                     <asp:HiddenField ID="userid" runat="server" />
                    <img src="img/arrow.png" />
                    
                    
                    </div>
                <div id="logon_ico">
                 <a href="personalCenter.aspx">  <img src="img/login_ico.png" /></a> 
                </div>
            </div>
            <!-----------------------------------页中左边（菜单、展示窗）---------------------------------------->
            <div id="content">
                <div id="menu">
                    <asp:Repeater ID="Repeater1" runat="server" 
                        onitemcommand="Repeater1_ItemCommand">
               <ItemTemplate>
                    <div class="menu_once" id="menu_<%# Container.ItemIndex + 1%>" >
                     <a  href="javascript:void(0)" onclick='subgo(<%#Eval("id") %>)'><%#Eval("name") %></a>  </div>
                        </ItemTemplate>
     </asp:Repeater>

                   
                </div>
                <!-----------------------------------页中右边菜单一的内容---------------------------------------->
                <div id="product">
                   
                            







                          
               
                </div>
                <!-----------------------------------页尾（购买状态）---------------------------------------->
           
                
                <!--小苹果-->
         
         
              
            </div>
        </div>
    </div>
    </form>
</body>
</html>
