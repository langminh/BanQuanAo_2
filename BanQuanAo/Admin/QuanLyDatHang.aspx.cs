using BanQuanAo.Entity.EF;
using BanQuanAo.Helper;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BanQuanAo.Admin
{
    public partial class QuanLyDatHang : System.Web.UI.Page
    {
        private databasequanaoEntities1 db = new databasequanaoEntities1();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                var session = (LoginSession)Session[CommonContanst.USER_SESSION];
                if (session != null)
                {
                    if (session.role == 1)
                    {
                        //if (session.RememberMe)
                        {
                            load();
                        }
                    }
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }

            }
        }

        void load()
        {
            var result = from c in db.tbl_Order select c;
            GridView1.DataSource = result.ToList();
            GridView1.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (txtName.Text.Length > 0)
            {
                try
                {
                    var result = db.tbl_Order.Where(x => x.Order_ID.ToUpper().Contains(txtName.Text.ToUpper()) || x.Order_ID.Equals(txtName.Text)).ToList();
                    GridView1.DataSource = result;
                    GridView1.DataBind();
                }
                catch { }
            }
        }
    }
}