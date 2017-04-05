using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



namespace Cheshire
{
    public partial class giohang : System.Web.UI.Page
    {
        static DataTable dtGioHang = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadDL();
            }
        }

        private void loadDL()
        {
            dtGioHang = (DataTable)Session["GioHang"];
            GridViewGioHang.DataSource = dtGioHang;
            GridViewGioHang.DataBind();

            String strTongtien = dtGioHang.Compute("Sum(thanhtien)", "").ToString();
            lblTongtien.Text = "Tổng tiền là: <b>" + strTongtien + "</b>";
        }

        protected void GridViewGioHang_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
                dtGioHang.Rows.RemoveAt(e.RowIndex);
                GridViewGioHang.EditIndex = -1;
                loadDL();
        }

        protected void GridViewGioHang_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewGioHang.EditIndex = e.NewEditIndex;
            loadDL();
        }

        protected void GridViewGioHang_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int sl = int.Parse((GridViewGioHang.Rows[e.RowIndex].Cells[3].Controls[0] as TextBox).Text);
            dtGioHang.Rows[e.RowIndex]["sl"] = sl;
            GridViewGioHang.EditIndex = -1;
            loadDL();
        }

        protected void btnThanhToan_Click(object sender, EventArgs e)
        {
            if (Request.Cookies["username"].Value == "")
            {
                Response.Redirect("/dangnhap.aspx?redirect=giohang");
            }
            else
            {
                Response.Write("<script>alert('Thực hiện thanh toán')</script>");
            }
        }
    }
}