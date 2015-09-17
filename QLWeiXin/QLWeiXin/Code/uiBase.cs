using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QLWeiXin.Code
{
    public class uiBase : System.Web.UI.Page
    {
        public uiBase() 
		{
            if (Session["userInfo"] == null)
            {
                Response.Redirect("../login.aspx");
            }
        }
    }
}