using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QLWeiXin.Code;

namespace QLWeiXin.lsjyWeb
{
    public partial class personalCenter : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            userInfo ui=new userInfo();

            ui=(userInfo)Session["userInfo"];

            this.mobile.Text = ui.phone; 
        }
    }
}