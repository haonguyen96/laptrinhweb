using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cheshire
{
    public partial class master : System.Web.UI.MasterPage
    {
        DBConnect dbc;
        DataTable dt;
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

                dt = dbc.dangnhap(tk, dangnhap.StringToMD5(mk));

                if (dt.Rows.Count != 0)
                {
                    controlLink1.Text = "Xin chào, " + dt.Rows[0][1].ToString();
                    controlLink1.NavigateUrl = "/my-info.aspx";

                    controlLink2.Text = "Đăng xuất";
                    controlLink2.NavigateUrl = "/dangxuat.aspx";
                    return;
                }
            }

            controlLink1.Text = "Đăng nhập";
            controlLink1.NavigateUrl = "/dangnhap.aspx";

            controlLink2.Text = "Đăng ký";
            controlLink2.NavigateUrl = "/dangky.aspx";
        }

    }
}