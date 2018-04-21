using BanQuanAo.Entity.EF;
using BanQuanAo.Helper;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SD = System.Drawing;

namespace BanQuanAo.Admin
{
    public partial class QuanLySlide : System.Web.UI.Page
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
            listImg.DataSource = db.Slides.OrderByDescending(x => x.CreateTime).ToList();
            listImg.DataBind();
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            string serverPath = Server.MapPath("~/Images/slides/");
            if (FileUpload1.HasFile)
            {
                try
                {
                    string filename = Path.GetFileName(FileUpload1.FileName);
                    string FileWithPath = serverPath + FileUpload1.FileName;

                    FileUpload1.SaveAs(FileWithPath);

                    lbThongBao.Text = "Tải lên ảnh thành công!";
                    Image1.ImageUrl = "~/Images/slides/" + filename;
                    this.fileName = filename;
                    if (lbMa.Value == null)
                    {
                        Slide slide = new Slide();
                        slide.Title = txtTieuDe.Text;
                        slide.Content = txtNoiDung.Text;
                        slide.show = exampleCheck1.Checked;
                        slide.CreateTime = DateTime.Now;
                        if (!string.IsNullOrEmpty(fileName))
                        {
                            slide.Image = fileName;
                        }
                        {
                            string tenfile = Image1.ImageUrl;
                            int indexLast = tenfile.LastIndexOf('/');
                            string tenfilemoi = tenfile.Substring(indexLast + 1);
                            slide.Image = tenfilemoi;
                        }

                        db.Slides.Add(slide);
                        db.SaveChanges();
                        load();
                    }
                }
                catch (Exception ex)
                {
                    lbThongBao.Text = "Tải lên ảnh bị lỗi do: " + ex.Message;
                }
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }

        protected void listImg_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("UpdateItem"))
            {
                lbMa.Value = e.CommandArgument.ToString();
                var slide = db.Slides.Find(int.Parse(e.CommandArgument.ToString()));
                if (slide != null)
                {
                    txtNoiDung.Text = slide.Content;
                    txtTieuDe.Text = slide.Title;
                    Image1.ImageUrl = "../Images/slides/" + slide.Image;
                }
            }
            else if (e.CommandName.Equals("DeleteItem"))
            {
                var slide = db.Slides.Find(int.Parse(e.CommandArgument.ToString()));
                if (slide != null)
                {
                    try
                    {
                        db.Slides.Remove(slide);
                        db.SaveChanges();
                        load();
                    }
                    catch (Exception ex) { }
                }
            }
        }

        protected void btnSua_Click(object sender, EventArgs e)
        {
            if (lbMa.Value != null)
            {
                var slide = db.Slides.Find(int.Parse(lbMa.Value.ToString()));
                try
                {
                    if (slide != null)
                    {
                        slide.Title = txtTieuDe.Text;
                        slide.Content = txtNoiDung.Text;
                        if (!string.IsNullOrEmpty(fileName))
                        {
                            slide.Image = fileName;
                        }
                        {
                            string tenfile = Image1.ImageUrl;
                            int indexLast = tenfile.LastIndexOf('/');
                            string tenfilemoi = tenfile.Substring(indexLast + 1);
                            slide.Image = tenfilemoi;
                        }
                        db.SaveChanges();
                        load();
                    }
                }
                catch (Exception ex) { }
            }
        }

        #region Resize Image With Best Qaulity

        public SD.Image resizeImage(SD.Image image, int new_height, int new_width)
        {
            Bitmap new_image = new Bitmap(new_width, new_height);
            Graphics g = Graphics.FromImage((SD.Image)new_image);
            g.InterpolationMode = InterpolationMode.High;
            g.DrawImage(image, 0, 0, new_width, new_height);
            return new_image;
        }

        private SD.Image RezizeImage(SD.Image img, int maxWidth, int maxHeight)
        {
            if (img.Height < maxHeight && img.Width < maxWidth) return img;
            using (img)
            {
                Double xRatio = (double)img.Width / maxWidth;
                Double yRatio = (double)img.Height / maxHeight;
                Double ratio = Math.Max(xRatio, yRatio);
                int nnx = (int)Math.Floor(img.Width / ratio);
                int nny = (int)Math.Floor(img.Height / ratio);
                Bitmap cpy = new Bitmap(nnx, nny, SD.Imaging.PixelFormat.Format32bppArgb);
                using (Graphics gr = Graphics.FromImage(cpy))
                {
                    gr.Clear(Color.Transparent);

                    // This is said to give best quality when resizing images
                    gr.InterpolationMode = InterpolationMode.HighQualityBicubic;

                    gr.DrawImage(img,
                        new Rectangle(0, 0, nnx, nny),
                        new Rectangle(0, 0, img.Width, img.Height),
                        GraphicsUnit.Pixel);
                }
                return cpy;
            }

        }

        private MemoryStream BytearrayToStream(byte[] arr)
        {
            return new MemoryStream(arr, 0, arr.Length);
        }


        #endregion
    }
}