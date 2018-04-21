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
    public partial class QuanLyKhachHang : System.Web.UI.Page
    {
        private databasequanaoEntities1 db = new databasequanaoEntities1();
        List<tbl_Customer> lCustomer = new List<tbl_Customer>();
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
            var result = from c in db.tbl_Customer select c;
            GridView1.DataSource = result.ToList();
            GridView1.DataBind();


            var role = db.Roles.ToList();
            drQuyen.DataSource = role;
            drQuyen.DataBind();
            drQuyen.SelectedIndex = 0;
        }

        void reset()
        {
            txtTaiKhoan.Text = "";
            txtMatkhau.Text = "";
            txtDiachi.Text = "";
            txtHoten.Text = "";
            txtSodienthoai.Text = "";
            txtEmail.Text = "";
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            try
            {


                tbl_Customer customer = new tbl_Customer();
                customer.Usermame = txtTaiKhoan.Text;
                customer.Password = txtMatkhau.Text.GetMD5();
                if (!string.IsNullOrEmpty(txtSodienthoai.Text))
                {
                    customer.Phone = Int32.Parse(txtSodienthoai.Text);
                }
                customer.FullName = txtHoten.Text;
                customer.Email = txtEmail.Text;
                customer.Address = txtDiachi.Text;
                customer.RoleID = int.Parse(drQuyen.SelectedValue.ToString());
                customer.IsLock = false;
                customer.IsDelete = false;

                db.tbl_Customer.Add(customer);
                db.SaveChanges();
                load();
                lbThongBao.Text = "Thêm thành công";
                lbThongBao.ForeColor = System.Drawing.Color.Green;
                reset();
            }
            catch (Exception ex)
            {
                lbThongBao.Text = "Có lỗi xảy ra trong quá trình xử lý. Vui lòng thử lại sau.";
                lbThongBao.ForeColor = System.Drawing.Color.Red;
                string loi = ex.Message;
            }
        }

        protected void btnSua_Click(object sender, EventArgs e)
        {
            try
            {


                if (txtTaiKhoan.Text.Length > 0)
                {
                    tbl_Customer customer = db.tbl_Customer.Find(txtTaiKhoan.Text);

                    customer.Password = txtMatkhau.Text.GetMD5();
                    customer.Phone = Int32.Parse(txtSodienthoai.Text);
                    customer.FullName = txtHoten.Text;
                    customer.Email = txtEmail.Text;
                    customer.Address = txtDiachi.Text;
                    customer.RoleID = int.Parse(drQuyen.SelectedValue.ToString());
                    db.SaveChanges();
                    load();
                    lbThongBao.Text = "Sửa thành công";
                    lbThongBao.ForeColor = System.Drawing.Color.Green;
                    reset();
                }
                else
                {
                    lbThongBao.Text = "Bạn chưa nhập vào tài khoản";
                    lbThongBao.ForeColor = System.Drawing.Color.Red;
                }
            }
            catch (Exception ex)
            {
                lbThongBao.Text = "Có lỗi xảy ra trong quá trình xử lý. Vui lòng thử lại sau.";
                string loi = ex.Message;
            }
        }

        protected void btnXoa_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtTaiKhoan.Text.Length > 0)
                {
                    tbl_Customer customer = db.tbl_Customer.Find(txtTaiKhoan.Text);
                    db.tbl_Customer.Remove(customer);
                    db.SaveChanges();
                    load();
                    lbThongBao.Text = "Xóa thành công";
                    lbThongBao.ForeColor = System.Drawing.Color.Green;
                    reset();
                }
                else
                {
                    lbThongBao.Text = "Bạn chưa nhập vào tài khoản";
                    lbThongBao.ForeColor = System.Drawing.Color.Red;
                }
            }
            catch (Exception ex)
            {
                lbThongBao.Text = "Có lỗi xảy ra trong quá trình xử lý. Vui lòng thử lại sau";
                string loi = ex.Message;
            }

        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            reset();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                GridViewRow row = GridView1.SelectedRow;

                txtTaiKhoan.Text = row.Cells[0].Text;
                txtMatkhau.Text = row.Cells[1].Text;
                txtHoten.Text = row.Cells[2].Text;
                txtEmail.Text = row.Cells[3].Text;
                txtDiachi.Text = row.Cells[4].Text;
                txtSodienthoai.Text = row.Cells[5].Text;
                drQuyen.SelectedValue = drQuyen.Items.FindByText(row.Cells[6].Text).Value;
            }
            catch { }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (txtName.Text.Length > 0)
            {
                try
                {
                    int id = int.Parse(txtName.Text);
                    var result = db.tbl_Customer.Where(x => x.UserID == id).ToList();
                    GridView1.DataSource = result;
                    GridView1.DataBind();
                }
                catch
                {
                    var result = db.tbl_Customer.Where(x => x.Usermame.ToUpper().Contains(txtName.Text.ToUpper())).ToList();
                    GridView1.DataSource = result;
                    GridView1.DataBind();
                }
            }
        }
    }
}