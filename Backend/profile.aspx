<%@ Page Title="" Language="C#" MasterPageFile="~/Backend/BEmaster.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="Cheshire.Backend.profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPageHeader" runat="server">
    <h1>
        Profile
        <small>Thông tin cơ bản</small>
    </h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPageContent" runat="server">
    <div class="box">
        <header>
            <h3>Chỉnh sửa thông tin</h3>
        </header>
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
                                            <form  id="form_chitiet" runat="server">
                                                <div class="row">
                                                    <div class="col-md-8">
                                                         <div class="form-group">
                                                                <label for="tieude">Ảnh</label> <label id="anh-error" class="error" for="anh"></label>
                                                                <div class="center-block text-center">
                                                                    <asp:Image ID="ImageAvatar" runat="server" width="20%" height="20%" alt="avata" />
                                                                    <div class="clearfix">&nbsp;</div>
                                                                    <em>Ảnh đại diện</em>
                                                                </div>
                                                                <asp:FileUpload ID="FileUploadProfile" runat="server" Width="" Height="" />&nbsp;
                                                            
                                                        </div>
                                                        <div class="form-group">
                                                                <label for="noidung">Tên</label>
                                                                <asp:TextBox ID="tenTK" runat="server" CssClass="form-control" style="width:100%;"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" ControlToValidate="tenTG" runat="server" ErrorMessage="Chưa có ten tác giả!"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="noidung">Mật khẩu </label>
                                                            <asp:TextBox ID="pass" type="password" runat="server" CssClass="form-control" style="width:100%;" OnTextChanged="pass_TextChanged" ></asp:TextBox>
                                                            <asp:Label ID="thongbao1" runat="server" Text=""></asp:Label>
                                                            <asp:RequiredFieldValidator ID="RequiredPass" ForeColor="Red" ControlToValidate="textNS" runat="server" ErrorMessage="Chưa có mật khẩu!"></asp:RequiredFieldValidator>
                                                            <label for="noidung">Mật khẩu mới </label>
                                                            <asp:TextBox ID="passnew" type="password" runat="server" CssClass="form-control" style="width:100%;"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" ControlToValidate="textNS" runat="server" ErrorMessage="Chưa có mật khẩu!"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="noidung">Ngày tạo tài khoản </label>
                                                            <asp:TextBox ID="ngaytao" runat="server" onkeyup="return check()" CssClass="form-control" style="width:100%;"></asp:TextBox>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="noidung">Giới tính </label>
                                                                <asp:DropDownList id="ListGT"  runat="server">
                                                                    <asp:ListItem Value="1"> Nam</asp:ListItem>
                                                                    <asp:ListItem Value="0"> Nữ</asp:ListItem>
                                                                    </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-12 text-center">
                                                    <asp:Button ID="luu" CssClass="btn btn-default" runat="server" OnClick="luu_Click" Text="Lưu thông tin"/>
                                                    <button type="reset" class="btn btn-danger" name="reset" value="reset">Nhập lại</button> 
                                                    <script>
                                                        function check() {
                                                            validateName();
                                                            validateSurname();
                                                            carSelect();
                                                            validateDOB();

                                                            if (errMessage == "") {
                                                            } else {
                                                                alert(errMessage);
                                                            }
                                                        }
                                                    </script>
                                                </div> 
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</asp:Content>
