//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace PremiosInstitucionales.Entities.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class PI_BA_JuezPorCategoria
    {
        public string cveJuezPorCategoria { get; set; }
        public string cveJuez { get; set; }
        public string cveCategoria { get; set; }
    
        public virtual PI_BA_Categoria PI_BA_Categoria { get; set; }
        public virtual PI_BA_Juez PI_BA_Juez { get; set; }
    }
}
