using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace OrderManagement.App_Code
{
    public class CategoryRepo
    {
        SqlConnection con;
        public CategoryRepo()
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString);
        }
        public IList<Category> Get()
        {
            using(SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Categories", con))
            {
                DataTable dt = new DataTable();
                da.Fill(dt);
                
               var data= dt.AsEnumerable()                    
                    .Select(r =>
                    
                        new Category
                        {
                            CategoryId = r.Field<int>("CategoryId"),
                            CategoryName = r.Field<string>("CategoryName"),
                            Description = r.Field<string>("Description")
                        }
                    ).ToList();
                return data;
            }
        }
        public void Insert(Category category) { }
        public void Update(Category category) { }
        public void Delete(Category category) { }
        public int CategoryCount()
        {
            using(SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Categories", con))
            {
                con.Open();
                int n = (int)cmd.ExecuteScalar();
                con.Close();
                return n;
            }
        }
    }
}