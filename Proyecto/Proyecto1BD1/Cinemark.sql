USE [master]
GO
/****** Object:  Database [CINEMARK]    Script Date: 27/03/2020 21:02:01 ******/
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
ALTER DATABASE [CINEMARK] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 7), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 10, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [CINEMARK]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_diagramobjects]    Script Date: 27/03/2020 21:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE FUNCTION [dbo].[fn_diagramobjects]() 
	RETURNS int
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		declare @id_upgraddiagrams		int
		declare @id_sysdiagrams			int
		declare @id_helpdiagrams		int
		declare @id_helpdiagramdefinition	int
		declare @id_creatediagram	int
		declare @id_renamediagram	int
		declare @id_alterdiagram 	int 
		declare @id_dropdiagram		int
		declare @InstalledObjects	int

		select @InstalledObjects = 0

		select 	@id_upgraddiagrams = object_id(N'dbo.sp_upgraddiagrams'),
			@id_sysdiagrams = object_id(N'dbo.sysdiagrams'),
			@id_helpdiagrams = object_id(N'dbo.sp_helpdiagrams'),
			@id_helpdiagramdefinition = object_id(N'dbo.sp_helpdiagramdefinition'),
			@id_creatediagram = object_id(N'dbo.sp_creatediagram'),
			@id_renamediagram = object_id(N'dbo.sp_renamediagram'),
			@id_alterdiagram = object_id(N'dbo.sp_alterdiagram'), 
			@id_dropdiagram = object_id(N'dbo.sp_dropdiagram')

		if @id_upgraddiagrams is not null
			select @InstalledObjects = @InstalledObjects + 1
		if @id_sysdiagrams is not null
			select @InstalledObjects = @InstalledObjects + 2
		if @id_helpdiagrams is not null
			select @InstalledObjects = @InstalledObjects + 4
		if @id_helpdiagramdefinition is not null
			select @InstalledObjects = @InstalledObjects + 8
		if @id_creatediagram is not null
			select @InstalledObjects = @InstalledObjects + 16
		if @id_renamediagram is not null
			select @InstalledObjects = @InstalledObjects + 32
		if @id_alterdiagram  is not null
			select @InstalledObjects = @InstalledObjects + 64
		if @id_dropdiagram is not null
			select @InstalledObjects = @InstalledObjects + 128
		
		return @InstalledObjects 
	END
	
