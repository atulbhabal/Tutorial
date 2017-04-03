using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

/// <summary>
/// Summary description for DBCode
/// </summary>
public class DBCode
{
    string connStr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

    public DataTable getDataTable(string query)
    {
        try
        {
            SqlConnection con = new SqlConnection(connStr);
            SqlDataAdapter sda = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            return dt;

        }
        catch (Exception ex)
        {
            string a = ex.Message;
            return null;
        }
    }

    public String executeScalar(string query)
    {
        try
        {
            SqlConnection con = new SqlConnection(connStr);
            con.Open();
            SqlCommand cmd = new SqlCommand(query, con);
            string o = Convert.ToString(cmd.ExecuteScalar());
            con.Close();
            return o;
        }
        catch (Exception ex)
        {
            string a = ex.Message;
            return null;
        }
    }

    public bool executeQuery(string query)
    {
        try
        {
            SqlConnection con = new SqlConnection(connStr);
            con.Open();
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();
            con.Close();
            return true;
        }
        catch (Exception ex)
        {
            string a = ex.Message;
            return false;
        }
    }



    public static SqlConnection getSqlConnection()
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["constr"]);
        return con;
    }

    public static string getSqlConnectionstring()
    {
        return ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
    }

    public string executeScalar(string p, string p_2)
    {
        throw new NotImplementedException();
    }

}