using PremiosInstitucionales.DBServices.InformacionPersonalJuez;
using PremiosInstitucionales.DBServices.Aplicacion;
using PremiosInstitucionales.DBServices.Convocatoria;
using PremiosInstitucionales.Entities.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using PremiosInstitucionales.Values;

namespace PremiosInstitucionales.WebForms
{
    public partial class AdministraFormulario : System.Web.UI.Page
    {
        int numPregunta = 0;
        String idCategoria;
        String formaID;
        TextBox tbCategoria;
        MP_Global MasterPage = new MP_Global();

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
                // revisar la primera vez que se carga la pagina que se haya iniciado sesion con cuenta de admin
                if (Session[StringValues.RolSesion] != null)
                {
                    if (Session[StringValues.RolSesion].ToString() != StringValues.RolAdmin)
                    {
                        // si no es admin, redireccionar a inicio general
                        Response.Redirect("~/WebForms/Login.aspx", false);
                    }
                }
                else
                {
                    Response.Redirect("~/WebForms/Login.aspx", false);
                }
            }

            switch (Request.QueryString["s"])
            {
                case "success":
                    MasterPage.ShowMessage("Aviso", "Los cambios fueron realizados con éxito.");
                    break;
                case "failed":
                    MasterPage.ShowMessage("Error", "El servidor encontró un error al procesar la solicitud.");
                    break;
            }

            // Obtener Ids
            formaID = Request.QueryString["p"];
            var forma = ConvocatoriaService.GetFormaByID(formaID);
            idCategoria = forma.cveCategoria;
            String nombrePremio = AplicacionService.GetPremioByClaveCategoria(idCategoria).Nombre;
            String nombreCategoria = AplicacionService.GetCategoriaByClaveCategoria(idCategoria).Nombre;

            // Nombre de Titulos
            nombrePremioCategoria.Controls.Add(new LiteralControl(
                "<h3> <strong> Premio: </strong>" + nombrePremio + "</h3>" +
                "<h4 style=\"display: inline;\"> <strong> Categoria: </strong> </h4>"
            ));

            tbCategoria = new TextBox();
            tbCategoria.CssClass = "form-control";
            tbCategoria.Style.Add("display", "inline-block");
            tbCategoria.Style.Add("font-size", "1.75em");
            tbCategoria.Style.Add("width", "570px");
            tbCategoria.Attributes.Add("type", "text");
            tbCategoria.Text = nombreCategoria;
            nombrePremioCategoria.Controls.Add(tbCategoria);

            LoadJudgeTable();

            LoadSubcategorias();

