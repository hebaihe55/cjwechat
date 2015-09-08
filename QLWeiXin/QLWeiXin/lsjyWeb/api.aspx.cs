using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QLWeiXin.Code;

namespace QLWeiXin.lsjyWeb
{
    public partial class api : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
                if (Request.Form["action"].ToString() == "IsUserValidatePhone")
                {
                    Response.Write(GetIsUserValidatePhone(Request.Form["Phone"].ToString()));

                }
                else if (Request.Form["action"].ToString() == "GetGoodsListByCategory")
                {
                    GetGoodsListByCategory();
                }
            
        }

        protected void GetGoodsListByCategory()
        {


            string url = "http://120.27.45.83:8082/api/Mall/GetGoodsListByCategory";

            string para = "start=0&limit=100&type=" + Request.Form["cid"].ToString();




            resp resp = new resp();


            resp = QLWeiXin.Code.Util.GetResp(url, para);


            Response.Write( resp.data.ToString());




          

        }






        public string GetIsUserValidatePhone(string mobile)
        {

            string url = "http://120.27.45.83:8082/api/User/ValidatePhone";

           



            string paras = "Phone=" + mobile ;

         return   publicClass.RequestUrl(url, paras);
        }
    }
}