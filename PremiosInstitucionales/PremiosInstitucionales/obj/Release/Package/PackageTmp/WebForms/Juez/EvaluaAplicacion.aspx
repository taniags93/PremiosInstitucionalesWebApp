<%@ Page Title="" Language="C#" MasterPageFile="~/MP-Global.Master" AutoEventWireup="true" CodeBehind="EvaluaAplicacion.aspx.cs" Inherits="PremiosInstitucionales.WebForms.EvaluaAplicacion" EnableEventValidation="false" %>





<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

    
 <!-- CSS -->
    <link href='<%= ResolveUrl("~/Resources/css/stylec.css")%>' rel="stylesheet" type="text/css"/>


    <div class="container fadeView">

        <asp:Button type="button" class="closeBtn" runat="server" OnClick="CloseBtn_Click"/>

        <div class="row">
            <div class="col-lg-12 text-center">
                <h3 class="section-heading">
                    <asp:Literal ID="litTituloPremio" runat="server"/>
                </h3>
                <h4>
                    <asp:Literal ID="litTituloCategoria" runat="server"/>
                </h4>
                <hr class="shorthr"/>
            </div>
        </div>

            <asp:Panel runat="server" ID="PanelArchivo" class="row question-form">
            </asp:Panel>
        
            <asp:Panel runat="server" ID="PanelFormulario" class="row question-form">
            </asp:Panel>

            <div class="row" runat="server" id="PanelEvaluacion">
                <hr />
                <div class="col-md-8 col-md-offset-2">
                       
                        <div class="panel-body">
                            <div style="text-align: center">
                                <asp:Panel runat="server" ID="PanelFinal" class="row question-form">
                                </asp:Panel>
                            </div>
                            <div class="btn-group-mid">
                                <a href="InicioJuez.aspx" class="no-underline">
                                    <button type="button" class="btn btn-default">Cancelar</button>
                                </a>
                                <asp:Button ID="evaluateApplicationBtn" runat="server" OnClick="EvaluarAplicacion" Text="Enviar" class="btn btn-primary" />
                                <asp:Button ID="modifiyEvaluationBtn" runat="server" OnClick="ModificarAplicacion" Text="Guardar Cambios" class="btn btn-primary" />
                            </div>
                        </div>
                </div>
            </div>
    </div>
</asp:Content>
