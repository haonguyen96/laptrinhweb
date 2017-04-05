using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cheshire
{
    public partial class dangxuat : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Response.Cookies["username"].Value != null)
                Response.Cookies["username"].Value = null;
            if (Response.Cookies["password"].Value != null)
                Response.Cookies["password"].Value = null;
            if (Response.Cookies["BEus"].Value != null)
                Response.Cookies["BEus"].Value = null;
            if (Response.Cookies["BEpw"].Value != null)
                Response.Cookies["BEpw"].Value = null;

            if (Request.QueryString["redirect"] == "Backend")
            {
                Response.Redirect("/Backend/dangnhap.aspx");
            }
            Response.Redirect("/");
            
        }
    }
}