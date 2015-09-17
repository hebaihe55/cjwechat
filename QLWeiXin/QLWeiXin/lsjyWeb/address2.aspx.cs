using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QLWeiXin.Code;

namespace QLWeiXin.lsjyWeb
{
    public partial class address2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["userInfo"] == null)
            //{


            //    Response.Redirect("../login.aspx");


            //}


            if (!IsPostBack)
            {
                bindRP();

            }
        }

        private void bindRP()
        {
            userInfo uInfo = new userInfo();


            uInfo = (userInfo)Session["userInfo"];

            string uid = uInfo.addr;

            string url = "http://120.27.45.83:8082/api/Mall/LBSAddressPost";

            string para = "address=" +uid;


            resp resp = new resp();


            resp = QLWeiXin.Code.Util.GetResp(url, para);

            if (resp.code == 1000)
            {
                List<ShopArea> shopArea2 = JsonHelper.DeserializeJsonToList<ShopArea>(JsonHelper.DeserializeJsonToObject<ShopArea1>(resp.data.ToString()).list.ToString());

                this.Repeater1.DataSource = shopArea2;

                this.Repeater1.DataBind();
            }

        }
    }
}