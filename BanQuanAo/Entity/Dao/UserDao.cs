using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BanQuanAo.Entity.EF;

namespace BanQuanAo.Entity.Dao
{
    public class UserDao
    {
        private databasequanaoEntities1 db;
        private static UserDao instance;

        public static UserDao Instance
        {
            get { if (instance == null) instance = new UserDao(); return instance; }
        }

        private UserDao()
        {
            db = new databasequanaoEntities1();
        }

        public int CheckUser(string userName, string pass)
        {
            
            var user = db.tbl_Customer.Where(x => (x.Usermame.Equals(userName) || x.Email.Equals(userName))).FirstOrDefault();
            if (user != null)
            {
                if (!user.IsLock)
                {
                    if (user.Password.Equals(pass))
                    {
                        return 1;
                    }
                    else
                    {
                        return 0;
                    }
                }
                else
                {
                    return -2;
                }
            }
            else
            {
                return -1;
            }
        }

        public List<tbl_Customer> GetListUser()
        {
            return db.tbl_Customer.Where(x => x.IsDelete != true).ToList();
        }

        public tbl_Customer GetUser(string userName)
        {
            return db.tbl_Customer.Where(x => (x.Usermame.Equals(userName) || x.Email.Equals(userName))).First();
        }


        public bool CreateUser(tbl_Customer user)
        {
            try
            {
                db.tbl_Customer.Add(user);
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool UpdateUser(tbl_Customer user)
        {
            var result = db.tbl_Customer.Find(user.UserID);
            if (result != null)
            {
                result.Usermame = user.Usermame;
                result.Email = user.Email;
                result.FullName = user.FullName;
                result.Phone = user.Phone;
                result.Address = user.Address;
                result.Password = user.Password;
                try
                {
                    db.SaveChanges();
                    return true;
                }
                catch
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
        }

        public bool LockUer(int id)
        {
            var result = db.tbl_Customer.Find(id);
            if(result != null)
            {
                result.IsLock = !result.IsLock;
                try
                {
                    db.SaveChanges();
                    return true;
                }
                catch
                {
                    return false;
                }
            }
            return false;
        }

        public bool DeleteUser(int id)
        {
            var result = db.tbl_Customer.Find(id);
            if(result != null)
            {
                try
                {
                    result.IsDelete = true;
                    db.SaveChanges();
                    return true;
                }
                catch
                {
                    return false;
                }
            }
            return false;
        }
    }
}