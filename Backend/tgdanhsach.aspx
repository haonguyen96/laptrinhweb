<%@ Page Title="" Language="C#" MasterPageFile="~/Backend/BEmaster.Master" AutoEventWireup="true" CodeBehind="tgdanhsach.aspx.cs" Inherits="Cheshire.Backend.tgdanhsach" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPageHeader" runat="server">
    <h1>
        Tác giả
        <small>Danh sách</small>
    </h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPageContent" runat="server">
    <form runat="server" method ="post">
        <div class="box box-primary">
            <div class="box-body">
                <div class="row">

                    <div class="col-md-3">
                        <asp:Label ID="Label1" runat="server" Text="Tình trạng"></asp:Label>
                        <asp:DropDownList id="checkList" runat="server">
                        <asp:ListItem Value="1">Tác giả Việt Nam</asp:ListItem>
                        <asp:ListItem Value="0">Tác giả nước ngoài</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <br />
                    <br />
                <div class="col-md-12">
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th class="col-md-1 text-center">STT</th>
                                <th class="col-md-2 text-center">Tên tác giả</th>
                                <th class="col-md-4 text-center">Giải thưởng</th>
                                <th class="col-md-2 text-center">Ngày tạo</th>
                                <th class="col-md-1 text-center">Tình trạng</th>
                                <th class="col-md-2 text-center">Chức năng</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="RepeaterDSTG" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><%# Container.ItemIndex + 1 %></td>
                                        <td><a href='tgthongtin.aspx?tg=<%#Eval("idTG") %>'><%#Eval("tenTG") %></a></td>
                                        <td><%#Eval("tgDG") %></td>
                                        <td><%#Eval("ngaytao","{0:dd/MM/yyyy}") %></td>
                                        <td>
                                            <%#Eval("tinhtrang") %>
                                        </td>
                                        <td class="text-center">
                                            <a href='tgthongtin.aspx?tg=<%#Eval("idTG") %>'  class="btn btn-sm btn-success">Sửa</a>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                        
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
            </div>
            </div>
        </div>
    </form>
</asp:Content>
