﻿<%@ Page Title="Formulario" Language="C#" MasterPageFile="~/MP-Global.Master" AutoEventWireup="true" CodeBehind="Formulario.aspx.cs" Inherits="PremiosInstitucionales.WebForms.Formulario" EnableEventValidation="false" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

    <div class="container fadeView">
        <div class="row">
            <div class="col-lg-12 text-center">
                <h3 class="section-heading">
                    <asp:Literal ID="litTituloPremio" runat="server" /></h3>
                <h4>
                    <asp:Literal ID="litTituloCategoria" runat="server" /></h4>
                <hr class="shorthr" />
            </div>
        </div>
        <div class="text-center">
            <h5 runat="server" id="alreadySubmittedLabel" visible="false">Ya se ha realizado una aplicación para esta categoría. Para conocer el estatus, por favor dirigirse a <a href="AplicacionesCandidato.aspx">mis aplicaciones vigentes </a></h5>
        </div>
            <asp:Panel runat="server" ID="PanelFormulario" class="row question-form">
            </asp:Panel>

            <div class="btn-group-right" id="btnManager" runat="server">
                <a href="InicioCandidato.aspx">
                    <button type="button" class="btn btn-default">Cancelar</button>
                </a>
                <button type="button" class="btn btn-primary" onclick="sendFormAux()">Enviar</button>
                <asp:Button Style="display: none;" ID="EnviarBtn" runat="server" OnClick="EnviarAplicacion" Text="Enviar aplicación" />
            </div>
    </div>
</asp:Content>
