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
    
    public partial class PI_BA_Forma
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public PI_BA_Forma()
        {
            this.PI_BA_PreguntasPorForma = new HashSet<PI_BA_PreguntasPorForma>();
        }
    
        public string cveForma { get; set; }
        public string cveCategoria { get; set; }
        public Nullable<System.DateTime> FechaCreacion { get; set; }
        public string UsuarioCreacion { get; set; }
        public Nullable<System.DateTime> FechaEdicion { get; set; }
        public string UsuarioEdicion { get; set; }
    
        public virtual PI_BA_Categoria PI_BA_Categoria { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PI_BA_PreguntasPorForma> PI_BA_PreguntasPorForma { get; set; }
    }
}
