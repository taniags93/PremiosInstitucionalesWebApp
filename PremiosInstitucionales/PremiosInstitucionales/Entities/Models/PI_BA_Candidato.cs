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
    
    public partial class PI_BA_Candidato
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public PI_BA_Candidato()
        {
            this.PI_BA_Aplicacion = new HashSet<PI_BA_Aplicacion>();
        }
    
        public string cveCandidato { get; set; }
        public string Password { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public Nullable<bool> Confirmado { get; set; }
        public string Correo { get; set; }
        public string CodigoConfirmacion { get; set; }
        public string Telefono { get; set; }
        public string Nacionalidad { get; set; }
        public string RFC { get; set; }
        public string Direccion { get; set; }
        public string NombreImagen { get; set; }
        public Nullable<System.DateTime> FechaPrivacidadDatos { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PI_BA_Aplicacion> PI_BA_Aplicacion { get; set; }
    }
}
