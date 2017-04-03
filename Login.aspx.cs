using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from login where username =@username and password=@password", con);
        cmd.Parameters.AddWithValue("@username", txtUsername.Text);
        cmd.Parameters.AddWithValue("@password", txtPassword.Text);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            Session["CustomerInitials"] = dt.Rows[0]["orderid"].ToString().Trim();
            Session["ClientName"] = dt.Rows[0]["username"].ToString().Trim();
            if (dt.Rows[0]["role"].ToString().Trim() == "client")
            {
                Session["type"] = "Customer";
                Response.Redirect("OrderForm.aspx");
            }
            else
            {
                Session["type"] = "Admin";
                Response.Redirect("AdminDashboard.aspx");
            }
        }
        else
        {
            lblmsg.Text="Invalid Username and Password.";
        }
    }
}