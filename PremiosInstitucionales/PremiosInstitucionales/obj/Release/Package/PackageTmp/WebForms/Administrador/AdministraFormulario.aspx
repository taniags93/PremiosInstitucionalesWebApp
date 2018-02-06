<%@ Page Title="" EnableEventValidation="false" Language="C#" MasterPageFile="~/MP-Global.Master" AutoEventWireup="true" CodeBehind="AdministraFormulario.aspx.cs" Inherits="PremiosInstitucionales.WebForms.AdministraFormulario" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">


    <!-- Modal Crear Subcategoria  -->
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <div class="modal fade" id="modalCrearSubcategoria" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h3 class="modal-title" id="myModalLabel">Nueva Subcategoría</h3>
                    <hr class="shorthr"/>
                </div>
                <div class="form-horizontal" role="form" id="addSubcategoryForm">
                    <div class="modal-body">
                        <div class="form-group">
                            <label class="col-lg-4 control-label">Nombre Subcategoría:</label>
                            <div class="col-lg-8">
                                <asp:TextBox runat="server" ID="TituloNuevaSubcategoriaTB" class="form-control" type="text" style="width: 90%;"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                        <asp:Button runat="server" ID="GuardarSubcategoriaBttn" class="btn btn-primary" OnClick="GuardarSubcategoriaBttn_Click" Text="Agregar"/>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!-- Modal Crear Pregunta  -->
    <div class="modal fade" id="modalCrearPregunta" tabindex="-1" role="dialog" aria-labelledby="questionModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h3 class="modal-title" id="questionModalLabel">Nueva Pregunta</h3>
                    <hr class="shorthr"/>
                </div>
                <div class="form-horizontal" role="form" id="addQuestionForm">
                    <div class="modal-body">
                        <div class="form-group">
                            <label class="col-lg-4 control-label">Pregunta:</label>
                            <div class="col-lg-8">
                                <asp:TextBox runat="server" ID="TituloNuevaPreguntaTB" class="form-control" type="text" style="width: 90%;"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                        <asp:Button runat="server" ID="Button2" class="btn btn-primary" OnClick="GuardarPreguntaBttn_Click" Text="Agregar"/>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Scripts -->
    <script src='<%= ResolveUrl("~/Resources/js/jquery-ui.js")%>' defer="defer"></script>
    <script src='<%= ResolveUrl("~/Resources/js/jquery.dataTables.js")%>' type="text/javascript" defer="defer"></script>
    <script src='<%= ResolveUrl("~/Resources/js/AdministraFormulario.js")%>' type="text/javascript" defer="defer"></script>
    <script src='<%= ResolveUrl("~/Resources/js/dataTables.rowReorder.min.js")%>' type="text/javascript" defer="defer"></script>

    <!-- CSS -->
    <link href='<%= ResolveUrl("~/Resources/css/dataTables.css")%>' rel="stylesheet" type="text/css"/>
    <link href='<%= ResolveUrl("~/Resources/css/jquery.dataTables.min.css")%>' rel="stylesheet" type="text/css"/>
    <link href='<%= ResolveUrl("~/Resources/css/rowReorder.dataTables.min.css")%>' rel="stylesheet" type="text/css"/>


    <!-- Contenido -->
        <div class="container fadeView">

            <asp:Button type="button" runat="server" OnClick="BackBtn_Click" class="backBtn"/>

            <!-- Premio & Categoria (Nombres) -->
            <div id="nombrePremioCategoria" runat="server"></div>
            
            <!-- Tabs -->
            <div id="centerDiv">
                <ul class="nav nav-tabs">
                    <li class="active li-center"><a data-toggle="tab" href="#Formulario"><strong>Formulario</strong></a></li>
                    <li class="li-center"><a data-toggle="tab" href="#Subcategorias"><strong>Subcategorias</strong></a></li>
                    <li class="li-center"><a data-toggle="tab" href="#Jueces"><strong>Asignar Jueces</strong></a></li>
                </ul>
            </div>

            <!-- Contenido Tabs -->
            <div class="tab-content">

                <!-- Formulario -->
                <div id="Formulario" class="tab-pane fade in active">
                    <div class="container">
	                    <div class="row">
		                    <div id="PreguntaPadre" class="wrapper" runat="server">
			                    <button class="add_button btn">Agrega Pregunta</button><br/><br/>
			                    <div id="simpleList" class="list-group" runat="server" ClientIDMode="Static">
			                    </div>
                                <div id="subcategoriasList" runat="server" ClientIDMode="Static" style="display:none;"></div>
		                    </div> 
                            <div style="width: 100%; text-align: right;">
                                <asp:Button class="btn btn-primary" ID="Button1" Text="Guardar Cambios" OnClick="SaveChanges" runat="server"/>
		                    </div>
	                    </div>
                    </div>
                </div>

                <!-- Subcategorias -->
                <div id="Subcategorias" class="tab-pane fade">
                    
                    <!-- Var compartida (JS & CS) -->
                    <input id="hidden1" type="hidden" runat="server"/>

                    <!-- subcategorias -->
                    <div class="row">
		                <div class="container col-md-12">
                            
                            <div id="Div1" class="wrapper" runat="server">
			                        <button class="add_button btn"  data-toggle="modal" data-target="#modalCrearSubcategoria" >Agrega Subcategoria</button><br/><br/>
                                
		                    </div> 
                            <div class="judge-list">
                                <h5 style="text-align:center;">Subcategorías</h5>
					            <hr class="shorthr"/>
                                <table id="listaSubcategoriasTable" class="display" style="width:100%">
				                    <thead>
					                    <tr>
                                            <th>Orden</th>
						                    <th>Nombre</th>
                                            <th>Opciones</th>
					                    </tr>
				                    </thead>
				                    <tbody id="listaSubcategoriasTableBody" runat="server">
				                    </tbody>
			                    </table>
                            </div>
		                </div>
                    </div>
                </div>

                <!-- Asignar Jueces -->
                <div id="Jueces" class="tab-pane fade">
                    
                    <!-- Var compartida (JS & CS) -->
                    <input id="hiddenControl" type="hidden" runat="server"/>

                    <!-- Banco de Jueces -->
                    <div class="row">
		                <div class="container col-md-6">
                            <div class="judge-list">
                                <h5 style="text-align:center;">Banco de Jueces</h5>
					            <hr class="shorthr"/>
                                <table id="listaJuezTable" class="display" cellspacing="0" width="100%">
				                    <thead>
					                    <tr>
						                    <th>IP</th>
						                    <th>Nombres</th>
						                    <th>Apellidos</th>
					                    </tr>
				                    </thead>
				                    <tbody id="listaJuecesTableBody" runat="server">
				                    </tbody>
			                    </table>
                            </div>
		                </div>

                        <!-- Jueces Asignados -->
                        <div class="container col-md-6">
                            <div class="judge-list">
                                <h5 style="text-align:center;">Jueces Asignados</h5>
					            <hr class="shorthr"/>
                                <table id="listaJuezTableAsignados" class="display" cellspacing="0" width="100%">
				                    <thead>
					                    <tr>
						                    <th>IP</th>
						                    <th>Nombres</th>
						                    <th>Apellidos</th>
					                    </tr>
				                    </thead>
				                    <tbody id="listaJuezTableAsignadosBody" runat="server">
				                    </tbody>
			                    </table>
                            </div>
		                </div>
                    </div>

                    <!-- Boton Guardar -->
                    <div style="width: 100%; text-align: right;">
                        <asp:Button class="btn btn-primary" ID="GuardarCambiosBttn" Text="Guardar Cambios" OnClick="SaveChanges" runat="server"/>
		            </div>

                </div>
            </div> 
        </div>
</asp:Content>
