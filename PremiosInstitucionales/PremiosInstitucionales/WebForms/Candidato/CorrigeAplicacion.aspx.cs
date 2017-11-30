using PremiosInstitucionales.DBServices.Aplicacion;
using PremiosInstitucionales.DBServices.Convocatoria;
using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using PremiosInstitucionales.Entities.Models;
using PremiosInstitucionales.Values;
using System.IO;
using System.Web;
using System.Collections.Generic;

namespace PremiosInstitucionales.WebForms
{
    public partial class CorrigeAplicacion : System.Web.UI.Page
    {
        MP_Global MasterPage = new MP_Global();
        private int iMaxCharacters = NumericValues.iMaxCharactersPerAnswer;
        private string sCharactersRemainingMessage = StringValues.sCharactersRemaining;
        protected void Page_Load(object sender, EventArgs e)
        {
            // Verificar si ya expiro la sesion
            if (Session.Contents.Count == 0)
            {
                Response.Redirect("~/WebForms/Error/Error401.aspx", false);
            }

            MasterPage = (MP_Global)Page.Master;
            if (!IsPostBack)
            {
                // revisar la primera vez que se carga la pagina que se haya iniciado sesion con cuenta de candidato
                if (Session[StringValues.RolSesion] != null)
                {
                    if (Session[StringValues.RolSesion].ToString() != StringValues.RolCandidato)
                        // si no es candidato, redireccionar a login
                        Response.Redirect("~/WebForms/Login.aspx", false);
                }
                else
                {
                    Response.Redirect("~/WebForms/Login.aspx", false);
                }
                // confirmar que la aplicacion haya sido rechazada
                String idApp = Request.QueryString["aplicacion"];

                String sCategoriaID = AplicacionService.GetCveCategoriaByAplicacion(idApp);

                if (sCategoriaID != null)
                {
                    var premio = ConvocatoriaService.GetPremioByCategoria(sCategoriaID);
                    var categoria = ConvocatoriaService.GetCategoriaById(sCategoriaID);

                    if (premio != null && categoria != null)
                    {
                        if (AplicacionService.GetEsRechazadoByAplicacion(idApp))
                        {
                            CrearFormulario(sCategoriaID, premio, categoria);
                            return;
                        }
                    }
                }
                Response.Redirect("inicioCandidato.aspx", false);
            }
            
        }

