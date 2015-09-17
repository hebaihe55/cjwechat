using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace QLWeiXin.Code
{
    public class Util: System.Web.UI.Page
    {



        public Util()
        { 
        
        }

        public static resp GetResp(string url,string paras)
        {

           
            return JsonHelper.DeserializeJsonToObject<resp>(publicClass.RequestUrl(url, paras));

       
        }

        public static string GetOrderDetail(string orderid)
        {

            string url = "http://120.27.45.83:8085/api/Mall/GetOrderDetail";

            string para = "order_id=" + orderid;

            resp resp = new resp();


            resp = QLWeiXin.Code.Util.GetResp(url, para);

            return resp.data.ToString();

        }



        public static string EditOrderShippingStatus(string orderid)
        {

            string url = "http://120.27.45.83:8085/api/Mall/EditOrderShippingStatus";

            string para = "order_id=" + orderid;

            resp resp = new resp();


            resp = QLWeiXin.Code.Util.GetResp(url, para);

            return resp.code.ToString();

        }



        public static string CancelOrder(string orderid)
        {

            string url = "http://120.27.45.83:8085/api/Mall/CancelOrder";

            string para = "order_id=" + orderid;

            resp resp = new resp();


            resp = QLWeiXin.Code.Util.GetResp(url, para);

            return resp.code.ToString();

        }





        public static string WxPay(string Orderno)
        {

            string url = "http://120.27.45.83:8085/api/User/WxPay";

            string para = "Orderno=" + Orderno ;

            resp resp = new resp();


            resp = QLWeiXin.Code.Util.GetResp(url, para);

            return resp.data.ToString();

        }





        public static  string  getorderid(string uid,string orid)
        {
            string url = "http://120.27.45.83:8085/api/Mall/GetUserOrderList";


            string ordercode = "";


            string para = "user_id=" + uid + "&type=0&start=0&limit=100";

            resp resp = new resp();


            resp = QLWeiXin.Code.Util.GetResp(url, para);

            resp resp1 = JsonHelper.DeserializeJsonToObject<resp>(resp.data.ToString());
            List<orderInfo> orders=JsonHelper.DeserializeJsonToList<orderInfo>(resp1.list.ToString());

            foreach (orderInfo oi in orders)

            {
                if (oi.order_id == orid)
                {

                    ordercode= oi.order_code;

                    break;
                }
            
            
            
            }

            return ordercode;

         

        }


        public static List<ShopArea3> GetArea()
        {
            string url = "http://120.27.45.83:8085/api/Mall/LBSGetExtractingShopArea";






            string para = "address=上海";

            resp resp = new resp();


             List<ShopArea3> sa3 = JsonHelper.DeserializeJsonToList<ShopArea3>(Util.GetResp(url, para).data.ToString());

             return sa3;

        }



        protected void AddCar()
        {
            string url = "http://120.27.45.83:8085/api/Mall/AddGoodsToCart";






            string para = "goods_id=" + Request.Form["id"].ToString() + "&user_id=" + Request.Form["userid"].ToString() + "&goods_num=1";

            resp resp = new resp();


            resp = QLWeiXin.Code.Util.GetResp(url, para);

        }



        public static string createOrder(string userid, string addrid, string storeid, string pay_type, string postprice, string post_type, string goods_id, string goods_num, string ordernote, string deleveryTime, string shopid)
        {

            string url = "http://120.27.45.83:8085/api/Mall/createOrder";

            string para = "user_id=" + userid + "&addressId=" + addrid + "&storeid=" + storeid + "&pay_type=" + pay_type + "&postprice=" + postprice + "&post_type=" + post_type + "&goods_id_list=" + goods_id + "&goods_num_list=" + goods_num + "&ordernote=" + ordernote + "&DeliveryTime=" + deleveryTime + "&ExtractingShopId=" + shopid;

            resp resp = new resp();


            resp = QLWeiXin.Code.Util.GetResp(url, para);

            if (resp.code == 0)
            {

                return "0";
            }


            return resp.data.ToString();
        
        }


        public static string clearCart(string uid)
        {
            string url = "http://120.27.45.83:8085/api/Mall/DelAllGoodsToCart";






            string para = "user_id=" + uid;

            resp resp = new resp();


            resp = QLWeiXin.Code.Util.GetResp(url, para);

            return resp.code.ToString();

        }





        public static string  listCart(string uid)
        {
            string url = "http://120.27.45.83:8085/api/Mall/showCart";



                


            string para = "user_id=" + uid;

            resp resp = new resp();


            resp = QLWeiXin.Code.Util.GetResp(url, para);

            return resp.data.ToString();

        }


     
    }


    public class storeInfo
    {
        public string Mch_id { get; set; }
        public string title { get; set; }
 
        public string url { get; set; }
        public string SslEnable { get; set; }
        public string secureurl { get; set; }
        public string hosts { get; set; }
        public string displayorder { get; set; }
        public string address { get; set; }
        public string longitude { get; set; }
        public string lotitude { get; set; }
    }


    public class chatPay {
        public string appid { get; set; }
        public string mch_id { get; set; }
        public string nonce_str { get; set; }
        public string prepay_id { get; set; }
        public string timeStamp { get; set; }
        public string sign { get; set; }
    
    
    
    }



    public class resp
    {
        public int code { get; set; }
        public string msg { get; set; }
        public string time { get; set; }
        public object data { get; set; }
        public object list { get; set; }
    }


    public class ShopArea 
    {

        public string uid { get; set; }

        public string province { get; set; }

        public string geotable_id { get; set; }
        public string district { get; set; }
        public string create_time { get; set; }
        public string city { get; set; }
        public string mch_id { get; set; }
        public string address { get; set; }
        public string title { get; set; }
        public string coord_type { get; set; }

        public string type { get; set; }
        public string distance { get; set; }
        public string weight { get; set; }

       
   

    
    
    }

    public class ShopArea3
    {

        public string totalNum { get; set; }

        public object Shoplist { get; set; }

    }



    public class ShopArea1 {

        public string totalNum { get; set; }

        public object list { get; set; }
    
    }


    public class ShopArea2
    {

        public string Area { get; set; }

        public object list { get; set; }
    
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
        public string addr { get; set; }

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

    public class goods_list
    {
        public string id { get; set; }
        public string name { get; set; }
        public string img { get; set; }
        public string num { get; set; }
        public string price { get; set; }
        public string integral { get; set; }
        public string goodstype { get; set; }
        public string trade_price { get; set; }
        public string IsReview { get; set; }
        public string order_code { get; set; }

    }

    public class orderInfoDetail
    {
        public string order_id { get; set; }
        public string order_code { get; set; }
        public object goods_list { get; set; }
        public string price { get; set; }
        public string user_id { get; set; }
        public string pay_type { get; set; }
        public string pay_status { get; set; }
        public string postprice { get; set; }
        public string Address { get; set; }
        public string post_type { get; set; }
        public string orderstatus { get; set; }
        public string img { get; set; }
        public string createDate { get; set; }
        public string userAddressmessage { get; set; }
        public string DeliveryTime { get; set; }
        public string ExtractingShopName { get; set; }
        public string ExtractingShopAddress { get; set; }



    
    
    }

    public class orderInfo
    {
        public string order_id { get; set; }
        public string order_code { get; set; }
        public object goods_list { get; set; }
        public string price { get; set; }
        public string orderstatus { get; set; }
        public string img { get; set; }
        public string createDate { get; set; }
        public string Pay_type { get; set; }
        public string Name { get; set; }
        public string DeliveryTime { get; set; }
        
    
    }

      public class orderInfo1
      {
      public string start { get; set; }
            public string limit { get; set; }
      
            public string totalNum { get; set; }
      
            public object  list { get; set; }
      
      
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