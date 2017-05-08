﻿using PremiosInstitucionales.DBServices.InformacionPersonalJuez;
using PremiosInstitucionales.DBServices.Aplicacion;
using PremiosInstitucionales.DBServices.Convocatoria;
using PremiosInstitucionales.Entities.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PremiosInstitucionales.WebForms
{
    public partial class AdministraFormulario : System.Web.UI.Page
    {
        int numPregunta = 0;
        String idCategoria;
        String formaID;
        protected void Page_Load(object sender, EventArgs e)
        {
            // obtener el premio usando el query string de su id
            formaID = Request.QueryString["p"];
            var forma = ConvocatoriaService.GetFormaByID(formaID);
            idCategoria = forma.cveCategoria;
            String nombrePremio = AplicacionService.GetPremioByClaveCategoria(idCategoria).Nombre;
            String nombreCategoria = AplicacionService.GetCategoriaByClaveCategoria(idCategoria).Nombre;

            nombrePremioCategoria.Controls.Add(new LiteralControl(
                "<h3> <strong> Premio: </strong>" + nombrePremio + "</h3>" +
                "<h4> <strong> Categoria: </strong>" + nombreCategoria + "</h4>"
            ));

            LoadJudgeTable();

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
                Response.Redirect("inicioAdmin.aspx");
            }
        }

        protected void LoadInfo(string formaID, PI_BA_Premio premio, PI_BA_Convocatoria convocatoria, PI_BA_Categoria categoria, PI_BA_Forma forma) {
            var listaPreguntas = AplicacionService.GetFormularioByCategoria(categoria.cveCategoria);
            if (listaPreguntas != null)
            {
                
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
                    LiteralControl lit = new LiteralControl("<input class='pregunta form-control' type='text' name='mytext' placeholder='Pregunta' value='"+pregunta.Texto+"'/>");
                    LiteralControl remove = new LiteralControl("<a href='#' class='remove'>Eliminar</a>");
                    panel.Controls.Add(lit);
                    panel.Controls.Add(remove);
                    simpleList.Controls.Add(panel);
                }
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

            //<div class="list-group-item"><input class="pregunta form-control" type="text" name="mytext[]" placeholder= "Pregunta"/><a href="#" class="remove">Eliminar</a></div>
            //Guid.NewGuid().ToString();
        }
        protected void Guarda_Formulario() {
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
                            if (values != null)
                            {
                                var listaPreguntas = AplicacionService.GetFormularioByCategoria(categoria.cveCategoria);
                                var nuevasPreguntasCount = values.Length;
                                var preguntasCount = listaPreguntas.Count;
                                if (listaPreguntas != null)
                                {
                                    if ( nuevasPreguntasCount == preguntasCount) {
                                        for (var i = 0; i < nuevasPreguntasCount; i++) {
                                            if (values[i] != "")
                                                AplicacionService.GuardaPregunta(listaPreguntas[i].cvePregunta, values[i],i);
                                        }
                                    }
                                    else if(nuevasPreguntasCount < preguntasCount)
                                    {
                                        var dif = preguntasCount - nuevasPreguntasCount;
                                        for (var i = 0; i < (preguntasCount-dif); i++)
                                        {
                                            if(values[i]!="")
                                                AplicacionService.GuardaPregunta(listaPreguntas[i].cvePregunta, values[i],i);
                                        }
                                        for( var i=nuevasPreguntasCount; i< preguntasCount; i++)
                                        {
                                            AplicacionService.RemovePregunta(formaID, listaPreguntas[i].cvePregunta);
                                        }
                                    }
                                    else{
                                        var dif = nuevasPreguntasCount - preguntasCount;
                                        for (var i = 0; i < preguntasCount; i++)
                                        {
                                            if (values[i] != "")
                                                AplicacionService.GuardaPregunta(listaPreguntas[i].cvePregunta, values[i], i);
                                        }
                                        for(var i=preguntasCount; i < nuevasPreguntasCount; i++)
                                        {
                                            if (values[i] != "")
                                                AplicacionService.InsertaPregunta(formaID, values[i], i);
                                        }
                                    }
                                }   
                            }
                        }
                    }
                }
            }
        }

        private void LoadJudgeTable()
        {
            //litUsuarios.Text = "Jueces";
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
                    //tdIP.Attributes.Add("onclick", "window.open('AdministraInformacionPersonal.aspx?id=" + juez.cveJuez + "&t=" + sType + "');");

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
                    //tdName.Attributes.Add("OnServerClick", "CheckJuez");

                    // last name column
                    TableCell tdLastName = new TableCell();
                    tdLastName.Text = juez.Apellido;
                    //tdLastName.Attributes.Add("onclick", "window.open('AdministraInformacionPersonal.aspx?id=" + juez.cveJuez + "&t=" + sType + "');");

                    TableCell tdEmail = new TableCell();
                    //tdEmail.Text = juez.Correo;

                    LiteralControl lHiddenValue = new LiteralControl("<span id=\"" + juez.cveJuez + "\">" + juez.Correo + "</span>");
                    tdEmail.Controls.Add(lHiddenValue);

                    //LiteralControl lcMailLink = new LiteralControl("<a href=\"mailto:" + juez.Correo + "?Subject=Premios%20Institucionales\" target=\"_top\"> " + juez.Correo + "</a>");
                    //tdEmail.Controls.Add(lcMailLink);

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
            formaID = Request.QueryString["p"];
            Guarda_Jueces();
            Guarda_Formulario();
            Response.Redirect("AdministraFormulario.aspx?p=" + formaID);
        }

    }
}