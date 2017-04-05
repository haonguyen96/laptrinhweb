using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cheshire
{
    public partial class danhmuc : System.Web.UI.Page
    {
        DBConnect dbc;
        static DataTable dtGioHang = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            dbc = new DBConnect();
            if (!IsPostBack)
            {
                loadDM();
                kiemTraGioHang();
            }
        }

        private void loadDM()
        {
            DataTable dt = new DataTable();
            if (Request.QueryString["dm"] != null)
	        {
                try
                {
                    int ma = int.Parse(Request.QueryString["dm"].ToString());
                    dt = dbc.loadDM(ma);
                    tendm.InnerText = string.Format("♪ {0}",dt.Rows[0]["tenDM"].ToString());
                    
                }
                catch (Exception)
                { }
                
	        }
            DataListBooks.DataSource = dt;
            DataListBooks.DataBind();
            
        }

        protected void DataListBooks_ItemCommand(object source, DataListCommandEventArgs e)
        {
            themVaoGioHang(e);
        }

        protected void kiemTraGioHang()
        {
            if (Session["GioHang"] != null)
            {
                dtGioHang = Session["GioHang"] as DataTable;
            }
            else
            {
                dtGioHang.Rows.Clear();
                dtGioHang.Columns.Add("idSach", typeof(int));
                dtGioHang.Columns.Add("tenSach", typeof(string));
                dtGioHang.Columns.Add("giaSach", typeof(int));
                dtGioHang.Columns.Add("sl", typeof(int));
                dtGioHang.Columns.Add("thanhtien", typeof(double), "giaSach * sl");
                Session["GioHang"] = dtGioHang;
            }
        }

        private void themVaoGioHang(DataListCommandEventArgs e)
        {
            if (e.CommandName == "ibtMua")
            {
                int idSP = int.Parse(((Label)e.Item.FindControl("lblMa")).Text);
                string tenSP = ((Label)e.Item.FindControl("lblTen")).Text;
                int giaSP = int.Parse(((Label)e.Item.FindControl("lblGia")).Text);
                int sl = 1;

                foreach (DataRow r in dtGioHang.Rows)
                {
                    if ((int)r["idSach"] == idSP)
                    {
                        r["sl"] = (int)r["sl"] + 1;
                        Session["GioHang"] = dtGioHang;
                        return;
                    }
                }

                dtGioHang.Rows.Add(idSP, tenSP, giaSP, sl);
                Session["GioHang"] = dtGioHang;
                Response.Write("<script>alert('Đã thêm vào giỏ hàng ^.*!...')</script>");
            }
        }
    }
}