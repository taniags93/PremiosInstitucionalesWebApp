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
    
    public partial class PI_BA_Respuesta
    {
        public string cveRespuesta { get; set; }
        public string Valor { get; set; }
        public string cvePregunta { get; set; }
        public string cveAplicacion { get; set; }
    
        public virtual PI_BA_Aplicacion PI_BA_Aplicacion { get; set; }
        public virtual PI_BA_Evaluacion PI_BA_Evaluacion { get; set; }
        public virtual PI_BA_Pregunta PI_BA_Pregunta { get; set; }
    }
}
