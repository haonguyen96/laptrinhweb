<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="giohang.aspx.cs" Inherits="Cheshire.giohang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="title" style="text-align:center">
            <span class="glyphicon glyphicon-shopping-cart"></span> Giỏ hàng của bạn
        </div>
    </div>
    <div class="row">

        <form id="frmGioHang" runat="server">
            <asp:GridView ID="GridViewGioHang" runat="server" AutoGenerateColumns="false" DataKeyNames="idSach" width="100%"
                OnRowDeleting="GridViewGioHang_RowDeleting" 
                OnRowEditing="GridViewGioHang_RowEditing" 
                OnRowUpdating="GridViewGioHang_RowUpdating"
                style="padding-left:10px;">

                <Columns>
                    <asp:TemplateField HeaderText="Mã sách">
                        <ItemTemplate>
                            <asp:Label ID="lblMa" Text='<%#Eval("idSach") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Tên sách">
                        <ItemTemplate>
                            <asp:Label ID="lblTen" Text='<%#Eval("tenSach") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Đơn giá">
                        <ItemTemplate>
                            <asp:Label ID="lblGia" Text='<%#Eval("giaSach") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="sl" HeaderText="Số lượng" />

                    <asp:TemplateField HeaderText="Thành tiền">
                        <ItemTemplate>
                            <asp:Label ID="lblThanhTien" Text='<%#Eval("thanhtien") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:CommandField ShowDeleteButton="true" ShowEditButton="true" />
                </Columns>
            </asp:GridView>
            <div class="col-md-6"></div>
            <div class="col-md-3" style="padding-top:10px;padding-bottom:10px;">
                <p>
                    <asp:Label ID="lblTongtien" Text="" runat="server" />
                </p>
            </div>
            <div class="col-md-3" style="padding-top:10px;padding-bottom:10px;">
                <asp:Button ID="btnThanhToan" Text="Thanh toán" runat="server" CssClass="btn btn-primary" OnClick="btnThanhToan_Click" />
            </div>

        </form>
    </div>
</asp:Content>
