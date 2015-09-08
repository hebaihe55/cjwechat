using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QLWeiXin.Code;

namespace QLWeiXin.lsjyWeb
{
    public partial class balance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userInfo"] == null)
            {


                Response.Redirect("login.aspx");
            }

        }


        private void setAddress()
        {


            string url = "http://120.27.45.83:8082/api/Mall/getDefaultAddress";

            string para = "user_id=" + Request.QueryString["aid"].ToString();

            resp resp = new resp();


            resp = QLWeiXin.Code.Util.GetResp(url, para);

            userAddress user = JsonHelper.DeserializeJsonToObject<userAddress>(resp.data.ToString());

            this.name.Text = user.name;

            this.mobile.Text = user.phone;

           

            this.address.Text = user.area+user.address;

            this.hf1.Value = user.id;

 


        }


    }
}