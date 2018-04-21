using BanQuanAo.Entity.EF;
using BanQuanAo.Helper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BanQuanAo
{
    public partial class GioHang : BasePage
    {
        private databasequanaoEntities1 db = new databasequanaoEntities1();
        private List<tbl_Product> dsHangHoa = new List<tbl_Product>();
        //protected void Page_Load(object sender, EventArgs e)
        //{
        //    if (!Page.IsPostBack)
        //    {
        //        load();
        //    }
        //}

        //void load()
        //{
        //    try
        //    {
        //        var result = (List<CartItem>)Session[CommonContanst.CART_SESSION];
        //        if (result != null)
        //        {
        //            foreach (var item in result)
        //            {
        //                dsHangHoa.Add(item.Product);
        //            }
        //            GridView1.DataSource = dsHangHoa;
        //            GridView1.DataBind();
        //        }

        //    }
        //    catch (Exception ex)
        //    {
        //        Response.Redirect("TrangChu.aspx");
        //    }
        //}

        protected List<Hang> items = new List<Hang>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //load();
                TakeData();

                listBan.DataSource = db.tbl_Product.OrderByDescending(x => x.Order).Take(5).ToList();
                listBan.DataBind();
            }
            
            if (Session[CommonContanst.CART_SESSION] != null)
            {
                items = Session[CommonContanst.CART_SESSION] as List<Hang>;
                ListCart.DataSource = items;
                ListCart.DataBind();
            }
            
        }


        void TakeData()
        {
            if (Session[CommonContanst.CART_SESSION] != null)
            {
                items = Session[CommonContanst.CART_SESSION] as List<Hang>;

                if (Request["id"] != null)
                {
                    try
                    {
                        string id = Request["id"].ToString();
                        var temp = db.tbl_Product.Find(int.Parse(id));
                        int quanti = 0;
                        if (Request["soluong"] != null)
                        {
                            int.TryParse(Request["soluong"].ToString(), out quanti);
                        }
                        if (quanti <= 0)
                        {
                            quanti = 1;
                        }

                        if (items.Exists(x => x.Product_ID == temp.Product_ID))
                        {
                            foreach (var item in items)
                            {
                                if (item.Product_ID == temp.Product_ID)
                                {
                                    if(quanti == 1)
                                    {
                                        item.SoLuongMua = item.SoLuongMua + quanti;
                                    }
                                    else
                                    {
                                        item.SoLuongMua++;
                                    }
                                }
                            }
                        }
                        else
                        {
                            Hang h = new Hang();
                            h.Image = temp.Image;
                            h.Product_ID = temp.Product_ID;
                            h.Product_Name = temp.Product_Name;
                            h.Color = temp.Color;
                            h.Material = temp.Material;
                            h.Price_Export = temp.Price_Export;
                            h.SizeID = temp.SizeID;
                            h.Style_ID = temp.Style_ID;
                            h.Supplier_ID = temp.Supplier_ID;
                            h.Type_ID = temp.Type_ID;
                            h.SoLuongMua = quanti;
                            items.Add(h);
                        }
                        Session[CommonContanst.CART_SESSION] = items;

                        ListCart.DataSource = items;
                        ListCart.DataBind();
                    }
                    catch (Exception ex) { }
                }
            }
            else
            {
                if (Request["id"] != null)
                {
                    string id = Request["id"].ToString();
                    var temp = db.tbl_Product.Find(int.Parse(id));

                    Hang h = new Hang();
                    h.Image = temp.Image;
                    h.Product_ID = temp.Product_ID;
                    h.Product_Name = temp.Product_Name;
                    h.Color = temp.Color;
                    h.Material = temp.Material;
                    h.Price_Export = temp.Price_Export;
                    h.SizeID = temp.SizeID;
                    h.Style_ID = temp.Style_ID;
                    h.Supplier_ID = temp.Supplier_ID;
                    h.Type_ID = temp.Type_ID;
                    int quanti = 1;
                    if (Request["soluong"] != null)
                    {
                        int.TryParse(Request["soluong"].ToString(), out quanti);
                    }
                    if (quanti <= 0)
                    {
                        quanti = 1;
                    }
                    h.SoLuongMua = quanti;
                    items.Add(h);
                    Session[CommonContanst.CART_SESSION] = items;
                    //Session[CommonContanst.CART_HISTORY] = items;

                }


                ListCart.DataSource = items;
                ListCart.DataBind();
            }
            decimal tong = 0;
            foreach (var item in items)
            {
                tong += item.TongTien;
            }
            lbTong.Text = String.Format("{0:n0}", tong) + "VNĐ";
        }



        protected void ListCart_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("DeleteItem"))
            {
                items = Session[CommonContanst.CART_SESSION] as List<Hang>;
                int id = int.Parse(e.CommandArgument.ToString());
                var result = items.Find(x => x.Product_ID == id);
                items.Remove(result);
                Session[CommonContanst.CART_SESSION] = items;
                ListCart.DataSource = items;
                ListCart.DataBind();
                
            }
            else if (e.CommandName.Equals("UpdateItem"))
            {

                items = Session[CommonContanst.CART_SESSION] as List<Hang>;
                int id = int.Parse(e.CommandArgument.ToString());
                var result = items.Find(x => x.Product_ID == id);
                txtChange.Value = result.Product_ID + "";
                txtCoupon_code.Text = result.SoLuongMua + "";
                
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (txtChange.Value != null)
            {
                items = Session[CommonContanst.CART_SESSION] as List<Hang>;
                int id = int.Parse(txtChange.Value.ToString());
                var result = items.Find(x => x.Product_ID == id);

                int index = items.IndexOf(result);
                items.Remove(result);
                result.SoLuongMua = int.Parse(txtCoupon_code.Text);
                items.Insert(index, result);
                Session[CommonContanst.CART_SESSION] = items;
                Response.Redirect("GioHang.aspx");
            }
        }

        //protected void drVC_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    items = Session[CommonContanst.CART_SESSION] as List<Hang>;
        //    var vc = db.tbl_Transport.Find(int.Parse(drVC.SelectedValue.ToString()));
        //    decimal tong = 0;
        //    if (items != null)
        //    {
        //        if (items.Count > 0)
        //        {
        //            foreach (var item in items)
        //            {  
        //                tong += item.TongTien;
        //            }
        //            decimal tien = ((decimal)vc.PhiVC.Value * tong) / 100 + tong;
        //            lbPhi.Text = String.Format("{0:n0}", vc.PhiVC) + "%";
        //            lbTong.Text = String.Format("{0:n0}", tien) + "VNĐ";
        //        }
        //    }
        //}

        protected void btnThanhToan_Click(object sender, EventArgs e)
        {
            //Session[CommonContanst.PHI_VC] = drVC.SelectedValue.ToString();
            Response.Redirect("ThanhToanTien.aspx");
        }

        //protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    GridViewRow row = GridView1.SelectedRow;
        //    TextBox1.Text = row.Cells[1].Text;
        //    TextBox2.Text = row.Cells[6].Text;
        //    product_id.Value = row.Cells[0].Text;
        //}
    }
}