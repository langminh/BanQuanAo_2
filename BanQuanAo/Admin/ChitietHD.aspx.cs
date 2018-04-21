using BanQuanAo.Entity.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BanQuanAo.Admin
{
    public partial class ChitietHD : System.Web.UI.Page
    {
        databasequanaoEntities1 db = new databasequanaoEntities1();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                load();
            }
        }
        void load()
        {
            string id = Request.QueryString["Order_ID"];
            var result = db.tbl_OrderDetial.Where(x => x.Order_ID == id).ToList();
            GridView1.DataSource = result.ToList();
            GridView1.DataBind();
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("QuanLyDatHang.aspx");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int index = GridView1.SelectedIndex;

                GridViewRow row = GridView1.SelectedRow;

                string id1 =row.Cells[0].Text;
                int id2 = int.Parse(row.Cells[1].Text);

                tbl_OrderDetial od = db.tbl_OrderDetial.Find(id1, id2);
                od.State = "Đã xử lý";
                db.SaveChanges();
                load();
            }
            catch (Exception ex)
            {

            }
        }
    }
}