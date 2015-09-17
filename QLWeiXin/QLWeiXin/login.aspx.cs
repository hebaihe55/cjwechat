using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QLWeiXin.Code;

namespace QLWeiXin
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

           




        }

        protected void loginBt_Click(object sender, EventArgs e)
        {
            string loginUrl = "http://120.27.45.83:8085/api/User/login";

            string loginpara = "phone=" + this.username.Text.ToString() + "&password=" + this.pass.Text.ToString().Trim();

            resp resplogin = new resp();


           


                resplogin = QLWeiXin.Code.Util.GetResp(loginUrl, loginpara);
                if (resplogin.code == 1000)
                {

          userInfo user= JsonHelper.DeserializeJsonToObject<userInfo>(resplogin.data.ToString());


                user.pwd = this.pass.Text.Trim();

                Session["userInfo"] = user;


                if (Request.QueryString["url"] == null)
                {
                    Response.Redirect("index.aspx");
                }
                else
                {
                    Response.Redirect(Request.QueryString["url"].ToString());
                    
                }
            }
            else
            {
                Response.Write("<script>alert('登陆失败')</script>");
            }
        }

        protected void regBt_Click(object sender, EventArgs e)
        {
            Response.Redirect("registA.aspx");
        }
    }
}