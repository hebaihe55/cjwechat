using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QLWeiXin.Code;


namespace QLWeiXin.lsjyWeb
{
    public partial class OrderDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userInfo"] == null)
            {


                Response.Redirect("../login.aspx");
            }


            if (Session["userInfo"] == null)
            {


                Response.Redirect("../login.aspx");
            }

            if (!IsPostBack)
            {

                GetOrderDetail();
            
            }


        }


        private void GetOrderDetail()
        {

       orderInfoDetail oid=  JsonHelper.DeserializeJsonToObject<orderInfoDetail>(  Util.GetOrderDetail(Request.QueryString["oid"].ToString()));

       this.order_code.Text = oid.order_code;

       this.createDate.Text = oid.createDate;

       this.pay_type.Text = oid.pay_type;

       this.pay_status.Text = oid.pay_status;

       this.price.Text = oid.price;

       this.DeliveryTime.Text = oid.DeliveryTime;

       this.ExtractingShopName.Text = oid.ExtractingShopName;

       this.ExtractingShopAddress.Text = oid.ExtractingShopAddress;
   
            
        this.Repeater1.DataSource=    JsonHelper.DeserializeJsonToList<goods_list>(oid.goods_list.ToString());
        this.DataBind();

        
        }


    }
}