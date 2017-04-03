<%@ Page Language="C#" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Jwell | Register</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
</head>
<body class="gray-bg">
    <form id="form1" runat="server">
    <div class="middle-box text-center loginscreen   animated fadeInDown">
        <div>
            <div>
                <h1 class="logo-name">
                    Jwell+</h1>
            </div>
            <h3>
                Register to jwell+</h3>
            <p>
                Create account to see it in action.</p>
            <form class="m-t" role="form" action="http://webapplayers.com/inspinia_admin-v2.6.1/login.html">
            <div class="form-group">
                <asp:TextBox ID="txtusername" runat="server" CssClass="form-control" placeholder="Name"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Password"
                    TextMode="Password"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtOrderid" runat="server" CssClass="form-control" placeholder="Order ID"></asp:TextBox>
            </div>
            <div class="form-group">
                <div class="checkbox i-checks">
                    <asp:RadioButton ID="rdbTypeClient" Checked="true" runat="server" Text="Client" GroupName="type" />
                    <asp:RadioButton ID="rdbTypeAdmin" runat="server" Text="Admin" GroupName="type" />
                </div>
            </div>
            <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-primary block full-width m-b"
                OnClick="btnRegister_Click" />
            <p class="text-success"><asp:Label ID="lblmsg" runat="server"></asp:Label></p>
            <p class="text-muted text-center">
                <small>Already have an account?</small></p>
            <a class="btn btn-sm btn-white btn-block" href="login.aspx">Login</a>
            </form>
            <p class="m-t">
                <small>Colunt Technologies &copy; 2017</small>
            </p>
        </div>
    </div>
    <!-- Mainly scripts -->
    <script src="js/jquery-2.1.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- iCheck -->
    <script src="js/plugins/iCheck/icheck.min.js"></script>
    <script>
        $(document).ready(function(){
            $('.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-green',
                radioClass: 'iradio_square-green',
            });
        });
    </script>
    </form>
</body>
</html>
