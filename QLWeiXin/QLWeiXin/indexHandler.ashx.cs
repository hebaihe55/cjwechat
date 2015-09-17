using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using QLWeiXin.Code;

namespace QLWeiXin
{
    /// <summary>
    /// indexHandler 的摘要说明
    /// </summary>
    public class indexHandler : IHttpHandler
    {
        //表一
        public List<productList> p1 = null;
        //表二
        public List<productList> p2 = null;
        //表三
        public List<productList> p3 = null;
        //表四
        public List<productList> p4 = null;
        public void ProcessRequest(HttpContext context)
        {
            if (context.Request.QueryString["id"].ToString() == "1")
            {
                p1 = bindRP2("34");
                context.Response.ContentType = "text/plain";
                context.Response.Write(p1);
            }
            else if (context.Request.QueryString["id"].ToString() == "2")
            {
                p2 = bindRP2("31");
                context.Response.ContentType = "text/plain";
                context.Response.Write(p2);
            }
            else if (context.Request.QueryString["id"].ToString() == "3")
            {
                p2 = bindRP2("18");
                context.Response.ContentType = "text/plain";
                context.Response.Write(p3);
            }
            else if (context.Request.QueryString["id"].ToString() == "4")
            {
                p2 = bindRP2("32");
                context.Response.ContentType = "text/plain";
                context.Response.Write(p4);
            }
        }



        protected List<productList> bindRP2(string cid)
        {


            string url = "http://120.27.45.83:8082/api/Mall/GetGoodsListByCategory";

            string para = "start=0&limit=100&type=" + cid;




            resp resp = new resp();


            resp = QLWeiXin.Code.Util.GetResp(url, para);


            return JsonHelper.DeserializeJsonToList<productList>(JsonHelper.DeserializeJsonToObject<productInfo>(resp.data.ToString()).list.ToString());





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