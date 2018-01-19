using PremiosInstitucionales.DBServices.Recuperar;
using PremiosInstitucionales.DBServices.Mail;
using System;
using System.Text;
using System.Text.RegularExpressions;
using System.Web.UI;
using PremiosInstitucionales.DBServices.InformacionPersonalCandidato;
using PremiosInstitucionales.DBServices.InformacionPersonalJuez;
using PremiosInstitucionales.DBServices.InformacionPersonalAdministrador;




namespace PremiosInstitucionales.WebForms
{
    public partial class RecuperaCuenta : System.Web.UI.Page
    {
        MP_Login MasterPage = new MP_Login();
        protected void Page_Load(object sender, EventArgs e)
        {
            MasterPage = (MP_Login)Page.Master;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String password1 = PasswordTextBox.Text;
            String password2 = ConfirmPasswordTextBox.Text;
            bool sePudo = false;
            string toMail = "";
            string id = "";
            bool contrasenas = false;
            bool fechaExp = false;
            if (password1.Equals(password2))
            {
                Regex regexNumero = new Regex(@".*\d.*");
                Regex regexLetra = new Regex(@".*[a-zA-z].*");
                Match matchNumero = regexNumero.Match(password1);
                Match matchLetra = regexLetra.Match(password1);
                if (password1.Length < 6 || !matchNumero.Success || !matchLetra.Success)
                {
                    MasterPage.ShowMessage("Error", "La contraseña debe ser de al menos 6 caracteres <br/> y contener al menos un número y una letra.");
                }
                else
                {
                    contrasenas = true;
                    String cve = Request.QueryString["codigo"];

                    var candidato = InformacionPersonalCandidatoService.GetCandidatoByToken(cve);

                    if (candidato != null)
                    {
                        if(candidato.FechaExpiracionRecuperar > DateTime.Now)
                        {
                            sePudo = RecuperarService.CambiarContrasenaCandidato(candidato.cveCandidato, sha256(password1));
                            toMail = candidato.Correo;
                            id = candidato.cveCandidato;
                        }
                        else
                        {
                            fechaExp = true;
                        }
                    }
                    else
                    {
                        var juez = InformacionPersonalJuezService.GetJuezByToken(cve);

                        if (juez != null)
                        {
                            if (juez.FechaExpiracionRecuperar > DateTime.Now)
                            {
                                sePudo = RecuperarService.CambiarContrasenaJuez(juez.cveJuez, sha256(password1));
                                toMail = juez.Correo;
                                id = juez.cveJuez;
                            }
                            else
                            {
                                fechaExp = true;
                            }
                        }
                        else
                        {
                            var administrador = InformacionPersonalAdministradorService.GetAdministradorByToken(cve);

                            if (administrador != null)
                            { 
                                if (administrador.FechaExpiracionRecuperar > DateTime.Now)
                                {
                                    sePudo = RecuperarService.CambiarContrasenaAdministrador(administrador.cveAdministrador, sha256(password1));
                                    toMail = administrador.Correo;
                                    id = administrador.cveAdministrador;
                                }
                                else
                                {
                                    fechaExp = true;
                                }
                                
                            }
                        }
                    }
                }
            }
            else
            {
                MasterPage.ShowMessage("Error", "Contraseñas no coinciden.");
            }
            if (sePudo)
            {
                var MailService = new MailService();
                if (MailService.EnviarCorreoInvitacionCandidato(toMail, id))
                {
                    MasterPage.ShowMessage("Aviso", "Contraseña cambiada exitosamente.");
                }
                else
                {
                    MasterPage.ShowMessage("Error", "Dirección de correo no válida.");
                }
            }
            else if (fechaExp)
            {
                MasterPage.ShowMessage("Error", "Error: URL Expirada.");
            }
            else if (contrasenas)
            {
                MasterPage.ShowMessage("Error", "Error: URL inválida.");
            }
        }

        static string sha256(string rawPassword)
        {
            System.Security.Cryptography.SHA256Managed crypt = new System.Security.Cryptography.SHA256Managed();
            System.Text.StringBuilder hash = new System.Text.StringBuilder();
            byte[] crypto = crypt.ComputeHash(Encoding.UTF8.GetBytes(rawPassword), 0, Encoding.UTF8.GetByteCount(rawPassword));
            foreach (byte theByte in crypto)
            {
                hash.Append(theByte.ToString("x2"));
            }
            return hash.ToString();
        }
    }
}