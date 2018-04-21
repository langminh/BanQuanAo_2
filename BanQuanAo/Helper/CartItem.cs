using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using BanQuanAo.Entity.EF;
namespace BanQuanAo.Helper
{
    public class CartItem
    {
        public tbl_Product Product { get; set; }
        public int Quantity { get; set; }
    }

    public class Hang : Entity.EF.tbl_Product
    {
        public int SoLuongMua { get; set; }
        public decimal TongTien
        {
            get
            {
                return (decimal)(SoLuongMua * Price_Export);
            }
        }
    }
}