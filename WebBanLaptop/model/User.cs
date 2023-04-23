using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebBanLaptop.model
{
    public class User
    {
        public int Id { get; set; }
        public string Username { get; set; }
        public string Fullname { get; set; }
        public string Password { get; set; }
        public int Role { get; set; }


        public User(int id, string username, string fullname, string password, int role)
        {
            Id = id;
            Username = username;
            Fullname = fullname;
            Password = password;
            Role = role;
        }

        public User()
        {
        }
    }
}