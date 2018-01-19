using System;
using PremiosInstitucionales.DBServices.InformacionPersonalCandidato;
using PremiosInstitucionales.DBServices.InformacionPersonalJuez;
using PremiosInstitucionales.DBServices.InformacionPersonalAdministrador;

namespace PremiosInstitucionales.DBServices.Recuperar
{
    public class RecuperarService
    {
        public static String GetID(String email)
        {
            String id = null;
            var candidato = InformacionPersonalCandidatoService.GetCandidatoByCorreo(email);
            if (candidato == null)
            {
                var juez = InformacionPersonalJuezService.GetJuezByCorreo(email);
                if (juez == null)
                {
                    var admin = InformacionPersonalAdministradorService.GetAdministradorByCorreo(email);
                    if (admin != null)
                    {
                        id = "a" + admin.cveAdministrador;
                    }
                }
                else
                {
                    id = "j" + juez.cveJuez;
                }
            }
            else
            {
                id = "c" + candidato.cveCandidato;
            }
            return id;
        }

        public static String GetID2(String email)
        {
            String id = null;
            var candidato = InformacionPersonalCandidatoService.GetCandidatoByCorreo(email);
            if (candidato == null)
            {
                var juez = InformacionPersonalJuezService.GetJuezByCorreo(email);
                if (juez == null)
                {
                    var admin = InformacionPersonalAdministradorService.GetAdministradorByCorreo(email);
                    if (admin != null)
                    {
                        id = admin.cveAdministrador;
                    }
                }
                else
                {
                    id = juez.cveJuez;
                }
            }
            else
            {
                id = candidato.cveCandidato;
            }
            return id;
        }

        public static String GetType(String id)
        {
            var tipo = "";
            var candidato = InformacionPersonalCandidatoService.GetCandidatoById(id);
            if (candidato == null)
            {
                var juez = InformacionPersonalJuezService.GetJuezById(id);
                if (juez == null)
                {
                    var admin = InformacionPersonalAdministradorService.GetAdministradorById(id);
                    if (admin != null)
                    {
                        tipo = "a";
                    }
                }
                else
                {
                    tipo = "j";
                }
            }
            else
            {
                tipo = "c";
            }
            return tipo;
        }

        public static bool CambiarContrasenaCandidato(String cve, String password)
        {
            var objCandidato = InformacionPersonalCandidatoService.GetCandidatoById(cve);
            if (objCandidato != null)
            {
                objCandidato.Password = password;
                return InformacionPersonalCandidatoService.UpdateCandidato(objCandidato);
            }
            return false;
        }
        public static bool CambiarContrasenaJuez(String cve, String password)
        {
            var objJuez = InformacionPersonalJuezService.GetJuezById(cve);
            if (objJuez != null)
            {
                objJuez.Password = password;
                return InformacionPersonalJuezService.UpdateJuez(objJuez);
            }
            return false;
        }
        public static bool CambiarContrasenaAdministrador(String cve, String password)
        {
            var objAdministrador = InformacionPersonalAdministradorService.GetAdministradorById(cve);
            if (objAdministrador != null)
            {
                objAdministrador.Password = password;
                return InformacionPersonalAdministradorService.UpdateAdministrador(objAdministrador);
            }
            return false;
        }

        public static bool AgregarTokenDB(String cve, String token, DateTime date)
        {
            var tipo = GetType(cve);

            if(tipo == "c")
            {
                var objCandidato = InformacionPersonalCandidatoService.GetCandidatoById(cve);
                if (objCandidato != null)
                {
                    objCandidato.TokenRecuperar = token;
                    objCandidato.FechaExpiracionRecuperar = date;
                    return InformacionPersonalCandidatoService.UpdateCandidato(objCandidato);
                }
            }
            else if (tipo == "j")
            {
                var objJuez = InformacionPersonalJuezService.GetJuezById(cve);
                if (objJuez != null)
                {
                    objJuez.TokenRecuperar = token;
                    objJuez.FechaExpiracionRecuperar = date;
                    return InformacionPersonalJuezService.UpdateJuez(objJuez);
                }
            }
            else if (tipo == "a")
            {
                var objAdmin = InformacionPersonalAdministradorService.GetAdministradorById(cve);
                if (objAdmin != null)
                {
                    /*
                    objAdmin.TokenRecuperar = token;
                    objAdmin.FechaExpiracionRecuperar = date;
                    return InformacionPersonalAdministradorService.GetAdministradorById(cve);
                    */
                }
            }
            
            return false;
        }
    }
}