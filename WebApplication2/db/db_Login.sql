USE [master]
GO
/****** Object:  Database [DB_Login]    Script Date: 16/11/2020 10:13:53 p. m. ******/
CREATE DATABASE [DB_Login]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_Login', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DB_Login.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB_Login_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DB_Login_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DB_Login] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_Login].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_Login] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_Login] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_Login] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_Login] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_Login] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_Login] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DB_Login] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_Login] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_Login] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_Login] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_Login] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_Login] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_Login] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_Login] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_Login] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DB_Login] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_Login] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_Login] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_Login] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_Login] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_Login] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_Login] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_Login] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DB_Login] SET  MULTI_USER 
GO
ALTER DATABASE [DB_Login] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_Login] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_Login] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_Login] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB_Login] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB_Login] SET QUERY_STORE = OFF
GO
USE [DB_Login]
GO
/****** Object:  Table [dbo].[tblUsuarios]    Script Date: 16/11/2020 10:13:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsuarios](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[NombreUsuario] [varchar](50) NULL,
	[Pass] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[SP_Login_User]    Script Date: 16/11/2020 10:13:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_Login_User](
@user varchar(50),
@pass varchar(50)
)
as
select * from tblUsuarios where (NombreUsuario = @user and Pass = @pass)
GO
/****** Object:  StoredProcedure [dbo].[SP_Save_User]    Script Date: 16/11/2020 10:13:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[SP_Save_User](
@user varchar(50),
@pass varchar(50)
)
as
declare @unUsuario varchar(50) = (select NombreUsuario from tblUsuarios where NombreUsuario = @user)

if @unUsuario is not null begin
	select 'ERROR' AS Msj
end
else begin
	insert into tblUsuarios(NombreUsuario, Pass) values(@user, @pass)
	select 'OK' AS Msj
end
GO
USE [master]
GO
ALTER DATABASE [DB_Login] SET  READ_WRITE 
GO
