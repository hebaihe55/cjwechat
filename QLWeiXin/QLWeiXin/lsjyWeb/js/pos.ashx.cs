using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace QLWeiXin.lsjyWeb.js
{
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
            BaidujsonGet = BaidujsonGet.Replace(" ", "");
            BaidujsonGet = BaidujsonGet.Replace("{", "*");
            BaidujsonGet = BaidujsonGet.Replace(",", "*");
            BaidujsonGet = BaidujsonGet.Replace("}", "*");
            BaidujsonGet = BaidujsonGet.Replace("[", "*");
            BaidujsonGet = BaidujsonGet.Replace("]", "*");
            BaidujsonGet = BaidujsonGet.Replace(":", "*");
            BaidujsonGet = BaidujsonGet.Replace("\"", "*");
            BaidujsonGet = BaidujsonGet.Replace("***", "*");
            BaidujsonGet = BaidujsonGet.Replace("**", "*");
            string[] BaiduJsonGet = BaidujsonGet.Split('*');
            context.Response.ContentType = "text/plain";
            context.Response.Write(BaiduJsonGet[31].ToString() + "," + BaiduJsonGet[29].ToString());

            
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