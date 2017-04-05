using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cheshire.Backend
{
    public partial class BEmaster : System.Web.UI.MasterPage
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
            if (coktk == null && cokmk == null)
            {
                Response.Redirect("/Backend/dangnhap.aspx");
            }

            String tk = coktk.Value;
            String mk = Cheshire.dangnhap.Base64ToString(cokmk.Value);

            DataTable dt = dbc.dangnhap(tk, Cheshire.dangnhap.StringToMD5(mk));
            

            if (dt.Rows.Count == 0 || int.Parse(dt.Rows[0]["quyen"].ToString()) < 1)
            {
                Response.Redirect("/Backend/dangnhap.aspx");
            }

            DataRow r = dt.Rows[0];

            AdminEmail.Text = tk;

            String nickname = r["nickname"].ToString();
            AdminNickName.Text = nickname;
            AdminNickName1.Text = nickname;
            AdminNickName2.Text = nickname;
            
            String avaUrl = r["imgTK"].ToString();
            ava.ImageUrl = avaUrl;
            ava1.ImageUrl = avaUrl;
            ava2.ImageUrl = avaUrl;
        }
    }
}