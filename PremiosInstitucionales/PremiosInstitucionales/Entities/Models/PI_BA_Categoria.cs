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
    
    public partial class PI_BA_Categoria
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public PI_BA_Categoria()
        {
            this.PI_BA_Forma = new HashSet<PI_BA_Forma>();
            this.PI_BA_Aplicacion = new HashSet<PI_BA_Aplicacion>();
            this.PI_BA_JuezPorCategoria1 = new HashSet<PI_BA_JuezPorCategoria>();
        }
    
        public string cveCategoria { get; set; }
        public string Nombre { get; set; }
        public string cveConvocatoria { get; set; }
    
        public virtual PI_BA_Convocatoria PI_BA_Convocatoria { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PI_BA_Forma> PI_BA_Forma { get; set; }
        public virtual PI_BA_JuezPorCategoria PI_BA_JuezPorCategoria { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PI_BA_Aplicacion> PI_BA_Aplicacion { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PI_BA_JuezPorCategoria> PI_BA_JuezPorCategoria1 { get; set; }
    }
}