        private void CrearFormulario(String sCategoriaID, PI_BA_Premio premio, PI_BA_Categoria categoria)
        {
            // vaciar coleccion de preguntas para evitar IDs repetidos
            PanelFormulario.Controls.Clear();

            litTituloPremio.Text = "Premio " + premio.Nombre;
            litTituloCategoria.Text = "Categoría: " + categoria.Nombre;

            string idApp = Request.QueryString["aplicacion"];
            string FileName = AplicacionService.GetAplicacionById(idApp).NombreArchivo;
            string CartaFileName = AplicacionService.GetAplicacionById(idApp).ArchivoCarta;

            if (FileName != null)
            {
                ClientScript.RegisterStartupScript(GetType(), "hwa", "writeName('"+FileName+"');", true);
            }

            if (CartaFileName != null)
            {
                ClientScript.RegisterStartupScript(GetType(), "name", "writeNameCarta('" + CartaFileName + "');", true);
            }
            Panel panelCollapseBodyQuestions = new Panel();
            panelCollapseBodyQuestions.CssClass = "row question-form";
            panelCollapseBodyQuestions.Style.Add("margin-left", "10px");
            panelCollapseBodyQuestions.Style.Add("margin-right", "10px");

            // Mostrar formulario
            var subcategorias = ConvocatoriaService.GetSubcategoria(categoria.cveCategoria);
            var preguntas = AplicacionService.GetFormularioByCategoria(categoria.cveCategoria);
            uploadFile.Visible = true;


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
                                var respuesta = AplicacionService.GetRespuestaByPreguntaAndAplicacionAndNumero(p.cvePregunta, idApp, 1);

                                LiteralControl pregunta = new LiteralControl(p.Texto + "<input type='text' name='" + sub.cveSubcategoria + "' id=" + p.cvePregunta + " value='" + respuesta.Valor + "' class='form-control' style='width:100%;'><br>");
                                panel.Controls.Add(pregunta);
                            }
                            panelCollapseBodyQuestions.Controls.Add(panel);
                        }
                    }
                    else
                    {
                        string table = "<table id='table-" + sub.cveSubcategoria + "' style='width:100%;' class='table table-striped'><thead><tr>";
                        string ansRows = "<tr>";
                        string questionIDs = "";
                        int i = 0;
                        int k = 0;
                        var respuestas = AplicacionService.GetRespuestasBySubcategoriaAndAplicacion(sub.cveSubcategoria,idApp);
                        while (k < respuestas.Count)
                        {
                            foreach (var p in preguntas)
                            {
                                if (p.cveSubcategoria == sub.cveSubcategoria)
                                {
                                    var respuesta = AplicacionService.GetRespuestaByPreguntaAndAplicacionAndNumero(p.cvePregunta, idApp, i + 1);
                                    if (i == 0)
                                    {
                                        table += "<th>" + p.Texto + "</th>";
                                        questionIDs += p.cvePregunta + ",";

                                    }
                                    ansRows += "<td><textarea name='" + sub.cveSubcategoria + "' id='row"+i+"-" + p.cvePregunta + "' cols='20' rows='4' value=''>" + respuesta.Valor + "</textarea></td>";
                                    
                                    k++;
                                }
                            }
                            i++;
                            ansRows += "</tr>";
                        }

                        table += "</tr></thead>";
                        table += "<tbody>" + ansRows + "</tbody></table>";


                        string add = "<a data-toggle='modal' id='addRow-" + sub.cveSubcategoria + "' data-sub='" + sub.cveSubcategoria + "' class='addRow' style='cursor: pointer;'><img src = '/Resources/svg/plus.svg' class='avatar img-circle' alt='avatar' style='width: 50px;'/></a><a data-toggle='modal' id='remove-" + sub.cveSubcategoria + "' data-sub='" + sub.cveSubcategoria + "' class='removeRow' style='cursor: pointer;'><img src = '/Resources/svg/minus.svg' class='avatar img-circle' alt='avatar' style='width: 55px; margin-left:15px;'/></a><br><br>";
                        LiteralControl addControl = new LiteralControl(add);



                        LiteralControl tabla = new LiteralControl(table);
                        LiteralControl saveRowControl = new LiteralControl("<div id='saveRow-" + sub.cveSubcategoria + "' style='display:none;' data-rows='" + questionIDs + "'></div>");

                        panel.Controls.Add(tabla);
                        panel.Controls.Add(addControl);
                        panel.Controls.Add(saveRowControl);

                        panelCollapseBodyQuestions.Controls.Add(panel);

                    }
                }
            }
            PanelFormulario.Controls.Add(panelCollapseBodyQuestions);

        }

        protected void EnviarBttn_Click(object sender, EventArgs e)
        {
            // actualizar archivo
            string sArchivo = UploadFile();
            String NombreCarta = UploadFileCarta();

            if (sArchivo != null && NombreCarta != null)
            {
                if (sArchivo != "Error" && NombreCarta != "Error")
                {
                    AplicacionService.UpdateAplicacionArchivo(Request.QueryString["aplicacion"], sArchivo, NombreCarta);
                }
                else
                {
                    return;
                }
            }
            
            var aplicacionID = Request.QueryString["aplicacion"];
            var categoriaID = AplicacionService.GetCveCategoriaByAplicacion(aplicacionID);
            var subcategorias = ConvocatoriaService.GetSubcategoria(categoriaID);
            var preguntas = AplicacionService.GetFormularioByCategoria(categoriaID);
            if (subcategorias != null && subcategorias.Count > 0)
            {
                foreach (var sub in subcategorias)
                {
                    string[] values = Request.Form.GetValues(sub.cveSubcategoria);
                    int x = 0;
                    int numPreg = 1;

                    while (x < values.Length)
                    {
                        foreach (var p in preguntas)
                        {
                            if (p.cveSubcategoria == sub.cveSubcategoria)
                            {
                                var resp = AplicacionService.GetRespuestaByPreguntaAndAplicacionAndNumero(p.cvePregunta, aplicacionID, numPreg);
                                if (resp != null)
                                {
                                    // guardar cambios en la respuesta
                                    AplicacionService.SaveRespuestaModificada(aplicacionID, p.cvePregunta, values[x], numPreg);

                                }
                                else
                                {
                                    PI_BA_Respuesta respuesta = new PI_BA_Respuesta();
                                    respuesta.cveRespuesta = Guid.NewGuid().ToString();
                                    respuesta.cvePregunta = p.cvePregunta;
                                    respuesta.cveAplicacion = aplicacionID;
                                    respuesta.Valor = values[x];
                                    respuesta.Numero = numPreg;
                                    respuesta.cveSubcategoria = p.cveSubcategoria;
                                    AplicacionService.AgregarRespuesta(respuesta);
                                }
                                x++;
                            }

                            if (x == values.Length)
                            {
                                break;
                            }
                        }
                        numPreg++;
                    }
                }
            }

           
            // cambiar status de la aplicacion a Modificado
            AplicacionService.SetAplicacionModificada(aplicacionID);

            // redireccionar a inicio
            Response.Redirect("AplicacionesCandidato.aspx?r=true", false);

            /*
            // modificar el texto de las respuestas
            // obtener string con controles en Request
            string[] ctrls = Request.Form.ToString().Split('&');
            // obtener la lista de preguntas para la categoria y obtener los controles en base a su ID
            var preguntas = AplicacionService.GetFormularioByCategoria(AplicacionService.GetCveCategoriaByAplicacion(Request.QueryString["aplicacion"]));
            foreach (var pregunta in preguntas)
            {
                int iIndex = GetIndexFromArray(ctrls, "textbox_" + pregunta.cvePregunta);

                if (iIndex > -1)
                {
                    // obtener el valor del control
                    string ctrlValue = ctrls[iIndex].Split('=')[1];
                    //Decode the Value
                    ctrlValue = Server.UrlDecode(ctrlValue);
                    // guardar cambios en la respuesta
                    AplicacionService.SaveRespuestaModificada(Request.QueryString["aplicacion"], pregunta.cvePregunta, ctrlValue);
                }
            }

            // cambiar status de la aplicacion a Modificado
            AplicacionService.SetAplicacionModificada(Request.QueryString["aplicacion"]);

            // redireccionar a inicio
            Response.Redirect("AplicacionesCandidato.aspx?r=true", false);*/
        }

        private int GetIndexFromArray(String[] arr, String value)
        {
            for (int i = 0; i < arr.Length; i++)
            {
                string sRow = arr[i];
                if (sRow.Contains(value))
                {
                    return i;
                }
            }
            return -1;
        }

        protected string UploadFile()
        {
            HttpPostedFile file = Request.Files["file"];

            //check file was submitted
            if (file != null && file.ContentLength > 0)
            {
                string fname = Path.GetFileName(file.FileName);

                // Get string image format (png, jpg, etc)
                var startIndex = fname.LastIndexOf(".");
                var endIndex = fname.Length - startIndex;
                string sFormat = fname.Substring(startIndex, endIndex).ToLower();
                string sName = fname.Substring(0, fname.Length - sFormat.Length);
                string sNombreArchivo = sName + new Random().Next(10000, 99999) + sFormat;

                // Formatos Validos
                List<String> supportedFormats = new List<String>()
                {
                    ".png",
                    ".jpg",
                    ".jpeg",
                    ".bmp",
                    ".txt",
                    ".doc",
                    ".docx",
                    ".pdf",
                    ".xlsx",
                    ".xls",
                    ".csv",
                    ".ppt",
                    ".pptx"
                };

                if (!supportedFormats.Contains(sFormat))
                {
                    MasterPage.ShowMessage("Error", "El archivo proporcionado debe ser un archivo de texto, una hoja de cálculo o un imagen.");
                    return "Error";
                }

                // Delete previous image...
                string idApp = Request.QueryString["aplicacion"];
                string FileName = AplicacionService.GetAplicacionById(idApp).NombreArchivo;
                if (FileName != null && FileName.Length > 0)
                {
                    File.Delete(Server.MapPath("~/UsersAppsFiles/") + FileName);
                }

                // Upload image to server
                file.SaveAs(Server.MapPath(Path.Combine("~/UsersAppsFiles/", sNombreArchivo)));
                return sNombreArchivo;
            }

            return null;
        }

        protected string UploadFileCarta()
        {
            HttpPostedFile file = Request.Files["file2"];

            //check file was submitted
            if (file != null && file.ContentLength > 0)
            {
                string fname = Path.GetFileName(file.FileName);

                // Get string image format (png, jpg, etc)
                var startIndex = fname.LastIndexOf(".");
                var endIndex = fname.Length - startIndex;
                string sFormat = fname.Substring(startIndex, endIndex).ToLower();
                string sName = fname.Substring(0, fname.Length - sFormat.Length);
                string sNombreArchivo = sName + new Random().Next(10000, 99999) + sFormat;

                // Formatos Validos
                List<String> supportedFormats = new List<String>()
                {
                    ".png",
                    ".jpg",
                    ".jpeg",
                    ".bmp",
                    ".txt",
                    ".doc",
                    ".docx",
                    ".pdf",
                    ".xlsx",
                    ".xls",
                    ".csv",
                    ".ppt",
                    ".pptx"
                };

                if (!supportedFormats.Contains(sFormat))
                {
                    MasterPage.ShowMessage("Error", "El archivo proporcionado debe ser un archivo de texto, una hoja de cálculo o un imagen.");
                    return "Error";
                }

                // Upload image to server
                file.SaveAs(Server.MapPath(Path.Combine("~/UsersAppsFiles/", sNombreArchivo)));
                return sNombreArchivo;
            }

            return null;
        }
    }
}