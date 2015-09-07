using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using QLWeiXin.Code;
using QLWeiXin.sms;

namespace QLWeiXin.lsjyWeb
{
    public partial class registB : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            mobile = Request.QueryString["mobile"].ToString();


        }
        string mobile = "";
        protected void regBt_Click(object sender, EventArgs e)
        {

            if (DateTime.Parse(Session["codetime"].ToString()).AddSeconds(120) > DateTime.Now)
            {
                string  mobilecode=this.code.Text.ToString().Trim();

                string pwd = this.pwd.Text.ToString().Trim();

                string repwd = this.repwd.Text.ToString().Trim();


                if (mobilecode != Session["code"].ToString())
                {
                    Response.Write("<script>验证码错误</script>");
                    return;
                }


                if (pwd != repwd)
                {
                    Response.Write("<script>密码不一致</script>");
                    return;
                }


                string url = "http://120.27.45.83:8082/api/User/RegisterOne";

               

                string name = mobile;

               

                string paras = "nickname=" + name + "&password=" + pwd + "&confirm_password=" + pwd + "&phone=" + mobile;

                var tempEntity = new { code = string.Empty, msg = string.Empty, time = string.Empty };
                JsonHelper.SerializeObject(tempEntity);
                //json5 : {"ID":0,"Name":""}
                tempEntity = JsonHelper.DeserializeAnonymousType(publicClass.RequestUrl(url, paras), tempEntity);

                if (tempEntity.code == "1000")
                {
                 
                    //登陆
                    
                    string loginUrl = "http://120.27.45.83:8082/api/User/login";

                    string loginpara = "phone=" + mobile + "&password="+this.pwd.Text.ToString().Trim();

                    resp resplogin=new resp();


                    resplogin = QLWeiXin.Code.Util.GetResp(loginUrl, loginpara);

               userInfo user= JsonHelper.DeserializeJsonToObject< userInfo>(resplogin.data.ToString());


               user.pwd = this.pwd.Text.Trim();

               Session["userInfo"] = user;



                    Response.Write("<script>alert('注册成功')</script>");
                    Response.Redirect("index.aspx");
                }
                else
                {
                    Response.Write("<script>alert('注册失败')</script>");
                }

            }
            else
            {

                Response.Write("<script>alert('验证码超时')</script>");
            }

        }

        protected void repeatBt_Click(object sender, EventArgs e)
        {
            Session.Remove("code");

            Session.Remove("codetime");
            //验证码
            Session["code"] = DateTime.Now.Millisecond.ToString();
            //验证码时间
            Session["codetime"] = DateTime.Now.ToString();

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