using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QLWeiXin.Code;

namespace QLWeiXin.lsjyWeb
{
    public partial class index : System.Web.UI.Page
    {

        private string cid = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userInfo"] == null)
            {


                Response.Redirect("login.aspx");


            }
            if (Request.QueryString["Latitude"] != null)
            {
                this.nowLatitudes.Value = Request.QueryString["Latitude"].ToString();
            }
            if (Request.QueryString["Longitude"] != null)
            {
                this.nowLongitudes.Value = Request.QueryString["Longitude"].ToString();
            }
            if (Request.QueryString["shopName"] != null)
            {
                this.shop_name.Text = Request.QueryString["shopName"].ToString();
            }

            if (!IsPostBack)
            {

                bindRP1();

                if (Request.QueryString["cid"] != null)
                {

                    cid = Request.QueryString["cid"].ToString();

                   
                }
                bindRP2(cid);
            }
        }
        private void bindRP2(string cid)
        {


            string url = "http://120.27.45.83:8082/api/Mall/GetGoodsListByCategory";

            string para = "start=0&limit=100&type="+cid;


            resp resp = new resp();


            resp = QLWeiXin.Code.Util.GetResp(url, para);


            List<productList> productlist = JsonHelper.DeserializeJsonToList<productList>(JsonHelper.DeserializeJsonToObject<productInfo>(resp.data.ToString()).list.ToString());

       


            if (resp.code == 1000)
            {


                this.Repeater2.DataSource = productlist;

                this.Repeater2.DataBind();
            }

        }

        private void bindRP1()
        {
            

            string url = "http://120.27.45.83:8082/api/Mall/GetCategory";

            string para = "user_id=0";


            resp resp = new resp();


            resp = QLWeiXin.Code.Util.GetResp(url, para);


            List<categoryList> categorylist = JsonHelper.DeserializeJsonToList<categoryList>(JsonHelper.DeserializeJsonToObject<categoryInfo>(resp.data.ToString()).categoryList.ToString());

            cid = categorylist[0].Id;


            if (resp.code == 1000)
            {


                this.Repeater1.DataSource = categorylist;

                this.Repeater1.DataBind();
            }

        }

    }
}