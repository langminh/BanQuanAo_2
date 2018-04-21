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
    public partial class DangNhap : BasePage
    {
        private databasequanaoEntities1 db = new databasequanaoEntities1();
        protected void Page_Load(object sender, EventArgs e)
        {
            var session = (LoginSession)Session[CommonContanst.USER_SESSION];
            if(session != null)
            {
                if (session.RememberMe)
                {
                    Response.Redirect("TrangChu.aspx");
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (txtusername.Text.Length > 0 && txt_pass.Text.Length > 0)
            {
                int check = UserDao.Instance.CheckUser(txtusername.Text, txt_pass.Text.GetMD5());
                if(check == -1)
                {
                    msg.Visible = true;
                    msg.Text = "Tài khoản không tồn tại.";
                    msg.ForeColor = System.Drawing.Color.Red;
                }
                else if(check == -2)
                {
                    msg.Visible = true;
                    msg.Text = "Tài khoản đã bị khóa.";
                    msg.ForeColor = System.Drawing.Color.Red;
                }
                else if(check == 0)
                {
                    msg.Visible = true;
                    msg.Text = "Sai mật khẩu.";
                    msg.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    var user = UserDao.Instance.GetUser(txtusername.Text);
                    if(user != null)
                    {
                        var session = new LoginSession();
                        session.userName = user.Usermame;
                        session.passWord = user.Password;
                        session.role = user.RoleID;
                        session.userID = user.UserID;
                        if (ckb_remember.Checked)
                        {
                            session.RememberMe = ckb_remember.Checked;
                        }
                        else
                        {
                            session.RememberMe = false;
                        }
                        Session.Add(CommonContanst.USER_SESSION, session);
                        Response.Redirect("TrangChu.aspx");
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

        protected void btn_signup_Click(object sender, EventArgs e)
        {
            try
            {
                if (txt_userNameReg.Text.Length > 0)
                {
                    if (txt_PassReg.Text.Length > 0)
                    {


                        if (txt_EmailReg.Text.Length > 0)
                        {
                            if (txt_NameReg.Text.Length > 0)
                            {
                                if (txtPhonReg.Text.Length > 0)
                                {
                                    if (txt_PassReg.Text.Equals(txt_RePassReg.Text))
                                    {
                                        tbl_Customer tk = new tbl_Customer();
                                        tk.Email = txt_EmailReg.Text;
                                        tk.Usermame = txt_userNameReg.Text;
                                        tk.Password = txt_PassReg.Text.GetMD5();
                                        tk.Phone = Int32.Parse(txtPhonReg.Text);
                                        tk.FullName = txt_NameReg.Text;
                                        tk.Address = txtAddressReg.Text;
                                        tk.UserID = 2;
                                        tk.IsLock = false;
                                        tk.IsDelete = false;
                                        db.tbl_Customer.Add(tk);
                                        db.SaveChanges();
                                        Response.Redirect("DkThanhCong.aspx");
                                    }
                                    else
                                    {
                                        msg.Text = "Mật khẩu không trùng khớp.";
                                        msg.ForeColor = System.Drawing.Color.Red;
                                    }
                                }
                                else
                                {

                                    msg.Text = "Bạn chưa nhập số điện thoại";
                                    msg.ForeColor = System.Drawing.Color.Red;
                                }
                            }
                            else
                            {
                                msg.Text = "Bạn chưa nhập họ tên";
                                msg.ForeColor = System.Drawing.Color.Red;
                            }

                        }
                        else
                        {
                            msg.Text = "Bạn chưa nhập email";
                            msg.ForeColor = System.Drawing.Color.Red;
                        }


                    }
                    else
                    {
                        msg.Text = "Bạn chưa nhập mật khẩu";
                        msg.ForeColor = System.Drawing.Color.Red;
                    }
                }
                else
                {
                    msg.Text = "Bạn chưa nhập tài khoản";
                    msg.ForeColor = System.Drawing.Color.Red;
                }

            }
            catch (Exception ex)
            {
                msg.Text = "Đã xảy ra lỗi. Vui lòng thử lại sau. " + ex.Message;
                msg.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}