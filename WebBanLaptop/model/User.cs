using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebBanLaptop.Model
{
    public class User
    {
        public int Id { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Fullname { get; set; }
        public int Role { get; set; }

        public User(int id, string username, string password, string fullname, int role)
        {
            Id = id;
            Username = username;
            Password = password;
            Fullname = fullname;
            Role = role;
        }

        public User()
        {
        }
    }
}