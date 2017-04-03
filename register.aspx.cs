using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        int userId = 0;
        string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("Insert_User"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@username", txtusername.Text.Trim());
                    cmd.Parameters.AddWithValue("@password", txtPassword.Text.Trim());
                    cmd.Parameters.AddWithValue("@orderid", txtOrderid.Text.Trim());
                    if (rdbTypeClient.Checked == true)
                    {
                        cmd.Parameters.AddWithValue("@role", "client");
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@role", "admin");
                    }
                    cmd.Parameters.AddWithValue("@status", "Y");
                    cmd.Connection = con;
                    con.Open();
                    userId = Convert.ToInt32(cmd.ExecuteScalar());
                    con.Close();
                }
            }
            string message = string.Empty;
            switch (userId)
            {
                case -1:
                    lblmsg.Text = "Username already exists.Please choose a different username.";
                    break;
                case -2:
                    lblmsg.Text = "Supplied order id has already been used.";
                    break;
                default:
                    lblmsg.Text = "Registration successful.";
                    clearfield();
                    break;
            }
        }
    }

    public void clearfield()
    {
        txtusername.Text = "";
        txtPassword.Text = "";
        txtOrderid.Text = "";
    }
}