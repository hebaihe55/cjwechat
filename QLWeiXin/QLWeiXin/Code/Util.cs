using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace QLWeiXin.Code
{
    public class Util
    {


        public static resp GetResp(string url,string paras)
        {

           
            return JsonHelper.DeserializeJsonToObject<resp>(publicClass.RequestUrl(url, paras));

       
        }




     
    }
    public class resp
    {
        public int code { get; set; }
        public string msg { get; set; }
        public string time { get; set; }
        public object data { get; set; }

    }

    public class userInfo
    {
        public string  id { get; set; }
        public string phone { get; set; }
        public string nickname { get; set; }
        public string password { get; set; }
        public string role_id { get; set; }
        public string head_img { get; set; }
        public string introduction { get; set; }
        public string email { get; set; }
        public string score { get; set; }
        public string pwd { get; set; }

    }
    public class categoryInfo
    {
        public string Total { get; set; }
        public object categoryList { get; set; }
    }

    public class productInfo
    {
        public int start { get; set; }
        public int limit { get; set; }
        public int totalNum { get; set; }
        public object list { get; set; }
    }
    public class shpCarList
    {

        public string id { get; set; }
        public int num { get; set; }

        public float price { get; set; }
        public string name { get; set; }
        public string img { get; set; }
        public string Integral { get; set; }


    }
    public class productList
    {
        public int id { get; set; }
        public string name { get; set; }
        public string  img { get; set; }
        public string price { get; set; }
        public string user_id { get; set; }
        public string vip_price1 { get; set; }
        public string vip_price2 { get; set; }
        public string vip_price3 { get; set; }
        public string originalprice { get; set; }
        public string avg_score { get; set; }
        public string  created_time { get; set; }
        public string comment_num { get; set; }
       public string like_num { get; set; }
        public string integral { get; set; }
        public string goodstype { get; set; }
        public string company_id { get; set; }
        public string company_name { get; set; }
        public string trade_price { get; set; }
        public string purchase_count { get; set; }
        public string	offtime { get; set; }
        public string Commentlist { get; set; }
        public string TJGoods_list { get; set; }
        public string AvailableEndDateTimeUtc { get; set; }
        public string serverTime { get; set; }
        public string OrderMinimumQuantity { get; set; }
      public string OrderMaximumQuantity { get; set; }
      public string	MaximumOrder { get; set; }
      public string	StockQuantity { get; set; }


    }

    public class categoryList
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string ShortDescription { get; set; }
        public string RestrictionType { get; set; }
        public string RestrictionInterval { get; set; }
        public string MaxinumOrder { get; set; }
        public string[] ChildCategoryList { get; set; }
    }


    public class userAddress
    {
        public string id { get; set; }
        public string user_id { get; set; }
        public string name { get; set; }
        public string address { get; set; }
        public string phone { get; set; }
        public string province { get; set; }
        public string city { get; set; }
        public string area { get; set; }
        public string postcode { get; set; }
        public string is_default { get; set; }
       

    }
}