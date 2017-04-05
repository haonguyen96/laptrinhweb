using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cheshire
{
    public partial class dangky : System.Web.UI.Page
    {
        DBConnect dbc;
        protected void Page_Load(object sender, EventArgs e)
        {
            dbc = new DBConnect();
            ktDN();
        }

        private void ktDN()
        {
            HttpCookie coktk = Request.Cookies["username"];
            HttpCookie cokmk = Request.Cookies["password"];
            if (coktk != null && cokmk != null)
            {
                String tk = coktk.Value;
                String mk = dangnhap.Base64ToString(cokmk.Value);

                DataTable dt = dbc.dangnhap(tk, dangnhap.StringToMD5(mk));
                if (dt.Rows.Count != 0)
                {
                    Response.Redirect("/");
                }
            }
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            String name = txtName.Value.ToString();
            String tk = txtEmail.Value.ToString();
            String mk = txtPass.Value.ToString();

            DataTable dt = dbc.excuteQuery(string.Format("SELECT * FROM tblTK WHERE emailTK ='{0}'", tk));
            if (dt.Rows.Count != 0)
            {
                thongbao.Text = "Email đã tồn tại!";
                return;
            }
            dbc.dangky(tk, dangnhap.StringToMD5(mk), name);
            Response.Redirect("/dangnhap.aspx?register=success");
        }
    }
}