            if (!IsPostBack)
            {
                if (idCategoria != null)
                {
                    var categoria = ConvocatoriaService.GetCategoriaById(idCategoria);
                    if (categoria != null)
                    {
                        idCategoria = categoria.cveCategoria;
                        var convocatoria = ConvocatoriaService.GetConvocatoriaById(categoria.cveConvocatoria);
                        if (convocatoria != null)
                        {
                            var premio = ConvocatoriaService.GetPremioById(convocatoria.cvePremio);

                            if (premio != null)
                            {
                                LoadInfo(formaID, premio, convocatoria,categoria,forma);
                                return;
                            }
                        }
                    }
                }
                Response.Redirect("inicioAdmin.aspx", false);
            }
        }


        protected void LoadInfo2(string formaID, PI_BA_Premio premio, PI_BA_Convocatoria convocatoria, PI_BA_Categoria categoria, PI_BA_Forma forma)
        {
            var listaSubcategorias = AplicacionService.GetSubcategoriasByCategoria(categoria.cveCategoria);

            if (listaSubcategorias != null)
            {

                foreach (var subcategoria in listaSubcategorias)
                {

                    /*Prueba.Controls.Add(new LiteralControl(
                        "<div class='container'>"
                        + "<h4 class='section-heading'>"+ subcategoria.nombre +"</h4>"
                        + "<table id='listaPreguntas' class='highlight' width=100%>"
                        + "<thead>"
                        + "<tr>"
                        + "<th>"
                        + "<a data-toggle='modal' data-target='#modalCrearConvocatoria' style='cursor: pointer;' >"
                        + "<img src = '/Resources/svg/plus.svg' class='avatar img-circle' alt='avatar' style='width: 28px; margin-left:-7px; '/>"
                        + "</a>"
                        + "</th>"
                        + "<th> Pregunta </th>"
                        + "<th> Orden </th>"
                        + "<th> Ciclo? </th>"
                        + "</tr>"
                        + "</thead>"
                        + "</table>"
                        + "</div>"
                        + "<br><br><br>"
                        ));
                        */
                        
                    /*Prueba.Controls.Add(new LiteralControl(
                        "<div class='container'>"
                        + "<h5>" + subcategoria.nombre + "</h5>"
                        + "<hr class='shorthr'></hr>"
                        + "<a data-toggle='modal' data-target='#modalCrearPregunta' data-subcategoria='"+subcategoria.cveSubcategoria+"' style='cursor: pointer;' >"
                        + "<img src = '/Resources/svg/plus.svg' class='avatar img-circle' alt='avatar' style='width: 28px; margin-left:-7px; '/>"
                        + "</a>"
                        + "<div id='simpleList-"+subcategoria.cveCategoria+"' class='list-group' runat='server' ClientIDMode='Static'></div>"
                        + "</div>"
                        + "<br><br><br>"
                        ));*/

                    
                }
            }

        }

        protected void LoadInfo(string formaID, PI_BA_Premio premio, PI_BA_Convocatoria convocatoria, PI_BA_Categoria categoria, PI_BA_Forma forma) {
            var listaPreguntas = AplicacionService.GetFormularioByCategoria(categoria.cveCategoria);
            if (listaPreguntas != null)
            {
                string select = "";
                var subcategorias = ConvocatoriaService.GetSubcategoria(categoria.cveCategoria);

                foreach (var pregunta in listaPreguntas)
                {
                    Panel panel = new Panel();
                    panel.CssClass = "list-group-item";
                    TextBox input = new TextBox();
                    input.Text = pregunta.Texto;
                    input.CssClass = "pregunta form-control";
                    input.Attributes.Add("type", "text");
                    input.Attributes.Add("name", "mytext");
                    input.Attributes.Add("placeholder", "Pregunta");
                    input.Attributes.Add("id", pregunta.cvePregunta);

                    select = "<div style='display:flex;'><select name='options' id='options"+pregunta.cvePregunta+"'>";
                    select += "<option value='0'>-- Subcategoria --</option>";

                    foreach (var sub in subcategorias)
                    {
                        if(pregunta.cveSubcategoria == sub.cveSubcategoria)
                        {
                            select += "<option value='" + sub.cveSubcategoria + "' selected>" + sub.Nombre + "</option>";
                        }
                        else
                        {
                            select += "<option value='" + sub.cveSubcategoria + "'>" + sub.Nombre + "</option>";
                        }
                    }
                      
                    select += "</select>";
                    LiteralControl sel = new LiteralControl(select);
                    LiteralControl lit = new LiteralControl("<input class='pregunta form-control' type='text' name='mytext' placeholder='Pregunta' value='"+pregunta.Texto+"' style='margin-left:20px;'/></div>");
                    LiteralControl remove = new LiteralControl("<a href='#' class='remove'>Eliminar</a>");
                    panel.Controls.Add(sel);
                    panel.Controls.Add(lit);
                    panel.Controls.Add(remove);
                    simpleList.Controls.Add(panel);
                }

                select = "";
                select = "<select name='options' id='options'>";
                select += "<option value='0'>-- Subcategoria --</option>";

                foreach (var sub in subcategorias)
                {
                    
                     select += "<option value='" + sub.cveSubcategoria + "'>" + sub.Nombre + "</option>";
                    
                }

                select += "</select>";

               subcategoriasList.Controls.Add(new LiteralControl(
                       select
                        ));

            }
            else {
                Panel panel = new Panel();
                panel.CssClass = "list-group-item";
                TextBox input = new TextBox();
                input.CssClass = "pregunta form-control";
                input.Attributes.Add("type", "text");
                input.Attributes.Add("name", "mytext");
                input.Attributes.Add("placeholder", "Pregunta");
                input.Attributes.Add("id", "pregunta_" + numPregunta);
                LiteralControl remove = new LiteralControl("<a href='#' class='remove'>Eliminar</a>");
                panel.Controls.Add(input);
                panel.Controls.Add(remove);
                simpleList.Controls.Add(panel);

            }
            numPregunta++;
        }

        private void LoadSubcategorias()
        {
            formaID = Request.QueryString["p"];
            var forma = ConvocatoriaService.GetFormaByID(formaID);

            string categoriaID = forma.cveCategoria;
            var subcategorias = ConvocatoriaService.GetSubcategoria(categoriaID);
           // var subcategorias = AplicacionService.GetSubcategoriasByCategoria(categoriaID);

            if (subcategorias != null)
            {

                foreach (var sub in subcategorias)
                {
                    TableRow tr = new TableRow();

                    // name column
                    TableCell tdName = new TableCell();
                    tdName.Text = sub.Nombre;

                    // last name column
                    TableCell tdOrden = new TableCell();
                    int temp = (int)sub.Orden;
                    tdOrden.Text = temp + "";

                    TableCell tdAction = new TableCell();
                    tdAction.Controls.Add(new LiteralControl(
                       "<button>edit</button>"
                        ));

                    tr.Controls.Add(tdOrden);
                    tr.Controls.Add(tdName);
                    tr.Controls.Add(tdAction);
                    listaSubcategoriasTableBody.Controls.Add(tr);
                }

            }
        }

        private void LoadJudgeTable()
        {
            var jueces = InformacionPersonalJuezService.GetJueces();
            string sType = Request.QueryString["t"];
            if (jueces != null)
            {
                foreach (var juez in jueces)
                {
                    TableRow tr = new TableRow();

                    // profile image column
                    TableCell tdIP = new TableCell();
                    tdIP.CssClass = "dt-profile-pic";

                    Image ipImage = new Image();
                    if (juez.NombreImagen != null)
                    {
                        ipImage.ImageUrl = "/ProfilePictures/" + juez.NombreImagen;
                    }
                    else
                    {
                        ipImage.ImageUrl = "/Resources/img/default-pp.jpg";
                    }
                    ipImage.CssClass = "avatar img-circle";
                    ipImage.AlternateText = "avatar";
                    ipImage.Style.Add("width", "28px");
                    ipImage.Style.Add("height", "28px");

                    tdIP.Controls.Add(ipImage);

                    // name column
                    TableCell tdName = new TableCell();
                    tdName.Text = juez.Nombre;

                    // last name column
                    TableCell tdLastName = new TableCell();
                    tdLastName.Text = juez.Apellido;

                    TableCell tdEmail = new TableCell();

                    LiteralControl lHiddenValue = new LiteralControl("<span id=\"" + juez.cveJuez + "\">" + juez.Correo + "</span>");
                    tdEmail.Controls.Add(lHiddenValue);

                    tr.Controls.Add(tdIP);
                    tr.Controls.Add(tdName);
                    tr.Controls.Add(tdLastName);
                    tr.Controls.Add(tdEmail);
                    if (!AplicacionService.GetJuecesIdsCategoria(idCategoria).Contains(juez.cveJuez))
                    {
                        listaJuecesTableBody.Controls.Add(tr);
                    }
                    else
                    {
                        listaJuezTableAsignadosBody.Controls.Add(tr);
                    }
                }
            }
        }

        protected void Guarda_Formulario()
        {
            formaID = Request.QueryString["p"];
            var forma = ConvocatoriaService.GetFormaByID(formaID);

            string categoriaID = forma.cveCategoria;
            if (categoriaID != null)
            {
                var categoria = ConvocatoriaService.GetCategoriaById(categoriaID);
                if (categoria != null)
                {
                    var convocatoria = ConvocatoriaService.GetConvocatoriaById(categoria.cveConvocatoria);
                    if (convocatoria != null)
                    {
                        var premio = ConvocatoriaService.GetPremioById(convocatoria.cvePremio);

                        if (premio != null)
                        {
                            string[] values = Request.Form.GetValues("mytext");
                            string[] valuesSubcategoria = Request.Form.GetValues("options");

                            if (values != null)
                            {
                                var listaPreguntas = AplicacionService.GetFormularioByCategoria(categoria.cveCategoria);
                                var nuevasPreguntasCount = values.Length;
                                var preguntasCount = listaPreguntas.Count;
                                if (listaPreguntas != null)
                                {
                                    if (nuevasPreguntasCount == preguntasCount)
                                    {
                                        for (var i = 0; i < nuevasPreguntasCount; i++)
                                        {
                                            if (values[i] != "")
                                                AplicacionService.GuardaPregunta(listaPreguntas[i].cvePregunta, values[i], i, valuesSubcategoria[i]);
                                        }
                                    }
                                    else if (nuevasPreguntasCount < preguntasCount)
                                    {
                                        var dif = preguntasCount - nuevasPreguntasCount;
                                        for (var i = 0; i < (preguntasCount - dif); i++)
                                        {
                                            if (values[i] != "")
                                                AplicacionService.GuardaPregunta(listaPreguntas[i].cvePregunta, values[i], i, valuesSubcategoria[i]);
                                        }
                                        for (var i = nuevasPreguntasCount; i < preguntasCount; i++)
                                        {
                                            AplicacionService.RemovePregunta(formaID, listaPreguntas[i].cvePregunta);
                                        }
                                    }
                                    else
                                    {
                                        var dif = nuevasPreguntasCount - preguntasCount;
                                        for (var i = 0; i < preguntasCount; i++)
                                        {
                                            if (values[i] != "")
                                                AplicacionService.GuardaPregunta(listaPreguntas[i].cvePregunta, values[i], i, valuesSubcategoria[i]);
                                        }
                                        for (var i = preguntasCount; i < nuevasPreguntasCount; i++)
                                        {
                                            if (values[i] != "")
                                                AplicacionService.InsertaPregunta(formaID, values[i], i, valuesSubcategoria[i]);
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        protected void Guarda_Jueces()
        {
            List<String> idsJuecesAsigandos = hiddenControl.Value.Split(',').ToList();
            AplicacionService.RemoveJuezCategoria(idCategoria);

            if (idsJuecesAsigandos.Count > 0 && idsJuecesAsigandos != null)
            {
                AplicacionService.AsignarJuecesCategoria(idCategoria, idsJuecesAsigandos);
            }
        }

        protected void SaveChanges(object sender, EventArgs e)
        {
            try
            {
                formaID = Request.QueryString["p"];
                Guarda_Jueces();
                Guarda_Formulario();
                AplicacionService.CambiarNombreCategoria(idCategoria, tbCategoria.Text);
                Response.Redirect("AdministraFormulario.aspx?p=" + formaID + "&s=" + "success", false);
            }
            catch (Exception Ex)
            {
                Console.WriteLine("Catched Exception: " + Ex.Message + Environment.NewLine);
                Response.Redirect("AdministraFormulario.aspx?p=" + formaID + "&s=" + "failed", false);
            }
        }


        protected void GuardarPreguntaBttn_Click(object sender, EventArgs e)
        {

            formaID = Request.QueryString["p"];
            var forma = ConvocatoriaService.GetFormaByID(formaID);

            string categoriaID = forma.cveCategoria;

            if (TituloNuevaPreguntaTB.Text.Length > 0)
            {
                // Crear pregunta
                string id = Guid.NewGuid().ToString();
               // AplicacionService.GuardaPregunta(id, TituloNuevaPreguntaTB.Text,11, );

                Response.Redirect("AdministraFormulario.aspx?p=" + formaID + "&s=" + "success", false);
            }
        }

        protected void GuardarSubcategoriaBttn_Click(object sender, EventArgs e)
        {

            formaID = Request.QueryString["p"];
            var forma = ConvocatoriaService.GetFormaByID(formaID);

            string categoriaID = forma.cveCategoria;

            if (TituloNuevaSubcategoriaTB.Text.Length > 0)
            {
                // Crear subcategoria
                PI_BA_Subcategoria subcategoria = new PI_BA_Subcategoria();
                subcategoria.cveSubcategoria = Guid.NewGuid().ToString();
                subcategoria.Nombre = TituloNuevaSubcategoriaTB.Text;
                subcategoria.Orden = 1;
                subcategoria.cveCategoria = categoriaID;
                ConvocatoriaService.CreateSubcategoria(subcategoria);

                Response.Redirect("AdministraFormulario.aspx?p=" + formaID + "&s=" + "success", false);
            }

        }

        protected void BackBtn_Click(object sender, EventArgs e)
        {
            formaID = Request.QueryString["p"];
            var cveCategoria = ConvocatoriaService.GetFormaByID(formaID).cveCategoria;
            var cveConvocatoria = ConvocatoriaService.GetCategoriaById(cveCategoria).cveConvocatoria;

            Response.Redirect("AdministraCategorias.aspx?c=" + cveConvocatoria, false);
        }
    }
}