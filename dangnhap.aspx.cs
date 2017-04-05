using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cheshire
{
    public partial class dangnhap : System.Web.UI.Page
    {
        DBConnect dbc;
        protected void Page_Load(object sender, EventArgs e)
        {
            dbc = new DBConnect();
            ktDN();
            if (Request.QueryString["register"] == "success")
            {
                thongbao.Text = "Chúc mừng bạn đã đăng ký thành công! Đăng nhập để tiếp tục.";
            }
        }

        private void ktDN()
        {
            HttpCookie coktk = Request.Cookies["username"];
            HttpCookie cokmk = Request.Cookies["password"];
            if (coktk != null && cokmk != null)
            {
                String tk = coktk.Value;
                String mk = Base64ToString(cokmk.Value);

                DataTable dt = dbc.dangnhap(tk, StringToMD5(mk));
                if (dt.Rows.Count != 0)
                {
                    Response.Redirect("/");
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            
            String tk = txtEmail.Value.ToString();
            String mk = txtPass.Value.ToString();
            DataTable dt = dbc.dangnhap(tk,StringToMD5(mk));
            if (dt.Rows.Count == 0)
            {
                thongbao.Text = "Sai tài khoản hoặc mật khẩu!";
            }
            else
            {
                HttpCookie coktk = new HttpCookie("username");
                coktk.Value = tk;
                coktk.Expires = DateTime.Now.AddDays(15);
                Response.Cookies.Add(coktk);

                HttpCookie cokmk = new HttpCookie("password");
                cokmk.Value = StringToBase64(mk);
                cokmk.Expires = DateTime.Now.AddDays(15);
                Response.Cookies.Add(cokmk);

                if (Request.QueryString["redirect"] != null)
                {
                    Response.Redirect('/' + Request.QueryString["redirect"] + ".aspx");
                }

                Response.Redirect("/");
            }
        }

        public static string StringToBase64(string src)
        {
            // Chuyển chuỗi thành mảng kiểu byte.
            byte[] b = Encoding.Unicode.GetBytes(src);
            // Trả về chuỗi được mã hóa theo Base64.
            return Convert.ToBase64String(b);
        }
        public static string Base64ToString(string src)
        {
            // Giải mã vào mảng kiểu byte.
            byte[] b = Convert.FromBase64String(src);
            // Trả về chuỗi Unicode.
            return Encoding.Unicode.GetString(b);
        }
        public static string StringToMD5(string src)
        {
            //Trả về chuỗi được mã hoá theo MD5
            return System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(src.Trim(), "MD5");
        }
    }
}