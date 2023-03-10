USE [master]
GO
/****** Object:  Database [aspnet-ASPNET_Core_Project]    Script Date: 1/19/2023 9:57:00 AM ******/
CREATE DATABASE [aspnet-ASPNET_Core_Project]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'aspnet-ASPNET_Core_Project', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\aspnet-ASPNET_Core_Project.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'aspnet-ASPNET_Core_Project_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\aspnet-ASPNET_Core_Project_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [aspnet-ASPNET_Core_Project] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [aspnet-ASPNET_Core_Project].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [aspnet-ASPNET_Core_Project] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [aspnet-ASPNET_Core_Project] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [aspnet-ASPNET_Core_Project] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [aspnet-ASPNET_Core_Project] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [aspnet-ASPNET_Core_Project] SET ARITHABORT OFF 
GO
ALTER DATABASE [aspnet-ASPNET_Core_Project] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [aspnet-ASPNET_Core_Project] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [aspnet-ASPNET_Core_Project] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [aspnet-ASPNET_Core_Project] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [aspnet-ASPNET_Core_Project] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [aspnet-ASPNET_Core_Project] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [aspnet-ASPNET_Core_Project] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [aspnet-ASPNET_Core_Project] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [aspnet-ASPNET_Core_Project] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [aspnet-ASPNET_Core_Project] SET  ENABLE_BROKER 
GO
ALTER DATABASE [aspnet-ASPNET_Core_Project] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [aspnet-ASPNET_Core_Project] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [aspnet-ASPNET_Core_Project] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [aspnet-ASPNET_Core_Project] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [aspnet-ASPNET_Core_Project] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [aspnet-ASPNET_Core_Project] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [aspnet-ASPNET_Core_Project] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [aspnet-ASPNET_Core_Project] SET RECOVERY FULL 
GO
ALTER DATABASE [aspnet-ASPNET_Core_Project] SET  MULTI_USER 
GO
ALTER DATABASE [aspnet-ASPNET_Core_Project] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [aspnet-ASPNET_Core_Project] SET DB_CHAINING OFF 
GO
ALTER DATABASE [aspnet-ASPNET_Core_Project] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [aspnet-ASPNET_Core_Project] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [aspnet-ASPNET_Core_Project] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [aspnet-ASPNET_Core_Project] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'aspnet-ASPNET_Core_Project', N'ON'
GO
ALTER DATABASE [aspnet-ASPNET_Core_Project] SET QUERY_STORE = OFF
GO
USE [aspnet-ASPNET_Core_Project]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 1/19/2023 9:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Aircraft]    Script Date: 1/19/2023 9:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aircraft](
	[AircraftId] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](max) NULL,
	[ImagePath] [nvarchar](max) NULL,
 CONSTRAINT [PK_Aircraft] PRIMARY KEY CLUSTERED 
