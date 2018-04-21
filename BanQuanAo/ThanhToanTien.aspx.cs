using BanQuanAo.Entity.Dao;
using BanQuanAo.Entity.EF;
using BanQuanAo.Helper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BanQuanAo
{
    public partial class ThanhToan : BasePage
    {
        private databasequanaoEntities1 db = new databasequanaoEntities1();
        private List<tbl_Product> dsHangHoa = new List<tbl_Product>();
        protected List<Hang> items = new List<Hang>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                loadDropdow();
                loadDsHang();
            }
            SetData();
        }

        void loadDropdow()
        {
            var drvan = from c in db.tbl_Transport select c;
            drVC.DataSource = drvan.ToList();
            drVC.DataBind();

            var drpay = from c in db.tbl_Payment select c;
            drTT.DataSource = drpay.ToList();
            drTT.DataBind();

        }

        void SetData()
        {
            var session = Session[CommonContanst.USER_SESSION] as LoginSession;
            if(session != null)
            {
                var user = db.tbl_Customer.Find(session.userID);
                if(user != null)
                {
                    txtDiaChi.Text = user.Address;
                    txtEmail.Text = user.Email;
                    txtHoTen.Text = user.FullName;
                    txtSoDienThoai.Text = user.Phone.HasValue ? user.Phone.Value.ToString() : "";
                }
            }
        }

        void loadDsHang()
        {

            var cart = (List<Hang>)Session[CommonContanst.CART_SESSION];
            if(cart != null)
            {
                ListCart.DataSource = cart;
                ListCart.DataBind();
                Caculate();
            }
            listBan.DataSource = db.tbl_Product.OrderByDescending(x => x.Order).Take(5).ToList();
            listBan.DataBind();
        }

        decimal Caculate()
        {
            items = Session[CommonContanst.CART_SESSION] as List<Hang>;
            var vc = db.tbl_Transport.Find(int.Parse(drVC.SelectedValue.ToString()));
            var tt = db.tbl_Payment.Find(int.Parse(drTT.SelectedValue.ToString()));
            decimal tong = 0;
            if (items != null)
            {
                if (items.Count > 0)
                {
                    foreach (var item in items)
                    {
                        tong += item.TongTien;
                    }
                    decimal tien = (((decimal)vc.PhiVC * tong) / 100) + (((decimal)tt.PhiTT * tong) / 100) + tong;
                    lbPhiVC.Text = String.Format("{0:n0}", vc.PhiVC) + "%";
                    lbPhiTT.Text = String.Format("{0:n0}", tt.PhiTT) + "%";
                    lbTong.Text = String.Format("{0:n0}", tien) + "VNĐ";
                }
            }
            return tong;
        }

        protected void btnDatHang_Click(object sender, EventArgs e)
        {
            loadDsHang();
            try
            {
                tbl_Order dh = new tbl_Order();
                var session = (LoginSession)Session[CommonContanst.USER_SESSION];
                decimal giam = 0;
                if (session != null)
                {
                    dh.UserID = session.userID;
                    giam = 5;
                }


                items = Session[CommonContanst.CART_SESSION] as List<Hang>;

                var r = db.tbl_Order.ToList();

                dh.Order_ID = (r.ToList().Count + 1).ToString();
                dh.VAT_Transport = 20000;
                dh.VAT_Gift = 0;

                dh.SumMoney = (double)Caculate();

                dh.Date = DateTime.Now;
                dh.Address_Received = txtDiaChi.Text;
                dh.Mesage = "";
                dh.Pay_ID = int.Parse(drTT.SelectedValue);
                dh.Transport_ID = int.Parse(drVC.SelectedValue);

                if (!string.IsNullOrEmpty(txtSoDienThoai.Text))
                {
                    dh.Phone_Received = int.Parse(txtSoDienThoai.Text);
                    dh.Phone_Pay = dh.Phone_Received;
                }
                dh.Address_Pay = txtDiaChi.Text;
                
                dh.State = "Chưa xử lý";
                dh.Name_Pay = txtHoTen.Text;
                dh.Name_Received = txtHoTen.Text;
                db.tbl_Order.Add(dh);
                db.SaveChanges();

                var vc = db.tbl_Transport.Find(int.Parse(drVC.SelectedValue.ToString()));
                var tt = db.tbl_Payment.Find(int.Parse(drTT.SelectedValue.ToString()));

                for (int i = 0; i < items.Count; i++)
                {
                    try
                    {
                        tbl_OrderDetial chitietDh = new tbl_OrderDetial();
                        chitietDh.Order_ID = dh.Order_ID;
                        chitietDh.Product_ID = items[i].Product_ID;
                        chitietDh.Price_Export = items[i].Price_Export;
                        chitietDh.Amount = items[i].SoLuongMua;
                        double tong = chitietDh.Amount.Value * chitietDh.Price_Export.Value;
                        chitietDh.Money = ((double)vc.PhiVC * tong) / 100 + ((double)tt.PhiTT * tong) / 100 + tong;
                        chitietDh.State = "chưa xử lý";
                        
                        db.tbl_OrderDetial.Add(chitietDh);
                        db.SaveChanges();
                    }catch(Exception ex) { }
                }

                Session.Remove(CommonContanst.CART_SESSION);

                Response.Redirect("DatThanhCong.aspx");

            }
            catch (Exception ex)
            {

            }
        }

        protected void drVC_SelectedIndexChanged(object sender, EventArgs e)
        {
            Caculate();
        }

        protected void drTT_SelectedIndexChanged(object sender, EventArgs e)
        {
            Caculate();
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            if (txtusername.Text.Length > 0 && txt_pass.Text.Length > 0)
            {
                int check = UserDao.Instance.CheckUser(txtusername.Text, txt_pass.Text.GetMD5());
                if (check == -1)
                {
                    msg.Visible = true;
                    msg.Text = "Tài khoản không tồn tại.";
                    msg.ForeColor = System.Drawing.Color.Red;
                }
                else if (check == -2)
                {
                    msg.Visible = true;
                    msg.Text = "Tài khoản đã bị khóa.";
                    msg.ForeColor = System.Drawing.Color.Red;
                }
                else if (check == 0)
                {
                    msg.Visible = true;
                    msg.Text = "Sai mật khẩu.";
                    msg.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    var user = UserDao.Instance.GetUser(txtusername.Text);
                    if (user != null)
                    {
                        var session = new LoginSession();
                        session.userName = user.Usermame;
                        session.passWord = user.Password;
                        session.userID = user.UserID;
                        session.role = user.RoleID;
                        if (ckb_remember.Checked)
                        {
                            session.RememberMe = ckb_remember.Checked;
                        }
                        else
                        {
                            session.RememberMe = false;
                        }
                        Session.Add(CommonContanst.USER_SESSION, session);
                        Response.Redirect(Request.RawUrl);
                    }
                    else
                    {
                        msg.Visible = true;
                        msg.Text = "Đã có lỗi xảy ra. Vui lòng thử lại sau.";
                        msg.ForeColor = System.Drawing.Color.Red;
                    }
                }

            }
            else
            {
                msg.Text = "Bạn chưa nhập thông tin";
                msg.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}