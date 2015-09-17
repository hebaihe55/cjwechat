using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace QLWeiXin.lsjyWeb
{
    public partial class selectAddress : System.Web.UI.Page
    {
        public DataTable shopAll;
        public DataTable shopOnce;
        protected void Page_Load(object sender, EventArgs e)
        {
            string shop_name = "";
            string address_info = "";
            //Get提交查询就近门店信息展示出


            if (Request.QueryString["shop_name"] != null)
            {
                shop_name = Request.QueryString["shop_name"].ToString();
            }
            if (Request.QueryString["shop_name"] != null)
            {
                address_info = Request.QueryString["address_info"].ToString();
            }
             
            this.shopName.Text = shop_name;
            this.shopAddress.Text = address_info;
            //post提交查询所有门店信息展示出
            string jsonPost = publicClass.RequestUrl("http://120.27.45.83:8082/api/mall/GetStorelbs", "Require_data=0");
            shopAll = publicClass.JsonToDataTable(jsonPost);
        }
    }
}