(
	[AircraftId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 1/19/2023 9:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 1/19/2023 9:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 1/19/2023 9:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 1/19/2023 9:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 1/19/2023 9:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 1/19/2023 9:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[ContactNo] [nvarchar](max) NULL,
	[Country] [nvarchar](max) NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 1/19/2023 9:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MissionAircraftEntries]    Script Date: 1/19/2023 9:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MissionAircraftEntries](
	[MissionAircraftEntryId] [int] IDENTITY(1,1) NOT NULL,
	[MissionId] [int] NOT NULL,
	[AircraftId] [int] NOT NULL,
 CONSTRAINT [PK_MissionAircraftEntries] PRIMARY KEY CLUSTERED 
(
	[MissionAircraftEntryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MissionEntries]    Script Date: 1/19/2023 9:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MissionEntries](
	[MissionEntryId] [int] IDENTITY(1,1) NOT NULL,
	[SoldierId] [int] NOT NULL,
	[MissionAircraftEntryId] [int] NOT NULL,
 CONSTRAINT [PK_MissionEntries] PRIMARY KEY CLUSTERED 
(
	[MissionEntryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Missions]    Script Date: 1/19/2023 9:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Missions](
	[MissionId] [int] IDENTITY(1,1) NOT NULL,
	[Location] [nvarchar](30) NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[IsActive] [bit] NOT NULL,
	[Budget] [money] NOT NULL,
	[ImagePath] [nvarchar](max) NULL,
 CONSTRAINT [PK_Missions] PRIMARY KEY CLUSTERED 
(
	[MissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MissionSoldierEntries]    Script Date: 1/19/2023 9:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MissionSoldierEntries](
	[MissionSoldierEntryId] [int] IDENTITY(1,1) NOT NULL,
	[MissionId] [int] NOT NULL,
	[SoldierId] [int] NOT NULL,
 CONSTRAINT [PK_MissionSoldierEntries] PRIMARY KEY CLUSTERED 
(
	[MissionSoldierEntryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rank]    Script Date: 1/19/2023 9:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rank](
	[RankId] [int] IDENTITY(1,1) NOT NULL,
	[RankName] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Rank] PRIMARY KEY CLUSTERED 
(
	[RankId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SoldierImages]    Script Date: 1/19/2023 9:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SoldierImages](
	[SoldierId] [int] NOT NULL,
	[ImagePath] [nvarchar](max) NULL,
 CONSTRAINT [PK_SoldierImages] PRIMARY KEY CLUSTERED 
(
	[SoldierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Soldiers]    Script Date: 1/19/2023 9:57:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Soldiers](
	[SoldierId] [int] IDENTITY(1,1) NOT NULL,
	[SoldierName] [nvarchar](30) NOT NULL,
	[RankId] [int] NOT NULL,
	[Age] [int] NOT NULL,
 CONSTRAINT [PK_Soldiers] PRIMARY KEY CLUSTERED 
(
	[SoldierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'00000000000000_CreateIdentitySchema', N'3.1.32')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230116155049_AddApplicationUser', N'3.1.32')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230117041011_AddClasses', N'3.1.32')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230117062747_addBudget', N'3.1.32')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230117071812_AddAircraftClass', N'3.1.32')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230117095856_addMissionAircraftEntryTable', N'3.1.32')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230117191908_changeCodeDatatypeIntToString', N'3.1.32')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230117195541_RenameTables', N'3.1.32')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230117213133_ModifyMissionEntryTable', N'3.1.32')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230117225506_UpdateDatabaseForAccurateDataEntry', N'3.1.32')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230117225624_CapitalizeTableNameFirstLetter', N'3.1.32')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230118150525_AddImageToMissionTable', N'3.1.32')
GO
SET IDENTITY_INSERT [dbo].[Aircraft] ON 

INSERT [dbo].[Aircraft] ([AircraftId], [Code], [ImagePath]) VALUES (1, N'C-001', N'/AircraftImages/a1.jpeg')
INSERT [dbo].[Aircraft] ([AircraftId], [Code], [ImagePath]) VALUES (2, N'C-002', N'/AircraftImages/a2.jpeg')
INSERT [dbo].[Aircraft] ([AircraftId], [Code], [ImagePath]) VALUES (3, N'C-003', N'/AircraftImages/a3.jpeg')
INSERT [dbo].[Aircraft] ([AircraftId], [Code], [ImagePath]) VALUES (4, N'C-004', N'/AircraftImages/a5.jpeg')
INSERT [dbo].[Aircraft] ([AircraftId], [Code], [ImagePath]) VALUES (6, N'C-005', N'/AircraftImages/a5.jpeg')
SET IDENTITY_INSERT [dbo].[Aircraft] OFF
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'14dd795d-208a-427c-b596-e10b247005e8', N'Soldier', N'SOLDIER', N'7b101cfb-2a5e-4d6c-8ea4-602134607dce')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'16addd4a-7e09-48ab-8f26-858bdcf023c0', N'Executive', N'EXECUTIVE', N'd95a441b-ee95-49f2-84a9-89c5a2f081b5')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'7efd2027-5a91-408a-94b4-f0de2d59b178', N'Admin', N'ADMIN', N'd1d6ec65-daf9-4b4a-9fe0-31cbd6773f04')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0d424e5c-a6a9-4cd7-bbf4-5724de17fda8', N'14dd795d-208a-427c-b596-e10b247005e8')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'3776562f-a5ef-48a1-8216-177ae1bf6349', N'16addd4a-7e09-48ab-8f26-858bdcf023c0')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'4b983a69-0cc4-4fa7-94ff-245c13e34762', N'7efd2027-5a91-408a-94b4-f0de2d59b178')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [ContactNo], [Country], [FirstName], [LastName]) VALUES (N'0d424e5c-a6a9-4cd7-bbf4-5724de17fda8', N'afifa123@gmail.com', N'AFIFA123@GMAIL.COM', N'afifa123@gmail.com', N'AFIFA123@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEIQQ2NMinrgIqn9QY2Z8ZstlVsp0wfNdIJd2DW2a05ZRfzcZbfQJxVYZz+v9r/WQ8A==', N'FUJP43PSN7ZIQHOLHRDGWSMNKFBGM5Y2', N'6d7826b7-9b20-4eb6-8831-de54d4d3e08d', NULL, 0, 0, NULL, 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [ContactNo], [Country], [FirstName], [LastName]) VALUES (N'28fa530d-8510-429c-80a1-414d80974fdc', N'jannatul123@gmail.com', N'JANNATUL123@GMAIL.COM', N'jannatul123@gmail.com', N'JANNATUL123@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEEAdNmoJS6BwQH4l00LMBTFM8Js4/Nb/m5Xwlw+BXpCwnDk8AUexTNewpqG4q8BExw==', N'GWGBDMIYIUC6KSKQGCFNWWT36QKVUZNA', N'7fa31cd1-5875-4bac-a57a-99817286f5f2', NULL, 0, 0, NULL, 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [ContactNo], [Country], [FirstName], [LastName]) VALUES (N'32f00bc1-fb86-4171-a47f-f0e1a90068a3', N'sharmin123@gmail.com', N'SHARMIN123@GMAIL.COM', N'sharmin123@gmail.com', N'SHARMIN123@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEBdeQ1amNJ0eqa+I48tsUZ8T3EVlMsEHSYZVMgS6zXeXtueiNYhTaWpzP8V/AwxXwg==', N'G5C3XYOLBMMQBG7GNVX5VARCLSTTSYFZ', N'e3d04294-33fc-4ba1-9da6-8aea31a43e2a', NULL, 0, 0, NULL, 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [ContactNo], [Country], [FirstName], [LastName]) VALUES (N'3776562f-a5ef-48a1-8216-177ae1bf6349', N'executive123@gmail.com', N'EXECUTIVE123@GMAIL.COM', N'executive123@gmail.com', N'EXECUTIVE123@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEBFu2T8f6g+GtNdItupNeCtBpkSu4jFgB4zC/36FDj781GZzIFOT9MrYjUqsYDUV+A==', N'AMGRQ7NQNW6WAJ66X6JWJXEJ63PFUBPZ', N'392f531b-71de-42f3-adc2-c4608285f61c', NULL, 0, 0, NULL, 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [ContactNo], [Country], [FirstName], [LastName]) VALUES (N'4b983a69-0cc4-4fa7-94ff-245c13e34762', N'admin123@gmail.com', N'ADMIN123@GMAIL.COM', N'admin123@gmail.com', N'ADMIN123@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAECPcsfsoVyRmBrzPyL/0Cqw47KSR42/4IQ0rb6CUcdD9Zy9aw/qT2cWJdXGYsPzdHA==', N'KVQFJIGSMNS7RVXXAN5F35XWXLKDG4RW', N'b3b3c967-9965-4f8b-96da-4779b89fc217', NULL, 0, 0, NULL, 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [ContactNo], [Country], [FirstName], [LastName]) VALUES (N'69d69104-0657-4bac-bdc8-0c8e03bc359a', N'shababa123@gmail.com', N'SHABABA123@GMAIL.COM', N'shababa123@gmail.com', N'SHABABA123@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEJaHeIfbQRSEqCExUBy0jaYcgA2uAaT/PkMlmjCGes1J/9aHmf/NZkQizGnAdpqcKA==', N'KEVWLNX7USGDPRKC5GXGSHDBDTH6J2AD', N'6fb4b053-c2b7-4d11-9522-994de081d9d3', NULL, 0, 0, NULL, 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [ContactNo], [Country], [FirstName], [LastName]) VALUES (N'c45276aa-e497-4b65-b41b-2ef12ac91c81', N'afrin123@gmail.com', N'AFRIN123@GMAIL.COM', N'afrin123@gmail.com', N'AFRIN123@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEIwF1dUD5x1+xusyzfJ1jVgiA9gkCf4y3Is2oTI9DzH1suaPFoU+lr7MMmDS/YjBGg==', N'PFERTZ5DFNNQGOOAN7JSHGZIACBZUZNO', N'59da1b62-09f7-4465-a41e-085da9b0dced', NULL, 0, 0, NULL, 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [ContactNo], [Country], [FirstName], [LastName]) VALUES (N'fe759685-ac35-4a6b-b059-8a166c18ec15', N'faiza123@gmail.com', N'FAIZA123@GMAIL.COM', N'faiza123@gmail.com', N'FAIZA123@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEBnhWkYgRSmPl6QG/ndnu+oqUR/peON1J2r/oKF0QEffSz22rCk+45f+uLuljzn4zw==', N'P44GK3VV2JE35EIU5FXP3OBGUZSKBAA3', N'f625c53b-9143-45a8-a474-c6bf3a361bbf', NULL, 0, 0, NULL, 1, 0, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Missions] ON 

