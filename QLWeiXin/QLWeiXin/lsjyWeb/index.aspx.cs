using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QLWeiXin.Code;

namespace QLWeiXin.lsjyWeb
{
    public partial class index : System.Web.UI.Page
    {
        userInfo uInfo = new userInfo();


        private string cid = "";
        protected void Page_Load(object sender, EventArgs e)
        {





        }


        private void bdrp1()
        {


            this.Repeater1.DataSource = Util.GetArea();

            this.Repeater1.DataBind();
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }



















    }
}