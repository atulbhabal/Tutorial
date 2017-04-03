<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="AddCustomer.aspx.cs" Inherits="AddCustomer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="Server">
    <div id="page-wrapper" class="gray-bg">
        
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>
                    Add Customer</h2>
                <ol class="breadcrumb">
                    <li><a href="index.aspx">Home</a> </li>
                    <li class="active"><strong>Order Form</strong> </li>
                </ol>
                <asp:Label ID="lblmsg" runat="server"></asp:Label>
            </div>
            <div class="col-lg-2">
            </div>
        </div>
        <asp:UpdatePanel ID="updatepanel" runat="server">
            <ContentTemplate>
                <div class="wrapper wrapper-content animated fadeInRight">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title">
                                    <h5>
                                        Customer Master<small></small>
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
                                                <asp:TextBox ID="txtCustomerName" runat="server" CssClass="form-control"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfvOrderBy" runat="server" ValidationGroup="ordersubmit"
                                                    ControlToValidate="txtCustomerName" ForeColor="Red" ErrorMessage="Please enter customer name.">
                                                </asp:RequiredFieldValidator>
                                            </div>
                                            <label class="col-sm-2 control-label">
                                                Address</label>
                                            <div class="col-sm-3">
                                                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="hr-line-dashed">
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">
                                                Mobile Number</label>
                                            <div class="col-sm-3">
                                                <p class="form-control-static">
                                                    <asp:TextBox ID="txtContactNumber" runat="server" CssClass="form-control"></asp:TextBox>
                                                </p>
                                            </div>
                                            <label class="col-sm-2 control-label">
                                                Distributor</label>
                                            <div class="col-sm-3">
                                                <asp:DropDownList ID="ddlDistributor" CssClass="select2_demo_3 form-control" runat="server"></asp:DropDownList>
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
                                        <div class="hr-line-dashed">
                                        </div>
                                        <div class="table-responsive">
                                            <asp:GridView ID="gvCustomer" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered table-hover dataTables-example"
                                                OnRowEditing="gvCustomer_RowEditing" OnRowUpdating="gvCustomer_RowUpdating"
                                                OnRowCancelingEdit="gvCustomer_RowCancelingEdit" OnRowDataBound="gvCustomer_RowDataBound">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="id" HeaderStyle-CssClass="hideColumn" ItemStyle-CssClass="hideColumn">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_ID" runat="server" Text='<%#Eval("id") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Sr. No">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_SR" runat="server" Text='<%#Eval("SrNo") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Customer">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_name" runat="server" Text='<%#Eval("name") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txt_name" CssClass="form-control" runat="server" Text='<%#Eval("name") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Address">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_address" runat="server" Text='<%#Eval("address") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txt_address" CssClass="form-control" runat="server" Text='<%#Eval("address") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Contact">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_mobile" runat="server" Text='<%#Eval("mobile") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txt_mobile" CssClass="form-control" runat="server" Text='<%#Eval("mobile") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Distributor">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_distributorname" runat="server" Text='<%#Eval("distributorname") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:DropDownList ID="ddlDistributorGrid" CssClass="select2_demo_3 form-control" runat="server"></asp:DropDownList>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:Button ID="btn_Edit" runat="server" Text="Edit" CssClass="btn btn-white" CommandName="Edit" />
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:Button ID="btn_Update" runat="server" CssClass="btn btn-primary" Text="Update"
                                                                CommandName="Update" />
                                                            <asp:Button ID="btn_Cancel" runat="server" CssClass="btn btn-white" Text="Cancel"
                                                                CommandName="Cancel" />
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
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
