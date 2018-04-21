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
    public partial class QuanLyAnh : System.Web.UI.Page
    {
        private databasequanaoEntities1 db = new databasequanaoEntities1();
        private List<Temp> list = new List<Temp>();
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
            if (Request["id"] != null)
            {
                string id = Request["id"].ToString();
                try
                {
                    var item = db.tbl_Product.Find(int.Parse(id));
                    if (item != null)
                    {
                        txtMaXe.Text = item.Product_ID + "";
                        txtName.Text = item.Product_Name;
                        imgCar.Src = "../Images/" + item.Image;
                        loadData();
                    }
                }
                catch (Exception ex)
                {

                }
            }
        }

        void loadData()
        {
            int id = int.Parse(txtMaXe.Text);
            var data = db.Images.Where(x => x.ProductID == id).ToList();
            foreach (var item in data)
            {
                long length = new System.IO.FileInfo(Server.MapPath("~/Images/") + item.Src).Length;

                list.Add(new Temp() { MaAnh = item.ID, FileName = item.Src, Src = item.Src, Capacity = GetFileSizeInBytes(length) });
            }
            listImg.DataSource = list;
            listImg.DataBind();
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            try
            {
                // Get the HttpFileCollection
                HttpFileCollection hfc = Request.Files;
                for (int i = 0; i < hfc.Count; i++)
                {
                    HttpPostedFile hpf = hfc[i];
                    if (hpf.ContentLength > 0)
                    {
                        hpf.SaveAs(Server.MapPath("../Images/") +
                          Path.GetFileName(hpf.FileName));
                        Temp temp = new Temp();

                        temp.FileName = hpf.FileName;
                        temp.Src = hpf.FileName;
                        temp.Capacity = GetFileSizeInBytes(hpf.ContentLength);
                        list.Add(temp);
                    }
                }
                Insert(list);
                loadData();
            }
            catch (Exception ex)
            {
                // Handle your exception here
            }
        }

        protected void Insert(List<Temp> list)
        {
            foreach (var item in list)
            {
                try
                {
                    db.Images.Add(new BanQuanAo.Entity.EF.Image() { ProductID = int.Parse(txtMaXe.Text), Src = item.Src });
                    db.SaveChanges();
                }
                catch (Exception ex) { }
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("QuanLySanPham.aspx?id="+txtMaXe.Text);
        }

        protected void listImg_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("DeleteItem"))
            {
                int id = int.Parse(e.CommandArgument.ToString());
                var img = db.Images.Find(id);
                try
                {
                    db.Images.Remove(img);
                    db.SaveChanges();
                    load();
                }
                catch (Exception ex) { }
            }
        }

        protected class Temp
        {
            public int MaAnh { get; set; }
            public string FileName { get; set; }
            public string Src { get; set; }
            public string Capacity { get; set; }
        }

        protected string GetFileSizeInBytes(long TotalBytes)
        {
            if (TotalBytes >= 1073741824) //Giga Bytes
            {
                Decimal FileSize = Decimal.Divide(TotalBytes, 1073741824);
                return String.Format("{0:##.##} GB", FileSize);
            }
            else if (TotalBytes >= 1048576) //Mega Bytes
            {
                Decimal FileSize = Decimal.Divide(TotalBytes, 1048576);
                return String.Format("{0:##.##} MB", FileSize);
            }
            else if (TotalBytes >= 1024) //Kilo Bytes
            {
                Decimal FileSize = Decimal.Divide(TotalBytes, 1024);
                return String.Format("{0:##.##} KB", FileSize);
            }
            else if (TotalBytes > 0)
            {
                Decimal FileSize = TotalBytes;
                return String.Format("{0:##.##} Bytes", FileSize);
            }
            else
            {
                return "0 Bytes";
            }


        }
    }
}