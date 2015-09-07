using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QLWeiXin.sms;

namespace QLWeiXin.lsjyWeb
{
    public partial class updatePass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userInfo"] == null)
            {


                Response.Redirect("login.aspx");
            }
        }

   

        protected void reg_send_submit_Click1(object sender, System.EventArgs e)
        {
            string mobile = this.cell_txt.Value;

            //验证码
            Session["code1"] = DateTime.Now.Millisecond.ToString();
            //验证码时间
            Session["codetime1"] = DateTime.Now.ToString();

            CCPRestSDK api = new CCPRestSDK();

            bool isInit = api.init("app.cloopen.com", "8883");
            api.setAccount("8a48b5514f73ea32014f848582a61f2d", "42d2934251534741ab39067f67645812");
            api.setAppId("8a48b5514f73ea32014f84882bd81f2f");

            string[] data = { Session["code1"].ToString(), "5" };

            if (isInit)
            {
                api.SendTemplateSMS(mobile, "34439", data);

            }




            Response.Redirect("updatePassB.aspx?mobile=" + mobile);
        }
    }
}