INSERT [dbo].[Missions] ([MissionId], [Location], [StartDate], [Description], [IsActive], [Budget], [ImagePath]) VALUES (12, N'Khagrachori', CAST(N'2023-01-17T00:00:00.0000000' AS DateTime2), N'Border Mission', 1, 5000000.0000, N'/LeaderImages/man4.png')
INSERT [dbo].[Missions] ([MissionId], [Location], [StartDate], [Description], [IsActive], [Budget], [ImagePath]) VALUES (13, N'Rangamati', CAST(N'2023-01-08T00:00:00.0000000' AS DateTime2), N'Border Mission', 1, 5700000.0000, N'/LeaderImages/man2.png')
SET IDENTITY_INSERT [dbo].[Missions] OFF
GO
SET IDENTITY_INSERT [dbo].[MissionSoldierEntries] ON 

INSERT [dbo].[MissionSoldierEntries] ([MissionSoldierEntryId], [MissionId], [SoldierId]) VALUES (28, 13, 1)
INSERT [dbo].[MissionSoldierEntries] ([MissionSoldierEntryId], [MissionId], [SoldierId]) VALUES (29, 13, 2)
INSERT [dbo].[MissionSoldierEntries] ([MissionSoldierEntryId], [MissionId], [SoldierId]) VALUES (30, 12, 1)
INSERT [dbo].[MissionSoldierEntries] ([MissionSoldierEntryId], [MissionId], [SoldierId]) VALUES (31, 12, 3)
INSERT [dbo].[MissionSoldierEntries] ([MissionSoldierEntryId], [MissionId], [SoldierId]) VALUES (32, 12, 2)
SET IDENTITY_INSERT [dbo].[MissionSoldierEntries] OFF
GO
SET IDENTITY_INSERT [dbo].[Rank] ON 

