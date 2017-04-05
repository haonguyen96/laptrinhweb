<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="dmtg.aspx.cs" Inherits="Cheshire.tacgia" %>

<%@ Register Src="~/UC/tg.ascx" TagPrefix="uc1" TagName="tg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="title" id="tendmtg" runat="server">♪ Tác giả</div>
        <asp:DataList ID="DataListAuthors" runat="server" RepeatDirection="Horizontal" RepeatColumns="4" Width="100%">
            <ItemTemplate>
                <uc1:tg runat="server" id="tg" />
            </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>
