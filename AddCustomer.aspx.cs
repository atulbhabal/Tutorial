using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class AddCustomer : System.Web.UI.Page
{
    DBCode dbcode = new DBCode();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillGrid();
            FillDistributor();
        }
    }

    protected void FillDistributor()
    {
        try
        {
            DataTable dt = new DataTable();
            dt = dbcode.getDataTable("select * from mst_distributor Order by id DESC");
            ddlDistributor.DataSource = dt;
            ddlDistributor.DataValueField="id";
            ddlDistributor.DataTextField = "name";
            ddlDistributor.DataBind();
        }
        catch (Exception ex)
        {

            throw;
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        int userId = 0;
        string constr = DBCode.getSqlConnectionstring();
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("Insert_Customer"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@name", txtCustomerName.Text.Trim());
                    cmd.Parameters.AddWithValue("@address", txtAddress.Text.Trim());
                    cmd.Parameters.AddWithValue("@mobile", txtContactNumber.Text.Trim());
                    cmd.Parameters.AddWithValue("@distributorid", ddlDistributor.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@flag", "INSERT");

                    cmd.Connection = con;
                    con.Open();
                    userId = Convert.ToInt32(cmd.ExecuteScalar());
                    con.Close();
                }
            }
            if (userId > 0)
            {
                lblmsg.Text = "Customer add successfully.";
                lblmsg.ForeColor = System.Drawing.Color.Green;
                FillGrid();
            }
            else if (userId == -1)
            {
                lblmsg.Text = "Customer already exist.";
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                lblmsg.Text = "System Error.";
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
        }
    }

    protected void FillGrid()
    {
        try
        {
            DataTable dt = new DataTable();
            dt = dbcode.getDataTable("select row_number() over(order by mst_customer.id desc) SrNo, mst_customer.*, mst_distributor.name AS distributorname from mst_customer INNER JOIN mst_distributor ON mst_customer.distributor_id = mst_distributor.id ORDER BY mst_customer.id DESC");
            gvCustomer.DataSource = dt;
            gvCustomer.DataBind();
        }
        catch (Exception ex)
        {

            throw;
        }
    }

    protected void gvCustomer_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
    {
        //NewEditIndex property used to determine the index of the row being edited.  
        gvCustomer.EditIndex = e.NewEditIndex;
        FillGrid();
    }
    protected void gvCustomer_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
    {
        int userId = 0;
        //Finding the controls from Gridview for the row which is going to update  
        Label id = gvCustomer.Rows[e.RowIndex].FindControl("lbl_ID") as Label;
        TextBox name = gvCustomer.Rows[e.RowIndex].FindControl("txt_name") as TextBox;
        TextBox address = gvCustomer.Rows[e.RowIndex].FindControl("txt_address") as TextBox;
        TextBox mobile = gvCustomer.Rows[e.RowIndex].FindControl("txt_mobile") as TextBox;
        DropDownList dl = gvCustomer.Rows[e.RowIndex].FindControl("ddlDistributorGrid") as DropDownList; 
        string constr = DBCode.getSqlConnectionstring();
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("Insert_Customer"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@name", name.Text.Trim());
                    cmd.Parameters.AddWithValue("@address", address.Text.Trim());
                    cmd.Parameters.AddWithValue("@mobile", mobile.Text.Trim());
                    cmd.Parameters.AddWithValue("@distributorid", dl.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@id", id.Text.Trim());
                    cmd.Parameters.AddWithValue("@flag", "UPDATE");

                    cmd.Connection = con;
                    con.Open();
                    userId = Convert.ToInt32(cmd.ExecuteScalar());
                    con.Close();
                }
            }
            if (userId > 0)
            {
                lblmsg.Text = "Customer updated successfully.";
                lblmsg.ForeColor = System.Drawing.Color.Green;
                FillGrid();
            }
            else if (userId == -1)
            {
                lblmsg.Text = "Customer already exist.";
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                lblmsg.Text = "System Error.";
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            gvCustomer.EditIndex = -1;
            //Call ShowData method for displaying updated data  
            FillGrid();
        }
    }
    protected void gvCustomer_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
    {
        //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
        gvCustomer.EditIndex = -1;
        FillGrid();
    }

    protected void gvCustomer_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow &&
            (e.Row.RowState & DataControlRowState.Edit) == DataControlRowState.Edit)
        {
            // Here you will get the Control you need like:
            DropDownList dl = (DropDownList)e.Row.FindControl("ddlDistributorGrid");
            DataTable dt = new DataTable();
            dt = dbcode.getDataTable("select * from mst_distributor Order by id DESC");
            dl.DataSource = dt;
            dl.DataValueField = "id";
            dl.DataTextField = "name";
            dl.DataBind();
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {

    }
}