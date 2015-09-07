using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QLWeiXin.Code;

namespace QLWeiXin.lsjyWeb
{
    public partial class addressManage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userInfo"] == null)
            {


                Response.Redirect("login.aspx");

                
            }


            if (!IsPostBack)
            {
                bindRP();
            
            }
        }

        protected void manage_submit_Click(object sender, EventArgs e)
        {
            Response.Redirect("newAddress.aspx");
        }




        private void bindRP()
        {
            userInfo uInfo = new userInfo();


            uInfo = (userInfo)Session["userInfo"];

            string uid = uInfo.id;

            string url = "http://120.27.45.83:8082/api/Mall/getAddressList";

            string para = "user_id=" + uid ;


            resp resp = new resp();


            resp = QLWeiXin.Code.Util.GetResp(url, para);

            if (resp.code == 1000)
            {
                List<userAddress> userAddresss = JsonHelper.DeserializeJsonToList<userAddress>(resp.data.ToString());

                this.Repeater1.DataSource = userAddresss;

                this.Repeater1.DataBind();
            }
        
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string addressid = e.CommandArgument.ToString();

            Response.Redirect("updateAddress.aspx?aid="+addressid);
        }
    }
}