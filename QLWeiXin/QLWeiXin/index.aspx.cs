using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QLWeiXin.Code;

namespace QLWeiXin
{
    public partial class index : System.Web.UI.Page
    {
        //表一
        public List<productList> p1 = null;

        //表二
        public List<productList> p2 = null;
        //表三
        public List<productList> p3 = null;
        //表四
        public List<productList> p4 = null;
        private string cid = "";

        public string userid;
        protected void Page_Load(object sender, EventArgs e)
        {
           
         

            if (!IsPostBack)
            {
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

                if (Request.QueryString["addr"] != null)
                {
                    this.addr1.Value = Request.QueryString["addr"].ToString();
                }

                bindRP1();




        



            }


            p1 = bindRP2("34");
            p2 = bindRP2("31");
            p3 = bindRP2("18");
            p4 = bindRP2("32");

        }


        protected List<productList> bindRP2(string cid)
        {


            string url = "http://120.27.45.83:8085/api/Mall/GetGoodsListByCategory";

            string para = "start=0&limit=100&type=" + cid;




            resp resp = new resp();


            resp = QLWeiXin.Code.Util.GetResp(url, para);


            return JsonHelper.DeserializeJsonToList<productList>(JsonHelper.DeserializeJsonToObject<productInfo>(resp.data.ToString()).list.ToString());





        }
























        private void bindRP1()
        {


            string url = "http://120.27.45.83:8085/api/Mall/GetCategory";

            string para = "user_id=0";


            resp resp = new resp();


            resp = QLWeiXin.Code.Util.GetResp(url, para);


            List<categoryList> categorylist = JsonHelper.DeserializeJsonToList<categoryList>(JsonHelper.DeserializeJsonToObject<categoryInfo>(resp.data.ToString()).categoryList.ToString());

            this.acid.Value = categorylist[0].Id;


            if (resp.code == 1000)
            {


                this.Repeater1.DataSource = categorylist;

                this.Repeater1.DataBind();
            }

        }

     



       


       

    }
}