<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="danhmuc.aspx.cs" Inherits="Cheshire.danhmuc" %>

<%@ Register Src="~/UC/sp.ascx" TagPrefix="uc1" TagName="sp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <form id="frmDM" runat="server">
        <div class="title" id="tendm" runat="server">♪ Danh mục</div>
        <asp:DataList ID="DataListBooks" runat="server" RepeatDirection="Horizontal" RepeatColumns="4" Width="100%" OnItemCommand="DataListBooks_ItemCommand">
            <ItemTemplate>
                <div class="">
                        <div class="thumbnail" style="margin-left:10px; margin-right:10px;">
                            <img src='<%#Eval("imgSach") %>' style="width:220px" alt="...">
                            <div class="caption" style="text-align:center">
                                <p>
                                    <asp:Label runat="server" id="lblMa" Visible="false" Text='<%#Eval("idSach") %>' />
                                    <a href='/sach.aspx?book=<%#Eval("idSach") %>'>
                                        <asp:Label ID="lblTen" Text='<%#Eval("tenSach") %>' runat="server" />
                                    </a>
                                </p>
                                <asp:Button Text="Thêm vào giỏ" CommandName="ibtMua" runat="server" class="btn btn-primary" />
                                <asp:Label ID="lblGia" Text='<%#Eval("giaSach") %>' runat="server" style="font-size:larger; margin-left:8%; font-weight:bold"/>
                            </div>
                        </div>
                    </div>
            </ItemTemplate>
        </asp:DataList>
        </form>
    </div>
</asp:Content>
