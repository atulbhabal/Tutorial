<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="OrderForm.aspx.cs" Inherits="OrderForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="css/plugins/datapicker/datepicker3.css" rel="stylesheet" />
    <link href="css/plugins/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" />
    <!-- Jasny -->
    <script src="js/plugins/jasny/jasny-bootstrap.min.js"></script>
    <link href="css/plugins/jasny/jasny-bootstrap.min.css" rel="stylesheet">
    
    <script type="text/javascript">
        $(function () {
            var today = new Date();

            $("#" + '<%=txtDate.ClientID%>').datepicker({
                numberOfMonths: 2,
                dateFormat: 'dd-M-yy',
                minDate: today,
                autoclose: true
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="Server">
    <div id="page-wrapper" class="gray-bg">
        <div class="row border-bottom">
            <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
            <form role="search" class="navbar-form-custom" action="http://webapplayers.com/inspinia_admin-v2.6.1/search_results.html">
                <%--<div class="form-group">
                    <input type="text" placeholder="Search for something..." class="form-control" name="top-search" id="top-search">
                </div>--%>
            </form>
        </div>
            <ul class="nav navbar-top-links navbar-right">
                <li>
                    <span class="m-r-sm text-muted welcome-message">Welcome to JWELL+ Client Area.</span>
                </li>
                <li>
                    <a href="login.aspx">
                        <i class="fa fa-sign-out"></i> Log out
                    </a>
                </li>
            </ul>

        </nav>
        </div>
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>
                    Place your order here...</h2>
                <ol class="breadcrumb">
                    <li><a href="index-2.html">Home</a> </li>
                    <li class="active"><strong>Order Form</strong> </li>
                </ol>
                <asp:Label ID="lblmsg" runat="server" ></asp:Label>
            </div>
            <div class="col-lg-2">
            </div>
        </div>
        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
                <div class="col-lg-12">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>
                                Customer Order Form <small></small>
                            </h5>
                            <div class="ibox-tools">
                                <a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </div>
                        </div>
                        <div class="ibox-content">
                            <div method="get" class="form-horizontal">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">
                                        Customer Name</label>
                                    <div class="col-sm-3">
                                        <asp:TextBox ID="txtCustomerName" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <label class="col-sm-2 control-label">
                                        Order Given By</label>
                                    <div class="col-sm-3">
                                        <asp:TextBox ID="txtOrderBy" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvOrderBy" runat="server" ValidationGroup="ordersubmit"
                                            ControlToValidate="txtOrderBy" ForeColor="Red" ErrorMessage="Please enter your name.">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="hr-line-dashed">
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">
                                        Order Number</label>
                                    <div class="col-sm-3">
                                        <p class="form-control-static">
                                            <asp:TextBox ID="txtOrderNumber" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                                        </p>
                                    </div>
                                    <label class="col-sm-2 control-label">
                                        Customer Order Number</label>
                                    <div class="col-sm-3">
                                        <asp:TextBox ID="txtCustomerOrderNumber" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvCustomerOrderNumber" runat="server" ValidationGroup="ordersubmit"
                                            ControlToValidate="txtCustomerOrderNumber" ForeColor="Red" ErrorMessage="Please enter your order number.">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="hr-line-dashed">
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">
                                        Design Number</label>
                                    <div class="col-sm-3">
                                        <p class="form-control-static">
                                            <asp:TextBox ID="txtDesignNumber" runat="server" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvDesignNumber" runat="server" ValidationGroup="ordersubmit"
                                                ControlToValidate="txtDesignNumber" ForeColor="Red" ErrorMessage="Please enter design number.">
                                            </asp:RequiredFieldValidator></p>
                                    </div>
                                    <label class="col-sm-2 control-label">
                                        Melting</label>
                                    <div class="col-sm-3">
                                        <asp:DropDownList ID="ddlMelting" runat="server" CssClass="form-control m-b">
                                            <asp:ListItem>Select Melting</asp:ListItem>
                                            <asp:ListItem>75</asp:ListItem>
                                            <asp:ListItem>8350</asp:ListItem>
                                            <asp:ListItem>917</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvMelting" runat="server" ValidationGroup="ordersubmit"
                                            ControlToValidate="ddlMelting" ForeColor="Red" InitialValue="Select Melting"
                                            ErrorMessage="Please select melting.">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="hr-line-dashed">
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">
                                        PCS</label>
                                    <div class="col-sm-3">
                                        <asp:TextBox ID="txtPCS" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvPCS" runat="server" ValidationGroup="ordersubmit"
                                            ControlToValidate="txtPCS" ForeColor="Red" ErrorMessage="Please enter number of PCS.">
                                        </asp:RequiredFieldValidator>
                                        </br>
                                        <asp:RegularExpressionValidator ID="rfvPCSnum" ControlToValidate="txtPCS" ValidationExpression="\d+"
                                            ValidationGroup="ordersubmit" ForeColor="Red" ErrorMessage="Please enter numbers only."
                                            runat="server" />
                                    </div>
                                    <label class="col-sm-2 control-label">
                                        Weight</label>
                                    <div class="col-sm-3">
                                        <asp:TextBox ID="txtWeight" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="hr-line-dashed">
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">
                                        Size</label>
                                    <div class="col-sm-3">
                                        <asp:TextBox ID="txtSize" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvSize" runat="server" ValidationGroup="ordersubmit"
                                            ControlToValidate="txtSize" ForeColor="Red" ErrorMessage="Please enter size.">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                    <label class="col-sm-2 control-label">
                                        Format</label>
                                    <div class="col-sm-3">
                                        <asp:DropDownList ID="ddlFormat" runat="server" CssClass="form-control m-b">
                                            <asp:ListItem>Select Format</asp:ListItem>
                                            <asp:ListItem>PN BUDH</asp:ListItem>
                                            <asp:ListItem>OSCAR</asp:ListItem>
                                            <asp:ListItem>NA</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvFormat" runat="server" ValidationGroup="ordersubmit"
                                            ControlToValidate="ddlFormat" ForeColor="Red" InitialValue="Select Format" ErrorMessage="Please select format.">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="hr-line-dashed">
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">
                                        RHODIUM</label>
                                    <div class="col-sm-3">
                                        <asp:DropDownList ID="ddlRHODIUM" runat="server" CssClass="form-control m-b">
                                            <asp:ListItem>Select RHODIUM</asp:ListItem>
                                            <asp:ListItem>YES</asp:ListItem>
                                            <asp:ListItem>NO</asp:ListItem>
                                            <asp:ListItem>GangaGamuna</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <label class="col-sm-2 control-label">
                                        ANYOTHER</label>
                                    <div class="col-sm-3">
                                        <asp:TextBox ID="txtAnyOther" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="hr-line-dashed">
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">
                                        Dilivery Date</label>
                                    <div class="col-sm-3">
                                        <div class="input-group date">
                                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                            <asp:TextBox ID="txtDate" class="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <label class="col-sm-2 control-label">
                                        Upload Image</label>
                                    <div class="col-sm-3">
                                        <div class="fileinput fileinput-new input-group" data-provides="fileinput">
                                            <asp:FileUpload ID="flpImage" class="btn btn-white" runat="server" />
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.jpg|.png)$"
                                                ControlToValidate="flpImage" runat="server" ForeColor="Red" ErrorMessage="Please select a valid Image of jpg/png file format."
                                                Display="Dynamic" />
                                        </div>
                                    </div>
                                </div>
                                <div class="hr-line-dashed">
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-4 col-sm-offset-2">
                                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-white"
                                            OnClick="btnCancel_Click" />
                                        <asp:Button ID="btnSubmit" CausesValidation="true" ValidationGroup="ordersubmit"
                                            runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer">
            <%--<div class="pull-right">
                10GB of <strong>250GB</strong> Free.
            </div>--%>
            <div>
                <strong>Copyright</strong> Colunt Technologies &copy; 2017
            </div>
        </div>
    </div>
</asp:Content>
