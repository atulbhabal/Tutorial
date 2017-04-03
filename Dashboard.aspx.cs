using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Data;
using System.Web.Script.Serialization;
using System.Text;

public partial class Dashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static string getBudget()
    {
        string dtresult = string.Empty;
        DataTable dt = new DataTable();
        string query = "SELECT ID_BUDGET,PRJ_NO,OVERALL_BUDGET from CIS5.PRJ_WAF_BUDGET where rownum <=10";

        try
        {
            DBCode dbcode = new DBCode();
            dt = dbcode.getDataTable(query);

            dtresult = DataTableToJSONWithJavaScriptSerializer(dt);
        }
        catch (Exception ex)
        {
            string s = ex.Message;
            // throw;
        }
        return dtresult;
    }


    [WebMethod]
    public static string getManpower()
    {
        string dtresult = string.Empty;
        DataTable dt = new DataTable();
        StringBuilder query = new StringBuilder();
        query.Append("SELECT ALL GP_ID, GP_SORT_ORDER, sum(CASE When sex = 'Male' then 1 end ) Gendar_M, sum(CASE When sex = 'Female' then 1 end ) Gendar_F,");
        query.Append("count(*) tot, round(avg(cis5.EMP_AGE_FOR_DATE('31-jul-16',cis_emp_emp_code,null)),2) avg_age, round(avg((last_day('01-jul-16')-EMP_JOIN_DT)/365),2) avg_exp,");
        query.Append("sum(CASE When catg = 'ENG' then 1 end ) CATG_engg, sum(CASE When catg = 'MOD' then 1 end ) CATG_DESGN, sum(CASE When catg = 'OTH' then 1 end ) CATG_OTH,");
        query.Append("Round(cis5.hr_manpower.gp_att('31-dec-16',GP_ID),2) Attrition,Round(cis5.hr_manpower.gp_att('31-dec-16','%'),2) Attrition_All, 100 Percent ");
        query.Append("FROM CIS5.CS_MANPOWER_VW   group by  GP_ID, GP_TYPE, GP_SORT_ORDER ORDER BY GP_SORT_ORDER");

        try
        {
            DBCode dbcode = new DBCode();
            dt = dbcode.getDataTable(query.ToString());

            dtresult = DataTableToJSONWithJavaScriptSerializer(dt);
        }
        catch (Exception ex)
        {
            string s = ex.Message;
            // throw;
        }
        return dtresult;
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