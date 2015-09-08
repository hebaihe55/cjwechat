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

               
                
           



            }
        }


        private void bindRP3()
        {
           List< shpCarList> shc = listCart();

            
           this.Repeater3.DataSource = shc;

            this.Repeater3.DataBind();

            int count = 0;

            float total = 0.00F;
            foreach (shpCarList sp in listCart())
            {
                count += sp.num;
                total += float.Parse((sp.price * sp.num).ToString());
            }


            this.go_sale_img_1_label.Text = count.ToString();

            Label2.Text = total.ToString();
            Label3.Text = total.ToString();


            if (count > 0)
            {
                ImageButton5.ImageUrl = "~/lsjyWeb/img/anniu_11.png";
                ImageButton6.ImageUrl = "~/lsjyWeb/img/anniu_11.png";
                ImageButton5.Enabled = true;
                ImageButton6.Enabled = true;
            }
            else
            {
                ImageButton5.ImageUrl = "~/lsjyWeb/img/anniu_gray.png";
                ImageButton6.ImageUrl = "~/lsjyWeb/img/anniu_gray.png";

                ImageButton5.Enabled = false;
                ImageButton6.Enabled = false;
            }

        }






        










        private void bindRP1()
        {
            

            string url = "http://120.27.45.83:8082/api/Mall/GetCategory";

            string para = "user_id=0";


            resp resp = new resp();


            resp = QLWeiXin.Code.Util.GetResp(url, para);


            List<categoryList> categorylist = JsonHelper.DeserializeJsonToList<categoryList>(JsonHelper.DeserializeJsonToObject<categoryInfo>(resp.data.ToString()).categoryList.ToString());

            this .acid.Value = categorylist[0].Id;


            if (resp.code == 1000)
            {


                this.Repeater1.DataSource = categorylist;

                this.Repeater1.DataBind();
            }

        }

        protected void Repeater2_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            
        }

        protected void Repeater2_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string goodId = e.CommandArgument.ToString();

            string modth = e.CommandName.ToString();

            HiddenField hf = (HiddenField)e.Item.FindControl("HiddenField1");

            int maxNum = int.Parse(hf.Value);

            userInfo uInfo = new userInfo();

            uInfo = (userInfo)Session["userInfo"];

            string uid = uInfo.id;

            if (modth == "addCar")
            {
                AddCar(goodId, uid, 1);
            }
            else
            {
                EditCar(goodId, uid, 1);
            }

            bindRP3();
        }


        private void AddCar(string goodid, string userid, int num)
        {
            string url = "http://120.27.45.83:8082/api/Mall/AddGoodsToCart";
         


         


            string para = "goods_id=" + goodid + "&user_id=" + userid + "&goods_num="+num.ToString();

            resp resp = new resp();


            resp = QLWeiXin.Code.Util.GetResp(url, para);

        }


   

        private List<shpCarList> listCart()
        {
            string url = "http://120.27.45.83:8082/api/Mall/showCart";



            userInfo uInfo = new userInfo();

            uInfo = (userInfo)Session["userInfo"];

            string uid = uInfo.id;


            string para = "user_id=" + uid ;

            resp resp = new resp();


            resp = QLWeiXin.Code.Util.GetResp(url, para);

            return JsonHelper.DeserializeJsonToList<shpCarList>(resp.data.ToString());

        }


        private void EditCar(string goodid, string userid, int num)
        {
            string url = "http://120.27.45.83:8082/api/Mall/editCart";






            string para = "user_id=" + userid + "&goods_id_list=" + goodid + "&goods_num_list=" + num.ToString();

            resp resp = new resp();


            resp = QLWeiXin.Code.Util.GetResp(url, para);

        }

        protected void Repeater3_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string goodId = e.CommandArgument.ToString();

            string modth = e.CommandName.ToString();

            Label hf = (Label)e.Item.FindControl("Label4");

            int Num = int.Parse(hf.Text);

            userInfo uInfo = new userInfo();

            uInfo = (userInfo)Session["userInfo"];

            string uid = uInfo.id;

            if (modth == "addCar1")
            {
                AddCar(goodId, uid, 1);
            }
            else
            {
                EditCar(goodId, uid, Num-1);
            }

            bindRP3();
        }

        protected void ImageButton5_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("balance.aspx");
        }

    }
}