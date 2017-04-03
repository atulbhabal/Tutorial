using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class OrderForm : System.Web.UI.Page
{
    DataTable dtUser = new DataTable();
    DBCode dbcode = new DBCode();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Session["CustomerInitials"] != null)
            {
                dtUser = dbcode.getDataTable("select * from login where orderid='" + Session["CustomerInitials"].ToString() + "'");
                if (dtUser != null)
                {
                    if (dtUser.Rows.Count > 0)
                    {
                        txtCustomerName.Text = dtUser.Rows[0]["username"].ToString();
                        SetOrderID(dtUser.Rows[0]["orderid"].ToString().Trim());
                    }
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }

        }
    }

    protected void SetOrderID(string orderidInitials)
    {
        DataTable dt = new DataTable();
        dt = dbcode.getDataTable("select * from [Order] where orderid LIKE '%" + orderidInitials + "%' order by id DESC");
        if (dt.Rows.Count > 0)
        {
            int num = Convert.ToInt32(dt.Rows[0]["orderid"].ToString().Substring(2)) + 1;
            txtOrderNumber.Text = orderidInitials + num;
        }
        else
        {
            txtOrderNumber.Text = orderidInitials + "1";
        }

    }


    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        int userId = 0;
        string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("Insert_Order"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@userid", txtCustomerName.Text.Trim());
                    cmd.Parameters.AddWithValue("@given_by", txtOrderBy.Text.Trim());
                    cmd.Parameters.AddWithValue("@orderid", txtOrderNumber.Text.Trim());
                    cmd.Parameters.AddWithValue("@c_orderid", txtCustomerOrderNumber.Text.Trim());
                    cmd.Parameters.AddWithValue("@design_number", txtDesignNumber.Text.Trim());
                    cmd.Parameters.AddWithValue("@melting", ddlMelting.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@pcs", txtPCS.Text.Trim());
                    cmd.Parameters.AddWithValue("@weight", txtWeight.Text.Trim());
                    cmd.Parameters.AddWithValue("@size", txtSize.Text.Trim());
                    cmd.Parameters.AddWithValue("@format", ddlFormat.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@rhodium", ddlRHODIUM.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@anyother", txtAnyOther.Text.Trim());
                    cmd.Parameters.AddWithValue("@dilivery_date", txtDate.Text.Trim());
                    if (flpImage.HasFile)
                    {
                        cmd.Parameters.AddWithValue("@img", flpImage.FileName);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@img", "noimage.jpg");
                    }

                    cmd.Connection = con;
                    con.Open();
                    userId = Convert.ToInt32(cmd.ExecuteScalar());
                    con.Close();
                }
            }
            if (userId > 0)
            {
                lblmsg.Text = "Order placed successfully.";
                lblmsg.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                lblmsg.Text = "System Error.";
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {

    }
}