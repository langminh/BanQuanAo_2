using BanQuanAo.Entity.EF;
using BanQuanAo.Helper;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BanQuanAo.Admin
{
    public partial class Index : System.Web.UI.Page
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
            lbTruyCap.Text = db.Counters.Count() + "";
            DateTime today = DateTime.Now;
            var startDate = new DateTime(today.Year, today.Month, 1);
            var endDate = startDate.AddMonths(1).AddDays(-1);

            lbSoild.Text = db.tbl_Order.Where(x => EntityFunctions.TruncateTime(x.Date) >= startDate.Date && EntityFunctions.TruncateTime(x.Date) <= endDate.Date).Count() + "";
            lbComment.Text = Application["NoOfVisitor"].ToString();
            
        }

        void load()
        {
            var list = db.tbl_Order.OrderByDescending(x => x.Date).Take(10).ToList();
            List<Temp> temps = new List<Temp>();
            foreach (var item in list)
            {
                temps.Add(new Temp()
                {
                    MaDH = item.Order_ID,
                    HoTen = item.Name_Received,
                    ThoiGian = item.Date,
                    TrangThai = item.State,
                    SoLuong = item.tbl_OrderDetial.Where(x => x.Order_ID == item.Order_ID).First().Amount.Value
                });
            }
            listDH.DataSource = temps;
            listDH.DataBind();
            DateTime today = DateTime.Now;
            var startDate = new DateTime(today.Year, today.Month, 1);
            var endDate = startDate.AddMonths(1).AddDays(-1);
            lbTotalSoild.Text = db.tbl_Order.Count() + "";
            lbTotalMonth.Text = db.tbl_Order.Where(x => EntityFunctions.TruncateTime(x.Date) >= startDate.Date && EntityFunctions.TruncateTime(x.Date) <= endDate.Date).Count() + "";
            var wStart = FirstDayOfWeek(DateTime.Now);
            var wEnd = LastDayOfWeek(DateTime.Now);
            lbTotalMonth.Text = db.tbl_Order.Where(x => EntityFunctions.TruncateTime(x.Date) >= wStart.Date && EntityFunctions.TruncateTime(x.Date) <= wEnd.Date).Count() + "";

            Label1.Text = db.Counters.Count() + "";
            Label2.Text = db.Counters.Where(x => EntityFunctions.TruncateTime(x.CreateTime) >= startDate.Date && EntityFunctions.TruncateTime(x.CreateTime) <= endDate.Date).Count() + "";
            Label3.Text = db.Counters.Where(x => EntityFunctions.TruncateTime(x.CreateTime) >= wStart.Date && EntityFunctions.TruncateTime(x.CreateTime) <= wEnd.Date).Count() + "";
        }

        public DateTime FirstDayOfWeek(DateTime date)
        {
            DayOfWeek fdow = CultureInfo.CurrentCulture.DateTimeFormat.FirstDayOfWeek;
            int offset = fdow - date.DayOfWeek;
            DateTime fdowDate = date.AddDays(offset);
            return fdowDate;
        }

        public DateTime LastDayOfWeek(DateTime date)
        {
            DateTime ldowDate = FirstDayOfWeek(date).AddDays(6);
            return ldowDate;
        }

        protected void listDH_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("See"))
            {
                Response.Redirect("XemHoaDon.aspx?Order_ID=" + e.CommandArgument.ToString());
            }
        }

        private class Temp
        {
            public string MaDH { get; set; }
            public string HoTen { get; set; }
            public DateTime ThoiGian { get; set; }
            public int SoLuong { get; set; }
            public string TrangThai { get; set; }
        }
    }
}