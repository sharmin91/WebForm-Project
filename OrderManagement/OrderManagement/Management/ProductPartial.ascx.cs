using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OrderManagement.Management
{
    public partial class ProductPartial : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void FormView1_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            FileUpload fu = FormView1.FindControl("fu") as FileUpload;
            if (fu != null)
            {
                if (fu.HasFile)
                {
                    string ext = Path.GetExtension(fu.FileName);
                    string fileName = Path.GetFileNameWithoutExtension(Path.GetRandomFileName()) + ext;
                    string savePath = Path.Combine(Server.MapPath("~/Uploads"), fileName);
                    fu.PostedFile.SaveAs(savePath);
                    e.Values["Picture"] = fileName;
                }
                else
                {
                    e.Cancel = true;
                }
            }
            else
            {
                e.Cancel = true;
            }
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            FileUpload fu = GridView1.Rows[e.RowIndex].FindControl("fu") as FileUpload;
            if (fu != null)
            {
                if (fu.HasFile)
                {
                    string ext = Path.GetExtension(fu.FileName);
                    string fileName = Path.GetFileNameWithoutExtension(Path.GetRandomFileName()) + ext;
                    string savePath = Path.Combine(Server.MapPath("~/Uploads"), fileName);
                    fu.PostedFile.SaveAs(savePath);
                    e.NewValues["Picture"] = fileName;
                }

            }

        }
    }
}