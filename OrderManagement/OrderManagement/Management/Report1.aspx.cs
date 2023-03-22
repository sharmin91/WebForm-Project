using OrderManagement.Reports;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OrderManagement.Management
{
    public partial class Report1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using(SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString))
            {
                using(SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Categories", con))
                {
                    DataSet ds= new DataSet();
                    da.Fill(ds, "Categories");
                    da.SelectCommand.CommandText = "SELECT * FROM Products";
                    da.Fill(ds, "Products");
                    CrystalReport1 rpt = new CrystalReport1();
                    rpt.SetDataSource(ds);
                    CrystalReportViewer1.ReportSource=rpt;
                    CrystalReportViewer1.RefreshReport();
                }
            }
        }
    }
}