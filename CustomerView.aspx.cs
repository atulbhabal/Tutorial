using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.Services;

public partial class CustomerView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [System.Web.Services.WebMethod(EnableSession = true)]
    public static string getData()
    {
        string dtresult = string.Empty;
        DataTable dt = new DataTable();
        if (HttpContext.Current.Session["CustomerInitials"] != null)
        {
            string CustomerInitials = HttpContext.Current.Session["CustomerInitials"].ToString();
            string query = "select * from [Order] where orderid LIKE '%" + CustomerInitials + "%' ";

            try
            {
                dt = getDataTable(query);

                dtresult = DataTableToJSONWithJavaScriptSerializer(dt);
            }
            catch (Exception ex)
            {
                string s = ex.Message;
                // throw;
            }
        }
        return dtresult;
    }


    /// <summary>
    /// To get data in DataTable
    /// </summary>
    /// <param name="query">Pass select query as a string</param>
    /// <returns></returns>
    public static DataTable getDataTable(string query)
    {
        string connStr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
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

    public static string DataTableToJSONWithJavaScriptSerializer(DataTable table)
    {
        JavaScriptSerializer jsSerializer = new JavaScriptSerializer();
        List<Dictionary<string, object>> parentRow = new List<Dictionary<string, object>>();
        Dictionary<string, object> childRow;
        foreach (DataRow row in table.Rows)
        {
            childRow = new Dictionary<string, object>();
            foreach (DataColumn col in table.Columns)
            {
                childRow.Add(col.ColumnName, row[col]);
            }
            parentRow.Add(childRow);
        }
        return jsSerializer.Serialize(parentRow);
    }
}