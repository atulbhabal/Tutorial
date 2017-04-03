using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class SiteMaster : System.Web.UI.MasterPage
{
    DBCode dbcode = new DBCode();
    string mem_id = "627";
    protected void Page_Load(object sender, EventArgs e)
    {
        CreateMaster();
    }

    public void CreateMaster()
    {
        if (Session["ClientName"] != null)
        {
            lblClientName.Text = Session["ClientName"].ToString();
        }
    
    }
}
