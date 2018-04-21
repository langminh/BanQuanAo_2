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
    public partial class QuanLyHinhThucGiaoHang : System.Web.UI.Page
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
            var result = db.tbl_Transport.ToList();

            GridView1.DataSource = result;
            GridView1.DataBind();
        }
        void reset()
        {
            txtMaVanChuyen.Text = "";
            txtTenVanChuyen.Text = "";
        }
        protected void btnThem_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtTenVanChuyen.Text.Length > 0)
                {
                    tbl_Transport tsp = new tbl_Transport();
                    tsp.Transport_Name = txtTenVanChuyen.Text;
                    tsp.PhiVC = double.Parse(txtPhi.Text);
                    db.tbl_Transport.Add(tsp);
                    db.SaveChanges();
                    load();
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
                lbThongBao.Text = "Đã có lỗi xảy ra. Vui lòng thử lại sau.";
                lbThongBao.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void btnSua_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtTenVanChuyen.Text.Length > 0 && txtMaVanChuyen.Text.Length > 0)
                {

                    tbl_Transport tsp = db.tbl_Transport.Find(int.Parse(txtMaVanChuyen.Text));

                    tsp.Transport_Name = txtTenVanChuyen.Text;
                    tsp.PhiVC = double.Parse(txtPhi.Text);
                    db.SaveChanges();
                    load();
                    lbThongBao.Text = "sửa thành công";
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
                lbThongBao.Text = "Đã có lỗi xảy ra. Vui lòng thử lại sau.";
                lbThongBao.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void btnXoa_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtMaVanChuyen.Text.Length > 0)
                {
                    tbl_Transport tsp = db.tbl_Transport.Find(int.Parse(txtMaVanChuyen.Text));
                    db.tbl_Transport.Remove(tsp);
                    db.SaveChanges();
                    load();
                    lbThongBao.Text = "Xóa thành công";
                    lbThongBao.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    lbThongBao.Text = "Chưa Chọn dữ liệu";
                    lbThongBao.ForeColor = System.Drawing.Color.Red;
                }
            }
            catch (Exception ex)
            {
                lbThongBao.Text = "Đã có lỗi xảy ra. Vui lòng thử lại sau.";
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
            txtMaVanChuyen.Text = row.Cells[0].Text;
            txtTenVanChuyen.Text = row.Cells[1].Text;
        }
    }
}