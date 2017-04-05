using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cheshire
{
    public partial class tacgia : System.Web.UI.Page
    {
        DBConnect dbc;
        protected void Page_Load(object sender, EventArgs e)
        {
            dbc = new DBConnect();
            if (!IsPostBack)
            {
                loadDMTG();
            }
        }

        private void loadDMTG()
        {
            String query = "SELECT idTG, tenTG, imgTG FROM tblTG";
            if (Request.QueryString["dmtg"] != null)
            {
                try
                {
                    String dmtg = Request.QueryString["dmtg"].ToString();
                    
                    if (dmtg.Equals("tgdg"))
                    {
                        query += " WHERE tgDG NOT LIKE ''";
                        tendmtg.InnerText = "♪ Tác giả đoạt giải";
                    }
                    else if (dmtg.Equals("tgvn"))
                    {
                        query += " WHERE tgVN = 1";
                        tendmtg.InnerText = "♪ Tác giả trong nước";
                    }
                    else if (dmtg.Equals("tgnn"))
	                {
                        query += " WHERE tgVN = 0";
                        tendmtg.InnerText = "♪ Tác giả nước ngoài";
	                }
                }
                catch (Exception)
                { }
            }

            DataListAuthors.DataSource = dbc.excuteQuery(query);
            DataListAuthors.DataBind();
        }
    }
}