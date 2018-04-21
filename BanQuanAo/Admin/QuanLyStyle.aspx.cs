using BanQuanAo.Entity.EF;
using BanQuanAo.Helper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BanQuanAo.Admin
{
    public partial class QuanLyStyle : System.Web.UI.Page
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
            var result = db.tbl_Style.ToList();
            GridView1.DataSource = result;
            GridView1.DataBind();
        }
        void reset()
        {
            txtID.Text = "";
            txtName.Text = "";
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtName.Text.Length > 0)
                {
                    tbl_Style style = new tbl_Style();
                    style.Style_Name = txtName.Text;
                    db.tbl_Style.Add(style);
                    db.SaveChanges();
                    load();
                    reset();
                    lbThongBao.Text = "Thêm thành công";
                    lbThongBao.ForeColor = System.Drawing.Color.Green;

                }
                else
                {
                    lbThongBao.Text = "Chưa nhập dữ liệu";
                    lbThongBao.ForeColor = System.Drawing.Color.Red;
                }
            }
            catch (Exception ex)
            {
                lbThongBao.Text = "Lỗi " + ex.Message;
                lbThongBao.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void btnSua_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtID.Text.Length > 0)
                {
                    tbl_Style style = db.tbl_Style.Find(Int32.Parse(txtID.Text));
                    style.Style_Name = txtName.Text;
                    db.SaveChanges();
                    load();
                    reset();
                    lbThongBao.Text = "Sửa thành công";
                    lbThongBao.ForeColor = System.Drawing.Color.Green;

                }
                else
                {
                    lbThongBao.Text = "Chưa nhập dữ liệu";
                    lbThongBao.ForeColor = System.Drawing.Color.Red;
                }
            }
            catch (Exception ex)
            {
                lbThongBao.Text = "Lỗi " + ex.Message;
                lbThongBao.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void btnXOa_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtID.Text.Length > 0)
                {
                    tbl_Style style = db.tbl_Style.Find(Int32.Parse(txtID.Text));
                    db.tbl_Style.Remove(style);
                    db.SaveChanges();
                    load();
                    reset();
                    lbThongBao.Text = "Xóa thành công";
                    lbThongBao.ForeColor = System.Drawing.Color.Green;

                }
                else
                {
                    lbThongBao.Text = "Chưa nhập dữ liệu";
                    lbThongBao.ForeColor = System.Drawing.Color.Red;
                }
            }
            catch (Exception ex)
            {
                lbThongBao.Text = "Lỗi " + ex.Message;
                lbThongBao.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            reset();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            txtID.Text = row.Cells[0].Text;
            txtName.Text = row.Cells[1].Text;
        }
    }
}