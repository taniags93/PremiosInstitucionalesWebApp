USE [wPremiosInstitucionalesdb]
GO
/****** Object:  Table [dbo].[PI_BA_Aplicacion]    Script Date: 24/07/2017 03:26:35 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PI_BA_Aplicacion](
	[cveAplicacion] [varchar](50) NOT NULL,
	[Status] [varchar](20) NULL,
	[cveCandidato] [varchar](50) NULL,
	[cveCategoria] [varchar](50) NULL,
	[NombreArchivo] [varchar](50) NULL,
 CONSTRAINT [PK_PI_BA_Aplicacion] PRIMARY KEY CLUSTERED 
(
	[cveAplicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PI_BA_Candidato]    Script Date: 24/07/2017 03:26:35 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PI_BA_Candidato](
	[cveCandidato] [varchar](50) NOT NULL,
	[Password] [varchar](100) NULL,
	[Nombre] [varchar](100) NULL,
	[Apellido] [varchar](100) NULL,
	[Confirmado] [bit] NULL,
	[Correo] [varchar](100) NULL,
	[CodigoConfirmacion] [varchar](50) NULL,
	[Telefono] [varchar](50) NULL,
	[Nacionalidad] [varchar](50) NULL,
	[RFC] [varchar](50) NULL,
	[Direccion] [varchar](50) NULL,
	[NombreImagen] [varchar](50) NULL,
	[FechaPrivacidadDatos] [date] NULL,
 CONSTRAINT [PK_PI_BA_Candidato] PRIMARY KEY CLUSTERED 
(
	[cveCandidato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PI_BA_Categoria]    Script Date: 24/07/2017 03:26:35 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PI_BA_Categoria](
	[cveCategoria] [varchar](50) NOT NULL,
	[Nombre] [varchar](100) NULL,
	[cveConvocatoria] [varchar](50) NULL,
	[cveAplicacionGanadora] [varchar](50) NULL,
	[FechaCreacion] [date] NULL,
	[UsuarioCreacion] [varchar](50) NULL,
	[FechaEdicion] [date] NULL,
	[UsuarioEdicion] [varchar](50) NULL,
 CONSTRAINT [PK_PI_BA_Categoria] PRIMARY KEY CLUSTERED 
(
	[cveCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PI_BA_Convocatoria]    Script Date: 24/07/2017 03:26:35 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PI_BA_Convocatoria](
	[cveConvocatoria] [varchar](50) NOT NULL,
	[Descripcion] [varchar](max) NULL,
	[FechaInicio] [date] NULL,
	[FechaFin] [date] NULL,
	[cvePremio] [varchar](50) NULL,
	[TituloConvocatoria] [varchar](100) NULL,
	[FechaVeredicto] [date] NULL,
	[FechaCreacion] [date] NULL,
	[UsuarioCreacion] [varchar](50) NULL,
	[FechaEdicion] [date] NULL,
	[UsuarioEdicion] [varchar](50) NULL,
 CONSTRAINT [PK_PI_BA_Convocatoria] PRIMARY KEY CLUSTERED 
(
	[cveConvocatoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PI_BA_Evaluacion]    Script Date: 24/07/2017 03:26:35 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PI_BA_Evaluacion](
	[cveEvaluacion] [varchar](50) NOT NULL,
	[Calificacion] [smallint] NULL,
	[cveAplicacion] [varchar](50) NULL,
	[cveJuez] [varchar](50) NULL,
 CONSTRAINT [PK_PI_BA_Evaluacion] PRIMARY KEY CLUSTERED 
(
	[cveEvaluacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PI_BA_Forma]    Script Date: 24/07/2017 03:26:35 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PI_BA_Forma](
	[cveForma] [varchar](50) NOT NULL,
	[cveCategoria] [varchar](50) NULL,
	[FechaCreacion] [date] NULL,
	[UsuarioCreacion] [varchar](50) NULL,
	[FechaEdicion] [date] NULL,
	[UsuarioEdicion] [varchar](50) NULL,
 CONSTRAINT [PK_PI_BA_Forma] PRIMARY KEY CLUSTERED 
(
	[cveForma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PI_BA_Juez]    Script Date: 24/07/2017 03:26:35 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PI_BA_Juez](
	[cveJuez] [varchar](50) NOT NULL,
	[Password] [varchar](100) NULL,
	[Nombre] [varchar](100) NULL,
	[Apellido] [varchar](100) NULL,
	[Correo] [varchar](100) NULL,
	[NombreImagen] [varchar](50) NULL,
 CONSTRAINT [PK_PI_BA_Juez] PRIMARY KEY CLUSTERED 
(
	[cveJuez] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PI_BA_JuezPorCategoria]    Script Date: 24/07/2017 03:26:35 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PI_BA_JuezPorCategoria](
	[cveJuezPorCategoria] [varchar](50) NOT NULL,
	[cveJuez] [varchar](50) NOT NULL,
	[cveCategoria] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PI_BA_JuezPorCategoria] PRIMARY KEY CLUSTERED 
(
	[cveJuezPorCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PI_BA_Pregunta]    Script Date: 24/07/2017 03:26:35 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PI_BA_Pregunta](
	[cvePregunta] [varchar](50) NOT NULL,
	[Texto] [varchar](100) NULL,
	[Orden] [int] NULL,
 CONSTRAINT [PK_PI_BA_Pregunta] PRIMARY KEY CLUSTERED 
(
	[cvePregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PI_BA_PreguntasPorForma]    Script Date: 24/07/2017 03:26:35 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PI_BA_PreguntasPorForma](
	[cvePreguntaPorForma] [varchar](50) NOT NULL,
	[cveForma] [varchar](50) NOT NULL,
	[cvePregunta] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PI_BA_PreguntasPorForma] PRIMARY KEY CLUSTERED 
(
	[cvePreguntaPorForma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PI_BA_Premio]    Script Date: 24/07/2017 03:26:35 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PI_BA_Premio](
	[cvePremio] [varchar](50) NOT NULL,
	[Nombre] [varchar](100) NULL,
	[NombreImagen] [varchar](50) NULL,
	[Descripcion] [varchar](250) NULL,
	[FechaCreacion] [date] NULL,
	[UsuarioCreacion] [varchar](50) NULL,
	[FechaEdicion] [date] NULL,
	[UsuarioEdicion] [varchar](50) NULL,
 CONSTRAINT [PK_PI_BA_Premio] PRIMARY KEY CLUSTERED 
(
	[cvePremio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PI_BA_Respuesta]    Script Date: 24/07/2017 03:26:35 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PI_BA_Respuesta](
	[cveRespuesta] [varchar](50) NOT NULL,
	[Valor] [varchar](500) NULL,
	[cvePregunta] [varchar](50) NULL,
	[cveAplicacion] [varchar](50) NULL,
 CONSTRAINT [PK_PI_BA_Respuesta] PRIMARY KEY CLUSTERED 
(
	[cveRespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PI_SE_Administrador]    Script Date: 24/07/2017 03:26:35 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PI_SE_Administrador](
	[cveAdministrador] [varchar](50) NOT NULL,
	[Password] [varchar](100) NULL,
	[Correo] [varchar](100) NULL,
 CONSTRAINT [PK_PI_SE_Administrador] PRIMARY KEY CLUSTERED 
(
	[cveAdministrador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[PI_BA_Aplicacion] ([cveAplicacion], [Status], [cveCandidato], [cveCategoria], [NombreArchivo]) VALUES (N'599e3bcf-990b-411d-a725-4ae8a8ecacb2', N'aceptada', N'001', N'a169ad68-689a-488a-8b67-ea5790c1dcca', NULL)
INSERT [dbo].[PI_BA_Candidato] ([cveCandidato], [Password], [Nombre], [Apellido], [Confirmado], [Correo], [CodigoConfirmacion], [Telefono], [Nacionalidad], [RFC], [Direccion], [NombreImagen], [FechaPrivacidadDatos]) VALUES (N'001', N'123', N'Carlos Azael', N'Frutos', 1, N'carlos@gmail.com', NULL, N'80000000', N'Mexicano', N'XXXXXXX', N'Garza Sada', N'e5347ac1-2740-4096-88a6-9f994e93e4ff.jpg', CAST(N'2017-05-11' AS Date))
INSERT [dbo].[PI_BA_Candidato] ([cveCandidato], [Password], [Nombre], [Apellido], [Confirmado], [Correo], [CodigoConfirmacion], [Telefono], [Nacionalidad], [RFC], [Direccion], [NombreImagen], [FechaPrivacidadDatos]) VALUES (N'143b14d2-977d-484d-907d-02a6731e67b0', N'rodo123', N'Rodo E', N'Cantu Vota', 1, N'b2069422@mvrht.net', N'712b9dd0-262e-4508-9306-e574e42f7cbf', N'', N'', N'', N'', N'90a70db6-33d1-458a-8d06-937d9ae7291e.gif', CAST(N'2017-05-25' AS Date))
INSERT [dbo].[PI_BA_Candidato] ([cveCandidato], [Password], [Nombre], [Apellido], [Confirmado], [Correo], [CodigoConfirmacion], [Telefono], [Nacionalidad], [RFC], [Direccion], [NombreImagen], [FechaPrivacidadDatos]) VALUES (N'2d327279-7b68-4188-b0ef-ad3b5feab32b', N'ruben123', N'Ruben', N'Cantu', 1, N'c413935@mvrht.net', N'd538b83b-67ac-443c-ad84-8d3101122ac7', N'', N'', N'237465', N'', N'5617a512-01f7-4147-ac95-2dfb440ec885.jpg', CAST(N'2017-05-30' AS Date))
INSERT [dbo].[PI_BA_Categoria] ([cveCategoria], [Nombre], [cveConvocatoria], [cveAplicacionGanadora], [FechaCreacion], [UsuarioCreacion], [FechaEdicion], [UsuarioEdicion]) VALUES (N'1ff8d427-e0c4-488e-9ae0-bc7bb4ca60ac', N'Alumnos', N'1044f212-0e59-41dc-a97e-8789525a8652', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[PI_BA_Categoria] ([cveCategoria], [Nombre], [cveConvocatoria], [cveAplicacionGanadora], [FechaCreacion], [UsuarioCreacion], [FechaEdicion], [UsuarioEdicion]) VALUES (N'577e2cb7-09ec-4dc5-9fc9-8c637a029b68', N'Theory', N'acec7a24-1475-4863-8454-863704f15fe0', NULL, CAST(N'2017-07-04' AS Date), N'admin', CAST(N'2017-07-04' AS Date), N'admin')
INSERT [dbo].[PI_BA_Categoria] ([cveCategoria], [Nombre], [cveConvocatoria], [cveAplicacionGanadora], [FechaCreacion], [UsuarioCreacion], [FechaEdicion], [UsuarioEdicion]) VALUES (N'7bd1192d-1f06-4a46-8404-70720d82c066', N'Hola', N'93e5755d-3ffd-46bd-a4ac-edc4f35b98fd', NULL, CAST(N'2017-07-04' AS Date), N'admin', CAST(N'2017-07-04' AS Date), N'admin')
INSERT [dbo].[PI_BA_Categoria] ([cveCategoria], [Nombre], [cveConvocatoria], [cveAplicacionGanadora], [FechaCreacion], [UsuarioCreacion], [FechaEdicion], [UsuarioEdicion]) VALUES (N'8d58b964-0f51-4bf2-b564-8449fecb3132', N'Primavera', N'1044f212-0e59-41dc-a97e-8789525a8652', NULL, CAST(N'2017-07-04' AS Date), N'admin', CAST(N'2017-07-04' AS Date), N'admin')
INSERT [dbo].[PI_BA_Categoria] ([cveCategoria], [Nombre], [cveConvocatoria], [cveAplicacionGanadora], [FechaCreacion], [UsuarioCreacion], [FechaEdicion], [UsuarioEdicion]) VALUES (N'a169ad68-689a-488a-8b67-ea5790c1dcca', N'Nueva Prueba', N'89a83d33-edae-4bcc-9301-dbb6a0494b4f', NULL, CAST(N'2017-07-04' AS Date), N'admin', CAST(N'2017-07-04' AS Date), N'admin')
INSERT [dbo].[PI_BA_Categoria] ([cveCategoria], [Nombre], [cveConvocatoria], [cveAplicacionGanadora], [FechaCreacion], [UsuarioCreacion], [FechaEdicion], [UsuarioEdicion]) VALUES (N'ed2bbcce-ae5d-41f2-8c8d-74d555078b40', N'Primavera', N'1044f212-0e59-41dc-a97e-8789525a8652', NULL, CAST(N'2017-07-04' AS Date), N'admin', CAST(N'2017-07-04' AS Date), N'admin')
INSERT [dbo].[PI_BA_Categoria] ([cveCategoria], [Nombre], [cveConvocatoria], [cveAplicacionGanadora], [FechaCreacion], [UsuarioCreacion], [FechaEdicion], [UsuarioEdicion]) VALUES (N'f0ed45d1-7d3f-4727-b9e4-2ea52b918144', N'Prueba', N'1044f212-0e59-41dc-a97e-8789525a8652', NULL, CAST(N'2017-07-04' AS Date), N'admin', CAST(N'2017-07-04' AS Date), N'admin')
INSERT [dbo].[PI_BA_Convocatoria] ([cveConvocatoria], [Descripcion], [FechaInicio], [FechaFin], [cvePremio], [TituloConvocatoria], [FechaVeredicto], [FechaCreacion], [UsuarioCreacion], [FechaEdicion], [UsuarioEdicion]) VALUES (N'0ee3a128-425e-4c63-b689-53255f125e99', NULL, CAST(N'2017-07-04' AS Date), CAST(N'2017-07-11' AS Date), NULL, N'sdf', CAST(N'2017-07-18' AS Date), CAST(N'2017-07-04' AS Date), N'admin', CAST(N'2017-07-04' AS Date), N'admin')
INSERT [dbo].[PI_BA_Convocatoria] ([cveConvocatoria], [Descripcion], [FechaInicio], [FechaFin], [cvePremio], [TituloConvocatoria], [FechaVeredicto], [FechaCreacion], [UsuarioCreacion], [FechaEdicion], [UsuarioEdicion]) VALUES (N'1044f212-0e59-41dc-a97e-8789525a8652', NULL, CAST(N'2017-06-21' AS Date), CAST(N'2017-08-02' AS Date), N'300ad73c-52a5-4ee4-83a6-6388a7423728', N'Verano 2017', CAST(N'2017-08-16' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[PI_BA_Convocatoria] ([cveConvocatoria], [Descripcion], [FechaInicio], [FechaFin], [cvePremio], [TituloConvocatoria], [FechaVeredicto], [FechaCreacion], [UsuarioCreacion], [FechaEdicion], [UsuarioEdicion]) VALUES (N'89a83d33-edae-4bcc-9301-dbb6a0494b4f', NULL, CAST(N'2017-07-04' AS Date), CAST(N'2017-07-24' AS Date), N'f445fbf4-8e50-4ac8-aab4-1051aceeb42b', N'k.', CAST(N'2017-07-30' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[PI_BA_Convocatoria] ([cveConvocatoria], [Descripcion], [FechaInicio], [FechaFin], [cvePremio], [TituloConvocatoria], [FechaVeredicto], [FechaCreacion], [UsuarioCreacion], [FechaEdicion], [UsuarioEdicion]) VALUES (N'93e5755d-3ffd-46bd-a4ac-edc4f35b98fd', NULL, CAST(N'2017-07-04' AS Date), CAST(N'2017-07-11' AS Date), N'fbbb3353-4079-4216-81ee-3688a82ba371', N'23443', CAST(N'2017-07-18' AS Date), CAST(N'2017-07-04' AS Date), N'admin', CAST(N'2017-07-04' AS Date), N'admin')
INSERT [dbo].[PI_BA_Convocatoria] ([cveConvocatoria], [Descripcion], [FechaInicio], [FechaFin], [cvePremio], [TituloConvocatoria], [FechaVeredicto], [FechaCreacion], [UsuarioCreacion], [FechaEdicion], [UsuarioEdicion]) VALUES (N'acec7a24-1475-4863-8454-863704f15fe0', NULL, CAST(N'2017-07-05' AS Date), CAST(N'2017-07-12' AS Date), N'83e24b92-34bb-49f6-aae4-3d319943643d', N'Testing', CAST(N'2017-07-19' AS Date), CAST(N'2017-07-04' AS Date), N'admin', CAST(N'2017-07-04' AS Date), N'admin')
INSERT [dbo].[PI_BA_Convocatoria] ([cveConvocatoria], [Descripcion], [FechaInicio], [FechaFin], [cvePremio], [TituloConvocatoria], [FechaVeredicto], [FechaCreacion], [UsuarioCreacion], [FechaEdicion], [UsuarioEdicion]) VALUES (N'bc1fc0b3-f6d4-47b4-9666-62a7b9792435', NULL, CAST(N'2017-07-04' AS Date), CAST(N'2017-07-11' AS Date), NULL, N'swer', CAST(N'2017-07-18' AS Date), CAST(N'2017-07-04' AS Date), N'admin', CAST(N'2017-07-04' AS Date), N'admin')
INSERT [dbo].[PI_BA_Forma] ([cveForma], [cveCategoria], [FechaCreacion], [UsuarioCreacion], [FechaEdicion], [UsuarioEdicion]) VALUES (N'07e721e8-68f7-4c2e-bab3-e7aeb7b1b757', N'1ff8d427-e0c4-488e-9ae0-bc7bb4ca60ac', NULL, NULL, NULL, NULL)
INSERT [dbo].[PI_BA_Forma] ([cveForma], [cveCategoria], [FechaCreacion], [UsuarioCreacion], [FechaEdicion], [UsuarioEdicion]) VALUES (N'0eb12eeb-8aa0-455a-b210-6a3639c1892d', N'7bd1192d-1f06-4a46-8404-70720d82c066', CAST(N'2017-07-04' AS Date), N'admin', CAST(N'2017-07-04' AS Date), N'admin')
INSERT [dbo].[PI_BA_Forma] ([cveForma], [cveCategoria], [FechaCreacion], [UsuarioCreacion], [FechaEdicion], [UsuarioEdicion]) VALUES (N'2bfb9938-8d52-436e-b360-f7e078ec89ac', N'577e2cb7-09ec-4dc5-9fc9-8c637a029b68', CAST(N'2017-07-04' AS Date), N'admin', CAST(N'2017-07-04' AS Date), N'admin')
INSERT [dbo].[PI_BA_Forma] ([cveForma], [cveCategoria], [FechaCreacion], [UsuarioCreacion], [FechaEdicion], [UsuarioEdicion]) VALUES (N'6da11553-b508-48fa-818f-081eff30aedb', N'8d58b964-0f51-4bf2-b564-8449fecb3132', CAST(N'2017-07-04' AS Date), N'admin', CAST(N'2017-07-04' AS Date), N'admin')
INSERT [dbo].[PI_BA_Forma] ([cveForma], [cveCategoria], [FechaCreacion], [UsuarioCreacion], [FechaEdicion], [UsuarioEdicion]) VALUES (N'b9e23a56-aba9-4f30-adf1-3442ea2c11c2', N'a169ad68-689a-488a-8b67-ea5790c1dcca', CAST(N'2017-07-04' AS Date), N'admin', CAST(N'2017-07-04' AS Date), N'admin')
INSERT [dbo].[PI_BA_Forma] ([cveForma], [cveCategoria], [FechaCreacion], [UsuarioCreacion], [FechaEdicion], [UsuarioEdicion]) VALUES (N'c13ecab6-994e-433a-8963-e0e27726dd35', N'f0ed45d1-7d3f-4727-b9e4-2ea52b918144', CAST(N'2017-07-04' AS Date), N'admin', CAST(N'2017-07-04' AS Date), N'admin')
INSERT [dbo].[PI_BA_Forma] ([cveForma], [cveCategoria], [FechaCreacion], [UsuarioCreacion], [FechaEdicion], [UsuarioEdicion]) VALUES (N'e1364c5a-4fa3-4ab0-a1c2-6a3b118bfc97', N'ed2bbcce-ae5d-41f2-8c8d-74d555078b40', CAST(N'2017-07-04' AS Date), N'admin', CAST(N'2017-07-04' AS Date), N'admin')
INSERT [dbo].[PI_BA_Juez] ([cveJuez], [Password], [Nombre], [Apellido], [Correo], [NombreImagen]) VALUES (N'002', N'juez123', N'Ruben Eugenio', N'Cantu', N'juez@mail.com', N'8a046ff1-8332-41b3-8e1c-6096e6c6a64a.jpg')
INSERT [dbo].[PI_BA_Juez] ([cveJuez], [Password], [Nombre], [Apellido], [Correo], [NombreImagen]) VALUES (N'003', N'123', N'Antonio', N'Vargas', N'tony@gmail.com', N'5f90d998-e46d-49c7-91ff-71ad150dcbb5.jpg')
INSERT [dbo].[PI_BA_Juez] ([cveJuez], [Password], [Nombre], [Apellido], [Correo], [NombreImagen]) VALUES (N'155a4b09-18f1-4efa-995b-6f7e95d82543', N'ruben1234', NULL, NULL, N'rubenz_94@live.com', NULL)
INSERT [dbo].[PI_BA_Juez] ([cveJuez], [Password], [Nombre], [Apellido], [Correo], [NombreImagen]) VALUES (N'b7f7ef00-c001-4fc6-b8fc-684af715c5c6', N'123', NULL, NULL, N'jn2hurki.rah@20minute.email', NULL)
INSERT [dbo].[PI_BA_JuezPorCategoria] ([cveJuezPorCategoria], [cveJuez], [cveCategoria]) VALUES (N'1c1aad30-2aa5-4fd9-8d1f-f6e8782f4a03', N'155a4b09-18f1-4efa-995b-6f7e95d82543', N'a169ad68-689a-488a-8b67-ea5790c1dcca')
INSERT [dbo].[PI_BA_JuezPorCategoria] ([cveJuezPorCategoria], [cveJuez], [cveCategoria]) VALUES (N'45a97f11-e0de-495c-9ef5-b4cacafed3ff', N'003', N'1ff8d427-e0c4-488e-9ae0-bc7bb4ca60ac')
INSERT [dbo].[PI_BA_JuezPorCategoria] ([cveJuezPorCategoria], [cveJuez], [cveCategoria]) VALUES (N'4fab5a8b-ccbf-4b27-a75d-ab9d331157d3', N'b7f7ef00-c001-4fc6-b8fc-684af715c5c6', N'7bd1192d-1f06-4a46-8404-70720d82c066')
INSERT [dbo].[PI_BA_JuezPorCategoria] ([cveJuezPorCategoria], [cveJuez], [cveCategoria]) VALUES (N'83fa66d1-7fe5-47c1-8848-c7eb5ee00107', N'002', N'7bd1192d-1f06-4a46-8404-70720d82c066')
INSERT [dbo].[PI_BA_JuezPorCategoria] ([cveJuezPorCategoria], [cveJuez], [cveCategoria]) VALUES (N'8e7f0e5a-344c-41d0-adc7-1bfb65ddc3ce', N'003', N'a169ad68-689a-488a-8b67-ea5790c1dcca')
INSERT [dbo].[PI_BA_JuezPorCategoria] ([cveJuezPorCategoria], [cveJuez], [cveCategoria]) VALUES (N'8ebeb504-159d-42f9-b5bc-96f8952d05bf', N'b7f7ef00-c001-4fc6-b8fc-684af715c5c6', N'577e2cb7-09ec-4dc5-9fc9-8c637a029b68')
INSERT [dbo].[PI_BA_JuezPorCategoria] ([cveJuezPorCategoria], [cveJuez], [cveCategoria]) VALUES (N'9f20002b-d8ba-43af-ab1a-6105277d0ff2', N'003', N'577e2cb7-09ec-4dc5-9fc9-8c637a029b68')
INSERT [dbo].[PI_BA_JuezPorCategoria] ([cveJuezPorCategoria], [cveJuez], [cveCategoria]) VALUES (N'a99b3c07-2198-4a28-961d-426b99663b9f', N'003', N'7bd1192d-1f06-4a46-8404-70720d82c066')
INSERT [dbo].[PI_BA_JuezPorCategoria] ([cveJuezPorCategoria], [cveJuez], [cveCategoria]) VALUES (N'aa5899bb-3fa0-435f-a2dd-31ae6c1e0f20', N'002', N'a169ad68-689a-488a-8b67-ea5790c1dcca')
INSERT [dbo].[PI_BA_JuezPorCategoria] ([cveJuezPorCategoria], [cveJuez], [cveCategoria]) VALUES (N'add0d733-9019-47ad-985a-6c4b4ee0df97', N'155a4b09-18f1-4efa-995b-6f7e95d82543', N'577e2cb7-09ec-4dc5-9fc9-8c637a029b68')
INSERT [dbo].[PI_BA_JuezPorCategoria] ([cveJuezPorCategoria], [cveJuez], [cveCategoria]) VALUES (N'dfef0ae3-8be9-48d2-8161-8d15675b5100', N'002', N'577e2cb7-09ec-4dc5-9fc9-8c637a029b68')
INSERT [dbo].[PI_BA_JuezPorCategoria] ([cveJuezPorCategoria], [cveJuez], [cveCategoria]) VALUES (N'f3986f1d-9e6e-4c7b-be2b-3cf66a90372a', N'b7f7ef00-c001-4fc6-b8fc-684af715c5c6', N'a169ad68-689a-488a-8b67-ea5790c1dcca')
INSERT [dbo].[PI_BA_JuezPorCategoria] ([cveJuezPorCategoria], [cveJuez], [cveCategoria]) VALUES (N'fbe3b3f4-83d3-4369-b178-bc7a27df4a11', N'155a4b09-18f1-4efa-995b-6f7e95d82543', N'7bd1192d-1f06-4a46-8404-70720d82c066')
INSERT [dbo].[PI_BA_Pregunta] ([cvePregunta], [Texto], [Orden]) VALUES (N'1c7c2a59-8eb2-48bb-9065-d0a312a5b7af', N'rrrrr', 1)
INSERT [dbo].[PI_BA_Pregunta] ([cvePregunta], [Texto], [Orden]) VALUES (N'577c6543-4165-4c45-bae4-5a7c606b02a7', N'asddas', 0)
INSERT [dbo].[PI_BA_Pregunta] ([cvePregunta], [Texto], [Orden]) VALUES (N'6c215575-7fc1-46e2-b904-ed35d8b9279b', N'¿Pregunta 2?', 1)
INSERT [dbo].[PI_BA_Pregunta] ([cvePregunta], [Texto], [Orden]) VALUES (N'98dda791-0edf-481c-ac5c-6e3d84330c2c', N'Number', 0)
INSERT [dbo].[PI_BA_Pregunta] ([cvePregunta], [Texto], [Orden]) VALUES (N'a34445eb-5333-449b-a711-714fd532bef7', N'¿Pregunta 1?', 0)
INSERT [dbo].[PI_BA_Pregunta] ([cvePregunta], [Texto], [Orden]) VALUES (N'c9db0c5e-fe2c-41ea-a2a4-a6ac501da388', N'¿Hola?', 0)
INSERT [dbo].[PI_BA_PreguntasPorForma] ([cvePreguntaPorForma], [cveForma], [cvePregunta]) VALUES (N'550747e4-1ef9-441c-9ffe-4d36ef8c7ca2', N'2bfb9938-8d52-436e-b360-f7e078ec89ac', N'98dda791-0edf-481c-ac5c-6e3d84330c2c')
INSERT [dbo].[PI_BA_PreguntasPorForma] ([cvePreguntaPorForma], [cveForma], [cvePregunta]) VALUES (N'5c0d170a-a327-4518-b06a-9e79513dcda9', N'b9e23a56-aba9-4f30-adf1-3442ea2c11c2', N'1c7c2a59-8eb2-48bb-9065-d0a312a5b7af')
INSERT [dbo].[PI_BA_PreguntasPorForma] ([cvePreguntaPorForma], [cveForma], [cvePregunta]) VALUES (N'68b0462d-3310-4171-8eaa-bdb66ba8f73e', N'07e721e8-68f7-4c2e-bab3-e7aeb7b1b757', N'6c215575-7fc1-46e2-b904-ed35d8b9279b')
INSERT [dbo].[PI_BA_PreguntasPorForma] ([cvePreguntaPorForma], [cveForma], [cvePregunta]) VALUES (N'76a4a4e9-9d74-4d7e-a2c4-3bd356f381e7', N'07e721e8-68f7-4c2e-bab3-e7aeb7b1b757', N'a34445eb-5333-449b-a711-714fd532bef7')
INSERT [dbo].[PI_BA_PreguntasPorForma] ([cvePreguntaPorForma], [cveForma], [cvePregunta]) VALUES (N'7d701679-9d43-490c-9e10-a691e8fd050b', N'0eb12eeb-8aa0-455a-b210-6a3639c1892d', N'577c6543-4165-4c45-bae4-5a7c606b02a7')
INSERT [dbo].[PI_BA_PreguntasPorForma] ([cvePreguntaPorForma], [cveForma], [cvePregunta]) VALUES (N'f494532a-eb34-4322-8fbd-ac15150539dc', N'b9e23a56-aba9-4f30-adf1-3442ea2c11c2', N'c9db0c5e-fe2c-41ea-a2a4-a6ac501da388')
INSERT [dbo].[PI_BA_Premio] ([cvePremio], [Nombre], [NombreImagen], [Descripcion], [FechaCreacion], [UsuarioCreacion], [FechaEdicion], [UsuarioEdicion]) VALUES (N'300ad73c-52a5-4ee4-83a6-6388a7423728', N'Luis Elizondo Prueba', N'41725e9d-8a0a-411c-a238-b91ee0fd495d.png', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam sagittis, ligula id sodales ultricies, purus ante fringilla eros, pharetra faucibus lorem ante mollis nulla.', NULL, NULL, CAST(N'2017-07-04' AS Date), N'admin')
INSERT [dbo].[PI_BA_Premio] ([cvePremio], [Nombre], [NombreImagen], [Descripcion], [FechaCreacion], [UsuarioCreacion], [FechaEdicion], [UsuarioEdicion]) VALUES (N'83e24b92-34bb-49f6-aae4-3d319943643d', N'Eugenio Garza Sada', N'2f06a6af-1c00-4951-82bc-cf9ccf733b17.jpg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed aliquam bibendum est, eget venenatis mi vulputate sed. Nullam lorem nibh, ultrices faucibus malesuada at, feugiat non diam.', NULL, NULL, NULL, NULL)
INSERT [dbo].[PI_BA_Premio] ([cvePremio], [Nombre], [NombreImagen], [Descripcion], [FechaCreacion], [UsuarioCreacion], [FechaEdicion], [UsuarioEdicion]) VALUES (N'95c807da-ea1f-4baf-8b62-74a26070debc', N'Alma Mater', N'd0741c14-3401-4850-a1db-a7c6b8839d80.jpg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer placerat sagittis tincidunt. Praesent metus augue, gravida eu dapibus ut, porta quis nibh. Fusce in nibh erat. ', NULL, NULL, NULL, NULL)
INSERT [dbo].[PI_BA_Premio] ([cvePremio], [Nombre], [NombreImagen], [Descripcion], [FechaCreacion], [UsuarioCreacion], [FechaEdicion], [UsuarioEdicion]) VALUES (N'bd9f1162-36a0-4970-9b0c-9f26a01308d5', N'Romulo Garza', N'7b0ab39e-6d71-4d45-9f17-9b036ca30cde.PNG', N'Lorem Ipsum .....', NULL, NULL, NULL, NULL)
INSERT [dbo].[PI_BA_Premio] ([cvePremio], [Nombre], [NombreImagen], [Descripcion], [FechaCreacion], [UsuarioCreacion], [FechaEdicion], [UsuarioEdicion]) VALUES (N'f445fbf4-8e50-4ac8-aab4-1051aceeb42b', N'Nuevo', N'0f3bab02-35e2-439e-8ade-cb26c90b6381.jpg', N'Desc', CAST(N'2017-07-04' AS Date), N'admin', CAST(N'2017-07-04' AS Date), N'admin')
INSERT [dbo].[PI_BA_Premio] ([cvePremio], [Nombre], [NombreImagen], [Descripcion], [FechaCreacion], [UsuarioCreacion], [FechaEdicion], [UsuarioEdicion]) VALUES (N'fbbb3353-4079-4216-81ee-3688a82ba371', N'sda', N'7110f1bc-9e96-49a1-988f-cee39e022207.jpg', N'sasdasdadsads', NULL, NULL, NULL, NULL)
INSERT [dbo].[PI_BA_Respuesta] ([cveRespuesta], [Valor], [cvePregunta], [cveAplicacion]) VALUES (N'21f6ac06-cd9a-4a50-ad68-ff98ed097381', N'asd', N'c9db0c5e-fe2c-41ea-a2a4-a6ac501da388', N'599e3bcf-990b-411d-a725-4ae8a8ecacb2')
INSERT [dbo].[PI_BA_Respuesta] ([cveRespuesta], [Valor], [cvePregunta], [cveAplicacion]) VALUES (N'38629e82-3b54-49a2-8077-c7511fa65a90', N'asd', N'1c7c2a59-8eb2-48bb-9065-d0a312a5b7af', N'599e3bcf-990b-411d-a725-4ae8a8ecacb2')
INSERT [dbo].[PI_SE_Administrador] ([cveAdministrador], [Password], [Correo]) VALUES (N'001', N'123', N'admin')
ALTER TABLE [dbo].[PI_BA_Aplicacion]  WITH NOCHECK ADD  CONSTRAINT [FK_PI_BA_Aplicacion_PI_BA_Candidato] FOREIGN KEY([cveCandidato])
REFERENCES [dbo].[PI_BA_Candidato] ([cveCandidato])
GO
ALTER TABLE [dbo].[PI_BA_Aplicacion] CHECK CONSTRAINT [FK_PI_BA_Aplicacion_PI_BA_Candidato]
GO
ALTER TABLE [dbo].[PI_BA_Aplicacion]  WITH NOCHECK ADD  CONSTRAINT [FK_PI_BA_Aplicacion_PI_BA_Categoria] FOREIGN KEY([cveCategoria])
REFERENCES [dbo].[PI_BA_Categoria] ([cveCategoria])
GO
ALTER TABLE [dbo].[PI_BA_Aplicacion] CHECK CONSTRAINT [FK_PI_BA_Aplicacion_PI_BA_Categoria]
GO
ALTER TABLE [dbo].[PI_BA_Categoria]  WITH NOCHECK ADD  CONSTRAINT [FK_PI_BA_Categoria_PI_BA_Aplicacion] FOREIGN KEY([cveAplicacionGanadora])
REFERENCES [dbo].[PI_BA_Aplicacion] ([cveAplicacion])
GO
ALTER TABLE [dbo].[PI_BA_Categoria] CHECK CONSTRAINT [FK_PI_BA_Categoria_PI_BA_Aplicacion]
GO
ALTER TABLE [dbo].[PI_BA_Categoria]  WITH NOCHECK ADD  CONSTRAINT [FK_PI_BA_Categoria_PI_BA_Convocatoria] FOREIGN KEY([cveConvocatoria])
REFERENCES [dbo].[PI_BA_Convocatoria] ([cveConvocatoria])
GO
ALTER TABLE [dbo].[PI_BA_Categoria] CHECK CONSTRAINT [FK_PI_BA_Categoria_PI_BA_Convocatoria]
GO
ALTER TABLE [dbo].[PI_BA_Convocatoria]  WITH NOCHECK ADD  CONSTRAINT [FK_PI_BA_Convocatoria_PI_BA_Premio] FOREIGN KEY([cvePremio])
REFERENCES [dbo].[PI_BA_Premio] ([cvePremio])
GO
ALTER TABLE [dbo].[PI_BA_Convocatoria] CHECK CONSTRAINT [FK_PI_BA_Convocatoria_PI_BA_Premio]
GO
ALTER TABLE [dbo].[PI_BA_Evaluacion]  WITH NOCHECK ADD  CONSTRAINT [FK_PI_BA_Evaluacion_PI_BA_Aplicacion] FOREIGN KEY([cveAplicacion])
REFERENCES [dbo].[PI_BA_Aplicacion] ([cveAplicacion])
GO
ALTER TABLE [dbo].[PI_BA_Evaluacion] CHECK CONSTRAINT [FK_PI_BA_Evaluacion_PI_BA_Aplicacion]
GO
ALTER TABLE [dbo].[PI_BA_Evaluacion]  WITH NOCHECK ADD  CONSTRAINT [FK_PI_BA_Evaluacion_PI_BA_Juez] FOREIGN KEY([cveJuez])
REFERENCES [dbo].[PI_BA_Juez] ([cveJuez])
GO
ALTER TABLE [dbo].[PI_BA_Evaluacion] CHECK CONSTRAINT [FK_PI_BA_Evaluacion_PI_BA_Juez]
GO
ALTER TABLE [dbo].[PI_BA_Forma]  WITH NOCHECK ADD  CONSTRAINT [FK_PI_BA_Forma_PI_BA_Categoria] FOREIGN KEY([cveCategoria])
REFERENCES [dbo].[PI_BA_Categoria] ([cveCategoria])
GO
ALTER TABLE [dbo].[PI_BA_Forma] CHECK CONSTRAINT [FK_PI_BA_Forma_PI_BA_Categoria]
GO
ALTER TABLE [dbo].[PI_BA_JuezPorCategoria]  WITH NOCHECK ADD  CONSTRAINT [FK_PI_BA_JuezPorCategoria_PI_BA_Categoria] FOREIGN KEY([cveCategoria])
REFERENCES [dbo].[PI_BA_Categoria] ([cveCategoria])
GO
ALTER TABLE [dbo].[PI_BA_JuezPorCategoria] CHECK CONSTRAINT [FK_PI_BA_JuezPorCategoria_PI_BA_Categoria]
GO
ALTER TABLE [dbo].[PI_BA_JuezPorCategoria]  WITH NOCHECK ADD  CONSTRAINT [FK_PI_BA_JuezPorCategoria_PI_BA_Juez] FOREIGN KEY([cveJuez])
REFERENCES [dbo].[PI_BA_Juez] ([cveJuez])
GO
ALTER TABLE [dbo].[PI_BA_JuezPorCategoria] CHECK CONSTRAINT [FK_PI_BA_JuezPorCategoria_PI_BA_Juez]
GO
ALTER TABLE [dbo].[PI_BA_PreguntasPorForma]  WITH NOCHECK ADD  CONSTRAINT [FK_PI_BA_PreguntasPorForma_PI_BA_Forma] FOREIGN KEY([cveForma])
REFERENCES [dbo].[PI_BA_Forma] ([cveForma])
GO
ALTER TABLE [dbo].[PI_BA_PreguntasPorForma] CHECK CONSTRAINT [FK_PI_BA_PreguntasPorForma_PI_BA_Forma]
GO
ALTER TABLE [dbo].[PI_BA_PreguntasPorForma]  WITH NOCHECK ADD  CONSTRAINT [FK_PI_BA_PreguntasPorForma_PI_BA_Pregunta] FOREIGN KEY([cvePregunta])
REFERENCES [dbo].[PI_BA_Pregunta] ([cvePregunta])
GO
ALTER TABLE [dbo].[PI_BA_PreguntasPorForma] CHECK CONSTRAINT [FK_PI_BA_PreguntasPorForma_PI_BA_Pregunta]
GO
ALTER TABLE [dbo].[PI_BA_Respuesta]  WITH NOCHECK ADD  CONSTRAINT [FK_PI_BA_Respuesta_PI_BA_Aplicacion] FOREIGN KEY([cveAplicacion])
REFERENCES [dbo].[PI_BA_Aplicacion] ([cveAplicacion])
GO
ALTER TABLE [dbo].[PI_BA_Respuesta] CHECK CONSTRAINT [FK_PI_BA_Respuesta_PI_BA_Aplicacion]
GO
ALTER TABLE [dbo].[PI_BA_Respuesta]  WITH NOCHECK ADD  CONSTRAINT [FK_PI_BA_Respuesta_PI_BA_Pregunta] FOREIGN KEY([cvePregunta])
REFERENCES [dbo].[PI_BA_Pregunta] ([cvePregunta])
GO
ALTER TABLE [dbo].[PI_BA_Respuesta] CHECK CONSTRAINT [FK_PI_BA_Respuesta_PI_BA_Pregunta]
GO
/****** Object:  StoredProcedure [dbo].[AddCandidato]    Script Date: 24/07/2017 03:26:35 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE [dbo].[AddCandidato]
	@cveCandidato			varchar(50)		= '',
	@Password				varchar(100)	= '',
	@Nombre					varchar(100)	= '',
	@Apellido				varchar(100)	= '',
	@Confirmado				bit				= null,
	@Correo					varchar(100)	= '',
	@CodigoConfirmacion		varchar(50)		= '',
	@Telefono				varchar(50)		= '',
	@Nacionalidad			varchar(50)		= '',
	@RFC					varchar(50)		= '',
	@Direccion				varchar(50)		= '',
	@NombreImagen			varchar(50)		= '',
	@FechaPrivacidadDatos	date			= null

AS
BEGIN
	INSERT INTO PI_BA_Candidato(cveCandidato,
								Password,
								Nombre,
								Apellido,
								Confirmado,
								Correo,
								CodigoConfirmacion,
								Telefono,
								Nacionalidad,
								RFC,
								Direccion,
								NombreImagen,
								FechaPrivacidadDatos)
	VALUES (@cveCandidato,
			@Password,
			@Nombre,
			@Apellido,
			@Confirmado,
			@Correo,
			@CodigoConfirmacion,
			@Telefono,
			@Nacionalidad,
			@RFC,
			@Direccion,
			@NombreImagen,
			@FechaPrivacidadDatos)
END
GO
/****** Object:  StoredProcedure [dbo].[AddCategoria]    Script Date: 24/07/2017 03:26:35 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AddCategoria]
	@cveCategoria			varchar(50)		= '',
	@Nombre					varchar(100)	= '',
	@cveConvocatoria		varchar(50)		= '',
	@cveAplicacionGanadora	varchar(50)	= '',
	@FechaCreacion			date			= '',
	@UsuarioCreacion		varchar(50)		= '',
	@FechaEdicion			date			= '',
	@UsuarioEdicion			varchar(50)		= ''
AS
BEGIN
	INSERT INTO PI_BA_Categoria(cveCategoria, Nombre, cveConvocatoria, cveAplicacionGanadora, FechaCreacion, UsuarioCreacion, FechaEdicion, UsuarioEdicion)
	VALUES (@cveCategoria, @Nombre, @cveConvocatoria, @cveAplicacionGanadora, @FechaCreacion, @UsuarioCreacion, @FechaEdicion, @UsuarioEdicion)
END

GO
/****** Object:  StoredProcedure [dbo].[AddConvocatoria]    Script Date: 24/07/2017 03:26:35 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AddConvocatoria]
	@cveConvocatoria		varchar(50)		= '',
	@Descripcion			varchar(MAX)	= '',
	@FechaInicio			date			= '',
	@FechaFin				date			= '',
	@cvePremio				varchar(50)		= '',
	@TituloConvocatoria		varchar(100)	= '',
	@FechaVeredicto			date			= '',
	@FechaCreacion			date			= '',
	@UsuarioCreacion		varchar(50)		= '',
	@FechaEdicion			date			= '',
	@UsuarioEdicion			varchar(50)		= ''
AS
BEGIN
	INSERT INTO PI_BA_Convocatoria(cveConvocatoria, Descripcion, FechaInicio, FechaFin, cvePremio, TituloConvocatoria, FechaVeredicto, FechaCreacion,
	UsuarioCreacion, FechaEdicion, UsuarioEdicion)
	VALUES (@cveConvocatoria, @Descripcion, @FechaInicio, @FechaFin, @cvePremio, @TituloConvocatoria, @FechaVeredicto, @FechaCreacion,
	@UsuarioCreacion, @FechaEdicion, @UsuarioEdicion)
END

GO
/****** Object:  StoredProcedure [dbo].[AddEvaluacion]    Script Date: 24/07/2017 03:26:35 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AddEvaluacion]
	@cveEvaluacion		varchar(50)			= '',
	@Calificacion		smallint			= 0,
	@cveAplicacion		varchar(100)		= '',
	@cveJuez			varchar(100)		= ''
AS
BEGIN
	INSERT INTO PI_BA_Evaluacion(cveEvaluacion, Calificacion, cveAplicacion, cveJuez)
	VALUES (@cveEvaluacion, @Calificacion, @cveAplicacion, @cveJuez)
END

GO
/****** Object:  StoredProcedure [dbo].[AddForma]    Script Date: 24/07/2017 03:26:35 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AddForma]
	@cveForma			varchar(50)		= '',
	@cveCategoria		varchar(50)		= '',
	@FechaCreacion		date			= '',
	@UsuarioCreacion	varchar(50)		= '',
	@FechaEdicion		date			= '',
	@UsuarioEdicion		varchar(50)		= ''
AS
BEGIN
	INSERT INTO PI_BA_Forma(cveForma, cveCategoria, FechaCreacion, UsuarioCreacion, FechaEdicion, UsuarioEdicion)
	VALUES (@cveForma, @cveCategoria, @FechaCreacion, @UsuarioCreacion, @FechaEdicion, @UsuarioEdicion)
END

GO
/****** Object:  StoredProcedure [dbo].[AddJuez]    Script Date: 24/07/2017 03:26:35 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE [dbo].[AddJuez]
	@cveJuez		varchar(50)			= '',
	@Password		varchar(100)		= '',
	@Nombre			varchar(100)		= '',
	@Apellido		varchar(100)		= '',
	@Correo			varchar(100)		= '',
	@NombreImagen	varchar(50)			= ''

AS
BEGIN
	INSERT INTO PI_BA_Juez (cveJuez, Password, Nombre, Apellido, Correo, NombreImagen)
	VALUES (@cveJuez, @Password, @Nombre, @Apellido, @Correo, @NombreImagen)
END

GO
/****** Object:  StoredProcedure [dbo].[AddPremio]    Script Date: 24/07/2017 03:26:35 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AddPremio]
	@cvePremio			varchar(50)		= '',
	@Nombre				varchar(100)	= '',
	@NombreImagen		varchar(50)		= '',
	@Descripcion		varchar(250)	= '',
	@FechaCreacion		date			= '',
	@UsuarioCreacion	varchar(50)		= '',
	@FechaEdicion		date			= '',
	@UsuarioEdicion		varchar(50)		= ''
AS
BEGIN
	INSERT INTO PI_BA_Premio(cvePremio, Nombre, NombreImagen, Descripcion, FechaCreacion, UsuarioCreacion, FechaEdicion, UsuarioEdicion)
	VALUES (@cvePremio, @Nombre, @NombreImagen, @Descripcion, @FechaCreacion, @UsuarioCreacion, @FechaEdicion, @UsuarioEdicion)
END

GO
/****** Object:  StoredProcedure [dbo].[ConfirmarCandidato]    Script Date: 24/07/2017 03:26:35 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ConfirmarCandidato] 
	-- Add the parameters for the stored procedure here
	@CodigoConfirmacion		varchar(50)		= ''
AS
BEGIN
	UPDATE PI_BA_Candidato
	SET Confirmado = 1
	WHERE CodigoConfirmacion = @CodigoConfirmacion
END
GO
/****** Object:  StoredProcedure [dbo].[GetAdministrador]    Script Date: 24/07/2017 03:26:35 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE [dbo].[GetAdministrador]
	@Correo varchar(100)					= '',
	@cveAdministrador varchar(50)			= ''
AS
BEGIN
	-- GetAdministradorByMail
	if @Correo != '' begin
			select cveAdministrador[cveAdministrador], Password[Password], Correo[Correo]
			from PI_SE_Administrador
			where Correo = @Correo
	end

	-- GetAdministradoByID
	if @cveAdministrador != '' begin
			select cveAdministrador[cveAdministrador], Password[Password], Correo[Correo]
			from PI_SE_Administrador
			where cveAdministrador = @cveAdministrador
	end

	-- GetAdministradores
	begin
			select cveAdministrador[cveAdministrador], Password[Password], Correo[Correo]
			from PI_SE_Administrador
	end
END

GO
/****** Object:  StoredProcedure [dbo].[GetCandidato]    Script Date: 24/07/2017 03:26:35 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE [dbo].[GetCandidato]
	@Correo varchar(100)				= '',
	@cveCandidato varchar(50)			= ''
AS
BEGIN
	-- GetCandidatoByMail
	if @Correo != '' begin
			select cveCandidato[cveCandidato], Password[Password], Nombre[Nombre], Apellido[Apellido], Confirmado[Confirmado], Correo[Correo],
			CodigoConfirmacion[CodigoConfirmacion], Telefono[Telefono], Nacionalidad[Nacionalidad], RFC[RFC], Direccion[Direccion],
			NombreImagen[NombreImagen], FechaPrivacidadDatos[FechaPrivacidadDatos]
			from PI_BA_Candidato
			where Correo = @Correo
	end

	-- GetCandidatoByID
	if @cveCandidato != '' begin
			select cveCandidato[cveCandidato], Password[Password], Nombre[Nombre], Apellido[Apellido], Confirmado[Confirmado], Correo[Correo],
			CodigoConfirmacion[CodigoConfirmacion], Telefono[Telefono], Nacionalidad[Nacionalidad], RFC[RFC], Direccion[Direccion],
			NombreImagen[NombreImagen], FechaPrivacidadDatos[FechaPrivacidadDatos]
			from PI_BA_Candidato
			where cveCandidato = @cveCandidato
	end

	-- GetCandidatos
	begin
			select cveCandidato[cveCandidato], Password[Password], Nombre[Nombre], Apellido[Apellido], Confirmado[Confirmado], Correo[Correo],
			CodigoConfirmacion[CodigoConfirmacion], Telefono[Telefono], Nacionalidad[Nacionalidad], RFC[RFC], Direccion[Direccion],
			NombreImagen[NombreImagen], FechaPrivacidadDatos[FechaPrivacidadDatos]
			from PI_BA_Candidato
	end
END

GO
/****** Object:  StoredProcedure [dbo].[GetCategoria]    Script Date: 24/07/2017 03:26:35 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCategoria]
	@cveCategoria varchar(50)		= '',
	@cveConvocatoria varchar(50)		= ''

AS
BEGIN
	-- GetCategoriaById
	if @cveCategoria != '' begin
			select	cveCategoria[cveCategoria],
					Nombre[Nombre], 
					cveConvocatoria[cveConvocatoria], 
					cveAplicacionGanadora[cveAplicacionGanadora], 
					FechaCreacion[FechaCreacion], 
					UsuarioCreacion[UsuarioCreacion], 
					FechaEdicion[FechaEdicion], 
					UsuarioEdicion[UsuarioEdicion]
			from PI_BA_Categoria
			where cveCategoria = @cveCategoria
	end

	-- GetCategoriaByIdConvocatoria
	if @cveConvocatoria != '' begin
			select	cveCategoria[cveCategoria],
					Nombre[Nombre], 
					cveConvocatoria[cveConvocatoria], 
					cveAplicacionGanadora[cveAplicacionGanadora], 
					FechaCreacion[FechaCreacion], 
					UsuarioCreacion[UsuarioCreacion], 
					FechaEdicion[FechaEdicion], 
					UsuarioEdicion[UsuarioEdicion]
			from PI_BA_Categoria
			where cveConvocatoria = @cveConvocatoria
			order by Nombre desc
	end

	-- GetAllCategorias
	begin
			select	cveCategoria[cveCategoria],
					Nombre[Nombre], 
					cveConvocatoria[cveConvocatoria], 
					cveAplicacionGanadora[cveAplicacionGanadora], 
					FechaCreacion[FechaCreacion], 
					UsuarioCreacion[UsuarioCreacion], 
					FechaEdicion[FechaEdicion], 
					UsuarioEdicion[UsuarioEdicion]
			from PI_BA_Categoria
	end
END
GO
/****** Object:  StoredProcedure [dbo].[GetCategoriaByIdJuez]    Script Date: 24/07/2017 03:26:35 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ============================================= 
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[GetCategoriaByIdJuez]
	@cveJuez varchar(50)			= ''
AS
BEGIN
	select  PI_BA_Categoria.cveCategoria[cveCategoria],
			Nombre[Nombre],
			cveConvocatoria[cveConvocatoria],
			cveAplicacionGanadora[cveAplicacionGanadora],
			FechaCreacion[FechaCreacion],
			UsuarioCreacion[UsuarioCreacion],
			FechaEdicion[FechaEdicion],
			UsuarioEdicion[UsuarioEdicion]
	from PI_BA_Categoria
	INNER JOIN PI_BA_JuezPorCategoria
	ON PI_BA_Categoria.cveCategoria = PI_BA_JuezPorCategoria.cveCategoria
	where PI_BA_JuezPorCategoria.cveJuez = @cveJuez
END

GO
/****** Object:  StoredProcedure [dbo].[GetCategoriasPendientes]    Script Date: 24/07/2017 03:26:35 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCategoriasPendientes]

AS
BEGIN
	select	cveCategoria[cveCategoria],
			Nombre[Nombre], 
			cveConvocatoria[cveConvocatoria], 
			cveAplicacionGanadora[cveAplicacionGanadora], 
			FechaCreacion[FechaCreacion], 
			UsuarioCreacion[UsuarioCreacion], 
			FechaEdicion[FechaEdicion], 
			UsuarioEdicion[UsuarioEdicion]
	from PI_BA_Categoria
	where cveAplicacionGanadora IS NULL;
END
GO
/****** Object:  StoredProcedure [dbo].[GetConvocatoria]    Script Date: 24/07/2017 03:26:35 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetConvocatoria]
	@cveConvocatoria	varchar(50)	= ''
AS
BEGIN
	-- GetConvocatoriaById
	if @cveConvocatoria != '' begin
		select	cveConvocatoria[cveConvocatoria],
				Descripcion[Descripcion],
				FechaInicio[FechaInicio],
				FechaFin[FechaFin],
				cvePremio[cvePremio],
				TituloConvocatoria[TituloConvocatoria],
				FechaVeredicto[FechaVeredicto],
				FechaCreacion[FechaCreacion],
				UsuarioCreacion[UsuarioCreacion],
				FechaEdicion[FechaEdicion],
				UsuarioEdicion[UsuarioEdicion]
		from PI_BA_Convocatoria
		where cveConvocatoria = @cveConvocatoria
	end

	-- GetAllCategorias
	begin
		select	cveConvocatoria[cveConvocatoria],
				Descripcion[Descripcion],
				FechaInicio[FechaInicio],
				FechaFin[FechaFin],
				cvePremio[cvePremio],
				TituloConvocatoria[TituloConvocatoria],
				FechaVeredicto[FechaVeredicto],
				FechaCreacion[FechaCreacion],
				UsuarioCreacion[UsuarioCreacion],
				FechaEdicion[FechaEdicion],
				UsuarioEdicion[UsuarioEdicion]
		from PI_BA_Convocatoria
	end
END

GO
/****** Object:  StoredProcedure [dbo].[GetEvaluacion]    Script Date: 24/07/2017 03:26:35 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetEvaluacion]
	@cveEvaluacion varchar(50)		= '',
	@cveAplicacion varchar(50)		= '',
	@cveJuez varchar(50)			= ''

AS
BEGIN
	-- GetEvaluacionByEvaluacionId
	if @cveEvaluacion != '' begin
			select cveEvaluacion[cveEvaluacion], Calificacion[Calificacion], cveAplicacion[cveAplicacion], cveJuez[cveJuez]
			from PI_BA_Evaluacion
			where cveEvaluacion = @cveEvaluacion
	end

	-- GetEvaluacionByAplicacionAndJuez
	if @cveAplicacion != '' AND @cveJuez != '' begin
			select cveEvaluacion[cveEvaluacion], Calificacion[Calificacion], cveAplicacion[cveAplicacion], cveJuez[cveJuez]
			from PI_BA_Evaluacion
			where cveJuez = @cveJuez AND cveAplicacion = @cveAplicacion
	end

	-- GetEvaluacionesByAplicacion
	if @cveAplicacion != '' begin
			select cveEvaluacion[cveEvaluacion], Calificacion[Calificacion], cveAplicacion[cveAplicacion], cveJuez[cveJuez]
			from PI_BA_Evaluacion
			where cveAplicacion = @cveAplicacion
	end

	-- GetAllEvaluaciones
	begin
			select cveEvaluacion[cveEvaluacion], Calificacion[Calificacion], cveAplicacion[cveAplicacion], cveJuez[cveJuez]
			from PI_BA_Evaluacion
	end
END

GO
/****** Object:  StoredProcedure [dbo].[GetForma]    Script Date: 24/07/2017 03:26:35 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetForma]
	@cveForma varchar(50)		= ''

AS
BEGIN
	-- GetFormaById
	if @cveForma != '' begin
		select	cveForma[cveForma],
				cveCategoria[cveCategoria], 
				FechaCreacion[FechaCreacion], 
				UsuarioCreacion[UsuarioCreacion], 
				FechaEdicion[FechaEdicion], 
				UsuarioEdicion[UsuarioEdicion]
		from PI_BA_Forma
		where cveForma = @cveForma
	end

	-- GetAllFormas
	begin
		select	cveForma[cveForma],
				cveCategoria[cveCategoria], 
				FechaCreacion[FechaCreacion], 
				UsuarioCreacion[UsuarioCreacion], 
				FechaEdicion[FechaEdicion], 
				UsuarioEdicion[UsuarioEdicion]
		from PI_BA_Forma
	end
END
GO
/****** Object:  StoredProcedure [dbo].[GetJuez]    Script Date: 24/07/2017 03:26:35 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE [dbo].[GetJuez]
	@Correo varchar(100)			= '',
	@cveJuez varchar(50)			= ''
AS
BEGIN
	-- GetJuezByMail
	if @Correo != '' begin
			select cveJuez[cveJuez], Password[Password], Nombre[Nombre], Apellido[Apellido], Correo[Correo], NombreImagen[NombreImagen]
			from PI_BA_Juez
			where Correo = @Correo
	end

	-- GetJuezByID
	if @cveJuez != '' begin
			select cveJuez[cveJuez], Password[Password], Nombre[Nombre], Apellido[Apellido], Correo[Correo], NombreImagen[NombreImagen]
			from PI_BA_Juez
			where cveJuez = @cveJuez
	end

	-- GetJueces
	begin
			select cveJuez[cveJuez], Password[Password], Nombre[Nombre], Apellido[Apellido], Correo[Correo], NombreImagen[NombreImagen]
			from PI_BA_Juez
	end
END

GO
/****** Object:  StoredProcedure [dbo].[GetMostRecentConvocatoria]    Script Date: 24/07/2017 03:26:35 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetMostRecentConvocatoria]
	@cvePremio	varchar(50)	= ''
AS
BEGIN
	-- GetConvocatoriaById
	select	cveConvocatoria[cveConvocatoria],
			Descripcion[Descripcion],
			FechaInicio[FechaInicio],
			FechaFin[FechaFin],
			cvePremio[cvePremio],
			TituloConvocatoria[TituloConvocatoria],
			FechaVeredicto[FechaVeredicto],
			FechaCreacion[FechaCreacion],
			UsuarioCreacion[UsuarioCreacion],
			FechaEdicion[FechaEdicion],
			UsuarioEdicion[UsuarioEdicion]
	from PI_BA_Convocatoria
	where cvePremio = @cvePremio
    order by FechaFin desc
END

GO
/****** Object:  StoredProcedure [dbo].[GetPremio]    Script Date: 24/07/2017 03:26:35 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetPremio]
	@cvePremio varchar(50)		= ''

AS
BEGIN
	-- GetPremioById
	if @cvePremio != '' begin
			select	cvePremio[cvePremio],
					Nombre[Nombre],
					NombreImagen[NombreImagen],
					Descripcion[Descripcion],
					FechaCreacion[FechaCreacion],
					UsuarioCreacion[UsuarioCreacion],
					FechaEdicion[FechaEdicion],
					UsuarioEdicion[UsuarioEdicion]
			from PI_BA_Premio
			where cvePremio = @cvePremio
	end

	-- GetAllPremios
	begin
			select	cvePremio[cvePremio],
					Nombre[Nombre],
					NombreImagen[NombreImagen],
					Descripcion[Descripcion],
					FechaCreacion[FechaCreacion],
					UsuarioCreacion[UsuarioCreacion],
					FechaEdicion[FechaEdicion],
					UsuarioEdicion[UsuarioEdicion]
			from PI_BA_Premio
	end
END


GO
/****** Object:  StoredProcedure [dbo].[GetPremioByIdCategoria]    Script Date: 24/07/2017 03:26:35 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetPremioByIdCategoria]
	@cveCategoria varchar(50)			= ''
AS
BEGIN
	select  PI_BA_Premio.cvePremio[cvePremio],
			PI_BA_Premio.Nombre[Nombre],
			PI_BA_Premio.NombreImagen[NombreImagen],
			PI_BA_Premio.Descripcion[Descripcion],
			PI_BA_Premio.FechaCreacion[FechaCreacion],
			PI_BA_Premio.UsuarioCreacion[UsuarioCreacion],
			PI_BA_Premio.FechaEdicion[FechaEdicion],
			PI_BA_Premio.UsuarioEdicion[UsuarioEdicion]
	from PI_BA_Premio
	INNER JOIN PI_BA_Convocatoria
	ON PI_BA_Convocatoria.cvePremio = PI_BA_Premio.cvePremio
	INNER JOIN PI_BA_Categoria
	ON PI_BA_Convocatoria.cveConvocatoria = PI_BA_Categoria.cveConvocatoria
	where PI_BA_Categoria.cveCategoria = @cveCategoria
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateAdministrador]    Script Date: 24/07/2017 03:26:35 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateAdministrador]
	@cveAdministrador	varchar(50)			= '',
	@Password			varchar(100)		= '',
	@Correo				varchar(100)		= ''

AS
BEGIN
	UPDATE PI_SE_Administrador
	SET cveAdministrador = @cveAdministrador,
		Password = @Password,
		Correo = @Correo
	WHERE Correo = @Correo
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateCandidato]    Script Date: 24/07/2017 03:26:35 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE [dbo].[UpdateCandidato]
	@cveCandidato			varchar(50)		= '',
	@Password				varchar(100)	= '',
	@Nombre					varchar(100)	= '',
	@Apellido				varchar(100)	= '',
	@Confirmado				bit				= null,
	@Correo					varchar(100)	= '',
	@CodigoConfirmacion		varchar(50)		= '',
	@Telefono				varchar(50)		= '',
	@Nacionalidad			varchar(50)		= '',
	@RFC					varchar(50)		= '',
	@Direccion				varchar(50)		= '',
	@NombreImagen			varchar(50)		= '',
	@FechaPrivacidadDatos	date			= null

AS
BEGIN
	UPDATE PI_BA_Candidato
	SET cveCandidato = @cveCandidato,
		Password = @Password,
		Nombre = @Nombre,
		Apellido = @Apellido,
		Confirmado = @Confirmado,
		Correo = @Correo,
		CodigoConfirmacion = @CodigoConfirmacion,
		Telefono = @Telefono,
		Nacionalidad = @Nacionalidad,
		RFC = @RFC,
		Direccion = @Direccion,
		NombreImagen = @NombreImagen,
		FechaPrivacidadDatos = @FechaPrivacidadDatos
	WHERE Correo = @Correo
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateEvaluacion]    Script Date: 24/07/2017 03:26:35 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateEvaluacion]
	@cveEvaluacion		varchar(50)			= '',
	@Calificacion		smallint			= 0,
	@cveAplicacion		varchar(100)		= '',
	@cveJuez			varchar(100)		= ''
AS
BEGIN
	UPDATE PI_BA_Evaluacion
	SET cveEvaluacion = @cveEvaluacion,
		Calificacion = @Calificacion,
		cveAplicacion = @cveAplicacion,
		cveJuez = @cveJuez
	WHERE cveEvaluacion = @cveEvaluacion
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateJuez]    Script Date: 24/07/2017 03:26:35 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE [dbo].[UpdateJuez]
	@cveJuez		varchar(50)			= '',
	@Password		varchar(100)		= '',
	@Nombre			varchar(100)		= '',
	@Apellido		varchar(100)		= '',
	@Correo			varchar(100)		= '',
	@NombreImagen	varchar(50)			= ''

AS
BEGIN
	UPDATE PI_BA_Juez
	SET cveJuez = @cveJuez,
		Password = @Password,
		Nombre = @Nombre,
		Apellido = @Apellido,
		Correo = @Correo,
		NombreImagen = @NombreImagen
	WHERE Correo = @Correo
END
GO
/****** Object:  StoredProcedure [dbo].[UpdatePremio]    Script Date: 24/07/2017 03:26:35 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdatePremio]
	@cvePremio			varchar(50)		= '',
	@Nombre				varchar(100)	= '',
	@NombreImagen		varchar(50)		= '',
	@Descripcion		varchar(250)	= '',
	@FechaCreacion		date			= '',
	@UsuarioCreacion	varchar(50)		= '',
	@FechaEdicion		date			= '',
	@UsuarioEdicion		varchar(50)		= ''
AS
BEGIN
	UPDATE PI_BA_Premio
	SET cvePremio = @cvePremio,
		Nombre = @Nombre,
		NombreImagen = @NombreImagen,
		Descripcion = @Descripcion,
		FechaCreacion = @FechaCreacion,
		UsuarioCreacion = @UsuarioCreacion,
		FechaEdicion = @FechaEdicion,
		UsuarioEdicion = @UsuarioEdicion
	WHERE cvePremio = @cvePremio
END
GO
