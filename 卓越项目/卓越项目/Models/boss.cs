//------------------------------------------------------------------------------
// <auto-generated>
//    此代码是根据模板生成的。
//
//    手动更改此文件可能会导致应用程序中发生异常行为。
//    如果重新生成代码，则将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace 卓越项目.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class boss
    {
        public boss()
        {
            this.chongzhi = new HashSet<chongzhi>();
            this.fang = new HashSet<fang>();
            this.zhuce = new HashSet<zhuce>();
            this.fankui = new HashSet<fankui>();
            this.order = new HashSet<order>();
        }
    
        public int id { get; set; }
        public string name { get; set; }
        public string phone { get; set; }
        public string pwd { get; set; }
        public Nullable<decimal> dianjia { get; set; }
    
        public virtual ICollection<chongzhi> chongzhi { get; set; }
        public virtual ICollection<fang> fang { get; set; }
        public virtual ICollection<zhuce> zhuce { get; set; }
        public virtual ICollection<fankui> fankui { get; set; }
        public virtual ICollection<order> order { get; set; }
    }
}
