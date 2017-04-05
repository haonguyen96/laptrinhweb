<%@ Page Title="" Language="C#" MasterPageFile="~/Backend/BEmaster.Master" AutoEventWireup="true" CodeBehind="tgthemmoi.aspx.cs" Inherits="Cheshire.Backend.tacgia" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPageHeader" runat="server">
    <h1>
        Tác giả
        <small>Thêm mới</small>
    </h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPageContent" runat="server">

    <div class="box">
        
        <div id="div-5">
            <section class="content">
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12 col-lg-12">
                        <div class="box-body">
                            <div class="row">
                            <!-- Custom Tabs -->
                                <div class="nav-tabs-custom">
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="themmoi">
                                            <form  id="form_themmoi" runat="server">
                                                <div class="row">
                                                    <div class="col-md-12"> <h4 class="page-header text-purple">Các thông tin cơ bản về tác giả</h4> </div>
                                                        <div class="col-md-8">
                                                   
                                                            <div class="form-group">
                                                                    <label for="noidung">Tên tác giả</label>
                                                                    <asp:TextBox ID="tenTG" runat="server" CssClass="form-control" style="width:100%;"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" ControlToValidate="tenTG" runat="server" ErrorMessage="Chưa có ten tác giả!"></asp:RequiredFieldValidator>
                                                            </div>
                                                            <div class="form-group">
                                                                    <label for="giaithuong">Giải thưởng</label>
                                                                    <asp:TextBox ID="giaithuong" runat="server" CssClass="form-control" style="width:100%;"></asp:TextBox>
                                                            </div>
                                                            <div class="form-group">
                                                                <asp:DropDownList id="ListVN" runat="server">
                                                                    <asp:ListItem Value="1">Tác giả Việt Nam</asp:ListItem>
                                                                    <asp:ListItem Value="0">Tác giả Thế Giới</asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:DropDownList id="ListTinhtrang" runat="server">
                                                                    <asp:ListItem Value="1">Tồn tại</asp:ListItem>
                                                                    <asp:ListItem Value="0">Không tồn tại</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </div>
                                                            <div class="form-group">
                                                                    <asp:FileUpload ID="FileUpload2" runat="server" Width="" Height="" />&nbsp;
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Nội dung bài viết</label>
                                                                <CKEditor:CKEditorControl runat="server" ID="CKEditor1" ToolbarLocation="Top"></CKEditor:CKEditorControl>
                                                 
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" ControlToValidate="CKEditor1" runat="server" ErrorMessage="Bài viết chưa có nội dung!"></asp:RequiredFieldValidator>
                                                            </div>

                                                        </div>
                      
                                                    </div>
                               
                                                <div class="col-md-12 text-center"><br />
                                                    <asp:Button ID="upload" CssClass="btn btn-primary" runat="server" Text="Thêm mới" OnClick="upload_Click" />
                                                    <button type="reset" name="reset" value="reset" class="btn btn-danger">
                                                        Nhập lại
                                                    </button>
                                                </div>
                                            </form>
                                        </div>
                                    </div><!-- /.tab-pane -->
                                </div><!-- /.tab-content -->
                            </div><!-- nav-tabs-custom -->
                        </div>
                    </div>
                </div>
 
                </section><!-- /.content -->
   
            </div>
    </div>

</asp:Content>
