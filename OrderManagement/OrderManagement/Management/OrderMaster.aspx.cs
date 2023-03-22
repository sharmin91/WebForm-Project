using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OrderManagement.Management
{
    public partial class OrderMaster : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public int GetOrderId()
        {
            if(this.ListView1.SelectedIndex < 0) return 0;
            else
            {
                return int.Parse(this.ListView1.DataKeys[this.ListView1.SelectedIndex].Values[0].ToString());
            }
        }

        protected void ListView2_ItemInserting(object sender, ListViewInsertEventArgs e)
        {
            e.Values["OrderId"] = this.GetOrderId();
        }

        protected void ListView2_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {

        }
    }
}