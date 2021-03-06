USE [master]
GO
/****** Object:  Database [CINEMARK]    Script Date: 01/05/2020 11:21:54 ******/
CREATE DATABASE [CINEMARK]
 WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS
GO
ALTER DATABASE [CINEMARK] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CINEMARK].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CINEMARK] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CINEMARK] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CINEMARK] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CINEMARK] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CINEMARK] SET ARITHABORT OFF 
GO
ALTER DATABASE [CINEMARK] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CINEMARK] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CINEMARK] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CINEMARK] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CINEMARK] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CINEMARK] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CINEMARK] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CINEMARK] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CINEMARK] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CINEMARK] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CINEMARK] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [CINEMARK] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CINEMARK] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [CINEMARK] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CINEMARK] SET  MULTI_USER 
GO
ALTER DATABASE [CINEMARK] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CINEMARK] SET ENCRYPTION ON
GO
ALTER DATABASE [CINEMARK] SET QUERY_STORE = ON
GO
ALTER DATABASE [CINEMARK] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 100, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [CINEMARK]
GO
/****** Object:  Table [dbo].[AcontecimientoCultural]    Script Date: 01/05/2020 11:21:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AcontecimientoCultural](
	[IdExhibicion] [nvarchar](6) NOT NULL,
	[NombreCompositor] [nvarchar](100) NOT NULL,
	[LugarDeGrabado] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_AcontecimientoCultural] PRIMARY KEY CLUSTERED 
(
	[IdExhibicion] ASC,
	[NombreCompositor] ASC,
	[LugarDeGrabado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AcontecimientoDeportivo]    Script Date: 01/05/2020 11:21:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AcontecimientoDeportivo](
	[IdExhibicionE] [nvarchar](6) NOT NULL,
	[Deporte] [nvarchar](50) NOT NULL,
	[LugarDeOrigen] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_AcontecimientoDeportivo] PRIMARY KEY CLUSTERED 
(
	[IdExhibicionE] ASC,
	[Deporte] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Actor]    Script Date: 01/05/2020 11:21:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actor](
	[NombreArtistico] [nvarchar](50) NOT NULL,
	[Nacionalidad] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Actor] PRIMARY KEY CLUSTERED 
(
	[NombreArtistico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Boleto]    Script Date: 01/05/2020 11:21:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Boleto](
	[IDCompra] [nvarchar](50) NOT NULL,
	[IdCine] [nvarchar](6) NOT NULL,
	[IdEvento] [nvarchar](6) NOT NULL,
	[Precio] [numeric](8, 2) NOT NULL,
 CONSTRAINT [PK_Boleto] PRIMARY KEY CLUSTERED 
(
	[IDCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cartelera]    Script Date: 01/05/2020 11:21:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cartelera](
	[IdContenido] [nvarchar](6) NOT NULL,
	[No.Sala] [int] NOT NULL,
	[FechaExhibicion] [datetime] NOT NULL,
 CONSTRAINT [PK_Cartelera] PRIMARY KEY CLUSTERED 
(
	[IdContenido] ASC,
	[No.Sala] ASC,
	[FechaExhibicion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cine]    Script Date: 01/05/2020 11:21:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cine](
	[IdCine] [nvarchar](6) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Telefono] [nvarchar](8) NOT NULL,
	[Direccion] [nvarchar](300) NOT NULL,
 CONSTRAINT [PK_Cine] PRIMARY KEY CLUSTERED 
(
	[IdCine] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 01/05/2020 11:21:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[NIT] [nvarchar](8) NOT NULL,
	[Direccion] [nvarchar](200) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[NIT] ASC,
	[Direccion] ASC,
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Compra]    Script Date: 01/05/2020 11:21:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compra](
	[IDCompra] [nvarchar](50) NOT NULL,
	[IdCine] [nvarchar](6) NOT NULL,
 CONSTRAINT [PK_Compra] PRIMARY KEY CLUSTERED 
(
	[IDCompra] ASC,
	[IdCine] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contenido]    Script Date: 01/05/2020 11:21:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contenido](
	[IdContenido] [nvarchar](6) NOT NULL,
	[Titulo] [nvarchar](50) NOT NULL,
	[Genero] [nvarchar](50) NOT NULL,
	[TipoFormato] [nvarchar](50) NOT NULL,
	[Duracion] [nvarchar](50) NOT NULL,
	[Distribuidora] [nvarchar](100) NOT NULL,
	[Director] [nvarchar](200) NOT NULL,
	[Año] [nvarchar](50) NOT NULL,
	[PaisProduccion] [nvarchar](50) NOT NULL,
	[EdadRecomendada] [nvarchar](50) NOT NULL,
	[Descripción] [nvarchar](300) NOT NULL,
 CONSTRAINT [PK_Contenido] PRIMARY KEY CLUSTERED 
(
	[IdContenido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 01/05/2020 11:21:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[CodigoEmpleado] [nvarchar](6) NOT NULL,
	[Nombre] [nvarchar](50) NULL,
	[Apellido] [nvarchar](50) NULL,
	[FechaNacimiento] [date] NULL,
	[Salario] [numeric](10, 2) NULL,
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[CodigoEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Evento]    Script Date: 01/05/2020 11:21:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Evento](
	[No.Sala] [int] NOT NULL,
	[IdContenido] [nvarchar](6) NOT NULL,
	[IdEvento] [nvarchar](6) NOT NULL,
	[Programador] [nvarchar](200) NOT NULL,
	[HoraInicio] [time](7) NOT NULL,
	[Cine] [nvarchar](6) NOT NULL,
 CONSTRAINT [PK_Evento] PRIMARY KEY CLUSTERED 
(
	[IdEvento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExhibicionEspecial]    Script Date: 01/05/2020 11:21:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExhibicionEspecial](
	[IdContenido] [nvarchar](6) NOT NULL,
	[IdExhibicionE] [nvarchar](6) NOT NULL,
 CONSTRAINT [PK_ExhibicionEspecial] PRIMARY KEY CLUSTERED 
(
	[IdExhibicionE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 01/05/2020 11:21:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura](
	[NIT] [nvarchar](8) NOT NULL,
	[Direccion] [nvarchar](200) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[IDCompra] [nvarchar](50) NOT NULL,
	[IdCine] [nvarchar](6) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Interprete]    Script Date: 01/05/2020 11:21:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Interprete](
	[NombreInterprete] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Interprete] PRIMARY KEY CLUSTERED 
(
	[NombreInterprete] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InterpretesExhibicion]    Script Date: 01/05/2020 11:21:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InterpretesExhibicion](
	[IdExhibicion] [nvarchar](6) NOT NULL,
	[NombreInterprete] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_InterpretesExhibicion] PRIMARY KEY CLUSTERED 
(
	[IdExhibicion] ASC,
	[NombreInterprete] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Opinion]    Script Date: 01/05/2020 11:21:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Opinion](
	[IdContenido] [nvarchar](6) NOT NULL,
	[NombrePersona] [nvarchar](100) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Edad] [nvarchar](50) NOT NULL,
	[Calificacion] [nvarchar](50) NOT NULL,
	[Comentario] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Opinion] PRIMARY KEY CLUSTERED 
(
	[IdContenido] ASC,
	[NombrePersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PeliculaRegular]    Script Date: 01/05/2020 11:21:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PeliculaRegular](
	[IdContenido] [nvarchar](6) NOT NULL,
	[IdPelicula] [nvarchar](6) NOT NULL,
 CONSTRAINT [PK_PeliculaRegular] PRIMARY KEY CLUSTERED 
(
	[IdPelicula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductoDulceria]    Script Date: 01/05/2020 11:21:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductoDulceria](
	[IDCompra] [nvarchar](50) NOT NULL,
	[IdCine] [nvarchar](6) NOT NULL,
	[Producto] [nvarchar](100) NOT NULL,
	[Precio] [numeric](8, 2) NOT NULL,
	[Tamaño] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ProductoDulceria] PRIMARY KEY CLUSTERED 
(
	[IDCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegistroHistorico]    Script Date: 01/05/2020 11:21:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegistroHistorico](
	[IdContenido] [nvarchar](6) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[FechaUltimaExhibición] [datetime] NOT NULL,
 CONSTRAINT [PK_RegistroHistorico] PRIMARY KEY CLUSTERED 
(
	[IdContenido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegistroRotacion]    Script Date: 01/05/2020 11:21:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegistroRotacion](
	[IdCine] [nvarchar](6) NOT NULL,
	[CodigoEmpleado] [nvarchar](6) NOT NULL,
 CONSTRAINT [PK_Registro Rotación] PRIMARY KEY CLUSTERED 
(
	[IdCine] ASC,
	[CodigoEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reparto]    Script Date: 01/05/2020 11:21:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reparto](
	[NombreActor] [nvarchar](50) NOT NULL,
	[IdPelicula] [nvarchar](6) NOT NULL,
	[NombrePersonaje] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Reparto] PRIMARY KEY CLUSTERED 
(
	[NombreActor] ASC,
	[IdPelicula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReporteBajas]    Script Date: 01/05/2020 11:21:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReporteBajas](
	[IdCine] [nvarchar](6) NOT NULL,
	[CodigoEmpleado] [nvarchar](6) NOT NULL,
	[Fecha] [date] NOT NULL,
	[Motivo] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Reporte Bajas] PRIMARY KEY CLUSTERED 
(
	[IdCine] ASC,
	[CodigoEmpleado] ASC,
	[Fecha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sala]    Script Date: 01/05/2020 11:21:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sala](
	[No.Sala] [int] NOT NULL,
	[Capacidad] [nvarchar](50) NOT NULL,
	[HoraApertura] [time](7) NOT NULL,
	[HoraDescanso] [time](7) NOT NULL,
	[Dispone3D] [nvarchar](50) NOT NULL,
	[IdCine] [nvarchar](6) NOT NULL,
 CONSTRAINT [PK_Sala] PRIMARY KEY CLUSTERED 
(
	[No.Sala] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sysdiagrams]    Script Date: 01/05/2020 11:21:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sysdiagrams](
	[name] [sysname] NOT NULL,
	[principal_id] [int] NOT NULL,
	[diagram_id] [int] IDENTITY(1,1) NOT NULL,
	[version] [int] NULL,
	[definition] [varbinary](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[diagram_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[AcontecimientoCultural] ([IdExhibicion], [NombreCompositor], [LugarDeGrabado]) VALUES (N'3', N'JosÚ Orellana', N'Estados Unidos')
INSERT [dbo].[AcontecimientoCultural] ([IdExhibicion], [NombreCompositor], [LugarDeGrabado]) VALUES (N'4', N'Ricardo PÚrez', N'Mexico')
INSERT [dbo].[AcontecimientoCultural] ([IdExhibicion], [NombreCompositor], [LugarDeGrabado]) VALUES (N'5', N'Diego Sican', N'Guatemala')
INSERT [dbo].[AcontecimientoDeportivo] ([IdExhibicionE], [Deporte], [LugarDeOrigen]) VALUES (N'1', N'Futbol', N'Espa±a')
INSERT [dbo].[AcontecimientoDeportivo] ([IdExhibicionE], [Deporte], [LugarDeOrigen]) VALUES (N'2', N'Futbol', N'Espa±a')
INSERT [dbo].[Actor] ([NombreArtistico], [Nacionalidad]) VALUES (N'Adam Sandler', N'Estadounidense')
INSERT [dbo].[Actor] ([NombreArtistico], [Nacionalidad]) VALUES (N'Ansel Elgort', N'Estadounidense')
INSERT [dbo].[Actor] ([NombreArtistico], [Nacionalidad]) VALUES (N'Brad Pitt', N'Estadounidense')
INSERT [dbo].[Actor] ([NombreArtistico], [Nacionalidad]) VALUES (N'Carrie Fisher', N'Estadounidense')
INSERT [dbo].[Actor] ([NombreArtistico], [Nacionalidad]) VALUES (N'Chris Evans', N'Estadounidense')
INSERT [dbo].[Actor] ([NombreArtistico], [Nacionalidad]) VALUES (N'Dakota Fanning', N'Estadounidense')
INSERT [dbo].[Actor] ([NombreArtistico], [Nacionalidad]) VALUES (N'Dwayne Johnson', N'Estadounidense')
INSERT [dbo].[Actor] ([NombreArtistico], [Nacionalidad]) VALUES (N'Emma Watson', N'Estadounidense')
INSERT [dbo].[Actor] ([NombreArtistico], [Nacionalidad]) VALUES (N'Eugenio Derbez', N'Mexicano')
INSERT [dbo].[Actor] ([NombreArtistico], [Nacionalidad]) VALUES (N'Leonardo Dicaprio', N'Estadounidense')
INSERT [dbo].[Actor] ([NombreArtistico], [Nacionalidad]) VALUES (N'Miley Cirus', N'Estadounidense')
INSERT [dbo].[Actor] ([NombreArtistico], [Nacionalidad]) VALUES (N'Robbin Downey', N'Estadounidense')
INSERT [dbo].[Actor] ([NombreArtistico], [Nacionalidad]) VALUES (N'Salma Hallet', N'Mexicana')
INSERT [dbo].[Actor] ([NombreArtistico], [Nacionalidad]) VALUES (N'Scarleth Johansson', N'Estadounidense')
INSERT [dbo].[Actor] ([NombreArtistico], [Nacionalidad]) VALUES (N'Tobey Maguire', N'Estadounidense')
INSERT [dbo].[Actor] ([NombreArtistico], [Nacionalidad]) VALUES (N'Vin Diesel', N'Estadounidense')
INSERT [dbo].[Actor] ([NombreArtistico], [Nacionalidad]) VALUES (N'Zack Efron', N'Estadounidense')
INSERT [dbo].[Cartelera] ([IdContenido], [No.Sala], [FechaExhibicion]) VALUES (N'1', 1, CAST(N'2020-04-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Cartelera] ([IdContenido], [No.Sala], [FechaExhibicion]) VALUES (N'1', 2, CAST(N'2020-04-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Cartelera] ([IdContenido], [No.Sala], [FechaExhibicion]) VALUES (N'10', 1, CAST(N'2020-04-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Cartelera] ([IdContenido], [No.Sala], [FechaExhibicion]) VALUES (N'10', 26, CAST(N'2020-04-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Cartelera] ([IdContenido], [No.Sala], [FechaExhibicion]) VALUES (N'101', 16, CAST(N'2020-04-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Cartelera] ([IdContenido], [No.Sala], [FechaExhibicion]) VALUES (N'101', 32, CAST(N'2020-04-08T00:00:00.000' AS DateTime))
INSERT [dbo].[Cartelera] ([IdContenido], [No.Sala], [FechaExhibicion]) VALUES (N'102', 17, CAST(N'2020-04-08T00:00:00.000' AS DateTime))
INSERT [dbo].[Cartelera] ([IdContenido], [No.Sala], [FechaExhibicion]) VALUES (N'102', 33, CAST(N'2020-04-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Cartelera] ([IdContenido], [No.Sala], [FechaExhibicion]) VALUES (N'11', 11, CAST(N'2020-04-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Cartelera] ([IdContenido], [No.Sala], [FechaExhibicion]) VALUES (N'11', 27, CAST(N'2020-04-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Cartelera] ([IdContenido], [No.Sala], [FechaExhibicion]) VALUES (N'12', 12, CAST(N'2020-04-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Cartelera] ([IdContenido], [No.Sala], [FechaExhibicion]) VALUES (N'12', 28, CAST(N'2020-04-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Cartelera] ([IdContenido], [No.Sala], [FechaExhibicion]) VALUES (N'13', 13, CAST(N'2020-04-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Cartelera] ([IdContenido], [No.Sala], [FechaExhibicion]) VALUES (N'13', 29, CAST(N'2020-04-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Cartelera] ([IdContenido], [No.Sala], [FechaExhibicion]) VALUES (N'14', 3, CAST(N'2020-04-08T00:00:00.000' AS DateTime))
INSERT [dbo].[Cartelera] ([IdContenido], [No.Sala], [FechaExhibicion]) VALUES (N'14', 14, CAST(N'2020-04-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Cartelera] ([IdContenido], [No.Sala], [FechaExhibicion]) VALUES (N'15', 15, CAST(N'2020-04-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Cartelera] ([IdContenido], [No.Sala], [FechaExhibicion]) VALUES (N'15', 31, CAST(N'2020-04-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Cartelera] ([IdContenido], [No.Sala], [FechaExhibicion]) VALUES (N'2', 2, CAST(N'2020-04-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Cartelera] ([IdContenido], [No.Sala], [FechaExhibicion]) VALUES (N'2', 21, CAST(N'2020-04-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Cartelera] ([IdContenido], [No.Sala], [FechaExhibicion]) VALUES (N'2', 41, CAST(N'2020-04-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Cartelera] ([IdContenido], [No.Sala], [FechaExhibicion]) VALUES (N'2', 42, CAST(N'2020-04-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Cartelera] ([IdContenido], [No.Sala], [FechaExhibicion]) VALUES (N'2', 43, CAST(N'2020-04-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Cartelera] ([IdContenido], [No.Sala], [FechaExhibicion]) VALUES (N'2', 44, CAST(N'2020-04-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Cartelera] ([IdContenido], [No.Sala], [FechaExhibicion]) VALUES (N'202', 18, CAST(N'2020-04-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Cartelera] ([IdContenido], [No.Sala], [FechaExhibicion]) VALUES (N'202', 34, CAST(N'2020-04-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Cartelera] ([IdContenido], [No.Sala], [FechaExhibicion]) VALUES (N'203', 19, CAST(N'2020-04-08T00:00:00.000' AS DateTime))
INSERT [dbo].[Cartelera] ([IdContenido], [No.Sala], [FechaExhibicion]) VALUES (N'203', 35, CAST(N'2020-04-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Cartelera] ([IdContenido], [No.Sala], [FechaExhibicion]) VALUES (N'3', 3, CAST(N'2020-04-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Cartelera] ([IdContenido], [No.Sala], [FechaExhibicion]) VALUES (N'3', 4, CAST(N'2020-04-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Cartelera] ([IdContenido], [No.Sala], [FechaExhibicion]) VALUES (N'3', 22, CAST(N'2020-04-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Cartelera] ([IdContenido], [No.Sala], [FechaExhibicion]) VALUES (N'3', 36, CAST(N'2020-04-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Cartelera] ([IdContenido], [No.Sala], [FechaExhibicion]) VALUES (N'3', 37, CAST(N'2020-04-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Cartelera] ([IdContenido], [No.Sala], [FechaExhibicion]) VALUES (N'3', 38, CAST(N'2020-04-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Cartelera] ([IdContenido], [No.Sala], [FechaExhibicion]) VALUES (N'3', 39, CAST(N'2020-04-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Cartelera] ([IdContenido], [No.Sala], [FechaExhibicion]) VALUES (N'3', 45, CAST(N'2020-04-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Cartelera] ([IdContenido], [No.Sala], [FechaExhibicion]) VALUES (N'4', 4, CAST(N'2020-04-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Cartelera] ([IdContenido], [No.Sala], [FechaExhibicion]) VALUES (N'4', 23, CAST(N'2020-04-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Cartelera] ([IdContenido], [No.Sala], [FechaExhibicion]) VALUES (N'8', 8, CAST(N'2020-04-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Cartelera] ([IdContenido], [No.Sala], [FechaExhibicion]) VALUES (N'8', 24, CAST(N'2020-04-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Cartelera] ([IdContenido], [No.Sala], [FechaExhibicion]) VALUES (N'9', 9, CAST(N'2020-04-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Cartelera] ([IdContenido], [No.Sala], [FechaExhibicion]) VALUES (N'9', 25, CAST(N'2020-04-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Cine] ([IdCine], [Nombre], [Telefono], [Direccion]) VALUES (N'111101', N'Cine11', N'24726060', N'zona 12')
INSERT [dbo].[Cine] ([IdCine], [Nombre], [Telefono], [Direccion]) VALUES (N'111102', N'Cine12', N'24736080', N'zona 1 Mixco')
INSERT [dbo].[Cine] ([IdCine], [Nombre], [Telefono], [Direccion]) VALUES (N'111103', N'Cine13', N'24726280', N'zona 1 Villa Nueva')
INSERT [dbo].[Cine] ([IdCine], [Nombre], [Telefono], [Direccion]) VALUES (N'111104', N'Cine14', N'24706080', N'zona 3')
INSERT [dbo].[Cine] ([IdCine], [Nombre], [Telefono], [Direccion]) VALUES (N'111105', N'Cine15', N'24726480', N'zona 18')
INSERT [dbo].[Cine] ([IdCine], [Nombre], [Telefono], [Direccion]) VALUES (N'111110', N'Cine10', N'24726012', N'zona 4 Mixco')
INSERT [dbo].[Cine] ([IdCine], [Nombre], [Telefono], [Direccion]) VALUES (N'111111', N'Cine1', N'24726080', N'zona 17')
INSERT [dbo].[Cine] ([IdCine], [Nombre], [Telefono], [Direccion]) VALUES (N'111112', N'Cine2', N'24726050', N'zona 10')
INSERT [dbo].[Cine] ([IdCine], [Nombre], [Telefono], [Direccion]) VALUES (N'111113', N'Cine3', N'24726090', N'zona 4')
INSERT [dbo].[Cine] ([IdCine], [Nombre], [Telefono], [Direccion]) VALUES (N'111114', N'Cine4', N'24726020', N'zona 8')
INSERT [dbo].[Cine] ([IdCine], [Nombre], [Telefono], [Direccion]) VALUES (N'111115', N'Cine5', N'24726010', N'zona 1')
INSERT [dbo].[Cine] ([IdCine], [Nombre], [Telefono], [Direccion]) VALUES (N'111116', N'Cine6', N'24726030', N'zona 9')
INSERT [dbo].[Cine] ([IdCine], [Nombre], [Telefono], [Direccion]) VALUES (N'111117', N'Cine7', N'24726000', N'zona 11')
INSERT [dbo].[Cine] ([IdCine], [Nombre], [Telefono], [Direccion]) VALUES (N'111118', N'Cine8', N'24726070', N'zona 7')
INSERT [dbo].[Cine] ([IdCine], [Nombre], [Telefono], [Direccion]) VALUES (N'111119', N'Cine9', N'24726082', N'zona 8 Mixco')
INSERT [dbo].[Cliente] ([NIT], [Direccion], [Nombre]) VALUES (N'11215678', N'zona 17', N'Jose Lara')
INSERT [dbo].[Cliente] ([NIT], [Direccion], [Nombre]) VALUES (N'11345610', N'zona 14', N'Alex Recinos')
INSERT [dbo].[Cliente] ([NIT], [Direccion], [Nombre]) VALUES (N'11345611', N'zona 1', N'Pedro De Le¾n')
INSERT [dbo].[Cliente] ([NIT], [Direccion], [Nombre]) VALUES (N'11345612', N'zona 7', N'Juan Lopez')
INSERT [dbo].[Cliente] ([NIT], [Direccion], [Nombre]) VALUES (N'11345613', N'zona 7', N'Marco Veliz')
INSERT [dbo].[Cliente] ([NIT], [Direccion], [Nombre]) VALUES (N'11345614', N'zona 7', N'Ernesto Juarez')
INSERT [dbo].[Cliente] ([NIT], [Direccion], [Nombre]) VALUES (N'11345615', N'zona 9', N'Ricardo Mazariegos')
INSERT [dbo].[Cliente] ([NIT], [Direccion], [Nombre]) VALUES (N'11345616', N'zona 2', N'Diego Torres')
INSERT [dbo].[Cliente] ([NIT], [Direccion], [Nombre]) VALUES (N'11345617', N'zona 10', N'Armando Castro')
INSERT [dbo].[Cliente] ([NIT], [Direccion], [Nombre]) VALUES (N'11345679', N'zona 10', N'Oscar Bamaca')
INSERT [dbo].[Cliente] ([NIT], [Direccion], [Nombre]) VALUES (N'12345610', N'zona 14', N'Alex Villatoro')
INSERT [dbo].[Cliente] ([NIT], [Direccion], [Nombre]) VALUES (N'12345611', N'zona 1', N'Pedro Garcia')
INSERT [dbo].[Cliente] ([NIT], [Direccion], [Nombre]) VALUES (N'12345612', N'zona 7', N'Juan Recinos')
INSERT [dbo].[Cliente] ([NIT], [Direccion], [Nombre]) VALUES (N'12345613', N'zona 7', N'Marco Rosales')
INSERT [dbo].[Cliente] ([NIT], [Direccion], [Nombre]) VALUES (N'12345614', N'zona 7', N'Ernesto L¾pez')
INSERT [dbo].[Cliente] ([NIT], [Direccion], [Nombre]) VALUES (N'12345615', N'zona 9', N'Ricardo PÚrez')
INSERT [dbo].[Cliente] ([NIT], [Direccion], [Nombre]) VALUES (N'12345616', N'zona 2', N'Diego Sican')
INSERT [dbo].[Cliente] ([NIT], [Direccion], [Nombre]) VALUES (N'12345617', N'zona 10', N'Armando Recinos')
INSERT [dbo].[Cliente] ([NIT], [Direccion], [Nombre]) VALUES (N'12345678', N'zona 17', N'Diana Gutierrez')
INSERT [dbo].[Cliente] ([NIT], [Direccion], [Nombre]) VALUES (N'12345679', N'zona 10', N'JosÚ Orellana')
INSERT [dbo].[Contenido] ([IdContenido], [Titulo], [Genero], [TipoFormato], [Duracion], [Distribuidora], [Director], [Año], [PaisProduccion], [EdadRecomendada], [Descripción]) VALUES (N'1', N'Troya', N'Acci¾n', N'HD', N'2 horas', N'Distribuidora S.', N'JosÚ Orellana', N'1990', N'USA', N'12', N'Pelicula de acci¾n')
INSERT [dbo].[Contenido] ([IdContenido], [Titulo], [Genero], [TipoFormato], [Duracion], [Distribuidora], [Director], [Año], [PaisProduccion], [EdadRecomendada], [Descripción]) VALUES (N'10', N'Soy Sam', N'Drama', N'HD', N'1 horas', N'Distribuidora W.', N'Cristian Tello', N'2012', N'USA', N'12', N'Pelicula de drama')
INSERT [dbo].[Contenido] ([IdContenido], [Titulo], [Genero], [TipoFormato], [Duracion], [Distribuidora], [Director], [Año], [PaisProduccion], [EdadRecomendada], [Descripción]) VALUES (N'101', N'Barca-Real', N'Partido', N'HD', N'2 horas', N'UEFA', N'JosÚ Ramirez', N'2019', N'Espa±a', N'12', N'Partido de futbol')
INSERT [dbo].[Contenido] ([IdContenido], [Titulo], [Genero], [TipoFormato], [Duracion], [Distribuidora], [Director], [Año], [PaisProduccion], [EdadRecomendada], [Descripción]) VALUES (N'102', N'Juventus-Atletico', N'Partido', N'HD', N'2 horas', N'UEFA', N'JosÚ Ramirez', N'2019', N'Espa±a', N'12', N'Partido de futbol')
INSERT [dbo].[Contenido] ([IdContenido], [Titulo], [Genero], [TipoFormato], [Duracion], [Distribuidora], [Director], [Año], [PaisProduccion], [EdadRecomendada], [Descripción]) VALUES (N'11', N'Bajo la misma estrella', N'Drama', N'HD', N'1 hora', N'Distribuidora W.', N'Cristian Tello', N'2012', N'USA', N'12', N'Pelicula de drama')
INSERT [dbo].[Contenido] ([IdContenido], [Titulo], [Genero], [TipoFormato], [Duracion], [Distribuidora], [Director], [Año], [PaisProduccion], [EdadRecomendada], [Descripción]) VALUES (N'12', N'Titanic', N'Romantica', N'HD', N'3 horas', N'Distribuidora W.', N'Cristian Tello', N'2012', N'USA', N'12', N'Pelicula romantica')
INSERT [dbo].[Contenido] ([IdContenido], [Titulo], [Genero], [TipoFormato], [Duracion], [Distribuidora], [Director], [Año], [PaisProduccion], [EdadRecomendada], [Descripción]) VALUES (N'13', N'Son como ni±os', N'Comedia', N'HD', N'2 horas', N'Distribuidora W.', N'Alfonso Bick', N'2012', N'USA', N'12', N'Pelicula de comedia')
INSERT [dbo].[Contenido] ([IdContenido], [Titulo], [Genero], [TipoFormato], [Duracion], [Distribuidora], [Director], [Año], [PaisProduccion], [EdadRecomendada], [Descripción]) VALUES (N'14', N'Iron Man', N'Acci¾n', N'HD', N'2 horas', N'Marvel', N'Alfonso Bick', N'2012', N'USA', N'12', N'Pelicula de acci¾n')
INSERT [dbo].[Contenido] ([IdContenido], [Titulo], [Genero], [TipoFormato], [Duracion], [Distribuidora], [Director], [Año], [PaisProduccion], [EdadRecomendada], [Descripción]) VALUES (N'15', N'Spider Man', N'Acci¾n', N'HD', N'2 horas', N'Marvel', N'Alfonso Bick', N'2012', N'USA', N'12', N'Pelicula de acci¾n')
INSERT [dbo].[Contenido] ([IdContenido], [Titulo], [Genero], [TipoFormato], [Duracion], [Distribuidora], [Director], [Año], [PaisProduccion], [EdadRecomendada], [Descripción]) VALUES (N'2', N'Rapidos y furiosos', N'Acci¾n', N'HD', N'3 horas', N'Distribuidora S.', N'JosÚ Orellana', N'2006', N'USA', N'12', N'Pelicula de acci¾n')
INSERT [dbo].[Contenido] ([IdContenido], [Titulo], [Genero], [TipoFormato], [Duracion], [Distribuidora], [Director], [Año], [PaisProduccion], [EdadRecomendada], [Descripción]) VALUES (N'201', N'Concierto Orquesta', N'Concierto', N'En vivo', N'3 horas', N'Orquesta S.', N'Diego Sican', N'2019', N'Guatemala', N'10', N'Concierto de musica clasica')
INSERT [dbo].[Contenido] ([IdContenido], [Titulo], [Genero], [TipoFormato], [Duracion], [Distribuidora], [Director], [Año], [PaisProduccion], [EdadRecomendada], [Descripción]) VALUES (N'202', N'Concierto Cantante', N'Concierto', N'En vivo', N'3 horas', N'Orquesta S.', N'Ricardo Perez', N'2019', N'Guatemala', N'10', N'Concierto de canto')
INSERT [dbo].[Contenido] ([IdContenido], [Titulo], [Genero], [TipoFormato], [Duracion], [Distribuidora], [Director], [Año], [PaisProduccion], [EdadRecomendada], [Descripción]) VALUES (N'203', N'Concierto Banda Marcial', N'Concierto', N'En vivo', N'3 horas', N'Orquesta S.', N'Valerie Pineda', N'2019', N'Guatemala', N'10', N'Concierto de musica ')
INSERT [dbo].[Contenido] ([IdContenido], [Titulo], [Genero], [TipoFormato], [Duracion], [Distribuidora], [Director], [Año], [PaisProduccion], [EdadRecomendada], [Descripción]) VALUES (N'3', N'The Avengers', N'Acci¾n', N'HD', N'3 horas', N'Marvel', N'JosÚ Orellana', N'2012', N'USA', N'12', N'Pelicula de acci¾n')
INSERT [dbo].[Contenido] ([IdContenido], [Titulo], [Genero], [TipoFormato], [Duracion], [Distribuidora], [Director], [Año], [PaisProduccion], [EdadRecomendada], [Descripción]) VALUES (N'4', N'Jack y Jill', N'Comedia', N'HD', N'2 horas', N'Distribuidora S.', N'JosÚ Orellana', N'2014', N'USA', N'12', N'Pelicula de comedia')
INSERT [dbo].[Contenido] ([IdContenido], [Titulo], [Genero], [TipoFormato], [Duracion], [Distribuidora], [Director], [Año], [PaisProduccion], [EdadRecomendada], [Descripción]) VALUES (N'5', N'Gloria', N'Comedia', N'HD', N'1 hora', N'Distribuidora S.', N'JosÚ Orellana', N'2015', N'Mexico', N'12', N'Pelicula de acci¾n')
INSERT [dbo].[Contenido] ([IdContenido], [Titulo], [Genero], [TipoFormato], [Duracion], [Distribuidora], [Director], [Año], [PaisProduccion], [EdadRecomendada], [Descripción]) VALUES (N'6', N'Hanna Montana', N'Musica', N'HD', N'1 hora', N'Distribuidora S.', N'JosÚ Orellana', N'2011', N'USA', N'12', N'Pelicula de musica')
INSERT [dbo].[Contenido] ([IdContenido], [Titulo], [Genero], [TipoFormato], [Duracion], [Distribuidora], [Director], [Año], [PaisProduccion], [EdadRecomendada], [Descripción]) VALUES (N'7', N'Mas alla del cielo', N'Misterio', N'HD', N'2 horas', N'Distribuidora S.', N'JosÚ Orellana', N'2016', N'USA', N'12', N'Pelicula de misterio')
INSERT [dbo].[Contenido] ([IdContenido], [Titulo], [Genero], [TipoFormato], [Duracion], [Distribuidora], [Director], [Año], [PaisProduccion], [EdadRecomendada], [Descripción]) VALUES (N'8', N'Harry Potter', N'Misterio', N'HD', N'3 horas', N'Distribuidora F.', N'Francesco Corleone', N'2012', N'USA', N'12', N'Pelicula de magia y misterio')
INSERT [dbo].[Contenido] ([IdContenido], [Titulo], [Genero], [TipoFormato], [Duracion], [Distribuidora], [Director], [Año], [PaisProduccion], [EdadRecomendada], [Descripción]) VALUES (N'9', N'Star Wars', N'Ciencia Ficci¾n', N'HD', N'3 horas', N'Distribuidora W.', N'Cristian Tello', N'2012', N'USA', N'12', N'Pelicula de ciencia ficci¾n')
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'1', N'JosÚ', N'Orellana', CAST(N'1990-02-10' AS Date), CAST(6000.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'10', N'Arnold', N'Boch', CAST(N'1970-03-10' AS Date), CAST(10000.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'11', N'Juan', N'Galvez', CAST(N'1970-12-10' AS Date), CAST(10500.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'12', N'Vinicio', N'Garcia', CAST(N'1990-04-10' AS Date), CAST(10000.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'13', N'Santiago', N'Motta', CAST(N'1978-05-10' AS Date), CAST(13000.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'14', N'Derly', N'Rodas', CAST(N'1980-01-10' AS Date), CAST(10000.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'15', N'Carlos', N'Bickford', CAST(N'1970-10-10' AS Date), CAST(10000.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'16', N'Carlos', N'Cruz', CAST(N'1970-10-10' AS Date), CAST(10000.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'17', N'Maria', N'Orellana', CAST(N'1970-10-10' AS Date), CAST(10000.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'18', N'Andres', N'Rodriguez', CAST(N'1970-10-10' AS Date), CAST(10000.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'19', N'Carlos', N'Cano', CAST(N'1970-10-10' AS Date), CAST(10000.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'2', N'Edgar', N'Paredes', CAST(N'1970-03-10' AS Date), CAST(6000.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'20', N'Juan', N'Castro', CAST(N'1970-10-10' AS Date), CAST(10000.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'21', N'Adriana', N'Perez', CAST(N'1970-10-10' AS Date), CAST(10000.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'22', N'Paola', N'Gomez', CAST(N'1970-10-10' AS Date), CAST(10000.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'23', N'Cesar', N'Fonsea', CAST(N'1970-10-10' AS Date), CAST(10000.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'24', N'Carlos', N'Beltran', CAST(N'1970-10-10' AS Date), CAST(10000.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'25', N'Diego', N'Barrera', CAST(N'1970-10-10' AS Date), CAST(10000.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'26', N'Diego', N'Linares', CAST(N'1970-10-10' AS Date), CAST(10000.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'27', N'Paolo', N'Aquino', CAST(N'1970-10-10' AS Date), CAST(10000.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'28', N'Lariza', N'Tello', CAST(N'1970-10-10' AS Date), CAST(10000.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'29', N'Luis', N'Aguilar', CAST(N'1970-10-10' AS Date), CAST(10000.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'3', N'Alex', N'Garcia', CAST(N'1970-03-10' AS Date), CAST(10000.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'30', N'Mercedes', N'Murga', CAST(N'1970-10-10' AS Date), CAST(10000.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'31', N'Carlos', N'Lemus', CAST(N'1970-10-10' AS Date), CAST(10000.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'32', N'Jimena', N'Rojas', CAST(N'1970-10-10' AS Date), CAST(10000.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'33', N'Omar', N'Contreras', CAST(N'1970-10-10' AS Date), CAST(10000.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'34', N'Carmen', N'Lemus', CAST(N'1970-10-10' AS Date), CAST(10000.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'35', N'Isabel', N'Lopez', CAST(N'1970-10-10' AS Date), CAST(10000.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'36', N'Lucia', N'Gomez', CAST(N'1970-10-10' AS Date), CAST(10000.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'37', N'Roberto', N'Alvarez', CAST(N'1970-10-10' AS Date), CAST(10000.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'38', N'Maria', N'Ayala', CAST(N'1970-10-10' AS Date), CAST(10000.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'39', N'Carlos', N'Fuentes', CAST(N'1970-10-10' AS Date), CAST(10000.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'4', N'Pablo', N'Garcia', CAST(N'1970-03-12' AS Date), CAST(10000.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'40', N'Carmen', N'Oliva', CAST(N'1970-10-10' AS Date), CAST(10000.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'41', N'Paula', N'Pineda', CAST(N'1970-10-10' AS Date), CAST(10000.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'42', N'Ivania', N'Azurdia', CAST(N'1970-10-10' AS Date), CAST(10000.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'43', N'Marisa', N'Monz¾n', CAST(N'1970-10-10' AS Date), CAST(10000.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'44', N'Diego', N'Solis', CAST(N'1970-10-10' AS Date), CAST(10000.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'45', N'Rodrigo', N'Paredes', CAST(N'1970-10-10' AS Date), CAST(10000.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'46', N'Oscar', N'Gamarro', CAST(N'1970-10-10' AS Date), CAST(10000.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'47', N'JosÚ', N'Lara', CAST(N'1970-10-10' AS Date), CAST(10000.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'48', N'Ian', N'Soto', CAST(N'1970-10-10' AS Date), CAST(10000.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'49', N'Javier', N'Barrios', CAST(N'1970-10-10' AS Date), CAST(10000.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'5', N'Alejandro', N'Juarez', CAST(N'1970-03-10' AS Date), CAST(1100.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'50', N'Cesar', N'Contreras', CAST(N'1970-10-10' AS Date), CAST(10000.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'6', N'Pedro', N'De leon', CAST(N'1980-04-10' AS Date), CAST(10000.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'7', N'JosÚ', N'Tejeda', CAST(N'1990-03-10' AS Date), CAST(10000.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'8', N'Alex', N'Villatoro', CAST(N'1970-03-10' AS Date), CAST(10000.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'9', N'Diana', N'Hernandez', CAST(N'1980-05-10' AS Date), CAST(12000.00 AS Numeric(10, 2)))
INSERT [dbo].[Evento] ([No.Sala], [IdContenido], [IdEvento], [Programador], [HoraInicio], [Cine]) VALUES (1, N'1', N'1', N'Alex Villatoro', CAST(N'19:00:00' AS Time), N'111111')
INSERT [dbo].[Evento] ([No.Sala], [IdContenido], [IdEvento], [Programador], [HoraInicio], [Cine]) VALUES (10, N'10', N'10', N'Alex Villatoro', CAST(N'19:00:00' AS Time), N'111113')
INSERT [dbo].[Evento] ([No.Sala], [IdContenido], [IdEvento], [Programador], [HoraInicio], [Cine]) VALUES (11, N'11', N'11', N'Alex Villatoro', CAST(N'19:00:00' AS Time), N'111113')
INSERT [dbo].[Evento] ([No.Sala], [IdContenido], [IdEvento], [Programador], [HoraInicio], [Cine]) VALUES (13, N'13', N'13', N'Alex Villatoro', CAST(N'19:00:00' AS Time), N'111114')
INSERT [dbo].[Evento] ([No.Sala], [IdContenido], [IdEvento], [Programador], [HoraInicio], [Cine]) VALUES (14, N'14', N'14', N'Alex Villatoro', CAST(N'19:00:00' AS Time), N'111114')
INSERT [dbo].[Evento] ([No.Sala], [IdContenido], [IdEvento], [Programador], [HoraInicio], [Cine]) VALUES (15, N'15', N'15', N'Alex Villatoro', CAST(N'19:00:00' AS Time), N'111114')
INSERT [dbo].[Evento] ([No.Sala], [IdContenido], [IdEvento], [Programador], [HoraInicio], [Cine]) VALUES (16, N'101', N'16', N'Alex Villatoro', CAST(N'19:00:00' AS Time), N'111114')
INSERT [dbo].[Evento] ([No.Sala], [IdContenido], [IdEvento], [Programador], [HoraInicio], [Cine]) VALUES (17, N'102', N'17', N'Alex Villatoro', CAST(N'19:00:00' AS Time), N'111115')
INSERT [dbo].[Evento] ([No.Sala], [IdContenido], [IdEvento], [Programador], [HoraInicio], [Cine]) VALUES (18, N'201', N'18', N'Alex Villatoro', CAST(N'19:00:00' AS Time), N'111115')
INSERT [dbo].[Evento] ([No.Sala], [IdContenido], [IdEvento], [Programador], [HoraInicio], [Cine]) VALUES (19, N'202', N'19', N'Alex Villatoro', CAST(N'19:00:00' AS Time), N'111115')
INSERT [dbo].[Evento] ([No.Sala], [IdContenido], [IdEvento], [Programador], [HoraInicio], [Cine]) VALUES (2, N'2', N'2', N'Alex Villatoro', CAST(N'16:00:00' AS Time), N'111111')
INSERT [dbo].[Evento] ([No.Sala], [IdContenido], [IdEvento], [Programador], [HoraInicio], [Cine]) VALUES (20, N'203', N'20', N'Alex Villatoro', CAST(N'19:00:00' AS Time), N'111115')
INSERT [dbo].[Evento] ([No.Sala], [IdContenido], [IdEvento], [Programador], [HoraInicio], [Cine]) VALUES (21, N'1', N'21', N'Alex Villatoro', CAST(N'19:00:00' AS Time), N'111116')
INSERT [dbo].[Evento] ([No.Sala], [IdContenido], [IdEvento], [Programador], [HoraInicio], [Cine]) VALUES (22, N'2', N'22', N'Alex Villatoro', CAST(N'16:00:00' AS Time), N'111116')
INSERT [dbo].[Evento] ([No.Sala], [IdContenido], [IdEvento], [Programador], [HoraInicio], [Cine]) VALUES (23, N'3', N'23', N'Alex Villatoro', CAST(N'17:00:00' AS Time), N'111116')
INSERT [dbo].[Evento] ([No.Sala], [IdContenido], [IdEvento], [Programador], [HoraInicio], [Cine]) VALUES (24, N'4', N'24', N'Alex Villatoro', CAST(N'14:00:00' AS Time), N'111116')
INSERT [dbo].[Evento] ([No.Sala], [IdContenido], [IdEvento], [Programador], [HoraInicio], [Cine]) VALUES (25, N'5', N'25', N'Alex Villatoro', CAST(N'19:00:00' AS Time), N'111117')
INSERT [dbo].[Evento] ([No.Sala], [IdContenido], [IdEvento], [Programador], [HoraInicio], [Cine]) VALUES (26, N'6', N'26', N'Alex Villatoro', CAST(N'19:00:00' AS Time), N'111117')
INSERT [dbo].[Evento] ([No.Sala], [IdContenido], [IdEvento], [Programador], [HoraInicio], [Cine]) VALUES (27, N'7', N'27', N'Alex Villatoro', CAST(N'20:00:00' AS Time), N'111117')
INSERT [dbo].[Evento] ([No.Sala], [IdContenido], [IdEvento], [Programador], [HoraInicio], [Cine]) VALUES (28, N'8', N'28', N'Alex Villatoro', CAST(N'14:00:00' AS Time), N'111118')
INSERT [dbo].[Evento] ([No.Sala], [IdContenido], [IdEvento], [Programador], [HoraInicio], [Cine]) VALUES (29, N'9', N'29', N'Alex Villatoro', CAST(N'19:00:00' AS Time), N'111118')
INSERT [dbo].[Evento] ([No.Sala], [IdContenido], [IdEvento], [Programador], [HoraInicio], [Cine]) VALUES (3, N'3', N'3', N'Alex Villatoro', CAST(N'17:00:00' AS Time), N'111111')
INSERT [dbo].[Evento] ([No.Sala], [IdContenido], [IdEvento], [Programador], [HoraInicio], [Cine]) VALUES (30, N'10', N'30', N'Alex Villatoro', CAST(N'19:00:00' AS Time), N'111118')
INSERT [dbo].[Evento] ([No.Sala], [IdContenido], [IdEvento], [Programador], [HoraInicio], [Cine]) VALUES (31, N'11', N'31', N'Alex Villatoro', CAST(N'19:00:00' AS Time), N'111119')
INSERT [dbo].[Evento] ([No.Sala], [IdContenido], [IdEvento], [Programador], [HoraInicio], [Cine]) VALUES (32, N'12', N'32', N'Alex Villatoro', CAST(N'19:00:00' AS Time), N'111119')
INSERT [dbo].[Evento] ([No.Sala], [IdContenido], [IdEvento], [Programador], [HoraInicio], [Cine]) VALUES (33, N'13', N'33', N'Alex Villatoro', CAST(N'19:00:00' AS Time), N'111119')
INSERT [dbo].[Evento] ([No.Sala], [IdContenido], [IdEvento], [Programador], [HoraInicio], [Cine]) VALUES (34, N'14', N'34', N'Alex Villatoro', CAST(N'19:00:00' AS Time), N'111119')
INSERT [dbo].[Evento] ([No.Sala], [IdContenido], [IdEvento], [Programador], [HoraInicio], [Cine]) VALUES (35, N'101', N'35', N'Alex Villatoro', CAST(N'19:00:00' AS Time), N'111110')
INSERT [dbo].[Evento] ([No.Sala], [IdContenido], [IdEvento], [Programador], [HoraInicio], [Cine]) VALUES (36, N'102', N'36', N'Alex Villatoro', CAST(N'19:00:00' AS Time), N'111110')
INSERT [dbo].[Evento] ([No.Sala], [IdContenido], [IdEvento], [Programador], [HoraInicio], [Cine]) VALUES (37, N'3', N'37', N'Alex Villatoro', CAST(N'17:00:00' AS Time), N'111101')
INSERT [dbo].[Evento] ([No.Sala], [IdContenido], [IdEvento], [Programador], [HoraInicio], [Cine]) VALUES (38, N'3', N'38', N'Alex Villatoro', CAST(N'17:00:00' AS Time), N'111101')
INSERT [dbo].[Evento] ([No.Sala], [IdContenido], [IdEvento], [Programador], [HoraInicio], [Cine]) VALUES (39, N'3', N'39', N'Alex Villatoro', CAST(N'17:00:00' AS Time), N'111102')
INSERT [dbo].[Evento] ([No.Sala], [IdContenido], [IdEvento], [Programador], [HoraInicio], [Cine]) VALUES (4, N'4', N'4', N'Alex Villatoro', CAST(N'14:00:00' AS Time), N'111111')
INSERT [dbo].[Evento] ([No.Sala], [IdContenido], [IdEvento], [Programador], [HoraInicio], [Cine]) VALUES (40, N'3', N'40', N'Alex Villatoro', CAST(N'17:00:00' AS Time), N'111102')
INSERT [dbo].[Evento] ([No.Sala], [IdContenido], [IdEvento], [Programador], [HoraInicio], [Cine]) VALUES (41, N'1', N'41', N'Alex Villatoro', CAST(N'19:00:00' AS Time), N'111103')
INSERT [dbo].[Evento] ([No.Sala], [IdContenido], [IdEvento], [Programador], [HoraInicio], [Cine]) VALUES (42, N'2', N'42', N'Alex Villatoro', CAST(N'16:00:00' AS Time), N'111103')
INSERT [dbo].[Evento] ([No.Sala], [IdContenido], [IdEvento], [Programador], [HoraInicio], [Cine]) VALUES (43, N'3', N'43', N'Alex Villatoro', CAST(N'17:00:00' AS Time), N'111104')
INSERT [dbo].[Evento] ([No.Sala], [IdContenido], [IdEvento], [Programador], [HoraInicio], [Cine]) VALUES (44, N'4', N'44', N'Alex Villatoro', CAST(N'14:00:00' AS Time), N'111104')
INSERT [dbo].[Evento] ([No.Sala], [IdContenido], [IdEvento], [Programador], [HoraInicio], [Cine]) VALUES (45, N'5', N'45', N'Alex Villatoro', CAST(N'19:00:00' AS Time), N'111105')
INSERT [dbo].[Evento] ([No.Sala], [IdContenido], [IdEvento], [Programador], [HoraInicio], [Cine]) VALUES (5, N'5', N'5', N'Alex Villatoro', CAST(N'19:00:00' AS Time), N'111112')
INSERT [dbo].[Evento] ([No.Sala], [IdContenido], [IdEvento], [Programador], [HoraInicio], [Cine]) VALUES (6, N'6', N'6', N'Alex Villatoro', CAST(N'19:00:00' AS Time), N'111112')
INSERT [dbo].[Evento] ([No.Sala], [IdContenido], [IdEvento], [Programador], [HoraInicio], [Cine]) VALUES (7, N'7', N'7', N'Alex Villatoro', CAST(N'20:00:00' AS Time), N'111112')
INSERT [dbo].[Evento] ([No.Sala], [IdContenido], [IdEvento], [Programador], [HoraInicio], [Cine]) VALUES (8, N'8', N'8', N'Alex Villatoro', CAST(N'14:00:00' AS Time), N'111112')
INSERT [dbo].[Evento] ([No.Sala], [IdContenido], [IdEvento], [Programador], [HoraInicio], [Cine]) VALUES (9, N'9', N'9', N'Alex Villatoro', CAST(N'19:00:00' AS Time), N'111113')
INSERT [dbo].[ExhibicionEspecial] ([IdContenido], [IdExhibicionE]) VALUES (N'101', N'1')
INSERT [dbo].[ExhibicionEspecial] ([IdContenido], [IdExhibicionE]) VALUES (N'102', N'2')
INSERT [dbo].[ExhibicionEspecial] ([IdContenido], [IdExhibicionE]) VALUES (N'201', N'3')
INSERT [dbo].[ExhibicionEspecial] ([IdContenido], [IdExhibicionE]) VALUES (N'202', N'4')
INSERT [dbo].[ExhibicionEspecial] ([IdContenido], [IdExhibicionE]) VALUES (N'203', N'5')
INSERT [dbo].[Interprete] ([NombreInterprete]) VALUES (N'Alex Ruano')
INSERT [dbo].[Interprete] ([NombreInterprete]) VALUES (N'Antonio Martinez')
INSERT [dbo].[Interprete] ([NombreInterprete]) VALUES (N'Diego Gonzales')
INSERT [dbo].[Interprete] ([NombreInterprete]) VALUES (N'Diego Solorzano')
INSERT [dbo].[Interprete] ([NombreInterprete]) VALUES (N'Emilio Carpio')
INSERT [dbo].[Interprete] ([NombreInterprete]) VALUES (N'Felipe Velßsquez')
INSERT [dbo].[Interprete] ([NombreInterprete]) VALUES (N'JosÚ Alvarado')
INSERT [dbo].[Interprete] ([NombreInterprete]) VALUES (N'JosÚ Lara')
INSERT [dbo].[Interprete] ([NombreInterprete]) VALUES (N'JosÚ Ortega')
INSERT [dbo].[Interprete] ([NombreInterprete]) VALUES (N'Juan AgustÝn')
INSERT [dbo].[Interprete] ([NombreInterprete]) VALUES (N'Juan Sabina')
INSERT [dbo].[Interprete] ([NombreInterprete]) VALUES (N'Oscar Carlo')
INSERT [dbo].[Interprete] ([NombreInterprete]) VALUES (N'Pedro GarcÝa')
INSERT [dbo].[Interprete] ([NombreInterprete]) VALUES (N'Ricardo Ramirez')
INSERT [dbo].[Interprete] ([NombreInterprete]) VALUES (N'Valerie Pineda')
INSERT [dbo].[InterpretesExhibicion] ([IdExhibicion], [NombreInterprete]) VALUES (N'3', N'Alex Ruano')
INSERT [dbo].[InterpretesExhibicion] ([IdExhibicion], [NombreInterprete]) VALUES (N'3', N'Diego Gonzales')
INSERT [dbo].[InterpretesExhibicion] ([IdExhibicion], [NombreInterprete]) VALUES (N'3', N'JosÚ Ortega')
INSERT [dbo].[InterpretesExhibicion] ([IdExhibicion], [NombreInterprete]) VALUES (N'3', N'Oscar Carlo')
INSERT [dbo].[InterpretesExhibicion] ([IdExhibicion], [NombreInterprete]) VALUES (N'3', N'Ricardo Ramirez')
INSERT [dbo].[InterpretesExhibicion] ([IdExhibicion], [NombreInterprete]) VALUES (N'4', N'Antonio Martinez')
INSERT [dbo].[InterpretesExhibicion] ([IdExhibicion], [NombreInterprete]) VALUES (N'4', N'Diego Solorzano')
INSERT [dbo].[InterpretesExhibicion] ([IdExhibicion], [NombreInterprete]) VALUES (N'4', N'JosÚ Alvarado')
INSERT [dbo].[InterpretesExhibicion] ([IdExhibicion], [NombreInterprete]) VALUES (N'4', N'JosÚ Lara')
INSERT [dbo].[InterpretesExhibicion] ([IdExhibicion], [NombreInterprete]) VALUES (N'4', N'Valerie Pineda')
INSERT [dbo].[InterpretesExhibicion] ([IdExhibicion], [NombreInterprete]) VALUES (N'5', N'Emilio Carpio')
INSERT [dbo].[InterpretesExhibicion] ([IdExhibicion], [NombreInterprete]) VALUES (N'5', N'Felipe Velßsquez')
INSERT [dbo].[InterpretesExhibicion] ([IdExhibicion], [NombreInterprete]) VALUES (N'5', N'Juan AgustÝn')
INSERT [dbo].[InterpretesExhibicion] ([IdExhibicion], [NombreInterprete]) VALUES (N'5', N'Juan Sabina')
INSERT [dbo].[InterpretesExhibicion] ([IdExhibicion], [NombreInterprete]) VALUES (N'5', N'Pedro GarcÝa')
INSERT [dbo].[Opinion] ([IdContenido], [NombrePersona], [Fecha], [Edad], [Calificacion], [Comentario]) VALUES (N'1', N'Claudia Lopez', CAST(N'2020-01-12T00:00:00.000' AS DateTime), N'30', N'Muy buena', N'Buena pelicula')
INSERT [dbo].[Opinion] ([IdContenido], [NombrePersona], [Fecha], [Edad], [Calificacion], [Comentario]) VALUES (N'1', N'JosÚ Orellana', CAST(N'2020-01-12T00:00:00.000' AS DateTime), N'15', N'Muy buena', N'Buena pelicula')
INSERT [dbo].[Opinion] ([IdContenido], [NombrePersona], [Fecha], [Edad], [Calificacion], [Comentario]) VALUES (N'1', N'JosÚ Ramirez', CAST(N'2020-01-12T00:00:00.000' AS DateTime), N'15', N'Muy buena', N'Buena trama')
INSERT [dbo].[Opinion] ([IdContenido], [NombrePersona], [Fecha], [Edad], [Calificacion], [Comentario]) VALUES (N'2', N'Edgar Castro', CAST(N'2020-01-12T00:00:00.000' AS DateTime), N'20', N'Regular', N'Buenos efectos')
INSERT [dbo].[Opinion] ([IdContenido], [NombrePersona], [Fecha], [Edad], [Calificacion], [Comentario]) VALUES (N'2', N'Edgar Paredes', CAST(N'2020-01-12T00:00:00.000' AS DateTime), N'20', N'Obra Maestra', N'Buenos efectos')
INSERT [dbo].[Opinion] ([IdContenido], [NombrePersona], [Fecha], [Edad], [Calificacion], [Comentario]) VALUES (N'3', N'Charlie Bickford', CAST(N'2020-01-12T00:00:00.000' AS DateTime), N'21', N'Muy buena', N'Excelentes efectos ')
INSERT [dbo].[Opinion] ([IdContenido], [NombrePersona], [Fecha], [Edad], [Calificacion], [Comentario]) VALUES (N'3', N'JosÚ Mazariegos', CAST(N'2020-01-12T00:00:00.000' AS DateTime), N'19', N'Obra Maestra', N'Mi peli favorita')
INSERT [dbo].[Opinion] ([IdContenido], [NombrePersona], [Fecha], [Edad], [Calificacion], [Comentario]) VALUES (N'3', N'JosÚ Rodriguez', CAST(N'2020-01-12T00:00:00.000' AS DateTime), N'19', N'Obra Maestra', N'Mi favorita')
INSERT [dbo].[Opinion] ([IdContenido], [NombrePersona], [Fecha], [Edad], [Calificacion], [Comentario]) VALUES (N'3', N'Maria Orellana', CAST(N'2020-01-12T00:00:00.000' AS DateTime), N'19', N'Obra Maestra', N'Mi pelicula favorita')
INSERT [dbo].[Opinion] ([IdContenido], [NombrePersona], [Fecha], [Edad], [Calificacion], [Comentario]) VALUES (N'3', N'Pedro Azurdia', CAST(N'2020-01-12T00:00:00.000' AS DateTime), N'17', N'Regular', N'Buena trama')
INSERT [dbo].[Opinion] ([IdContenido], [NombrePersona], [Fecha], [Edad], [Calificacion], [Comentario]) VALUES (N'4', N'JosÚ Perez', CAST(N'2020-01-12T00:00:00.000' AS DateTime), N'15', N'Mala', N'Muy mala pelicula')
INSERT [dbo].[Opinion] ([IdContenido], [NombrePersona], [Fecha], [Edad], [Calificacion], [Comentario]) VALUES (N'4', N'Pedro Ramirez', CAST(N'2020-01-12T00:00:00.000' AS DateTime), N'25', N'Mala', N'No da risa')
INSERT [dbo].[Opinion] ([IdContenido], [NombrePersona], [Fecha], [Edad], [Calificacion], [Comentario]) VALUES (N'9', N'Andrea Camara', CAST(N'2020-01-12T00:00:00.000' AS DateTime), N'19', N'Mala', N'Muy aburrida')
INSERT [dbo].[Opinion] ([IdContenido], [NombrePersona], [Fecha], [Edad], [Calificacion], [Comentario]) VALUES (N'9', N'Edgar Ramirez', CAST(N'2020-01-12T00:00:00.000' AS DateTime), N'19', N'Mala', N'Muy aburrida')
INSERT [dbo].[Opinion] ([IdContenido], [NombrePersona], [Fecha], [Edad], [Calificacion], [Comentario]) VALUES (N'9', N'JosÚ Ramirez', CAST(N'2020-01-12T00:00:00.000' AS DateTime), N'19', N'Mala', N'Muy aburrida')
INSERT [dbo].[Opinion] ([IdContenido], [NombrePersona], [Fecha], [Edad], [Calificacion], [Comentario]) VALUES (N'9', N'Juan Cruz', CAST(N'2020-01-12T00:00:00.000' AS DateTime), N'19', N'Mala', N'Muy aburrida')
INSERT [dbo].[PeliculaRegular] ([IdContenido], [IdPelicula]) VALUES (N'1', N'1')
INSERT [dbo].[PeliculaRegular] ([IdContenido], [IdPelicula]) VALUES (N'10', N'10')
INSERT [dbo].[PeliculaRegular] ([IdContenido], [IdPelicula]) VALUES (N'11', N'11')
INSERT [dbo].[PeliculaRegular] ([IdContenido], [IdPelicula]) VALUES (N'12', N'12')
INSERT [dbo].[PeliculaRegular] ([IdContenido], [IdPelicula]) VALUES (N'13', N'13')
INSERT [dbo].[PeliculaRegular] ([IdContenido], [IdPelicula]) VALUES (N'14', N'14')
INSERT [dbo].[PeliculaRegular] ([IdContenido], [IdPelicula]) VALUES (N'15', N'15')
INSERT [dbo].[PeliculaRegular] ([IdContenido], [IdPelicula]) VALUES (N'2', N'2')
INSERT [dbo].[PeliculaRegular] ([IdContenido], [IdPelicula]) VALUES (N'3', N'3')
INSERT [dbo].[PeliculaRegular] ([IdContenido], [IdPelicula]) VALUES (N'4', N'4')
INSERT [dbo].[PeliculaRegular] ([IdContenido], [IdPelicula]) VALUES (N'5', N'5')
INSERT [dbo].[PeliculaRegular] ([IdContenido], [IdPelicula]) VALUES (N'6', N'6')
INSERT [dbo].[PeliculaRegular] ([IdContenido], [IdPelicula]) VALUES (N'7', N'7')
INSERT [dbo].[PeliculaRegular] ([IdContenido], [IdPelicula]) VALUES (N'8', N'8')
INSERT [dbo].[PeliculaRegular] ([IdContenido], [IdPelicula]) VALUES (N'9', N'9')
INSERT [dbo].[RegistroHistorico] ([IdContenido], [Fecha], [FechaUltimaExhibición]) VALUES (N'201', CAST(N'2020-04-10T00:00:00.000' AS DateTime), CAST(N'2020-02-12T00:00:00.000' AS DateTime))
INSERT [dbo].[RegistroHistorico] ([IdContenido], [Fecha], [FechaUltimaExhibición]) VALUES (N'5', CAST(N'2020-04-10T00:00:00.000' AS DateTime), CAST(N'2019-03-06T00:00:00.000' AS DateTime))
INSERT [dbo].[RegistroHistorico] ([IdContenido], [Fecha], [FechaUltimaExhibición]) VALUES (N'6', CAST(N'2020-04-10T00:00:00.000' AS DateTime), CAST(N'2020-03-10T00:00:00.000' AS DateTime))
INSERT [dbo].[RegistroHistorico] ([IdContenido], [Fecha], [FechaUltimaExhibición]) VALUES (N'7', CAST(N'2020-04-10T00:00:00.000' AS DateTime), CAST(N'2020-03-12T00:00:00.000' AS DateTime))
INSERT [dbo].[RegistroRotacion] ([IdCine], [CodigoEmpleado]) VALUES (N'111101', N'47')
INSERT [dbo].[RegistroRotacion] ([IdCine], [CodigoEmpleado]) VALUES (N'111101', N'48')
INSERT [dbo].[RegistroRotacion] ([IdCine], [CodigoEmpleado]) VALUES (N'111101', N'49')
INSERT [dbo].[RegistroRotacion] ([IdCine], [CodigoEmpleado]) VALUES (N'111101', N'5')
INSERT [dbo].[RegistroRotacion] ([IdCine], [CodigoEmpleado]) VALUES (N'111102', N'6')
INSERT [dbo].[RegistroRotacion] ([IdCine], [CodigoEmpleado]) VALUES (N'111103', N'7')
INSERT [dbo].[RegistroRotacion] ([IdCine], [CodigoEmpleado]) VALUES (N'111104', N'8')
INSERT [dbo].[RegistroRotacion] ([IdCine], [CodigoEmpleado]) VALUES (N'111105', N'9')
INSERT [dbo].[RegistroRotacion] ([IdCine], [CodigoEmpleado]) VALUES (N'111111', N'11')
INSERT [dbo].[RegistroRotacion] ([IdCine], [CodigoEmpleado]) VALUES (N'111111', N'12')
INSERT [dbo].[RegistroRotacion] ([IdCine], [CodigoEmpleado]) VALUES (N'111111', N'16')
INSERT [dbo].[RegistroRotacion] ([IdCine], [CodigoEmpleado]) VALUES (N'111111', N'17')
INSERT [dbo].[RegistroRotacion] ([IdCine], [CodigoEmpleado]) VALUES (N'111111', N'18')
INSERT [dbo].[RegistroRotacion] ([IdCine], [CodigoEmpleado]) VALUES (N'111111', N'19')
INSERT [dbo].[RegistroRotacion] ([IdCine], [CodigoEmpleado]) VALUES (N'111112', N'21')
INSERT [dbo].[RegistroRotacion] ([IdCine], [CodigoEmpleado]) VALUES (N'111112', N'22')
INSERT [dbo].[RegistroRotacion] ([IdCine], [CodigoEmpleado]) VALUES (N'111112', N'23')
INSERT [dbo].[RegistroRotacion] ([IdCine], [CodigoEmpleado]) VALUES (N'111112', N'24')
INSERT [dbo].[RegistroRotacion] ([IdCine], [CodigoEmpleado]) VALUES (N'111112', N'25')
INSERT [dbo].[RegistroRotacion] ([IdCine], [CodigoEmpleado]) VALUES (N'111113', N'26')
INSERT [dbo].[RegistroRotacion] ([IdCine], [CodigoEmpleado]) VALUES (N'111113', N'27')
INSERT [dbo].[RegistroRotacion] ([IdCine], [CodigoEmpleado]) VALUES (N'111113', N'28')
INSERT [dbo].[RegistroRotacion] ([IdCine], [CodigoEmpleado]) VALUES (N'111113', N'29')
INSERT [dbo].[RegistroRotacion] ([IdCine], [CodigoEmpleado]) VALUES (N'111114', N'31')
INSERT [dbo].[RegistroRotacion] ([IdCine], [CodigoEmpleado]) VALUES (N'111114', N'32')
INSERT [dbo].[RegistroRotacion] ([IdCine], [CodigoEmpleado]) VALUES (N'111114', N'33')
INSERT [dbo].[RegistroRotacion] ([IdCine], [CodigoEmpleado]) VALUES (N'111114', N'34')
INSERT [dbo].[RegistroRotacion] ([IdCine], [CodigoEmpleado]) VALUES (N'111115', N'35')
INSERT [dbo].[RegistroRotacion] ([IdCine], [CodigoEmpleado]) VALUES (N'111115', N'36')
INSERT [dbo].[RegistroRotacion] ([IdCine], [CodigoEmpleado]) VALUES (N'111115', N'37')
INSERT [dbo].[RegistroRotacion] ([IdCine], [CodigoEmpleado]) VALUES (N'111115', N'38')
INSERT [dbo].[RegistroRotacion] ([IdCine], [CodigoEmpleado]) VALUES (N'111116', N'39')
INSERT [dbo].[RegistroRotacion] ([IdCine], [CodigoEmpleado]) VALUES (N'111116', N'41')
INSERT [dbo].[RegistroRotacion] ([IdCine], [CodigoEmpleado]) VALUES (N'111116', N'42')
INSERT [dbo].[RegistroRotacion] ([IdCine], [CodigoEmpleado]) VALUES (N'111116', N'43')
INSERT [dbo].[RegistroRotacion] ([IdCine], [CodigoEmpleado]) VALUES (N'111117', N'44')
INSERT [dbo].[RegistroRotacion] ([IdCine], [CodigoEmpleado]) VALUES (N'111117', N'45')
INSERT [dbo].[RegistroRotacion] ([IdCine], [CodigoEmpleado]) VALUES (N'111117', N'46')
INSERT [dbo].[Reparto] ([NombreActor], [IdPelicula], [NombrePersonaje]) VALUES (N'Adam Sandler', N'13', N'Lenny')
INSERT [dbo].[Reparto] ([NombreActor], [IdPelicula], [NombrePersonaje]) VALUES (N'Adam Sandler', N'4', N'Jack')
INSERT [dbo].[Reparto] ([NombreActor], [IdPelicula], [NombrePersonaje]) VALUES (N'Ansel Elgort', N'11', N'Augustus')
INSERT [dbo].[Reparto] ([NombreActor], [IdPelicula], [NombrePersonaje]) VALUES (N'Brad Pitt', N'1', N'Aquiles')
INSERT [dbo].[Reparto] ([NombreActor], [IdPelicula], [NombrePersonaje]) VALUES (N'Carrie Fisher', N'9', N'Leia')
INSERT [dbo].[Reparto] ([NombreActor], [IdPelicula], [NombrePersonaje]) VALUES (N'Chris Evans', N'3', N'Steve Rogers')
INSERT [dbo].[Reparto] ([NombreActor], [IdPelicula], [NombrePersonaje]) VALUES (N'Dakota Fanning', N'10', N'Lucy')
INSERT [dbo].[Reparto] ([NombreActor], [IdPelicula], [NombrePersonaje]) VALUES (N'Dwayne Johnson', N'2', N'Hobbs ')
INSERT [dbo].[Reparto] ([NombreActor], [IdPelicula], [NombrePersonaje]) VALUES (N'Emma Watson', N'8', N'Hermione')
INSERT [dbo].[Reparto] ([NombreActor], [IdPelicula], [NombrePersonaje]) VALUES (N'Eugenio Derbez', N'4', N'Felipe')
INSERT [dbo].[Reparto] ([NombreActor], [IdPelicula], [NombrePersonaje]) VALUES (N'Leonardo Dicaprio', N'12', N'Jack')
INSERT [dbo].[Reparto] ([NombreActor], [IdPelicula], [NombrePersonaje]) VALUES (N'Miley Cirus', N'6', N'Miley')
INSERT [dbo].[Reparto] ([NombreActor], [IdPelicula], [NombrePersonaje]) VALUES (N'Robbin Downey', N'14', N'Tony Stark')
INSERT [dbo].[Reparto] ([NombreActor], [IdPelicula], [NombrePersonaje]) VALUES (N'Robbin Downey', N'3', N'Tony Stark')
INSERT [dbo].[Reparto] ([NombreActor], [IdPelicula], [NombrePersonaje]) VALUES (N'Salma Hallet', N'13', N'Roxanne')
INSERT [dbo].[Reparto] ([NombreActor], [IdPelicula], [NombrePersonaje]) VALUES (N'Salma Hallet', N'5', N'Gloria')
INSERT [dbo].[Reparto] ([NombreActor], [IdPelicula], [NombrePersonaje]) VALUES (N'Scarleth Johansson', N'3', N'Natasha')
INSERT [dbo].[Reparto] ([NombreActor], [IdPelicula], [NombrePersonaje]) VALUES (N'Tobey Maguire', N'15', N'Peter Parker')
INSERT [dbo].[Reparto] ([NombreActor], [IdPelicula], [NombrePersonaje]) VALUES (N'Vin Diesel', N'2', N'Dominic')
INSERT [dbo].[Reparto] ([NombreActor], [IdPelicula], [NombrePersonaje]) VALUES (N'Zack Efron', N'7', N'Charlie')
INSERT [dbo].[ReporteBajas] ([IdCine], [CodigoEmpleado], [Fecha], [Motivo]) VALUES (N'111111', N'1', CAST(N'2020-03-06' AS Date), N'Porque si')
INSERT [dbo].[ReporteBajas] ([IdCine], [CodigoEmpleado], [Fecha], [Motivo]) VALUES (N'111111', N'13', CAST(N'2020-03-04' AS Date), N'Porque si')
INSERT [dbo].[ReporteBajas] ([IdCine], [CodigoEmpleado], [Fecha], [Motivo]) VALUES (N'111111', N'14', CAST(N'2020-03-01' AS Date), N'Porque si')
INSERT [dbo].[ReporteBajas] ([IdCine], [CodigoEmpleado], [Fecha], [Motivo]) VALUES (N'111111', N'2', CAST(N'2020-02-11' AS Date), N'Porque si')
INSERT [dbo].[ReporteBajas] ([IdCine], [CodigoEmpleado], [Fecha], [Motivo]) VALUES (N'111113', N'3', CAST(N'2020-01-09' AS Date), N'Porque si')
INSERT [dbo].[ReporteBajas] ([IdCine], [CodigoEmpleado], [Fecha], [Motivo]) VALUES (N'111114', N'4', CAST(N'2020-03-10' AS Date), N'Porque si')
INSERT [dbo].[ReporteBajas] ([IdCine], [CodigoEmpleado], [Fecha], [Motivo]) VALUES (N'111115', N'15', CAST(N'2020-02-04' AS Date), N'Porque si')
INSERT [dbo].[ReporteBajas] ([IdCine], [CodigoEmpleado], [Fecha], [Motivo]) VALUES (N'111115', N'20', CAST(N'2020-02-04' AS Date), N'Porque si')
INSERT [dbo].[ReporteBajas] ([IdCine], [CodigoEmpleado], [Fecha], [Motivo]) VALUES (N'111115', N'10', CAST(N'2020-01-04' AS Date), N'Porque si')
INSERT [dbo].[ReporteBajas] ([IdCine], [CodigoEmpleado], [Fecha], [Motivo]) VALUES (N'111112', N'30', CAST(N'2020-04-01' AS Date), N'Porque si')
INSERT [dbo].[ReporteBajas] ([IdCine], [CodigoEmpleado], [Fecha], [Motivo]) VALUES (N'111116', N'40', CAST(N'2020-01-04' AS Date), N'Porque si')
INSERT [dbo].[ReporteBajas] ([IdCine], [CodigoEmpleado], [Fecha], [Motivo]) VALUES (N'111116', N'50', CAST(N'2020-01-14' AS Date), N'Porque si')
INSERT [dbo].[Sala] ([No.Sala], [Capacidad], [HoraApertura], [HoraDescanso], [Dispone3D], [IdCine]) VALUES (1, N'75', CAST(N'16:00:00' AS Time), CAST(N'21:00:00' AS Time), N'si', N'111111')
INSERT [dbo].[Sala] ([No.Sala], [Capacidad], [HoraApertura], [HoraDescanso], [Dispone3D], [IdCine]) VALUES (2, N'80', CAST(N'16:00:00' AS Time), CAST(N'21:00:00' AS Time), N'si', N'111111')
INSERT [dbo].[Sala] ([No.Sala], [Capacidad], [HoraApertura], [HoraDescanso], [Dispone3D], [IdCine]) VALUES (3, N'100', CAST(N'16:00:00' AS Time), CAST(N'21:00:00' AS Time), N'si', N'111111')
INSERT [dbo].[Sala] ([No.Sala], [Capacidad], [HoraApertura], [HoraDescanso], [Dispone3D], [IdCine]) VALUES (4, N'90', CAST(N'16:00:00' AS Time), CAST(N'21:00:00' AS Time), N'no', N'111111')
INSERT [dbo].[Sala] ([No.Sala], [Capacidad], [HoraApertura], [HoraDescanso], [Dispone3D], [IdCine]) VALUES (5, N'60', CAST(N'16:00:00' AS Time), CAST(N'21:00:00' AS Time), N'si', N'111112')
INSERT [dbo].[Sala] ([No.Sala], [Capacidad], [HoraApertura], [HoraDescanso], [Dispone3D], [IdCine]) VALUES (6, N'100', CAST(N'16:00:00' AS Time), CAST(N'21:00:00' AS Time), N'si', N'111112')
INSERT [dbo].[Sala] ([No.Sala], [Capacidad], [HoraApertura], [HoraDescanso], [Dispone3D], [IdCine]) VALUES (7, N'50', CAST(N'16:00:00' AS Time), CAST(N'21:00:00' AS Time), N'no', N'111112')
INSERT [dbo].[Sala] ([No.Sala], [Capacidad], [HoraApertura], [HoraDescanso], [Dispone3D], [IdCine]) VALUES (8, N'50', CAST(N'16:00:00' AS Time), CAST(N'21:00:00' AS Time), N'no', N'111112')
INSERT [dbo].[Sala] ([No.Sala], [Capacidad], [HoraApertura], [HoraDescanso], [Dispone3D], [IdCine]) VALUES (9, N'65', CAST(N'16:00:00' AS Time), CAST(N'21:00:00' AS Time), N'si', N'111113')
INSERT [dbo].[Sala] ([No.Sala], [Capacidad], [HoraApertura], [HoraDescanso], [Dispone3D], [IdCine]) VALUES (10, N'55', CAST(N'16:00:00' AS Time), CAST(N'21:00:00' AS Time), N'si', N'111113')
INSERT [dbo].[Sala] ([No.Sala], [Capacidad], [HoraApertura], [HoraDescanso], [Dispone3D], [IdCine]) VALUES (11, N'25', CAST(N'16:00:00' AS Time), CAST(N'21:00:00' AS Time), N'no', N'111113')
INSERT [dbo].[Sala] ([No.Sala], [Capacidad], [HoraApertura], [HoraDescanso], [Dispone3D], [IdCine]) VALUES (12, N'40', CAST(N'16:00:00' AS Time), CAST(N'21:00:00' AS Time), N'no', N'111113')
INSERT [dbo].[Sala] ([No.Sala], [Capacidad], [HoraApertura], [HoraDescanso], [Dispone3D], [IdCine]) VALUES (13, N'40', CAST(N'16:00:00' AS Time), CAST(N'21:00:00' AS Time), N'no', N'111114')
INSERT [dbo].[Sala] ([No.Sala], [Capacidad], [HoraApertura], [HoraDescanso], [Dispone3D], [IdCine]) VALUES (14, N'95', CAST(N'16:00:00' AS Time), CAST(N'21:00:00' AS Time), N'no', N'111114')
INSERT [dbo].[Sala] ([No.Sala], [Capacidad], [HoraApertura], [HoraDescanso], [Dispone3D], [IdCine]) VALUES (15, N'60', CAST(N'16:00:00' AS Time), CAST(N'21:00:00' AS Time), N'si', N'111114')
INSERT [dbo].[Sala] ([No.Sala], [Capacidad], [HoraApertura], [HoraDescanso], [Dispone3D], [IdCine]) VALUES (16, N'45', CAST(N'16:00:00' AS Time), CAST(N'21:00:00' AS Time), N'si', N'111114')
INSERT [dbo].[Sala] ([No.Sala], [Capacidad], [HoraApertura], [HoraDescanso], [Dispone3D], [IdCine]) VALUES (17, N'100', CAST(N'16:00:00' AS Time), CAST(N'21:00:00' AS Time), N'si', N'111115')
INSERT [dbo].[Sala] ([No.Sala], [Capacidad], [HoraApertura], [HoraDescanso], [Dispone3D], [IdCine]) VALUES (18, N'100', CAST(N'16:00:00' AS Time), CAST(N'21:00:00' AS Time), N'si', N'111115')
INSERT [dbo].[Sala] ([No.Sala], [Capacidad], [HoraApertura], [HoraDescanso], [Dispone3D], [IdCine]) VALUES (19, N'50', CAST(N'16:00:00' AS Time), CAST(N'21:00:00' AS Time), N'no', N'111115')
INSERT [dbo].[Sala] ([No.Sala], [Capacidad], [HoraApertura], [HoraDescanso], [Dispone3D], [IdCine]) VALUES (20, N'50', CAST(N'16:00:00' AS Time), CAST(N'21:00:00' AS Time), N'no', N'111115')
INSERT [dbo].[Sala] ([No.Sala], [Capacidad], [HoraApertura], [HoraDescanso], [Dispone3D], [IdCine]) VALUES (21, N'30', CAST(N'16:00:00' AS Time), CAST(N'21:00:00' AS Time), N'si', N'111116')
INSERT [dbo].[Sala] ([No.Sala], [Capacidad], [HoraApertura], [HoraDescanso], [Dispone3D], [IdCine]) VALUES (22, N'40', CAST(N'16:00:00' AS Time), CAST(N'21:00:00' AS Time), N'no', N'111116')
INSERT [dbo].[Sala] ([No.Sala], [Capacidad], [HoraApertura], [HoraDescanso], [Dispone3D], [IdCine]) VALUES (23, N'40', CAST(N'16:00:00' AS Time), CAST(N'21:00:00' AS Time), N'si', N'111116')
INSERT [dbo].[Sala] ([No.Sala], [Capacidad], [HoraApertura], [HoraDescanso], [Dispone3D], [IdCine]) VALUES (24, N'40', CAST(N'16:00:00' AS Time), CAST(N'21:00:00' AS Time), N'no', N'111116')
INSERT [dbo].[Sala] ([No.Sala], [Capacidad], [HoraApertura], [HoraDescanso], [Dispone3D], [IdCine]) VALUES (25, N'70', CAST(N'16:00:00' AS Time), CAST(N'21:00:00' AS Time), N'si', N'111117')
INSERT [dbo].[Sala] ([No.Sala], [Capacidad], [HoraApertura], [HoraDescanso], [Dispone3D], [IdCine]) VALUES (26, N'50', CAST(N'16:00:00' AS Time), CAST(N'21:00:00' AS Time), N'no', N'111117')
INSERT [dbo].[Sala] ([No.Sala], [Capacidad], [HoraApertura], [HoraDescanso], [Dispone3D], [IdCine]) VALUES (27, N'60', CAST(N'16:00:00' AS Time), CAST(N'21:00:00' AS Time), N'si', N'111117')
INSERT [dbo].[Sala] ([No.Sala], [Capacidad], [HoraApertura], [HoraDescanso], [Dispone3D], [IdCine]) VALUES (28, N'90', CAST(N'16:00:00' AS Time), CAST(N'21:00:00' AS Time), N'si', N'111118')
INSERT [dbo].[Sala] ([No.Sala], [Capacidad], [HoraApertura], [HoraDescanso], [Dispone3D], [IdCine]) VALUES (29, N'80', CAST(N'16:00:00' AS Time), CAST(N'21:00:00' AS Time), N'si', N'111118')
INSERT [dbo].[Sala] ([No.Sala], [Capacidad], [HoraApertura], [HoraDescanso], [Dispone3D], [IdCine]) VALUES (30, N'70', CAST(N'16:00:00' AS Time), CAST(N'21:00:00' AS Time), N'no', N'111118')
INSERT [dbo].[Sala] ([No.Sala], [Capacidad], [HoraApertura], [HoraDescanso], [Dispone3D], [IdCine]) VALUES (31, N'75', CAST(N'16:00:00' AS Time), CAST(N'21:00:00' AS Time), N'no', N'111119')
INSERT [dbo].[Sala] ([No.Sala], [Capacidad], [HoraApertura], [HoraDescanso], [Dispone3D], [IdCine]) VALUES (32, N'85', CAST(N'16:00:00' AS Time), CAST(N'21:00:00' AS Time), N'no', N'111119')
INSERT [dbo].[Sala] ([No.Sala], [Capacidad], [HoraApertura], [HoraDescanso], [Dispone3D], [IdCine]) VALUES (33, N'65', CAST(N'16:00:00' AS Time), CAST(N'21:00:00' AS Time), N'no', N'111119')
INSERT [dbo].[Sala] ([No.Sala], [Capacidad], [HoraApertura], [HoraDescanso], [Dispone3D], [IdCine]) VALUES (34, N'50', CAST(N'16:00:00' AS Time), CAST(N'21:00:00' AS Time), N'no', N'111119')
INSERT [dbo].[Sala] ([No.Sala], [Capacidad], [HoraApertura], [HoraDescanso], [Dispone3D], [IdCine]) VALUES (35, N'80', CAST(N'16:00:00' AS Time), CAST(N'21:00:00' AS Time), N'si', N'111110')
INSERT [dbo].[Sala] ([No.Sala], [Capacidad], [HoraApertura], [HoraDescanso], [Dispone3D], [IdCine]) VALUES (36, N'80', CAST(N'16:00:00' AS Time), CAST(N'21:00:00' AS Time), N'si', N'111110')
INSERT [dbo].[Sala] ([No.Sala], [Capacidad], [HoraApertura], [HoraDescanso], [Dispone3D], [IdCine]) VALUES (37, N'90', CAST(N'16:00:00' AS Time), CAST(N'21:00:00' AS Time), N'si', N'111101')
INSERT [dbo].[Sala] ([No.Sala], [Capacidad], [HoraApertura], [HoraDescanso], [Dispone3D], [IdCine]) VALUES (38, N'90', CAST(N'16:00:00' AS Time), CAST(N'21:00:00' AS Time), N'no', N'111101')
INSERT [dbo].[Sala] ([No.Sala], [Capacidad], [HoraApertura], [HoraDescanso], [Dispone3D], [IdCine]) VALUES (39, N'100', CAST(N'16:00:00' AS Time), CAST(N'21:00:00' AS Time), N'si', N'111102')
INSERT [dbo].[Sala] ([No.Sala], [Capacidad], [HoraApertura], [HoraDescanso], [Dispone3D], [IdCine]) VALUES (40, N'100', CAST(N'16:00:00' AS Time), CAST(N'21:00:00' AS Time), N'si', N'111102')
INSERT [dbo].[Sala] ([No.Sala], [Capacidad], [HoraApertura], [HoraDescanso], [Dispone3D], [IdCine]) VALUES (41, N'20', CAST(N'16:00:00' AS Time), CAST(N'21:00:00' AS Time), N'si', N'111103')
INSERT [dbo].[Sala] ([No.Sala], [Capacidad], [HoraApertura], [HoraDescanso], [Dispone3D], [IdCine]) VALUES (42, N'20', CAST(N'16:00:00' AS Time), CAST(N'21:00:00' AS Time), N'si', N'111103')
INSERT [dbo].[Sala] ([No.Sala], [Capacidad], [HoraApertura], [HoraDescanso], [Dispone3D], [IdCine]) VALUES (43, N'50', CAST(N'16:00:00' AS Time), CAST(N'21:00:00' AS Time), N'si', N'111104')
INSERT [dbo].[Sala] ([No.Sala], [Capacidad], [HoraApertura], [HoraDescanso], [Dispone3D], [IdCine]) VALUES (44, N'50', CAST(N'16:00:00' AS Time), CAST(N'21:00:00' AS Time), N'si', N'111104')
INSERT [dbo].[Sala] ([No.Sala], [Capacidad], [HoraApertura], [HoraDescanso], [Dispone3D], [IdCine]) VALUES (45, N'100', CAST(N'16:00:00' AS Time), CAST(N'21:00:00' AS Time), N'si', N'111105')
ALTER TABLE [dbo].[AcontecimientoCultural]  WITH NOCHECK ADD  CONSTRAINT [FK_AcontecimientoCultural_ExhibicionEspecial] FOREIGN KEY([IdExhibicion])
REFERENCES [dbo].[ExhibicionEspecial] ([IdExhibicionE])
GO
ALTER TABLE [dbo].[AcontecimientoCultural] CHECK CONSTRAINT [FK_AcontecimientoCultural_ExhibicionEspecial]
GO
ALTER TABLE [dbo].[AcontecimientoDeportivo]  WITH NOCHECK ADD  CONSTRAINT [FK_AcontecimientoDeportivo_ExhibicionEspecial] FOREIGN KEY([IdExhibicionE])
REFERENCES [dbo].[ExhibicionEspecial] ([IdExhibicionE])
GO
ALTER TABLE [dbo].[AcontecimientoDeportivo] CHECK CONSTRAINT [FK_AcontecimientoDeportivo_ExhibicionEspecial]
GO
ALTER TABLE [dbo].[Boleto]  WITH NOCHECK ADD  CONSTRAINT [FK_Boleto_Compra] FOREIGN KEY([IDCompra], [IdCine])
REFERENCES [dbo].[Compra] ([IDCompra], [IdCine])
GO
ALTER TABLE [dbo].[Boleto] CHECK CONSTRAINT [FK_Boleto_Compra]
GO
ALTER TABLE [dbo].[Boleto]  WITH NOCHECK ADD  CONSTRAINT [FK_Boleto_Evento] FOREIGN KEY([IdEvento])
REFERENCES [dbo].[Evento] ([IdEvento])
GO
ALTER TABLE [dbo].[Boleto] CHECK CONSTRAINT [FK_Boleto_Evento]
GO
ALTER TABLE [dbo].[Cartelera]  WITH NOCHECK ADD  CONSTRAINT [FK_Cartelera_Contenido] FOREIGN KEY([IdContenido])
REFERENCES [dbo].[Contenido] ([IdContenido])
GO
ALTER TABLE [dbo].[Cartelera] CHECK CONSTRAINT [FK_Cartelera_Contenido]
GO
ALTER TABLE [dbo].[Cartelera]  WITH NOCHECK ADD  CONSTRAINT [FK_Cartelera_No.Sala] FOREIGN KEY([No.Sala])
REFERENCES [dbo].[Sala] ([No.Sala])
GO
ALTER TABLE [dbo].[Cartelera] CHECK CONSTRAINT [FK_Cartelera_No.Sala]
GO
ALTER TABLE [dbo].[Compra]  WITH NOCHECK ADD  CONSTRAINT [FK_Compra_IdCine] FOREIGN KEY([IdCine])
REFERENCES [dbo].[Cine] ([IdCine])
GO
ALTER TABLE [dbo].[Compra] CHECK CONSTRAINT [FK_Compra_IdCine]
GO
ALTER TABLE [dbo].[Evento]  WITH NOCHECK ADD  CONSTRAINT [FK_Evento_Contenido] FOREIGN KEY([IdContenido])
REFERENCES [dbo].[Contenido] ([IdContenido])
GO
ALTER TABLE [dbo].[Evento] CHECK CONSTRAINT [FK_Evento_Contenido]
GO
ALTER TABLE [dbo].[Evento]  WITH NOCHECK ADD  CONSTRAINT [FK_Evento_Sala] FOREIGN KEY([No.Sala])
REFERENCES [dbo].[Sala] ([No.Sala])
GO
ALTER TABLE [dbo].[Evento] CHECK CONSTRAINT [FK_Evento_Sala]
GO
ALTER TABLE [dbo].[ExhibicionEspecial]  WITH NOCHECK ADD  CONSTRAINT [FK_ExhibicionEspecial_Contenido] FOREIGN KEY([IdContenido])
REFERENCES [dbo].[Contenido] ([IdContenido])
GO
ALTER TABLE [dbo].[ExhibicionEspecial] CHECK CONSTRAINT [FK_ExhibicionEspecial_Contenido]
GO
ALTER TABLE [dbo].[Factura]  WITH NOCHECK ADD  CONSTRAINT [FK_Factura_Cliente] FOREIGN KEY([NIT], [Direccion], [Nombre])
REFERENCES [dbo].[Cliente] ([NIT], [Direccion], [Nombre])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Cliente]
GO
ALTER TABLE [dbo].[Factura]  WITH NOCHECK ADD  CONSTRAINT [FK_Factura_Compra] FOREIGN KEY([IDCompra], [IdCine])
REFERENCES [dbo].[Compra] ([IDCompra], [IdCine])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Compra]
GO
ALTER TABLE [dbo].[InterpretesExhibicion]  WITH NOCHECK ADD  CONSTRAINT [FK_InterpretesExhibicion_IdExhibicion] FOREIGN KEY([IdExhibicion])
REFERENCES [dbo].[ExhibicionEspecial] ([IdExhibicionE])
GO
ALTER TABLE [dbo].[InterpretesExhibicion] CHECK CONSTRAINT [FK_InterpretesExhibicion_IdExhibicion]
GO
ALTER TABLE [dbo].[InterpretesExhibicion]  WITH NOCHECK ADD  CONSTRAINT [FK_InterpretesExhibicion_NombreInterprete] FOREIGN KEY([NombreInterprete])
REFERENCES [dbo].[Interprete] ([NombreInterprete])
GO
ALTER TABLE [dbo].[InterpretesExhibicion] CHECK CONSTRAINT [FK_InterpretesExhibicion_NombreInterprete]
GO
ALTER TABLE [dbo].[Opinion]  WITH NOCHECK ADD  CONSTRAINT [FK_Opinion_Contenido] FOREIGN KEY([IdContenido])
REFERENCES [dbo].[Contenido] ([IdContenido])
GO
ALTER TABLE [dbo].[Opinion] CHECK CONSTRAINT [FK_Opinion_Contenido]
GO
ALTER TABLE [dbo].[PeliculaRegular]  WITH NOCHECK ADD  CONSTRAINT [FK_PeliculaRegular_Contenido] FOREIGN KEY([IdContenido])
REFERENCES [dbo].[Contenido] ([IdContenido])
GO
ALTER TABLE [dbo].[PeliculaRegular] CHECK CONSTRAINT [FK_PeliculaRegular_Contenido]
GO
ALTER TABLE [dbo].[ProductoDulceria]  WITH NOCHECK ADD  CONSTRAINT [FK_ProductoDulceria_Compra] FOREIGN KEY([IDCompra], [IdCine])
REFERENCES [dbo].[Compra] ([IDCompra], [IdCine])
GO
ALTER TABLE [dbo].[ProductoDulceria] CHECK CONSTRAINT [FK_ProductoDulceria_Compra]
GO
ALTER TABLE [dbo].[RegistroHistorico]  WITH NOCHECK ADD  CONSTRAINT [FK_RegistroHistorico_Contenido] FOREIGN KEY([IdContenido])
REFERENCES [dbo].[Contenido] ([IdContenido])
GO
ALTER TABLE [dbo].[RegistroHistorico] CHECK CONSTRAINT [FK_RegistroHistorico_Contenido]
GO
ALTER TABLE [dbo].[RegistroRotacion]  WITH NOCHECK ADD  CONSTRAINT [FK_Registro Rotación_Cine] FOREIGN KEY([IdCine])
REFERENCES [dbo].[Cine] ([IdCine])
GO
ALTER TABLE [dbo].[RegistroRotacion] CHECK CONSTRAINT [FK_Registro Rotación_Cine]
GO
ALTER TABLE [dbo].[RegistroRotacion]  WITH NOCHECK ADD  CONSTRAINT [FK_Registro Rotación_Empleado] FOREIGN KEY([CodigoEmpleado])
REFERENCES [dbo].[Empleado] ([CodigoEmpleado])
GO
ALTER TABLE [dbo].[RegistroRotacion] CHECK CONSTRAINT [FK_Registro Rotación_Empleado]
GO
ALTER TABLE [dbo].[Reparto]  WITH NOCHECK ADD  CONSTRAINT [FK_Reparto_Actor] FOREIGN KEY([NombreActor])
REFERENCES [dbo].[Actor] ([NombreArtistico])
GO
ALTER TABLE [dbo].[Reparto] CHECK CONSTRAINT [FK_Reparto_Actor]
GO
ALTER TABLE [dbo].[Reparto]  WITH NOCHECK ADD  CONSTRAINT [FK_Reparto_PeliculaRegular] FOREIGN KEY([IdPelicula])
REFERENCES [dbo].[PeliculaRegular] ([IdPelicula])
GO
ALTER TABLE [dbo].[Reparto] CHECK CONSTRAINT [FK_Reparto_PeliculaRegular]
GO
ALTER TABLE [dbo].[ReporteBajas]  WITH NOCHECK ADD  CONSTRAINT [FK_Reporte Bajas_Cine] FOREIGN KEY([IdCine])
REFERENCES [dbo].[Cine] ([IdCine])
GO
ALTER TABLE [dbo].[ReporteBajas] CHECK CONSTRAINT [FK_Reporte Bajas_Cine]
GO
ALTER TABLE [dbo].[ReporteBajas]  WITH NOCHECK ADD  CONSTRAINT [FK_Reporte Bajas_Empleado] FOREIGN KEY([CodigoEmpleado])
REFERENCES [dbo].[Empleado] ([CodigoEmpleado])
GO
ALTER TABLE [dbo].[ReporteBajas] CHECK CONSTRAINT [FK_Reporte Bajas_Empleado]
GO
ALTER TABLE [dbo].[Sala]  WITH NOCHECK ADD  CONSTRAINT [FK_Sala_Cine] FOREIGN KEY([IdCine])
REFERENCES [dbo].[Cine] ([IdCine])
GO
ALTER TABLE [dbo].[Sala] CHECK CONSTRAINT [FK_Sala_Cine]
GO
/****** Object:  StoredProcedure [dbo].[sp_alterdiagram]    Script Date: 01/05/2020 11:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_alterdiagram]
	(
		@diagramname 	sysname,
		@owner_id	int	= null,
		@version 	int,
		@definition 	varbinary(max)
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
	
		declare @theId 			int
		declare @retval 		int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
		declare @ShouldChangeUID	int
	
		if(@diagramname is null)
		begin
			RAISERROR ('Invalid ARG', 16, 1)
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID();	 
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		revert;
	
		select @ShouldChangeUID = 0
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		
		if(@DiagId IS NULL or (@IsDbo = 0 and @theId <> @UIDFound))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1);
			return -3
		end
	
		if(@IsDbo <> 0)
		begin
			if(@UIDFound is null or USER_NAME(@UIDFound) is null) -- invalid principal_id
			begin
				select @ShouldChangeUID = 1 ;
			end
		end

		-- update dds data			
		update dbo.sysdiagrams set definition = @definition where diagram_id = @DiagId ;

		-- change owner
		if(@ShouldChangeUID = 1)
			update dbo.sysdiagrams set principal_id = @theId where diagram_id = @DiagId ;

		-- update dds version
		if(@version is not null)
			update dbo.sysdiagrams set version = @version where diagram_id = @DiagId ;

		return 0
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_creatediagram]    Script Date: 01/05/2020 11:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_creatediagram]
	(
		@diagramname 	sysname,
		@owner_id		int	= null, 	
		@version 		int,
		@definition 	varbinary(max)
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
	
		declare @theId int
		declare @retval int
		declare @IsDbo	int
		declare @userName sysname
		if(@version is null or @diagramname is null)
		begin
			RAISERROR (N'E_INVALIDARG', 16, 1);
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID(); 
		select @IsDbo = IS_MEMBER(N'db_owner');
		revert; 
		
		if @owner_id is null
		begin
			select @owner_id = @theId;
		end
		else
		begin
			if @theId <> @owner_id
			begin
				if @IsDbo = 0
				begin
					RAISERROR (N'E_INVALIDARG', 16, 1);
					return -1
				end
				select @theId = @owner_id
			end
		end
		-- next 2 line only for test, will be removed after define name unique
		if EXISTS(select diagram_id from dbo.sysdiagrams where principal_id = @theId and name = @diagramname)
		begin
			RAISERROR ('The name is already used.', 16, 1);
			return -2
		end
	
		insert into dbo.sysdiagrams(name, principal_id , version, definition)
				VALUES(@diagramname, @theId, @version, @definition) ;
		
		select @retval = @@IDENTITY 
		return @retval
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_dropdiagram]    Script Date: 01/05/2020 11:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_dropdiagram]
	(
		@diagramname 	sysname,
		@owner_id	int	= null
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
		declare @theId 			int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
	
		if(@diagramname is null)
		begin
			RAISERROR ('Invalid value', 16, 1);
			return -1
		end
	
		EXECUTE AS CALLER;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		REVERT; 
		
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1)
			return -3
		end
	
		delete from dbo.sysdiagrams where diagram_id = @DiagId;
	
		return 0;
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_helpdiagramdefinition]    Script Date: 01/05/2020 11:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_helpdiagramdefinition]
	(
		@diagramname 	sysname,
		@owner_id	int	= null 		
	)
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		set nocount on

		declare @theId 		int
		declare @IsDbo 		int
		declare @DiagId		int
		declare @UIDFound	int
	
		if(@diagramname is null)
		begin
			RAISERROR (N'E_INVALIDARG', 16, 1);
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner');
		if(@owner_id is null)
			select @owner_id = @theId;
		revert; 
	
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname;
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId ))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1);
			return -3
		end

		select version, definition FROM dbo.sysdiagrams where diagram_id = @DiagId ; 
		return 0
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_helpdiagrams]    Script Date: 01/05/2020 11:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_helpdiagrams]
	(
		@diagramname sysname = NULL,
		@owner_id int = NULL
	)
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		DECLARE @user sysname
		DECLARE @dboLogin bit
		EXECUTE AS CALLER;
			SET @user = USER_NAME();
			SET @dboLogin = CONVERT(bit,IS_MEMBER('db_owner'));
		REVERT;
		SELECT
			[Database] = DB_NAME(),
			[Name] = name,
			[ID] = diagram_id,
			[Owner] = USER_NAME(principal_id),
			[OwnerID] = principal_id
		FROM
			sysdiagrams
		WHERE
			(@dboLogin = 1 OR USER_NAME(principal_id) = @user) AND
			(@diagramname IS NULL OR name = @diagramname) AND
			(@owner_id IS NULL OR principal_id = @owner_id)
		ORDER BY
			4, 5, 1
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_renamediagram]    Script Date: 01/05/2020 11:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_renamediagram]
	(
		@diagramname 		sysname,
		@owner_id		int	= null,
		@new_diagramname	sysname
	
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
		declare @theId 			int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
		declare @DiagIdTarg		int
		declare @u_name			sysname
		if((@diagramname is null) or (@new_diagramname is null))
		begin
			RAISERROR ('Invalid value', 16, 1);
			return -1
		end
	
		EXECUTE AS CALLER;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		REVERT;
	
		select @u_name = USER_NAME(@owner_id)
	
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1)
			return -3
		end
	
		-- if((@u_name is not null) and (@new_diagramname = @diagramname))	-- nothing will change
		--	return 0;
	
		if(@u_name is null)
			select @DiagIdTarg = diagram_id from dbo.sysdiagrams where principal_id = @theId and name = @new_diagramname
		else
			select @DiagIdTarg = diagram_id from dbo.sysdiagrams where principal_id = @owner_id and name = @new_diagramname
	
		if((@DiagIdTarg is not null) and  @DiagId <> @DiagIdTarg)
		begin
			RAISERROR ('The name is already used.', 16, 1);
			return -2
		end		
	
		if(@u_name is null)
			update dbo.sysdiagrams set [name] = @new_diagramname, principal_id = @theId where diagram_id = @DiagId
		else
			update dbo.sysdiagrams set [name] = @new_diagramname where diagram_id = @DiagId
		return 0
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_upgraddiagrams]    Script Date: 01/05/2020 11:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_upgraddiagrams]
	AS
	BEGIN
		IF OBJECT_ID(N'dbo.sysdiagrams') IS NOT NULL
			return 0;
	
		CREATE TABLE dbo.sysdiagrams
		(
			name sysname NOT NULL,
			principal_id int NOT NULL,	-- we may change it to varbinary(85)
			diagram_id int PRIMARY KEY IDENTITY,
			version int,
	
			definition varbinary(max)
			CONSTRAINT UK_principal_name UNIQUE
			(
				principal_id,
				name
			)
		);


		/* Add this if we need to have some form of extended properties for diagrams */
		/*
		IF OBJECT_ID(N'dbo.sysdiagram_properties') IS NULL
		BEGIN
			CREATE TABLE dbo.sysdiagram_properties
			(
				diagram_id int,
				name sysname,
				value varbinary(max) NOT NULL
			)
		END
		*/

		IF OBJECT_ID(N'dbo.dtproperties') IS NOT NULL
		begin
			insert into dbo.sysdiagrams
			(
				[name],
				[principal_id],
				[version],
				[definition]
			)
			select	 
				convert(sysname, dgnm.[uvalue]),
				DATABASE_PRINCIPAL_ID(N'dbo'),			-- will change to the sid of sa
				0,							-- zero for old format, dgdef.[version],
				dgdef.[lvalue]
			from dbo.[dtproperties] dgnm
				inner join dbo.[dtproperties] dggd on dggd.[property] = 'DtgSchemaGUID' and dggd.[objectid] = dgnm.[objectid]	
				inner join dbo.[dtproperties] dgdef on dgdef.[property] = 'DtgSchemaDATA' and dgdef.[objectid] = dgnm.[objectid]
				
			where dgnm.[property] = 'DtgSchemaNAME' and dggd.[uvalue] like N'_EA3E6268-D998-11CE-9454-00AA00A3F36E_' 
			return 2;
		end
		return 1;
	END
	
GO
EXEC sys.sp_addextendedproperty @name=N'microsoft_database_tools_support', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysdiagrams'
GO
USE [master]
GO
ALTER DATABASE [CINEMARK] SET  READ_WRITE 
GO
