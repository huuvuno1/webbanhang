using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Data.Entity.Core.Objects;

namespace LaptopWeb.Models
{
    public class LaptopWebEntity: DbContext
    {
        public LaptopWebEntity()
            : base("name=LaptopWebEntities")
        { }
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
        public virtual DbSet<tbl_user> TblUsers { get; set; }
        public virtual DbSet<tbl_product> Tbl_Products { get; set; }
        public virtual DbSet<tbl_category> Tbl_Categories { get; set;}
    }
}