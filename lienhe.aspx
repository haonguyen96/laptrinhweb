<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="lienhe.aspx.cs" Inherits="Cheshire.lienhe" %>

<%@ Register Src="~/UC/lh.ascx" TagPrefix="uc1" TagName="lh" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row title">♪ Liên hệ</div>
    <asp:Repeater ID="RepeaterContact" runat="server">
        <ItemTemplate>
            <uc1:lh runat="server" id="lh" />
        </ItemTemplate>
        
    </asp:Repeater>
    
</asp:Content>
