using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QLWeiXin.Code;

namespace QLWeiXin.lsjyWeb
{
    public partial class newAddress : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userInfo"] == null)
            {


                Response.Redirect("../login.aspx");


            }
        }

        protected void address_bt_Click(object sender, EventArgs e)
        {
            userInfo uInfo = new userInfo();


            uInfo = (userInfo)Session["userInfo"];

            string uid = uInfo.id;

            string name = this.name.Value;

            string mobile = this.mobile.Value;

            string area = this.area.Value;

            string addr = this.address.Value;

            string url = "http://120.27.45.83:8082/api/Mall/newAddress";

            string para = "user_id=" + uid + "&address=" + addr + "&phone=" + mobile + "&name=" + name + "&area=" + area + "&is_default=1";

            resp resp = new resp();


            resp = QLWeiXin.Code.Util.GetResp(url, para);

            if (resp.code == 1000)
            {

                Response.Write("<script>alert('地址添加成功')</script>");

                
            }
            else
            {
                Response.Write("<script>alert('地址添加失败')</script>");
            
            }

        }
    }
}