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
    
    public partial class OwnerShip
    {
        public OwnerShip()
        {
            this.Technologies = new HashSet<Technology>();
        }
    
        public byte Id { get; set; }
        public string Name { get; set; }
    
        public virtual ICollection<Technology> Technologies { get; set; }
    }
}