GO
/****** Object:  Table [dbo].[AcontecimientoCultural]    Script Date: 27/03/2020 21:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AcontecimientoCultural](
	[IdExhibicion] [nvarchar](6) NOT NULL,
	[NombreCompositor] [nvarchar](100) NOT NULL,
	[LugarDeGrabado] [nvarchar](50) NOT NULL,
	[Interpretes] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_AcontecimientoCultural] PRIMARY KEY CLUSTERED 
(
	[IdExhibicion] ASC,
	[NombreCompositor] ASC,
	[LugarDeGrabado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AcontecimientoDeportivo]    Script Date: 27/03/2020 21:02:01 ******/
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
/****** Object:  Table [dbo].[Actor]    Script Date: 27/03/2020 21:02:01 ******/
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
/****** Object:  Table [dbo].[Boleto]    Script Date: 27/03/2020 21:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Boleto](
	[DetalleCompra] [nvarchar](50) NOT NULL,
	[IdEvento] [nvarchar](6) NOT NULL,
	[Precio] [numeric](8, 2) NOT NULL,
 CONSTRAINT [PK_Boleto] PRIMARY KEY CLUSTERED 
(
	[IdEvento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cine]    Script Date: 27/03/2020 21:02:01 ******/
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
/****** Object:  Table [dbo].[Cliente]    Script Date: 27/03/2020 21:02:01 ******/
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
/****** Object:  Table [dbo].[Compra]    Script Date: 27/03/2020 21:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compra](
	[DetalleCompra] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Compra] PRIMARY KEY CLUSTERED 
(
	[DetalleCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contenido]    Script Date: 27/03/2020 21:02:01 ******/
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
/****** Object:  Table [dbo].[Empleado]    Script Date: 27/03/2020 21:02:01 ******/
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
/****** Object:  Table [dbo].[Evento]    Script Date: 27/03/2020 21:02:01 ******/
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
/****** Object:  Table [dbo].[Exhibicion]    Script Date: 27/03/2020 21:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exhibicion](
	[IdContenido] [nvarchar](6) NOT NULL,
	[FechaExhibicion] [datetime] NOT NULL,
 CONSTRAINT [PK_Exhibicion] PRIMARY KEY CLUSTERED 
(
	[IdContenido] ASC,
	[FechaExhibicion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExhibicionEspecial]    Script Date: 27/03/2020 21:02:01 ******/
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
/****** Object:  Table [dbo].[Factura]    Script Date: 27/03/2020 21:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura](
	[NIT] [nvarchar](8) NOT NULL,
	[Direccion] [nvarchar](200) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[DetalleCompra] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Interprete]    Script Date: 27/03/2020 21:02:01 ******/
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
/****** Object:  Table [dbo].[Opinion]    Script Date: 27/03/2020 21:02:01 ******/
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
/****** Object:  Table [dbo].[PeliculaRegular]    Script Date: 27/03/2020 21:02:01 ******/
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
/****** Object:  Table [dbo].[ProductoDulceria]    Script Date: 27/03/2020 21:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductoDulceria](
	[DetalleCompra] [nvarchar](50) NOT NULL,
	[Producto] [nvarchar](100) NOT NULL,
	[Precio] [numeric](8, 2) NOT NULL,
	[Tamaño] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ProductoDulceria] PRIMARY KEY CLUSTERED 
(
	[Producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegistroHistorico]    Script Date: 27/03/2020 21:02:01 ******/
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
/****** Object:  Table [dbo].[RegistroRotacion]    Script Date: 27/03/2020 21:02:01 ******/
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
/****** Object:  Table [dbo].[Reparto]    Script Date: 27/03/2020 21:02:01 ******/
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
/****** Object:  Table [dbo].[ReporteBajas]    Script Date: 27/03/2020 21:02:01 ******/
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
/****** Object:  Table [dbo].[Sala]    Script Date: 27/03/2020 21:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sala](
	[Numero] [int] NOT NULL,
	[Capacidad] [nvarchar](50) NOT NULL,
	[HoraApertura] [time](7) NOT NULL,
	[HoraDescanso] [time](7) NOT NULL,
	[Dispone3D] [nvarchar](50) NOT NULL,
	[IdCine] [nvarchar](6) NOT NULL,
 CONSTRAINT [PK_Sala] PRIMARY KEY CLUSTERED 
(
	[Numero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sysdiagrams]    Script Date: 27/03/2020 21:02:01 ******/
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
INSERT [dbo].[AcontecimientoDeportivo] ([IdExhibicionE], [Deporte], [LugarDeOrigen]) VALUES (N'1', N'Futbol', N'Espa±a')
INSERT [dbo].[Actor] ([NombreArtistico], [Nacionalidad]) VALUES (N'Adam Sandler', N' Estadounidense')
INSERT [dbo].[Actor] ([NombreArtistico], [Nacionalidad]) VALUES (N'Brad Pitt', N' Estadounidense')
INSERT [dbo].[Actor] ([NombreArtistico], [Nacionalidad]) VALUES (N'Eugenio Derbez', N' Mexicano')
INSERT [dbo].[Actor] ([NombreArtistico], [Nacionalidad]) VALUES (N'Miley Cirus', N' Estadounidense')
INSERT [dbo].[Actor] ([NombreArtistico], [Nacionalidad]) VALUES (N'Robbin Downey', N' Estadounidense')
INSERT [dbo].[Actor] ([NombreArtistico], [Nacionalidad]) VALUES (N'Salma Hallet', N' Mexicana')
INSERT [dbo].[Actor] ([NombreArtistico], [Nacionalidad]) VALUES (N'Scarleth Johansson', N' Estadounidense')
INSERT [dbo].[Actor] ([NombreArtistico], [Nacionalidad]) VALUES (N'The Rock', N' Estadounidense')
INSERT [dbo].[Actor] ([NombreArtistico], [Nacionalidad]) VALUES (N'Vin Diesel', N' Estadounidense')
INSERT [dbo].[Actor] ([NombreArtistico], [Nacionalidad]) VALUES (N'Zack Efron', N' Estadounidense')
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
INSERT [dbo].[Contenido] ([IdContenido], [Titulo], [Genero], [TipoFormato], [Duracion], [Distribuidora], [Director], [Año], [PaisProduccion], [EdadRecomendada], [Descripción]) VALUES (N'11', N'Barca-Real', N'Partido', N'HD', N'2 horas', N'Distribuidora S.', N'JosÚ Orellana', N'2019', N'Espa±a', N'12', N'Partido de futbol')
INSERT [dbo].[Contenido] ([IdContenido], [Titulo], [Genero], [TipoFormato], [Duracion], [Distribuidora], [Director], [Año], [PaisProduccion], [EdadRecomendada], [Descripción]) VALUES (N'2', N'Rapidos y furiosos', N'Acci¾n', N'HD', N'2 horas', N'Distribuidora S.', N'JosÚ Orellana', N'2006', N'USA', N'12', N'Pelicula de acci¾n')
INSERT [dbo].[Contenido] ([IdContenido], [Titulo], [Genero], [TipoFormato], [Duracion], [Distribuidora], [Director], [Año], [PaisProduccion], [EdadRecomendada], [Descripción]) VALUES (N'21', N'Concierto Orquesta', N'Concierto', N'En vivo', N'3 horas', N'Orquesta S.', N'Diego Sican', N'2019', N'Guatemala', N'10', N'Concierto de musica clasica')
INSERT [dbo].[Contenido] ([IdContenido], [Titulo], [Genero], [TipoFormato], [Duracion], [Distribuidora], [Director], [Año], [PaisProduccion], [EdadRecomendada], [Descripción]) VALUES (N'3', N'The Avengers', N'Acci¾n', N'HD', N'2 horas', N'Distribuidora S.', N'JosÚ Orellana', N'2012', N'USA', N'12', N'Pelicula de acci¾n')
INSERT [dbo].[Contenido] ([IdContenido], [Titulo], [Genero], [TipoFormato], [Duracion], [Distribuidora], [Director], [Año], [PaisProduccion], [EdadRecomendada], [Descripción]) VALUES (N'4', N'Jack y Jill', N'Comedia', N'HD', N'2 horas', N'Distribuidora S.', N'JosÚ Orellana', N'2014', N'USA', N'12', N'Pelicula de comedia')
INSERT [dbo].[Contenido] ([IdContenido], [Titulo], [Genero], [TipoFormato], [Duracion], [Distribuidora], [Director], [Año], [PaisProduccion], [EdadRecomendada], [Descripción]) VALUES (N'5', N'Gloria', N'Comedia', N'HD', N'2 horas', N'Distribuidora S.', N'JosÚ Orellana', N'2015', N'Mexico', N'12', N'Pelicula de acci¾n')
INSERT [dbo].[Contenido] ([IdContenido], [Titulo], [Genero], [TipoFormato], [Duracion], [Distribuidora], [Director], [Año], [PaisProduccion], [EdadRecomendada], [Descripción]) VALUES (N'6', N'Hanna Montana', N'Musica', N'HD', N'2 horas', N'Distribuidora S.', N'JosÚ Orellana', N'2011', N'USA', N'12', N'Pelicula de musica')
INSERT [dbo].[Contenido] ([IdContenido], [Titulo], [Genero], [TipoFormato], [Duracion], [Distribuidora], [Director], [Año], [PaisProduccion], [EdadRecomendada], [Descripción]) VALUES (N'7', N'Masa alla del cielo', N'Misterio', N'HD', N'2 horas', N'Distribuidora S.', N'JosÚ Orellana', N'2016', N'USA', N'12', N'Pelicula demisterio')
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'000001', N'JosÚ', N'Orellana', CAST(N'1990-02-10' AS Date), CAST(6000.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'000002', N'Edgar', N'Paredes', CAST(N'1970-03-10' AS Date), CAST(6000.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'000003', N'Alex', N'Garcia', CAST(N'1970-03-10' AS Date), CAST(10000.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'000004', N'Pablo', N'Garcia', CAST(N'1970-03-12' AS Date), CAST(10000.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'000005', N'Alejandro', N'Juarez', CAST(N'1970-03-10' AS Date), CAST(1100.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'000006', N'Pedro', N'De leon', CAST(N'1980-04-10' AS Date), CAST(10000.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'000007', N'JosÚ', N'Tejeda', CAST(N'1990-03-10' AS Date), CAST(10000.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'000008', N'Alex', N'Villatoro', CAST(N'1970-03-10' AS Date), CAST(10000.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'000009', N'Diana', N'Hernandez', CAST(N'1980-05-10' AS Date), CAST(12000.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'000010', N'Arnold', N'Boch', CAST(N'1970-03-10' AS Date), CAST(10000.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'000011', N'Juan', N'Galvez', CAST(N'1970-12-10' AS Date), CAST(10500.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'000012', N'Vinicio', N'Garcia', CAST(N'1990-04-10' AS Date), CAST(10000.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'000013', N'Santiago', N'Motta', CAST(N'1978-05-10' AS Date), CAST(13000.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'000014', N'Derly', N'Rodas', CAST(N'1980-01-10' AS Date), CAST(10000.00 AS Numeric(10, 2)))
INSERT [dbo].[Empleado] ([CodigoEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Salario]) VALUES (N'000015', N'Carlos', N'Bickford', CAST(N'1970-10-10' AS Date), CAST(10000.00 AS Numeric(10, 2)))
INSERT [dbo].[Exhibicion] ([IdContenido], [FechaExhibicion]) VALUES (N'1', CAST(N'2020-01-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Exhibicion] ([IdContenido], [FechaExhibicion]) VALUES (N'2', CAST(N'2020-01-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Exhibicion] ([IdContenido], [FechaExhibicion]) VALUES (N'3', CAST(N'2020-01-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Exhibicion] ([IdContenido], [FechaExhibicion]) VALUES (N'4', CAST(N'2020-01-12T00:00:00.000' AS DateTime))
INSERT [dbo].[ExhibicionEspecial] ([IdContenido], [IdExhibicionE]) VALUES (N'11', N'1')
INSERT [dbo].[ExhibicionEspecial] ([IdContenido], [IdExhibicionE]) VALUES (N'21', N'2')
INSERT [dbo].[Opinion] ([IdContenido], [NombrePersona], [Fecha], [Edad], [Calificacion], [Comentario]) VALUES (N'1', N'Claudia Lopez', CAST(N'2020-01-12T00:00:00.000' AS DateTime), N'30', N'Muy buena', N'Buena pelicula')
INSERT [dbo].[Opinion] ([IdContenido], [NombrePersona], [Fecha], [Edad], [Calificacion], [Comentario]) VALUES (N'1', N'JosÚ Ramirez', CAST(N'2020-01-12T00:00:00.000' AS DateTime), N'15', N'Muy buena', N'Buena trama')
INSERT [dbo].[Opinion] ([IdContenido], [NombrePersona], [Fecha], [Edad], [Calificacion], [Comentario]) VALUES (N'2', N'Edgar Paredes', CAST(N'2020-01-12T00:00:00.000' AS DateTime), N'20', N'Obra Maestra', N'Buenos efectos')
INSERT [dbo].[Opinion] ([IdContenido], [NombrePersona], [Fecha], [Edad], [Calificacion], [Comentario]) VALUES (N'3', N'Charlie Bickford', CAST(N'2020-01-12T00:00:00.000' AS DateTime), N'21', N'Muy buena', N'Excelentes efectos ')
INSERT [dbo].[Opinion] ([IdContenido], [NombrePersona], [Fecha], [Edad], [Calificacion], [Comentario]) VALUES (N'3', N'JosÚ Rodriguez', CAST(N'2020-01-12T00:00:00.000' AS DateTime), N'19', N'Obra Maestra', N'Mi favorita')
INSERT [dbo].[Opinion] ([IdContenido], [NombrePersona], [Fecha], [Edad], [Calificacion], [Comentario]) VALUES (N'3', N'Pedro Azurdia', CAST(N'2020-01-12T00:00:00.000' AS DateTime), N'17', N'Muy buena', N'Buena trama')
INSERT [dbo].[Opinion] ([IdContenido], [NombrePersona], [Fecha], [Edad], [Calificacion], [Comentario]) VALUES (N'4', N'JosÚ Perez', CAST(N'2020-01-12T00:00:00.000' AS DateTime), N'15', N'Muy buena', N'Muy buena pelicula')
INSERT [dbo].[Opinion] ([IdContenido], [NombrePersona], [Fecha], [Edad], [Calificacion], [Comentario]) VALUES (N'4', N'Pedro Ramirez', CAST(N'2020-01-12T00:00:00.000' AS DateTime), N'25', N'Muy buena', N'Da mucha risa')
INSERT [dbo].[PeliculaRegular] ([IdContenido], [IdPelicula]) VALUES (N'1', N'1')
INSERT [dbo].[PeliculaRegular] ([IdContenido], [IdPelicula]) VALUES (N'2', N'2')
INSERT [dbo].[PeliculaRegular] ([IdContenido], [IdPelicula]) VALUES (N'3', N'3')
INSERT [dbo].[PeliculaRegular] ([IdContenido], [IdPelicula]) VALUES (N'4', N'4')
INSERT [dbo].[PeliculaRegular] ([IdContenido], [IdPelicula]) VALUES (N'5', N'5')
INSERT [dbo].[PeliculaRegular] ([IdContenido], [IdPelicula]) VALUES (N'6', N'6')
INSERT [dbo].[PeliculaRegular] ([IdContenido], [IdPelicula]) VALUES (N'7', N'7')
INSERT [dbo].[RegistroHistorico] ([IdContenido], [Fecha], [FechaUltimaExhibición]) VALUES (N'5', CAST(N'2020-03-03T00:00:00.000' AS DateTime), CAST(N'2019-01-12T00:00:00.000' AS DateTime))
INSERT [dbo].[RegistroHistorico] ([IdContenido], [Fecha], [FechaUltimaExhibición]) VALUES (N'6', CAST(N'2020-03-03T00:00:00.000' AS DateTime), CAST(N'2019-01-12T00:00:00.000' AS DateTime))
INSERT [dbo].[RegistroHistorico] ([IdContenido], [Fecha], [FechaUltimaExhibición]) VALUES (N'7', CAST(N'2020-03-03T00:00:00.000' AS DateTime), CAST(N'2019-01-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Reparto] ([NombreActor], [IdPelicula], [NombrePersonaje]) VALUES (N'Adam Sandler', N'4', N'Jack')
INSERT [dbo].[Reparto] ([NombreActor], [IdPelicula], [NombrePersonaje]) VALUES (N'Brad Pitt', N'1', N'Aquiles')
INSERT [dbo].[Reparto] ([NombreActor], [IdPelicula], [NombrePersonaje]) VALUES (N'Eugenio Derbez', N'4', N'Felipe')
INSERT [dbo].[Reparto] ([NombreActor], [IdPelicula], [NombrePersonaje]) VALUES (N'Miley Cirus', N'6', N'Miley')
INSERT [dbo].[Reparto] ([NombreActor], [IdPelicula], [NombrePersonaje]) VALUES (N'Robbin Downey', N'3', N'Iron Man')
INSERT [dbo].[Reparto] ([NombreActor], [IdPelicula], [NombrePersonaje]) VALUES (N'Salma Hallet', N'5', N'Gloria')
INSERT [dbo].[Reparto] ([NombreActor], [IdPelicula], [NombrePersonaje]) VALUES (N'Scarleth Johansson', N'3', N'Natasha')
INSERT [dbo].[Reparto] ([NombreActor], [IdPelicula], [NombrePersonaje]) VALUES (N'The Rock', N'2', N'Hobbs ')
INSERT [dbo].[Reparto] ([NombreActor], [IdPelicula], [NombrePersonaje]) VALUES (N'Vin Diesel', N'2', N'Dominic')
INSERT [dbo].[Reparto] ([NombreActor], [IdPelicula], [NombrePersonaje]) VALUES (N'Zack Efron', N'7', N'Charlie')
INSERT [dbo].[ReporteBajas] ([IdCine], [CodigoEmpleado], [Fecha], [Motivo]) VALUES (N'111111', N'000001', CAST(N'2020-03-10' AS Date), N'Porque si')
INSERT [dbo].[ReporteBajas] ([IdCine], [CodigoEmpleado], [Fecha], [Motivo]) VALUES (N'111111', N'000010', CAST(N'2020-03-10' AS Date), N'Porque si')
INSERT [dbo].[ReporteBajas] ([IdCine], [CodigoEmpleado], [Fecha], [Motivo]) VALUES (N'111111', N'000011', CAST(N'2020-03-10' AS Date), N'Porque si')
INSERT [dbo].[ReporteBajas] ([IdCine], [CodigoEmpleado], [Fecha], [Motivo]) VALUES (N'111111', N'000012', CAST(N'2020-03-12' AS Date), N'Porque si')
INSERT [dbo].[ReporteBajas] ([IdCine], [CodigoEmpleado], [Fecha], [Motivo]) VALUES (N'111111', N'000013', CAST(N'2020-01-10' AS Date), N'Porque si')
INSERT [dbo].[ReporteBajas] ([IdCine], [CodigoEmpleado], [Fecha], [Motivo]) VALUES (N'111111', N'000014', CAST(N'2020-02-10' AS Date), N'Porque si')
INSERT [dbo].[ReporteBajas] ([IdCine], [CodigoEmpleado], [Fecha], [Motivo]) VALUES (N'111112', N'000002', CAST(N'2020-03-11' AS Date), N'Porque si')
INSERT [dbo].[ReporteBajas] ([IdCine], [CodigoEmpleado], [Fecha], [Motivo]) VALUES (N'111113', N'000003', CAST(N'2020-01-10' AS Date), N'Porque si')
INSERT [dbo].[ReporteBajas] ([IdCine], [CodigoEmpleado], [Fecha], [Motivo]) VALUES (N'111114', N'000004', CAST(N'2020-03-10' AS Date), N'Porque si')
INSERT [dbo].[ReporteBajas] ([IdCine], [CodigoEmpleado], [Fecha], [Motivo]) VALUES (N'111115', N'000015', CAST(N'2020-03-10' AS Date), N'Porque si')
INSERT [dbo].[Sala] ([Numero], [Capacidad], [HoraApertura], [HoraDescanso], [Dispone3D], [IdCine]) VALUES (111111, N'100', CAST(N'16:00:00' AS Time), CAST(N'21:00:00' AS Time), N'si', N'111111')
INSERT [dbo].[Sala] ([Numero], [Capacidad], [HoraApertura], [HoraDescanso], [Dispone3D], [IdCine]) VALUES (111112, N'100', CAST(N'16:00:00' AS Time), CAST(N'21:00:00' AS Time), N'si', N'111112')
INSERT [dbo].[Sala] ([Numero], [Capacidad], [HoraApertura], [HoraDescanso], [Dispone3D], [IdCine]) VALUES (111113, N'100', CAST(N'16:00:00' AS Time), CAST(N'21:00:00' AS Time), N'si', N'111111')
INSERT [dbo].[Sala] ([Numero], [Capacidad], [HoraApertura], [HoraDescanso], [Dispone3D], [IdCine]) VALUES (111114, N'100', CAST(N'16:00:00' AS Time), CAST(N'21:00:00' AS Time), N'si', N'111115')
INSERT [dbo].[Sala] ([Numero], [Capacidad], [HoraApertura], [HoraDescanso], [Dispone3D], [IdCine]) VALUES (111115, N'100', CAST(N'16:00:00' AS Time), CAST(N'21:00:00' AS Time), N'si', N'111111')
INSERT [dbo].[Sala] ([Numero], [Capacidad], [HoraApertura], [HoraDescanso], [Dispone3D], [IdCine]) VALUES (111116, N'100', CAST(N'16:00:00' AS Time), CAST(N'21:00:00' AS Time), N'si', N'111111')
INSERT [dbo].[Sala] ([Numero], [Capacidad], [HoraApertura], [HoraDescanso], [Dispone3D], [IdCine]) VALUES (111117, N'100', CAST(N'16:00:00' AS Time), CAST(N'21:00:00' AS Time), N'si', N'111117')
INSERT [dbo].[Sala] ([Numero], [Capacidad], [HoraApertura], [HoraDescanso], [Dispone3D], [IdCine]) VALUES (111118, N'100', CAST(N'16:00:00' AS Time), CAST(N'21:00:00' AS Time), N'si', N'111113')
INSERT [dbo].[Sala] ([Numero], [Capacidad], [HoraApertura], [HoraDescanso], [Dispone3D], [IdCine]) VALUES (111119, N'100', CAST(N'16:00:00' AS Time), CAST(N'21:00:00' AS Time), N'si', N'111115')
INSERT [dbo].[Sala] ([Numero], [Capacidad], [HoraApertura], [HoraDescanso], [Dispone3D], [IdCine]) VALUES (111120, N'100', CAST(N'16:00:00' AS Time), CAST(N'21:00:00' AS Time), N'si', N'111113')
INSERT [dbo].[Sala] ([Numero], [Capacidad], [HoraApertura], [HoraDescanso], [Dispone3D], [IdCine]) VALUES (111121, N'100', CAST(N'16:00:00' AS Time), CAST(N'21:00:00' AS Time), N'si', N'111114')
INSERT [dbo].[Sala] ([Numero], [Capacidad], [HoraApertura], [HoraDescanso], [Dispone3D], [IdCine]) VALUES (111122, N'100', CAST(N'16:00:00' AS Time), CAST(N'21:00:00' AS Time), N'si', N'111112')
SET IDENTITY_INSERT [dbo].[sysdiagrams] ON 

INSERT [dbo].[sysdiagrams] ([name], [principal_id], [diagram_id], [version], [definition]) VALUES (N'Diagram_Cinemark', 1, 1, 1, 0xD0CF11E0A1B11AE1000000000000000000000000000000003E000300FEFF0900060000000000000000000000010000000100000000000000001000003400000001000000FEFFFFFF0000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFFFF36000000030000000400000005000000060000000700000008000000090000000A0000000B0000000C0000000D000000FEFFFFFF0F000000100000001100000012000000130000001400000015000000160000001700000018000000190000001A0000001B0000001C0000001D0000001E0000001F000000200000002100000022000000230000002400000025000000260000002700000028000000290000002A0000002B0000002C0000002D0000002E0000002F00000030000000310000003200000033000000FEFFFFFFFEFFFFFF55000000FEFFFFFF38000000390000003A0000003B0000003C0000003D0000003E0000003F000000400000004100000042000000430000004400000045000000460000004700000048000000490000004A0000004B0000004C0000004D0000004E0000004F0000005000000051000000520000005300000054000000FEFFFFFF5600000057000000FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF52006F006F007400200045006E00740072007900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000016000500FFFFFFFFFFFFFFFF0200000000000000000000000000000000000000000000000000000000000000303A5311FB03D60135000000C0070000000000006600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004000201FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000000000000000000000000000000000000000020000004A160000000000006F000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040002010100000004000000FFFFFFFF0000000000000000000000000000000000000000000000000000000000000000000000000E000000464A000000000000010043006F006D0070004F0062006A0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000012000201FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000000000000000000000000000000000000000000000005F00000000000000000434000A1E500C05000080550000000F00FFFF4B00000055000000007D0000D85D0000BF2A0000C874010087B40000223800003F98FFFFDE805B10F195D011B0A000AA00BDCB5C0000080030000000000200000300000038002B00000009000000D9E6B0E91C81D011AD5100A0C90F5739F43B7F847F61C74385352986E1D552F8A0327DB2D86295428D98273C25A2DA2D00002C004320000000000000000000008BB6A44AB176EC4B819BE2445991A35834C9D2777977D811907000065B840D9C00002C00432000000000000000000000B1FB31F88D2F7B4BA7148EF74F9AE62D34C9D2777977D811907000065B840D9C420000005015000000C2010000003400A509000007000080010000009A020000008000000A0000805363684772696400DACBFFFF20D1FFFF43696E65202864626F29000000003800A50900000700008002000000A2020000008000000E00008053636847726964008896FFFFB6D1FFFF456D706C6561646F202864626F29000000004000A50900000700008003000000B40200000080000017000080536368477269640070CCFFFF52EAFFFF526567697374726F20526F74616369F36E202864626F290000008C00A50900000700008005000000520000000180000061000080436F6E74726F6C006FCBFFFFC6DFFFFF52656C6174696F6E736869702027464B5F526567697374726F20526F74616369F36E5F43696E65202864626F2927206265747765656E202743696E65202864626F292720616E642027526567697374726F20526F74616369F36E202864626F292700610000002800B50100000700008006000000310000006500000002800000436F6E74726F6C008DBEFFFFBEE5FFFF00009400A50900000700008007000000620000000180000069000080436F6E74726F6C0040B1FFFFA1E4FFFF52656C6174696F6E736869702027464B5F526567697374726F20526F74616369F36E5F456D706C6561646F202864626F2927206265747765656E2027456D706C6561646F202864626F292720616E642027526567697374726F20526F74616369F36E202864626F292700000000002800B50100000700008008000000310000006D00000002800000436F6E74726F6C00B2BBFFFFE6E8FFFF00003C00A50900000700008009000000AC02000000800000130000805363684772696400649CFFFFAAECFFFF5265706F7274652042616A6173202864626F296400008400A5090000070000800A000000620000000180000059000080436F6E74726F6C0095C1FFFFC6DFFFFF52656C6174696F6E736869702027464B5F5265706F7274652042616A61735F43696E65202864626F2927206265747765656E202743696E65202864626F292720616E6420275265706F7274652042616A6173202864626F292700000000002800B5010000070000800B000000310000005D00000002800000436F6E74726F6C003CBEFFFF91E5FFFF00008C00A5090000070000800C000000520000000180000061000080436F6E74726F6C00639BFFFF45E4FFFF52656C6174696F6E736869702027464B5F5265706F7274652042616A61735F456D706C6561646F202864626F2927206265747765656E2027456D706C6561646F202864626F292720616E6420275265706F7274652042616A6173202864626F292700610000002800B5010000070000800D000000310000006500000002800000436F6E74726F6C00848DFFFF2AE9FFFF00003400A5090000070000800E0000009A020000008000000A00008053636847726964003C0F000020D1FFFF53616C61202864626F29000000007000A5090000070000800F000000520000000180000047000080436F6E74726F6C0030FEFFFF1FD0FFFF52656C6174696F6E736869702027464B5F53616C615F43696E65202864626F2927206265747765656E202743696E65202864626F292720616E64202753616C61202864626F29270000002800B50100000700008010000000310000004B00000002800000436F6E74726F6C00C903000065D2FFFF00003400A509000007000080130000009E020000008000000C0000805363684772696400DE3F000020D1FFFF4576656E746F202864626F2900003800A50900000700008016000000A4020000008000000F0000805363684772696400807000004CD2FFFF436F6E74656E69646F202864626F290000007400A5090000070000801700000052000000018000004B000080436F6E74726F6C00A33500001FD0FFFF52656C6174696F6E736869702027464B5F4576656E746F5F53616C61202864626F2927206265747765656E202753616C61202864626F292720616E6420274576656E746F202864626F29270000002800B50100000700008018000000310000004F00000002800000436F6E74726F6C003D37000065D2FFFF00008000A5090000070000801A000000520000000180000055000080436F6E74726F6C00626600004BD1FFFF52656C6174696F6E736869702027464B5F4576656E746F5F436F6E74656E69646F202864626F2927206265747765656E2027436F6E74656E69646F202864626F292720616E6420274576656E746F202864626F292700000000002800B5010000070000801B000000310000005900000002800000436F6E74726F6C007C660000E0D0FFFF00004000A5090000070000801C000000B0020000008000001500008053636847726964001059000050FBFFFF50656C6963756C61526567756C6172202864626F296F290000009000A5090000070000801D000000520000000180000067000080436F6E74726F6C007F6F000025F2FFFF52656C6174696F6E736869702027464B5F50656C6963756C61526567756C61725F436F6E74656E69646F202864626F2927206265747765656E2027436F6E74656E69646F202864626F292720616E64202750656C6963756C61526567756C6172202864626F29270000002800B5010000070000801E000000310000006B00000002800000436F6E74726F6C00E76000006DF7FFFF00004000A5090000070000801F000000B6020000008000001800008053636847726964001C89000050FBFFFF45786869626963696F6E457370656369616C202864626F2900009800A5090000070000802000000052000000018000006D000080436F6E74726F6C001B88000025F2FFFF52656C6174696F6E736869702027464B5F45786869626963696F6E457370656369616C5F436F6E74656E69646F202864626F2927206265747765656E2027436F6E74656E69646F202864626F292720616E64202745786869626963696F6E457370656369616C202864626F292700000000002800B50100000700008021000000310000007100000002800000436F6E74726F6C00297800006DF7FFFF00003800A50900000700008022000000A0020000008000000D0000805363684772696400AC260000BAFAFFFF5265706172746F202864626F2908000000003400A509000007000080230000009C020000008000000B0000805363684772696400B2F3FFFF50FBFFFF4163746F72202864626F290000008C00A50900000700008025000000520000000180000063000080436F6E74726F6C00134D00004FFAFFFF52656C6174696F6E736869702027464B5F5265706172746F5F50656C6963756C61526567756C6172202864626F2927206265747765656E202750656C6963756C61526567756C6172202864626F292720616E6420275265706172746F202864626F29276200002800B50100000700008026000000310000006700000002800000436F6E74726F6C00724C0000E4F9FFFF00007800A5090000070000802700000052000000018000004F000080436F6E74726F6C00361A00004FFAFFFF52656C6174696F6E736869702027464B5F5265706172746F5F4163746F72202864626F2927206265747765656E20274163746F72202864626F292720616E6420275265706172746F202864626F29272400002800B50100000700008028000000310000005300000002800000436F6E74726F6C00631C000095FCFFFF00004800A50900000700008029000000C0020000008000001D0000805363684772696400AC710000A60E000041636F6E746563696D69656E746F4465706F727469766F202864626F2906000000004400A5090000070000802A000000BE020000008000001C00008053636847726964002AA80000100E000041636F6E746563696D69656E746F43756C747572616C202864626F290000B400A5090000070000802B000000520000000180000089000080436F6E74726F6C001B8800009A05000052656C6174696F6E736869702027464B5F41636F6E746563696D69656E746F4465706F727469766F5F45786869626963696F6E457370656369616C202864626F2927206265747765656E202745786869626963696F6E457370656369616C202864626F292720616E64202741636F6E746563696D69656E746F4465706F727469766F202864626F292700000000002800B5010000070000802C000000310000008D00000002800000436F6E74726F6C0097700000D10A00000000B000A5090000070000802D000000520000000180000087000080436F6E74726F6C0029A700009A05000052656C6174696F6E736869702027464B5F41636F6E746563696D69656E746F43756C747572616C5F45786869626963696F6E457370656369616C202864626F2927206265747765656E202745786869626963696F6E457370656369616C202864626F292720616E64202741636F6E746563696D69656E746F43756C747572616C202864626F29270000002800B5010000070000802E000000310000008B00000002800000436F6E74726F6C008B900000860A000000003800A5090000070000802F000000A6020000008000001000008053636847726964002AA80000EA240000496E7465727072657465202864626F290000A000A50900000700008031000000520000000180000077000080436F6E74726F6C0029A70000151D000052656C6174696F6E736869702027464B5F41636F6E746563696D69656E746F43756C747572616C5F496E7465727072657465202864626F2927206265747765656E2027496E7465727072657465202864626F292720616E64202741636F6E746563696D69656E746F43756C747572616C202864626F29270000002800B50100000700008032000000310000007B00000002800000436F6E74726F6C006FA90000B321000000003800A50900000700008033000000A0020000008000000D0000805363684772696400ACBC000048F4FFFF4F70696E696F6E202864626F296F290000008000A50900000700008034000000620000000180000057000080436F6E74726F6C00EF960000B1F2FFFF52656C6174696F6E736869702027464B5F4F70696E696F6E5F436F6E74656E69646F202864626F2927206265747765656E2027436F6E74656E69646F202864626F292720616E6420274F70696E696F6E202864626F29272400002800B50100000700008035000000310000005B00000002800000436F6E74726F6C0019A100008DF5FFFF00004000A50900000700008036000000B4020000008000001700008053636847726964008AB10000FCD6FFFF526567697374726F486973746F7269636F202864626F292900009400A5090000070000803700000052000000018000006B000080436F6E74726F6C00EF960000FBD5FFFF52656C6174696F6E736869702027464B5F526567697374726F486973746F7269636F5F436F6E74656E69646F202864626F2927206265747765656E2027436F6E74656E69646F202864626F292720616E642027526567697374726F486973746F7269636F202864626F29272900002800B50100000700008038000000310000006F00000002800000436F6E74726F6C00AB9C000041D8FFFF00003800A50900000700008039000000A602000000800000100000805363684772696400C8AF000022C0FFFF45786869626963696F6E202864626F2900008800A5090000070000803A00000062000000018000005D000080436F6E74726F6C00EF9600008BCBFFFF52656C6174696F6E736869702027464B5F45786869626963696F6E5F436F6E74656E69646F202864626F2927206265747765656E2027436F6E74656E69646F202864626F292720616E64202745786869626963696F6E202864626F292705000000002800B5010000070000803B000000310000006100000002800000436F6E74726F6C001DA1000091D3FFFF00003400A5090000070000803D0000009E020000008000000C0000805363684772696400DE3F000058B7FFFF426F6C65746F202864626F2900007800A5090000070000803E00000052000000018000004F000080436F6E74726F6C00DD3E00007FC5FFFF52656C6174696F6E736869702027464B5F426F6C65746F5F4576656E746F202864626F2927206265747765656E20274576656E746F202864626F292720616E642027426F6C65746F202864626F29272400002800B5010000070000803F000000310000005300000002800000436F6E74726F6C00234100003DCBFFFF00004000A50900000700008040000000B2020000008000001600008053636847726964001671000058B7FFFF50726F647563746F44756C6365726961202864626F29292900003400A509000007000080410000009E020000008000000C00008053636847726964004E57000040A2FFFF436F6D707261202864626F2900007800A5090000070000804300000052000000018000004F000080436F6E74726F6C004D56000052ACFFFF52656C6174696F6E736869702027464B5F426F6C65746F5F436F6D707261202864626F2927206265747765656E2027436F6D707261202864626F292720616E642027426F6C65746F202864626F29272400002800B50100000700008044000000310000005300000002800000436F6E74726F6C007A4D000087B2FFFF00008C00A50900000700008045000000520000000180000063000080436F6E74726F6C001570000052ACFFFF52656C6174696F6E736869702027464B5F50726F647563746F44756C63657269615F436F6D707261202864626F2927206265747765656E2027436F6D707261202864626F292720616E64202750726F647563746F44756C6365726961202864626F29270000002800B50100000700008046000000310000006700000002800000436F6E74726F6C00C361000087B2FFFF00003800A50900000700008047000000A0020000008000000D000080536368477269640086880000D6A2FFFF46616374757261202864626F2929000000003800A50900000700008048000000A0020000008000000D0000805363684772696400D0B60000D6A2FFFF436C69656E7465202864626F2929000000007C00A50900000700008052000000520000000180000053000080436F6E74726F6C000AAF00006BA2FFFF52656C6174696F6E736869702027464B5F466163747572615F436C69656E7465202864626F2927206265747765656E2027436C69656E7465202864626F292720616E64202746616374757261202864626F29272900002800B50100000700008053000000310000005700000002800000436F6E74726F6C008FAE000000A2FFFF00007C00A50900000700008054000000520000000180000051000080436F6E74726F6C00D17D00006BA2FFFF52656C6174696F6E736869702027464B5F466163747572615F436F6D707261202864626F2927206265747765656E2027436F6D707261202864626F292720616E64202746616374757261202864626F292729272900002800B50100000700008055000000310000005500000002800000436F6E74726F6C00887E0000B1A4FFFF0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002143341208000000823300005D110000785634120700000014010000430069006E00650020002800640062006F0029000000563FDCDB5B3FEAE9693F0000803F0000803FD7D6563FDCDB5B3FEAE9693F0000803F000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000003B000000000000000000000000000000000000003C0100000000000000000000000000002011A11C000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005000000540000002C0000002C0000002C000000340000000000000000000000823300005D110000000000002D0100000D0000000C000000070000001C010000940B00007809000030030000F0030000C402000054060000E805000090030000E8050000800700002805000000000000010000007B170000E502000000000000000000000000000002000000020000001C010000940B000000000000010000007B170000E502000000000000000000000000000002000000020000001C010000940B000001000000000000007B170000E502000000000000000000000000000002000000020000001C010000940B00000000000000000000AC3E00002622000000000000000000000D00000004000000040000001C010000940B0000B00D00007008000078563412040000005200000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F00000005000000430069006E00650000002143341208000000E41B00004615000078563412070000001401000045006D0070006C006500610064006F0020002800640062006F002900000000000080714000000000000024400000000000001440000000C0CC8C6F40000000000000F03F0000000000000000000000000100000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000F03F00000000000000000000000000000000F816377C0000000000000000F417377C20B3377C6060FD246060FD2402000000020000000000000000000000D057B524000000000200000000008C430000204100808E430000204100008C430000704100000000000000000000000000000000000000000000000005000000540000002C0000002C0000002C000000340000000000000000000000E41B000046150000000000002D0100000D0000000C000000070000001C010000D0050000BC04000030030000F0030000C402000030030000E805000090030000E8050000800700002805000000000000010000008F0D0000FA02000000000000000000000000000002000000020000001C010000D005000000000000010000008F0D0000FA02000000000000000000000000000002000000020000001C010000D005000001000000000000008F0D0000FA02000000000000000000000000000002000000020000001C010000D00500000000000000000000672100006323000000000000000000000D00000004000000040000001C010000D0050000D80600003804000078563412040000005A00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000900000045006D0070006C006500610064006F0000002143341208000000932700001E0D000078563412070000001401000052006500670069007300740072006F00200052006F007400610063006900F3006E0020002800640062006F002900000000001440000000A099797840000000000000F03F0000000000000000000000000100000001000000000000000000000000000000000000000000F03F00000000000000000000000000000000000000000000000000000000000000000000000000000000F816377C0000000000000000F417377C20B3377C405BFD24405BFD240200000002000000000000000000000008ECB724000000000200000000002041000020410000A04000002041000020410000A04000000000000000000000000000000000000000000000000005000000540000002C0000002C0000002C000000340000000000000000000000932700001E0D0000000000002D0100000D0000000C000000070000001C010000AC0800002007000030030000F0030000C4020000BC040000E805000090030000E80500008007000028050000000000000100000070120000E502000000000000000000000000000002000000020000001C010000AC080000000000000100000070120000E502000000000000000000000000000002000000020000001C010000AC080000010000000000000070120000E502000000000000000000000000000002000000020000001C010000AC0800000000000000000000F52F00009022000000000000000000000D00000004000000040000001C010000AC080000440A00005406000078563412040000006C00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000001200000052006500670069007300740072006F00200052006F007400610063006900F3006E00000002000B0006CDFFFF7DE2FFFF06CDFFFF52EAFFFF0000000002000000F0F0F000000000000000000000000000000000000100000006000000000000008DBEFFFFBEE5FFFFCA0D00005301000032000000010000020000CA0D0000530100000200000000000500008008000080010000001500010000009001B0300100065461686F6D61190046004B005F0052006500670069007300740072006F00200052006F007400610063006900F3006E005F00430069006E00650004000B006CB2FFFF38E6FFFF0EB6FFFF38E6FFFF0EB6FFFFE8EAFFFF70CCFFFFE8EAFFFF0000000002000000F0F0F00000000000000000000000000000000000010000000800000000000000B2BBFFFFE6E8FFFF95100000530100006200000001000002000095100000530100000200000000000500008008000080010000001500010000009001B0300100065461686F6D611D0046004B005F0052006500670069007300740072006F00200052006F007400610063006900F3006E005F0045006D0070006C006500610064006F002143341208000000AF270000DD1000007856341207000000140100005200650070006F007200740065002000420061006A006100730020002800640062006F0029000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005000000540000002C0000002C0000002C000000340000000000000000000000AF270000DD100000000000002D0100000D0000000C000000070000001C010000AC0800002007000030030000F0030000C4020000BC040000E805000090030000E80500008007000028050000000000000100000070120000E502000000000000000000000000000002000000020000001C010000AC080000000000000100000070120000E502000000000000000000000000000002000000020000001C010000AC080000010000000000000070120000E502000000000000000000000000000002000000020000001C010000AC0800000000000000000000F52F00009022000000000000000000000D00000004000000040000001C010000AC080000440A00005406000078563412040000006400000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000E0000005200650070006F007200740065002000420061006A0061007300000004000B0070CCFFFF7DE2FFFF70CCFFFF93E7FFFF10C3FFFF93E7FFFF10C3FFFFAAECFFFF0000000002000000F0F0F00000000000000000000000000000000000010000000B000000000000003CBEFFFF91E5FFFFFC0B00005301000022000000010000020000FC0B0000530100000200000000000500008008000080010000001500010000009001B0300100065461686F6D61150046004B005F005200650070006F007200740065002000420061006A00610073005F00430069006E00650002000B00FA9CFFFFFCE6FFFFFA9CFFFFAAECFFFF0000000002000000F0F0F00000000000000000000000000000000000010000000D00000000000000848DFFFF2AE9FFFFC70E00005301000032000000010000020000C70E0000530100000200000000000500008008000080010000001500010000009001B0300100065461686F6D61190046004B005F005200650070006F007200740065002000420061006A00610073005F0045006D0070006C006500610064006F00214334120800000093270000EF150000785634120700000014010000530061006C00610020002800640062006F002900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000A4EC8A1CA4EC8A1C02000000020000000200000000000000280BFA24B05174080C04817827130080F816377CFFFFFFFF0000000000000000000070410000704100000000000070410000704100000000F502000000000000F50200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000034ED8A1C34ED8A1C02000000020000000200000000000000E007000000000000000000000000000005000000540000002C0000002C0000002C00000034000000000000000000000093270000EF150000000000002D0100000D0000000C000000070000001C010000AC0800002007000030030000F0030000C4020000BC040000E805000090030000E80500008007000028050000000000000100000070120000E502000000000000000000000000000002000000020000001C010000AC080000000000000100000070120000E502000000000000000000000000000002000000020000001C010000AC080000010000000000000070120000E502000000000000000000000000000002000000020000001C010000AC0800000000000000000000F52F00009022000000000000000000000D00000004000000040000001C010000AC080000440A00005406000078563412040000005200000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F00000005000000530061006C006100000002000B005CFFFFFFB6D1FFFF3C0F0000B6D1FFFF0000000002000000F0F0F00000000000000000000000000000000000010000001000000000000000C903000065D2FFFF07070000530100003200000001000002000007070000530100000200000000000500008008000080010000001500010000009001B0300100065461686F6D610C0046004B005F00530061006C0061005F00430069006E0065002143341208000000B0270000781800007856341207000000140100004500760065006E0074006F0020002800640062006F002900000000000000000000000000010000000000000060D9AC6600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005000000540000002C0000002C0000002C000000340000000000000000000000B027000078180000000000002D0100000D0000000C000000070000001C010000AC0800002007000030030000F0030000C4020000BC040000E805000090030000E80500008007000028050000000000000100000070120000E502000000000000000000000000000002000000020000001C010000AC080000000000000100000070120000E502000000000000000000000000000002000000020000001C010000AC080000010000000000000070120000E502000000000000000000000000000002000000020000001C010000AC0800000000000000000000F52F00009022000000000000000000000D00000004000000040000001C010000AC080000440A00005406000078563412040000005600000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F000000070000004500760065006E0074006F00000021433412080000009B2700009022000078563412070000001401000043006F006E00740065006E00690064006F0020002800640062006F002900000000002440000000A09919794000000060664672400000000000001440000000000000F03F00000000000000000000000001000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000F03F0000000000000000F816377C0000000000000000F417377C20B3377CE8E78A1CE8E78A1C0200000002000000000000000000000048E8B724000000000200000000002041CDCCC84300002041CD4CCB430000A040CDCCC84300000000000000000000000000000000000000000000000005000000540000002C0000002C0000002C0000003400000000000000000000009B27000090220000000000002D0100000D0000000C000000070000001C010000AC0800002007000030030000F0030000C4020000BC040000E805000090030000E80500008007000028050000000000000100000070120000E502000000000000000000000000000002000000020000001C010000AC080000000000000100000070120000E502000000000000000000000000000002000000020000001C010000AC080000010000000000000070120000E502000000000000000000000000000002000000020000001C010000AC0800000000000000000000F52F00009022000000000000000000000D00000004000000040000001C010000AC080000440A00005406000078563412040000005C00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000A00000043006F006E00740065006E00690064006F00000002000B00CF360000B6D1FFFFDE3F0000B6D1FFFF0000000002000000F0F0F000000000000000000000000000000000000100000018000000000000003D37000065D2FFFF33080000530100003200000001000002000033080000530100000200000000000500008008000080010000001500010000009001B0300100065461686F6D610E0046004B005F004500760065006E0074006F005F00530061006C00610002000B0080700000E2D2FFFF8E670000E2D2FFFF0000000002000000F0F0F00000000000000000000000000000000000010000001B000000000000007C660000E0D0FFFF160B00005301000032000000010000020000160B0000530100000200000000000500008008000080010000001500010000009001B0300100065461686F6D61130046004B005F004500760065006E0074006F005F0043006F006E00740065006E00690064006F002143341208000000942700003C0C0000785634120700000014010000500065006C006900630075006C00610052006500670075006C006100720020002800640062006F00290000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005000000540000002C0000002C0000002C000000340000000000000000000000942700003C0C0000000000002D0100000D0000000C000000070000001C010000AC0800002007000030030000F0030000C4020000BC040000E805000090030000E80500008007000028050000000000000100000070120000E502000000000000000000000000000002000000020000001C010000AC080000000000000100000070120000E502000000000000000000000000000002000000020000001C010000AC080000010000000000000070120000E502000000000000000000000000000002000000020000001C010000AC0800000000000000000000F52F00009022000000000000000000000D00000004000000040000001C010000AC080000440A00005406000078563412040000006800000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F00000010000000500065006C006900630075006C00610052006500670075006C0061007200000002000B0016710000DCF4FFFF1671000050FBFFFF0000000002000000F0F0F00000000000000000000000000000000000010000001E00000000000000E76000006DF7FFFF800F00005301000032000000010000020000800F0000530100000200000000000500008008000080010000001500010000009001B0300100065461686F6D611C0046004B005F00500065006C006900630075006C00610052006500670075006C00610072005F0043006F006E00740065006E00690064006F00214334120800000093270000010D0000785634120700000014010000450078006800690062006900630069006F006E0045007300700065006300690061006C0020002800640062006F00290000001440000000C0CC8C6F40000000000000F03F0000000000000000000000000100000001000000000000000000000000000000000000000000F03F00000000000000000000000000000000000000000000000000000000000000000000000000000000F816377C0000000000000000F417377C20B3377C885CFD24885CFD240200000002000000000000000000000088EAB724000000000200000000002041000020410000A04000002041000020410000A04000000000000000000000000000000000000000000000000005000000540000002C0000002C0000002C00000034000000000000000000000093270000010D0000000000002D0100000D0000000C000000070000001C010000AC0800002007000030030000F0030000C4020000BC040000E805000090030000E80500008007000028050000000000000100000070120000E502000000000000000000000000000002000000020000001C010000AC080000000000000100000070120000E502000000000000000000000000000002000000020000001C010000AC080000010000000000000070120000E502000000000000000000000000000002000000020000001C010000AC0800000000000000000000F52F00009022000000000000000000000D00000004000000040000001C010000AC080000440A00005406000078563412040000006E00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F00000013000000450078006800690062006900630069006F006E0045007300700065006300690061006C00000002000B00B2890000DCF4FFFFB289000050FBFFFF0000000002000000F0F0F00000000000000000000000000000000000010000002100000000000000297800006DF7FFFFDA1000005301000032000000010000020000DA100000530100000200000000000500008008000080010000001500010000009001B0300100065461686F6D611F0046004B005F00450078006800690062006900630069006F006E0045007300700065006300690061006C005F0043006F006E00740065006E00690064006F00214334120800000093270000550E00007856341207000000140100005200650070006100720074006F0020002800640062006F00290000000000000000000000010000000000000060D9AC6600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005000000540000002C0000002C0000002C00000034000000000000000000000093270000550E0000000000002D0100000D0000000C000000070000001C010000AC0800002007000030030000F0030000C4020000BC040000E805000090030000E80500008007000028050000000000000100000070120000E502000000000000000000000000000002000000020000001C010000AC080000000000000100000070120000E502000000000000000000000000000002000000020000001C010000AC080000010000000000000070120000E502000000000000000000000000000002000000020000001C010000AC0800000000000000000000F52F00009022000000000000000000000D00000004000000040000001C010000AC080000440A00005406000078563412040000005800000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F000000080000005200650070006100720074006F0000002143341208000000B0270000E30D00007856341207000000140100004100630074006F00720020002800640062006F0029000000000000000000000000000000010000000000000060D9AC6600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005000000540000002C0000002C0000002C000000340000000000000000000000B0270000E30D0000000000002D0100000D0000000C000000070000001C010000AC0800002007000030030000F0030000C4020000BC040000E805000090030000E80500008007000028050000000000000100000070120000E502000000000000000000000000000002000000020000001C010000AC080000000000000100000070120000E502000000000000000000000000000002000000020000001C010000AC080000010000000000000070120000E502000000000000000000000000000002000000020000001C010000AC0800000000000000000000F52F00009022000000000000000000000D00000004000000040000001C010000AC080000440A00005406000078563412040000005400000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F000000060000004100630074006F007200000002000B0010590000E6FBFFFF3F4E0000E6FBFFFF0000000002000000F0F0F00000000000000000000000000000000000010000002600000000000000724C0000E4F9FFFF6B0E000053010000320000000100000200006B0E0000530100000200000000000500008008000080010000001500010000009001B0300100065461686F6D611A0046004B005F005200650070006100720074006F005F00500065006C006900630075006C00610052006500670075006C006100720002000B00621B0000E6FBFFFFAC260000E6FBFFFF0000000002000000F0F0F00000000000000000000000000000000000010000002800000000000000631C000095FCFFFF48090000530100003200000001000002000048090000530100000200000000000500008008000080010000001500010000009001B0300100065461686F6D61100046004B005F005200650070006100720074006F005F004100630074006F00720021433412080000009327000016110000785634120700000014010000410063006F006E0074006500630069006D00690065006E0074006F004400650070006F0072007400690076006F0020002800640062006F002900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005000000540000002C0000002C0000002C0000003400000000000000000000009327000016110000000000002D0100000D0000000C000000070000001C010000AC0800002007000030030000F0030000C4020000BC040000E805000090030000E80500008007000028050000000000000100000070120000E502000000000000000000000000000002000000020000001C010000AC080000000000000100000070120000E502000000000000000000000000000002000000020000001C010000AC080000010000000000000070120000E502000000000000000000000000000002000000020000001C010000AC0800000000000000000000F52F00009022000000000000000000000D00000004000000040000001C010000AC080000440A00005406000078563412040000007800000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F00000018000000410063006F006E0074006500630069006D00690065006E0074006F004400650070006F0072007400690076006F0000002143341208000000B0270000C0110000785634120700000014010000410063006F006E0074006500630069006D00690065006E0074006F00430075006C0074007500720061006C0020002800640062006F0029000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005000000540000002C0000002C0000002C000000340000000000000000000000B0270000C0110000000000002D0100000D0000000C000000070000001C010000AC0800002007000030030000F0030000C4020000BC040000E805000090030000E80500008007000028050000000000000100000070120000E502000000000000000000000000000002000000020000001C010000AC080000000000000100000070120000E502000000000000000000000000000002000000020000001C010000AC080000010000000000000070120000E502000000000000000000000000000002000000020000001C010000AC0800000000000000000000F52F00009022000000000000000000000D00000004000000040000001C010000AC080000440A00005406000078563412040000007600000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F00000017000000410063006F006E0074006500630069006D00690065006E0074006F00430075006C0074007500720061006C00000002000B00B289000051080000B2890000A60E00000000000002000000F0F0F00000000000000000000000000000000000010000002C0000000000000097700000D10A00006C18000053010000320000000100000200006C180000530100000200000000000500008008000080010000001500010000009001B0300100065461686F6D612D0046004B005F00410063006F006E0074006500630069006D00690065006E0074006F004400650070006F0072007400690076006F005F00450078006800690062006900630069006F006E0045007300700065006300690061006C0002000B00C0A8000051080000C0A80000100E00000000000002000000F0F0F00000000000000000000000000000000000010000002E000000000000008B900000860A000086170000530100003200000001000002000086170000530100000200000000000500008008000080010000001500010000009001B0300100065461686F6D612C0046004B005F00410063006F006E0074006500630069006D00690065006E0074006F00430075006C0074007500720061006C005F00450078006800690062006900630069006F006E0045007300700065006300690061006C002143341208000000B0270000CD0A000078563412070000001401000049006E007400650072007000720065007400650020002800640062006F0029000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005000000540000002C0000002C0000002C000000340000000000000000000000B0270000CD0A0000000000002D0100000D0000000C000000070000001C010000AC0800002007000030030000F0030000C4020000BC040000E805000090030000E80500008007000028050000000000000100000070120000E502000000000000000000000000000002000000020000001C010000AC080000000000000100000070120000E502000000000000000000000000000002000000020000001C010000AC080000010000000000000070120000E502000000000000000000000000000002000000020000001C010000AC0800000000000000000000F52F00009022000000000000000000000D00000004000000040000001C010000AC080000440A00005406000078563412040000005E00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000B00000049006E0074006500720070007200650074006500000002000B00C0A80000EA240000C0A80000D01F00000000000002000000F0F0F000000000000000000000000000000000000100000032000000000000006FA90000B321000077130000530100003200000001000002000077130000530100000200000000000500008008000080010000001500010000009001B0300100065461686F6D61240046004B005F00410063006F006E0074006500630069006D00690065006E0074006F00430075006C0074007500720061006C005F0049006E0074006500720070007200650074006500214334120800000094270000B81500007856341207000000140100004F00700069006E0069006F006E0020002800640062006F0029000000000000000080714000000000000024400000000000001440000000C0CC8C6F40000000000000F03F0000000000000000000000000100000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000F03F00000000000000000000000000000000F816377C0000000000000000F417377C20B3377CB896F024B896F0240200000002000000000000000000000008EDB724000000000200000000008C430000204100808E430000204100008C430000704100000000000000000000000000000000000000000000000005000000540000002C0000002C0000002C00000034000000000000000000000094270000B8150000000000002D0100000D0000000C000000070000001C010000AC0800002007000030030000F0030000C4020000BC040000E805000090030000E80500008007000028050000000000000100000070120000E502000000000000000000000000000002000000020000001C010000AC080000000000000100000070120000E502000000000000000000000000000002000000020000001C010000AC080000010000000000000070120000E502000000000000000000000000000002000000020000001C010000AC0800000000000000000000F52F00009022000000000000000000000D00000004000000040000001C010000AC080000440A00005406000078563412040000005800000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F000000080000004F00700069006E0069006F006E00000004000B001B98000048F4FFFF63AA000048F4FFFF63AA0000DEF4FFFFACBC0000DEF4FFFF0000000002000000F0F0F0000000000000000000000000000000000001000000350000000000000019A100008DF5FFFF880B0000530100003A000000010000020000880B000053010000020000000000FFFFFF0008000080010000001500010000009001B0300100065461686F6D61140046004B005F004F00700069006E0069006F006E005F0043006F006E00740065006E00690064006F002143341208000000B0270000A510000078563412070000001401000052006500670069007300740072006F0048006900730074006F007200690063006F0020002800640062006F002900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005000000540000002C0000002C0000002C000000340000000000000000000000B0270000A5100000000000002D0100000D0000000C000000070000001C010000AC0800002007000030030000F0030000C4020000BC040000E805000090030000E80500008007000028050000000000000100000070120000E502000000000000000000000000000002000000020000001C010000AC080000000000000100000070120000E502000000000000000000000000000002000000020000001C010000AC080000010000000000000070120000E502000000000000000000000000000002000000020000001C010000AC0800000000000000000000F52F00009022000000000000000000000D00000004000000040000001C010000AC080000440A00005406000078563412040000006C00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000001200000052006500670069007300740072006F0048006900730074006F007200690063006F00000002000B001B98000092D7FFFF8AB1000092D7FFFF0200000002000000F0F0F00000000000000000000000000000000000010000003800000000000000AB9C000041D8FFFF4F10000053010000320000000100000200004F10000053010000020000000000FFFFFF0008000080010000001500010000009001B0300100065461686F6D611E0046004B005F0052006500670069007300740072006F0048006900730074006F007200690063006F005F0043006F006E00740065006E00690064006F00214334120800000094270000E30D0000785634120700000014010000450078006800690062006900630069006F006E0020002800640062006F00290000000000010000000000000060D9AC6600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005000000540000002C0000002C0000002C00000034000000000000000000000094270000E30D0000000000002D0100000D0000000C000000070000001C010000AC0800002007000030030000F0030000C4020000BC040000E805000090030000E80500008007000028050000000000000100000070120000E502000000000000000000000000000002000000020000001C010000AC080000000000000100000070120000E502000000000000000000000000000002000000020000001C010000AC080000010000000000000070120000E502000000000000000000000000000002000000020000001C010000AC0800000000000000000000F52F00009022000000000000000000000D00000004000000040000001C010000AC080000440A00005406000078563412040000005E00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000B000000450078006800690062006900630069006F006E00000004000B001B980000E2D2FFFFF1A30000E2D2FFFFF1A3000006CDFFFFC8AF000006CDFFFF0000000002000000F0F0F00000000000000000000000000000000000010000003B000000000000001DA1000091D3FFFFB50C0000530100001D000000010000020000B50C000053010000020000000000FFFFFF0008000080010000001500010000009001B0300100065461686F6D61170046004B005F00450078006800690062006900630069006F006E005F0043006F006E00740065006E00690064006F002143341208000000B0270000530F000078563412070000001401000042006F006C00650074006F0020002800640062006F002900000000000000000000000000010000000000000060D9AC6600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005000000540000002C0000002C0000002C000000340000000000000000000000B0270000530F0000000000002D0100000D0000000C000000070000001C010000AC0800002007000030030000F0030000C4020000BC040000E805000090030000E80500008007000028050000000000000100000070120000E502000000000000000000000000000002000000020000001C010000AC080000000000000100000070120000E502000000000000000000000000000002000000020000001C010000AC080000010000000000000070120000E502000000000000000000000000000002000000020000001C010000AC0800000000000000000000F52F00009022000000000000000000000D00000004000000040000001C010000AC080000440A00005406000078563412040000005600000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000700000042006F006C00650074006F00000002000B007440000020D1FFFF74400000ABC6FFFF0200000002000000F0F0F00000000000000000000000000000000000010000003F00000000000000234100003DCBFFFF1A09000053010000320000000100000200001A09000053010000020000000000FFFFFF0008000080010000001500010000009001B0300100065461686F6D61100046004B005F0042006F006C00650074006F005F004500760065006E0074006F00214334120800000094270000A3110000785634120700000014010000500072006F0064007500630074006F00440075006C006300650072006900610020002800640062006F0029000000000000E070400000000000001440000000000000F03F00000000000000000000000001000000010000000000000000000000000000000000000000000000000000000000F03F0000000000000000000000000000000000000000000000000000000000000000F816377C0000000000000000F417377C20B3377C98921025989210250200000002000000000000000000000048EAB72400000000020000000000204100002041000020410000A040000070410000204100000000000000000000000000000000000000000000000005000000540000002C0000002C0000002C00000034000000000000000000000094270000A3110000000000002D0100000D0000000C000000070000001C010000AC0800002007000030030000F0030000C4020000BC040000E805000090030000E80500008007000028050000000000000100000070120000E502000000000000000000000000000002000000020000001C010000AC080000000000000100000070120000E502000000000000000000000000000002000000020000001C010000AC080000010000000000000070120000E502000000000000000000000000000002000000020000001C010000AC0800000000000000000000F52F00009022000000000000000000000D00000004000000040000001C010000AC080000440A00005406000078563412040000006A00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F00000011000000500072006F0064007500630074006F00440075006C006300650072006900610000002143341208000000AF270000C90C000078563412070000001401000043006F006D0070007200610020002800640062006F00290000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005000000540000002C0000002C0000002C000000340000000000000000000000AF270000C90C0000000000002D0100000D0000000C000000070000001C010000AC0800002007000030030000F0030000C4020000BC040000E805000090030000E80500008007000028050000000000000100000070120000E502000000000000000000000000000002000000020000001C010000AC080000000000000100000070120000E502000000000000000000000000000002000000020000001C010000AC080000010000000000000070120000E502000000000000000000000000000002000000020000001C010000AC0800000000000000000000F52F00009022000000000000000000000D00000004000000040000001C010000AC080000440A00005406000078563412040000005600000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000700000043006F006D00700072006100000002000B00E457000009AFFFFFE457000058B7FFFF0000000002000000F0F0F000000000000000000000000000000000000100000044000000000000007A4D000087B2FFFFBB0900005301000032000000010000020000BB09000053010000020000000000FFFFFF0008000080010000001500010000009001B0300100065461686F6D61100046004B005F0042006F006C00650074006F005F0043006F006D0070007200610002000B00AC71000009AFFFFFAC71000058B7FFFF0000000002000000F0F0F00000000000000000000000000000000000010000004600000000000000C361000087B2FFFF3A0F000053010000320000000100000200003A0F000053010000020000000000FFFFFF0008000080010000001500010000009001B0300100065461686F6D611A0046004B005F00500072006F0064007500630074006F00440075006C00630065007200690061005F0043006F006D007000720061002143341208000000B027000031120000785634120700000014010000460061006300740075007200610020002800640062006F00290000000000000000000000010000000000000060D9AC6600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005000000540000002C0000002C0000002C000000340000000000000000000000B027000031120000000000002D0100000D0000000C000000070000001C010000AC0800002007000030030000F0030000C4020000BC040000E805000090030000E80500008007000028050000000000000100000070120000E502000000000000000000000000000002000000020000001C010000AC080000000000000100000070120000E502000000000000000000000000000002000000020000001C010000AC080000010000000000000070120000E502000000000000000000000000000002000000020000001C010000AC0800000000000000000000F52F00009022000000000000000000000D00000004000000040000001C010000AC080000440A00005406000078563412040000005800000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F00000008000000460061006300740075007200610000002143341208000000AF270000FE0E000078563412070000001401000043006C00690065006E007400650020002800640062006F0029000000000000000000244000000000000014400000000000E070400000000000001440000000000000F03F00000000000000000000000001000000010000000000000000000000000000000000000000000000000000000000F03F0000000000000000000000000000000000000000000000000000000000000000F816377C0000000000000000F417377C20B3377C985E861C985E861C02000000020000000000000000000000C8ECB72400000000020000000000204100002041000020410000A040000070410000204100000000000000000000000000000000000000000000000005000000540000002C0000002C0000002C000000340000000000000000000000AF270000FE0E0000000000002D0100000D0000000C000000070000001C010000AC0800002007000030030000F0030000C4020000BC040000E805000090030000E80500008007000028050000000000000100000070120000E502000000000000000000000000000002000000020000001C010000AC080000000000000100000070120000E502000000000000000000000000000002000000020000001C010000AC080000010000000000000070120000E502000000000000000000000000000002000000020000001C010000AC0800000000000000000000F52F00009022000000000000000000000D00000004000000040000001C010000AC080000440A00005406000078563412040000005800000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000800000043006C00690065006E0074006500000002000B00D0B6000002A4FFFF36B0000002A4FFFF0000000002000000F0F0F000000000000000000000000000000000000100000053000000000000008FAE000000A2FFFFE90900005301000032000000010000020000E909000053010000020000000000FFFFFF0008000080010000001500010000009001B0300100065461686F6D61120046004B005F0046006100630074007500720061005F0043006C00690065006E007400650002000B00FD7E000002A4FFFF8688000002A4FFFF0000000002000000F0F0F00000000000000000000000000000000000010000005500000000000000887E0000B1A4FFFF730A00005301000032000000010000020000730A000053010000020000000000FFFFFF0008000080010000001500010000009001B0300100065461686F6D61110046004B005F0046006100630074007500720061005F0043006F006D007000720061000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000FEFFFFFFFEFFFFFF0400000005000000060000000700000008000000090000000A0000000B0000000C0000000D0000000E0000000F000000100000001100000012000000130000001400000015000000160000001700000018000000190000001A0000001B0000001C0000001D000000FEFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0100FEFF030A0000FFFFFFFF00000000000000000000000000000000170000004D6963726F736F66742044445320466F726D20322E300010000000456D626564646564204F626A6563740000000000F439B271000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010003000000000000000C0000000B0000004E61BC00000000000000000000000000000000000000000000000000000000000000000000000000000000000000DBE6B0E91C81D011AD5100A0C90F573900000200A0CA2A11FB03D601020200001048450000000000000000000000000000000000260200004400610074006100200053006F0075007200630065003D00750072006C002D006200640031002D0031003000360035003900310038002E00640061007400610062006100730065002E00770069006E0064006F00770073002E006E00650074003B0049006E0069007400690061006C00200043006100740061006C006F0067003D00430049004E0045004D00410052004B003B005000650072007300690073007400200053006500630075007200690074007900200049006E0066006F003D0054007200750065003B0055007300650072002000490044003D006A0070006F00720065006C006C0061006E0061006D003B004D0075006C007400690070006C0065004100630074000300440064007300530074007200650061006D000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000160002000300000006000000FFFFFFFF00000000000000000000000000000000000000000000000000000000000000000000000037000000343B00000000000053006300680065006D00610020005500440056002000440065006600610075006C0074000000000000000000000000000000000000000000000000000000000026000200FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000000000000000000000000000000000000000020000001600000000000000440053005200450046002D0053004300480045004D0041002D0043004F004E00540045004E0054005300000000000000000000000000000000000000000000002C0002010500000007000000FFFFFFFF00000000000000000000000000000000000000000000000000000000000000000000000003000000AE0600000000000053006300680065006D00610020005500440056002000440065006600610075006C007400200050006F007300740020005600360000000000000000000000000036000200FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000000000001E00000012000000000000000C000000223800003F98FFFF0100260000007300630068005F006C006100620065006C0073005F00760069007300690062006C0065000000010000000B0000001E000000000000000000000000000000000000006400000000000000000000000000000000000000000000000000010000000100000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000030000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003900360034002C0031002C0032003400320034002C0035002C0031003600320030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003900360034000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003900360034000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003900360034000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003900360034002C00310032002C0033003500300034002C00310031002C0032003100360030000000020000000200000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000030000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003800000034002C0030002C003200380034002C0030002C0031003400380038002C0031002C0031003200310032002C0035002C003800310036000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0031003400380038000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0031003400380038000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0031003400380038000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0031003400380038002C00310032002C0031003700350032002C00310031002C0031003000380030000000030000000300000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000030000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200320030002C0031002C0031003800320034002C0035002C0031003200310032000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200320030002C00310032002C0032003600320038002C00310031002C0031003600320030000000050000000500000000000000440000000142367201000000640062006F00000046004B005F0052006500670069007300740072006F00200052006F007400610063006900F3006E005F00430069006E00650000000000000000000000C402000000000600000006000000050000000800000001E5B72488E5B7240000000000000000AD0F00000100000700000007000000000000004C000000014F082C01000000640062006F00000046004B005F0052006500670069007300740072006F00200052006F007400610063006900F3006E005F0045006D0070006C006500610064006F0000000000000000000000C402000000000800000008000000070000000800000001F6EB2428F6EB240000000000000000AD0F0000010000090000000900000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000030000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200320030002C0031002C0031003800320034002C0035002C0031003200310032000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200320030002C00310032002C0032003600320038002C00310031002C00310036003200300000000A0000000A000000000000003C000000014F082C01000000640062006F00000046004B005F005200650070006F007200740065002000420061006A00610073005F00430069006E00650000000000000000000000C402000000000B0000000B0000000A000000080000000101EC24A801EC240000000000000000AD0F00000100000C0000000C00000000000000440000000100000001000000640062006F00000046004B005F005200650070006F007200740065002000420061006A00610073005F0045006D0070006C006500610064006F0000000000000000000000C402000000000D0000000D0000000C0000000800000001E2B72448E2B7240000000000000000AD0F00000100000E0000000E00000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000030000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200320030002C0031002C0031003800320034002C0035002C0031003200310032000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200320030002C00310032002C0032003600320038002C00310031002C00310036003200300000000F0000000F000000000000002A0000000156222501000000640062006F00000046004B005F00530061006C0061005F00430069006E00650000000000000000000000C4020000000010000000100000000F000000080000000101EC246801EC240000000000000000AD0F0000010000130000001300000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000030000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200320030002C0031002C0031003800320034002C0035002C0031003200310032000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200320030002C00310032002C0032003600320038002C00310031002C0031003600320030000000160000001600000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000030000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200320030002C0031002C0031003800320034002C0035002C0031003200310032000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200320030002C00310032002C0032003600320038002C00310031002C00310036003200300000001700000017000000000000002E0000000100000001000000640062006F00000046004B005F004500760065006E0074006F005F00530061006C00610000000000000000000000C40200000000180000001800000017000000080000000146AC246846AC240000000000000000AD0F00000100001A0000001A00000000000000380000000100000001000000640062006F00000046004B005F004500760065006E0074006F005F0043006F006E00740065006E00690064006F0000000000000000000000C402000000001B0000001B0000001A00000008000000010EEC24A80EEC240000000000000000AD0F00000100001C0000001C00000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000030000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200320030002C0031002C0031003800320034002C0035002C0031003200310032000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200320030002C00310032002C0032003600320038002C00310031002C00310036003200300000001D0000001D000000000000004A000000014F082C01000000640062006F00000046004B005F00500065006C006900630075006C00610052006500670075006C00610072005F0043006F006E00740065006E00690064006F0000000000000000000000C402000000001E0000001E0000001D0000000800000001680925986809250000000000000000AD0F00000100001F0000001F00000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000030000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200320030002C0031002C0031003800320034002C0035002C0031003200310032000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200320030002C00310032002C0032003600320038002C00310031002C003100360032003000000020000000200000000000000050000000014F082C01000000640062006F00000046004B005F00450078006800690062006900630069006F006E0045007300700065006300690061006C005F0043006F006E00740065006E00690064006F0000000000000000000000C40200000000210000002100000020000000080000000108EC24E808EC240000000000000000AD0F0000010000220000002200000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000030000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200320030002C0031002C0031003800320034002C0035002C0031003200310032000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200320030002C00310032002C0032003600320038002C00310031002C0031003600320030000000230000002300000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000030000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200320030002C0031002C0031003800320034002C0035002C0031003200310032000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200320030002C00310032002C0032003600320038002C00310031002C0031003600320030000000250000002500000000000000460000000100000001000000640062006F00000046004B005F005200650070006100720074006F005F00500065006C006900630075006C00610052006500670075006C006100720000000000000000000000C4020000000026000000260000002500000008000000010AEC24A80AEC240000000000000000AD0F000001000027000000270000000000000032000000012EA36601000000640062006F00000046004B005F005200650070006100720074006F005F004100630074006F00720000000000000000000000C402000000002800000028000000270000000800000001B1D42480B1D4240000000000000000AD0F0000010000290000002900000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000030000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200320030002C0031002C0031003800320034002C0035002C0031003200310032000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200320030002C00310032002C0032003600320038002C00310031002C00310036003200300000002A0000002A00000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000030000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200320030002C0031002C0031003800320034002C0035002C0031003200310032000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200320030002C00310032002C0032003600320038002C00310031002C00310036003200300000002B0000002B000000000000006C000000014F082C01000000640062006F00000046004B005F00410063006F006E0074006500630069006D00690065006E0074006F004400650070006F0072007400690076006F005F00450078006800690062006900630069006F006E0045007300700065006300690061006C0000000000000000000000C402000000002C0000002C0000002B000000080000000112EC246812EC240000000000000000AD0F00000100002D0000002D000000000000006A0000000100610001000000640062006F00000046004B005F00410063006F006E0074006500630069006D00690065006E0074006F00430075006C0074007500720061006C005F00450078006800690062006900630069006F006E0045007300700065006300690061006C0000000000000000000000C402000000002E0000002E0000002D000000080000000114D424A014D4240000000000000000AD0F00000100002F0000002F00000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000030000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200320030002C0031002C0031003800320034002C0035002C0031003200310032000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200320030002C00310032002C0032003600320038002C00310031002C00310036003200300000003100000031000000000000005A0000000100000001000000640062006F00000046004B005F00410063006F006E0074006500630069006D00690065006E0074006F00430075006C0074007500720061006C005F0049006E007400650072007000720065007400650000000000000000000000C40200000000320000003200000031000000080000000116D424E016D4240000000000000000AD0F0000010000330000003300000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000030000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200320030002C0031002C0031003800320034002C0035002C0031003200310032000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200320030002C00310032002C0032003600320038002C00310031002C00310036003200300000003400000034000000000000003A000000014F082C01000000640062006F00000046004B005F004F00700069006E0069006F006E005F0043006F006E00740065006E00690064006F0000000000000000000000C40200000000350000003500000034000000080000000115EC24E815EC240000000000000000AD0F0000010000360000003600000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000030000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200320030002C0031002C0031003800320034002C0035002C0031003200310032000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200320030002C00310032002C0032003600320038002C00310031002C00310036003200300000003700000037000000000000004E000000014F082C01000000640062006F00000046004B005F0052006500670069007300740072006F0048006900730074006F007200690063006F005F0043006F006E00740065006E00690064006F0000000000000000000000C402000000003800000038000000370000000800000001620925986209250000000000000000AD0F0000010000390000003900000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000030000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200320030002C0031002C0031003800320034002C0035002C0031003200310032000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200320030002C00310032002C0032003600320038002C00310031002C00310036003200300000003A0000003A0000000000000040000000014F082C01000000640062006F00000046004B005F00450078006800690062006900630069006F006E005F0043006F006E00740065006E00690064006F0000000000000000000000C402000000003B0000003B0000003A0000000800000001F1881CC8F1881C0000000000000000AD0F00000100003D0000003D00000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000030000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200320030002C0031002C0031003800320034002C0035002C0031003200310032000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200320030002C00310032002C0032003600320038002C00310031002C00310036003200300000003E0000003E0000000000000032000000012EA36601000000640062006F00000046004B005F0042006F006C00650074006F005F004500760065006E0074006F0000000000000000000000C402000000003F0000003F0000003E00000008000000010DEC24680DEC240000000000000000AD0F0000010000400000004000000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000030000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200320030002C0031002C0031003800320034002C0035002C0031003200310032000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200320030002C00310032002C0032003600320038002C00310031002C0031003600320030000000410000004100000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000030000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200320030002C0031002C0031003800320034002C0035002C0031003200310032000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200320030002C00310032002C0032003600320038002C00310031002C0031003600320030000000430000004300000000000000320000000100000001000000640062006F00000046004B005F0042006F006C00650074006F005F0043006F006D0070007200610000000000000000000000C40200000000440000004400000043000000080000000117EC246817EC240000000000000000AD0F0000010000450000004500000000000000460000000100000001000000640062006F00000046004B005F00500072006F0064007500630074006F00440075006C00630065007200690061005F0043006F006D0070007200610000000000000000000000C40200000000460000004600000045000000080000000119EC242819EC240000000000000000AD0F0000010000470000004700000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000030000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200320030002C0031002C0031003800320034002C0035002C0031003200310032000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200320030002C00310032002C0032003600320038002C00310031002C0031003600320030000000480000004800000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000030000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003200320030002C0031002C0031003800320034002C0035002C0031003200310032000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003200320030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003200320030002C00310032002C0032003600320038002C00310031002C0031003600320030000000520000005200000000000000360000000100000001000000640062006F00000046004B005F0046006100630074007500720061005F0043006C00690065006E007400650000000000000000000000C402000000005300000053000000520000000800000001ED881C48ED881C0000000000000000AD0F0000010000540000005400000000000000340000000100000001000000640062006F00000046004B005F0046006100630074007500720061005F0043006F006D0070007200610000000000000000000000C4020000000055000000550000005400000008000000011FEC24A81FEC240000000000000000AD0F00000100006E0000000F000000010000000E000000AF000000840000000A0000000100000009000000010000008200000005000000010000000300000003000000000000000C00000002000000090000001500000000000000070000000200000003000000A100000084000000170000000E0000001300000085000000840000003E000000130000003D00000000000000010000003A000000160000003900000085000000AE0000003700000016000000360000009500000084000000340000001600000033000000F70000008400000020000000160000001F00000055000000000000001D000000160000001C00000001000000500000001A00000016000000130000008400000089000000250000001C0000002200000084000000870000002D0000001F0000002A0000006B000000000000002B0000001F0000002900000001000000500000002700000023000000220000008500000086000000310000002F0000002A00000000000000010000005400000041000000470000008900000086000000450000004100000040000000590000000000000043000000410000003D0000000100000050000000520000004800000047000000860000008700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000069007600650052006500730075006C00740053006500740073003D00460061006C00730065003B0043006F006E006E006500630074002000540069006D0065006F00750074003D00330030003B0054007200750073007400530065007200760065007200430065007200740069006600690063006100740065003D00460061006C00730065003B005000610063006B00650074002000530069007A0065003D0034003000390036003B004100700070006C00690063006100740069006F006E0020004E0061006D0065003D0022004D006900630072006F0073006F00660074002000530051004C00200053006500720076006500720020004D0061006E006100670065006D0065006E0074002000530074007500640069006F002200000000800500220000004400690061006700720061006D005F00430069006E0065006D00610072006B000000000226000A000000430069006E006500000008000000640062006F000000000226001200000045006D0070006C006500610064006F00000008000000640062006F000000000226002400000052006500670069007300740072006F00200052006F007400610063006900F3006E00000008000000640062006F000000000226001C0000005200650070006F007200740065002000420061006A0061007300000008000000640062006F000000000226000A000000530061006C006100000008000000640062006F000000000226000E0000004500760065006E0074006F00000008000000640062006F000000000226001400000043006F006E00740065006E00690064006F00000008000000640062006F0000000002260020000000500065006C006900630075006C00610052006500670075006C0061007200000008000000640062006F0000000002260026000000450078006800690062006900630069006F006E0045007300700065006300690061006C00000008000000640062006F00000000022600100000005200650070006100720074006F00000008000000640062006F000000000226000C0000004100630074006F007200000008000000640062006F0000000002260030000000410063006F006E0074006500630069006D00690065006E0074006F004400650070006F0072007400690076006F00000008000000640062006F000000000226002E000000410063006F006E0074006500630069006D00690065006E0074006F00430075006C0074007500720061006C00000008000000640062006F000000000226001600000049006E0074006500720070007200650074006500000008000000640062006F00000000022600100000004F00700069006E0069006F006E00000008000000640062006F000000000226002400000052006500670069007300740072006F0048006900730074006F007200690063006F00000008000000640062006F0000000002260016000000450078006800690062006900630069006F006E00000008000000640062006F000000000226000E00000042006F006C00650074006F00000008000000640062006F0000000002260022000000500072006F0064007500630074006F00440075006C0063006500720069006100000008000000640062006F000000000226000E00000043006F006D00700072006100000008000000640062006F00000000022600100000004600610063007400750072006100000008000000640062006F000000000224001000000043006C00690065006E0074006500000008000000640062006F00000001000000D68509B3BB6BF2459AB8371664F0327008004E0000007B00310036003300340043004400440037002D0030003800380038002D0034003200450033002D0039004600410032002D004200360044003300320035003600330042003900310044007D000000000000000000000000000000000000000000010003000000000000000C0000000B000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000062885214)
SET IDENTITY_INSERT [dbo].[sysdiagrams] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_principal_name]    Script Date: 27/03/2020 21:02:18 ******/
ALTER TABLE [dbo].[sysdiagrams] ADD  CONSTRAINT [UK_principal_name] UNIQUE NONCLUSTERED 
(
	[principal_id] ASC,
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AcontecimientoCultural]  WITH CHECK ADD  CONSTRAINT [FK_AcontecimientoCultural_ExhibicionEspecial] FOREIGN KEY([IdExhibicion])
REFERENCES [dbo].[ExhibicionEspecial] ([IdExhibicionE])
GO
ALTER TABLE [dbo].[AcontecimientoCultural] CHECK CONSTRAINT [FK_AcontecimientoCultural_ExhibicionEspecial]
GO
ALTER TABLE [dbo].[AcontecimientoCultural]  WITH CHECK ADD  CONSTRAINT [FK_AcontecimientoCultural_Interprete] FOREIGN KEY([Interpretes])
REFERENCES [dbo].[Interprete] ([NombreInterprete])
GO
ALTER TABLE [dbo].[AcontecimientoCultural] CHECK CONSTRAINT [FK_AcontecimientoCultural_Interprete]
GO
ALTER TABLE [dbo].[AcontecimientoDeportivo]  WITH NOCHECK ADD  CONSTRAINT [FK_AcontecimientoDeportivo_ExhibicionEspecial] FOREIGN KEY([IdExhibicionE])
REFERENCES [dbo].[ExhibicionEspecial] ([IdExhibicionE])
GO
ALTER TABLE [dbo].[AcontecimientoDeportivo] CHECK CONSTRAINT [FK_AcontecimientoDeportivo_ExhibicionEspecial]
GO
ALTER TABLE [dbo].[Boleto]  WITH CHECK ADD  CONSTRAINT [FK_Boleto_Compra] FOREIGN KEY([DetalleCompra])
REFERENCES [dbo].[Compra] ([DetalleCompra])
GO
ALTER TABLE [dbo].[Boleto] CHECK CONSTRAINT [FK_Boleto_Compra]
GO
ALTER TABLE [dbo].[Boleto]  WITH CHECK ADD  CONSTRAINT [FK_Boleto_Evento] FOREIGN KEY([IdEvento])
REFERENCES [dbo].[Evento] ([IdEvento])
GO
ALTER TABLE [dbo].[Boleto] CHECK CONSTRAINT [FK_Boleto_Evento]
GO
ALTER TABLE [dbo].[Evento]  WITH CHECK ADD  CONSTRAINT [FK_Evento_Contenido] FOREIGN KEY([IdContenido])
REFERENCES [dbo].[Contenido] ([IdContenido])
GO
ALTER TABLE [dbo].[Evento] CHECK CONSTRAINT [FK_Evento_Contenido]
GO
ALTER TABLE [dbo].[Evento]  WITH CHECK ADD  CONSTRAINT [FK_Evento_Sala] FOREIGN KEY([No.Sala])
REFERENCES [dbo].[Sala] ([Numero])
GO
ALTER TABLE [dbo].[Evento] CHECK CONSTRAINT [FK_Evento_Sala]
GO
ALTER TABLE [dbo].[Exhibicion]  WITH NOCHECK ADD  CONSTRAINT [FK_Exhibicion_Contenido] FOREIGN KEY([IdContenido])
REFERENCES [dbo].[Contenido] ([IdContenido])
GO
ALTER TABLE [dbo].[Exhibicion] CHECK CONSTRAINT [FK_Exhibicion_Contenido]
GO
ALTER TABLE [dbo].[ExhibicionEspecial]  WITH NOCHECK ADD  CONSTRAINT [FK_ExhibicionEspecial_Contenido] FOREIGN KEY([IdContenido])
REFERENCES [dbo].[Contenido] ([IdContenido])
GO
ALTER TABLE [dbo].[ExhibicionEspecial] CHECK CONSTRAINT [FK_ExhibicionEspecial_Contenido]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Cliente] FOREIGN KEY([NIT], [Direccion], [Nombre])
REFERENCES [dbo].[Cliente] ([NIT], [Direccion], [Nombre])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Cliente]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Compra] FOREIGN KEY([DetalleCompra])
REFERENCES [dbo].[Compra] ([DetalleCompra])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Compra]
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
ALTER TABLE [dbo].[ProductoDulceria]  WITH CHECK ADD  CONSTRAINT [FK_ProductoDulceria_Compra] FOREIGN KEY([DetalleCompra])
REFERENCES [dbo].[Compra] ([DetalleCompra])
GO
ALTER TABLE [dbo].[ProductoDulceria] CHECK CONSTRAINT [FK_ProductoDulceria_Compra]
GO
ALTER TABLE [dbo].[RegistroHistorico]  WITH NOCHECK ADD  CONSTRAINT [FK_RegistroHistorico_Contenido] FOREIGN KEY([IdContenido])
REFERENCES [dbo].[Contenido] ([IdContenido])
GO
ALTER TABLE [dbo].[RegistroHistorico] CHECK CONSTRAINT [FK_RegistroHistorico_Contenido]
GO
ALTER TABLE [dbo].[RegistroRotacion]  WITH CHECK ADD  CONSTRAINT [FK_Registro Rotación_Cine] FOREIGN KEY([IdCine])
REFERENCES [dbo].[Cine] ([IdCine])
GO
ALTER TABLE [dbo].[RegistroRotacion] CHECK CONSTRAINT [FK_Registro Rotación_Cine]
GO
ALTER TABLE [dbo].[RegistroRotacion]  WITH CHECK ADD  CONSTRAINT [FK_Registro Rotación_Empleado] FOREIGN KEY([CodigoEmpleado])
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
/****** Object:  StoredProcedure [dbo].[sp_alterdiagram]    Script Date: 27/03/2020 21:02:18 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_creatediagram]    Script Date: 27/03/2020 21:02:18 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_dropdiagram]    Script Date: 27/03/2020 21:02:18 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_helpdiagramdefinition]    Script Date: 27/03/2020 21:02:18 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_helpdiagrams]    Script Date: 27/03/2020 21:02:18 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_renamediagram]    Script Date: 27/03/2020 21:02:18 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_upgraddiagrams]    Script Date: 27/03/2020 21:02:18 ******/
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
