USE [master]
GO
/****** Object:  Database [BeautyStudioDB]    Script Date: 05.04.2024 21:23:52 ******/
CREATE DATABASE [BeautyStudioDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BeautyStudioDB', FILENAME = N'D:\Programms\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\BeautyStudioDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BeautyStudioDB_log', FILENAME = N'D:\Programms\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\BeautyStudioDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BeautyStudioDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BeautyStudioDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BeautyStudioDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BeautyStudioDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BeautyStudioDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BeautyStudioDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BeautyStudioDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [BeautyStudioDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BeautyStudioDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BeautyStudioDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BeautyStudioDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BeautyStudioDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BeautyStudioDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BeautyStudioDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BeautyStudioDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BeautyStudioDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BeautyStudioDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BeautyStudioDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BeautyStudioDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BeautyStudioDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BeautyStudioDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BeautyStudioDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BeautyStudioDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BeautyStudioDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BeautyStudioDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BeautyStudioDB] SET  MULTI_USER 
GO
ALTER DATABASE [BeautyStudioDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BeautyStudioDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BeautyStudioDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BeautyStudioDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BeautyStudioDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BeautyStudioDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BeautyStudioDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [BeautyStudioDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BeautyStudioDB]
GO
/****** Object:  Table [dbo].[Appointment]    Script Date: 05.04.2024 21:23:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdService] [int] NOT NULL,
	[IdStaffer] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[IdClient] [int] NOT NULL,
 CONSTRAINT [PK_Appointment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 05.04.2024 21:23:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[Surname] [nvarchar](100) NOT NULL,
	[Patronymic] [nvarchar](100) NULL,
	[PhoneNumber] [nvarchar](12) NOT NULL,
	[BirthDate] [date] NOT NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 05.04.2024 21:23:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleToStaff]    Script Date: 05.04.2024 21:23:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleToStaff](
	[IdRole] [int] NOT NULL,
	[IdStaff] [int] NOT NULL,
 CONSTRAINT [PK_RoleToStaff] PRIMARY KEY CLUSTERED 
(
	[IdRole] ASC,
	[IdStaff] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 05.04.2024 21:23:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[IdType] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Time] [time](7) NOT NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 05.04.2024 21:23:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Salary] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staffer]    Script Date: 05.04.2024 21:23:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staffer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdStaff] [int] NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[Surname] [nvarchar](100) NOT NULL,
	[Patronymic] [nvarchar](100) NULL,
	[PhoneNumber] [nvarchar](12) NOT NULL,
	[Passport] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Staffer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeService]    Script Date: 05.04.2024 21:23:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeService](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_TypeService] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 05.04.2024 21:23:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdRole] [int] NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Appointment] ON 

INSERT [dbo].[Appointment] ([Id], [IdService], [IdStaffer], [Date], [IdClient]) VALUES (4, 2, 5, CAST(N'2024-04-14T09:30:00.000' AS DateTime), 2)
INSERT [dbo].[Appointment] ([Id], [IdService], [IdStaffer], [Date], [IdClient]) VALUES (5, 4, 6, CAST(N'2024-04-12T10:00:00.000' AS DateTime), 3)
INSERT [dbo].[Appointment] ([Id], [IdService], [IdStaffer], [Date], [IdClient]) VALUES (6, 2, 5, CAST(N'2024-04-13T10:00:00.000' AS DateTime), 4)
INSERT [dbo].[Appointment] ([Id], [IdService], [IdStaffer], [Date], [IdClient]) VALUES (7, 1, 7, CAST(N'2024-04-12T11:00:00.000' AS DateTime), 5)
INSERT [dbo].[Appointment] ([Id], [IdService], [IdStaffer], [Date], [IdClient]) VALUES (8, 2, 6, CAST(N'2024-04-13T11:30:00.000' AS DateTime), 6)
INSERT [dbo].[Appointment] ([Id], [IdService], [IdStaffer], [Date], [IdClient]) VALUES (9, 3, 4, CAST(N'2024-04-13T12:00:00.000' AS DateTime), 7)
INSERT [dbo].[Appointment] ([Id], [IdService], [IdStaffer], [Date], [IdClient]) VALUES (10, 4, 7, CAST(N'2024-04-15T12:30:00.000' AS DateTime), 8)
INSERT [dbo].[Appointment] ([Id], [IdService], [IdStaffer], [Date], [IdClient]) VALUES (11, 11, 11, CAST(N'2024-04-16T13:00:00.000' AS DateTime), 9)
INSERT [dbo].[Appointment] ([Id], [IdService], [IdStaffer], [Date], [IdClient]) VALUES (12, 10, 12, CAST(N'2024-04-17T13:30:00.000' AS DateTime), 10)
INSERT [dbo].[Appointment] ([Id], [IdService], [IdStaffer], [Date], [IdClient]) VALUES (13, 3, 5, CAST(N'2024-04-17T14:00:00.000' AS DateTime), 11)
INSERT [dbo].[Appointment] ([Id], [IdService], [IdStaffer], [Date], [IdClient]) VALUES (15, 9, 11, CAST(N'2024-04-18T15:00:00.000' AS DateTime), 12)
INSERT [dbo].[Appointment] ([Id], [IdService], [IdStaffer], [Date], [IdClient]) VALUES (16, 10, 12, CAST(N'2024-04-18T15:30:00.000' AS DateTime), 13)
INSERT [dbo].[Appointment] ([Id], [IdService], [IdStaffer], [Date], [IdClient]) VALUES (17, 5, 7, CAST(N'2024-04-18T16:00:00.000' AS DateTime), 14)
INSERT [dbo].[Appointment] ([Id], [IdService], [IdStaffer], [Date], [IdClient]) VALUES (18, 2, 4, CAST(N'2024-04-19T16:30:00.000' AS DateTime), 15)
INSERT [dbo].[Appointment] ([Id], [IdService], [IdStaffer], [Date], [IdClient]) VALUES (19, 5, 6, CAST(N'2024-04-19T17:00:00.000' AS DateTime), 16)
INSERT [dbo].[Appointment] ([Id], [IdService], [IdStaffer], [Date], [IdClient]) VALUES (20, 7, 8, CAST(N'2024-04-19T17:30:00.000' AS DateTime), 17)
INSERT [dbo].[Appointment] ([Id], [IdService], [IdStaffer], [Date], [IdClient]) VALUES (21, 8, 9, CAST(N'2024-04-22T09:30:00.000' AS DateTime), 18)
INSERT [dbo].[Appointment] ([Id], [IdService], [IdStaffer], [Date], [IdClient]) VALUES (22, 8, 10, CAST(N'2024-04-22T10:00:00.000' AS DateTime), 19)
INSERT [dbo].[Appointment] ([Id], [IdService], [IdStaffer], [Date], [IdClient]) VALUES (23, 7, 11, CAST(N'2024-04-22T10:30:00.000' AS DateTime), 20)
INSERT [dbo].[Appointment] ([Id], [IdService], [IdStaffer], [Date], [IdClient]) VALUES (24, 7, 12, CAST(N'2024-04-29T11:30:00.000' AS DateTime), 23)
INSERT [dbo].[Appointment] ([Id], [IdService], [IdStaffer], [Date], [IdClient]) VALUES (27, 1, 4, CAST(N'2024-05-02T12:30:00.000' AS DateTime), 22)
INSERT [dbo].[Appointment] ([Id], [IdService], [IdStaffer], [Date], [IdClient]) VALUES (29, 6, 5, CAST(N'2024-05-04T13:30:00.000' AS DateTime), 24)
INSERT [dbo].[Appointment] ([Id], [IdService], [IdStaffer], [Date], [IdClient]) VALUES (31, 11, 12, CAST(N'2024-05-06T14:30:00.000' AS DateTime), 25)
INSERT [dbo].[Appointment] ([Id], [IdService], [IdStaffer], [Date], [IdClient]) VALUES (32, 11, 12, CAST(N'2024-05-07T15:00:00.000' AS DateTime), 26)
INSERT [dbo].[Appointment] ([Id], [IdService], [IdStaffer], [Date], [IdClient]) VALUES (33, 9, 11, CAST(N'2024-05-08T15:30:00.000' AS DateTime), 27)
INSERT [dbo].[Appointment] ([Id], [IdService], [IdStaffer], [Date], [IdClient]) VALUES (35, 11, 12, CAST(N'2024-05-10T16:30:00.000' AS DateTime), 28)
INSERT [dbo].[Appointment] ([Id], [IdService], [IdStaffer], [Date], [IdClient]) VALUES (36, 9, 11, CAST(N'2024-05-11T17:00:00.000' AS DateTime), 29)
INSERT [dbo].[Appointment] ([Id], [IdService], [IdStaffer], [Date], [IdClient]) VALUES (38, 8, 10, CAST(N'2024-05-13T18:00:00.000' AS DateTime), 7)
INSERT [dbo].[Appointment] ([Id], [IdService], [IdStaffer], [Date], [IdClient]) VALUES (39, 7, 11, CAST(N'2024-05-14T18:30:00.000' AS DateTime), 11)
SET IDENTITY_INSERT [dbo].[Appointment] OFF
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([Id], [FirstName], [Surname], [Patronymic], [PhoneNumber], [BirthDate]) VALUES (2, N'Серафим', N'Леонтьев', N'Михайлович', N'89001231223', CAST(N'2004-03-20' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [Surname], [Patronymic], [PhoneNumber], [BirthDate]) VALUES (3, N'Наталья', N'Попова', N'Ильинична', N'89001231224', CAST(N'2004-03-21' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [Surname], [Patronymic], [PhoneNumber], [BirthDate]) VALUES (4, N'Макар', N'Фомин', N'Матвеевич', N'89001231225', CAST(N'1980-03-22' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [Surname], [Patronymic], [PhoneNumber], [BirthDate]) VALUES (5, N'Анна', N'Гончарова', N'Захаровна', N'89001231226', CAST(N'2004-03-23' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [Surname], [Patronymic], [PhoneNumber], [BirthDate]) VALUES (6, N'Николай', N'Кузнецов', N'Платонович', N'89001231227', CAST(N'2004-03-24' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [Surname], [Patronymic], [PhoneNumber], [BirthDate]) VALUES (7, N'Анастасия', N'Петровская', N'Данииловна', N'89001231228', CAST(N'2005-03-25' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [Surname], [Patronymic], [PhoneNumber], [BirthDate]) VALUES (8, N'Аделина', N'Савельева', N'Арсентьевна', N'89001231229', CAST(N'2004-03-26' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [Surname], [Patronymic], [PhoneNumber], [BirthDate]) VALUES (9, N'Фёдор', N'Ершов', N'Давидович', N'89001231230', CAST(N'2004-03-27' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [Surname], [Patronymic], [PhoneNumber], [BirthDate]) VALUES (10, N'Глеб', N'Андреев', N'Александрович', N'89001231231', CAST(N'2004-03-28' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [Surname], [Patronymic], [PhoneNumber], [BirthDate]) VALUES (11, N'Анастасия', N'Воронина', N'Фёдоровна', N'89001231232', CAST(N'2004-03-29' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [Surname], [Patronymic], [PhoneNumber], [BirthDate]) VALUES (12, N'Артём', N'Майоров', N'Антонович', N'89001231233', CAST(N'1977-03-30' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [Surname], [Patronymic], [PhoneNumber], [BirthDate]) VALUES (13, N'Алиса', N'Васильева', N'Матвеевна', N'89001231234', CAST(N'1990-03-31' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [Surname], [Patronymic], [PhoneNumber], [BirthDate]) VALUES (14, N'Станислав', N'Воробьев', N'Александрович', N'89001231235', CAST(N'2004-04-01' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [Surname], [Patronymic], [PhoneNumber], [BirthDate]) VALUES (15, N'Гордей', N'Зайцев', N'Станиславович', N'89001231236', CAST(N'2004-04-02' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [Surname], [Patronymic], [PhoneNumber], [BirthDate]) VALUES (16, N'Дарья', N'Игнатова', N'Ивановна', N'89001231237', CAST(N'2004-04-03' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [Surname], [Patronymic], [PhoneNumber], [BirthDate]) VALUES (17, N'Алиса', N'Жукова', N'Тимуровна', N'89001231238', CAST(N'1999-04-04' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [Surname], [Patronymic], [PhoneNumber], [BirthDate]) VALUES (18, N'Тимофей', N'Крылов', N'Егорович', N'89001231239', CAST(N'2004-04-05' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [Surname], [Patronymic], [PhoneNumber], [BirthDate]) VALUES (19, N'Кира', N'Полякова', N'Кирилловна', N'89001231240', CAST(N'2004-04-06' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [Surname], [Patronymic], [PhoneNumber], [BirthDate]) VALUES (20, N'Даниил', N'Жданов', N'Ильич', N'89001231241', CAST(N'2004-04-07' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [Surname], [Patronymic], [PhoneNumber], [BirthDate]) VALUES (21, N'Егор', N'Архипов', N'Матвеевич', N'89001231242', CAST(N'2004-04-08' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [Surname], [Patronymic], [PhoneNumber], [BirthDate]) VALUES (22, N'Алексей', N'Козлов', N'Михайлович', N'89001231243', CAST(N'1970-04-09' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [Surname], [Patronymic], [PhoneNumber], [BirthDate]) VALUES (23, N'Елизавета', N'Егорова', N'Семёновна', N'89001231244', CAST(N'2004-04-10' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [Surname], [Patronymic], [PhoneNumber], [BirthDate]) VALUES (24, N'Савелий', N'Николаев', N'Егорович', N'89001231245', CAST(N'2004-04-11' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [Surname], [Patronymic], [PhoneNumber], [BirthDate]) VALUES (25, N'Давид', N'Соболев', N'Игоревич', N'89001231246', CAST(N'2004-04-12' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [Surname], [Patronymic], [PhoneNumber], [BirthDate]) VALUES (26, N'Георгий', N'Демьянов', N'Тимурович', N'89001231247', CAST(N'2002-04-13' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [Surname], [Patronymic], [PhoneNumber], [BirthDate]) VALUES (27, N'Кира', N'Кондратьева', N'Борисовна', N'89001231248', CAST(N'2004-04-14' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [Surname], [Patronymic], [PhoneNumber], [BirthDate]) VALUES (28, N'Виктория', N'Фокина', N'Александровна', N'89001231249', CAST(N'2004-04-15' AS Date))
INSERT [dbo].[Client] ([Id], [FirstName], [Surname], [Patronymic], [PhoneNumber], [BirthDate]) VALUES (29, N'Тимофей', N'Зайцев', N'Данилович', N'89001231250', CAST(N'2004-04-16' AS Date))
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Name]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (2, N'Работник')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
INSERT [dbo].[RoleToStaff] ([IdRole], [IdStaff]) VALUES (1, 1)
INSERT [dbo].[RoleToStaff] ([IdRole], [IdStaff]) VALUES (2, 2)
INSERT [dbo].[RoleToStaff] ([IdRole], [IdStaff]) VALUES (2, 3)
INSERT [dbo].[RoleToStaff] ([IdRole], [IdStaff]) VALUES (2, 4)
GO
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([Id], [Name], [IdType], [Price], [Time]) VALUES (1, N'Стрижка волос', 1, CAST(700.00 AS Decimal(18, 2)), CAST(N'00:30:00' AS Time))
INSERT [dbo].[Service] ([Id], [Name], [IdType], [Price], [Time]) VALUES (2, N'Укладка волос', 1, CAST(1050.00 AS Decimal(18, 2)), CAST(N'01:30:00' AS Time))
INSERT [dbo].[Service] ([Id], [Name], [IdType], [Price], [Time]) VALUES (3, N'Окрашивание волос', 2, CAST(2000.00 AS Decimal(18, 2)), CAST(N'02:00:00' AS Time))
INSERT [dbo].[Service] ([Id], [Name], [IdType], [Price], [Time]) VALUES (4, N'Ламинирование коротких волос', 2, CAST(2000.00 AS Decimal(18, 2)), CAST(N'00:45:00' AS Time))
INSERT [dbo].[Service] ([Id], [Name], [IdType], [Price], [Time]) VALUES (5, N'Ламинирование длинных волос', 3, CAST(4600.00 AS Decimal(18, 2)), CAST(N'01:00:00' AS Time))
INSERT [dbo].[Service] ([Id], [Name], [IdType], [Price], [Time]) VALUES (6, N'Кератиновое выпрямление волос', 3, CAST(1560.00 AS Decimal(18, 2)), CAST(N'02:00:00' AS Time))
INSERT [dbo].[Service] ([Id], [Name], [IdType], [Price], [Time]) VALUES (7, N'Маникюр', 4, CAST(1000.00 AS Decimal(18, 2)), CAST(N'01:00:00' AS Time))
INSERT [dbo].[Service] ([Id], [Name], [IdType], [Price], [Time]) VALUES (8, N'Педикюр', 4, CAST(1000.00 AS Decimal(18, 2)), CAST(N'01:00:00' AS Time))
INSERT [dbo].[Service] ([Id], [Name], [IdType], [Price], [Time]) VALUES (9, N'Очищение кожи', 5, CAST(3300.00 AS Decimal(18, 2)), CAST(N'01:30:00' AS Time))
INSERT [dbo].[Service] ([Id], [Name], [IdType], [Price], [Time]) VALUES (10, N'Увлажнение кожи', 5, CAST(5600.00 AS Decimal(18, 2)), CAST(N'02:00:00' AS Time))
INSERT [dbo].[Service] ([Id], [Name], [IdType], [Price], [Time]) VALUES (11, N'Пилинг', 5, CAST(1530.00 AS Decimal(18, 2)), CAST(N'01:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
SET IDENTITY_INSERT [dbo].[Staff] ON 

INSERT [dbo].[Staff] ([Id], [Name], [Salary]) VALUES (1, N'Администратор', CAST(32000.00 AS Decimal(18, 2)))
INSERT [dbo].[Staff] ([Id], [Name], [Salary]) VALUES (2, N'Парикмахер-стилист', CAST(16000.00 AS Decimal(18, 2)))
INSERT [dbo].[Staff] ([Id], [Name], [Salary]) VALUES (3, N'Мастер маникюра и педикюра', CAST(20000.00 AS Decimal(18, 2)))
INSERT [dbo].[Staff] ([Id], [Name], [Salary]) VALUES (4, N'Косметолог', CAST(22000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Staff] OFF
GO
SET IDENTITY_INSERT [dbo].[Staffer] ON 

INSERT [dbo].[Staffer] ([Id], [IdStaff], [FirstName], [Surname], [Patronymic], [PhoneNumber], [Passport]) VALUES (2, 1, N'Анна', N'Смирнова', N'Сергеевна', N'89001231212', N'1111111111')
INSERT [dbo].[Staffer] ([Id], [IdStaff], [FirstName], [Surname], [Patronymic], [PhoneNumber], [Passport]) VALUES (3, 1, N'Евгений', N'Чехов', N'Климович', N'89001231213', N'1111111112')
INSERT [dbo].[Staffer] ([Id], [IdStaff], [FirstName], [Surname], [Patronymic], [PhoneNumber], [Passport]) VALUES (4, 2, N'Вероника', N'Киселева', N'Никитична', N'89001231214', N'1111111113')
INSERT [dbo].[Staffer] ([Id], [IdStaff], [FirstName], [Surname], [Patronymic], [PhoneNumber], [Passport]) VALUES (5, 2, N'Кирилл', N'Панов', N'Андреевич', N'89001231215', N'1111111114')
INSERT [dbo].[Staffer] ([Id], [IdStaff], [FirstName], [Surname], [Patronymic], [PhoneNumber], [Passport]) VALUES (6, 2, N'Алиса', N'Гурова', N'Артуровна', N'89001231216', N'1111111115')
INSERT [dbo].[Staffer] ([Id], [IdStaff], [FirstName], [Surname], [Patronymic], [PhoneNumber], [Passport]) VALUES (7, 2, N'Мирон', N'Леонтьев', N'Петрович', N'89001231217', N'1111111116')
INSERT [dbo].[Staffer] ([Id], [IdStaff], [FirstName], [Surname], [Patronymic], [PhoneNumber], [Passport]) VALUES (8, 3, N'Виктория', N'Шульгина', N'Демидовна', N'89001231218', N'1111111117')
INSERT [dbo].[Staffer] ([Id], [IdStaff], [FirstName], [Surname], [Patronymic], [PhoneNumber], [Passport]) VALUES (9, 3, N'Евгений', N'Андреев', N'Русланович', N'89001231219', N'1111111118')
INSERT [dbo].[Staffer] ([Id], [IdStaff], [FirstName], [Surname], [Patronymic], [PhoneNumber], [Passport]) VALUES (10, 3, N'Полина', N'Князева', N'Константиновна', N'89001231220', N'1111111119')
INSERT [dbo].[Staffer] ([Id], [IdStaff], [FirstName], [Surname], [Patronymic], [PhoneNumber], [Passport]) VALUES (11, 4, N'Максим', N'Козловский', N'Степанович', N'89001231250', N'1111111120')
INSERT [dbo].[Staffer] ([Id], [IdStaff], [FirstName], [Surname], [Patronymic], [PhoneNumber], [Passport]) VALUES (12, 4, N'Алиса', N'Полякова', N'Максимовна', N'89001231250', N'1111111121')
SET IDENTITY_INSERT [dbo].[Staffer] OFF
GO
SET IDENTITY_INSERT [dbo].[TypeService] ON 

INSERT [dbo].[TypeService] ([Id], [Name]) VALUES (1, N'Стрижка и укладка волос')
INSERT [dbo].[TypeService] ([Id], [Name]) VALUES (2, N'Окрашивание волос')
INSERT [dbo].[TypeService] ([Id], [Name]) VALUES (3, N'Уход за волосами')
INSERT [dbo].[TypeService] ([Id], [Name]) VALUES (4, N'Маникюр и педикюр')
INSERT [dbo].[TypeService] ([Id], [Name]) VALUES (5, N'Услуги по уходу за кожей')
SET IDENTITY_INSERT [dbo].[TypeService] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [IdRole], [Login], [Password]) VALUES (1, 1, N'admin', N'admin')
INSERT [dbo].[User] ([Id], [IdRole], [Login], [Password]) VALUES (2, 2, N'staffer', N'staffer')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_Client] FOREIGN KEY([IdClient])
REFERENCES [dbo].[Client] ([Id])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_Client]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_Service] FOREIGN KEY([IdService])
REFERENCES [dbo].[Service] ([Id])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_Service]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_Staffer] FOREIGN KEY([IdStaffer])
REFERENCES [dbo].[Staffer] ([Id])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_Staffer]
GO
ALTER TABLE [dbo].[RoleToStaff]  WITH CHECK ADD  CONSTRAINT [FK_RoleToStaff_Role] FOREIGN KEY([IdRole])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[RoleToStaff] CHECK CONSTRAINT [FK_RoleToStaff_Role]
GO
ALTER TABLE [dbo].[RoleToStaff]  WITH CHECK ADD  CONSTRAINT [FK_RoleToStaff_Staff] FOREIGN KEY([IdStaff])
REFERENCES [dbo].[Staff] ([Id])
GO
ALTER TABLE [dbo].[RoleToStaff] CHECK CONSTRAINT [FK_RoleToStaff_Staff]
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [FK_Service_TypeService] FOREIGN KEY([IdType])
REFERENCES [dbo].[TypeService] ([Id])
GO
ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [FK_Service_TypeService]
GO
ALTER TABLE [dbo].[Staffer]  WITH CHECK ADD  CONSTRAINT [FK_Staffer_Staff] FOREIGN KEY([IdStaff])
REFERENCES [dbo].[Staff] ([Id])
GO
ALTER TABLE [dbo].[Staffer] CHECK CONSTRAINT [FK_Staffer_Staff]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([IdRole])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [BeautyStudioDB] SET  READ_WRITE 
GO
