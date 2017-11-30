using PremiosInstitucionales.DBServices.Aplicacion;
using PremiosInstitucionales.DBServices.Convocatoria;
using PremiosInstitucionales.DBServices.Evaluacion;
using PremiosInstitucionales.DBServices.InformacionPersonalJuez;
using PremiosInstitucionales.DBServices.InformacionPersonalCandidato;
using PremiosInstitucionales.Entities.Models;
using PremiosInstitucionales.Values;
using System;
using System.Collections.Generic;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PremiosInstitucionales.WebForms
{
    public partial class EvaluaAplicacion : System.Web.UI.Page
    {
        MP_Global MasterPage = new MP_Global();
        String cveAplicacion = null;

        int cveMensaje;
        List<Tuple<String, String>> MessagesList = new List<Tuple<String, String>>();

        protected void Page_Load(object sender, EventArgs e)
        {
            // Verificar si ya expiro la sesion
            if (Session.Contents.Count == 0)
            {
                Response.Redirect("~/WebForms/Error/Error401.aspx", false);
            }

            // Load Globals
            MasterPage = (MP_Global)Page.Master;
            cveAplicacion = Request.QueryString["a"];
            
            // Load Page
            LoadFile();
            LoadMessages();

            if (!IsPostBack)
            {
                // Show Message
                if (int.TryParse(Request.QueryString["m"], out cveMensaje))
                {
                    if (cveMensaje >= 0 && cveMensaje < MessagesList.Count)
                    {
                        MasterPage.ShowMessage(MessagesList[cveMensaje].Item1, MessagesList[cveMensaje].Item2);
                    }    
                }
                    
                // revisar la primera vez que se carga la pagina que se haya iniciado sesion con cuenta de juez
                if (Session[StringValues.RolSesion] != null)
                {
                    if (Session[StringValues.RolSesion].ToString() != StringValues.RolJuez)
                    {
                        // si no es juez, redireccionar a inicio general
                        Response.Redirect("~/WebForms/Login.aspx", false);
                    }
                }
                else
                {
                    Response.Redirect("~/WebForms/Login.aspx", false);
                }

                // Mostrar Caificación guardada / Mostrar botones correctos 
                if (cveAplicacion != null)
                {
                    String sCategoriaID = AplicacionService.GetCveCategoriaByAplicacion(cveAplicacion);
                    if (sCategoriaID != null)
                    {
                        var premio = ConvocatoriaService.GetPremioByCategoria(sCategoriaID);
                        var categoria = ConvocatoriaService.GetCategoriaById(sCategoriaID);

                        if (premio != null && categoria != null)
                        {
                            string sMail = Session[StringValues.CorreoSesion].ToString();
                            var listaCategorias = EvaluacionService.GetCategoriaByJuez(sMail);
                            bool bValidJudge = CheckValidCategory(listaCategorias, sCategoriaID);
                            var Eval = EvaluacionService.GetEvaluacionByAplicacionAndJuez(sMail, cveAplicacion);
                            if (bValidJudge)
                            {
                                if (Eval != null)
                                {
                                    evaluateApplicationBtn.Visible = false;
                                    modifiyEvaluationBtn.Visible = true;
                                   // aplicationEvaluationNumber.Text = Eval.Calificacion.ToString();
                                }
                                else
                                {
                                    evaluateApplicationBtn.Visible = true;
                                    modifiyEvaluationBtn.Visible = false;
                                }

                                CrearFormulario(sCategoriaID, premio, categoria);
                                Panel final = new Panel();
                                LiteralControl finalText = new LiteralControl("<h3>Calificacion final: </h3><div style='display:inline-flex'><input type='number' step='any' id='final' name='final' style='text-align:center;font-size:-webkit-xxx-large;width:130px;' readonly /><h3>%</h3></div>");

                                final.Controls.Add(finalText);

                                PanelFinal.Controls.Add(final);
                                
                                return;
                            }
                        }
                    }
                }
                Response.Redirect("inicioJuez.aspx", false);
            }
        }
       
        private void LoadFile()
        {
            var Aplicacion = AplicacionService.GetAplicacionById(cveAplicacion);
            var Candidato = InformacionPersonalCandidatoService.GetCandidatoById(Aplicacion.cveCandidato);

            PanelArchivo.Controls.Add(new LiteralControl("<div class='row text-center'>"+
                "<div class='col-sm-6'>"+
                    "<h5>"+
                        "<strong> Candidato: </strong> <br/><br/>" + Candidato.Nombre + " " + Candidato.Apellido +
                    "</h5>"+
                "</div>"+
                    "<div class='col-sm-6'>"+
                    "<h5> <strong> Archivo proporcionado: </strong> </h5>"));

            // Archivo a descargar
            LinkButton lbDocumento = new LinkButton();
            lbDocumento.Text = Aplicacion.NombreArchivo;
            lbDocumento.Style.Add("font-size", "16pt");
            lbDocumento.Style.Add("color", "#00acc1");
            lbDocumento.Style.Add("text-decoration", "underline");
            lbDocumento.Style.Add("margin", "1.5em 0");
            lbDocumento.Command += new CommandEventHandler(DownloadFile);
            lbDocumento.CommandArgument = cveAplicacion;
            PanelArchivo.Controls.Add(lbDocumento);

            PanelArchivo.Controls.Add(new LiteralControl("<br>"));

            LinkButton cartaDocumento = new LinkButton();
            cartaDocumento.Text = Aplicacion.ArchivoCarta;
            cartaDocumento.Style.Add("font-size", "16pt");
            cartaDocumento.Style.Add("color", "#00acc1");
            cartaDocumento.Style.Add("text-decoration", "underline");
            cartaDocumento.Command += new CommandEventHandler(DownloadFile);
            cartaDocumento.CommandArgument = cveAplicacion;
            PanelArchivo.Controls.Add(cartaDocumento);


            PanelArchivo.Controls.Add(new LiteralControl("</div> </div>"));
        }

        private void LoadMessages()
        {
            // Mensaje 0
            MessagesList.Add(Tuple.Create("Error", "El servidor encontró un error al procesar la solicitud."));
            // Mensaje 1
            MessagesList.Add(Tuple.Create("Aviso", "Evaluación guardada con éxito."));
            // Mensaje 2
            MessagesList.Add(Tuple.Create("Error", "Evaluación no encontrada."));
        }

        private void CrearFormulario(String sCategoriaID, PI_BA_Premio premio, PI_BA_Categoria categoria)
        {
            litTituloPremio.Text = "Premio " + premio.Nombre;
            litTituloCategoria.Text = "Categoría: " + categoria.Nombre;
            Panel panelCollapseBodyQuestions = new Panel();
            panelCollapseBodyQuestions.CssClass = "row question-form";
            panelCollapseBodyQuestions.Style.Add("margin-left", "10px");
            panelCollapseBodyQuestions.Style.Add("margin-right", "10px");

            // obtener lista de preguntas y respuestas para la aplicacion
            var subcategorias = ConvocatoriaService.GetSubcategoria(categoria.cveCategoria);
            var preguntas = AplicacionService.GetFormularioByCategoria(categoria.cveCategoria);
            string sMail = Session[StringValues.CorreoSesion].ToString();
            var Eval = EvaluacionService.GetEvaluacionByAplicacionAndJuez(sMail, cveAplicacion);


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
                                if(p.JuezVisible.Equals("1"))
                                {
                                    var respuesta = AplicacionService.GetRespuestaByPreguntaAndAplicacionAndNumero(p.cvePregunta, cveAplicacion, 1);

                                    LiteralControl pregunta = new LiteralControl(p.Texto + "<input type='text' name='" + sub.cveSubcategoria + "' id=" + p.cvePregunta + " value='" + respuesta.Valor + "' class='form-control' style='width:100%;' readonly><br>");
                                    panel.Controls.Add(pregunta);
                                }
                                
                            }
                            panelCollapseBodyQuestions.Controls.Add(panel);
                        }

                        string evalRes = "";
                     if(Eval != null)
                        {
                            var res = EvaluacionService.GetEvaluacionesByAplicacionAndJuezAndSubcategoria(cveAplicacion, sMail, sub.cveSubcategoria);
                            evalRes = "<span style ='display:flex;'><strong style='align-self:flex-end;'> Calificación " + sub.Nombre + " (" + sub.Porcentaje + "%)</strong><input type='number' min='1' max='10' class='addCalif' data-porcentaje='" + sub.Porcentaje + "' name='calificacion-" + sub.cveSubcategoria + "' value='"+res[0].Calificacion+"' class='form-control' style='width:10%;margin-left:15px;'></span>";



                        }
                        else
                        {
                            evalRes = "<span style ='display:flex;'><strong style='align-self:flex-end;'> Calificación " + sub.Nombre + " (" + sub.Porcentaje + "%)</strong><input type='number' min='1' max='10' class='addCalif' data-porcentaje='" + sub.Porcentaje + "' name='calificacion-" + sub.cveSubcategoria + "' value='' class='form-control' style='width:10%;margin-left:15px;'></span>";

                        }
                        LiteralControl calificacion = new LiteralControl(
                          "<div style=\"width:100%; display: inline-block;\">" +
                                                "<div class=\"panel panel-primary\">" +
                                                    "<div class=\"panel-heading\">" +
                                                        "<div class=\"row\" style=\"text-align: center;\">" +
                                                            "<div class=\"huge\">De acuerdo con los criterios que aparecen en la parte superior de la tabla, califique la labor de cada candidato usando una escala del 1 al 10, en la que 10 significa un desempeño excelente en el criterio en cuestión.</div>" +
                                                        "</div>" +
                                                    "</div>" +
                                                        "<div class=\"panel-footer\" style=\"background-color: white;\">" +
                                                         evalRes +
                                                            "<div class=\"clearfix\"></div>" +
                                                        "</div>" +
                                                    "</a>" +
                                                "</div>" +
                                            "</div>"
                      );

                        panelCollapseBodyQuestions.Controls.Add(calificacion);

                    }
                    else
                    {
                        string table = "<table id='table-" + sub.cveSubcategoria + "' style='width:100%;' class='table table-striped'><thead><tr>";
                        string ansRows = "<tr>";
                        string questionIDs = "";
                        int i = 0;
                        int k = 0;
                        var respuestas = AplicacionService.GetRespuestasBySubcategoriaAndAplicacion(sub.cveSubcategoria, cveAplicacion);
                        while (k < respuestas.Count)
                        {
                            foreach (var p in preguntas)
                            {
                                if (p.cveSubcategoria == sub.cveSubcategoria)
                                {
                                    var respuesta = AplicacionService.GetRespuestaByPreguntaAndAplicacionAndNumero(p.cvePregunta, cveAplicacion, i + 1);
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

                        panelCollapseBodyQuestions.Controls.Add(panel);

                        string evalRes = "";
                        if (Eval != null)
                        {
                            var res = EvaluacionService.GetEvaluacionesByAplicacionAndJuezAndSubcategoria(cveAplicacion, sMail, sub.cveSubcategoria);
                            evalRes = "<span style ='display:flex;'><strong style='align-self:flex-end;'> Calificación " + sub.Nombre + " (" + sub.Porcentaje + "%)</strong><input type='number' min='1' max='10' class='addCalif' data-porcentaje='" + sub.Porcentaje + "' name='calificacion-" + sub.cveSubcategoria + "' value='" + res[0].Calificacion + "' class='form-control' style='width:10%;margin-left:15px;'></span>";



                        }
                        else
                        {
                            evalRes = "<span style ='display:flex;'><strong style='align-self:flex-end;'> Calificación " + sub.Nombre + " (" + sub.Porcentaje + "%)</strong><input type='number' min='1' max='10' class='addCalif' data-porcentaje='" + sub.Porcentaje + "' name='calificacion-" + sub.cveSubcategoria + "' value='' class='form-control' style='width:10%;margin-left:15px;'></span>";

                        }
                        LiteralControl calificacion = new LiteralControl(
                        "<div style=\"width:100%; display: inline-block;\">" +
                                              "<div class=\"panel panel-primary\">" +
                                                  "<div class=\"panel-heading\">" +
                                                      "<div class=\"row\" style=\"text-align: center;\">" +
                                                          "<div class=\"huge\">De acuerdo con los criterios que aparecen en la parte superior de la tabla, califique la labor de cada candidato usando una escala del 1 al 10, en la que 10 significa un desempeño excelente en el criterio en cuestión.</div>" +
                                                      "</div>" +
                                                  "</div>" +
                                                      "<div class=\"panel-footer\" style=\"background-color: white;\">" +
                                                      evalRes +
                                                      "<div class=\"clearfix\"></div>" +
                                                      "</div>" +
                                                  "</a>" +
                                              "</div>" +
                                          "</div>"
                    );

                        panelCollapseBodyQuestions.Controls.Add(calificacion);

                    }
                }
            }
            PanelFormulario.Controls.Add(panelCollapseBodyQuestions);
        }

        private bool CheckValidCategory(List<PI_BA_Categoria> ltCategories, string sCategoryID)
        {
            foreach (var category in ltCategories)
            {
                if (category.cveCategoria.Equals(sCategoryID))
                {
                    return true;
                }
            }
            return false;
        }

        protected void EvaluarAplicacion(object sender, EventArgs e)
        {

            try
            {
                String cveJuez = InformacionPersonalJuezService.GetJuezByCorreo(Session[StringValues.CorreoSesion].ToString()).cveJuez;
                // Verificar que no exista ya una evaluación
                if (EvaluacionService.GetEvaluacionByAplicacionAndJuez(cveAplicacion, cveJuez) == null)
                {
                    // obtener lista de preguntas y respuestas para la aplicacion
                    String cveCategoria = AplicacionService.GetCveCategoriaByAplicacion(cveAplicacion);

                    var subcategorias = ConvocatoriaService.GetSubcategoria(cveCategoria);

                    string subID = "";
                    if (subcategorias != null && subcategorias.Count > 0)
                    {
                        foreach (var sub in subcategorias)
                        {
                            string[] values = Request.Form.GetValues("calificacion-" + sub.cveSubcategoria);
                            if (values != null)
                            {
                                PI_BA_Evaluacion ev = new PI_BA_Evaluacion();
                                ev.cveEvaluacion = Guid.NewGuid().ToString();
                                ev.cveAplicacion = cveAplicacion;
                                ev.cveJuez = cveJuez;
                                ev.Calificacion = float.Parse(values[0]);
                                ev.cveSubcategoria = sub.cveSubcategoria;
                                subID = sub.cveSubcategoria;
                                ev.esFinal = "no";
                                EvaluacionService.CrearEvaluacion(ev);
                                cveMensaje = 1;
                            }
                        }
                        string[] valueFinal = Request.Form.GetValues("final");
                        if (valueFinal != null)
                        {
                            PI_BA_Evaluacion ev = new PI_BA_Evaluacion();
                            ev.cveEvaluacion = Guid.NewGuid().ToString();
                            ev.cveAplicacion = cveAplicacion;
                            ev.cveJuez = cveJuez;
                            ev.Calificacion = float.Parse(valueFinal[0]);
                            ev.cveSubcategoria = subID;
                            ev.esFinal = "yes";
                            EvaluacionService.CrearEvaluacion(ev);
                            cveMensaje = 1;
                        }
                    }
                    
                }
                // Si ya existe
                else
                {
                    ModificarAplicacion(sender, e);
                }
            }
            catch (Exception Ex)
            {
                Console.WriteLine("Catched Exception: " + Ex.Message + Environment.NewLine);
                cveMensaje = 0;
            }
            Response.Redirect("EvaluaAplicacion.aspx" + "?m=" + cveMensaje + "&a=" + cveAplicacion, false);
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
                MasterPage.ShowMessage("Error", "El servidor no encontró el archivo.");
            }
        }

        protected void ModificarAplicacion(object sender, EventArgs e)
        {
            try
            {
                var juez = InformacionPersonalJuezService.GetJuezByCorreo(Session[StringValues.CorreoSesion].ToString());
                var eval = EvaluacionService.GetEvaluacionByAplicacionAndJuez(juez.Correo, cveAplicacion);
                if(eval != null)
                {
                    try
                    {
                        String cveCategoria = AplicacionService.GetCveCategoriaByAplicacion(cveAplicacion);

                        var subcategorias = ConvocatoriaService.GetSubcategoria(cveCategoria);
                        float evaluacion = 0;
                        if (subcategorias != null && subcategorias.Count > 0)
                        {
                            foreach (var sub in subcategorias)
                            {
                                var res = EvaluacionService.GetEvaluacionesByAplicacionAndJuezAndSubcategoria(cveAplicacion, juez.Correo, sub.cveSubcategoria);

                                string[] values = Request.Form.GetValues("calificacion-" + sub.cveSubcategoria);
                                if (values != null)
                                {
                                    evaluacion = float.Parse(values[0]);
                                    EvaluacionService.ActualizaEvaluacion(res[0].cveEvaluacion, evaluacion);

                                }

                            }

                            string[] valueFinal = Request.Form.GetValues("final");
                            if (valueFinal != null)
                            {
                                evaluacion = float.Parse(valueFinal[0]);
                                EvaluacionService.ActualizaEvaluacion(eval.cveEvaluacion, evaluacion);

                            }


                        }

                        cveMensaje = 1;
                    }
                    catch (Exception Ex2)
                    {
                        Console.WriteLine("Catched Exception: " + Ex2.Message + Environment.NewLine);
                        cveMensaje = 2;
                    }
                }
            }
            catch (Exception Ex)
            {
                Console.WriteLine("Catched Exception: " + Ex.Message + Environment.NewLine);
                cveMensaje = 0;
            }
            Response.Redirect("EvaluaAplicacion.aspx" + "?m=" + cveMensaje + "&a=" + cveAplicacion, false);
        }

        protected void CloseBtn_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(GetType(), "ReloadParent", "if (window.opener && !window.opener.closed) { window.opener.location.reload(true); }", true);
            ClientScript.RegisterStartupScript(GetType(), "ClosePage", "window.close();", true);
        }
    }
}