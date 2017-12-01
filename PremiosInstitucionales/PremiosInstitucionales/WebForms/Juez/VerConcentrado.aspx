<%@ Page Title="" Language="C#" MasterPageFile="~/MP-Global.Master" AutoEventWireup="true" CodeBehind="VerConcentrado.aspx.cs" Inherits="PremiosInstitucionales.WebForms.VerConcentrado" EnableEventValidation="false" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <script src='<%= ResolveUrl("~/Resources/js/jquery.dataTables.js")%>'  type="text/javascript" defer="defer"></script>
    <script src='<%= ResolveUrl("~/Resources/js/listaParticipantes.js")%>' type="text/javascript" defer="defer"></script>
    <link href='<%= ResolveUrl("~/Resources/css/dataTables.css")%>' rel="stylesheet" type="text/css" />
    <div class="container fadeView">

        <asp:Button type="button" runat="server" OnClick="BackBtn_Click" class="backBtn"/>

        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
		            <h3><asp:Literal ID="litTituloPremio" runat="server" /></h3>
                    <h4><asp:Literal ID="litTituloCategoria" runat="server" /></h4>
                    <hr class="shorthr" />
                </div>
            </div>
        </div>

        <div class="container">
            <table id="listaParticipantesTable" class="display" cellspacing="0" width="100%">
                <thead id="listaParticipantesTableHead" runat="server">         
                </thead>
                <tbody id="listaParticipantesTableBody" runat="server">
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>
