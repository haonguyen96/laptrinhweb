using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Cheshire.Backend
{
    public partial class profile : System.Web.UI.Page
    {
        DBConnect dbc;
        DataTable dt;
        string password;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void luu_Click(object sender, EventArgs e)
        {

        }
        private void loadDL()
        {
            int id = int.Parse(Request.QueryString["ttmoi"].ToString());
            ViewState["id"] = id;
            String query = "SELECT * FROM tblTK WHERE idTK = " + id;
             dt = dbc.excuteQuery(query);
            if (dt.Rows.Count > 0)
            {
                DataRow r = dt.Rows[0];
                tenTK.Text = r["nickname"].ToString();
                ngaytao.Text = r["ngaytao"].ToString();
                password = r["passwordTK"].ToString();
                ImageAvatar.ImageUrl = r["imgTK"].ToString();

                ViewState["imgTK"] = r["imgTK"].ToString();

            }
            else
            {
                luu.Enabled = false;
            }
        }

        protected void pass_TextChanged(object sender, EventArgs e)
        {
            string tg = Cheshire.dangnhap.Base64ToString(pass.Text);
            tg = Cheshire.dangnhap.StringToMD5(tg);
            if (!tg.Equals(password))
            {
                thongbao1.Text = "Sai cmnr nhập lại đi";
            }
            else
            {
                thongbao1.Text = "";
            }

        }
    }
}