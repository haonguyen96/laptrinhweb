using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cheshire
{
    public partial class lienhe : System.Web.UI.Page
    {
        DBConnect dbc;
        protected void Page_Load(object sender, EventArgs e)
        {
            dbc = new DBConnect();
            if (!IsPostBack)
            {
                getData();
            }
        }

        private void getData()
        {
            RepeaterContact.DataSource = dbc.excuteQuery("SELECT tenLH, mota FROM tblLH");
            RepeaterContact.DataBind();
        }
    }
}