﻿    <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListaPremios.aspx.cs" 
    Inherits="PremiosInstitucionales.WebForms.ListaPremios" MasterPageFile="~/MasterPage.Master" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
<link href='<%= ResolveUrl("/Content/stylePremios.css")%>'  rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderBody" Runat="Server">
    
            <div runat="server" id="modalList">

        </div>
    <div class="container fadeView">
	
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<h3 class="section-heading">Premios Institucionales</h3>
				<hr class="shorthr">
			</div>
		</div>
	</div>
        
    <div class="container">
		<div class="row">
            
            <div runat="server" id ="colPremio">

            </div>
		</div>
    </div>
        </div>


</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <script src='<%= ResolveUrl("/scripts/global.js")%>'></script>
</asp:Content>
    