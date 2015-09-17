using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QLWeiXin.Code;


namespace QLWeiXin.lsjyWeb
{
    public partial class updateAddress : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userInfo"] == null)
            {


                Response.Redirect("../login.aspx");
            }

            if (!IsPostBack)
            {
                setAddress();
            }
        }

        protected void address_bt_Click(object sender, EventArgs e)
        {
            string url = "http://120.27.45.83:8082/api/Mall/EditAddress";

            string para = "id=" + this.aid.Value + "&address=" + this.address.Value + "&phone=" + this.mobile.Value + "&name=" + this.name.Value + "&user_id=" + this.uid.Value + "&is_default=1";
            resp resp = new resp();


            resp = QLWeiXin.Code.Util.GetResp(url, para);

            if (resp.code == 1000)
            {
                Response.Write("<script>alert('修改地址成功');local.href='addressManage.aspx'</script>");


            }
            else
            {
                Response.Write("<script>alert('修改地址失败');local.href='addressManage.aspx'</script>");
            }
        }


        private void setAddress()
        {


            string url = "http://120.27.45.83:8082/api/Mall/getAddressInfo";

            string para = "key="+ Request.QueryString["aid"].ToString();

            resp resp = new resp();


            resp = QLWeiXin.Code.Util.GetResp(url, para);

            userAddress user = JsonHelper.DeserializeJsonToObject<userAddress>(resp.data.ToString());

            this.name.Value = user.name;

            this.mobile.Value = user.phone;

            this.area.Value = user.area;

            this.address.Value = user.address;

            this.aid.Value = user.id;

            this.uid.Value = user.user_id;


        }
    }
}