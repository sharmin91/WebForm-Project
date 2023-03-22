using OrderManagement.Reports;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace OrderManagement.Management
{
    public partial class Report2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString))
            {
                using (SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Categories", con))
                {
                    DataSet ds = new DataSet();
                    da.Fill(ds, "Categories");
                    da.SelectCommand.CommandText = "SELECT * FROM Products";
                    da.Fill(ds, "Products1");
                    var dt = ds.Tables["Products1"];
                    dt.Columns.Add(new DataColumn("image", typeof(System.Byte[])));
                    for(var i=0; i< dt.Rows.Count; i++)
                    {
                        dt.Rows[i]["image"] = File.ReadAllBytes(Path.Combine(Server.MapPath("~/Uploads"), dt.Rows[i]["Picture"].ToString()));
                    }
                    CrystalReport2 rpt = new CrystalReport2();
                    rpt.SetDataSource(ds);
                    CrystalReportViewer1.ReportSource = rpt;
                    CrystalReportViewer1.RefreshReport();
                }
            }

        }
    }
}