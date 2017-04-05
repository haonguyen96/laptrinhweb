<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dangky.aspx.cs" Inherits="Cheshire.dangky" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Đăng ký</title>
    <link href="/Template/css/bootstrap.css" rel="stylesheet" />
    <style>
        .btn{
            margin-top:10px;
        }
    </style>

    <script type="text/javascript">
        function checkEmail() {
            var email = document.getElementById("txtEmail").value;
            var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            if (!filter.test(email)) {
                document.getElementById("thongbao").innerHTML = 'Hãy nhập địa chỉ email hợp lệ.\nExample@gmail.com';
                return false;
            }
            document.getElementById("thongbao").innerHTML = '';
            return true;
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <div><h2>Đăng ký</h2></div>
                <div>
                    <asp:Label ID="thongbao" runat="server" Text="" style="color:red"></asp:Label>
                </div>
                <div class="input-group">
                  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                  <input id="txtName" runat="server" maxlength="50" type="text" class="form-control" placeholder="Tên" aria-describedby="basic-addon1" required="required"/>
                </div>
                <div class="input-group">
                  <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                  <input id="txtEmail" runat="server" onblur="checkEmail();" maxlength="50" type="text" class="form-control" placeholder="Email" aria-describedby="basic-addon1" required="required"/>
                </div>
                <div class="input-group">
                  <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                  <input  id="txtPass" runat="server" maxlength="50" type="password" class="form-control" placeholder="Mật khẩu" aria-describedby="basic-addon1" required="required"/>
                </div>

                <div><asp:Button OnClick="btnSignUp_Click" ID="btnSignUp" Text="Đăng ký" CssClass="btn btn-primary" runat="server" /></div>
                
            </div>
            <div class="col-md-4"></div>
        </div>
    </div>
    </form>
</body>
</html>
