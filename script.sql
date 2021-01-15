USE [master]
GO
/****** Object:  Database [AdoNet]    Script Date: 15/01/2021 14:42:20 ******/
CREATE DATABASE [AdoNet]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AdoNet', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\AdoNet.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AdoNet_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\AdoNet_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AdoNet] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AdoNet].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AdoNet] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AdoNet] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AdoNet] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AdoNet] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AdoNet] SET ARITHABORT OFF 
GO
ALTER DATABASE [AdoNet] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AdoNet] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AdoNet] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AdoNet] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AdoNet] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AdoNet] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AdoNet] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AdoNet] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AdoNet] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AdoNet] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AdoNet] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AdoNet] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AdoNet] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AdoNet] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AdoNet] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AdoNet] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AdoNet] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AdoNet] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AdoNet] SET  MULTI_USER 
GO
ALTER DATABASE [AdoNet] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AdoNet] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AdoNet] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AdoNet] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AdoNet] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AdoNet] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [AdoNet] SET QUERY_STORE = OFF
GO
USE [AdoNet]
GO
/****** Object:  Table [dbo].[clients]    Script Date: 15/01/2021 14:42:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clients](
	[id] [int] NOT NULL,
	[nom] [varchar](100) NULL,
	[prenom] [varchar](100) NULL,
	[adersse] [varchar](250) NULL,
	[ville] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [AdoNet] SET  READ_WRITE 
GO
