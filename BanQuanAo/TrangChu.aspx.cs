using BanQuanAo.Entity.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BanQuanAo
{
    public partial class TrangChu1 : BasePage
    {
        private databasequanaoEntities1 db = new databasequanaoEntities1();
        protected List<Slide> listSlide = new List<Slide>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                load();
            }
        }
        void load()
        {
            listSlide = db.Slides.Where(x => x.show == true).OrderByDescending(x => x.CreateTime).Take(4).ToList();

            type.DataSource = db.tbl_Type.Take(3).ToList();
            type.DataBind();

            var result = (from c in db.tbl_Product select c).Take(10); ;
            sanpham.DataSource = result.ToList();
            sanpham.DataBind();

            var list = db.tbl_Product.OrderByDescending(x => x.Order).Take(10).ToList();
            listBan.DataSource = list;
            listBan.DataBind();

            var l = db.tbl_Product.OrderByDescending(x => x.CreateDate).Take(10).ToList();
            listMoi.DataSource = l;
            listMoi.DataBind();
        }
    }
}