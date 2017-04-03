using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class AddDistributor : System.Web.UI.Page
{
    DBCode dbcode = new DBCode();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillGrid();
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        int userId = 0;
        string constr = DBCode.getSqlConnectionstring();
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("Insert_Distributor"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@name", txtDistributorName.Text.Trim());
                    cmd.Parameters.AddWithValue("@address", txtAddress.Text.Trim());
                    cmd.Parameters.AddWithValue("@mobile", txtContactNumber.Text.Trim());
                    cmd.Parameters.AddWithValue("@flag", "INSERT");
                   
                    cmd.Connection = con;
                    con.Open();
                    userId = Convert.ToInt32(cmd.ExecuteScalar());
                    con.Close();
                }
            }
            if (userId > 0)
            {
                lblmsg.Text = "Distributor add successfully.";
                lblmsg.ForeColor = System.Drawing.Color.Green;
                FillGrid();
            }
            else if (userId == -1)
            {
                lblmsg.Text = "Distributor already exist.";
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
            dt = dbcode.getDataTable("select row_number() over(order by id desc) SrNo, * from mst_distributor Order by id DESC");
            gvDistributor.DataSource = dt;
            gvDistributor.DataBind();
        }
        catch (Exception ex)
        {
            
            throw;
        }
    }

    protected void gvDistributor_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
    {
        //NewEditIndex property used to determine the index of the row being edited.  
        gvDistributor.EditIndex = e.NewEditIndex;
        FillGrid();
    }
    protected void gvDistributor_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
    {
        int userId = 0;
        //Finding the controls from Gridview for the row which is going to update  
        Label id = gvDistributor.Rows[e.RowIndex].FindControl("lbl_ID") as Label;
        TextBox name = gvDistributor.Rows[e.RowIndex].FindControl("txt_name") as TextBox;
        TextBox address = gvDistributor.Rows[e.RowIndex].FindControl("txt_address") as TextBox;
        TextBox mobile = gvDistributor.Rows[e.RowIndex].FindControl("txt_mobile") as TextBox;

        string constr = DBCode.getSqlConnectionstring();
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("Insert_Distributor"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@name", name.Text.Trim());
                    cmd.Parameters.AddWithValue("@address", address.Text.Trim());
                    cmd.Parameters.AddWithValue("@mobile", mobile.Text.Trim());
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
                lblmsg.Text = "Distributor updated successfully.";
                lblmsg.ForeColor = System.Drawing.Color.Green;
                FillGrid();
            }
            else if (userId == -1)
            {
                lblmsg.Text = "Distributor already exist.";
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                lblmsg.Text = "System Error.";
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            gvDistributor.EditIndex = -1;
            //Call ShowData method for displaying updated data  
            FillGrid();
        }
    }
    protected void gvDistributor_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
    {
        //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
        gvDistributor.EditIndex = -1;
        FillGrid();
    }  

    protected void btnCancel_Click(object sender, EventArgs e)
    {

    }
}