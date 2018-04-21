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
    public partial class Xemhoadon : System.Web.UI.Page
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
                            data();
                        }
                    }
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }

            }

            
        }

        void data()
        {
            try
            {
                string id = Request.QueryString["Order_ID"];
                lbMaHoaDon.Text = id;
                lbMaHoaDon.ForeColor = System.Drawing.Color.Red;

                tbl_Order order = db.tbl_Order.Find(id);
                lbDiaChi.Text = order.Address_Pay;
                lbKhachHang.Text = order.Name_Pay;
                lbKhachHang.ForeColor = System.Drawing.Color.Green;
                lbNgayDat.Text = order.Date.ToShortDateString().ToString();
                lbKhoiLuong.Text = order.SumWeight.ToString();
                lbDiaChiNhan.Text = order.Address_Received;
                lbPhiVanChuyen.Text = order.VAT_Transport.ToString();
                lbPtthanhtoan.Text = order.tbl_Payment.Pay_Name;
                lbPhuPhi.Text = order.VAT_Gift.ToString();
                lbNguoiNhan.Text = order.Name_Received;
                lbSDTPay.Text = order.Phone_Pay.ToString();
                lbSodienThoaiNhan.Text = order.Phone_Received.ToString();
                lbPtthanhtoan.Text = order.tbl_Payment.Pay_Name;
                lbTinNhan.Text = order.Mesage;
                lbTongTien.Text = order.SumMoney.ToString();
                load();

            }
            catch (Exception ex)
            {
                Response.Redirect("QuanLyDatHang.aspx");
            }
        }

        void load()
        {
            string id = Request.QueryString["Order_ID"];
            var result = from c in db.tbl_OrderDetial where c.Order_ID == id select c;
            GridView1.DataSource = result.ToList();
            GridView1.DataBind();
        }

        protected void btlBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("QuanLyDatHang.aspx");
        }
    }
}