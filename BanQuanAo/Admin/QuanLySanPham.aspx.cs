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
    public partial class QuanLySanPham : System.Web.UI.Page
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
                            LoadData();
                        }
                    }
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        void LoadData()
        {
            if (Request["id"] != null)
            {
                try
                {
                    loadCombobox();
                    int id = int.Parse(Request["id"].ToString());
                    var item = db.tbl_Product.Find(id);

                    txtIDSanPham.Text = item.Product_ID+"";
                    txtTenSanPham.Text = item.Product_Name;

                    drKieu.SelectedValue = drKieu.Items.FindByValue(item.Type_ID.ToString()).Value; /*dsSanPham[index].Type_ID.ToString();*/
                    drStyle.SelectedValue = drStyle.Items.FindByValue(item.Style_ID.ToString()).Value; /*dsSanPham[index].Style_ID.ToString();*/
                    drNhaXanXuat.SelectedValue = drNhaXanXuat.Items.FindByValue(item.tbl_Producer.Producer_ID+"").Value; /*dsSanPham[index].Producer_ID.ToString();*/
                    drNhaCC.SelectedValue = drNhaCC.Items.FindByValue(item.Supplier_ID.ToString()).Value; /*dsSanPham[index].Supplier_ID.ToString();*/
                    drMau.SelectedValue = drMau.Items.FindByText(item.Color).Value; /*dsSanPham[index].Color;*/
                    drChatLieu.SelectedValue = drChatLieu.Items.FindByText(item.Material).Value;
                    try
                    {
                        drSize.SelectedValue = drSize.Items.FindByValue(item.SizeID.ToString()).Value; /*dsSanPham[index].Size;*/
                    }
                    catch { }
                    txtGianhap.Text = item.Price_Import+"";
                    txtGiaXuat.Text = item.Price_Export+"";
                    txtKhoiLuong.Text = item.Weight+"";
                    txtSoLuong.Text = item.Amount+"";
                    txtContent.Text = Server.HtmlDecode(item.Content);
                    Image1.ImageUrl = "~/Images/" + item.Image;
                    txtOrder.Text = item.Order+"";
                    txtDes.Text = item.Description;
                    txtContent.Text = item.Content;
                    btnThem.Visible = false;
                    btnSua.Visible = true;
                }
                catch (Exception ex) { }
            }
            else
            {
                loadCombobox();
                btnThem.Visible = true;
                btnSua.Visible = false;  
            }
        }

        void reset()
        {
            txtGianhap.Text = "";
            txtGiaXuat.Text = "";
            txtIDSanPham.Text = "";
            txtKhoiLuong.Text = "";
            txtSoLuong.Text = "";
            txtTenSanPham.Text = "";
            txtDes.Text = "";
            txtOrder.Text = "";
        }

        void loadCombobox()
        {
            //load type
            var resultStyle = db.tbl_Style.ToList();
            var resultType = db.tbl_Type.ToList();
            var resultProducer = db.tbl_Producer.ToList();
            var resultSupplier = db.tbl_Supplier.ToList();

            drKieu.DataSource = resultType;
            drKieu.DataTextField = "Type_Name";
            drKieu.DataValueField = "Type_ID";
            drKieu.DataBind();

            drStyle.DataSource = resultStyle;
            drStyle.DataTextField = "Style_Name";
            drStyle.DataValueField = "Style_ID";
            drStyle.DataBind();

            drNhaCC.DataSource = resultSupplier;
            drNhaCC.DataTextField = "Supplier_Name";
            drNhaCC.DataValueField = "Supplier_ID";
            drNhaCC.DataBind();

            drNhaXanXuat.DataSource = resultProducer;
            drNhaXanXuat.DataTextField = "Producer_Name";
            drNhaXanXuat.DataValueField = "Producer_ID";
            drNhaXanXuat.DataBind();

            var list = db.Sizes.ToList();
            drSize.DataSource = list;
            drSize.DataTextField = "Name";
            drSize.DataValueField = "SizeID";
            drSize.DataBind();
        }


        //protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    int index = GridView1.SelectedIndex;

        //    GridViewRow row = GridView1.SelectedRow;


        //    txtIDSanPham.Text = row.Cells[0].Text;
        //    txtTenSanPham.Text = row.Cells[1].Text;

        //    drKieu.SelectedValue = drKieu.Items.FindByValue(row.Cells[2].Text).Value; /*dsSanPham[index].Type_ID.ToString();*/
        //    drStyle.SelectedValue = drStyle.Items.FindByValue(row.Cells[3].Text).Value; /*dsSanPham[index].Style_ID.ToString();*/
        //    drNhaXanXuat.SelectedValue = drNhaXanXuat.Items.FindByValue(row.Cells[4].Text).Value; /*dsSanPham[index].Producer_ID.ToString();*/
        //    drNhaCC.SelectedValue = drNhaCC.Items.FindByValue(row.Cells[5].Text).Value; /*dsSanPham[index].Supplier_ID.ToString();*/
        //    drMau.SelectedValue = drMau.Items.FindByText(row.Cells[6].Text).Value; /*dsSanPham[index].Color;*/
        //    drChatLieu.SelectedValue = drChatLieu.Items.FindByValue(row.Cells[7].Text).Value;
        //    try
        //    {
        //        drSize.SelectedValue = drSize.Items.FindByText(row.Cells[8].Text).Value; /*dsSanPham[index].Size;*/
        //    }
        //    catch { }
        //    txtGianhap.Text = row.Cells[9].Text;
        //    txtGiaXuat.Text = row.Cells[10].Text;
        //    txtKhoiLuong.Text = row.Cells[11].Text;
        //    txtSoLuong.Text = row.Cells[12].Text;
        //    Image1.ImageUrl = "~/Images/" + row.Cells[13].Text;
        //    txtOrder.Text = row.Cells[14].Text;
        //    txtDes.Text = row.Cells[15].Text;
        //}

        protected void btnThem_Click(object sender, EventArgs e)
        {
            try
            {
                tbl_Product sanpham = new tbl_Product();
                sanpham.Product_Name = txtTenSanPham.Text;
                sanpham.Type_ID = int.Parse(drKieu.SelectedValue);
                sanpham.Style_ID = int.Parse(drStyle.SelectedValue);
                sanpham.Producer_ID = int.Parse(drNhaXanXuat.SelectedValue);
                sanpham.Supplier_ID = int.Parse(drNhaCC.SelectedValue);
                sanpham.Color = drMau.SelectedValue;
                sanpham.Material = drChatLieu.SelectedValue;
                
                sanpham.Price_Import = double.Parse(txtGianhap.Text);
                sanpham.Price_Export = double.Parse(txtGiaXuat.Text);
                sanpham.Amount = int.Parse(txtSoLuong.Text);
                sanpham.Weight = int.Parse(txtKhoiLuong.Text);
                sanpham.Size = db.Sizes.Find(int.Parse(drSize.SelectedValue)).Name;
                sanpham.SizeID = int.Parse(drSize.SelectedValue);
                sanpham.Order = int.Parse(txtOrder.Text);
                sanpham.Description = txtDes.Text;
                sanpham.Content = HttpUtility.HtmlEncode(txtContent.Text);
                if (!string.IsNullOrEmpty(fileName))
                    sanpham.Image = fileName;
                else
                {
                    string tenfile = Image1.ImageUrl;
                    int indexLast = tenfile.LastIndexOf('/');
                    string tenfilemoi = tenfile.Substring(indexLast + 1);
                    sanpham.Image = tenfilemoi;
                }
                db.tbl_Product.Add(sanpham);
                db.SaveChanges();
                lbThongBao.Text = "Thêm thành công";
                lbThongBao.ForeColor = System.Drawing.Color.Green;
                Response.Redirect("DanhSachSanPham.aspx");

            }
            catch (Exception ex)
            {
                lbThongBao.Text = "Thất bại " + ex.Message;
                lbThongBao.ForeColor = System.Drawing.Color.Green;
            }
        }

        protected void btnSua_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtIDSanPham.Text.Length > 0)
                {
                    tbl_Product sanpham = db.tbl_Product.Find(int.Parse(txtIDSanPham.Text));
                    sanpham.Product_Name = txtTenSanPham.Text;
                    sanpham.Type_ID = int.Parse(drKieu.SelectedValue);
                    sanpham.Style_ID = int.Parse(drStyle.SelectedValue);
                    sanpham.Producer_ID = int.Parse(drNhaXanXuat.SelectedValue);
                    sanpham.Supplier_ID = int.Parse(drNhaCC.SelectedValue);
                    sanpham.Color = drMau.SelectedValue;
                    sanpham.Material = drChatLieu.SelectedValue;
                    
                    sanpham.Price_Import = double.Parse(txtGianhap.Text);
                    sanpham.Price_Export = double.Parse(txtGiaXuat.Text);
                    sanpham.Amount = int.Parse(txtSoLuong.Text);
                    sanpham.Weight = int.Parse(txtKhoiLuong.Text);
                    sanpham.Size = db.Sizes.Find(int.Parse(drSize.SelectedValue)).Name;
                    sanpham.SizeID = int.Parse(drSize.SelectedValue);
                    sanpham.Order = int.Parse(txtOrder.Text);
                    sanpham.Description = txtDes.Text;
                    sanpham.Content = HttpUtility.HtmlEncode(txtContent.Text);
                    if (fileName != "")
                        sanpham.Image = fileName;
                    else
                    {
                        string tenfile = Image1.ImageUrl;
                        int indexLast = tenfile.LastIndexOf('/');
                        string tenfilemoi = tenfile.Substring(indexLast + 1);
                        sanpham.Image = tenfilemoi;
                    }

                    db.SaveChanges();
                    Response.Redirect("DanhSachSanPham.aspx");
                    lbThongBao.Text = "Sửa thành công";
                    lbThongBao.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    lbThongBao.Text = "Vui lòng chọn sản phẩm cần sửa";
                    lbThongBao.ForeColor = System.Drawing.Color.Red;
                }

            }
            catch (Exception ex)
            {
                lbThongBao.Text = "Đã có lỗi xảy ra: " + ex.Message;
                lbThongBao.ForeColor = System.Drawing.Color.Red;
            }
        }

        //protected void btnXoa_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        if (txtIDSanPham.Text.Length > 0)
        //        {
        //            tbl_Product sanpham = db.tbl_Product.Find(int.Parse(txtIDSanPham.Text));
        //            db.tbl_Product.Remove(sanpham);
        //            db.SaveChanges();
        //            load();
        //            lbThongBao.Text = "Xóa thành công";
        //            lbThongBao.ForeColor = System.Drawing.Color.Green;
        //            Image1.ImageUrl = "";
        //        }
        //        else
        //        {
        //            lbThongBao.Text = "Vui lòng chọn sản phẩm cần sửa";
        //            lbThongBao.ForeColor = System.Drawing.Color.Red;
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        lbThongBao.Text = "Đã có lỗi xảy ra: " + ex.Message;
        //        lbThongBao.ForeColor = System.Drawing.Color.Red;
        //    }
        //}

        protected void btnReset_Click(object sender, EventArgs e)
        {
            reset();
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                try
                {
                    string filename = Path.GetFileName(FileUpload1.FileName);
                    FileUpload1.SaveAs(Server.MapPath("~/Images/") + filename);
                    lbThongBao.Text = "Tải lên ảnh thành công!";
                    Image1.ImageUrl = "~/Images/" + filename;
                    fileName = filename;
                }
                catch (Exception ex)
                {
                    lbThongBao.Text = "Tải lên ảnh bị lỗi do: " + ex.Message;
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("QuanLyAnh.aspx?id=" + txtIDSanPham.Text);
        }

        //protected void btnSearch_Click(object sender, EventArgs e)
        //{
        //    if (txtName.Text.Length > 0)
        //    {
        //        try
        //        {
        //            int id = int.Parse(txtName.Text);
        //            var result = db.tbl_Product.Where(x => x.Producer_ID == id).ToList();
        //            GridView1.DataSource = result;
        //            GridView1.DataBind();
        //        }
        //        catch
        //        {
        //            var result = db.tbl_Product.Where(x => x.Product_Name.ToUpper().Contains(txtName.Text.ToUpper())).ToList();
        //            GridView1.DataSource = result;
        //            GridView1.DataBind();
        //        }

        //    }
        //}
    }
}