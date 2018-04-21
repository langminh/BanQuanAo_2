using BanQuanAo.Entity.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BanQuanAo
{
    public partial class SanPham : BasePage
    {
        private databasequanaoEntities1 db = new databasequanaoEntities1();
        List<tbl_Product> data;
        int _amount = 0;
        int page = 8;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                load();
                loadDropDown();
                data = new List<tbl_Product>();
                if (Request.QueryString["catalog"] != null)
                {

                    string id = Request.QueryString["catalog"];
                    try
                    {
                        int a = int.Parse(id);
                        if (data != null)
                        {
                            data = db.tbl_Product.Where(x => x.Type_ID == a).OrderBy(x => x.CreateDate).ToList();
                            list.DataSource = data;
                            list.DataBind();

                            pager.PageSize = page;
                        }
                    }
                    catch
                    {

                    }
                }
                else
                {
                    if (data != null)
                    {
                        data = db.tbl_Product.OrderBy(x => x.CreateDate).ToList();
                        list.DataSource = data;
                        list.DataBind();

                        pager.PageSize = page;
                    }
                }
            }
        }

        void loadDropDown()
        {
            var listSize_ = db.Sizes.Take(5).ToList();
            listSize.DataSource = listSize_;
            listSize.DataBind();

            var listType = db.tbl_Style.ToList();
            drKieu.DataSource = listType;
            drKieu.DataBind();
        }

        void load()
        {
            var listCatalog = db.tbl_Type.Take(5).ToList();
            catalogList.DataSource = listCatalog;
            catalogList.DataBind();


        }

        protected void filter_Click(object sender, EventArgs e)
        {
            try
            {
                _amount = int.Parse(TextBox1.Text);
                var result = Listfilter();
                result = result.Where(x => x.Price_Export <= _amount).ToList();
                list.DataSource = result;
                list.DataBind();

            }
            catch
            {
                msg.Visible = true;
                msg.Text = GetGlobalResourceObject("bqa.language", "lbFormat").ToString();
                msg.ForeColor = System.Drawing.Color.Red;
                TextBox1.Text = "1";
            }
        }

        protected void Next_Click(object sender, EventArgs e)
        {
            try
            {
                _amount = int.Parse(TextBox1.Text);
                _amount++;
                TextBox1.Text = _amount + "";
            }
            catch
            {
                msg.Visible = true;
                msg.Text = GetGlobalResourceObject("bqa.language", "lbFormat").ToString();
                msg.ForeColor = System.Drawing.Color.Red;
                TextBox1.Text = "1";
            }
        }

        protected void Prev_Click(object sender, EventArgs e)
        {
            try
            {
                _amount = int.Parse(TextBox1.Text);
                if (_amount > 0)
                {
                    _amount--;
                    TextBox1.Text = _amount + "";
                }
            }
            catch
            {
                msg.Visible = true;
                msg.Text = GetGlobalResourceObject("bqa.language", "lbFormat").ToString();
                msg.ForeColor = System.Drawing.Color.Red;
                TextBox1.Text = "1";
            }
        }

        List<tbl_Product> Listfilter()
        {
            var result = db.tbl_Product.ToList();

            int a = filterList.SelectedIndex;
            switch (a)
            {
                case 1:
                    result = result.OrderBy(x => x.Product_Name).ToList();
                    break;
                case 2:
                    result = result.OrderByDescending(x => x.Product_Name).ToList();
                    break;
                case 3:
                    result = result.OrderBy(x => x.Price_Export).ToList();
                    break;
                case 4:
                    result = result.OrderByDescending(x => x.Price_Export).ToList();
                    break;
                default:
                    result = result.OrderByDescending(x => x.CreateDate).ToList();
                    break;
            }

            return result;
        }

        protected void filterList_SelectedIndexChanged(object sender, EventArgs e)
        {
            var result = Listfilter();
            list.DataSource = result;
            list.DataBind();
        }

        protected void drKieu_SelectedIndexChanged(object sender, EventArgs e)
        {
            var result = Listfilter();
            try
            {
                var a = drKieu.Items.FindByValue(drKieu.SelectedValue).Value;
                int b = int.Parse(a);
                result = result.Where(x => x.Type_ID == b).ToList();

                list.DataSource = result;
                list.DataBind();
            }
            catch { }
        }

        protected void listSize_SelectedIndexChanged(object sender, EventArgs e)
        {
            var result = Listfilter();
            try
            {
                var a = listSize.Items.FindByValue(listSize.SelectedValue).Value;
                int b = int.Parse(a);
                result = result.Where(x => x.SizeID == b).ToList();

                list.DataSource = result;
                list.DataBind();
            }
            catch { }
        }
    }
}