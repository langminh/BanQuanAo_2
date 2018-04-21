using BanQuanAo.Entity.EF;
using BanQuanAo.Helper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BanQuanAo
{
    public partial class ChiTietSanPham : BasePage
    {
        private databasequanaoEntities1 db = new databasequanaoEntities1();
        protected List<BanQuanAo.Entity.EF.Image> images = new List<BanQuanAo.Entity.EF.Image>();
        public int amount = 1;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["Product_ID"] != null)
            {

                string id = Request.QueryString["Product_ID"];
                tbl_Product product = db.tbl_Product.Find(Int32.Parse(id));
                lbTenSp.Text = product.Product_Name;
                lbDes.Text = product.Description;
                txtContent.Text = Server.HtmlDecode(product.Content);
                images = db.Images.Where(x => x.ProductID == product.Product_ID).Take(6).ToList();
                //imgproduct.ImageUrl = "~/Images/" + product.Image;
            }

            if (!Page.IsPostBack)
            {
                TextBox1.Text = "1";
            }

            msg.Visible = false;
            msg.Text = "";
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            try
            {
                int quantity = int.Parse(TextBox1.Text);
                string id = Request.QueryString["Product_ID"];
                
                //Session[CommonContanst.CART_SESSION] += ("" + id + "_" + TextBox1.Text + "#");
                Response.Redirect("GioHang.aspx?id=" + id+"&soluong="+ TextBox1.Text);
            }
            catch(Exception ex)
            {
                msg.Visible = true;
                msg.Text = GetGlobalResourceObject("bqa.language", "lbFormat").ToString();
                msg.ForeColor = System.Drawing.Color.Red;
                TextBox1.Text = "1";
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                amount = int.Parse(TextBox1.Text);
                amount++;
                TextBox1.Text = amount + "";
            }
            catch
            {
                msg.Visible = true;
                msg.Text = GetGlobalResourceObject("bqa.language", "lbFormat").ToString();
                msg.ForeColor = System.Drawing.Color.Red;
                TextBox1.Text = "1";
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            try
            {
                amount = int.Parse(TextBox1.Text);
                if (amount > 0)
                {
                    amount--;
                    TextBox1.Text = amount + "";
                }
            }
            catch
            {
                msg.Visible = true;
                msg.Text = "Định dạng nhập vào không chính xác. Vui lòng nhập lại.";
                msg.ForeColor = System.Drawing.Color.Red;
                TextBox1.Text = "1";
            }
        }
    }
}