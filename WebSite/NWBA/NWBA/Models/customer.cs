//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace NWBA.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class customer
    {
        public customer()
        {
            this.accounts = new HashSet<account>();
            this.customerAddresses = new HashSet<customerAddress>();
            this.customerPhoneNumbers = new HashSet<customerPhoneNumber>();
        }
    
        public int custID { get; set; }
        public string custName { get; set; }
        public string TFN { get; set; }
        public System.DateTime dateCreated { get; set; }
    
        public virtual ICollection<account> accounts { get; set; }
        public virtual ICollection<customerAddress> customerAddresses { get; set; }
        public virtual ICollection<customerPhoneNumber> customerPhoneNumbers { get; set; }
        public virtual login login { get; set; }
    }
}