using PremiosInstitucionales.Entities.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using PremiosInstitucionales.DBServices.InformacionPersonalJuez;

namespace PremiosInstitucionales.DBServices.Evaluacion
{
    public class EvaluacionService
    {
        public static List<PI_BA_Categoria> GetCategoriaByJuez(String email)
        {
            using (var dbContext = new wPremiosInstitucionalesdbEntities())
            {
                try
                {
                    var juez = InformacionPersonalJuezService.GetJuezByCorreo(email);
                    return dbContext.GetCategoriaByIdJuez(juez.cveJuez).ToList();
                }
                catch (Exception Ex)
                {
                    Console.WriteLine("Catched Exception: " + Ex.Message + Environment.NewLine);
                    return null;
                }
            }
        }

        public static PI_BA_Premio GetPremioByCategoria(String categoriaId)
        {
            using (var dbContext = new wPremiosInstitucionalesdbEntities())
            {
                try
                {
                    return dbContext.GetPremioByIdCategoria(categoriaId).FirstOrDefault();
                }
                catch (Exception Ex)
                {
                    Console.WriteLine("Catched Exception: " + Ex.Message + Environment.NewLine);
                    return null;
                }
            }
        }

        public static void CrearEvaluacion(PI_BA_Evaluacion ev)
        {
            using (var dbContext = new wPremiosInstitucionalesdbEntities())
            {
                try
                {
                    dbContext.AddEvaluacion(ev.cveEvaluacion, ev.Calificacion, ev.cveAplicacion, ev.cveJuez, ev.cveSubcategoria, ev.esFinal);
                    dbContext.SaveChanges();
                }
                catch (Exception Ex)
                {
                    Console.WriteLine("Catched Exception: " + Ex.Message + Environment.NewLine);
                }
            }
        }

        /// Pending
        public static void ActualizaEvaluacion(String sEvalId, float calif)
        {
            using (var dbContext = new wPremiosInstitucionalesdbEntities())
            {
                try
                {
                    var eval = GetEvaluacionById(sEvalId);
                    dbContext.UpdateEvaluacion(eval.cveEvaluacion, calif, eval.cveAplicacion, eval.cveJuez, eval.cveSubcategoria, eval.esFinal);
                    dbContext.SaveChanges();
                }
                catch (Exception Ex)
                {
                    Console.WriteLine("Catched Exception: " + Ex.Message + Environment.NewLine);
                }
            }
        }

        public static PI_BA_Evaluacion GetEvaluacionById(String evalId)
        {
            using (var dbContext = new wPremiosInstitucionalesdbEntities())
            {
                try
                {
                    return dbContext.GetEvaluacion(evalId, null, null, "yes", null).FirstOrDefault();
                }
                catch (Exception Ex)
                {
                    Console.WriteLine("Catched Exception: " + Ex.Message + Environment.NewLine);
                    return null;
                }
            }
        }

        public static List<PI_BA_Evaluacion> GetEvaluacionesByAplicacion(String appId)
        {
            using (var dbContext = new wPremiosInstitucionalesdbEntities())
            {
                try
                {
                    string esFinal = "yes";
                    return dbContext.GetEvaluacion(null, appId, null, esFinal, null).ToList();
                }
                catch (Exception Ex)
                {
                    Console.WriteLine("Catched Exception: " + Ex.Message + Environment.NewLine);
                    return null;
                }
            }
        }

        public static List<PI_BA_Evaluacion> GetEvaluacionesByAplicacionAndJuezAndSubcategoria(String appId, string juezMail, string cveSubcategoria)
        {
            using (var dbContext = new wPremiosInstitucionalesdbEntities())
            {
                try
                {
                    var juez = InformacionPersonalJuezService.GetJuezByCorreo(juezMail);

                    string esFinal = "no";
                    return dbContext.GetEvaluacion(null, appId, juez.cveJuez, esFinal, cveSubcategoria).ToList();
                }
                catch (Exception Ex)
                {
                    Console.WriteLine("Catched Exception: " + Ex.Message + Environment.NewLine);
                    return null;
                }
            }
        }

        public static PI_BA_Evaluacion GetEvaluacionByAplicacionAndJuez(String juezMail, String appId)
        {
            using (var dbContext = new wPremiosInstitucionalesdbEntities())
            {
                try
                {
                    var juez = InformacionPersonalJuezService.GetJuezByCorreo(juezMail);
                    return dbContext.GetEvaluacion(null, appId, juez.cveJuez, "yes", null).FirstOrDefault();
                }
                catch (Exception Ex)
                {
                    Console.WriteLine("Catched Exception: " + Ex.Message + Environment.NewLine);
                    return null;
                }
            }
        }
    }
}