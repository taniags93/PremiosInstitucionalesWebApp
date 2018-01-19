using PremiosInstitucionales.Entities.Models;
using System;
using System.Collections.Generic;
using System.Linq;

namespace PremiosInstitucionales.DBServices.InformacionPersonalAdministrador
{
    public class InformacionPersonalAdministradorService
    {
        public static List<PI_SE_Administrador> GetAdministradores()
        {
            using (var dbContext = new wPremiosInstitucionalesdbEntities())
            {
                try
                {
                    return dbContext.GetAdministrador(null, null, null).ToList();
                }
                catch (Exception Ex)
                {
                    Console.WriteLine("Catched Exception: " + Ex.Message + Environment.NewLine);
                    return null;
                }
            }
        }

        public static PI_SE_Administrador GetAdministradorByCorreo(string correo)
        {
            using (var dbContext = new wPremiosInstitucionalesdbEntities())
            {
                try
                {
                    return dbContext.GetAdministrador(correo, null, null).FirstOrDefault();
                }
                catch (Exception Ex)
                {
                    Console.WriteLine("Catched Exception: " + Ex.Message + Environment.NewLine);
                    return null;
                }
            }
        }

        public static PI_SE_Administrador GetAdministradorByToken(string token)
        {
            using (var dbContext = new wPremiosInstitucionalesdbEntities())
            {
                try
                {
                    return dbContext.GetAdministrador(null, null, token).FirstOrDefault();
                }
                catch (Exception Ex)
                {
                    Console.WriteLine("Catched Exception: " + Ex.Message + Environment.NewLine);
                    return null;
                }
            }
        }

        public static PI_SE_Administrador GetAdministradorById(string id)
        {
            using (var dbContext = new wPremiosInstitucionalesdbEntities())
            {
                try
                {
                    return dbContext.GetAdministrador(null, id, null).FirstOrDefault();
                }
                catch (Exception Ex)
                {
                    Console.WriteLine("Catched Exception: " + Ex.Message + Environment.NewLine);
                    return null;
                }
            }
        }

        public static bool UpdateAdministrador(PI_SE_Administrador objAdministrador)
        {
            using (var dbContext = new wPremiosInstitucionalesdbEntities())
            {
                try
                {
                    dbContext.UpdateAdministrador(  objAdministrador.cveAdministrador,
                                                    objAdministrador.Password,
                                                    objAdministrador.Correo,
                                                    objAdministrador.FechaExpiracionRecuperar,
                                                    objAdministrador.TokenRecuperar);
                    dbContext.SaveChanges();
                    return true;
                }
                catch (Exception Ex)
                {
                    Console.WriteLine("Catched Exception: " + Ex.Message + Environment.NewLine);
                    return false;
                }
            }
        }
    }
}   