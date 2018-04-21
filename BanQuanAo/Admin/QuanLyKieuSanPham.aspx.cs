using BanQuanAo.Entity.EF;
using BanQuanAo.Helper;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BanQuanAo.Admin
{
    public partial class QuanLyKieuSanPham : System.Web.UI.Page
    {
        private databasequanaoEntities1 db = new databasequanaoEntities1();
        string fileName = "";
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
            var result = db.tbl_Type.ToList();
            GridView1.DataSource = result;
            GridView1.DataBind();
        }
        void reset()
        {
            txtKieu.Text = "";
            txtIDKieu.Text = "";
        }
        protected void btnThem_Click(object sender, EventArgs e)
        {
            tbl_Type type = new tbl_Type();
            try
            {
                if (txtKieu.Text.Length > 0)
                {

                    type.Type_Name = txtKieu.Text;
                    if (fileName != "")
                        type.Image = fileName;
                    else
                    {
                        string tenfile = Image1.ImageUrl;
                        int indexLast = tenfile.LastIndexOf('/');
                        string tenfilemoi = tenfile.Substring(indexLast + 1);
                        type.Image = tenfilemoi;
                    }
                    db.tbl_Type.Add(type);
                    db.SaveChanges();
                    load();
                    reset();
                    lbThongBao.Text = "Bạn thêm thành công";
                    lbThongBao.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    lbThongBao.Text = "Chưa nhập dữ liệu";
                    lbThongBao.ForeColor = System.Drawing.Color.Red;
                }
            }
            catch
            {
                lbThongBao.Text = "Đã có lỗi xảy ra. Vui lòng thử lại sau.";
                lbThongBao.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void btnSua_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtIDKieu.Text.Length > 0)
                {
                    tbl_Type type = db.tbl_Type.Find(int.Parse(txtIDKieu.Text));
                    type.Type_Name = txtKieu.Text;
                    if (fileName != "")
                        type.Image = fileName;
                    else
                    {
                        string tenfile = Image1.ImageUrl;
                        int indexLast = tenfile.LastIndexOf('/');
                        string tenfilemoi = tenfile.Substring(indexLast + 1);
                        type.Image = tenfilemoi;
                    }
                    db.SaveChanges();
                    load();
                    reset();
                    lbThongBao.Text = "Sửa thành công";
                    lbThongBao.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    lbThongBao.Text = "Bạn chưa chọn kiểu cần xóa";
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
                if (txtIDKieu.Text.Length > 0)
                {
                    tbl_Type type = db.tbl_Type.Find(int.Parse(txtIDKieu.Text));
                    db.tbl_Type.Remove(type);
                    db.SaveChanges();
                    load();
                    lbThongBao.Text = "Bạn đã xóa kiểu sản phẩm thành công";
                    lbThongBao.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    lbThongBao.Text = "Bạn chưa chọn kiểu sản phẩm cần xóa";
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

            txtIDKieu.Text = row.Cells[0].Text;
            txtKieu.Text = row.Cells[1].Text;
            Image1.ImageUrl = "../Images/type/" + row.Cells[2].Text;
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                try
                {
                    string filename = Path.GetFileName(FileUpload1.FileName);
                    FileUpload1.SaveAs(Server.MapPath("~/Images/type/") + filename);
                    lbThongBao.Text = "Tải lên ảnh thành công!";
                    Image1.ImageUrl = "~/Images/type/" + filename;
                    fileName = filename;
                }
                catch (Exception ex)
                {
                    lbThongBao.Text = "Tải lên ảnh bị lỗi do: " + ex.Message;
                }
            }
        }
    }
}