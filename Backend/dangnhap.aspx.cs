using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cheshire.Backend
{
    public partial class dangnhap : System.Web.UI.Page
    {
        DBConnect dbc;
        protected void Page_Load(object sender, EventArgs e)
        {
            dbc = new DBConnect();
            ktDN();
            
        }

        private void ktDN()
        {
            HttpCookie coktk = Request.Cookies["BEus"];
            HttpCookie cokmk = Request.Cookies["BEpw"];
            if (coktk != null && cokmk != null)
            {
                String tk = coktk.Value;
                String mk = Cheshire.dangnhap.Base64ToString(cokmk.Value);

                DataTable dt = dbc.dangnhap(tk, Cheshire.dangnhap.StringToMD5(mk));
                if ((dt.Rows.Count != 0) && (int.Parse(dt.Rows[0]["quyen"].ToString()) > 0))
                {
                    Response.Redirect("/Backend");
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            String tk = txtEmail.Value.ToString();
            String mk = txtPass.Value.ToString();
            DataTable dt = dbc.dangnhap(tk, Cheshire.dangnhap.StringToMD5(mk));
            if (dt.Rows.Count == 0)
            {
                thongbao.Text = "Sai tài khoản hoặc mật khẩu!";
                return;
            }
            
            if (int.Parse(dt.Rows[0]["quyen"].ToString()) < 1)
            {
                thongbao.Text = "Bạn không có quyền truy cập chức năng này!";
                return;
            }

            HttpCookie coktk = new HttpCookie("BEus");
            coktk.Value = tk;
            coktk.Expires = DateTime.Now.AddDays(15);
            Response.Cookies.Add(coktk);

            HttpCookie cokmk = new HttpCookie("BEpw");
            cokmk.Value = Cheshire.dangnhap.StringToBase64(mk);
            cokmk.Expires = DateTime.Now.AddDays(15);
            Response.Cookies.Add(cokmk);

            Response.Redirect("/Backend");
            
        }
    }
}