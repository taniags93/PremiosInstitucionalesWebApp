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
    
    public partial class PI_BA_Juez
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public PI_BA_Juez()
        {
            this.PI_BA_JuezPorCategoria = new HashSet<PI_BA_JuezPorCategoria>();
            this.PI_BA_Evaluacion1 = new HashSet<PI_BA_Evaluacion>();
        }
    
        public string cveJuez { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Correo { get; set; }
        public string NombreImagen { get; set; }
    
        public virtual PI_BA_Evaluacion PI_BA_Evaluacion { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PI_BA_JuezPorCategoria> PI_BA_JuezPorCategoria { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PI_BA_Evaluacion> PI_BA_Evaluacion1 { get; set; }
    }
}
