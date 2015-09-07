using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QLWeiXin.Code;
using QLWeiXin.sms;
namespace QLWeiXin.lsjyWeb
{
    public partial class registA : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void reg_send_submit_Click(object sender, EventArgs e)
        {

              string mobile = this.cell_txt.Value;



              resp res = new resp();

              res = Util.GetResp("http://120.27.45.83:8082/api/User/ValidatePhone", "Phone=" + mobile);


              if (res.code == 1000)
              {



                  //验证码
                  Session["code"] = DateTime.Now.Millisecond.ToString();
                  //验证码时间
                  Session["codetime"] = DateTime.Now.ToString();

                  CCPRestSDK api = new CCPRestSDK();

                  bool isInit = api.init("app.cloopen.com", "8883");
                  api.setAccount("8a48b5514f73ea32014f848582a61f2d", "42d2934251534741ab39067f67645812");
                  api.setAppId("8a48b5514f73ea32014f84882bd81f2f");

                  string[] data = { Session["code"].ToString(), "5" };

                  if (isInit)
                  {
                      api.SendTemplateSMS(mobile, "34439", data);

                  }




                  Response.Redirect("registB.aspx?mobile=" + mobile );

              }
              else
              {

                  Response.Write("<script>alert('您的手机号已被注册过!')</script>");
              }
        }
    }
}