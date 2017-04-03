<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Dashboard.aspx.cs" Inherits="Dashboard" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <script src="js/jquery-2.1.1.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            debugger;


            $.ajax({
                url: "Dashboard.aspx/getManpower",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    console.log(data);
                    debugger;
                    var userid = [];
                    var project = [];
                    var cost = [];
                    var cost1 = [];


                    var objdata = $.parseJSON(data.d);

                    $.each(objdata, function (key, value) {
                        userid.push("UserID " + value.GP_ID);
                        project.push(value.GP_ID);
                        cost.push(value.TOT);
                        cost1.push(value.AVG_EXP);
                    });


                    var chartdata = {
                        labels: project,
                        datasets: [
            					{
            					    label: "Cost",
            					    backgroundColor: 'rgba(26,179,148,0.5)',
            					    borderColor: "rgba(26,179,148,0.7)",
            					    pointBackgroundColor: "rgba(26,179,148,1)",
            					    pointBorderColor: "#fff",
            					    data: cost
            					},
                                    					{
                                    					    label: "Data 2",
                                    					    backgroundColor: 'rgba(26,179,148,0.5)',
                                    					    borderColor: "rgba(26,179,148,0.7)",
                                    					    pointBackgroundColor: "rgba(26,179,148,1)",
                                    					    pointBorderColor: "#fff",
                                    					    data: cost1
                                    					}
            				]
                    };

            	var ctx = $("#ManpowerChart");

                    var LineGraph = new Chart(ctx, {
                        type: 'line',
                        data: chartdata
                    });
                },
                error: function (data) {
                    debugger;
                }
            });


        });
    </script>
    <script type="text/javascript">
        $(document).ready(function () {

            $.ajax({
                url: "Dashboard.aspx/getBudget",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    console.log(data);
                    var userid = [];
                    var project = [];
                    var cost = [];


                    var objdata = $.parseJSON(data.d);

                    $.each(objdata, function (key, value) {
                        userid.push("UserID " + value.ID_BUDGET);
                        project.push(value.PRJ_NO);
                        cost.push(value.OVERALL_BUDGET);
                    });


                    var chartdata = {
                        labels: project,
                        datasets: [
            					{
            					    label: "Cost",
            					    backgroundColor: 'rgba(26,179,148,0.5)',
            					    borderColor: "rgba(26,179,148,0.7)",
            					    pointBackgroundColor: "rgba(26,179,148,1)",
            					    pointBorderColor: "#fff",
            					    data: cost
            					}
                        //            					{
                        //            					    label: "Data 2",
                        //            					    backgroundColor: 'rgba(26,179,148,0.5)',
                        //            					    borderColor: "rgba(26,179,148,0.7)",
                        //            					    pointBackgroundColor: "rgba(26,179,148,1)",
                        //            					    pointBorderColor: "#fff",
                        //            					    data: cost
                        //            					}
            				]
                    };

                    var ctx = $("#barChart");

                    var LineGraph = new Chart(ctx, {
                        type: 'line',
                        data: chartdata
                    });
                },
                error: function (data) {
                    debugger;
                }
            });


        });
    </script>
    <script>
        $(document).ready(function () {
            setTimeout(function () {
                toastr.options = {
                    closeButton: true,
                    progressBar: true,
                    showMethod: 'slideDown',
                    timeOut: 4000
                };
                toastr.success('Responsive Admin Theme', 'Welcome to INSPINIA');

            }, 1300);


            var data1 = [
                [0, 4], [1, 8], [2, 5], [3, 10], [4, 4], [5, 16], [6, 5], [7, 11], [8, 6], [9, 11], [10, 30], [11, 10], [12, 13], [13, 4], [14, 3], [15, 3], [16, 6]
            ];
            var data2 = [
                [0, 1], [1, 0], [2, 2], [3, 0], [4, 1], [5, 3], [6, 1], [7, 5], [8, 2], [9, 3], [10, 2], [11, 1], [12, 0], [13, 2], [14, 8], [15, 0], [16, 0]
            ];
            $("#flot-dashboard-chart").length && $.plot($("#flot-dashboard-chart"), [
                data1, data2
            ],
                    {
                        series: {
                            lines: {
                                show: false,
                                fill: true
                            },
                            splines: {
                                show: true,
                                tension: 0.4,
                                lineWidth: 1,
                                fill: 0.4
                            },
                            points: {
                                radius: 0,
                                show: true
                            },
                            shadowSize: 2
                        },
                        grid: {
                            hoverable: true,
                            clickable: true,
                            tickColor: "#d5d5d5",
                            borderWidth: 1,
                            color: '#d5d5d5'
                        },
                        colors: ["#1ab394", "#1C84C6"],
                        xaxis: {
                        },
                        yaxis: {
                            ticks: 4
                        },
                        tooltip: false
                    }
            );

            var doughnutData = {
                labels: ["App", "Software", "Laptop"],
                datasets: [{
                    data: [300, 50, 100],
                    backgroundColor: ["#a3e1d4", "#dedede", "#9CC3DA"]
                }]
            };


            var doughnutOptions = {
                responsive: false,
                legend: {
                    display: false
                }
            };


            var ctx4 = document.getElementById("doughnutChart").getContext("2d");
            new Chart(ctx4, { type: 'doughnut', data: doughnutData, options: doughnutOptions });

            var doughnutData = {
                labels: ["App", "Software", "Laptop"],
                datasets: [{
                    data: [70, 27, 85],
                    backgroundColor: ["#a3e1d4", "#dedede", "#9CC3DA"]
                }]
            };


            var doughnutOptions = {
                responsive: false,
                legend: {
                    display: false
                }
            };


            var ctx4 = document.getElementById("doughnutChart2").getContext("2d");
            new Chart(ctx4, { type: 'doughnut', data: doughnutData, options: doughnutOptions });

        });
    </script>

    <script>
        $(document).ready(function() {


            var d1 = [[1262304000000, 6], [1264982400000, 3057], [1267401600000, 20434], [1270080000000, 31982], [1272672000000, 26602], [1275350400000, 27826], [1277942400000, 24302], [1280620800000, 24237], [1283299200000, 21004], [1285891200000, 12144], [1288569600000, 10577], [1291161600000, 10295]];
            var d2 = [[1262304000000, 5], [1264982400000, 200], [1267401600000, 1605], [1270080000000, 6129], [1272672000000, 11643], [1275350400000, 19055], [1277942400000, 30062], [1280620800000, 39197], [1283299200000, 37000], [1285891200000, 27000], [1288569600000, 21000], [1291161600000, 17000]];

            var data1 = [
                { label: "Data 1", data: d1, color: '#17a084'},
                { label: "Data 2", data: d2, color: '#127e68' }
            ];
            $.plot($("#flot-chart1"), data1, {
                xaxis: {
                    tickDecimals: 0
                },
                series: {
                    lines: {
                        show: true,
                        fill: true,
                        fillColor: {
                            colors: [{
                                opacity: 1
                            }, {
                                opacity: 1
                            }]
                        },
                    },
                    points: {
                        width: 0.1,
                        show: false
                    },
                },
                grid: {
                    show: false,
                    borderWidth: 0
                },
                legend: {
                    show: false,
                }
            });

            var lineData = {
                labels: ["January", "February", "March", "April", "May", "June", "July"],
                datasets: [
                    {
                        label: "Example dataset",
                        backgroundColor: "rgba(26,179,148,0.5)",
                        borderColor: "rgba(26,179,148,0.7)",
                        pointBackgroundColor: "rgba(26,179,148,1)",
                        pointBorderColor: "#fff",
                        data: [48, 48, 60, 39, 56, 37, 30]
                    },
                    {
                        label: "Example dataset",
                        backgroundColor: "rgba(220,220,220,0.5)",
                        borderColor: "rgba(220,220,220,1)",
                        pointBackgroundColor: "rgba(220,220,220,1)",
                        pointBorderColor: "#fff",
                        data: [65, 59, 40, 51, 36, 25, 40]
                    }
                ]
            };

            var lineOptions = {
                responsive: true
            };


            var ctx = document.getElementById("lineChart").getContext("2d");
            new Chart(ctx, {type: 'line', data: lineData, options:lineOptions});


        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="Server">
    <div id="page-wrapper" class="gray-bg dashbard-1">
        <div class="row border-bottom">
            <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">



        <div class="navbar-header">
            <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
            <form role="search" class="navbar-form-custom" action="http://webapplayers.com/inspinia_admin-v2.6.1/search_results.html">
                <div class="form-group">
                    <input type="text" placeholder="Search for something..." class="form-control" name="top-search" id="top-search">
                </div>
            </form>
        </div>
            <ul class="nav navbar-top-links navbar-right">
                <li>
                    <span class="m-r-sm text-muted welcome-message">Welcome to INSPINIA+ Admin Theme.</span>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                        <i class="fa fa-envelope"></i>  <span class="label label-warning">16</span>
                    </a>
                    <ul class="dropdown-menu dropdown-messages">
                        <li>
                            <div class="dropdown-messages-box">
                                <a href="profile.html" class="pull-left">
                                    <img alt="image" class="img-circle" src="img/a7.jpg">
                                </a>
                                <div class="media-body">
                                    <small class="pull-right">46h ago</small>
                                    <strong>Mike Loreipsum</strong> started following <strong>Monica Smith</strong>. <br>
                                    <small class="text-muted">3 days ago at 7:58 pm - 10.06.2014</small>
                                </div>
                            </div>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <div class="dropdown-messages-box">
                                <a href="profile.html" class="pull-left">
                                    <img alt="image" class="img-circle" src="img/a4.jpg">
                                </a>
                                <div class="media-body ">
                                    <small class="pull-right text-navy">5h ago</small>
                                    <strong>Chris Johnatan Overtunk</strong> started following <strong>Monica Smith</strong>. <br>
                                    <small class="text-muted">Yesterday 1:21 pm - 11.06.2014</small>
                                </div>
                            </div>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <div class="dropdown-messages-box">
                                <a href="profile.html" class="pull-left">
                                    <img alt="image" class="img-circle" src="img/profile.jpg">
                                </a>
                                <div class="media-body ">
                                    <small class="pull-right">23h ago</small>
                                    <strong>Monica Smith</strong> love <strong>Kim Smith</strong>. <br>
                                    <small class="text-muted">2 days ago at 2:30 am - 11.06.2014</small>
                                </div>
                            </div>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <div class="text-center link-block">
                                <a href="mailbox.html">
                                    <i class="fa fa-envelope"></i> <strong>Read All Messages</strong>
                                </a>
                            </div>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                        <i class="fa fa-bell"></i>  <span class="label label-primary">8</span>
                    </a>
                    <ul class="dropdown-menu dropdown-alerts">
                        <li>
                            <a href="mailbox.html">
                                <div>
                                    <i class="fa fa-envelope fa-fw"></i> You have 16 messages
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="profile.html">
                                <div>
                                    <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                                    <span class="pull-right text-muted small">12 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="grid_options.html">
                                <div>
                                    <i class="fa fa-upload fa-fw"></i> Server Rebooted
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <div class="text-center link-block">
                                <a href="notifications.html">
                                    <strong>See All Alerts</strong>
                                    <i class="fa fa-angle-right"></i>
                                </a>
                            </div>
                        </li>
                    </ul>
                </li>


                <li>
                    <a href="login.html">
                        <i class="fa fa-sign-out"></i> Log out
                    </a>
                </li>
                <li>
                    <a class="right-sidebar-toggle">
                        <i class="fa fa-tasks"></i>
                    </a>
                </li>
            </ul>

        </nav>
        </div>
        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
                <div class="col-lg-2">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <span class="label label-success pull-right">Monthly</span>
                            <h5>
                                Manpower</h5>
                        </div>
                        <div class="ibox-content">
                            <h1 class="no-margins" id="manpower">
                                386,200</h1>
                            <div class="stat-percent font-bold text-success">
                                98% <i class="fa fa-bolt"></i>
                            </div>
                            <small>Total views</small>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <span class="label label-info pull-right">Annual</span>
                            <h5>
                                Orders</h5>
                        </div>
                        <div class="ibox-content">
                            <h1 class="no-margins">
                                80,800</h1>
                            <div class="stat-percent font-bold text-info">
                                20% <i class="fa fa-level-up"></i>
                            </div>
                            <small>New orders</small>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <span class="label label-primary pull-right">Today</span>
                            <h5>
                                visits</h5>
                        </div>
                        <div class="ibox-content">
                            <div class="row">
                                <div class="col-md-6">
                                    <h1 class="no-margins">
                                        406,42</h1>
                                    <div class="font-bold text-navy">
                                        44% <i class="fa fa-level-up"></i><small>Rapid pace</small></div>
                                </div>
                                <div class="col-md-6">
                                    <h1 class="no-margins">
                                        206,12</h1>
                                    <div class="font-bold text-navy">
                                        22% <i class="fa fa-level-up"></i><small>Slow pace</small></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>
                                Monthly income</h5>
                            <div class="ibox-tools">
                                <span class="label label-primary">Updated 12.2015</span>
                            </div>
                        </div>
                        <div class="ibox-content no-padding">
                            <div class="flot-chart m-t-lg" style="height: 55px;">
                                <div class="flot-chart-content" id="flot-chart1" style="padding: 0px; position: relative;">
                                    <canvas class="flot-base" width="418" height="55" style="direction: ltr; position: absolute;
                                        left: 0px; top: 0px; width: 418px; height: 55px;"></canvas>
                                    <canvas class="flot-overlay" width="418" height="55" style="direction: ltr; position: absolute;
                                        left: 0px; top: 0px; width: 418px; height: 55px;"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>
                                BMI Manpower</h5>
                        </div>
                        <div class="ibox-content">
                            <div>
                                <canvas id="ManpowerChart" height="140"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8">
                    <div class="ibox float-e-margins">
                        <div class="ibox-content">
                            <div>
                                <span class="pull-right text-right"><small>Average value of sales in the past month
                                    in: <strong>United states</strong></small>
                                    <br>
                                    All sales: 162,862 </span>
                                <h3 class="font-bold no-margins">
                                    BMI Project Budget
                                </h3>
                                <small>Sales marketing.</small>
                            </div>
                            <div class="m-t-sm">
                                <div class="row">
                                    <div class="col-md-8">
                                        <div>
                                            <iframe class="chartjs-hidden-iframe" style="width: 100%; display: block; border: 0px;
                                                height: 0px; margin: 0px; position: absolute; left: 0px; right: 0px; top: 0px;
                                                bottom: 0px;"></iframe>
                                                <canvas id="barChart" height="140"></canvas>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <ul class="stat-list m-t-lg">
                                            <li>
                                                <h2 class="no-margins">
                                                    2,346</h2>
                                                <small>Total orders in period</small>
                                                <div class="progress progress-mini">
                                                    <div class="progress-bar" style="width: 48%;">
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <h2 class="no-margins ">
                                                    4,422</h2>
                                                <small>Orders in last month</small>
                                                <div class="progress progress-mini">
                                                    <div class="progress-bar" style="width: 60%;">
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="m-t-md">
                                <small class="pull-right"><i class="fa fa-clock-o"></i>Update on 16.07.2015 </small>
                                <small><strong>Analysis of sales:</strong> The value has been changed over time, and
                                    last month reached a level over $50,000. </small>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <span class="label label-warning pull-right">Data has changed</span>
                            <h5>
                                User activity</h5>
                        </div>
                        <div class="ibox-content">
                            <div class="row">
                                <div class="col-xs-4">
                                    <small class="stats-label">Pages / Visit</small>
                                    <h4>
                                        236 321.80</h4>
                                </div>
                                <div class="col-xs-4">
                                    <small class="stats-label">% New Visits</small>
                                    <h4>
                                        46.11%</h4>
                                </div>
                                <div class="col-xs-4">
                                    <small class="stats-label">Last week</small>
                                    <h4>
                                        432.021</h4>
                                </div>
                            </div>
                        </div>
                        <div class="ibox-content">
                            <div class="row">
                                <div class="col-xs-4">
                                    <small class="stats-label">Pages / Visit</small>
                                    <h4>
                                        643 321.10</h4>
                                </div>
                                <div class="col-xs-4">
                                    <small class="stats-label">% New Visits</small>
                                    <h4>
                                        92.43%</h4>
                                </div>
                                <div class="col-xs-4">
                                    <small class="stats-label">Last week</small>
                                    <h4>
                                        564.554</h4>
                                </div>
                            </div>
                        </div>
                        <div class="ibox-content">
                            <div class="row">
                                <div class="col-xs-4">
                                    <small class="stats-label">Pages / Visit</small>
                                    <h4>
                                        436 547.20</h4>
                                </div>
                                <div class="col-xs-4">
                                    <small class="stats-label">% New Visits</small>
                                    <h4>
                                        150.23%</h4>
                                </div>
                                <div class="col-xs-4">
                                    <small class="stats-label">Last week</small>
                                    <h4>
                                        124.990</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="small-chat-box fadeInRight animated">
            <div class="heading" draggable="true">
                <small class="chat-date pull-right">02.19.2015 </small>Small chat
            </div>
            <div class="content">
                <div class="left">
                    <div class="author-name">
                        Monica Jackson <small class="chat-date">10:02 am </small>
                    </div>
                    <div class="chat-message active">
                        Lorem Ipsum is simply dummy text input.
                    </div>
                </div>
                <div class="right">
                    <div class="author-name">
                        Mick Smith <small class="chat-date">11:24 am </small>
                    </div>
                    <div class="chat-message">
                        Lorem Ipsum is simpl.
                    </div>
                </div>
                <div class="left">
                    <div class="author-name">
                        Alice Novak <small class="chat-date">08:45 pm </small>
                    </div>
                    <div class="chat-message active">
                        Check this stock char.
                    </div>
                </div>
                <div class="right">
                    <div class="author-name">
                        Anna Lamson <small class="chat-date">11:24 am </small>
                    </div>
                    <div class="chat-message">
                        The standard chunk of Lorem Ipsum
                    </div>
                </div>
                <div class="left">
                    <div class="author-name">
                        Mick Lane <small class="chat-date">08:45 pm </small>
                    </div>
                    <div class="chat-message active">
                        I belive that. Lorem Ipsum is simply dummy text.
                    </div>
                </div>
            </div>
            <div class="form-chat">
                <div class="input-group input-group-sm">
                    <input type="text" class="form-control">
                    <span class="input-group-btn">
                        <button class="btn btn-primary" type="button">
                            Send
                        </button>
                    </span>
                </div>
            </div>
        </div>
        <div id="small-chat">
            <span class="badge badge-warning pull-right">5</span> <a class="open-small-chat"><i
                class="fa fa-comments"></i></a>
        </div>
        <div id="right-sidebar" class="animated">
            <div class="sidebar-container">
                <ul class="nav nav-tabs navs-3">
                    <li class="active"><a data-toggle="tab" href="#tab-1">Notes </a></li>
                    <li><a data-toggle="tab" href="#tab-2">Projects </a></li>
                    <li class=""><a data-toggle="tab" href="#tab-3"><i class="fa fa-gear"></i></a></li>
                </ul>
                <div class="tab-content">
                    <div id="tab-1" class="tab-pane active">
                        <div class="sidebar-title">
                            <h3>
                                <i class="fa fa-comments-o"></i>Latest Notes</h3>
                            <small><i class="fa fa-tim"></i>You have 10 new message.</small>
                        </div>
                        <div>
                            <div class="sidebar-message">
                                <a href="#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="img/a1.jpg">
                                        <div class="m-t-xs">
                                            <i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i>
                                        </div>
                                    </div>
                                    <div class="media-body">
                                        There are many variations of passages of Lorem Ipsum available.
                                        <br>
                                        <small class="text-muted">Today 4:21 pm</small>
                                    </div>
                                </a>
                            </div>
                            <div class="sidebar-message">
                                <a href="#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="img/a2.jpg">
                                    </div>
                                    <div class="media-body">
                                        The point of using Lorem Ipsum is that it has a more-or-less normal.
                                        <br>
                                        <small class="text-muted">Yesterday 2:45 pm</small>
                                    </div>
                                </a>
                            </div>
                            <div class="sidebar-message">
                                <a href="#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="img/a3.jpg">
                                        <div class="m-t-xs">
                                            <i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i
                                                class="fa fa-star text-warning"></i>
                                        </div>
                                    </div>
                                    <div class="media-body">
                                        Mevolved over the years, sometimes by accident, sometimes on purpose (injected humour
                                        and the like).
                                        <br>
                                        <small class="text-muted">Yesterday 1:10 pm</small>
                                    </div>
                                </a>
                            </div>
                            <div class="sidebar-message">
                                <a href="#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="img/a4.jpg">
                                    </div>
                                    <div class="media-body">
                                        Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the
                                        <br>
                                        <small class="text-muted">Monday 8:37 pm</small>
                                    </div>
                                </a>
                            </div>
                            <div class="sidebar-message">
                                <a href="#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="img/a8.jpg">
                                    </div>
                                    <div class="media-body">
                                        All the Lorem Ipsum generators on the Internet tend to repeat.
                                        <br>
                                        <small class="text-muted">Today 4:21 pm</small>
                                    </div>
                                </a>
                            </div>
                            <div class="sidebar-message">
                                <a href="#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="img/a7.jpg">
                                    </div>
                                    <div class="media-body">
                                        Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes
                                        from a line in section 1.10.32.
                                        <br>
                                        <small class="text-muted">Yesterday 2:45 pm</small>
                                    </div>
                                </a>
                            </div>
                            <div class="sidebar-message">
                                <a href="#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="img/a3.jpg">
                                        <div class="m-t-xs">
                                            <i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i
                                                class="fa fa-star text-warning"></i>
                                        </div>
                                    </div>
                                    <div class="media-body">
                                        The standard chunk of Lorem Ipsum used since the 1500s is reproduced below.
                                        <br>
                                        <small class="text-muted">Yesterday 1:10 pm</small>
                                    </div>
                                </a>
                            </div>
                            <div class="sidebar-message">
                                <a href="#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="img/a4.jpg">
                                    </div>
                                    <div class="media-body">
                                        Uncover many web sites still in their infancy. Various versions have.
                                        <br>
                                        <small class="text-muted">Monday 8:37 pm</small>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div id="tab-2" class="tab-pane">
                        <div class="sidebar-title">
                            <h3>
                                <i class="fa fa-cube"></i>Latest projects</h3>
                            <small><i class="fa fa-tim"></i>You have 14 projects. 10 not completed.</small>
                        </div>
                        <ul class="sidebar-list">
                            <li><a href="#">
                                <div class="small pull-right m-t-xs">
                                    9 hours ago</div>
                                <h4>
                                    Business valuation</h4>
                                It is a long established fact that a reader will be distracted.
                                <div class="small">
                                    Completion with: 22%</div>
                                <div class="progress progress-mini">
                                    <div style="width: 22%;" class="progress-bar progress-bar-warning">
                                    </div>
                                </div>
                                <div class="small text-muted m-t-xs">
                                    Project end: 4:00 pm - 12.06.2014</div>
                            </a></li>
                            <li><a href="#">
                                <div class="small pull-right m-t-xs">
                                    9 hours ago</div>
                                <h4>
                                    Contract with Company
                                </h4>
                                Many desktop publishing packages and web page editors.
                                <div class="small">
                                    Completion with: 48%</div>
                                <div class="progress progress-mini">
                                    <div style="width: 48%;" class="progress-bar">
                                    </div>
                                </div>
                            </a></li>
                            <li><a href="#">
                                <div class="small pull-right m-t-xs">
                                    9 hours ago</div>
                                <h4>
                                    Meeting</h4>
                                By the readable content of a page when looking at its layout.
                                <div class="small">
                                    Completion with: 14%</div>
                                <div class="progress progress-mini">
                                    <div style="width: 14%;" class="progress-bar progress-bar-info">
                                    </div>
                                </div>
                            </a></li>
                            <li><a href="#"><span class="label label-primary pull-right">NEW</span>
                                <h4>
                                    The generated</h4>
                                There are many variations of passages of Lorem Ipsum available.
                                <div class="small">
                                    Completion with: 22%</div>
                                <div class="small text-muted m-t-xs">
                                    Project end: 4:00 pm - 12.06.2014</div>
                            </a></li>
                            <li><a href="#">
                                <div class="small pull-right m-t-xs">
                                    9 hours ago</div>
                                <h4>
                                    Business valuation</h4>
                                It is a long established fact that a reader will be distracted.
                                <div class="small">
                                    Completion with: 22%</div>
                                <div class="progress progress-mini">
                                    <div style="width: 22%;" class="progress-bar progress-bar-warning">
                                    </div>
                                </div>
                                <div class="small text-muted m-t-xs">
                                    Project end: 4:00 pm - 12.06.2014</div>
                            </a></li>
                            <li><a href="#">
                                <div class="small pull-right m-t-xs">
                                    9 hours ago</div>
                                <h4>
                                    Contract with Company
                                </h4>
                                Many desktop publishing packages and web page editors.
                                <div class="small">
                                    Completion with: 48%</div>
                                <div class="progress progress-mini">
                                    <div style="width: 48%;" class="progress-bar">
                                    </div>
                                </div>
                            </a></li>
                            <li><a href="#">
                                <div class="small pull-right m-t-xs">
                                    9 hours ago</div>
                                <h4>
                                    Meeting</h4>
                                By the readable content of a page when looking at its layout.
                                <div class="small">
                                    Completion with: 14%</div>
                                <div class="progress progress-mini">
                                    <div style="width: 14%;" class="progress-bar progress-bar-info">
                                    </div>
                                </div>
                            </a></li>
                            <li><a href="#"><span class="label label-primary pull-right">NEW</span>
                                <h4>
                                    The generated</h4>
                                <!--<div class="small pull-right m-t-xs">9 hours ago</div>-->
                                There are many variations of passages of Lorem Ipsum available.
                                <div class="small">
                                    Completion with: 22%</div>
                                <div class="small text-muted m-t-xs">
                                    Project end: 4:00 pm - 12.06.2014</div>
                            </a></li>
                        </ul>
                    </div>
                    <div id="tab-3" class="tab-pane">
                        <div class="sidebar-title">
                            <h3>
                                <i class="fa fa-gears"></i>Settings</h3>
                            <small><i class="fa fa-tim"></i>You have 14 projects. 10 not completed.</small>
                        </div>
                        <div class="setings-item">
                            <span>Show notifications </span>
                            <div class="switch">
                                <div class="onoffswitch">
                                    <input type="checkbox" name="collapsemenu" class="onoffswitch-checkbox" id="example">
                                    <label class="onoffswitch-label" for="example">
                                        <span class="onoffswitch-inner"></span><span class="onoffswitch-switch"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="setings-item">
                            <span>Disable Chat </span>
                            <div class="switch">
                                <div class="onoffswitch">
                                    <input type="checkbox" name="collapsemenu" checked class="onoffswitch-checkbox" id="example2">
                                    <label class="onoffswitch-label" for="example2">
                                        <span class="onoffswitch-inner"></span><span class="onoffswitch-switch"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="setings-item">
                            <span>Enable history </span>
                            <div class="switch">
                                <div class="onoffswitch">
                                    <input type="checkbox" name="collapsemenu" class="onoffswitch-checkbox" id="example3">
                                    <label class="onoffswitch-label" for="example3">
                                        <span class="onoffswitch-inner"></span><span class="onoffswitch-switch"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="setings-item">
                            <span>Show charts </span>
                            <div class="switch">
                                <div class="onoffswitch">
                                    <input type="checkbox" name="collapsemenu" class="onoffswitch-checkbox" id="example4">
                                    <label class="onoffswitch-label" for="example4">
                                        <span class="onoffswitch-inner"></span><span class="onoffswitch-switch"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="setings-item">
                            <span>Offline users </span>
                            <div class="switch">
                                <div class="onoffswitch">
                                    <input type="checkbox" checked name="collapsemenu" class="onoffswitch-checkbox" id="example5">
                                    <label class="onoffswitch-label" for="example5">
                                        <span class="onoffswitch-inner"></span><span class="onoffswitch-switch"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="setings-item">
                            <span>Global search </span>
                            <div class="switch">
                                <div class="onoffswitch">
                                    <input type="checkbox" checked name="collapsemenu" class="onoffswitch-checkbox" id="example6">
                                    <label class="onoffswitch-label" for="example6">
                                        <span class="onoffswitch-inner"></span><span class="onoffswitch-switch"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="setings-item">
                            <span>Update everyday </span>
                            <div class="switch">
                                <div class="onoffswitch">
                                    <input type="checkbox" name="collapsemenu" class="onoffswitch-checkbox" id="example7">
                                    <label class="onoffswitch-label" for="example7">
                                        <span class="onoffswitch-inner"></span><span class="onoffswitch-switch"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="sidebar-content">
                            <h4>
                                Settings</h4>
                            <div class="small">
                                I belive that. Lorem Ipsum is simply dummy text of the printing and typesetting
                                industry. And typesetting industry. Lorem Ipsum has been the industry's standard
                                dummy text ever since the 1500s. Over the years, sometimes by accident, sometimes
                                on purpose (injected humour and the like).
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
