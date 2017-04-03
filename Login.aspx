<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>jwell | Login</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
</head>
<body class="gray-bg">
    <form id="form1" runat="server">
    <div class="middle-box text-center loginscreen animated fadeInDown">
        <div>
            <div>
                <h1 class="logo-name">
                    Jwell+</h1>
            </div>
            <h3>
                Welcome to Jwell+</h3>
            <p>
                <%--Perfectly designed and precisely prepared admin theme with over 50 pages with extra
                new web app views.--%>
                <!--Continually expanded and constantly improved Inspinia Admin Them (IN+)-->
            </p>
            <p>
                Login in. To see it in action.</p>
            <form class="m-t" role="form" action="http://webapplayers.com/inspinia_admin-v2.6.1/index.html">
            <div class="form-group">
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="UserName"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Password"></asp:TextBox>
            </div>
            <asp:Button ID="btnLogin" runat="server" Text="Login" 
                CssClass="btn btn-primary block full-width m-b" onclick="btnLogin_Click"/>
                <p class="text-success"><asp:Label ID="lblmsg" runat="server"></asp:Label></p>
            <a href="#"><small>Forgot password?</small></a>
            <p class="text-muted text-center">
                <small>Do not have an account?</small></p>
            <a class="btn btn-sm btn-white btn-block" href="register.aspx">Create an account</a>
            </form>
            <p class="m-t">
                <small>Colunt Technologies &copy; 2017</small>
            </p>
        </div>
    </div>
    <!-- Mainly scripts -->
    <script src="js/jquery-2.1.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    </form>
</body>
</html>
