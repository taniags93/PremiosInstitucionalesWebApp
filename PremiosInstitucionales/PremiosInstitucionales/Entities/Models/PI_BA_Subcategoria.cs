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
    
    public partial class PI_BA_Subcategoria
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public PI_BA_Subcategoria()
        {
            this.PI_BA_Pregunta = new HashSet<PI_BA_Pregunta>();
            this.PI_BA_Respuesta = new HashSet<PI_BA_Respuesta>();
        }
    
        public string cveSubcategoria { get; set; }
        public string Nombre { get; set; }
        public Nullable<int> Orden { get; set; }
        public string Ciclo { get; set; }
        public string cveCategoria { get; set; }
    
        public virtual PI_BA_Categoria PI_BA_Categoria { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PI_BA_Pregunta> PI_BA_Pregunta { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PI_BA_Respuesta> PI_BA_Respuesta { get; set; }
    }
}
