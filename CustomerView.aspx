<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="CustomerView.aspx.cs" Inherits="CustomerView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="css/plugins/dataTables/datatables.min.css" rel="stylesheet">

   
    <script type="text/javascript">


        $(document).ready(function () {
            $.ajax({
                type: "POST",
                url: "CustomerView.aspx/getData",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    debugger;
                    if (data.d != "") {
                        var objdata = $.parseJSON(data.d);
                        var arr = jQuery.parseJSON(data.d);

                        if (objdata != null && objdata.length > 0) {
                            $("#datatable").dataTable({
                                "data": objdata,
                                "iDisplayLength": 10,
                                "dom": 'frtip',
                                "pagingType": "simple_numbers",
                                "bDestroy": true,
                                "dom": 'Bfrtip',
                                "aaData": arr,
                                "aoColumns": [
                    { "mData": "CreateDate", sTitle: "Date" },
                    { "mData": "img", sTitle: "Design" },
                    { "mData": "given_by", sTitle: "Placed by"}],
                                "buttons": [
            {
                extend: 'excelHtml5',
                text: 'Export',
                title: 'Location Report',
                buttons: [
                    'copy',
                    'excel',
                    'csv',
                    'pdf',
                    'print'
                ]
            }
        ]
                            });
                        }
                    }
                    else {
                        
                    }
                }
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
                    View your order here...</h2>
                <ol class="breadcrumb">
                    <li><a href="index-2.html">Home</a> </li>
                    <li class="active"><strong>View Status</strong> </li>
                </ol>
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
                                Customer view Status <small>
                                    <%--With custom checbox and radion elements.--%></small></h5>
                            <div class="ibox-tools">
                                <a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </div>
                        </div>
                        <div class="ibox-content">
                            <div class="table-responsive">
                                <table id="datatable"  class="table table-striped table-bordered table-hover dataTables-example" cellspacing="0" width="100%">
                                </table>
                                
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
