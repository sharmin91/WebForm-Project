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
    public partial class Orders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if(e.Item.ItemType == ListItemType.Item)
            {
                int id = int.Parse(DataBinder.Eval(e.Item.DataItem, "OrderId").ToString());
                using(SqlConnection con= new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString))
                {
                    using(SqlDataAdapter da = new SqlDataAdapter(@"SELECT ProductName, Price, Quantity FROM OrderItems oi
                                                    INNER JOIN Products p ON p.ProductId = oi.ProductId
                                                    WHERE OrderId="+id, con))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        var dg = e.Item.FindControl("GridView1") as GridView;
                        dg.DataSource = dt;
                        dg.DataBind();
                    }
                }
            }
        }
    }
}