//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DataLayer
{
    using System;
    using System.Collections.Generic;
    
    public partial class Product
    {
        public short Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public Nullable<bool> IsValid { get; set; }
        public Nullable<bool> IsGoods { get; set; }
        public byte[] Image { get; set; }
        public Nullable<int> ApplicantId { get; set; }
        public Nullable<bool> IsRequested { get; set; }
    
        public virtual Applicant Applicant { get; set; }
    }
}
