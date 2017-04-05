using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cheshire.Backend
{
    public partial class tgdanhsach : System.Web.UI.Page
    {
        DBConnect dbc;
        protected void Page_Load(object sender, EventArgs e)
        {
            dbc = new DBConnect();
            loadDL();
        }

        private void loadDL()
        {
            RepeaterDSTG.DataSource = dbc.excuteQuery("SELECT * FROM tblTG");
            RepeaterDSTG.DataBind();
        }
    }
}