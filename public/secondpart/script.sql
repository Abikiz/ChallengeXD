USE [master]
GO
/****** Object:  Database [vuelos]    Script Date: 05/01/2023 03:31:12 a. m. ******/
CREATE DATABASE [vuelos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'vuelos', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\vuelos.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'vuelos_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\vuelos_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [vuelos] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [vuelos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [vuelos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [vuelos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [vuelos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [vuelos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [vuelos] SET ARITHABORT OFF 
GO
ALTER DATABASE [vuelos] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [vuelos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [vuelos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [vuelos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [vuelos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [vuelos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [vuelos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [vuelos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [vuelos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [vuelos] SET  DISABLE_BROKER 
GO
ALTER DATABASE [vuelos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [vuelos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [vuelos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [vuelos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [vuelos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [vuelos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [vuelos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [vuelos] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [vuelos] SET  MULTI_USER 
GO
ALTER DATABASE [vuelos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [vuelos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [vuelos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [vuelos] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [vuelos] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [vuelos] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [vuelos] SET QUERY_STORE = ON
GO
ALTER DATABASE [vuelos] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [vuelos]
GO
/****** Object:  Table [dbo].[aerolineas]    Script Date: 05/01/2023 03:31:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aerolineas](
	[id_aerolinea] [nvarchar](50) NOT NULL,
	[nombre_aerolinea] [nvarchar](50) NULL,
 CONSTRAINT [PK_aerolineas] PRIMARY KEY CLUSTERED 
(
	[id_aerolinea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aeropuertos]    Script Date: 05/01/2023 03:31:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aeropuertos](
	[id_aeropuerto] [nvarchar](50) NOT NULL,
	[nombre_aeropuerto] [nvarchar](50) NULL,
 CONSTRAINT [PK_aeropuertos] PRIMARY KEY CLUSTERED 
(
	[id_aeropuerto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[movimientos]    Script Date: 05/01/2023 03:31:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movimientos](
	[id_movimientos] [nvarchar](50) NOT NULL,
	[descripcion] [nvarchar](50) NULL,
 CONSTRAINT [PK_movimientos] PRIMARY KEY CLUSTERED 
(
	[id_movimientos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vuelos]    Script Date: 05/01/2023 03:31:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vuelos](
	[id_aerolinea] [nvarchar](50) NOT NULL,
	[id_aeropuerto] [nvarchar](50) NOT NULL,
	[id_movimiento] [nvarchar](50) NOT NULL,
	[dia] [date] NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[aerolineas] ([id_aerolinea], [nombre_aerolinea]) VALUES (N'1', N'Volaris')
INSERT [dbo].[aerolineas] ([id_aerolinea], [nombre_aerolinea]) VALUES (N'2', N'Aeromar')
INSERT [dbo].[aerolineas] ([id_aerolinea], [nombre_aerolinea]) VALUES (N'3', N'Interjet')
INSERT [dbo].[aerolineas] ([id_aerolinea], [nombre_aerolinea]) VALUES (N'4', N'Aeromexico')
GO
INSERT [dbo].[aeropuertos] ([id_aeropuerto], [nombre_aeropuerto]) VALUES (N'1', N'Benito Juarez')
INSERT [dbo].[aeropuertos] ([id_aeropuerto], [nombre_aeropuerto]) VALUES (N'2', N'Guanajuato')
INSERT [dbo].[aeropuertos] ([id_aeropuerto], [nombre_aeropuerto]) VALUES (N'3', N'La paz')
INSERT [dbo].[aeropuertos] ([id_aeropuerto], [nombre_aeropuerto]) VALUES (N'4', N'Oaxaca')
GO
INSERT [dbo].[movimientos] ([id_movimientos], [descripcion]) VALUES (N'1', N'salida')
INSERT [dbo].[movimientos] ([id_movimientos], [descripcion]) VALUES (N'2', N'llegada')
GO
INSERT [dbo].[vuelos] ([id_aerolinea], [id_aeropuerto], [id_movimiento], [dia]) VALUES (N'1', N'1', N'1', CAST(N'2021-05-02' AS Date))
INSERT [dbo].[vuelos] ([id_aerolinea], [id_aeropuerto], [id_movimiento], [dia]) VALUES (N'2', N'1', N'1', CAST(N'2021-05-02' AS Date))
INSERT [dbo].[vuelos] ([id_aerolinea], [id_aeropuerto], [id_movimiento], [dia]) VALUES (N'3', N'2', N'2', CAST(N'2021-05-02' AS Date))
INSERT [dbo].[vuelos] ([id_aerolinea], [id_aeropuerto], [id_movimiento], [dia]) VALUES (N'4', N'3', N'2', CAST(N'2021-05-02' AS Date))
INSERT [dbo].[vuelos] ([id_aerolinea], [id_aeropuerto], [id_movimiento], [dia]) VALUES (N'1', N'3', N'2', CAST(N'2021-05-02' AS Date))
INSERT [dbo].[vuelos] ([id_aerolinea], [id_aeropuerto], [id_movimiento], [dia]) VALUES (N'2', N'3', N'1', CAST(N'2021-05-04' AS Date))
INSERT [dbo].[vuelos] ([id_aerolinea], [id_aeropuerto], [id_movimiento], [dia]) VALUES (N'3', N'4', N'1', CAST(N'2021-05-04' AS Date))
GO
ALTER TABLE [dbo].[vuelos]  WITH CHECK ADD  CONSTRAINT [FK_vuelos_aerolineas] FOREIGN KEY([id_aerolinea])
REFERENCES [dbo].[aerolineas] ([id_aerolinea])
GO
ALTER TABLE [dbo].[vuelos] CHECK CONSTRAINT [FK_vuelos_aerolineas]
GO
ALTER TABLE [dbo].[vuelos]  WITH CHECK ADD  CONSTRAINT [FK_vuelos_aeropuertos] FOREIGN KEY([id_aeropuerto])
REFERENCES [dbo].[aeropuertos] ([id_aeropuerto])
GO
ALTER TABLE [dbo].[vuelos] CHECK CONSTRAINT [FK_vuelos_aeropuertos]
GO
ALTER TABLE [dbo].[vuelos]  WITH CHECK ADD  CONSTRAINT [FK_vuelos_movimientos] FOREIGN KEY([id_movimiento])
REFERENCES [dbo].[movimientos] ([id_movimientos])
GO
ALTER TABLE [dbo].[vuelos] CHECK CONSTRAINT [FK_vuelos_movimientos]
GO
USE [master]
GO
ALTER DATABASE [vuelos] SET  READ_WRITE 
GO
