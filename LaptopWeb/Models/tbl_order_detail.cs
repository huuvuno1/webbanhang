//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace LaptopWeb.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class tbl_order_detail
    {
        public int id { get; set; }
        public int product_id { get; set; }
        public int price { get; set; }
        public int quantity { get; set; }
        public int order_id { get; set; }
    
        public virtual tbl_order tbl_order { get; set; }
        public virtual tbl_product tbl_product { get; set; }
    }
}