INSERT [dbo].[Rank] ([RankId], [RankName]) VALUES (1, N'Air Chief Marshal')
INSERT [dbo].[Rank] ([RankId], [RankName]) VALUES (2, N'Air Marshal')
INSERT [dbo].[Rank] ([RankId], [RankName]) VALUES (3, N'Air Vice Marshal')
INSERT [dbo].[Rank] ([RankId], [RankName]) VALUES (4, N'Air Commodore')
INSERT [dbo].[Rank] ([RankId], [RankName]) VALUES (5, N'Group Captain')
INSERT [dbo].[Rank] ([RankId], [RankName]) VALUES (6, N'Wing Commander')
INSERT [dbo].[Rank] ([RankId], [RankName]) VALUES (7, N'Squadron Leader')
INSERT [dbo].[Rank] ([RankId], [RankName]) VALUES (8, N'Flight Lieutenant')
SET IDENTITY_INSERT [dbo].[Rank] OFF
GO
INSERT [dbo].[SoldierImages] ([SoldierId], [ImagePath]) VALUES (1, N'/Images/man2.png')
INSERT [dbo].[SoldierImages] ([SoldierId], [ImagePath]) VALUES (2, N'/Images/lady2.png')
INSERT [dbo].[SoldierImages] ([SoldierId], [ImagePath]) VALUES (3, N'/Images/lady1.png')
GO
SET IDENTITY_INSERT [dbo].[Soldiers] ON 

