using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QLWeiXin.Code;





namespace QLWeiXin.lsjyWeb
{
    public partial class myOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userInfo"] == null)
            {


                Response.Redirect("../login.aspx");
            }


            if (!IsPostBack)
            {
                BindRepeater1();
            }

        }



       



        private void BindRepeater1 ()
        {
            string url = "http://120.27.45.83:8085/api/Mall/GetUserOrderList";



            userInfo uInfo = new userInfo();

            uInfo = (userInfo)Session["userInfo"];

            string uid = uInfo.id;


            string para = "user_id=" + uid + "&type=0&start=0&limit=100";

            resp resp = new resp();


            resp = QLWeiXin.Code.Util.GetResp(url, para);

            this.Repeater1.DataSource = JsonHelper.DeserializeJsonToList<orderInfo>(JsonHelper.DeserializeJsonToObject < orderInfo1 > (resp.data.ToString()).list.ToString());

            this.Repeater1.DataBind();

        }
       public string  getOrderStatusImg(string orderstatus)
        {
            string img="";
            switch(orderstatus)
            {
                case"已完成": img="img/efg_10.png";
                    break;

                default: img = "img/cn.png";
                    break;
            
            
            }
        
        return img;
        }


       public bool isDisply(string orderstatus)
       {

           if (orderstatus == "已完成" || orderstatus == "待付款")
           {
               return false;
           }
           return true;
           
       }

       public bool isDisply1(string orderstatus)
       {

           if ( orderstatus == "待付款")
           {
               return true;
           }
           return false;

       }

        public string getorderNum(string goods)
        {
            List<goods_list> g = JsonHelper.DeserializeJsonToList<goods_list>(goods);

            int num = 0;

            foreach (goods_list good in g)
            {

                num += int.Parse(good.num);
            }

            return num.ToString();
        
        
        
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string commdName = e.CommandName.ToString();

            string oid = e.CommandArgument.ToString();

            switch (commdName)
            {
                case "deleteOrder": deleteOrder(oid);
                    break;

                case "okOrder": EditOrderShippingStatus(oid);
                    break;
                default:
                    break;
            
            }
            
        }

        private void EditOrderShippingStatus(string orid)
        {
            if (Util.EditOrderShippingStatus(orid) == "1000")
            {

                Response.Write("<script>alert('确认收货成功！');</script>");
                BindRepeater1();

            }
            else
            {

                Response.Write("<script>alert('确认收货失败！');</script>");
                BindRepeater1();
            }
        
        }


        private void deleteOrder(string orid)
        {
            if (Util.CancelOrder(orid) == "1000")
            {

                Response.Write("<script>alert('删除订单成功！');</script>");
                BindRepeater1();

            }
            else
            {

                Response.Write("<script>alert('删除订单失败！');</script>");
                BindRepeater1();
            }
        
        }


    }
}