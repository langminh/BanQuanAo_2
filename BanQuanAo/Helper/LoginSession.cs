using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BanQuanAo.Helper
{
    public class LoginSession
    {
        public string userName { get; set; }
        public int userID { get; set; }
        public string passWord { get; set; }
        public bool RememberMe { get; set; }
        public int role { get; set; }
    }
    public class CommonContanst
    {
        public static string USER_SESSION
        {
            get
            {
                return "USER_SESSION";
            }
        }
        public static string CART_SESSION
        {
            get
            {
                return "CART_SESSION";
            }
        }

        public static string PHI_VC
        {
            get
            {
                return "PHI_VC";
            }
        }
    }
}