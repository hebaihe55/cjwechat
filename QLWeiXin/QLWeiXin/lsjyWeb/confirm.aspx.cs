using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QLWeiXin.Code;

namespace QLWeiXin.lsjyWeb
{
    public partial class confirm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userInfo"] == null)
            {


                Response.Redirect("../login.aspx");
            }


            chatPay wx = JsonHelper.DeserializeJsonToObject<chatPay>(Util.WxPay(Request.QueryString["orderid"].ToString()));

            this.appid.Value = wx.appid;

            this.timeStamp.Value = wx.timeStamp;

            this.noncestr.Value = wx.nonce_str;

            this.prepay_id.Value = "prepay_id=" + wx.prepay_id;

            this.sign.Value = wx.sign;


        }
    }
}