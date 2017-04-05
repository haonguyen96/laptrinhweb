using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cheshire.Backend
{
    public partial class tacgia : System.Web.UI.Page
    {
        DBConnect dbc;
        public String imgTG;
        public String mota;
        protected void Page_Load(object sender, EventArgs e)
        {
            dbc = new DBConnect();
            imgTG = @"\img\tgdefault.jpg";
            mota = "";
        }

        protected void upload_Click(object sender, EventArgs e)
        {
            if (Page.IsValid && FileUpload2.HasFile)
            {
                string fileName = @"\img\" + FileUpload2.FileName;
                string p = @"\img\" + FileUpload2.FileName;
                string filePath = MapPath(fileName);
                FileUpload2.SaveAs(filePath);
                imgTG = p;
            }

            mota = CKEditor1.Text;
            dbc.cnn.Open();
            int checkVN = Convert.ToInt32(ListVN.SelectedValue);
            int checkTinhtrang = Convert.ToInt32(ListTinhtrang.SelectedValue);
            SqlCommand cmd = new SqlCommand("sp_insert_tg", dbc.cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ten", tenTG.Text);
            cmd.Parameters.AddWithValue("@img", imgTG);
            cmd.Parameters.AddWithValue("@tgVN", checkVN);
            cmd.Parameters.AddWithValue("@tgDG", giaithuong.Text);
            cmd.Parameters.AddWithValue("@mota", mota);
            cmd.Parameters.AddWithValue("@tt", checkTinhtrang);


            int n = cmd.ExecuteNonQuery();

            dbc.cnn.Close();
            Response.Redirect(Request.RawUrl);
        }
    }
}