using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Net;
using System.Text;
using System.Data;
using System.Text.RegularExpressions;
using Newtonsoft.Json;
using System.Web.Script.Serialization;
using Newtonsoft.Json.Linq;

namespace QLWeiXin.lsjyWeb.js
{
    public class baidu
    {
        public string status { get; set; }
        public string total { get; set; }
        public string size { get; set; }
        public object contents { get; set; }
    }

    public class content
    {
        public string tags { get; set; }
        public string uid { get; set; }
        public string province { get; set; }
        public string geotable_id { get; set; }
        public string modify_time { get; set; }
        public string district { get; set; }
        public string create_time { get; set; }
        public string city { get; set; }
        public string[] location { get; set; }
        public string mch_id { get; set; }
        public string address { get; set; }
        public string title { get; set; }
        public string coord_type { get; set; }
        public string type { get; set; }
        public string distance { get; set; }
        public string weight { get; set; }

    }
    /// <summary>
    /// pos 的摘要说明
    /// </summary>
    public class pos : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string Latitude = context.Request.QueryString["Latitude"].ToString();//纬度
            string Longitude = context.Request.QueryString["Longitude"].ToString();//经度
            //请求、处理返回的JSON数据 并且输出
            string BaidujsonGet = publicClass.requestGet("http://api.map.baidu.com/geosearch/v3/nearby?ak=wZPaui15nEeP3nDlFTaBckSl&geotable_id=111944&location=" + Longitude + "," + Latitude + "&radius=2000000&sortby=distance:1");
            baidu db = new baidu();
            db = JsonHelper.DeserializeJsonToObject<baidu>(BaidujsonGet);


            List<content> userAddresss = JsonHelper.DeserializeJsonToList<content>(db.contents.ToString());

            string shopName = userAddresss[0].title;
            string shopAddress = userAddresss[0].address;


            context.Response.ContentType = "text/plain";
            //把门店地址和详情地址拼接到下面 用，隔开
            context.Response.Write(shopName + "," + shopAddress);

            
            //context.Response.Write("123");
        }

        
        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}