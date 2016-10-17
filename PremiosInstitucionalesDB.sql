USE [master]
GO
/****** Object:  Database [wPremiosInstitucionalesdb]    Script Date: 10/17/2016 4:56:51 PM ******/
CREATE DATABASE [wPremiosInstitucionalesdb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'wPremiosInstitucionalesdb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL2014\MSSQL\DATA\wPremiosInstitucionalesdb.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'wPremiosInstitucionalesdb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL2014\MSSQL\DATA\wPremiosInstitucionalesdb_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [wPremiosInstitucionalesdb] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [wPremiosInstitucionalesdb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [wPremiosInstitucionalesdb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [wPremiosInstitucionalesdb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [wPremiosInstitucionalesdb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [wPremiosInstitucionalesdb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [wPremiosInstitucionalesdb] SET ARITHABORT OFF 
GO
ALTER DATABASE [wPremiosInstitucionalesdb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [wPremiosInstitucionalesdb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [wPremiosInstitucionalesdb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [wPremiosInstitucionalesdb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [wPremiosInstitucionalesdb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [wPremiosInstitucionalesdb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [wPremiosInstitucionalesdb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [wPremiosInstitucionalesdb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [wPremiosInstitucionalesdb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [wPremiosInstitucionalesdb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [wPremiosInstitucionalesdb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [wPremiosInstitucionalesdb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [wPremiosInstitucionalesdb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [wPremiosInstitucionalesdb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [wPremiosInstitucionalesdb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [wPremiosInstitucionalesdb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [wPremiosInstitucionalesdb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [wPremiosInstitucionalesdb] SET RECOVERY FULL 
GO
ALTER DATABASE [wPremiosInstitucionalesdb] SET  MULTI_USER 
GO
ALTER DATABASE [wPremiosInstitucionalesdb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [wPremiosInstitucionalesdb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [wPremiosInstitucionalesdb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [wPremiosInstitucionalesdb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [wPremiosInstitucionalesdb] SET DELAYED_DURABILITY = DISABLED 
GO
USE [wPremiosInstitucionalesdb]
GO
/****** Object:  Table [dbo].[PI_BA_Aplicacion]    Script Date: 10/17/2016 4:56:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PI_BA_Aplicacion](
	[cveAplicacion] [varchar](50) NOT NULL,
	[Ganador] [bit] NULL,
	[Status] [varchar](20) NULL,
	[cveCandidato] [varchar](50) NULL,
 CONSTRAINT [PK_PI_BA_Aplicacion] PRIMARY KEY CLUSTERED 
(
	[cveAplicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PI_BA_Candidato]    Script Date: 10/17/2016 4:56:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PI_BA_Candidato](
	[cveCandidato] [varchar](50) NOT NULL,
	[UserName] [varchar](100) NULL,
	[Password] [varchar](100) NULL,
	[Nombre] [varchar](100) NULL,
	[Apellido] [varchar](100) NULL,
	[Confirmado] [bit] NULL,
	[Correo] [varchar](100) NULL,
 CONSTRAINT [PK_PI_BA_Candidato] PRIMARY KEY CLUSTERED 
(
	[cveCandidato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PI_BA_Categoria]    Script Date: 10/17/2016 4:56:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PI_BA_Categoria](
	[cveCategoria] [varchar](50) NOT NULL,
	[Nombre] [varchar](100) NULL,
	[cveConvocatoria] [varchar](50) NULL,
 CONSTRAINT [PK_PI_BA_Categoria] PRIMARY KEY CLUSTERED 
(
	[cveCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PI_BA_Convocatoria]    Script Date: 10/17/2016 4:56:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PI_BA_Convocatoria](
	[cveConvocatoria] [varchar](50) NOT NULL,
	[Descripcion] [varchar](max) NULL,
	[FechaInicio] [date] NULL,
	[FechaFin] [date] NULL,
	[cvePremio] [varchar](50) NULL,
	[TituloConvocatoria] [varchar](100) NULL,
 CONSTRAINT [PK_PI_BA_Convocatoria] PRIMARY KEY CLUSTERED 
(
	[cveConvocatoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PI_BA_Evaluacion]    Script Date: 10/17/2016 4:56:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PI_BA_Evaluacion](
	[cveEvaluacion] [varchar](50) NOT NULL,
	[Calificacion] [smallint] NULL,
	[cveRespuesta] [varchar](50) NULL,
	[cveJuez] [varchar](50) NULL,
 CONSTRAINT [PK_PI_BA_Evaluacion] PRIMARY KEY CLUSTERED 
(
	[cveEvaluacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PI_BA_Forma]    Script Date: 10/17/2016 4:56:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PI_BA_Forma](
	[cveForma] [varchar](50) NOT NULL,
	[cveCategoria] [varchar](50) NULL,
 CONSTRAINT [PK_PI_BA_Forma] PRIMARY KEY CLUSTERED 
(
	[cveForma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PI_BA_Juez]    Script Date: 10/17/2016 4:56:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PI_BA_Juez](
	[cveJuez] [varchar](50) NOT NULL,
	[UserName] [varchar](100) NULL,
	[Password] [varchar](100) NULL,
	[Nombre] [varchar](100) NULL,
	[Apellido] [varchar](100) NULL,
	[Correo] [varchar](100) NULL,
 CONSTRAINT [PK_PI_BA_Juez] PRIMARY KEY CLUSTERED 
(
	[cveJuez] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PI_BA_JuezPorCategoria]    Script Date: 10/17/2016 4:56:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PI_BA_Pregunta]    Script Date: 10/17/2016 4:56:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PI_BA_Pregunta](
	[cvePregunta] [varchar](50) NOT NULL,
	[Texto] [varchar](100) NULL,
	[IdentificadorObjeto] [varchar](100) NULL,
	[TipoCampo] [char](5) NULL,
 CONSTRAINT [PK_PI_BA_Pregunta] PRIMARY KEY CLUSTERED 
(
	[cvePregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PI_BA_PreguntasPorForma]    Script Date: 10/17/2016 4:56:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PI_BA_Premio]    Script Date: 10/17/2016 4:56:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PI_BA_Premio](
	[cvePremio] [varchar](50) NOT NULL,
	[Nombre] [varchar](100) NULL,
	[NombreImagen] [varchar](50) NULL,
 CONSTRAINT [PK_PI_BA_Premio] PRIMARY KEY CLUSTERED 
(
	[cvePremio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PI_BA_Respuesta]    Script Date: 10/17/2016 4:56:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PI_BA_Respuesta](
	[cveRespuesta] [varchar](50) NOT NULL,
	[Valor] [varchar](200) NULL,
	[cvePregunta] [varchar](50) NULL,
	[cveAplicacion] [varchar](50) NULL,
 CONSTRAINT [PK_PI_BA_Respuesta] PRIMARY KEY CLUSTERED 
(
	[cveRespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PI_SE_Administrador]    Script Date: 10/17/2016 4:56:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PI_SE_Administrador](
	[CveAdministrador] [varchar](50) NOT NULL,
	[UserName] [varchar](100) NULL,
	[Password] [varchar](100) NULL,
	[Correo] [varchar](100) NULL,
 CONSTRAINT [PK_PI_SE_Administrador] PRIMARY KEY CLUSTERED 
(
	[CveAdministrador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[PI_BA_Aplicacion]  WITH CHECK ADD  CONSTRAINT [FK_PI_BA_Aplicacion_PI_BA_Candidato] FOREIGN KEY([cveCandidato])
REFERENCES [dbo].[PI_BA_Candidato] ([cveCandidato])
GO
ALTER TABLE [dbo].[PI_BA_Aplicacion] CHECK CONSTRAINT [FK_PI_BA_Aplicacion_PI_BA_Candidato]
GO
ALTER TABLE [dbo].[PI_BA_Categoria]  WITH CHECK ADD  CONSTRAINT [FK_PI_BA_Categoria_PI_BA_Convocatoria] FOREIGN KEY([cveConvocatoria])
REFERENCES [dbo].[PI_BA_Convocatoria] ([cveConvocatoria])
GO
ALTER TABLE [dbo].[PI_BA_Categoria] CHECK CONSTRAINT [FK_PI_BA_Categoria_PI_BA_Convocatoria]
GO
ALTER TABLE [dbo].[PI_BA_Convocatoria]  WITH CHECK ADD  CONSTRAINT [FK_PI_BA_Convocatoria_PI_BA_Premio] FOREIGN KEY([cvePremio])
REFERENCES [dbo].[PI_BA_Premio] ([cvePremio])
GO
ALTER TABLE [dbo].[PI_BA_Convocatoria] CHECK CONSTRAINT [FK_PI_BA_Convocatoria_PI_BA_Premio]
GO
ALTER TABLE [dbo].[PI_BA_Evaluacion]  WITH CHECK ADD  CONSTRAINT [FK_PI_BA_Evaluacion_PI_BA_Juez] FOREIGN KEY([cveEvaluacion])
REFERENCES [dbo].[PI_BA_Juez] ([cveJuez])
GO
ALTER TABLE [dbo].[PI_BA_Evaluacion] CHECK CONSTRAINT [FK_PI_BA_Evaluacion_PI_BA_Juez]
GO
ALTER TABLE [dbo].[PI_BA_Evaluacion]  WITH CHECK ADD  CONSTRAINT [FK_PI_BA_Evaluacion_PI_BA_Respuesta] FOREIGN KEY([cveEvaluacion])
REFERENCES [dbo].[PI_BA_Respuesta] ([cveRespuesta])
GO
ALTER TABLE [dbo].[PI_BA_Evaluacion] CHECK CONSTRAINT [FK_PI_BA_Evaluacion_PI_BA_Respuesta]
GO
ALTER TABLE [dbo].[PI_BA_Forma]  WITH CHECK ADD  CONSTRAINT [FK_PI_BA_Forma_PI_BA_Categoria] FOREIGN KEY([cveCategoria])
REFERENCES [dbo].[PI_BA_Categoria] ([cveCategoria])
GO
ALTER TABLE [dbo].[PI_BA_Forma] CHECK CONSTRAINT [FK_PI_BA_Forma_PI_BA_Categoria]
GO
ALTER TABLE [dbo].[PI_BA_JuezPorCategoria]  WITH CHECK ADD  CONSTRAINT [FK_PI_BA_JuezPorCategoria_PI_BA_Categoria] FOREIGN KEY([cveJuezPorCategoria])
REFERENCES [dbo].[PI_BA_Categoria] ([cveCategoria])
GO
ALTER TABLE [dbo].[PI_BA_JuezPorCategoria] CHECK CONSTRAINT [FK_PI_BA_JuezPorCategoria_PI_BA_Categoria]
GO
ALTER TABLE [dbo].[PI_BA_JuezPorCategoria]  WITH CHECK ADD  CONSTRAINT [FK_PI_BA_JuezPorCategoria_PI_BA_Juez] FOREIGN KEY([cveJuez])
REFERENCES [dbo].[PI_BA_Juez] ([cveJuez])
GO
ALTER TABLE [dbo].[PI_BA_JuezPorCategoria] CHECK CONSTRAINT [FK_PI_BA_JuezPorCategoria_PI_BA_Juez]
GO
ALTER TABLE [dbo].[PI_BA_PreguntasPorForma]  WITH CHECK ADD  CONSTRAINT [FK_PI_BA_PreguntasPorForma_PI_BA_Forma] FOREIGN KEY([cveForma])
REFERENCES [dbo].[PI_BA_Forma] ([cveForma])
GO
ALTER TABLE [dbo].[PI_BA_PreguntasPorForma] CHECK CONSTRAINT [FK_PI_BA_PreguntasPorForma_PI_BA_Forma]
GO
ALTER TABLE [dbo].[PI_BA_PreguntasPorForma]  WITH CHECK ADD  CONSTRAINT [FK_PI_BA_PreguntasPorForma_PI_BA_Pregunta] FOREIGN KEY([cvePregunta])
REFERENCES [dbo].[PI_BA_Pregunta] ([cvePregunta])
GO
ALTER TABLE [dbo].[PI_BA_PreguntasPorForma] CHECK CONSTRAINT [FK_PI_BA_PreguntasPorForma_PI_BA_Pregunta]
GO
ALTER TABLE [dbo].[PI_BA_Respuesta]  WITH CHECK ADD  CONSTRAINT [FK_PI_BA_Respuesta_PI_BA_Aplicacion] FOREIGN KEY([cveAplicacion])
REFERENCES [dbo].[PI_BA_Aplicacion] ([cveAplicacion])
GO
ALTER TABLE [dbo].[PI_BA_Respuesta] CHECK CONSTRAINT [FK_PI_BA_Respuesta_PI_BA_Aplicacion]
GO
ALTER TABLE [dbo].[PI_BA_Respuesta]  WITH CHECK ADD  CONSTRAINT [FK_PI_BA_Respuesta_PI_BA_Pregunta] FOREIGN KEY([cvePregunta])
REFERENCES [dbo].[PI_BA_Pregunta] ([cvePregunta])
GO
ALTER TABLE [dbo].[PI_BA_Respuesta] CHECK CONSTRAINT [FK_PI_BA_Respuesta_PI_BA_Pregunta]
GO
USE [master]
GO
ALTER DATABASE [wPremiosInstitucionalesdb] SET  READ_WRITE 
GO
