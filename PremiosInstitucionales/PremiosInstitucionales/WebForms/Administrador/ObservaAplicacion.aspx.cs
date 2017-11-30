using PremiosInstitucionales.DBServices.Aplicacion;
using PremiosInstitucionales.DBServices.Convocatoria;
using PremiosInstitucionales.DBServices.Evaluacion;
using PremiosInstitucionales.DBServices.InformacionPersonalCandidato;
using PremiosInstitucionales.Entities.Models;
using PremiosInstitucionales.Values;
using System;
using System.Linq;
using System.Collections.Generic;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PremiosInstitucionales.WebForms
{
    public partial class ObservaAplicacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Verificar si ya expiro la sesion
            if (Session.Contents.Count == 0)
            {
                Response.Redirect("~/WebForms/Error/Error401.aspx", false);
            }

            if (!IsPostBack)
            {
                // revisar la primera vez que se carga la pagina que se haya iniciado sesion con cuenta de admin
                if (Session[StringValues.RolSesion] != null)
                {
                    if (Session[StringValues.RolSesion].ToString() != StringValues.RolAdmin)
                        // si no es admin, redireccionar a inicio general
                        Response.Redirect("~/WebForms/Login.aspx", false);
                }
                else
                {
                    Response.Redirect("~/WebForms/Login.aspx", false);
                }
            }
            String idApp = Request.QueryString["a"];
            if (idApp != null)
            {
                PerfilCandidato();
                CrearArchivo();

                String sCategoriaID = AplicacionService.GetCveCategoriaByAplicacion(idApp);
                if (sCategoriaID != null)
                {
                    var premio = ConvocatoriaService.GetPremioByCategoria(sCategoriaID);
                    var categoria = ConvocatoriaService.GetCategoriaById(sCategoriaID);

                    if (premio != null && categoria != null)
                    {
                        string sMail = Session[StringValues.CorreoSesion].ToString();
                        var listaCategorias = EvaluacionService.GetCategoriaByJuez(sMail);
                        var eval = CheckExistenceOfEvaluation(sMail, idApp);

                        CrearFormulario(sCategoriaID, premio, categoria);
                    }
                }
            }
        }

        private void CrearArchivo()
        {
            LiteralControl lcPregunta = new LiteralControl("<div class='col-sm-4'> <h5> <strong>" + "Archivo proporcionado:" + "</strong> </h5>");
            PanelArchivo.Controls.Add(lcPregunta);

            string appId = Request.QueryString["a"];
            var app = AplicacionService.GetAplicacionById(appId);

            LinkButton lbDocumento = new LinkButton();
            lbDocumento.Text = app.NombreArchivo;
            lbDocumento.Style.Add("font-size", "14pt");
            lbDocumento.Style.Add("color", "#00acc1");
            lbDocumento.Style.Add("text-decoration", "underline");
            lbDocumento.Command += new CommandEventHandler(DownloadFile);
            lbDocumento.CommandArgument = appId;
            PanelArchivo.Controls.Add(lbDocumento);
            PanelArchivo.Controls.Add(new LiteralControl("</div> </div> <br/>"));
        }

        private void PerfilCandidato()
        {
            // Perfil
            String idApp = Request.QueryString["a"];
            var app = AplicacionService.GetAplicacionById(idApp);
            var candidato = InformacionPersonalCandidatoService.GetCandidatoById(app.cveCandidato);

            LiteralControl lcPerfil = new LiteralControl("<div class='row text-center'> <div class='col-sm-4'> <h5> <strong>" + "Candidato:" + "</strong> </h5>");
            PanelArchivo.Controls.Add(lcPerfil);

            LinkButton lbUserProfile = new LinkButton();
            lbUserProfile.Text = candidato.Nombre + " " + candidato.Apellido;
            lbUserProfile.Style.Add("font-size", "14pt");
            lbUserProfile.Style.Add("color", "#00acc1");
            lbUserProfile.Style.Add("text-decoration", "underline");
            lbUserProfile.Attributes.Add("onclick", "window.open('AdministraInformacionPersonal.aspx?id=" + candidato.cveCandidato + "&t=candidato');");
            PanelArchivo.Controls.Add(lbUserProfile);
            PanelArchivo.Controls.Add(new LiteralControl("</div>"));

            // Calif. Promedio
            LiteralControl lcPregunta = new LiteralControl("<div class='col-sm-4'> <h5> <strong>" + "Calificación promedio:" + "</strong> </h5>");
            PanelArchivo.Controls.Add(lcPregunta);

            LiteralControl lcCalificacion = new LiteralControl();
            var evaluaciones = EvaluacionService.GetEvaluacionesByAplicacion(app.cveAplicacion);
            double prom = GetPromedioEvaluaciones(evaluaciones);
            if (prom >= 70)
            {
                lcCalificacion = new LiteralControl("<h5 style=\"color: #4caf50;\"> <div style=\"display: none; \"> " + (prom - 100) + " </div> " + prom + " </h5>");
            }
            else if (prom >= 0)
            {
                lcCalificacion = new LiteralControl("<h5 style=\"color: #f9a825;\"> <div style=\"display: none; \"> " + (prom - 100) + " </div> " + prom + " </h5>");
            }
            else
            {
                lcCalificacion = new LiteralControl("<h5 style=\"color: #f44336;\"> <div style=\"display: none; \"> 1000 </div> Sin evaluaciones </h5>");
            }
            PanelArchivo.Controls.Add(lcCalificacion);
            PanelArchivo.Controls.Add(new LiteralControl("</div>"));
        }

        private void CrearFormulario(String sCategoriaID, PI_BA_Premio premio, PI_BA_Categoria categoria)
        {
            litTituloPremio.Text = "Premio " + premio.Nombre;
            litTituloCategoria.Text = "Categoría: " + categoria.Nombre;
            String app = Request.QueryString["a"];

            String emailCandidato = Session[StringValues.CorreoSesion].ToString();
           
                // vaciar coleccion de preguntas para evitar IDs repetidos
                PanelFormulario.Controls.Clear();

                // obtener lista de preguntas para la categoria y desplegar el formulario
                var subcategorias = ConvocatoriaService.GetSubcategoria(categoria.cveCategoria);
                var preguntas = AplicacionService.GetFormularioByCategoria(categoria.cveCategoria);


            if (subcategorias != null && subcategorias.Count > 0)
            {
                foreach (var sub in subcategorias)
                {
                    Panel panel = new Panel();
                    panel.CssClass = "question-box";
                    panel.Attributes.Add("runat", "server");

                    LiteralControl h5 = new LiteralControl("<h4>" + sub.Nombre + "</h4>");
                    panel.Controls.Add(h5);
                    if (sub.Ciclo == "No")
                    {
                        foreach (var p in preguntas)
                        {
                            if (p.cveSubcategoria == sub.cveSubcategoria)
                            {
                                var respuesta = AplicacionService.GetRespuestaByPreguntaAndAplicacionAndNumero(p.cvePregunta, app, 1);

                                LiteralControl pregunta = new LiteralControl(p.Texto + "<input type='text' name='" + sub.cveSubcategoria + "' id=" + p.cvePregunta + " value='" + respuesta.Valor + "' class='form-control' style='width:100%;' readonly><br>");
                                panel.Controls.Add(pregunta);
                            }
                            PanelFormulario.Controls.Add(panel);
                        }
                    }
                    else
                    {
                        string table = "<table id='table-" + sub.cveSubcategoria + "' style='width:100%;' class='table table-striped'><thead><tr>";
                        string ansRows = "<tr>";
                        string questionIDs = "";
                        int i = 0;
                        int k = 0;
                        var respuestas = AplicacionService.GetRespuestasBySubcategoriaAndAplicacion(sub.cveSubcategoria, app);
                        while (k < respuestas.Count)
                        {
                            foreach (var p in preguntas)
                            {
                                if (p.cveSubcategoria == sub.cveSubcategoria)
                                {
                                    var respuesta = AplicacionService.GetRespuestaByPreguntaAndAplicacionAndNumero(p.cvePregunta, app, i + 1);
                                    if (i == 0)
                                    {
                                        table += "<th>" + p.Texto + "</th>";
                                    }
                                    ansRows += "<td><textarea name='" + sub.cveSubcategoria + "' id='row1-" + p.cvePregunta + "' cols='20' rows='4' value='' readonly>" + respuesta.Valor + "</textarea></td>";
                                    questionIDs += p.cvePregunta + ",";
                                    k++;
                                }
                            }
                            i++;
                            ansRows += "</tr>";
                        }

                        table += "</tr></thead>";
                        table += "<tbody>" + ansRows + "</tbody></table>";

                        LiteralControl tabla = new LiteralControl(table);
                        LiteralControl saveRowControl = new LiteralControl("<div id='saveRow-" + sub.cveSubcategoria + "' style='display:none;' data-rows='" + questionIDs + "'></div>");

                        panel.Controls.Add(tabla);
                        panel.Controls.Add(saveRowControl);

                        PanelFormulario.Controls.Add(panel);
                    }
                }
            }
        }

        private PI_BA_Evaluacion CheckExistenceOfEvaluation(string sMail, string sAppId)
        {
            var eval = EvaluacionService.GetEvaluacionByAplicacionAndJuez(sMail, sAppId);
            return eval;
        }

        private double GetPromedioEvaluaciones(List<PI_BA_Evaluacion> evaluaciones)
        {
            double? result = evaluaciones.Average(eval => eval.Calificacion);
            if (result.HasValue)
                return result.Value;
            return -1;
        }

        public void DownloadFile(object sender, CommandEventArgs e)
        {
            var app = AplicacionService.GetAplicacionById(e.CommandArgument.ToString());
            string FileName = app.NombreArchivo;
            string FilePath = Server.MapPath("~/UsersAppsFiles/") + FileName;
            FileInfo fs = new FileInfo(FilePath);
            int FileLength = Convert.ToInt32(fs.Length);

            if (File.Exists(FilePath))
            {
                Response.Clear();
                Response.BufferOutput = false;
                Response.ContentType = "application/octet-stream";
                Response.AddHeader("Content-Length", FileLength.ToString());
                Response.AddHeader("content-disposition", "attachment; filename=" + FileName);
                Response.TransmitFile(FilePath);
                Response.Flush();
            }
            else
            {
                //lblMsg.Text = "Error: File not found!";
            }

        }

        protected void CloseBtn_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(GetType(), "ClosePage", "window.close();", true);
        }
    }
}