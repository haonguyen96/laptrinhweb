<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dangnhap.aspx.cs" Inherits="Cheshire.dangnhap" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Đăng nhập</title>
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
                <div><h2>Đăng nhập</h2></div>
                <div style="color:red;">
                    <asp:Label ID="thongbao" runat="server" Text=""></asp:Label>
                </div>
                <div class="input-group">
                  <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                  <input id="txtEmail" maxlength="50" runat="server" onblur="checkEmail();" type="text" class="form-control" placeholder="Username" aria-describedby="basic-addon1" required="required"/>
                </div>
                <div class="input-group">
                  <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                  <input  id="txtPass" maxlength="50" runat="server" type="password" class="form-control" placeholder="Password" aria-describedby="basic-addon1" required="required"/>
                </div>

                <div>
                    <asp:Button OnClick="btnLogin_Click"  ID="btnLogin" Text="Đăng nhập" CssClass="btn btn-primary" runat="server"/>
                </div>
                <div><a href="/dangky.aspx">Tạo tài khoản mới!</a></div>
                
            </div>
            <div class="col-md-4"></div>
        </div>
        
    </div>
    </form>
</body>
</html>