INSERT [dbo].[Soldiers] ([SoldierId], [SoldierName], [RankId], [Age]) VALUES (1, N'Rashed Kamal', 6, 42)
INSERT [dbo].[Soldiers] ([SoldierId], [SoldierName], [RankId], [Age]) VALUES (2, N'Sanjana Afrin', 8, 37)
INSERT [dbo].[Soldiers] ([SoldierId], [SoldierName], [RankId], [Age]) VALUES (3, N'Afsana Sarkar', 7, 37)
SET IDENTITY_INSERT [dbo].[Soldiers] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 1/19/2023 9:57:00 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 1/19/2023 9:57:00 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 1/19/2023 9:57:00 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 1/19/2023 9:57:00 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 1/19/2023 9:57:00 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 1/19/2023 9:57:00 AM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 1/19/2023 9:57:00 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MissionAircraftEntries_AircraftId]    Script Date: 1/19/2023 9:57:00 AM ******/
CREATE NONCLUSTERED INDEX [IX_MissionAircraftEntries_AircraftId] ON [dbo].[MissionAircraftEntries]
(
	[AircraftId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MissionAircraftEntries_MissionId]    Script Date: 1/19/2023 9:57:00 AM ******/
CREATE NONCLUSTERED INDEX [IX_MissionAircraftEntries_MissionId] ON [dbo].[MissionAircraftEntries]
(
	[MissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MissionEntries_MissionAircraftEntryId]    Script Date: 1/19/2023 9:57:00 AM ******/
CREATE NONCLUSTERED INDEX [IX_MissionEntries_MissionAircraftEntryId] ON [dbo].[MissionEntries]
(
	[MissionAircraftEntryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MissionEntries_SoldierId]    Script Date: 1/19/2023 9:57:00 AM ******/
CREATE NONCLUSTERED INDEX [IX_MissionEntries_SoldierId] ON [dbo].[MissionEntries]
(
	[SoldierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MissionSoldierEntries_MissionId]    Script Date: 1/19/2023 9:57:00 AM ******/
CREATE NONCLUSTERED INDEX [IX_MissionSoldierEntries_MissionId] ON [dbo].[MissionSoldierEntries]
(
	[MissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MissionSoldierEntries_SoldierId]    Script Date: 1/19/2023 9:57:00 AM ******/
CREATE NONCLUSTERED INDEX [IX_MissionSoldierEntries_SoldierId] ON [dbo].[MissionSoldierEntries]
(
	[SoldierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Soldiers_RankId]    Script Date: 1/19/2023 9:57:00 AM ******/
CREATE NONCLUSTERED INDEX [IX_Soldiers_RankId] ON [dbo].[Soldiers]
(
	[RankId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MissionEntries] ADD  DEFAULT ((0)) FOR [MissionAircraftEntryId]
GO
ALTER TABLE [dbo].[Missions] ADD  DEFAULT ((0.0)) FOR [Budget]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[MissionAircraftEntries]  WITH CHECK ADD  CONSTRAINT [FK_MissionAircraftEntries_Aircraft_AircraftId] FOREIGN KEY([AircraftId])
REFERENCES [dbo].[Aircraft] ([AircraftId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MissionAircraftEntries] CHECK CONSTRAINT [FK_MissionAircraftEntries_Aircraft_AircraftId]
GO
ALTER TABLE [dbo].[MissionAircraftEntries]  WITH CHECK ADD  CONSTRAINT [FK_MissionAircraftEntries_Missions_MissionId] FOREIGN KEY([MissionId])
REFERENCES [dbo].[Missions] ([MissionId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MissionAircraftEntries] CHECK CONSTRAINT [FK_MissionAircraftEntries_Missions_MissionId]
GO
ALTER TABLE [dbo].[MissionEntries]  WITH CHECK ADD  CONSTRAINT [FK_MissionEntries_MissionAircraftEntries_MissionAircraftEntryId] FOREIGN KEY([MissionAircraftEntryId])
REFERENCES [dbo].[MissionAircraftEntries] ([MissionAircraftEntryId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MissionEntries] CHECK CONSTRAINT [FK_MissionEntries_MissionAircraftEntries_MissionAircraftEntryId]
GO
ALTER TABLE [dbo].[MissionEntries]  WITH CHECK ADD  CONSTRAINT [FK_MissionEntries_Soldiers_SoldierId] FOREIGN KEY([SoldierId])
REFERENCES [dbo].[Soldiers] ([SoldierId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MissionEntries] CHECK CONSTRAINT [FK_MissionEntries_Soldiers_SoldierId]
GO
ALTER TABLE [dbo].[MissionSoldierEntries]  WITH CHECK ADD  CONSTRAINT [FK_MissionSoldierEntries_Missions_MissionId] FOREIGN KEY([MissionId])
REFERENCES [dbo].[Missions] ([MissionId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MissionSoldierEntries] CHECK CONSTRAINT [FK_MissionSoldierEntries_Missions_MissionId]
GO
ALTER TABLE [dbo].[MissionSoldierEntries]  WITH CHECK ADD  CONSTRAINT [FK_MissionSoldierEntries_Soldiers_SoldierId] FOREIGN KEY([SoldierId])
REFERENCES [dbo].[Soldiers] ([SoldierId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MissionSoldierEntries] CHECK CONSTRAINT [FK_MissionSoldierEntries_Soldiers_SoldierId]
GO
ALTER TABLE [dbo].[SoldierImages]  WITH CHECK ADD  CONSTRAINT [FK_SoldierImages_Soldiers_SoldierId] FOREIGN KEY([SoldierId])
REFERENCES [dbo].[Soldiers] ([SoldierId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SoldierImages] CHECK CONSTRAINT [FK_SoldierImages_Soldiers_SoldierId]
GO
ALTER TABLE [dbo].[Soldiers]  WITH CHECK ADD  CONSTRAINT [FK_Soldiers_Rank_RankId] FOREIGN KEY([RankId])
REFERENCES [dbo].[Rank] ([RankId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Soldiers] CHECK CONSTRAINT [FK_Soldiers_Rank_RankId]
GO
USE [master]
GO
ALTER DATABASE [aspnet-ASPNET_Core_Project] SET  READ_WRITE 
GO
