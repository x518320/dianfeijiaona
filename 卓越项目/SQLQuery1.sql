USE [master]
GO
/****** Object:  Database [Demo]    Script Date: 2022/6/15 8:54:21 ******/
CREATE DATABASE [Demo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Demo', FILENAME = N'C:\数据库\Demo.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Demo_log', FILENAME = N'C:\数据库\Demo_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Demo] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Demo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Demo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Demo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Demo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Demo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Demo] SET ARITHABORT OFF 
GO
ALTER DATABASE [Demo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Demo] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Demo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Demo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Demo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Demo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Demo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Demo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Demo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Demo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Demo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Demo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Demo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Demo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Demo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Demo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Demo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Demo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Demo] SET RECOVERY FULL 
GO
ALTER DATABASE [Demo] SET  MULTI_USER 
GO
ALTER DATABASE [Demo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Demo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Demo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Demo] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Demo', N'ON'
GO
USE [Demo]
GO
/****** Object:  Table [dbo].[boss]    Script Date: 2022/6/15 8:54:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[boss](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[pwd] [nvarchar](50) NULL,
	[dianjia] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[chongzhi]    Script Date: 2022/6/15 8:54:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chongzhi](
	[id] [int] IDENTITY(10000,1) NOT NULL,
	[userid] [int] NULL,
	[bossid] [int] NULL,
	[money] [decimal](10, 2) NULL,
	[houmoney] [decimal](10, 2) NULL,
	[date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[fang]    Script Date: 2022/6/15 8:54:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fang](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dong] [nvarchar](50) NULL,
	[danyuan] [int] NULL,
	[louceng] [int] NULL,
	[fangjian] [int] NULL,
	[datetiem] [date] NULL,
	[up] [decimal](10, 2) NULL,
	[dianliang] [decimal](10, 2) NULL,
	[userid] [int] NULL,
	[bossid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[fankui]    Script Date: 2022/6/15 8:54:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fankui](
	[id] [int] IDENTITY(10000,1) NOT NULL,
	[userid] [int] NULL,
	[bossid] [int] NULL,
	[zhuti] [nvarchar](100) NULL,
	[miaoshu] [nvarchar](600) NULL,
	[date] [datetime] NULL,
	[type] [int] NULL,
	[huifu] [nvarchar](600) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[order]    Script Date: 2022/6/15 8:54:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[id] [int] IDENTITY(10000,1) NOT NULL,
	[bossid] [int] NULL,
	[userid] [int] NULL,
	[fangid] [int] NULL,
	[up] [decimal](10, 2) NULL,
	[now] [decimal](10, 2) NULL,
	[dianjia] [decimal](10, 2) NULL,
	[money] [decimal](10, 2) NULL,
	[date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 2022/6/15 8:54:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[pwd] [nvarchar](50) NULL,
	[time] [datetime] NULL,
	[money] [decimal](10, 2) NULL,
	[findtime] [datetime] NULL,
	[url] [nvarchar](600) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[zhuce]    Script Date: 2022/6/15 8:54:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zhuce](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[pwd] [nvarchar](50) NULL,
	[time] [datetime] NULL,
	[bossid] [int] NULL,
	[type] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[boss] ON 

GO
INSERT [dbo].[boss] ([id], [name], [phone], [pwd], [dianjia]) VALUES (1, N'夏运宇', N'18906540447', N'123', CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[boss] ([id], [name], [phone], [pwd], [dianjia]) VALUES (2, N'李瑶', N'12345678912', N'123', CAST(23.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[boss] ([id], [name], [phone], [pwd], [dianjia]) VALUES (3, N'汪家振', N'12345678912', N'123', CAST(12.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[boss] ([id], [name], [phone], [pwd], [dianjia]) VALUES (4, N'周政', N'12345678923', N'123', CAST(17.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[boss] ([id], [name], [phone], [pwd], [dianjia]) VALUES (5, N'王艳', N'12345678934', N'123', CAST(21.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[boss] ([id], [name], [phone], [pwd], [dianjia]) VALUES (6, N'张大勋', N'12345678956', N'123', CAST(1.20 AS Decimal(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[boss] OFF
GO
SET IDENTITY_INSERT [dbo].[chongzhi] ON 

GO
INSERT [dbo].[chongzhi] ([id], [userid], [bossid], [money], [houmoney], [date]) VALUES (10000, 1, 1, CAST(1000.00 AS Decimal(10, 2)), CAST(2748.74 AS Decimal(10, 2)), CAST(0x0000AEB100EE753C AS DateTime))
GO
INSERT [dbo].[chongzhi] ([id], [userid], [bossid], [money], [houmoney], [date]) VALUES (10001, 2, 1, CAST(1204.00 AS Decimal(10, 2)), CAST(3433.76 AS Decimal(10, 2)), CAST(0x0000AEB100EEF572 AS DateTime))
GO
INSERT [dbo].[chongzhi] ([id], [userid], [bossid], [money], [houmoney], [date]) VALUES (10002, 3, 1, CAST(1500.00 AS Decimal(10, 2)), CAST(2269.39 AS Decimal(10, 2)), CAST(0x0000AEB100F98C2D AS DateTime))
GO
INSERT [dbo].[chongzhi] ([id], [userid], [bossid], [money], [houmoney], [date]) VALUES (10003, 4, 1, CAST(800.00 AS Decimal(10, 2)), CAST(1555.45 AS Decimal(10, 2)), CAST(0x0000AEB100F9E47C AS DateTime))
GO
INSERT [dbo].[chongzhi] ([id], [userid], [bossid], [money], [houmoney], [date]) VALUES (10004, 5, 1, CAST(590.00 AS Decimal(10, 2)), CAST(1447.41 AS Decimal(10, 2)), CAST(0x0000AEB100FA3739 AS DateTime))
GO
INSERT [dbo].[chongzhi] ([id], [userid], [bossid], [money], [houmoney], [date]) VALUES (10005, 1, 1, CAST(145.00 AS Decimal(10, 2)), CAST(951.78 AS Decimal(10, 2)), CAST(0x0000AEB300B791FF AS DateTime))
GO
INSERT [dbo].[chongzhi] ([id], [userid], [bossid], [money], [houmoney], [date]) VALUES (10006, 1, 1, CAST(456.00 AS Decimal(10, 2)), CAST(1406.05 AS Decimal(10, 2)), CAST(0x0000AEB30100A608 AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[chongzhi] OFF
GO
SET IDENTITY_INSERT [dbo].[fang] ON 

GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (1, N'A栋', 1, 2, 201, CAST(0x02440B00 AS Date), CAST(8893.00 AS Decimal(10, 2)), CAST(10418.76 AS Decimal(10, 2)), 1, 1)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (2, N'A栋', 1, 2, 202, CAST(0x02440B00 AS Date), CAST(8800.00 AS Decimal(10, 2)), CAST(10054.22 AS Decimal(10, 2)), 2, 1)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (3, N'A栋', 1, 2, 203, CAST(0x02440B00 AS Date), CAST(9124.00 AS Decimal(10, 2)), CAST(10247.21 AS Decimal(10, 2)), 3, 1)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (4, N'A栋', 1, 3, 301, CAST(0x02440B00 AS Date), CAST(8698.00 AS Decimal(10, 2)), CAST(9700.92 AS Decimal(10, 2)), 4, 1)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (5, N'A栋', 1, 3, 302, CAST(0x02440B00 AS Date), CAST(9546.00 AS Decimal(10, 2)), CAST(10794.54 AS Decimal(10, 2)), 5, 1)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (6, N'A栋', 1, 3, 303, CAST(0x02440B00 AS Date), CAST(8749.00 AS Decimal(10, 2)), CAST(10012.18 AS Decimal(10, 2)), 6, 1)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (7, N'A栋', 1, 4, 401, CAST(0x02440B00 AS Date), CAST(9444.00 AS Decimal(10, 2)), CAST(10570.40 AS Decimal(10, 2)), 7, 1)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (8, N'A栋', 1, 4, 402, CAST(0x02440B00 AS Date), CAST(8617.00 AS Decimal(10, 2)), CAST(9870.17 AS Decimal(10, 2)), 8, 1)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (9, N'A栋', 1, 4, 403, CAST(0x02440B00 AS Date), CAST(8703.00 AS Decimal(10, 2)), CAST(9714.04 AS Decimal(10, 2)), 9, 1)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (10, N'A栋', 2, 2, 201, CAST(0x02440B00 AS Date), CAST(8609.00 AS Decimal(10, 2)), CAST(10099.61 AS Decimal(10, 2)), 10, 1)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (11, N'A栋', 2, 2, 202, CAST(0x02440B00 AS Date), CAST(8762.00 AS Decimal(10, 2)), CAST(9530.91 AS Decimal(10, 2)), 11, 1)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (12, N'A栋', 2, 3, 301, CAST(0x02440B00 AS Date), CAST(9514.00 AS Decimal(10, 2)), CAST(11365.82 AS Decimal(10, 2)), 12, 1)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (13, N'A栋', 2, 3, 302, CAST(0x02440B00 AS Date), CAST(9462.00 AS Decimal(10, 2)), CAST(10953.87 AS Decimal(10, 2)), 70, 1)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (14, N'B栋', 1, 2, 201, CAST(0x58420B00 AS Date), CAST(1000.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), 14, 2)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (15, N'B栋', 1, 2, 202, CAST(0x58420B00 AS Date), CAST(1000.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), 15, 2)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (16, N'B栋', 1, 2, 203, CAST(0x58420B00 AS Date), CAST(1000.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), 16, 2)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (17, N'B栋', 1, 3, 301, CAST(0x58420B00 AS Date), CAST(1000.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), 17, 2)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (18, N'B栋', 1, 3, 302, CAST(0x58420B00 AS Date), CAST(1000.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), 18, 2)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (19, N'B栋', 1, 3, 303, CAST(0x58420B00 AS Date), CAST(1000.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), 19, 2)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (20, N'B栋', 2, 2, 201, CAST(0x58420B00 AS Date), CAST(1000.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), 20, 2)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (21, N'B栋', 2, 2, 202, CAST(0x58420B00 AS Date), CAST(1000.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), 21, 2)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (22, N'B栋', 2, 2, 203, CAST(0x58420B00 AS Date), CAST(1000.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), 22, 2)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (23, N'B栋', 2, 3, 301, CAST(0x58420B00 AS Date), CAST(1000.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), 23, 2)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (24, N'B栋', 2, 3, 302, CAST(0x58420B00 AS Date), CAST(1000.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), 24, 2)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (25, N'B栋', 2, 3, 303, CAST(0x58420B00 AS Date), CAST(1000.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), 25, 2)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (26, N'C栋', 1, 2, 201, CAST(0x58420B00 AS Date), CAST(1000.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), 26, 3)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (27, N'C栋', 1, 2, 202, CAST(0x58420B00 AS Date), CAST(1000.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), 27, 3)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (28, N'C栋', 1, 2, 203, CAST(0x58420B00 AS Date), CAST(1000.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), 28, 4)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (29, N'C栋', 1, 3, 301, CAST(0x58420B00 AS Date), CAST(1000.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), 29, 4)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (30, N'C栋', 1, 3, 302, CAST(0x58420B00 AS Date), CAST(1000.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), 30, 4)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (31, N'C栋', 1, 3, 303, CAST(0x58420B00 AS Date), CAST(1000.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), 31, 4)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (32, N'C栋', 2, 2, 201, CAST(0x58420B00 AS Date), CAST(1000.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), 32, 4)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (33, N'C栋', 2, 2, 202, CAST(0x58420B00 AS Date), CAST(1000.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), 33, 4)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (34, N'C栋', 2, 2, 203, CAST(0x58420B00 AS Date), CAST(1000.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), 34, 4)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (35, N'C栋', 2, 3, 301, CAST(0x58420B00 AS Date), CAST(1000.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), 35, 4)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (36, N'C栋', 2, 3, 302, CAST(0x58420B00 AS Date), CAST(1000.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), 36, 4)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (37, N'C栋', 2, 3, 303, CAST(0x58420B00 AS Date), CAST(1000.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), 37, 4)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (38, N'D栋', 1, 1, 101, CAST(0x58420B00 AS Date), CAST(1000.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), 38, 4)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (39, N'D栋', 2, 1, 101, CAST(0x58420B00 AS Date), CAST(1000.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), 39, 4)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (40, N'E栋', 1, 2, 201, CAST(0x58420B00 AS Date), CAST(1000.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), 40, 5)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (41, N'E栋', 1, 2, 202, CAST(0x58420B00 AS Date), CAST(1000.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), 41, 5)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (42, N'E栋', 1, 2, 203, CAST(0x58420B00 AS Date), CAST(1000.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), 42, 5)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (43, N'E栋', 1, 3, 301, CAST(0x58420B00 AS Date), CAST(1000.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), 43, 5)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (44, N'E栋', 1, 3, 302, CAST(0x58420B00 AS Date), CAST(1000.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), 44, 5)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (45, N'E栋', 1, 3, 303, CAST(0x58420B00 AS Date), CAST(1000.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), 45, 5)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (46, N'E栋', 1, 4, 401, CAST(0x58420B00 AS Date), CAST(1000.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), 46, 5)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (47, N'E栋', 1, 4, 402, CAST(0x58420B00 AS Date), CAST(1000.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), 47, 5)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (48, N'E栋', 1, 4, 403, CAST(0x58420B00 AS Date), CAST(1000.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), 48, 5)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (49, N'E栋', 2, 2, 201, CAST(0x58420B00 AS Date), CAST(1000.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), 49, 5)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (50, N'E栋', 2, 2, 202, CAST(0x58420B00 AS Date), CAST(1000.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), 50, 5)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (51, N'E栋', 2, 2, 203, CAST(0x58420B00 AS Date), CAST(1000.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), 51, 5)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (52, N'E栋', 2, 3, 301, CAST(0x58420B00 AS Date), CAST(1000.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), 52, 5)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (53, N'E栋', 2, 3, 302, CAST(0x58420B00 AS Date), CAST(1000.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), 53, 5)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (54, N'E栋', 2, 3, 303, CAST(0x58420B00 AS Date), CAST(1000.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), 54, 5)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (55, N'E栋', 2, 4, 401, CAST(0x58420B00 AS Date), CAST(1000.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), 55, 5)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (56, N'E栋', 2, 4, 402, CAST(0x58420B00 AS Date), CAST(1000.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), 56, 5)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (57, N'E栋', 2, 4, 403, CAST(0x58420B00 AS Date), CAST(1000.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), 57, 5)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (58, N'F栋', 1, 1, 101, CAST(0x58420B00 AS Date), CAST(1000.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), 58, 6)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (59, N'F栋', 1, 1, 102, CAST(0x58420B00 AS Date), CAST(1000.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), 59, 6)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (60, N'F栋', 1, 2, 201, CAST(0x58420B00 AS Date), CAST(1000.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), 60, 6)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (61, N'F栋', 1, 2, 202, CAST(0x58420B00 AS Date), CAST(1000.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), 61, 6)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (62, N'F栋', 1, 3, 301, CAST(0x58420B00 AS Date), CAST(1000.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), 62, 6)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (63, N'F栋', 1, 3, 302, CAST(0x58420B00 AS Date), CAST(1000.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), 63, 6)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (64, N'F栋', 2, 1, 101, CAST(0x58420B00 AS Date), CAST(1000.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), 64, 6)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (65, N'F栋', 2, 1, 102, CAST(0x58420B00 AS Date), CAST(1000.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), 65, 6)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (66, N'F栋', 2, 2, 201, CAST(0x58420B00 AS Date), CAST(1000.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), 66, 6)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (67, N'F栋', 2, 2, 202, CAST(0x58420B00 AS Date), CAST(1000.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), 67, 6)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (68, N'F栋', 2, 3, 301, CAST(0x58420B00 AS Date), CAST(1000.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), 68, 6)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (69, N'F栋', 2, 3, 302, CAST(0x58420B00 AS Date), CAST(1000.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), 69, 6)
GO
SET IDENTITY_INSERT [dbo].[fang] OFF
GO
SET IDENTITY_INSERT [dbo].[fankui] ON 

GO
INSERT [dbo].[fankui] ([id], [userid], [bossid], [zhuti], [miaoshu], [date], [type], [huifu]) VALUES (10001, 1, 1, N'维修', N'把楼宇口关不住的门修一下换一下，不要一直等过保修期，等启用维保基金再修。建议启用楼宇门口的锁子。现在楼道里啥人都能进去。门上小广告都快贴满了。和小区5星物业不符合。', CAST(0x0000AEB100F29255 AS DateTime), 2, NULL)
GO
INSERT [dbo].[fankui] ([id], [userid], [bossid], [zhuti], [miaoshu], [date], [type], [huifu]) VALUES (10002, 1, 1, N'增加设备', N'桃园小区里老人和小孩居多。建议再给多安装一个儿童玩的设施。和健身设备。比如滑滑梯。这个大一个小区只有一个滑滑梯。那么多小孩每天抢一个玩。', CAST(0x0000AEB100F82836 AS DateTime), 2, N'okok可以解决')
GO
SET IDENTITY_INSERT [dbo].[fankui] OFF
GO
SET IDENTITY_INSERT [dbo].[order] ON 

GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10378, 1, 1, 1, CAST(2000.00 AS Decimal(10, 2)), CAST(2323.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(161.50 AS Decimal(10, 2)), CAST(0x0000AD1B00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10379, 1, 1, 1, CAST(2323.00 AS Decimal(10, 2)), CAST(2720.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(198.50 AS Decimal(10, 2)), CAST(0x0000AD3A00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10380, 1, 1, 1, CAST(2720.00 AS Decimal(10, 2)), CAST(3345.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(312.50 AS Decimal(10, 2)), CAST(0x0000AD5800000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10381, 1, 1, 1, CAST(3345.00 AS Decimal(10, 2)), CAST(3882.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(268.50 AS Decimal(10, 2)), CAST(0x0000AD7700000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10382, 1, 1, 1, CAST(3882.00 AS Decimal(10, 2)), CAST(4315.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(216.50 AS Decimal(10, 2)), CAST(0x0000AD9600000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10383, 1, 1, 1, CAST(4315.00 AS Decimal(10, 2)), CAST(4795.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(240.00 AS Decimal(10, 2)), CAST(0x0000ADB400000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10384, 1, 1, 1, CAST(4795.00 AS Decimal(10, 2)), CAST(5269.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(237.00 AS Decimal(10, 2)), CAST(0x0000ADD300000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10385, 1, 1, 1, CAST(5269.00 AS Decimal(10, 2)), CAST(5678.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(204.50 AS Decimal(10, 2)), CAST(0x0000ADF100000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10386, 1, 1, 1, CAST(5678.00 AS Decimal(10, 2)), CAST(6309.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(315.50 AS Decimal(10, 2)), CAST(0x0000AE1000000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10387, 1, 1, 1, CAST(6309.00 AS Decimal(10, 2)), CAST(6842.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(266.50 AS Decimal(10, 2)), CAST(0x0000AE2F00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10388, 1, 1, 1, CAST(6842.00 AS Decimal(10, 2)), CAST(7286.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(222.00 AS Decimal(10, 2)), CAST(0x0000AE4B00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10389, 1, 1, 1, CAST(7286.00 AS Decimal(10, 2)), CAST(7883.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(298.50 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10390, 1, 1, 1, CAST(7883.00 AS Decimal(10, 2)), CAST(8351.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(234.00 AS Decimal(10, 2)), CAST(0x0000AE8800000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10391, 1, 1, 1, CAST(8351.00 AS Decimal(10, 2)), CAST(8893.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(271.00 AS Decimal(10, 2)), CAST(0x0000AEA700000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10392, 1, 2, 2, CAST(2000.00 AS Decimal(10, 2)), CAST(2460.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(230.00 AS Decimal(10, 2)), CAST(0x0000AD1B00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10393, 1, 2, 2, CAST(2460.00 AS Decimal(10, 2)), CAST(2843.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(191.50 AS Decimal(10, 2)), CAST(0x0000AD3A00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10394, 1, 2, 2, CAST(2843.00 AS Decimal(10, 2)), CAST(3438.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(297.50 AS Decimal(10, 2)), CAST(0x0000AD5800000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10395, 1, 2, 2, CAST(3438.00 AS Decimal(10, 2)), CAST(3960.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(261.00 AS Decimal(10, 2)), CAST(0x0000AD7700000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10396, 1, 2, 2, CAST(3960.00 AS Decimal(10, 2)), CAST(4381.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(210.50 AS Decimal(10, 2)), CAST(0x0000AD9600000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10397, 1, 2, 2, CAST(4381.00 AS Decimal(10, 2)), CAST(4867.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(243.00 AS Decimal(10, 2)), CAST(0x0000ADB400000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10398, 1, 2, 2, CAST(4867.00 AS Decimal(10, 2)), CAST(5326.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(229.50 AS Decimal(10, 2)), CAST(0x0000ADD300000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10399, 1, 2, 2, CAST(5326.00 AS Decimal(10, 2)), CAST(5837.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(255.50 AS Decimal(10, 2)), CAST(0x0000ADF100000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10400, 1, 2, 2, CAST(5837.00 AS Decimal(10, 2)), CAST(6306.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(234.50 AS Decimal(10, 2)), CAST(0x0000AE1000000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10401, 1, 2, 2, CAST(6306.00 AS Decimal(10, 2)), CAST(6879.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(286.50 AS Decimal(10, 2)), CAST(0x0000AE2F00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10402, 1, 2, 2, CAST(6879.00 AS Decimal(10, 2)), CAST(7390.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(255.50 AS Decimal(10, 2)), CAST(0x0000AE4B00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10403, 1, 2, 2, CAST(7390.00 AS Decimal(10, 2)), CAST(7811.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(210.50 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10404, 1, 2, 2, CAST(7811.00 AS Decimal(10, 2)), CAST(8254.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(221.50 AS Decimal(10, 2)), CAST(0x0000AE8800000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10405, 1, 2, 2, CAST(8254.00 AS Decimal(10, 2)), CAST(8800.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(273.00 AS Decimal(10, 2)), CAST(0x0000AEA700000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10406, 1, 3, 3, CAST(2000.00 AS Decimal(10, 2)), CAST(2561.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(280.50 AS Decimal(10, 2)), CAST(0x0000AD1B00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10407, 1, 3, 3, CAST(2561.00 AS Decimal(10, 2)), CAST(3091.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(265.00 AS Decimal(10, 2)), CAST(0x0000AD3A00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10408, 1, 3, 3, CAST(3091.00 AS Decimal(10, 2)), CAST(3700.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(304.50 AS Decimal(10, 2)), CAST(0x0000AD5800000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10409, 1, 3, 3, CAST(3700.00 AS Decimal(10, 2)), CAST(4155.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(227.50 AS Decimal(10, 2)), CAST(0x0000AD7700000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10410, 1, 3, 3, CAST(4155.00 AS Decimal(10, 2)), CAST(4923.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(384.00 AS Decimal(10, 2)), CAST(0x0000AD9600000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10411, 1, 3, 3, CAST(4923.00 AS Decimal(10, 2)), CAST(5371.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(224.00 AS Decimal(10, 2)), CAST(0x0000ADB400000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10412, 1, 3, 3, CAST(5371.00 AS Decimal(10, 2)), CAST(5892.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(260.50 AS Decimal(10, 2)), CAST(0x0000ADD300000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10413, 1, 3, 3, CAST(5892.00 AS Decimal(10, 2)), CAST(6221.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(164.50 AS Decimal(10, 2)), CAST(0x0000ADF100000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10414, 1, 3, 3, CAST(6221.00 AS Decimal(10, 2)), CAST(6643.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(211.00 AS Decimal(10, 2)), CAST(0x0000AE1000000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10415, 1, 3, 3, CAST(6643.00 AS Decimal(10, 2)), CAST(7194.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(275.50 AS Decimal(10, 2)), CAST(0x0000AE2F00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10416, 1, 3, 3, CAST(7194.00 AS Decimal(10, 2)), CAST(7627.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(216.50 AS Decimal(10, 2)), CAST(0x0000AE4B00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10417, 1, 3, 3, CAST(7627.00 AS Decimal(10, 2)), CAST(8123.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(248.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10418, 1, 3, 3, CAST(8123.00 AS Decimal(10, 2)), CAST(8797.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(337.00 AS Decimal(10, 2)), CAST(0x0000AE8800000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10419, 1, 3, 3, CAST(8797.00 AS Decimal(10, 2)), CAST(9124.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(163.50 AS Decimal(10, 2)), CAST(0x0000AEA700000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10420, 1, 4, 4, CAST(2000.00 AS Decimal(10, 2)), CAST(2350.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(175.00 AS Decimal(10, 2)), CAST(0x0000AD1B00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10421, 1, 4, 4, CAST(2350.00 AS Decimal(10, 2)), CAST(2893.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(271.50 AS Decimal(10, 2)), CAST(0x0000AD3A00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10422, 1, 4, 4, CAST(2893.00 AS Decimal(10, 2)), CAST(3344.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(225.50 AS Decimal(10, 2)), CAST(0x0000AD5800000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10423, 1, 4, 4, CAST(3344.00 AS Decimal(10, 2)), CAST(3792.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(224.00 AS Decimal(10, 2)), CAST(0x0000AD7700000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10424, 1, 4, 4, CAST(3792.00 AS Decimal(10, 2)), CAST(4287.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(247.50 AS Decimal(10, 2)), CAST(0x0000AD9600000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10425, 1, 4, 4, CAST(4287.00 AS Decimal(10, 2)), CAST(4709.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(211.00 AS Decimal(10, 2)), CAST(0x0000ADB400000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10426, 1, 4, 4, CAST(4709.00 AS Decimal(10, 2)), CAST(5216.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(253.50 AS Decimal(10, 2)), CAST(0x0000ADD300000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10427, 1, 4, 4, CAST(5216.00 AS Decimal(10, 2)), CAST(5740.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(262.00 AS Decimal(10, 2)), CAST(0x0000ADF100000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10428, 1, 4, 4, CAST(5740.00 AS Decimal(10, 2)), CAST(6263.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(261.50 AS Decimal(10, 2)), CAST(0x0000AE1000000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10429, 1, 4, 4, CAST(6263.00 AS Decimal(10, 2)), CAST(6924.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(330.50 AS Decimal(10, 2)), CAST(0x0000AE2F00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10430, 1, 4, 4, CAST(6924.00 AS Decimal(10, 2)), CAST(7305.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(190.50 AS Decimal(10, 2)), CAST(0x0000AE4B00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10431, 1, 4, 4, CAST(7305.00 AS Decimal(10, 2)), CAST(7799.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(247.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10432, 1, 4, 4, CAST(7799.00 AS Decimal(10, 2)), CAST(8255.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(228.00 AS Decimal(10, 2)), CAST(0x0000AE8800000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10433, 1, 4, 4, CAST(8255.00 AS Decimal(10, 2)), CAST(8698.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(221.50 AS Decimal(10, 2)), CAST(0x0000AEA700000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10434, 1, 5, 5, CAST(2000.00 AS Decimal(10, 2)), CAST(2463.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(231.50 AS Decimal(10, 2)), CAST(0x0000AD1B00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10435, 1, 5, 5, CAST(2463.00 AS Decimal(10, 2)), CAST(2967.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(252.00 AS Decimal(10, 2)), CAST(0x0000AD3A00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10436, 1, 5, 5, CAST(2967.00 AS Decimal(10, 2)), CAST(3627.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(330.00 AS Decimal(10, 2)), CAST(0x0000AD5800000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10437, 1, 5, 5, CAST(3627.00 AS Decimal(10, 2)), CAST(4223.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(298.00 AS Decimal(10, 2)), CAST(0x0000AD7700000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10438, 1, 5, 5, CAST(4223.00 AS Decimal(10, 2)), CAST(4769.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(273.00 AS Decimal(10, 2)), CAST(0x0000AD9600000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10439, 1, 5, 5, CAST(4769.00 AS Decimal(10, 2)), CAST(5271.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(251.00 AS Decimal(10, 2)), CAST(0x0000ADB400000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10440, 1, 5, 5, CAST(5271.00 AS Decimal(10, 2)), CAST(5723.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(226.00 AS Decimal(10, 2)), CAST(0x0000ADD300000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10441, 1, 5, 5, CAST(5723.00 AS Decimal(10, 2)), CAST(6228.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(252.50 AS Decimal(10, 2)), CAST(0x0000ADF100000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10442, 1, 5, 5, CAST(6228.00 AS Decimal(10, 2)), CAST(6882.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(327.00 AS Decimal(10, 2)), CAST(0x0000AE1000000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10443, 1, 5, 5, CAST(6882.00 AS Decimal(10, 2)), CAST(7438.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(278.00 AS Decimal(10, 2)), CAST(0x0000AE2F00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10444, 1, 5, 5, CAST(7438.00 AS Decimal(10, 2)), CAST(8034.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(298.00 AS Decimal(10, 2)), CAST(0x0000AE4B00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10445, 1, 5, 5, CAST(8034.00 AS Decimal(10, 2)), CAST(8580.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(273.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10446, 1, 5, 5, CAST(8580.00 AS Decimal(10, 2)), CAST(9095.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(257.50 AS Decimal(10, 2)), CAST(0x0000AE8800000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10447, 1, 5, 5, CAST(9095.00 AS Decimal(10, 2)), CAST(9546.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(225.50 AS Decimal(10, 2)), CAST(0x0000AEA700000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10448, 1, 6, 6, CAST(2000.00 AS Decimal(10, 2)), CAST(2485.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(242.50 AS Decimal(10, 2)), CAST(0x0000AD1B00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10449, 1, 6, 6, CAST(2485.00 AS Decimal(10, 2)), CAST(3034.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(274.50 AS Decimal(10, 2)), CAST(0x0000AD3A00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10450, 1, 6, 6, CAST(3034.00 AS Decimal(10, 2)), CAST(3363.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(164.50 AS Decimal(10, 2)), CAST(0x0000AD5800000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10451, 1, 6, 6, CAST(3363.00 AS Decimal(10, 2)), CAST(3661.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(149.00 AS Decimal(10, 2)), CAST(0x0000AD7700000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10452, 1, 6, 6, CAST(3661.00 AS Decimal(10, 2)), CAST(4382.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(360.50 AS Decimal(10, 2)), CAST(0x0000AD9600000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10453, 1, 6, 6, CAST(4382.00 AS Decimal(10, 2)), CAST(4869.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(243.50 AS Decimal(10, 2)), CAST(0x0000ADB400000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10454, 1, 6, 6, CAST(4869.00 AS Decimal(10, 2)), CAST(5249.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(190.00 AS Decimal(10, 2)), CAST(0x0000ADD300000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10455, 1, 6, 6, CAST(5249.00 AS Decimal(10, 2)), CAST(5924.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(337.50 AS Decimal(10, 2)), CAST(0x0000ADF100000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10456, 1, 6, 6, CAST(5924.00 AS Decimal(10, 2)), CAST(6392.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(234.00 AS Decimal(10, 2)), CAST(0x0000AE1000000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10457, 1, 6, 6, CAST(6392.00 AS Decimal(10, 2)), CAST(6895.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(251.50 AS Decimal(10, 2)), CAST(0x0000AE2F00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10458, 1, 6, 6, CAST(6895.00 AS Decimal(10, 2)), CAST(7450.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(277.50 AS Decimal(10, 2)), CAST(0x0000AE4B00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10459, 1, 6, 6, CAST(7450.00 AS Decimal(10, 2)), CAST(8029.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(289.50 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10460, 1, 6, 6, CAST(8029.00 AS Decimal(10, 2)), CAST(8439.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(205.00 AS Decimal(10, 2)), CAST(0x0000AE8800000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10461, 1, 6, 6, CAST(8439.00 AS Decimal(10, 2)), CAST(8749.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(155.00 AS Decimal(10, 2)), CAST(0x0000AEA700000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10462, 1, 7, 7, CAST(2000.00 AS Decimal(10, 2)), CAST(2561.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(280.50 AS Decimal(10, 2)), CAST(0x0000AD1B00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10463, 1, 7, 7, CAST(2561.00 AS Decimal(10, 2)), CAST(3183.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(311.00 AS Decimal(10, 2)), CAST(0x0000AD3A00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10464, 1, 7, 7, CAST(3183.00 AS Decimal(10, 2)), CAST(3791.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(304.00 AS Decimal(10, 2)), CAST(0x0000AD5800000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10465, 1, 7, 7, CAST(3791.00 AS Decimal(10, 2)), CAST(4398.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(303.50 AS Decimal(10, 2)), CAST(0x0000AD7700000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10466, 1, 7, 7, CAST(4398.00 AS Decimal(10, 2)), CAST(4871.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(236.50 AS Decimal(10, 2)), CAST(0x0000AD9600000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10467, 1, 7, 7, CAST(4871.00 AS Decimal(10, 2)), CAST(5615.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(372.00 AS Decimal(10, 2)), CAST(0x0000ADB400000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10468, 1, 7, 7, CAST(5615.00 AS Decimal(10, 2)), CAST(6147.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(266.00 AS Decimal(10, 2)), CAST(0x0000ADD300000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10469, 1, 7, 7, CAST(6147.00 AS Decimal(10, 2)), CAST(6576.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(214.50 AS Decimal(10, 2)), CAST(0x0000ADF100000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10470, 1, 7, 7, CAST(6576.00 AS Decimal(10, 2)), CAST(7245.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(334.50 AS Decimal(10, 2)), CAST(0x0000AE1000000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10471, 1, 7, 7, CAST(7245.00 AS Decimal(10, 2)), CAST(7792.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(273.50 AS Decimal(10, 2)), CAST(0x0000AE2F00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10472, 1, 7, 7, CAST(7792.00 AS Decimal(10, 2)), CAST(8241.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(224.50 AS Decimal(10, 2)), CAST(0x0000AE4B00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10473, 1, 7, 7, CAST(8241.00 AS Decimal(10, 2)), CAST(8655.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(207.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10474, 1, 7, 7, CAST(8655.00 AS Decimal(10, 2)), CAST(9098.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(221.50 AS Decimal(10, 2)), CAST(0x0000AE8800000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10475, 1, 7, 7, CAST(9098.00 AS Decimal(10, 2)), CAST(9444.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(173.00 AS Decimal(10, 2)), CAST(0x0000AEA700000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10476, 1, 8, 8, CAST(2000.00 AS Decimal(10, 2)), CAST(2475.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(237.50 AS Decimal(10, 2)), CAST(0x0000AD1B00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10477, 1, 8, 8, CAST(2475.00 AS Decimal(10, 2)), CAST(3105.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(315.00 AS Decimal(10, 2)), CAST(0x0000AD3A00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10478, 1, 8, 8, CAST(3105.00 AS Decimal(10, 2)), CAST(3692.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(293.50 AS Decimal(10, 2)), CAST(0x0000AD5800000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10479, 1, 8, 8, CAST(3692.00 AS Decimal(10, 2)), CAST(4206.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(257.00 AS Decimal(10, 2)), CAST(0x0000AD7700000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10480, 1, 8, 8, CAST(4206.00 AS Decimal(10, 2)), CAST(4627.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(210.50 AS Decimal(10, 2)), CAST(0x0000AD9600000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10481, 1, 8, 8, CAST(4627.00 AS Decimal(10, 2)), CAST(5092.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(232.50 AS Decimal(10, 2)), CAST(0x0000ADB400000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10482, 1, 8, 8, CAST(5092.00 AS Decimal(10, 2)), CAST(5556.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(232.00 AS Decimal(10, 2)), CAST(0x0000ADD300000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10483, 1, 8, 8, CAST(5556.00 AS Decimal(10, 2)), CAST(5888.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(166.00 AS Decimal(10, 2)), CAST(0x0000ADF100000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10484, 1, 8, 8, CAST(5888.00 AS Decimal(10, 2)), CAST(6357.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(234.50 AS Decimal(10, 2)), CAST(0x0000AE1000000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10485, 1, 8, 8, CAST(6357.00 AS Decimal(10, 2)), CAST(6797.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(220.00 AS Decimal(10, 2)), CAST(0x0000AE2F00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10486, 1, 8, 8, CAST(6797.00 AS Decimal(10, 2)), CAST(7194.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(198.50 AS Decimal(10, 2)), CAST(0x0000AE4B00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10487, 1, 8, 8, CAST(7194.00 AS Decimal(10, 2)), CAST(7533.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(169.50 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10488, 1, 8, 8, CAST(7533.00 AS Decimal(10, 2)), CAST(7971.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(219.00 AS Decimal(10, 2)), CAST(0x0000AE8800000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10489, 1, 8, 8, CAST(7971.00 AS Decimal(10, 2)), CAST(8617.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(323.00 AS Decimal(10, 2)), CAST(0x0000AEA700000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10490, 1, 9, 9, CAST(2000.00 AS Decimal(10, 2)), CAST(2439.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(219.50 AS Decimal(10, 2)), CAST(0x0000AD1B00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10491, 1, 9, 9, CAST(2439.00 AS Decimal(10, 2)), CAST(2867.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(214.00 AS Decimal(10, 2)), CAST(0x0000AD3A00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10492, 1, 9, 9, CAST(2867.00 AS Decimal(10, 2)), CAST(3302.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(217.50 AS Decimal(10, 2)), CAST(0x0000AD5800000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10493, 1, 9, 9, CAST(3302.00 AS Decimal(10, 2)), CAST(3836.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(267.00 AS Decimal(10, 2)), CAST(0x0000AD7700000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10494, 1, 9, 9, CAST(3836.00 AS Decimal(10, 2)), CAST(4472.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(318.00 AS Decimal(10, 2)), CAST(0x0000AD9600000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10495, 1, 9, 9, CAST(4472.00 AS Decimal(10, 2)), CAST(4813.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(170.50 AS Decimal(10, 2)), CAST(0x0000ADB400000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10496, 1, 9, 9, CAST(4813.00 AS Decimal(10, 2)), CAST(5234.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(210.50 AS Decimal(10, 2)), CAST(0x0000ADD300000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10497, 1, 9, 9, CAST(5234.00 AS Decimal(10, 2)), CAST(5798.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(282.00 AS Decimal(10, 2)), CAST(0x0000ADF100000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10498, 1, 9, 9, CAST(5798.00 AS Decimal(10, 2)), CAST(6417.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(309.50 AS Decimal(10, 2)), CAST(0x0000AE1000000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10499, 1, 9, 9, CAST(6417.00 AS Decimal(10, 2)), CAST(6906.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(244.50 AS Decimal(10, 2)), CAST(0x0000AE2F00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10500, 1, 9, 9, CAST(6906.00 AS Decimal(10, 2)), CAST(7396.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(245.00 AS Decimal(10, 2)), CAST(0x0000AE4B00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10501, 1, 9, 9, CAST(7396.00 AS Decimal(10, 2)), CAST(7662.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(133.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10502, 1, 9, 9, CAST(7662.00 AS Decimal(10, 2)), CAST(8153.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(245.50 AS Decimal(10, 2)), CAST(0x0000AE8800000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10503, 1, 9, 9, CAST(8153.00 AS Decimal(10, 2)), CAST(8703.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(275.00 AS Decimal(10, 2)), CAST(0x0000AEA700000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10504, 1, 10, 10, CAST(2000.00 AS Decimal(10, 2)), CAST(2485.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(242.50 AS Decimal(10, 2)), CAST(0x0000AD1B00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10505, 1, 10, 10, CAST(2485.00 AS Decimal(10, 2)), CAST(2900.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(207.50 AS Decimal(10, 2)), CAST(0x0000AD3A00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10506, 1, 10, 10, CAST(2900.00 AS Decimal(10, 2)), CAST(3434.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(267.00 AS Decimal(10, 2)), CAST(0x0000AD5800000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10507, 1, 10, 10, CAST(3434.00 AS Decimal(10, 2)), CAST(3883.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(224.50 AS Decimal(10, 2)), CAST(0x0000AD7700000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10508, 1, 10, 10, CAST(3883.00 AS Decimal(10, 2)), CAST(4447.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(282.00 AS Decimal(10, 2)), CAST(0x0000AD9600000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10509, 1, 10, 10, CAST(4447.00 AS Decimal(10, 2)), CAST(4989.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(271.00 AS Decimal(10, 2)), CAST(0x0000ADB400000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10510, 1, 10, 10, CAST(4989.00 AS Decimal(10, 2)), CAST(5576.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(293.50 AS Decimal(10, 2)), CAST(0x0000ADD300000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10511, 1, 10, 10, CAST(5576.00 AS Decimal(10, 2)), CAST(5968.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(196.00 AS Decimal(10, 2)), CAST(0x0000ADF100000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10512, 1, 10, 10, CAST(5968.00 AS Decimal(10, 2)), CAST(6361.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(196.50 AS Decimal(10, 2)), CAST(0x0000AE1000000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10513, 1, 10, 10, CAST(6361.00 AS Decimal(10, 2)), CAST(6912.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(275.50 AS Decimal(10, 2)), CAST(0x0000AE2F00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10514, 1, 10, 10, CAST(6912.00 AS Decimal(10, 2)), CAST(7278.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(183.00 AS Decimal(10, 2)), CAST(0x0000AE4B00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10515, 1, 10, 10, CAST(7278.00 AS Decimal(10, 2)), CAST(7717.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(219.50 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10516, 1, 10, 10, CAST(7717.00 AS Decimal(10, 2)), CAST(8260.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(271.50 AS Decimal(10, 2)), CAST(0x0000AE8800000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10517, 1, 10, 10, CAST(8260.00 AS Decimal(10, 2)), CAST(8609.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(174.50 AS Decimal(10, 2)), CAST(0x0000AEA700000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10518, 1, 11, 11, CAST(2000.00 AS Decimal(10, 2)), CAST(2498.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(249.00 AS Decimal(10, 2)), CAST(0x0000AD1B00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10519, 1, 11, 11, CAST(2498.00 AS Decimal(10, 2)), CAST(2977.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(239.50 AS Decimal(10, 2)), CAST(0x0000AD3A00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10520, 1, 11, 11, CAST(2977.00 AS Decimal(10, 2)), CAST(3411.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(217.00 AS Decimal(10, 2)), CAST(0x0000AD5800000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10521, 1, 11, 11, CAST(3411.00 AS Decimal(10, 2)), CAST(3844.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(216.50 AS Decimal(10, 2)), CAST(0x0000AD7700000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10522, 1, 11, 11, CAST(3844.00 AS Decimal(10, 2)), CAST(4295.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(225.50 AS Decimal(10, 2)), CAST(0x0000AD9600000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10523, 1, 11, 11, CAST(4295.00 AS Decimal(10, 2)), CAST(4622.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(163.50 AS Decimal(10, 2)), CAST(0x0000ADB400000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10524, 1, 11, 11, CAST(4622.00 AS Decimal(10, 2)), CAST(5132.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(255.00 AS Decimal(10, 2)), CAST(0x0000ADD300000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10525, 1, 11, 11, CAST(5132.00 AS Decimal(10, 2)), CAST(5501.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(184.50 AS Decimal(10, 2)), CAST(0x0000ADF100000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10526, 1, 11, 11, CAST(5501.00 AS Decimal(10, 2)), CAST(6030.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(264.50 AS Decimal(10, 2)), CAST(0x0000AE1000000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10527, 1, 11, 11, CAST(6030.00 AS Decimal(10, 2)), CAST(6744.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(357.00 AS Decimal(10, 2)), CAST(0x0000AE2F00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10528, 1, 11, 11, CAST(6744.00 AS Decimal(10, 2)), CAST(7191.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(223.50 AS Decimal(10, 2)), CAST(0x0000AE4B00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10529, 1, 11, 11, CAST(7191.00 AS Decimal(10, 2)), CAST(7886.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(347.50 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10530, 1, 11, 11, CAST(7886.00 AS Decimal(10, 2)), CAST(8307.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(210.50 AS Decimal(10, 2)), CAST(0x0000AE8800000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10531, 1, 11, 11, CAST(8307.00 AS Decimal(10, 2)), CAST(8762.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(227.50 AS Decimal(10, 2)), CAST(0x0000AEA700000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10532, 1, 12, 12, CAST(2000.00 AS Decimal(10, 2)), CAST(2455.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(227.50 AS Decimal(10, 2)), CAST(0x0000AD1B00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10533, 1, 12, 12, CAST(2455.00 AS Decimal(10, 2)), CAST(2909.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(227.00 AS Decimal(10, 2)), CAST(0x0000AD3A00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10534, 1, 12, 12, CAST(2909.00 AS Decimal(10, 2)), CAST(3508.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(299.50 AS Decimal(10, 2)), CAST(0x0000AD5800000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10535, 1, 12, 12, CAST(3508.00 AS Decimal(10, 2)), CAST(4056.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(274.00 AS Decimal(10, 2)), CAST(0x0000AD7700000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10536, 1, 12, 12, CAST(4056.00 AS Decimal(10, 2)), CAST(4744.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(344.00 AS Decimal(10, 2)), CAST(0x0000AD9600000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10537, 1, 12, 12, CAST(4744.00 AS Decimal(10, 2)), CAST(5199.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(227.50 AS Decimal(10, 2)), CAST(0x0000ADB400000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10538, 1, 12, 12, CAST(5199.00 AS Decimal(10, 2)), CAST(5832.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(316.50 AS Decimal(10, 2)), CAST(0x0000ADD300000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10539, 1, 12, 12, CAST(5832.00 AS Decimal(10, 2)), CAST(6302.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(235.00 AS Decimal(10, 2)), CAST(0x0000ADF100000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10540, 1, 12, 12, CAST(6302.00 AS Decimal(10, 2)), CAST(6749.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(223.50 AS Decimal(10, 2)), CAST(0x0000AE1000000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10541, 1, 12, 12, CAST(6749.00 AS Decimal(10, 2)), CAST(7309.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(280.00 AS Decimal(10, 2)), CAST(0x0000AE2F00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10542, 1, 12, 12, CAST(7309.00 AS Decimal(10, 2)), CAST(7890.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(290.50 AS Decimal(10, 2)), CAST(0x0000AE4B00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10543, 1, 12, 12, CAST(7890.00 AS Decimal(10, 2)), CAST(8605.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(357.50 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10544, 1, 12, 12, CAST(8605.00 AS Decimal(10, 2)), CAST(9027.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(211.00 AS Decimal(10, 2)), CAST(0x0000AE8800000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10545, 1, 12, 12, CAST(9027.00 AS Decimal(10, 2)), CAST(9514.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(243.50 AS Decimal(10, 2)), CAST(0x0000AEA700000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10546, 1, 70, 13, CAST(2000.00 AS Decimal(10, 2)), CAST(2364.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(182.00 AS Decimal(10, 2)), CAST(0x0000AD1B00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10547, 1, 70, 13, CAST(2364.00 AS Decimal(10, 2)), CAST(2880.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(258.00 AS Decimal(10, 2)), CAST(0x0000AD3A00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10548, 1, 70, 13, CAST(2880.00 AS Decimal(10, 2)), CAST(3561.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(340.50 AS Decimal(10, 2)), CAST(0x0000AD5800000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10549, 1, 70, 13, CAST(3561.00 AS Decimal(10, 2)), CAST(4134.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(286.50 AS Decimal(10, 2)), CAST(0x0000AD7700000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10550, 1, 70, 13, CAST(4134.00 AS Decimal(10, 2)), CAST(4666.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(266.00 AS Decimal(10, 2)), CAST(0x0000AD9600000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10551, 1, 70, 13, CAST(4666.00 AS Decimal(10, 2)), CAST(5188.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(261.00 AS Decimal(10, 2)), CAST(0x0000ADB400000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10552, 1, 70, 13, CAST(5188.00 AS Decimal(10, 2)), CAST(5737.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(274.50 AS Decimal(10, 2)), CAST(0x0000ADD300000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10553, 1, 70, 13, CAST(5737.00 AS Decimal(10, 2)), CAST(6350.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(306.50 AS Decimal(10, 2)), CAST(0x0000ADF100000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10554, 1, 70, 13, CAST(6350.00 AS Decimal(10, 2)), CAST(6755.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(202.50 AS Decimal(10, 2)), CAST(0x0000AE1000000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10555, 1, 70, 13, CAST(6755.00 AS Decimal(10, 2)), CAST(7284.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(264.50 AS Decimal(10, 2)), CAST(0x0000AE2F00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10556, 1, 70, 13, CAST(7284.00 AS Decimal(10, 2)), CAST(7812.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(264.00 AS Decimal(10, 2)), CAST(0x0000AE4B00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10557, 1, 70, 13, CAST(7812.00 AS Decimal(10, 2)), CAST(8518.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(353.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10558, 1, 70, 13, CAST(8518.00 AS Decimal(10, 2)), CAST(8886.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(184.00 AS Decimal(10, 2)), CAST(0x0000AE8800000000 AS DateTime))
GO
INSERT [dbo].[order] ([id], [bossid], [userid], [fangid], [up], [now], [dianjia], [money], [date]) VALUES (10559, 1, 70, 13, CAST(8886.00 AS Decimal(10, 2)), CAST(9462.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(288.00 AS Decimal(10, 2)), CAST(0x0000AEA700000000 AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[order] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (1, N'大傻春', N'19878907891', N'123123', CAST(0x0000AEB5009270E9 AS DateTime), CAST(1391.47 AS Decimal(10, 2)), CAST(0x0000AEB5009270E9 AS DateTime), N'/Images/用户头像/220613033500002.jpg')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (2, N'王志芳', N'16626552655', N'123', CAST(0x0000AEB30108A3F4 AS DateTime), CAST(972.78 AS Decimal(10, 2)), CAST(0x0000AEB30108A3F4 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (3, N'于光', N'13638801992', N'123', CAST(0x0000AEB30108A3F5 AS DateTime), CAST(876.28 AS Decimal(10, 2)), CAST(0x0000AEB30108A3F5 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (4, N'贾隽仙', N'13928783383', N'123', CAST(0x0000AEB30108A3F7 AS DateTime), CAST(1149.48 AS Decimal(10, 2)), CAST(0x0000AEB30108A3F7 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (5, N'贾燕青', N'15665666339', N'123', CAST(0x0000AEB30108A3F8 AS DateTime), CAST(602.64 AS Decimal(10, 2)), CAST(0x0000AEB30108A3F8 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (6, N'刘振杰', N'18982072555', N'123', CAST(0x0000AEB30108A3FA AS DateTime), CAST(993.79 AS Decimal(10, 2)), CAST(0x0000AEB30108A3FA AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (7, N'郭卫东', N'13250699993', N'123', CAST(0x0000AEB30108A3FB AS DateTime), CAST(714.70 AS Decimal(10, 2)), CAST(0x0000AEB30108A3FB AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (8, N'崔红宇', N'18666888221', N'123', CAST(0x0000AEB30108A3FC AS DateTime), CAST(1064.83 AS Decimal(10, 2)), CAST(0x0000AEB30108A3FC AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (9, N'马福平', N'15521964888', N'123', CAST(0x0000AEB30108A3FE AS DateTime), CAST(1142.90 AS Decimal(10, 2)), CAST(0x0000AEB30108A3FE AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (10, N'冯红', N'13949023216', N'123', CAST(0x0000AEB30108A3FF AS DateTime), CAST(950.10 AS Decimal(10, 2)), CAST(0x0000AEB30108A3FF AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (11, N'崔敬伟', N'13949023216', N'123', CAST(0x0000AEB30108A401 AS DateTime), CAST(1234.45 AS Decimal(10, 2)), CAST(0x0000AEB30108A401 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (12, N'穆增志', N'13938467952', N'123', CAST(0x0000AEB30108A402 AS DateTime), CAST(316.99 AS Decimal(10, 2)), CAST(0x0000AEB30108A402 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (13, N'谢志威', N'13034888821', N'123', CAST(0x0000AEB100FA8A0F AS DateTime), CAST(5000.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (14, N'吕金起', N'12345678912', N'123', CAST(0x0000AEB100E9A89F AS DateTime), CAST(5000.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (15, N'韩云庆', N'12345678912', N'123', CAST(0x0000AE8B00B77BCB AS DateTime), CAST(5000.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (16, N'鲁全福', N'12345678912', N'123', CAST(0x0000AE8B00B77BCB AS DateTime), CAST(5000.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (17, N'郭建立', N'12345678912', N'123', CAST(0x0000AE8B00B77BCB AS DateTime), CAST(5000.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (18, N'郝连水', N'12345678912', N'123', CAST(0x0000AE8B00B77BCB AS DateTime), CAST(5000.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (19, N'闫智胜', N'12345678912', N'123', CAST(0x0000AE8B00B77BCB AS DateTime), CAST(5000.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (20, N'王芳', N'12345678912', N'123', CAST(0x0000AE8B00B77BCB AS DateTime), CAST(5000.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (21, N'李娜', N'12345678912', N'123', CAST(0x0000AE8B00B77BCB AS DateTime), CAST(5000.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (22, N'张丽', N'12345678912', N'123', CAST(0x0000AE8B00B77BCB AS DateTime), CAST(5000.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (23, N'李杰', N'12345678912', N'123', CAST(0x0000AE8B00B77BCB AS DateTime), CAST(5000.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (24, N'张勇', N'12345678912', N'123', CAST(0x0000AE8B00B77BCB AS DateTime), CAST(5000.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (25, N'刘洋', N'12345678912', N'123', CAST(0x0000AE8B00B77BCB AS DateTime), CAST(5000.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (26, N'王娟', N'12345678912', N'123', CAST(0x0000AE8B00B77BCB AS DateTime), CAST(5000.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (27, N'王秀兰', N'12345678912', N'123', CAST(0x0000AE8B00B77BCB AS DateTime), CAST(5000.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (28, N'张燕', N'12345678912', N'123', CAST(0x0000AE8B00B77BCB AS DateTime), CAST(5000.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (29, N'李桂英', N'12345678912', N'123', CAST(0x0000AE8B00B77BCB AS DateTime), CAST(5000.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (30, N'王丹', N'12345678912', N'123', CAST(0x0000AE8B00B77BCB AS DateTime), CAST(5000.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (31, N'张秀兰', N'12345678912', N'123', CAST(0x0000AE8B00B77BCB AS DateTime), CAST(5000.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (32, N'张建华', N'12345678912', N'123', CAST(0x0000AE8B00B77BCB AS DateTime), CAST(5000.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (33, N'李建华', N'12345678912', N'123', CAST(0x0000AE8B00B77BCB AS DateTime), CAST(5000.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (34, N'张玉珍', N'12345678912', N'123', CAST(0x0000AE8B00B77BCB AS DateTime), CAST(5000.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (35, N'赵静', N'12345678912', N'123', CAST(0x0000AE8B00B77BCB AS DateTime), CAST(5000.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (36, N'刘鑫', N'12345678912', N'123', CAST(0x0000AE8B00B77BCB AS DateTime), CAST(5000.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (37, N'李健', N'12345678912', N'123', CAST(0x0000AE8B00B77BCB AS DateTime), CAST(5000.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (38, N'王海燕', N'12345678912', N'123', CAST(0x0000AE8B00B77BCB AS DateTime), CAST(5000.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (39, N'李春梅', N'12345678912', N'123', CAST(0x0000AE8B00B77BCB AS DateTime), CAST(5000.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (40, N'王淑珍', N'12345678912', N'123', CAST(0x0000AE8B00B77BCB AS DateTime), CAST(5000.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (41, N'王建军', N'12345678912', N'123', CAST(0x0000AE8B00B77BCB AS DateTime), CAST(5000.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (42, N'王建国', N'12345678912', N'123', CAST(0x0000AE8B00B77BCB AS DateTime), CAST(5000.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (43, N'陈鹏', N'12345678912', N'123', CAST(0x0000AE8B00B77BCB AS DateTime), CAST(5000.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (44, N'王桂荣', N'12345678912', N'123', CAST(0x0000AE8B00B77BCB AS DateTime), CAST(5000.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (45, N'张帆', N'12345678912', N'123', CAST(0x0000AE8B00B77BCB AS DateTime), CAST(5000.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (46, N'张桂芝', N'12345678912', N'123', CAST(0x0000AE8B00B77BCB AS DateTime), CAST(5000.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (47, N'张坤', N'12345678912', N'123', CAST(0x0000AE8B00B77BCB AS DateTime), CAST(5000.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (48, N'刘婷婷', N'12345678912', N'123', CAST(0x0000AE8B00B77BCB AS DateTime), CAST(5000.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (49, N'张淑兰', N'12345678912', N'123', CAST(0x0000AE8B00B77BCB AS DateTime), CAST(5000.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (50, N'王璐', N'12345678912', N'123', CAST(0x0000AE8B00B77BCB AS DateTime), CAST(5000.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (51, N'李淑华', N'12345678912', N'123', CAST(0x0000AE8B00B77BCB AS DateTime), CAST(5000.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (52, N'陈鑫', N'12345678912', N'123', CAST(0x0000AE8B00B77BCB AS DateTime), CAST(5000.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (53, N'刘建国', N'12345678912', N'123', CAST(0x0000AE8B00B77BCB AS DateTime), CAST(5000.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (54, N'李桂花', N'12345678912', N'123', CAST(0x0000AE8B00B77BCB AS DateTime), CAST(5000.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (55, N'李淑兰', N'12345678912', N'123', CAST(0x0000AE8B00B77BCB AS DateTime), CAST(5000.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (56, N'王凤兰', N'12345678912', N'123', CAST(0x0000AE8B00B77BCB AS DateTime), CAST(5000.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (57, N'陈秀珍', N'12345678912', N'123', CAST(0x0000AE8B00B77BCB AS DateTime), CAST(5000.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (58, N'田鹤', N'12345678912', N'123', CAST(0x0000AE8B00B77BCB AS DateTime), CAST(5000.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (59, N'冰勇', N'12345678912', N'123', CAST(0x0000AE8B00B77BCB AS DateTime), CAST(5000.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (60, N'万玉', N'12345678912', N'123', CAST(0x0000AE8B00B77BCB AS DateTime), CAST(5000.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (61, N'何晓', N'12345678912', N'123', CAST(0x0000AE8B00B77BCB AS DateTime), CAST(5000.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (62, N'易杰', N'12345678912', N'123', CAST(0x0000AE8B00B77BCB AS DateTime), CAST(5000.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (63, N'余坤', N'12345678912', N'123', CAST(0x0000AE8B00B77BCB AS DateTime), CAST(5000.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (64, N'耿邦', N'12345678912', N'123', CAST(0x0000AE8B00B77BCB AS DateTime), CAST(5000.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (65, N'耿勇', N'12345678912', N'123', CAST(0x0000AE8B00B77BCB AS DateTime), CAST(5000.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (66, N'池浩', N'12345678912', N'123', CAST(0x0000AE8B00B77BCB AS DateTime), CAST(5000.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (67, N'懿轩', N'12345678912', N'123', CAST(0x0000AE8B00B77BCB AS DateTime), CAST(5000.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (68, N'康泰', N'12345678912', N'123', CAST(0x0000AE8B00B77BCB AS DateTime), CAST(5000.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (69, N'嘉茂', N'12345678912', N'123', CAST(0x0000AE8B00B77BCB AS DateTime), CAST(5000.00 AS Decimal(10, 2)), CAST(0x0000AE6A00000000 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (70, N'张三', N'18912312312', N'123123', CAST(0x0000AEB30108A403 AS DateTime), CAST(522.97 AS Decimal(10, 2)), CAST(0x0000AEB30108A403 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (71, N'李瑶', N'13871455783', N'hoho123', CAST(0x0000AEB300E87A86 AS DateTime), CAST(0.00 AS Decimal(10, 2)), CAST(0x0000AEB300E87A86 AS DateTime), N'/Images/用户头像/默认.png')
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime], [url]) VALUES (72, N'张三', N'18212312312', N'123123', CAST(0x0000AEB300FC4DD2 AS DateTime), CAST(0.00 AS Decimal(10, 2)), CAST(0x0000AEB300FC4DD2 AS DateTime), N'/Images/用户头像/默认.png')
GO
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[chongzhi]  WITH CHECK ADD FOREIGN KEY([bossid])
REFERENCES [dbo].[boss] ([id])
GO
ALTER TABLE [dbo].[chongzhi]  WITH CHECK ADD FOREIGN KEY([userid])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[fang]  WITH CHECK ADD FOREIGN KEY([bossid])
REFERENCES [dbo].[boss] ([id])
GO
ALTER TABLE [dbo].[fang]  WITH CHECK ADD FOREIGN KEY([userid])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[fankui]  WITH CHECK ADD FOREIGN KEY([bossid])
REFERENCES [dbo].[boss] ([id])
GO
ALTER TABLE [dbo].[fankui]  WITH CHECK ADD FOREIGN KEY([userid])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD FOREIGN KEY([bossid])
REFERENCES [dbo].[boss] ([id])
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD FOREIGN KEY([fangid])
REFERENCES [dbo].[fang] ([id])
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD FOREIGN KEY([userid])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[zhuce]  WITH CHECK ADD FOREIGN KEY([bossid])
REFERENCES [dbo].[boss] ([id])
GO
USE [master]
GO
ALTER DATABASE [Demo] SET  READ_WRITE 
GO
