using System;
using System.Xml.Serialization;

namespace Aop.Api.Domain
{
    /// <summary>
    /// KoubeiItemExtitemQueryModel Data Structure.
    /// </summary>
    [Serializable]
    public class KoubeiItemExtitemQueryModel : AopObject
    {
        /// <summary>
        /// ååįžį 
        /// </summary>
        [XmlElement("item_code")]
        public string ItemCode { get; set; }
    }
}
