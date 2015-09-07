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
    public partial class updatePassB : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userInfo"] == null)
            {


                Response.Redirect("login.aspx");
            }
        }

        protected void regBt_Click(object sender, EventArgs e)
        {




            if (DateTime.Parse(Session["codetime1"].ToString()).AddSeconds(120) > DateTime.Now)
            {
                string mobilecode = this.code.Text.ToString().Trim();

                string pwd = this.pwd.Text.ToString().Trim();

                string repwd = this.repwd.Text.ToString().Trim();


                if (mobilecode != Session["code1"].ToString())
                {
                    Response.Write("<script>alert('验证码错误')</script>");
                    return;
                }

                userInfo uInfo = new userInfo();

                uInfo = (userInfo)Session["userInfo"];
                string uid = uInfo.id;

                string name = this.code.Text;

                string passwrod = this.pwd.Text;


                string url = "http://120.27.45.83:8082/api/User/UpdatePwd";

                string para = "user_id=" + uid + "&oldpassword=" + uInfo.pwd + "&password  =" + passwrod;

                resp resp = new resp();


                resp = QLWeiXin.Code.Util.GetResp(url, para);

                if (resp.code == 1000)
                {

                    Response.Write("<script>alert('修改密码成功')</script>");
                }
                else
                {
                    Response.Write("<script>alert('修改密码失败')</script>");

                }
            }
            else
            {

                Response.Write("<script>alert('验证码超时')</script>");
            }

        }

        protected void repeatBt_Click(object sender, EventArgs e)
        {
            Session.Remove("code1");

            Session.Remove("codetime1");
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
                api.SendTemplateSMS(Request.QueryString["mobile"].ToString(), "34439", data);

            }
        }
    }
}