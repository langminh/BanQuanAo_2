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
    public partial class QuanLyNhaCungCap : System.Web.UI.Page
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
            var result = from c in db.tbl_Supplier select c;
            GridView1.DataSource = result.ToList();
            GridView1.DataBind();
        }
        void reset()
        {
            txtDiaChiNhaCungCap.Text = "";
            txtEmail.Text = "";
            txtSoDienThoai.Text = "";
            txtTenNhaCungCap.Text = "";
            txtMaNhaCungCap.Text = "";
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;


            txtMaNhaCungCap.Text = row.Cells[0].Text;
            txtTenNhaCungCap.Text = row.Cells[1].Text;
            txtDiaChiNhaCungCap.Text = row.Cells[2].Text;
            txtSoDienThoai.Text = row.Cells[3].Text;
            txtEmail.Text = row.Cells[4].Text;

        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtDiaChiNhaCungCap.Text.Length > 0 && txtEmail.Text.Length > 0 && txtSoDienThoai.Text.Length > 0 && txtTenNhaCungCap.Text.Length > 0)
                {
                    tbl_Supplier supplier = new tbl_Supplier();
                    supplier.Supplier_Name = txtTenNhaCungCap.Text;
                    supplier.Phone = Int32.Parse(txtSoDienThoai.Text);
                    supplier.Email = txtEmail.Text;
                    supplier.Address = txtDiaChiNhaCungCap.Text;
                    db.tbl_Supplier.Add(supplier);
                    db.SaveChanges();
                    load();
                    lbThongBao.Text = "Bạn đã thêm thành công";
                    lbThongBao.ForeColor = System.Drawing.Color.Green;
                    reset();
                }
                else
                {
                    lbThongBao.Text = "Bạn chưa nhập dữ liệu";
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
                if (txtDiaChiNhaCungCap.Text.Length > 0 && txtEmail.Text.Length > 0 && txtSoDienThoai.Text.Length > 0 && txtTenNhaCungCap.Text.Length > 0)
                {
                    tbl_Supplier supplier = db.tbl_Supplier.Find(int.Parse(txtMaNhaCungCap.Text));
                    supplier.Supplier_Name = txtTenNhaCungCap.Text;
                    supplier.Phone = Int32.Parse(txtSoDienThoai.Text);
                    supplier.Email = txtEmail.Text;
                    supplier.Address = txtDiaChiNhaCungCap.Text;

                    db.SaveChanges();
                    load();
                    lbThongBao.Text = "Bạn đã sửa thành công";
                    lbThongBao.ForeColor = System.Drawing.Color.Green;
                    reset();
                }
                else
                {
                    lbThongBao.Text = "Bạn chưa chọn nhà cung cấp cần sửa";
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
                if (txtMaNhaCungCap.Text.Length > 0)
                {
                    tbl_Supplier supplier = db.tbl_Supplier.Find(int.Parse(txtMaNhaCungCap.Text));
                    db.tbl_Supplier.Remove(supplier);
                    db.SaveChanges();
                    load();
                    reset();
                    lbThongBao.Text = "Xóa thành công";
                    lbThongBao.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    lbThongBao.Text = "Chưa chọn nhà cung cấp cần xóa";
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
    }
}