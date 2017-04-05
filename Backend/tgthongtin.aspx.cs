using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cheshire.Backend
{
    public partial class tgthongtin : System.Web.UI.Page
    {
        DBConnect dbc;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            dbc = new DBConnect();
            if (!IsPostBack)
            {
                if (Request.QueryString["tg"]!= null)
                {
                    loadDL();
                    
                }
                else
                {
                    save.Enabled = false;
                }
            }
        }

        private void loadDL()
        {
            int id = int.Parse(Request.QueryString["tg"].ToString());
            ViewState["id"] = id;

            String query = "SELECT * FROM tblTG WHERE idTG = " + id;
            DataTable dt = dbc.excuteQuery(query);
            
            if (dt.Rows.Count > 0)
	        {
                DataRow r = dt.Rows[0];
                tenTG.Text = r["tenTG"].ToString();
                giaithuong.Text = r["tgDG"].ToString();
                ListVN.SelectedValue = r["tgVN"].ToString().Equals("True") ? "1" : "0";
                ListTinhtrang.SelectedValue = r["tinhtrang"].ToString().Equals("True") ? "1" : "0";
                CKEditor1.Text = r["motaTG"].ToString();
                ImageAvatar.ImageUrl = r["imgTG"].ToString();

                ViewState["imgTG"] = r["imgTG"].ToString();
                
            }
            else
            {
                save.Enabled = false;
            }
        }

        protected void save_Click(object sender, EventArgs e)
        {
            String img = ViewState["imgTG"].ToString();
            if (Page.IsValid && FileUpload1.HasFile)
            {
                string fileName = @"\img\" + FileUpload1.FileName;
                string p = @"\img\" + FileUpload1.FileName;
                string filePath = MapPath(fileName);
                FileUpload1.SaveAs(filePath);

                img = p;
            }

            int id = (int)ViewState["id"];
            Object[] tg = new Object[]{id,tenTG.Text,img,ListVN.SelectedValue,giaithuong.Text,CKEditor1.Text,ListTinhtrang.SelectedValue};

            dbc.updateTG("sp_update_tg", tg);

            Response.Redirect(Request.RawUrl);
        }
    }
}