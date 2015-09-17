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
                else if (Request.Form["action"].ToString() == "addcar")
                {
                    AddCar();
                }
            
        }


        protected void AddCar()
        {
            string url = "http://120.27.45.83:8085/api/Mall/AddGoodsToCart";






            string para = "goods_id=" + Request.Form["id"].ToString() + "&user_id=" + Request.Form["userid"].ToString() + "&goods_num=1";

            resp resp = new resp();


            resp = QLWeiXin.Code.Util.GetResp(url, para);

        }




        protected void GetGoodsListByCategory()
        {


            string url = "http://120.27.45.83:8085/api/Mall/GetGoodsListByCategory";

            string para = "start=0&limit=100&type=" + Request.Form["cid"].ToString();




            resp resp = new resp();


            resp = QLWeiXin.Code.Util.GetResp(url, para);


            Response.Write( resp.data.ToString());




          

        }



        protected void LBSPost()
        {


            string url = "http://120.27.45.83:8085/api/Mall/LBSPost";

            string para = "longitude="+ Request.Form["x"].ToString();




            resp resp = new resp();


            resp = QLWeiXin.Code.Util.GetResp(url, para);


            Response.Write(resp.data.ToString());






        }


        public string GetIsUserValidatePhone(string mobile)
        {

            string url = "http://120.27.45.83:8085/api/User/ValidatePhone";

           



            string paras = "Phone=" + mobile ;

         return   publicClass.RequestUrl(url, paras);
        }
    }
}