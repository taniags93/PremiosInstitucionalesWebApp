﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListaPremios.aspx.cs" 
Inherits="PremiosInstitucionales.WebForms.ListaPremios" MasterPageFile="~/MP-Global.Master" EnableEventValidation="false" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
  <link href='<%= ResolveUrl("~/Resources/css/stylePremios.css")%>'  rel="stylesheet" type="text/css" />  
  <script src='<%= ResolveUrl("~/Resources/js/listaPremiosCandidato.js") %>'></script>

    <div runat="server" id="modalList"></div>

    <div class="container fadeView">

        <asp:Button type="button" runat="server" OnClick="BackBtn_Click" class="backBtn"/>

	    <div class="container">
		    <div class="row">
			    <div class="col-lg-12 text-center">
				    <h3 class="section-heading">Premios Institucionales</h3>
				    <hr class="shorthr"/>
			    </div>
		    </div>
	    </div>
        <div class="container">
		    <div class="row">
                <div runat="server" id ="colPremio"></div>
		    </div>
        </div>
    </div>
</asp:Content>
    