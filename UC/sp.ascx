<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="sp.ascx.cs" Inherits="Cheshire.UC.sp" %>

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
