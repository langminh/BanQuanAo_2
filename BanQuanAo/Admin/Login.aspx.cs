using BanQuanAo.Entity.Dao;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BanQuanAo.Helper;
using System.Drawing;

namespace BanQuanAo.Admin
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                var session = (LoginSession)Session[CommonContanst.USER_SESSION];
                if (session != null)
                {
                    if (session.role == 1)
                    {
                        if (session.RememberMe)
                        {
                            Response.Redirect("TrangChu.aspx");
                        }
                    }
                    else
                    {
                        msg.Visible = true;
                        msg.Text = "Bạn không có quyền truy cập.";
                        msg.ForeColor = Color.Red;
                    }
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if(!string.IsNullOrEmpty(txtUsername.Text) || !string.IsNullOrEmpty(txtPassword.Text))
            {
                int check = UserDao.Instance.CheckUser(txtUsername.Text, txtPassword.Text.GetMD5());
                {
                    if(check == -1)
                    {
                        msg.Visible = true;
                        msg.Text = "Tài khoản không tồn tại.";
                    }else if(check == -2)
                    {
                        msg.Visible = true;
                        msg.Text = "Tài khoản đã bị Khóa.";
                    }else if(check == 0)
                    {
                        msg.Visible = true;
                        msg.Text = "Sai mật khẩu.";
                    }else if(check == 1)
                    {
                        var user = UserDao.Instance.GetUser(txtUsername.Text);
                        if(user != null)
                        {
                            if (user.RoleID == 1)
                            {
                                var session = new LoginSession();
                                session.userName = txtUsername.Text;
                                session.passWord = txtPassword.Text.GetMD5();
                                session.role = user.RoleID;
                                if (rememberMe.Checked)
                                {
                                    session.RememberMe = rememberMe.Checked;
                                }
                                else
                                {
                                    session.RememberMe = false;
                                }
                                Session.Add(CommonContanst.USER_SESSION, session);
                                Response.Redirect("Index.aspx");
                            }
                            else
                            {
                                msg.Visible = true;
                                msg.Text = "Bạn không có quyền truy cập.";
                            }
                        }
                        else
                        {
                            msg.Visible = true;
                            msg.Text = "Đã có lỗi xảy ra. Vui lòng thử lại sau.";
                        }
                    }
                }
            }
        }
    }
}