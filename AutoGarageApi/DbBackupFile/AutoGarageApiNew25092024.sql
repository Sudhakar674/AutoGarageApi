USE [master]
GO
/****** Object:  Database [AutoGarageApiNew25092024]    Script Date: 08-11-2024 10.33.51 AM ******/
CREATE DATABASE [AutoGarageApiNew25092024]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AutoGarageApiNew25092024', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\AutoGarageApiNew25092024.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AutoGarageApiNew25092024_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\AutoGarageApiNew25092024_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [AutoGarageApiNew25092024] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AutoGarageApiNew25092024].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AutoGarageApiNew25092024] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AutoGarageApiNew25092024] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AutoGarageApiNew25092024] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AutoGarageApiNew25092024] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AutoGarageApiNew25092024] SET ARITHABORT OFF 
GO
ALTER DATABASE [AutoGarageApiNew25092024] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [AutoGarageApiNew25092024] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AutoGarageApiNew25092024] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AutoGarageApiNew25092024] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AutoGarageApiNew25092024] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AutoGarageApiNew25092024] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AutoGarageApiNew25092024] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AutoGarageApiNew25092024] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AutoGarageApiNew25092024] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AutoGarageApiNew25092024] SET  ENABLE_BROKER 
GO
ALTER DATABASE [AutoGarageApiNew25092024] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AutoGarageApiNew25092024] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AutoGarageApiNew25092024] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AutoGarageApiNew25092024] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AutoGarageApiNew25092024] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AutoGarageApiNew25092024] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AutoGarageApiNew25092024] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AutoGarageApiNew25092024] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AutoGarageApiNew25092024] SET  MULTI_USER 
GO
ALTER DATABASE [AutoGarageApiNew25092024] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AutoGarageApiNew25092024] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AutoGarageApiNew25092024] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AutoGarageApiNew25092024] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AutoGarageApiNew25092024] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AutoGarageApiNew25092024] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [AutoGarageApiNew25092024] SET QUERY_STORE = ON
GO
ALTER DATABASE [AutoGarageApiNew25092024] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [AutoGarageApiNew25092024]
GO
/****** Object:  Table [dbo].[AcAndEngineCooling]    Script Date: 08-11-2024 10.33.51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AcAndEngineCooling](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NULL,
	[Image] [nvarchar](max) NULL,
	[Remark] [nvarchar](max) NULL,
	[Action] [nvarchar](10) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[FK_PremiumInspectionId] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ACAndEngineCoolingListMaster]    Script Date: 08-11-2024 10.33.51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACAndEngineCoolingListMaster](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[AcAndEngineCooling] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AllNotes]    Script Date: 08-11-2024 10.33.51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AllNotes](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ImportantNotes] [nvarchar](max) NULL,
	[WearAndTear] [nvarchar](max) NULL,
	[OtherNotes] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[FK_PremiumInspectionId] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BrakingAndSafety]    Script Date: 08-11-2024 10.33.51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BrakingAndSafety](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NULL,
	[Image] [nvarchar](max) NULL,
	[Remark] [nvarchar](max) NULL,
	[Action] [nvarchar](10) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[FK_PremiumInspectionId] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BrakingAndSafetyListMaster]    Script Date: 08-11-2024 10.33.51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BrakingAndSafetyListMaster](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[BrakingAndSafety] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarMaster]    Script Date: 08-11-2024 10.33.51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarMaster](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Company] [nvarchar](250) NULL,
	[CarName] [nvarchar](250) NULL,
	[ModelNumber] [nvarchar](100) NULL,
	[EngeenType] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_CarMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarOptionListMaster]    Script Date: 08-11-2024 10.33.51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarOptionListMaster](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CarOption] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarOptions]    Script Date: 08-11-2024 10.33.51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarOptions](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FK_PremiumInspectionId] [bigint] NULL,
	[FK_CarOptionMasterId] [bigint] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChassisCondition]    Script Date: 08-11-2024 10.33.51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChassisCondition](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NULL,
	[Image] [nvarchar](max) NULL,
	[Remark] [nvarchar](max) NULL,
	[Action] [nvarchar](10) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[FK_PremiumInspectionId] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChassisConditionListMaster]    Script Date: 08-11-2024 10.33.51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChassisConditionListMaster](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ChassisCondition] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CountryMasterNew]    Script Date: 08-11-2024 10.33.51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CountryMasterNew](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CountryName] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[IsActive] [bit] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_CountryMasterNew] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ElectricalSystems]    Script Date: 08-11-2024 10.33.51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ElectricalSystems](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NULL,
	[Image] [nvarchar](max) NULL,
	[Remark] [nvarchar](max) NULL,
	[Action] [nvarchar](10) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[FK_PremiumInspectionId] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ElectricalSystemsListMaster]    Script Date: 08-11-2024 10.33.51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ElectricalSystemsListMaster](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ElectricalSystems] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exterior]    Script Date: 08-11-2024 10.33.51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exterior](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NULL,
	[Image] [nvarchar](max) NULL,
	[Remark] [nvarchar](max) NULL,
	[Action] [nvarchar](10) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[FK_PremiumInspectionId] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExteriorListMaster]    Script Date: 08-11-2024 10.33.51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExteriorListMaster](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Exterior] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistoryAndRecordListMaster ]    Script Date: 08-11-2024 10.33.51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoryAndRecordListMaster ](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[HistoryAndRecord] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistoryAndRecords]    Script Date: 08-11-2024 10.33.51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoryAndRecords](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[NoOfLocalAccidents] [nvarchar](250) NULL,
	[TypeOfUseInSide] [nvarchar](250) NULL,
	[EngineChangeInSide] [nvarchar](250) NULL,
	[AirBag] [nvarchar](250) NULL,
	[TypeOfUseOutSide] [nvarchar](250) NULL,
	[CarseerLastMeterReading] [nvarchar](250) NULL,
	[BodyType] [nvarchar](250) NULL,
	[EngineChangeTechnicalSpecs] [nvarchar](250) NULL,
	[OwnershipTransferFee] [nvarchar](250) NULL,
	[Owners] [nvarchar](250) NULL,
	[StandardSeating] [nvarchar](250) NULL,
	[Height] [nvarchar](250) NULL,
	[HighwayMilleage] [nvarchar](250) NULL,
	[YearlyRegistrationFee] [nvarchar](250) NULL,
	[MadeIn] [nvarchar](250) NULL,
	[Engine] [nvarchar](250) NULL,
	[JordanianOwnership] [nvarchar](250) NULL,
	[RegistrationType] [nvarchar](250) NULL,
	[FuelCapacity] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CarTitle] [nvarchar](250) NULL,
	[CarHistory] [nvarchar](250) NULL,
	[CarMileage] [nvarchar](250) NULL,
	[Remark] [nvarchar](250) NULL,
	[Action] [nvarchar](10) NULL,
	[Title] [nvarchar](250) NULL,
	[FK_PremiumInspectionId] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistoryAndRecordsImage]    Script Date: 08-11-2024 10.33.51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoryAndRecordsImage](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FK_HistoryAndRecordId] [bigint] NULL,
	[Image] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InspectionAutoscoreInspected]    Script Date: 08-11-2024 10.33.51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InspectionAutoscoreInspected](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[AutoscoreInspected] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[FK_PremiumInspectionId] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InspectionCarPhoto]    Script Date: 08-11-2024 10.33.51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InspectionCarPhoto](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CarPhoto] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[FK_PremiumInspectionId] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InspectionListMaster]    Script Date: 08-11-2024 10.33.51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InspectionListMaster](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[InspectionName] [varchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[IsActive] [bit] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_InspectionListMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PowerTrain]    Script Date: 08-11-2024 10.33.51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PowerTrain](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NULL,
	[Remark] [nvarchar](max) NULL,
	[Action] [nvarchar](10) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[FK_PremiumInspectionId] [bigint] NULL,
	[Image] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PowerTrainImage]    Script Date: 08-11-2024 10.33.51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PowerTrainImage](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FK_PowerTrainId] [bigint] NULL,
	[Image] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PowerTrainListMaster ]    Script Date: 08-11-2024 10.33.51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PowerTrainListMaster ](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[PowerTrain] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PremiumInspection]    Script Date: 08-11-2024 10.33.51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PremiumInspection](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CarName] [nvarchar](250) NULL,
	[ReportDate] [datetime] NULL,
	[Package] [nvarchar](250) NULL,
	[CarMake] [nvarchar](250) NULL,
	[CarModel] [nvarchar](250) NULL,
	[ProductionYear] [nvarchar](100) NULL,
	[EngineCapacity] [nvarchar](250) NULL,
	[CurrentMileage] [nvarchar](250) NULL,
	[LicensePlateNumber] [nvarchar](250) NULL,
	[EngineType] [nvarchar](250) NULL,
	[CarColor] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Mobile] [nvarchar](20) NULL,
	[ReportNumber] [nvarchar](20) NULL,
	[VINNumber] [nvarchar](20) NULL,
	[CustomerName] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PremiumInspectionImage]    Script Date: 08-11-2024 10.33.51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PremiumInspectionImage](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UploadFile] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[FK_PremiumInspectionId] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PremiumInspectionMaster]    Script Date: 08-11-2024 10.33.51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PremiumInspectionMaster](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UploadFile] [nvarchar](max) NULL,
	[CarName] [nvarchar](250) NULL,
	[ReportDate] [datetime] NULL,
	[Package] [nvarchar](250) NULL,
	[CarMake] [nvarchar](250) NULL,
	[CarModel] [nvarchar](250) NULL,
	[ProductionYear] [nvarchar](100) NULL,
	[EngineCapacity] [nvarchar](250) NULL,
	[CurrentMileage] [nvarchar](250) NULL,
	[LicensePlateNumber] [nvarchar](250) NULL,
	[EngineType] [nvarchar](250) NULL,
	[CarColor] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_PremiumInspectionMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductionYearMaster]    Script Date: 08-11-2024 10.33.51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductionYearMaster](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductionYear] [nvarchar](200) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[IsActive] [bit] NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoadTest]    Script Date: 08-11-2024 10.33.51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoadTest](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NULL,
	[Image] [nvarchar](max) NULL,
	[Remark] [nvarchar](max) NULL,
	[Action] [nvarchar](10) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[FK_PremiumInspectionId] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoadTestListMaster]    Script Date: 08-11-2024 10.33.51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoadTestListMaster](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[RoadTest] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SteeringSystem]    Script Date: 08-11-2024 10.33.51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SteeringSystem](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NULL,
	[Image] [nvarchar](max) NULL,
	[Remark] [nvarchar](max) NULL,
	[Action] [nvarchar](10) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[FK_PremiumInspectionId] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SteeringSystemListMaster]    Script Date: 08-11-2024 10.33.51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SteeringSystemListMaster](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SteeringSystem] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ACAndEngineCoolingListMaster] ON 

INSERT [dbo].[ACAndEngineCoolingListMaster] ([Id], [AcAndEngineCooling], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (1, N'Cooling', CAST(N'2024-08-30T03:23:25.757' AS DateTime), 1, 1, 0)
INSERT [dbo].[ACAndEngineCoolingListMaster] ([Id], [AcAndEngineCooling], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (2, N'Heating', CAST(N'2024-08-30T03:23:37.933' AS DateTime), 1, 1, 0)
INSERT [dbo].[ACAndEngineCoolingListMaster] ([Id], [AcAndEngineCooling], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (3, N'Directions', CAST(N'2024-08-30T03:23:48.527' AS DateTime), 1, 1, 0)
INSERT [dbo].[ACAndEngineCoolingListMaster] ([Id], [AcAndEngineCooling], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (4, N'AC System Leak Test', CAST(N'2024-08-30T03:23:59.137' AS DateTime), 1, 1, 0)
INSERT [dbo].[ACAndEngineCoolingListMaster] ([Id], [AcAndEngineCooling], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (5, N'Engine Cooling System Check', CAST(N'2024-08-30T03:24:11.587' AS DateTime), 1, 1, 0)
INSERT [dbo].[ACAndEngineCoolingListMaster] ([Id], [AcAndEngineCooling], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (6, N'Engine Cooling Leak Test', CAST(N'2024-08-30T03:24:25.250' AS DateTime), 1, 1, 0)
INSERT [dbo].[ACAndEngineCoolingListMaster] ([Id], [AcAndEngineCooling], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (7, N'Radiator Fan Operational Test', CAST(N'2024-08-30T03:24:36.460' AS DateTime), 1, 1, 0)
INSERT [dbo].[ACAndEngineCoolingListMaster] ([Id], [AcAndEngineCooling], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (8, N'Ac And Engine Cooling Testing000000', CAST(N'2024-10-24T16:31:49.707' AS DateTime), 1, 1, 1)
INSERT [dbo].[ACAndEngineCoolingListMaster] ([Id], [AcAndEngineCooling], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (9, N'Ac And', CAST(N'2024-10-24T16:35:44.360' AS DateTime), 1, 1, 1)
SET IDENTITY_INSERT [dbo].[ACAndEngineCoolingListMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[AllNotes] ON 

INSERT [dbo].[AllNotes] ([Id], [ImportantNotes], [WearAndTear], [OtherNotes], [CreatedDate], [CreatedBy], [IsActive], [FK_PremiumInspectionId]) VALUES (1, N'NA', N'NA', N'NA', CAST(N'2024-10-24T10:54:43.273' AS DateTime), 1, 1, 3)
SET IDENTITY_INSERT [dbo].[AllNotes] OFF
GO
SET IDENTITY_INSERT [dbo].[BrakingAndSafetyListMaster] ON 

INSERT [dbo].[BrakingAndSafetyListMaster] ([Id], [BrakingAndSafety], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (1, N'SRS Component', CAST(N'2024-08-30T02:31:10.587' AS DateTime), 1, 1, 0)
INSERT [dbo].[BrakingAndSafetyListMaster] ([Id], [BrakingAndSafety], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (2, N'Front Right', CAST(N'2024-08-30T02:31:44.050' AS DateTime), 1, 1, 0)
INSERT [dbo].[BrakingAndSafetyListMaster] ([Id], [BrakingAndSafety], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (3, N'Front Left', CAST(N'2024-08-30T02:32:10.970' AS DateTime), 1, 1, 0)
INSERT [dbo].[BrakingAndSafetyListMaster] ([Id], [BrakingAndSafety], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (4, N'Rear Right', CAST(N'2024-08-30T02:32:29.220' AS DateTime), 1, 1, 0)
INSERT [dbo].[BrakingAndSafetyListMaster] ([Id], [BrakingAndSafety], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (5, N'Rear Left', CAST(N'2024-08-30T02:32:45.517' AS DateTime), 1, 1, 0)
INSERT [dbo].[BrakingAndSafetyListMaster] ([Id], [BrakingAndSafety], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (6, N'Front Tread Depth', CAST(N'2024-08-30T02:33:01.267' AS DateTime), 1, 1, 0)
INSERT [dbo].[BrakingAndSafetyListMaster] ([Id], [BrakingAndSafety], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (7, N'Rear Tread Depth', CAST(N'2024-08-30T02:33:22.150' AS DateTime), 1, 1, 0)
INSERT [dbo].[BrakingAndSafetyListMaster] ([Id], [BrakingAndSafety], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (8, N'Age less than 4 years', CAST(N'2024-08-30T02:33:37.437' AS DateTime), 1, 1, 0)
INSERT [dbo].[BrakingAndSafetyListMaster] ([Id], [BrakingAndSafety], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (9, N'Wheel nuts', CAST(N'2024-08-30T02:33:50.183' AS DateTime), 1, 1, 0)
INSERT [dbo].[BrakingAndSafetyListMaster] ([Id], [BrakingAndSafety], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (10, N'ABS and Skid Systems', CAST(N'2024-08-30T02:34:04.270' AS DateTime), 1, 1, 0)
INSERT [dbo].[BrakingAndSafetyListMaster] ([Id], [BrakingAndSafety], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (11, N'Front Right Seat Belt', CAST(N'2024-08-30T02:34:15.710' AS DateTime), 1, 1, 0)
INSERT [dbo].[BrakingAndSafetyListMaster] ([Id], [BrakingAndSafety], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (12, N'Front Left Seat Belt', CAST(N'2024-08-30T02:34:27.703' AS DateTime), 1, 1, 0)
INSERT [dbo].[BrakingAndSafetyListMaster] ([Id], [BrakingAndSafety], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (13, N'Rear Right Seat Belt', CAST(N'2024-08-30T02:34:43.037' AS DateTime), 1, 1, 0)
INSERT [dbo].[BrakingAndSafetyListMaster] ([Id], [BrakingAndSafety], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (14, N'Rear Left Seat Belt', CAST(N'2024-08-30T02:34:54.190' AS DateTime), 1, 1, 0)
INSERT [dbo].[BrakingAndSafetyListMaster] ([Id], [BrakingAndSafety], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (15, N'Braking And Safety TestingKUmarrr', CAST(N'2024-10-22T13:13:40.097' AS DateTime), 1, 1, 1)
INSERT [dbo].[BrakingAndSafetyListMaster] ([Id], [BrakingAndSafety], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (16, N'fstrte', CAST(N'2024-10-22T13:48:28.317' AS DateTime), 1, 1, 1)
SET IDENTITY_INSERT [dbo].[BrakingAndSafetyListMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[CarMaster] ON 

INSERT [dbo].[CarMaster] ([Id], [Company], [CarName], [ModelNumber], [EngeenType], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (1, N'Mercedes-Benz Group', N'Mercedes-Benz', N'S-Class', N'Petrol engines', CAST(N'2024-08-28T17:02:17.507' AS DateTime), 1, 1, NULL)
INSERT [dbo].[CarMaster] ([Id], [Company], [CarName], [ModelNumber], [EngeenType], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (2, N'Bayerische Motoren Werke GmbH', N'BMW', N'F-Class', N'Petrol engines', CAST(N'2024-08-28T17:02:59.983' AS DateTime), 1, 1, NULL)
INSERT [dbo].[CarMaster] ([Id], [Company], [CarName], [ModelNumber], [EngeenType], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (3, N'Maruti Suzuki', N'Maruti Suzuki Baleno', N'Delta AMT', N'Petrol engines', CAST(N'2024-09-03T17:21:57.783' AS DateTime), 1, 1, NULL)
INSERT [dbo].[CarMaster] ([Id], [Company], [CarName], [ModelNumber], [EngeenType], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (4, N'TATA', N' Tata Curvv EV', N' Safari', N'Petrol engines', CAST(N'2024-09-03T17:40:29.550' AS DateTime), 1, 1, NULL)
INSERT [dbo].[CarMaster] ([Id], [Company], [CarName], [ModelNumber], [EngeenType], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (5, N'Kia company', N'Kia', N'Kia Seltos', N'Petrol engines', CAST(N'2024-09-03T17:46:52.613' AS DateTime), 1, 1, NULL)
INSERT [dbo].[CarMaster] ([Id], [Company], [CarName], [ModelNumber], [EngeenType], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (21, N'BMW Company22', N'BMW22', N'123BM22', N'Desal Engine22', CAST(N'2024-10-21T18:44:09.213' AS DateTime), 1, 1, 1)
INSERT [dbo].[CarMaster] ([Id], [Company], [CarName], [ModelNumber], [EngeenType], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (22, N'BMW Company999999999999', N'BMW33', N'123BM33', N'Desal Engine33', CAST(N'2024-10-21T18:57:22.687' AS DateTime), 1, 1, 1)
INSERT [dbo].[CarMaster] ([Id], [Company], [CarName], [ModelNumber], [EngeenType], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (23, N'BMW Company55TestingUpdate', N'BMW55Update', N'123BM55Update', N'Petrol Engine55Update', CAST(N'2024-10-21T19:02:12.353' AS DateTime), 1, 1, 1)
INSERT [dbo].[CarMaster] ([Id], [Company], [CarName], [ModelNumber], [EngeenType], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (24, N'SADASATestinggggggg', N'DFSFSFSRWRTestinggggggg', N'34535353Testinggggggg', N'0000000', CAST(N'2024-10-22T10:42:23.483' AS DateTime), 1, 1, 1)
INSERT [dbo].[CarMaster] ([Id], [Company], [CarName], [ModelNumber], [EngeenType], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (25, N'adasdasrrrrr', N'sadadad', N'asdadas', N'adadad', CAST(N'2024-10-22T11:59:58.093' AS DateTime), 1, 1, 1)
INSERT [dbo].[CarMaster] ([Id], [Company], [CarName], [ModelNumber], [EngeenType], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (26, N'sdasdsssssssss', N'sadadafas', N'safafafsaf', N'afssafafafddddddd', CAST(N'2024-10-22T12:08:46.727' AS DateTime), 1, 1, 1)
INSERT [dbo].[CarMaster] ([Id], [Company], [CarName], [ModelNumber], [EngeenType], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (27, N'BMW Company22', N'BMW22', N'123BM22', N'Petrol Engine', CAST(N'2024-10-22T12:31:46.677' AS DateTime), 1, 1, 1)
INSERT [dbo].[CarMaster] ([Id], [Company], [CarName], [ModelNumber], [EngeenType], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (28, N'BMWKumarrrr', N'BMW22', N'123BM22', N'Desal Engine22', CAST(N'2024-10-22T12:45:01.367' AS DateTime), 1111, 1, 1)
SET IDENTITY_INSERT [dbo].[CarMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[CarOptionListMaster] ON 

INSERT [dbo].[CarOptionListMaster] ([Id], [CarOption], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (1, N'Full electric seat adjustment', CAST(N'2024-08-30T01:16:56.627' AS DateTime), 1, 1, 0)
INSERT [dbo].[CarOptionListMaster] ([Id], [CarOption], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (2, N'Leather seats ', CAST(N'2024-08-30T01:17:15.407' AS DateTime), 1, 1, 0)
INSERT [dbo].[CarOptionListMaster] ([Id], [CarOption], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (3, N' Screen  ', CAST(N'2024-08-30T01:17:40.040' AS DateTime), 1, 1, 0)
INSERT [dbo].[CarOptionListMaster] ([Id], [CarOption], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (4, N'Distance \ Distronic warning ', CAST(N'2024-08-30T01:17:56.987' AS DateTime), 1, 1, 0)
INSERT [dbo].[CarOptionListMaster] ([Id], [CarOption], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (5, N' High-beam assistant ', CAST(N'2024-08-30T01:18:10.687' AS DateTime), 1, 1, 0)
INSERT [dbo].[CarOptionListMaster] ([Id], [CarOption], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (6, N' Tire pressure monitoring  ', CAST(N'2024-08-30T01:18:25.010' AS DateTime), 1, 1, 0)
INSERT [dbo].[CarOptionListMaster] ([Id], [CarOption], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (7, N' Keyless entry ', CAST(N'2024-08-30T01:18:37.827' AS DateTime), 1, 1, 0)
INSERT [dbo].[CarOptionListMaster] ([Id], [CarOption], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (8, N' Lane departure ', CAST(N'2024-08-30T01:18:51.653' AS DateTime), 1, 1, 0)
INSERT [dbo].[CarOptionListMaster] ([Id], [CarOption], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (9, N'  Blind spot assist  ', CAST(N'2024-08-30T01:19:03.830' AS DateTime), 1, 1, 0)
INSERT [dbo].[CarOptionListMaster] ([Id], [CarOption], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (10, N'  Xenon lights  ', CAST(N'2024-08-30T01:19:24.937' AS DateTime), 1, 1, 0)
INSERT [dbo].[CarOptionListMaster] ([Id], [CarOption], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (11, N' LED headlights  ', CAST(N'2024-08-30T01:19:49.757' AS DateTime), 1, 1, 0)
INSERT [dbo].[CarOptionListMaster] ([Id], [CarOption], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (12, N' Parking sensors ', CAST(N'2024-08-30T01:20:01.150' AS DateTime), 1, 1, 0)
INSERT [dbo].[CarOptionListMaster] ([Id], [CarOption], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (13, N' Rear Camera  ', CAST(N'2024-08-30T01:20:14.013' AS DateTime), 1, 1, 0)
INSERT [dbo].[CarOptionListMaster] ([Id], [CarOption], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (14, N'  Sunroof  ', CAST(N'2024-08-30T01:20:25.543' AS DateTime), 1, 1, 0)
INSERT [dbo].[CarOptionListMaster] ([Id], [CarOption], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (15, N'Testing Car Option', CAST(N'2024-10-22T15:54:10.923' AS DateTime), 1, 1, 1)
INSERT [dbo].[CarOptionListMaster] ([Id], [CarOption], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (16, N'uuuuuuuuuuuuuu', CAST(N'2024-10-22T17:41:52.033' AS DateTime), 1, 1, 1)
SET IDENTITY_INSERT [dbo].[CarOptionListMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[CarOptions] ON 

INSERT [dbo].[CarOptions] ([Id], [FK_PremiumInspectionId], [FK_CarOptionMasterId], [CreatedDate], [CreatedBy], [IsDeleted]) VALUES (1, 1, 2, CAST(N'2024-10-22T15:27:49.617' AS DateTime), 1, 0)
INSERT [dbo].[CarOptions] ([Id], [FK_PremiumInspectionId], [FK_CarOptionMasterId], [CreatedDate], [CreatedBy], [IsDeleted]) VALUES (2, 1, 7, CAST(N'2024-10-22T15:27:49.617' AS DateTime), 1, 0)
INSERT [dbo].[CarOptions] ([Id], [FK_PremiumInspectionId], [FK_CarOptionMasterId], [CreatedDate], [CreatedBy], [IsDeleted]) VALUES (3, 1, 12, CAST(N'2024-10-22T15:27:49.617' AS DateTime), 1, 0)
INSERT [dbo].[CarOptions] ([Id], [FK_PremiumInspectionId], [FK_CarOptionMasterId], [CreatedDate], [CreatedBy], [IsDeleted]) VALUES (4, 2, 2, CAST(N'2024-10-22T18:48:18.467' AS DateTime), 1, 0)
INSERT [dbo].[CarOptions] ([Id], [FK_PremiumInspectionId], [FK_CarOptionMasterId], [CreatedDate], [CreatedBy], [IsDeleted]) VALUES (5, 2, 3, CAST(N'2024-10-22T18:48:18.470' AS DateTime), 1, 0)
INSERT [dbo].[CarOptions] ([Id], [FK_PremiumInspectionId], [FK_CarOptionMasterId], [CreatedDate], [CreatedBy], [IsDeleted]) VALUES (6, 2, 6, CAST(N'2024-10-22T18:48:18.470' AS DateTime), 1, 0)
INSERT [dbo].[CarOptions] ([Id], [FK_PremiumInspectionId], [FK_CarOptionMasterId], [CreatedDate], [CreatedBy], [IsDeleted]) VALUES (7, 2, 7, CAST(N'2024-10-22T18:48:18.470' AS DateTime), 1, 0)
INSERT [dbo].[CarOptions] ([Id], [FK_PremiumInspectionId], [FK_CarOptionMasterId], [CreatedDate], [CreatedBy], [IsDeleted]) VALUES (8, 2, 14, CAST(N'2024-10-22T18:48:18.470' AS DateTime), 1, 0)
INSERT [dbo].[CarOptions] ([Id], [FK_PremiumInspectionId], [FK_CarOptionMasterId], [CreatedDate], [CreatedBy], [IsDeleted]) VALUES (9, 2, 15, CAST(N'2024-10-22T18:48:18.470' AS DateTime), 1, 0)
INSERT [dbo].[CarOptions] ([Id], [FK_PremiumInspectionId], [FK_CarOptionMasterId], [CreatedDate], [CreatedBy], [IsDeleted]) VALUES (10, 2, 16, CAST(N'2024-10-22T18:48:18.470' AS DateTime), 1, 0)
INSERT [dbo].[CarOptions] ([Id], [FK_PremiumInspectionId], [FK_CarOptionMasterId], [CreatedDate], [CreatedBy], [IsDeleted]) VALUES (11, 3, 2, CAST(N'2024-10-24T10:50:23.730' AS DateTime), 1, 0)
INSERT [dbo].[CarOptions] ([Id], [FK_PremiumInspectionId], [FK_CarOptionMasterId], [CreatedDate], [CreatedBy], [IsDeleted]) VALUES (12, 3, 16, CAST(N'2024-10-24T10:50:23.730' AS DateTime), 1, 0)
INSERT [dbo].[CarOptions] ([Id], [FK_PremiumInspectionId], [FK_CarOptionMasterId], [CreatedDate], [CreatedBy], [IsDeleted]) VALUES (13, 3, 15, CAST(N'2024-10-24T10:50:23.730' AS DateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[CarOptions] OFF
GO
SET IDENTITY_INSERT [dbo].[ChassisCondition] ON 

INSERT [dbo].[ChassisCondition] ([Id], [Title], [Image], [Remark], [Action], [CreatedDate], [CreatedBy], [IsActive], [FK_PremiumInspectionId]) VALUES (1, N'Upper Frame', N'/Images/ChassisConditionFile/22454279-4540-494b-9f6b-87c0627014b9.jpg', N'Upper Frame', N'No', CAST(N'2024-10-22T15:28:38.990' AS DateTime), 1, 1, 1)
SET IDENTITY_INSERT [dbo].[ChassisCondition] OFF
GO
SET IDENTITY_INSERT [dbo].[ChassisConditionListMaster] ON 

INSERT [dbo].[ChassisConditionListMaster] ([Id], [ChassisCondition], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (1, N'Front Right Chassis Dimensions', CAST(N'2024-08-30T02:54:16.173' AS DateTime), 1, 1, 0)
INSERT [dbo].[ChassisConditionListMaster] ([Id], [ChassisCondition], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (2, N'Front Left Chassis Dimensions', CAST(N'2024-08-30T02:54:45.293' AS DateTime), 1, 1, 0)
INSERT [dbo].[ChassisConditionListMaster] ([Id], [ChassisCondition], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (3, N'Rear Right Chassis Dimensions', CAST(N'2024-08-30T02:54:57.907' AS DateTime), 1, 1, 0)
INSERT [dbo].[ChassisConditionListMaster] ([Id], [ChassisCondition], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (4, N'Rear Left Chassis Dimensions', CAST(N'2024-08-30T02:55:09.397' AS DateTime), 1, 1, 0)
INSERT [dbo].[ChassisConditionListMaster] ([Id], [ChassisCondition], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (5, N'Front Frame', CAST(N'2024-08-30T02:55:20.060' AS DateTime), 1, 1, 0)
INSERT [dbo].[ChassisConditionListMaster] ([Id], [ChassisCondition], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (6, N'Rear Frame', CAST(N'2024-08-30T02:55:30.273' AS DateTime), 1, 1, 0)
INSERT [dbo].[ChassisConditionListMaster] ([Id], [ChassisCondition], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (7, N'Lower Frame', CAST(N'2024-08-30T02:55:42.420' AS DateTime), 1, 1, 0)
INSERT [dbo].[ChassisConditionListMaster] ([Id], [ChassisCondition], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (8, N'Upper Frame', CAST(N'2024-08-30T02:55:53.463' AS DateTime), 1, 1, 0)
INSERT [dbo].[ChassisConditionListMaster] ([Id], [ChassisCondition], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (9, N'Right Side Frame', CAST(N'2024-08-30T02:56:06.310' AS DateTime), 1, 1, 0)
INSERT [dbo].[ChassisConditionListMaster] ([Id], [ChassisCondition], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (10, N'Left Side Frame', CAST(N'2024-08-30T02:56:18.727' AS DateTime), 1, 1, 0)
INSERT [dbo].[ChassisConditionListMaster] ([Id], [ChassisCondition], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (11, N'Rust Existence', CAST(N'2024-08-30T02:56:32.993' AS DateTime), 1, 1, 0)
INSERT [dbo].[ChassisConditionListMaster] ([Id], [ChassisCondition], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (12, N'Chassis Condition Testing', CAST(N'2024-10-22T18:27:44.140' AS DateTime), 1, 1, 1)
INSERT [dbo].[ChassisConditionListMaster] ([Id], [ChassisCondition], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (13, N'dsfsfTestinggggg', CAST(N'2024-10-22T18:34:15.173' AS DateTime), 1, 1, 1)
SET IDENTITY_INSERT [dbo].[ChassisConditionListMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[CountryMasterNew] ON 

INSERT [dbo].[CountryMasterNew] ([Id], [CountryName], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (1, N'India', CAST(N'2024-08-28T18:30:56.090' AS DateTime), 1, 1, 0)
INSERT [dbo].[CountryMasterNew] ([Id], [CountryName], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (2, N'America', CAST(N'2024-08-28T18:31:13.257' AS DateTime), 1, 1, 0)
INSERT [dbo].[CountryMasterNew] ([Id], [CountryName], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (3, N'Mumbai For Testing', CAST(N'2024-10-23T11:26:57.163' AS DateTime), 1, 1, 1)
INSERT [dbo].[CountryMasterNew] ([Id], [CountryName], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (4, N'Austrailiyatttttttttttt', CAST(N'2024-10-23T11:48:08.020' AS DateTime), 1, 1, 1)
SET IDENTITY_INSERT [dbo].[CountryMasterNew] OFF
GO
SET IDENTITY_INSERT [dbo].[ElectricalSystemsListMaster] ON 

INSERT [dbo].[ElectricalSystemsListMaster] ([Id], [ElectricalSystems], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (1, N'Front Right Light', CAST(N'2024-08-30T02:11:54.493' AS DateTime), 1, 1, 0)
INSERT [dbo].[ElectricalSystemsListMaster] ([Id], [ElectricalSystems], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (2, N'Front Left Light', CAST(N'2024-08-30T02:12:17.200' AS DateTime), 1, 1, 0)
INSERT [dbo].[ElectricalSystemsListMaster] ([Id], [ElectricalSystems], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (3, N'Rear Right Light', CAST(N'2024-08-30T02:12:30.887' AS DateTime), 1, 1, 0)
INSERT [dbo].[ElectricalSystemsListMaster] ([Id], [ElectricalSystems], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (4, N'Rear Left Light', CAST(N'2024-08-30T02:12:42.280' AS DateTime), 1, 1, 0)
INSERT [dbo].[ElectricalSystemsListMaster] ([Id], [ElectricalSystems], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (5, N'12 Volt Battery', CAST(N'2024-08-30T02:12:57.040' AS DateTime), 1, 1, 0)
INSERT [dbo].[ElectricalSystemsListMaster] ([Id], [ElectricalSystems], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (6, N'12 Volt Battery Charge', CAST(N'2024-08-30T02:13:10.297' AS DateTime), 1, 1, 0)
INSERT [dbo].[ElectricalSystemsListMaster] ([Id], [ElectricalSystems], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (7, N'Radio \ Screen', CAST(N'2024-08-30T02:13:26.647' AS DateTime), 1, 1, 0)
INSERT [dbo].[ElectricalSystemsListMaster] ([Id], [ElectricalSystems], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (8, N'Speakers', CAST(N'2024-08-30T02:13:38.830' AS DateTime), 1, 1, 0)
INSERT [dbo].[ElectricalSystemsListMaster] ([Id], [ElectricalSystems], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (9, N'Horn', CAST(N'2024-08-30T02:13:50.260' AS DateTime), 1, 1, 0)
INSERT [dbo].[ElectricalSystemsListMaster] ([Id], [ElectricalSystems], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (10, N'Front Wipers', CAST(N'2024-08-30T02:14:03.603' AS DateTime), 1, 1, 0)
INSERT [dbo].[ElectricalSystemsListMaster] ([Id], [ElectricalSystems], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (11, N'Rear Wiper', CAST(N'2024-08-30T02:14:15.447' AS DateTime), 1, 1, 0)
INSERT [dbo].[ElectricalSystemsListMaster] ([Id], [ElectricalSystems], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (12, N'Internal Lighting System', CAST(N'2024-08-30T02:14:27.207' AS DateTime), 1, 1, 0)
INSERT [dbo].[ElectricalSystemsListMaster] ([Id], [ElectricalSystems], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (13, N'Sun Roof \ Panorama', CAST(N'2024-08-30T02:14:38.183' AS DateTime), 1, 1, 0)
INSERT [dbo].[ElectricalSystemsListMaster] ([Id], [ElectricalSystems], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (14, N'Power Windows', CAST(N'2024-08-30T02:14:48.217' AS DateTime), 1, 1, 0)
INSERT [dbo].[ElectricalSystemsListMaster] ([Id], [ElectricalSystems], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (15, N'Power Seats', CAST(N'2024-08-30T02:14:58.630' AS DateTime), 1, 1, 0)
INSERT [dbo].[ElectricalSystemsListMaster] ([Id], [ElectricalSystems], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (16, N'Remote Key Control', CAST(N'2024-08-30T02:15:10.263' AS DateTime), 1, 1, 0)
INSERT [dbo].[ElectricalSystemsListMaster] ([Id], [ElectricalSystems], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (17, N'Right Mirror', CAST(N'2024-08-30T02:15:20.250' AS DateTime), 1, 1, 0)
INSERT [dbo].[ElectricalSystemsListMaster] ([Id], [ElectricalSystems], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (18, N'Left Mirror', CAST(N'2024-08-30T02:15:32.310' AS DateTime), 1, 1, 0)
INSERT [dbo].[ElectricalSystemsListMaster] ([Id], [ElectricalSystems], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (19, N'Rear Window Defrost', CAST(N'2024-08-30T02:15:43.820' AS DateTime), 1, 1, 0)
INSERT [dbo].[ElectricalSystemsListMaster] ([Id], [ElectricalSystems], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (20, N'For Testing', CAST(N'2024-10-23T12:33:59.080' AS DateTime), 1, 1, 1)
INSERT [dbo].[ElectricalSystemsListMaster] ([Id], [ElectricalSystems], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (21, N'For Test', CAST(N'2024-10-23T12:34:36.380' AS DateTime), 1, 1, 1)
INSERT [dbo].[ElectricalSystemsListMaster] ([Id], [ElectricalSystems], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (22, N'Testing55', CAST(N'2024-10-23T12:44:39.050' AS DateTime), 1, 1, 1)
SET IDENTITY_INSERT [dbo].[ElectricalSystemsListMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[Exterior] ON 

INSERT [dbo].[Exterior] ([Id], [Title], [Image], [Remark], [Action], [CreatedDate], [CreatedBy], [IsActive], [FK_PremiumInspectionId]) VALUES (1, N'Door Rubber', N'/Images/ExteriorFile/5d251786-43fb-49da-9037-67e960981f53.jpg', N'Door Rubber', N'No', CAST(N'2024-10-22T15:28:16.043' AS DateTime), 1, 1, 1)
INSERT [dbo].[Exterior] ([Id], [Title], [Image], [Remark], [Action], [CreatedDate], [CreatedBy], [IsActive], [FK_PremiumInspectionId]) VALUES (2, N'Hood', NULL, N'Hood ', N'Yes', CAST(N'2024-10-24T10:50:43.340' AS DateTime), 1, 1, 3)
SET IDENTITY_INSERT [dbo].[Exterior] OFF
GO
SET IDENTITY_INSERT [dbo].[ExteriorListMaster] ON 

INSERT [dbo].[ExteriorListMaster] ([Id], [Exterior], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (1, N'  Front Bumper  ', CAST(N'2024-08-30T01:38:44.230' AS DateTime), 1, 1, 0)
INSERT [dbo].[ExteriorListMaster] ([Id], [Exterior], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (2, N'Front Right Fender  ', CAST(N'2024-08-30T01:39:40.300' AS DateTime), 1, 1, 0)
INSERT [dbo].[ExteriorListMaster] ([Id], [Exterior], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (3, N'Rear left fender  ', CAST(N'2024-08-30T01:39:56.807' AS DateTime), 1, 1, 0)
INSERT [dbo].[ExteriorListMaster] ([Id], [Exterior], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (4, N'Front right door  ', CAST(N'2024-08-30T01:40:09.317' AS DateTime), 1, 1, 0)
INSERT [dbo].[ExteriorListMaster] ([Id], [Exterior], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (5, N'Rear left door ', CAST(N'2024-08-30T01:40:21.060' AS DateTime), 1, 1, 0)
INSERT [dbo].[ExteriorListMaster] ([Id], [Exterior], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (6, N'Hood', CAST(N'2024-08-30T01:40:32.153' AS DateTime), 1, 1, 0)
INSERT [dbo].[ExteriorListMaster] ([Id], [Exterior], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (7, N'Tail Gate', CAST(N'2024-08-30T01:40:43.520' AS DateTime), 1, 1, 0)
INSERT [dbo].[ExteriorListMaster] ([Id], [Exterior], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (8, N'Rear Windshield', CAST(N'2024-08-30T01:40:54.760' AS DateTime), 1, 1, 0)
INSERT [dbo].[ExteriorListMaster] ([Id], [Exterior], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (9, N'Left Mirror', CAST(N'2024-08-30T01:41:06.270' AS DateTime), 1, 1, 0)
INSERT [dbo].[ExteriorListMaster] ([Id], [Exterior], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (10, N'Door Rubber', CAST(N'2024-08-30T01:41:16.803' AS DateTime), 1, 1, 0)
INSERT [dbo].[ExteriorListMaster] ([Id], [Exterior], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (11, N'Tire Jack & Tools', CAST(N'2024-08-30T01:41:26.953' AS DateTime), 1, 1, 0)
INSERT [dbo].[ExteriorListMaster] ([Id], [Exterior], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (12, N'Interior Condition', CAST(N'2024-08-30T01:41:40.570' AS DateTime), 1, 1, 0)
INSERT [dbo].[ExteriorListMaster] ([Id], [Exterior], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (13, N'Rear Bumper', CAST(N'2024-08-30T01:42:03.797' AS DateTime), 1, 1, 0)
INSERT [dbo].[ExteriorListMaster] ([Id], [Exterior], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (14, N'Rear right fender', CAST(N'2024-08-30T01:42:15.487' AS DateTime), 1, 1, 0)
INSERT [dbo].[ExteriorListMaster] ([Id], [Exterior], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (15, N'Front left Fender', CAST(N'2024-08-30T01:42:31.160' AS DateTime), 1, 1, 0)
INSERT [dbo].[ExteriorListMaster] ([Id], [Exterior], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (16, N'Rear right door', CAST(N'2024-08-30T01:42:41.960' AS DateTime), 1, 1, 0)
INSERT [dbo].[ExteriorListMaster] ([Id], [Exterior], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (17, N'Front left door', CAST(N'2024-08-30T01:43:42.350' AS DateTime), 1, 1, 0)
INSERT [dbo].[ExteriorListMaster] ([Id], [Exterior], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (18, N'Roof', CAST(N'2024-08-30T01:43:55.643' AS DateTime), 1, 1, 0)
INSERT [dbo].[ExteriorListMaster] ([Id], [Exterior], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (19, N'Front Windshield', CAST(N'2024-08-30T01:44:10.010' AS DateTime), 1, 1, 0)
INSERT [dbo].[ExteriorListMaster] ([Id], [Exterior], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (20, N'Right Mirror', CAST(N'2024-08-30T01:50:39.240' AS DateTime), 1, 1, 0)
INSERT [dbo].[ExteriorListMaster] ([Id], [Exterior], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (21, N'Windshield Rubber', CAST(N'2024-08-30T01:50:53.250' AS DateTime), 1, 1, 0)
INSERT [dbo].[ExteriorListMaster] ([Id], [Exterior], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (22, N'Wrench', CAST(N'2024-08-30T01:51:19.573' AS DateTime), 1, 1, 0)
INSERT [dbo].[ExteriorListMaster] ([Id], [Exterior], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (23, N'Spare Tire', CAST(N'2024-08-30T01:55:45.923' AS DateTime), 1, 1, 0)
INSERT [dbo].[ExteriorListMaster] ([Id], [Exterior], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (24, N'For Testing Again', CAST(N'2024-10-23T13:04:14.277' AS DateTime), 1, 1, 1)
INSERT [dbo].[ExteriorListMaster] ([Id], [Exterior], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (25, N'For Testing4444777777777', CAST(N'2024-10-23T13:15:56.270' AS DateTime), 1, 1, 1)
SET IDENTITY_INSERT [dbo].[ExteriorListMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[HistoryAndRecordListMaster ] ON 

INSERT [dbo].[HistoryAndRecordListMaster ] ([Id], [HistoryAndRecord], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (1, N'Car Title', CAST(N'2024-08-30T08:15:41.967' AS DateTime), 1, 1, 0)
INSERT [dbo].[HistoryAndRecordListMaster ] ([Id], [HistoryAndRecord], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (2, N'Car History', CAST(N'2024-08-30T08:16:00.860' AS DateTime), 1, 1, 0)
INSERT [dbo].[HistoryAndRecordListMaster ] ([Id], [HistoryAndRecord], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (3, N'Car Mileage', CAST(N'2024-08-30T08:16:13.853' AS DateTime), 1, 1, 0)
INSERT [dbo].[HistoryAndRecordListMaster ] ([Id], [HistoryAndRecord], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (4, N'History And Record For Testing00000000000', CAST(N'2024-10-23T13:40:43.837' AS DateTime), 1, 1, 1)
INSERT [dbo].[HistoryAndRecordListMaster ] ([Id], [HistoryAndRecord], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (5, N'History', CAST(N'2024-10-23T13:52:28.407' AS DateTime), 1, 1, 1)
SET IDENTITY_INSERT [dbo].[HistoryAndRecordListMaster ] OFF
GO
SET IDENTITY_INSERT [dbo].[HistoryAndRecords] ON 

INSERT [dbo].[HistoryAndRecords] ([Id], [NoOfLocalAccidents], [TypeOfUseInSide], [EngineChangeInSide], [AirBag], [TypeOfUseOutSide], [CarseerLastMeterReading], [BodyType], [EngineChangeTechnicalSpecs], [OwnershipTransferFee], [Owners], [StandardSeating], [Height], [HighwayMilleage], [YearlyRegistrationFee], [MadeIn], [Engine], [JordanianOwnership], [RegistrationType], [FuelCapacity], [CreatedDate], [CreatedBy], [IsActive], [CarTitle], [CarHistory], [CarMileage], [Remark], [Action], [Title], [FK_PremiumInspectionId]) VALUES (1, N'2', N'N/A', N'N/A', N'N/A', N'N/A', N'22323KM', N'Seadan', N'N/A', N'N/A', N'N/A', N'7', N'165CM', N'20KM', N'4000', N'2', N'N/A', N'N/A', N'Registation Type', N'70LTR', CAST(N'2024-10-22T15:31:07.500' AS DateTime), 1, 1, NULL, NULL, NULL, N'Car Title', N'Yes', N'Car Title', 1)
INSERT [dbo].[HistoryAndRecords] ([Id], [NoOfLocalAccidents], [TypeOfUseInSide], [EngineChangeInSide], [AirBag], [TypeOfUseOutSide], [CarseerLastMeterReading], [BodyType], [EngineChangeTechnicalSpecs], [OwnershipTransferFee], [Owners], [StandardSeating], [Height], [HighwayMilleage], [YearlyRegistrationFee], [MadeIn], [Engine], [JordanianOwnership], [RegistrationType], [FuelCapacity], [CreatedDate], [CreatedBy], [IsActive], [CarTitle], [CarHistory], [CarMileage], [Remark], [Action], [Title], [FK_PremiumInspectionId]) VALUES (2, N'5', N'N/A', N'N/A', N'N/A', N'N/A', N'677km', N'Seadan', N'N/A', N'2000', N'N/A', N'6', N'348cm', N'25km', N'378999', N'2', N'N/A', N'N/A', N'Registation Type', N'55ltr', CAST(N'2024-10-22T18:50:25.550' AS DateTime), 1, 1, NULL, NULL, NULL, N'Car Mileage', N'No', N'Car Mileage', 2)
INSERT [dbo].[HistoryAndRecords] ([Id], [NoOfLocalAccidents], [TypeOfUseInSide], [EngineChangeInSide], [AirBag], [TypeOfUseOutSide], [CarseerLastMeterReading], [BodyType], [EngineChangeTechnicalSpecs], [OwnershipTransferFee], [Owners], [StandardSeating], [Height], [HighwayMilleage], [YearlyRegistrationFee], [MadeIn], [Engine], [JordanianOwnership], [RegistrationType], [FuelCapacity], [CreatedDate], [CreatedBy], [IsActive], [CarTitle], [CarHistory], [CarMileage], [Remark], [Action], [Title], [FK_PremiumInspectionId]) VALUES (3, N'2', N'NA', N'NA', N'NA', N'NA', N'NA', N'Seadan', N'NA', N'NA', N'NA', N'5', N'NA', N'NA', N'NA', N'1', N'NA', N'NA', N'Registation Type', N'55ltr', CAST(N'2024-10-24T10:54:20.533' AS DateTime), 1, 1, NULL, NULL, NULL, N'history', N'No', N'History', 3)
SET IDENTITY_INSERT [dbo].[HistoryAndRecords] OFF
GO
SET IDENTITY_INSERT [dbo].[HistoryAndRecordsImage] ON 

INSERT [dbo].[HistoryAndRecordsImage] ([Id], [FK_HistoryAndRecordId], [Image], [CreatedDate], [CreatedBy], [IsActive]) VALUES (1, 1, N'/Images/HistoryAndRecordsFile/a64cb4ae-030c-4c52-ac6a-d5327af49def.jpg', CAST(N'2024-10-22T15:31:07.507' AS DateTime), 1, 1)
INSERT [dbo].[HistoryAndRecordsImage] ([Id], [FK_HistoryAndRecordId], [Image], [CreatedDate], [CreatedBy], [IsActive]) VALUES (2, 2, N'/Images/HistoryAndRecordsFile/410fc44d-785e-4b64-bd8c-c0250fc0f109.jpg', CAST(N'2024-10-22T18:50:25.553' AS DateTime), 1, 1)
INSERT [dbo].[HistoryAndRecordsImage] ([Id], [FK_HistoryAndRecordId], [Image], [CreatedDate], [CreatedBy], [IsActive]) VALUES (3, 3, N'/Images/HistoryAndRecordsFile/b92f1c16-7c24-45cc-9b1f-fddaad6a77a3.jpg', CAST(N'2024-10-24T10:54:20.537' AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[HistoryAndRecordsImage] OFF
GO
SET IDENTITY_INSERT [dbo].[InspectionAutoscoreInspected] ON 

INSERT [dbo].[InspectionAutoscoreInspected] ([Id], [AutoscoreInspected], [CreatedDate], [CreatedBy], [IsActive], [FK_PremiumInspectionId]) VALUES (1, N'/Images/AutoscoreInspected/ed8a89d3-8b8c-479c-bae3-a040303917a4.jpg', CAST(N'2024-10-22T15:33:34.233' AS DateTime), 1, 1, 1)
INSERT [dbo].[InspectionAutoscoreInspected] ([Id], [AutoscoreInspected], [CreatedDate], [CreatedBy], [IsActive], [FK_PremiumInspectionId]) VALUES (2, N'/Images/AutoscoreInspected/4e83746d-ff54-4c27-bb81-eb935c42e23d.jpg', CAST(N'2024-10-22T18:50:55.493' AS DateTime), 1, 1, 2)
INSERT [dbo].[InspectionAutoscoreInspected] ([Id], [AutoscoreInspected], [CreatedDate], [CreatedBy], [IsActive], [FK_PremiumInspectionId]) VALUES (3, N'/Images/AutoscoreInspected/4f5fee71-5b64-4dc7-acbc-6a047c594b55.jpg', CAST(N'2024-10-22T18:50:55.497' AS DateTime), 1, 1, 2)
INSERT [dbo].[InspectionAutoscoreInspected] ([Id], [AutoscoreInspected], [CreatedDate], [CreatedBy], [IsActive], [FK_PremiumInspectionId]) VALUES (4, N'/Images/AutoscoreInspected/b938da7a-4dc5-47a9-b2c1-2066f5d95c80.jpg', CAST(N'2024-10-24T10:54:35.033' AS DateTime), 1, 1, 3)
SET IDENTITY_INSERT [dbo].[InspectionAutoscoreInspected] OFF
GO
SET IDENTITY_INSERT [dbo].[InspectionCarPhoto] ON 

INSERT [dbo].[InspectionCarPhoto] ([Id], [CarPhoto], [CreatedDate], [CreatedBy], [IsActive], [FK_PremiumInspectionId]) VALUES (1, N'/Images/CarPhotos/db230153-04ae-43aa-95f2-e2fbb344e891.jpg', CAST(N'2024-10-22T15:33:34.230' AS DateTime), 1, 1, 1)
INSERT [dbo].[InspectionCarPhoto] ([Id], [CarPhoto], [CreatedDate], [CreatedBy], [IsActive], [FK_PremiumInspectionId]) VALUES (2, N'/Images/CarPhotos/d43af0a2-6a19-4ede-a24f-592544b86edf.jpg', CAST(N'2024-10-22T18:50:55.487' AS DateTime), 1, 1, 2)
INSERT [dbo].[InspectionCarPhoto] ([Id], [CarPhoto], [CreatedDate], [CreatedBy], [IsActive], [FK_PremiumInspectionId]) VALUES (3, N'/Images/CarPhotos/9bf5ac1c-8c72-44e6-8744-dc013cadb3e3.jpg', CAST(N'2024-10-22T18:50:55.490' AS DateTime), 1, 1, 2)
INSERT [dbo].[InspectionCarPhoto] ([Id], [CarPhoto], [CreatedDate], [CreatedBy], [IsActive], [FK_PremiumInspectionId]) VALUES (4, N'/Images/CarPhotos/c48658a9-c3eb-4b32-a898-fbf37976d279.jpg', CAST(N'2024-10-24T10:54:35.030' AS DateTime), 1, 1, 3)
SET IDENTITY_INSERT [dbo].[InspectionCarPhoto] OFF
GO
SET IDENTITY_INSERT [dbo].[InspectionListMaster] ON 

INSERT [dbo].[InspectionListMaster] ([Id], [InspectionName], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (1, N'Premium Inspection
', CAST(N'2024-08-26T13:26:36.970' AS DateTime), 1, 1, 0)
INSERT [dbo].[InspectionListMaster] ([Id], [InspectionName], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (2, N'Exterior 
', CAST(N'2024-08-26T13:26:43.723' AS DateTime), 1, 1, 0)
INSERT [dbo].[InspectionListMaster] ([Id], [InspectionName], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (3, N'Chassis Condition 
', CAST(N'2024-08-26T13:26:50.763' AS DateTime), 1, 1, 0)
INSERT [dbo].[InspectionListMaster] ([Id], [InspectionName], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (4, N'Power-Train ', CAST(N'2024-08-26T13:28:34.200' AS DateTime), 1, 1, 0)
INSERT [dbo].[InspectionListMaster] ([Id], [InspectionName], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (10, N'Steering System', CAST(N'2024-08-26T13:31:54.590' AS DateTime), 1, 1, 0)
INSERT [dbo].[InspectionListMaster] ([Id], [InspectionName], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (11, N'Electrical Systems', CAST(N'2024-08-26T13:32:08.747' AS DateTime), 1, 1, 0)
INSERT [dbo].[InspectionListMaster] ([Id], [InspectionName], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (12, N'Ac & Engine Cooling', CAST(N'2024-08-26T13:32:22.790' AS DateTime), 1, 1, 0)
INSERT [dbo].[InspectionListMaster] ([Id], [InspectionName], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (13, N'Braking Safety', CAST(N'2024-08-26T13:32:35.500' AS DateTime), 1, 1, 0)
INSERT [dbo].[InspectionListMaster] ([Id], [InspectionName], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (14, N'History and Record', CAST(N'2024-08-26T13:32:48.300' AS DateTime), 1, 1, 0)
INSERT [dbo].[InspectionListMaster] ([Id], [InspectionName], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (15, N'Bosch Safety Inspection', CAST(N'2024-08-26T13:33:00.313' AS DateTime), 1, 1, 0)
INSERT [dbo].[InspectionListMaster] ([Id], [InspectionName], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (16, N'Road Test', CAST(N'2024-08-26T13:33:12.990' AS DateTime), 1, 1, 0)
INSERT [dbo].[InspectionListMaster] ([Id], [InspectionName], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (17, N'Inspection Photo', CAST(N'2024-08-26T13:33:29.080' AS DateTime), 1, 1, 0)
INSERT [dbo].[InspectionListMaster] ([Id], [InspectionName], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (18, N'All Notes', CAST(N'2024-08-26T13:33:34.997' AS DateTime), 1, 1, 0)
INSERT [dbo].[InspectionListMaster] ([Id], [InspectionName], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (19, N'Inspection Testing333', CAST(N'2024-10-23T16:55:50.970' AS DateTime), 1, 1, 1)
INSERT [dbo].[InspectionListMaster] ([Id], [InspectionName], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (20, N'Inspection Testing66777', CAST(N'2024-10-23T16:59:14.237' AS DateTime), 1, 1, 1)
SET IDENTITY_INSERT [dbo].[InspectionListMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[PowerTrain] ON 

INSERT [dbo].[PowerTrain] ([Id], [Title], [Remark], [Action], [CreatedDate], [CreatedBy], [IsActive], [FK_PremiumInspectionId], [Image]) VALUES (1, N'Transmission Trouble Codes', N'Transmission Trouble Codes', N'Yes', CAST(N'2024-10-22T15:29:03.613' AS DateTime), 1, 1, 1, NULL)
INSERT [dbo].[PowerTrain] ([Id], [Title], [Remark], [Action], [CreatedDate], [CreatedBy], [IsActive], [FK_PremiumInspectionId], [Image]) VALUES (2, N'Power Train Test111', N'power Train Test1 11', N'No', CAST(N'2024-10-24T10:51:16.537' AS DateTime), 1, 1, 3, NULL)
INSERT [dbo].[PowerTrain] ([Id], [Title], [Remark], [Action], [CreatedDate], [CreatedBy], [IsActive], [FK_PremiumInspectionId], [Image]) VALUES (3, N'Transmission Trouble Codes', N'transmission Trouble codes', N'Yes', CAST(N'2024-10-24T10:52:16.930' AS DateTime), 1, 1, 3, NULL)
SET IDENTITY_INSERT [dbo].[PowerTrain] OFF
GO
SET IDENTITY_INSERT [dbo].[PowerTrainImage] ON 

INSERT [dbo].[PowerTrainImage] ([Id], [FK_PowerTrainId], [Image], [CreatedDate], [CreatedBy], [IsActive]) VALUES (1, 1, N'/Images/PowerTrainFile/058f5064-1d48-4e84-8ec6-ec5ae43195f1.jpg', CAST(N'2024-10-22T15:29:03.620' AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[PowerTrainImage] OFF
GO
SET IDENTITY_INSERT [dbo].[PowerTrainListMaster ] ON 

INSERT [dbo].[PowerTrainListMaster ] ([Id], [PowerTrain], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (1, N'Engine Performance and Efficiency', CAST(N'2024-08-30T08:00:52.730' AS DateTime), 1, 1, 0)
INSERT [dbo].[PowerTrainListMaster ] ([Id], [PowerTrain], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (2, N'Traction Battery', CAST(N'2024-08-30T08:01:22.920' AS DateTime), 1, 1, 0)
INSERT [dbo].[PowerTrainListMaster ] ([Id], [PowerTrain], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (3, N'Fluid Leaks', CAST(N'2024-08-30T08:01:38.087' AS DateTime), 1, 1, 0)
INSERT [dbo].[PowerTrainListMaster ] ([Id], [PowerTrain], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (4, N'Transmission Shifts quality', CAST(N'2024-08-30T08:01:53.820' AS DateTime), 1, 1, 0)
INSERT [dbo].[PowerTrainListMaster ] ([Id], [PowerTrain], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (5, N'Hybrid System', CAST(N'2024-08-30T08:02:07.613' AS DateTime), 1, 1, 0)
INSERT [dbo].[PowerTrainListMaster ] ([Id], [PowerTrain], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (6, N'Engine Trouble Codes', CAST(N'2024-08-30T08:02:20.260' AS DateTime), 1, 1, 0)
INSERT [dbo].[PowerTrainListMaster ] ([Id], [PowerTrain], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (7, N'Transmission Trouble Codes', CAST(N'2024-08-30T08:02:34.283' AS DateTime), 1, 1, 0)
INSERT [dbo].[PowerTrainListMaster ] ([Id], [PowerTrain], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (8, N'Power Train Testing222', CAST(N'2024-10-23T17:44:16.073' AS DateTime), 1, 1, 1)
INSERT [dbo].[PowerTrainListMaster ] ([Id], [PowerTrain], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (9, N'Power Train Test111', CAST(N'2024-10-23T17:47:20.187' AS DateTime), 1, 1, 1)
SET IDENTITY_INSERT [dbo].[PowerTrainListMaster ] OFF
GO
SET IDENTITY_INSERT [dbo].[PremiumInspection] ON 

INSERT [dbo].[PremiumInspection] ([Id], [CarName], [ReportDate], [Package], [CarMake], [CarModel], [ProductionYear], [EngineCapacity], [CurrentMileage], [LicensePlateNumber], [EngineType], [CarColor], [CreatedDate], [CreatedBy], [IsActive], [Mobile], [ReportNumber], [VINNumber], [CustomerName]) VALUES (1, N'Innova Creysta', CAST(N'2024-10-22T00:00:00.000' AS DateTime), N'NA', N'sadadad', N'F-Class', N'1886', N'440CC', N'18KM', N'LN001', N'Desal Engine22', N'Color(0xff1a2755)', CAST(N'2024-10-22T15:27:49.607' AS DateTime), 1, 1, N'7266071666', N'24/Rep/067', N'24/Vin/032', N'Abdullah Abeed')
INSERT [dbo].[PremiumInspection] ([Id], [CarName], [ReportDate], [Package], [CarMake], [CarModel], [ProductionYear], [EngineCapacity], [CurrentMileage], [LicensePlateNumber], [EngineType], [CarColor], [CreatedDate], [CreatedBy], [IsActive], [Mobile], [ReportNumber], [VINNumber], [CustomerName]) VALUES (2, N'Maruti Alto ', CAST(N'2024-10-22T00:00:00.000' AS DateTime), N'Na', N'DFSFSFSRWRTestinggggggg', N'123BM22', N'1880', N'550CC', N'20km', N'LN002', N'Desal Engine22', N'Instance of ''Color''', CAST(N'2024-10-22T18:48:18.460' AS DateTime), 1, 1, N'8653543346', N'24/Rep/029', N'24/Vin/084', N'Muhammad Nabi')
INSERT [dbo].[PremiumInspection] ([Id], [CarName], [ReportDate], [Package], [CarMake], [CarModel], [ProductionYear], [EngineCapacity], [CurrentMileage], [LicensePlateNumber], [EngineType], [CarColor], [CreatedDate], [CreatedBy], [IsActive], [Mobile], [ReportNumber], [VINNumber], [CustomerName]) VALUES (3, N'Hyundai', CAST(N'2024-10-24T00:00:00.000' AS DateTime), N'NA', N'BMW33', N'123BM33', N'1947', N'220CC', N'22KM', N'LN003', N'Desal Engine33', N'Color(0xffa49a87)', CAST(N'2024-10-24T10:50:23.723' AS DateTime), 1, 1, N'2323323232', N'24/Rep/022', N'24/Vin/038', N'Abarar Khan')
INSERT [dbo].[PremiumInspection] ([Id], [CarName], [ReportDate], [Package], [CarMake], [CarModel], [ProductionYear], [EngineCapacity], [CurrentMileage], [LicensePlateNumber], [EngineType], [CarColor], [CreatedDate], [CreatedBy], [IsActive], [Mobile], [ReportNumber], [VINNumber], [CustomerName]) VALUES (4, N'Mercedes Benz', CAST(N'2024-10-16T00:00:00.000' AS DateTime), N'10000', N'CarMake123', N'Model12345', N'1995', N'125', N'100', N'786', N'Pretrol', N'#ffff', CAST(N'2024-10-25T13:42:27.443' AS DateTime), 1, 1, N'9670521218', N'24/Rep/074', N'24/Vin/037', N'Sudhakar Sharma')
INSERT [dbo].[PremiumInspection] ([Id], [CarName], [ReportDate], [Package], [CarMake], [CarModel], [ProductionYear], [EngineCapacity], [CurrentMileage], [LicensePlateNumber], [EngineType], [CarColor], [CreatedDate], [CreatedBy], [IsActive], [Mobile], [ReportNumber], [VINNumber], [CustomerName]) VALUES (5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2024-10-25T13:48:58.323' AS DateTime), 1, 1, NULL, N'24/Rep/07', N'24/Vin/022', NULL)
INSERT [dbo].[PremiumInspection] ([Id], [CarName], [ReportDate], [Package], [CarMake], [CarModel], [ProductionYear], [EngineCapacity], [CurrentMileage], [LicensePlateNumber], [EngineType], [CarColor], [CreatedDate], [CreatedBy], [IsActive], [Mobile], [ReportNumber], [VINNumber], [CustomerName]) VALUES (6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2024-10-25T13:49:44.913' AS DateTime), 1, 1, NULL, N'24/Rep/051', N'24/Vin/055', NULL)
INSERT [dbo].[PremiumInspection] ([Id], [CarName], [ReportDate], [Package], [CarMake], [CarModel], [ProductionYear], [EngineCapacity], [CurrentMileage], [LicensePlateNumber], [EngineType], [CarColor], [CreatedDate], [CreatedBy], [IsActive], [Mobile], [ReportNumber], [VINNumber], [CustomerName]) VALUES (7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2024-10-25T13:51:00.197' AS DateTime), 1, 1, NULL, N'24/Rep/073', N'24/Vin/017', NULL)
INSERT [dbo].[PremiumInspection] ([Id], [CarName], [ReportDate], [Package], [CarMake], [CarModel], [ProductionYear], [EngineCapacity], [CurrentMileage], [LicensePlateNumber], [EngineType], [CarColor], [CreatedDate], [CreatedBy], [IsActive], [Mobile], [ReportNumber], [VINNumber], [CustomerName]) VALUES (8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2024-10-25T13:52:40.333' AS DateTime), 1, 1, NULL, N'24/Rep/092', N'24/Vin/068', NULL)
INSERT [dbo].[PremiumInspection] ([Id], [CarName], [ReportDate], [Package], [CarMake], [CarModel], [ProductionYear], [EngineCapacity], [CurrentMileage], [LicensePlateNumber], [EngineType], [CarColor], [CreatedDate], [CreatedBy], [IsActive], [Mobile], [ReportNumber], [VINNumber], [CustomerName]) VALUES (9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2024-10-25T13:55:43.867' AS DateTime), 1, 1, NULL, N'24/Rep/046', N'24/Vin/093', NULL)
SET IDENTITY_INSERT [dbo].[PremiumInspection] OFF
GO
SET IDENTITY_INSERT [dbo].[PremiumInspectionImage] ON 

INSERT [dbo].[PremiumInspectionImage] ([Id], [UploadFile], [CreatedDate], [CreatedBy], [IsActive], [FK_PremiumInspectionId]) VALUES (1, N'/Images/PremiumInspectionFile/17c1e63a-cf0b-46ac-983f-fc6c8ea23415.jpg', CAST(N'2024-10-22T15:27:49.613' AS DateTime), 1, 1, 1)
INSERT [dbo].[PremiumInspectionImage] ([Id], [UploadFile], [CreatedDate], [CreatedBy], [IsActive], [FK_PremiumInspectionId]) VALUES (2, N'/Images/PremiumInspectionFile/0ed8a2bc-3623-4790-ae33-5ad9d6ce30d7.jpg', CAST(N'2024-10-22T18:48:18.463' AS DateTime), 1, 1, 2)
INSERT [dbo].[PremiumInspectionImage] ([Id], [UploadFile], [CreatedDate], [CreatedBy], [IsActive], [FK_PremiumInspectionId]) VALUES (3, N'/Images/PremiumInspectionFile/cf022898-ea81-4d18-9be1-d9ae0e2e4b9c.jpg', CAST(N'2024-10-24T10:50:23.727' AS DateTime), 1, 1, 3)
INSERT [dbo].[PremiumInspectionImage] ([Id], [UploadFile], [CreatedDate], [CreatedBy], [IsActive], [FK_PremiumInspectionId]) VALUES (4, N'/Images/PremiumInspectionFile/b1f925d1-1574-4b58-b31c-cdbf30a907f7.jpg', CAST(N'2024-10-25T13:43:18.133' AS DateTime), 1, 1, 4)
INSERT [dbo].[PremiumInspectionImage] ([Id], [UploadFile], [CreatedDate], [CreatedBy], [IsActive], [FK_PremiumInspectionId]) VALUES (5, N'/Images/PremiumInspectionFile/cb1d7319-a930-4c06-9615-9de3016dec31.jpeg', CAST(N'2024-10-25T13:43:19.927' AS DateTime), 1, 1, 4)
INSERT [dbo].[PremiumInspectionImage] ([Id], [UploadFile], [CreatedDate], [CreatedBy], [IsActive], [FK_PremiumInspectionId]) VALUES (6, N'/Images/PremiumInspectionFile/ba0100b5-2405-47a3-aadf-c79482b00cbc.png', CAST(N'2024-10-25T13:43:21.657' AS DateTime), 1, 1, 4)
SET IDENTITY_INSERT [dbo].[PremiumInspectionImage] OFF
GO
SET IDENTITY_INSERT [dbo].[PremiumInspectionMaster] ON 

INSERT [dbo].[PremiumInspectionMaster] ([Id], [UploadFile], [CarName], [ReportDate], [Package], [CarMake], [CarModel], [ProductionYear], [EngineCapacity], [CurrentMileage], [LicensePlateNumber], [EngineType], [CarColor], [CreatedDate], [CreatedBy], [IsActive]) VALUES (1, N'', N'', CAST(N'2024-01-05T00:00:00.000' AS DateTime), N'Testing', N'CarMake', N'E_Five', N'1888', N'1000', N'100', N'up 32 2324', N'Petrol Engine', N'Black', CAST(N'2024-08-29T06:30:13.403' AS DateTime), 1, 1)
INSERT [dbo].[PremiumInspectionMaster] ([Id], [UploadFile], [CarName], [ReportDate], [Package], [CarMake], [CarModel], [ProductionYear], [EngineCapacity], [CurrentMileage], [LicensePlateNumber], [EngineType], [CarColor], [CreatedDate], [CreatedBy], [IsActive]) VALUES (2, N'', N'', CAST(N'2024-01-05T00:00:00.000' AS DateTime), N'Testing', N'CarMake', N'E_Five', N'1888', N'1000', N'100', N'up 32 2324', N'Petrol Engine', N'Black', CAST(N'2024-08-29T06:49:41.740' AS DateTime), 1, 1)
INSERT [dbo].[PremiumInspectionMaster] ([Id], [UploadFile], [CarName], [ReportDate], [Package], [CarMake], [CarModel], [ProductionYear], [EngineCapacity], [CurrentMileage], [LicensePlateNumber], [EngineType], [CarColor], [CreatedDate], [CreatedBy], [IsActive]) VALUES (3, N'', N'', CAST(N'2024-01-05T00:00:00.000' AS DateTime), N'Testing', N'CarMake', N'E_Five', N'1888', N'1000', N'100', N'up 32 2324', N'Petrol Engine', N'Black', CAST(N'2024-08-29T06:52:49.660' AS DateTime), 1, 1)
INSERT [dbo].[PremiumInspectionMaster] ([Id], [UploadFile], [CarName], [ReportDate], [Package], [CarMake], [CarModel], [ProductionYear], [EngineCapacity], [CurrentMileage], [LicensePlateNumber], [EngineType], [CarColor], [CreatedDate], [CreatedBy], [IsActive]) VALUES (4, N'', N'', CAST(N'2024-01-05T00:00:00.000' AS DateTime), N'Testing', N'CarMake', N'E_Five', N'1888', N'1000', N'100', N'up 32 2324', N'Petrol Engine', N'Black', CAST(N'2024-08-29T06:54:19.160' AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[PremiumInspectionMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductionYearMaster] ON 

INSERT [dbo].[ProductionYearMaster] ([Id], [ProductionYear], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (1, N'1886', CAST(N'2024-08-28T17:18:18.320' AS DateTime), 1, 1, 0)
INSERT [dbo].[ProductionYearMaster] ([Id], [ProductionYear], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (2, N'1880', CAST(N'2024-08-28T17:18:31.930' AS DateTime), 1, 1, 0)
INSERT [dbo].[ProductionYearMaster] ([Id], [ProductionYear], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (3, N'1995', CAST(N'2024-10-23T18:29:31.620' AS DateTime), 1, 1, 0)
INSERT [dbo].[ProductionYearMaster] ([Id], [ProductionYear], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (4, N'1947', CAST(N'2024-10-23T18:35:32.863' AS DateTime), 1, 1, 0)
SET IDENTITY_INSERT [dbo].[ProductionYearMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[RoadTest] ON 

INSERT [dbo].[RoadTest] ([Id], [Title], [Image], [Remark], [Action], [CreatedDate], [CreatedBy], [IsActive], [FK_PremiumInspectionId]) VALUES (1, N'Brake System Performance', NULL, N'Brake System Performance', N'Yes', CAST(N'2024-10-22T15:31:27.750' AS DateTime), 1, 1, 1)
SET IDENTITY_INSERT [dbo].[RoadTest] OFF
GO
SET IDENTITY_INSERT [dbo].[RoadTestListMaster] ON 

INSERT [dbo].[RoadTestListMaster] ([Id], [RoadTest], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (1, N'Steering Wheel Centered', CAST(N'2024-08-30T03:35:58.467' AS DateTime), 1, 1, 0)
INSERT [dbo].[RoadTestListMaster] ([Id], [RoadTest], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (2, N'Vehicle Drives Straight On Level Surfaces', CAST(N'2024-08-30T03:36:30.930' AS DateTime), 1, 1, 0)
INSERT [dbo].[RoadTestListMaster] ([Id], [RoadTest], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (3, N'Steering Has Normal Feel During Operation', CAST(N'2024-08-30T03:36:43.783' AS DateTime), 1, 1, 0)
INSERT [dbo].[RoadTestListMaster] ([Id], [RoadTest], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (4, N'Steering System Components', CAST(N'2024-08-30T03:36:56.800' AS DateTime), 1, 1, 0)
INSERT [dbo].[RoadTestListMaster] ([Id], [RoadTest], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (5, N'Suspension Components', CAST(N'2024-08-30T03:37:15.113' AS DateTime), 1, 1, 0)
INSERT [dbo].[RoadTestListMaster] ([Id], [RoadTest], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (6, N'No Abnormal Noise Or Vibration From Suspension', CAST(N'2024-08-30T03:37:27.447' AS DateTime), 1, 1, 0)
INSERT [dbo].[RoadTestListMaster] ([Id], [RoadTest], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (7, N'No Abnormal Squeaks And Rattles While Driving', CAST(N'2024-08-30T03:37:50.947' AS DateTime), 1, 1, 0)
INSERT [dbo].[RoadTestListMaster] ([Id], [RoadTest], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (8, N'Engine Performance At Operating Temperature', CAST(N'2024-08-30T03:38:05.920' AS DateTime), 1, 1, 0)
INSERT [dbo].[RoadTestListMaster] ([Id], [RoadTest], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (9, N'Transmission And Clutch Performance', CAST(N'2024-08-30T03:38:19.003' AS DateTime), 1, 1, 0)
INSERT [dbo].[RoadTestListMaster] ([Id], [RoadTest], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (10, N'Automatic Transmission Operation', CAST(N'2024-08-30T03:38:32.907' AS DateTime), 1, 1, 0)
INSERT [dbo].[RoadTestListMaster] ([Id], [RoadTest], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (11, N'4WD/AWD Operation', CAST(N'2024-08-30T03:38:47.340' AS DateTime), 1, 1, 0)
INSERT [dbo].[RoadTestListMaster] ([Id], [RoadTest], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (12, N'EV/Hybrid Mode Operation', CAST(N'2024-08-30T03:39:07.360' AS DateTime), 1, 1, 0)
INSERT [dbo].[RoadTestListMaster] ([Id], [RoadTest], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (13, N'No Abnormal Tire/Road Noise', CAST(N'2024-08-30T03:39:21.010' AS DateTime), 1, 1, 0)
INSERT [dbo].[RoadTestListMaster] ([Id], [RoadTest], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (14, N'Brake System Performance', CAST(N'2024-08-30T03:39:33.603' AS DateTime), 1, 1, 0)
INSERT [dbo].[RoadTestListMaster] ([Id], [RoadTest], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (15, N'No Abnormal Brake Vibrations/Noises', CAST(N'2024-08-30T03:39:45.790' AS DateTime), 1, 1, 0)
INSERT [dbo].[RoadTestListMaster] ([Id], [RoadTest], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (16, N'Cruise Control Operating As Designed', CAST(N'2024-08-30T03:39:58.170' AS DateTime), 1, 1, 0)
INSERT [dbo].[RoadTestListMaster] ([Id], [RoadTest], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (17, N'Road Test Testing44', CAST(N'2024-10-24T13:28:20.757' AS DateTime), 1, 1, 1)
INSERT [dbo].[RoadTestListMaster] ([Id], [RoadTest], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (18, N'Road Test Againvvvv', CAST(N'2024-10-24T13:39:13.660' AS DateTime), 1, 1, 1)
SET IDENTITY_INSERT [dbo].[RoadTestListMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[SteeringSystemListMaster] ON 

INSERT [dbo].[SteeringSystemListMaster] ([Id], [SteeringSystem], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (1, N'Front Side Slip', CAST(N'2024-08-30T03:08:11.903' AS DateTime), 1, 1, 0)
INSERT [dbo].[SteeringSystemListMaster] ([Id], [SteeringSystem], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (2, N'Rear Side Slip', CAST(N'2024-08-30T03:08:37.040' AS DateTime), 1, 1, 0)
INSERT [dbo].[SteeringSystemListMaster] ([Id], [SteeringSystem], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (3, N'Front Suspension Damping', CAST(N'2024-08-30T03:09:01.077' AS DateTime), 1, 1, 0)
INSERT [dbo].[SteeringSystemListMaster] ([Id], [SteeringSystem], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (4, N'Rear Suspension Damping', CAST(N'2024-08-30T03:09:17.003' AS DateTime), 1, 1, 0)
INSERT [dbo].[SteeringSystemListMaster] ([Id], [SteeringSystem], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (5, N'Front Sub-Frame', CAST(N'2024-08-30T03:09:37.313' AS DateTime), 1, 1, 0)
INSERT [dbo].[SteeringSystemListMaster] ([Id], [SteeringSystem], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (6, N'Rear Sub-Frame', CAST(N'2024-08-30T03:09:50.067' AS DateTime), 1, 1, 0)
INSERT [dbo].[SteeringSystemListMaster] ([Id], [SteeringSystem], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (7, N'Front Hub + Bearing', CAST(N'2024-08-30T03:10:07.467' AS DateTime), 1, 1, 0)
INSERT [dbo].[SteeringSystemListMaster] ([Id], [SteeringSystem], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (8, N'Rear Hub + Bearing', CAST(N'2024-08-30T03:10:41.450' AS DateTime), 1, 1, 0)
INSERT [dbo].[SteeringSystemListMaster] ([Id], [SteeringSystem], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (9, N'Front / Rear Axels', CAST(N'2024-08-30T03:10:55.413' AS DateTime), 1, 1, 0)
INSERT [dbo].[SteeringSystemListMaster] ([Id], [SteeringSystem], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (10, N'Steering Column', CAST(N'2024-08-30T03:11:07.283' AS DateTime), 1, 1, 0)
INSERT [dbo].[SteeringSystemListMaster] ([Id], [SteeringSystem], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (11, N'Steering Assembly', CAST(N'2024-08-30T03:11:19.780' AS DateTime), 1, 1, 0)
INSERT [dbo].[SteeringSystemListMaster] ([Id], [SteeringSystem], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (12, N'Engine\Transmission Mounts', CAST(N'2024-08-30T03:11:33.450' AS DateTime), 1, 1, 0)
INSERT [dbo].[SteeringSystemListMaster] ([Id], [SteeringSystem], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (13, N'Steering System Testing777', CAST(N'2024-10-24T15:19:51.033' AS DateTime), 1, 1, 1)
INSERT [dbo].[SteeringSystemListMaster] ([Id], [SteeringSystem], [CreatedDate], [CreatedBy], [IsActive], [IsDeleted]) VALUES (14, N'Steering System Testing Again88', CAST(N'2024-10-24T15:23:19.373' AS DateTime), 1, 1, 1)
SET IDENTITY_INSERT [dbo].[SteeringSystemListMaster] OFF
GO
ALTER TABLE [dbo].[AcAndEngineCooling] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[AcAndEngineCooling] ADD  DEFAULT ('1') FOR [CreatedBy]
GO
ALTER TABLE [dbo].[AcAndEngineCooling] ADD  DEFAULT ('1') FOR [IsActive]
GO
ALTER TABLE [dbo].[ACAndEngineCoolingListMaster] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ACAndEngineCoolingListMaster] ADD  DEFAULT ('1') FOR [CreatedBy]
GO
ALTER TABLE [dbo].[ACAndEngineCoolingListMaster] ADD  DEFAULT ('1') FOR [IsActive]
GO
ALTER TABLE [dbo].[ACAndEngineCoolingListMaster] ADD  DEFAULT ('0') FOR [IsDeleted]
GO
ALTER TABLE [dbo].[AllNotes] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[AllNotes] ADD  DEFAULT ('1') FOR [CreatedBy]
GO
ALTER TABLE [dbo].[AllNotes] ADD  DEFAULT ('1') FOR [IsActive]
GO
ALTER TABLE [dbo].[BrakingAndSafety] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[BrakingAndSafety] ADD  DEFAULT ('1') FOR [CreatedBy]
GO
ALTER TABLE [dbo].[BrakingAndSafety] ADD  DEFAULT ('1') FOR [IsActive]
GO
ALTER TABLE [dbo].[BrakingAndSafetyListMaster] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[BrakingAndSafetyListMaster] ADD  DEFAULT ('1') FOR [CreatedBy]
GO
ALTER TABLE [dbo].[BrakingAndSafetyListMaster] ADD  DEFAULT ('1') FOR [IsActive]
GO
ALTER TABLE [dbo].[BrakingAndSafetyListMaster] ADD  DEFAULT ('0') FOR [IsDeleted]
GO
ALTER TABLE [dbo].[CarMaster] ADD  CONSTRAINT [DF_CarMaster_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[CarMaster] ADD  CONSTRAINT [DF_CarMaster_CreatedBy]  DEFAULT ((1)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[CarMaster] ADD  CONSTRAINT [DF_CarMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[CarMaster] ADD  DEFAULT ('0') FOR [IsDeleted]
GO
ALTER TABLE [dbo].[CarOptionListMaster] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[CarOptionListMaster] ADD  DEFAULT ('1') FOR [CreatedBy]
GO
ALTER TABLE [dbo].[CarOptionListMaster] ADD  DEFAULT ('1') FOR [IsActive]
GO
ALTER TABLE [dbo].[CarOptionListMaster] ADD  DEFAULT ('0') FOR [IsDeleted]
GO
ALTER TABLE [dbo].[CarOptions] ADD  DEFAULT ('0') FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ChassisCondition] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ChassisCondition] ADD  DEFAULT ('1') FOR [CreatedBy]
GO
ALTER TABLE [dbo].[ChassisCondition] ADD  DEFAULT ('1') FOR [IsActive]
GO
ALTER TABLE [dbo].[ChassisConditionListMaster] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ChassisConditionListMaster] ADD  DEFAULT ('1') FOR [CreatedBy]
GO
ALTER TABLE [dbo].[ChassisConditionListMaster] ADD  DEFAULT ('1') FOR [IsActive]
GO
ALTER TABLE [dbo].[ChassisConditionListMaster] ADD  DEFAULT ('0') FOR [IsDeleted]
GO
ALTER TABLE [dbo].[CountryMasterNew] ADD  CONSTRAINT [DF_CountryMasterNew_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[CountryMasterNew] ADD  CONSTRAINT [DF_CountryMasterNew_CreatedBy]  DEFAULT ((1)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[CountryMasterNew] ADD  CONSTRAINT [DF_CountryMasterNew_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[CountryMasterNew] ADD  DEFAULT ('0') FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ElectricalSystems] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ElectricalSystems] ADD  DEFAULT ('1') FOR [CreatedBy]
GO
ALTER TABLE [dbo].[ElectricalSystems] ADD  DEFAULT ('1') FOR [IsActive]
GO
ALTER TABLE [dbo].[ElectricalSystemsListMaster] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ElectricalSystemsListMaster] ADD  DEFAULT ('1') FOR [CreatedBy]
GO
ALTER TABLE [dbo].[ElectricalSystemsListMaster] ADD  DEFAULT ('1') FOR [IsActive]
GO
ALTER TABLE [dbo].[ElectricalSystemsListMaster] ADD  DEFAULT ('0') FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Exterior] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Exterior] ADD  DEFAULT ('1') FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Exterior] ADD  DEFAULT ('1') FOR [IsActive]
GO
ALTER TABLE [dbo].[ExteriorListMaster] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ExteriorListMaster] ADD  DEFAULT ('1') FOR [CreatedBy]
GO
ALTER TABLE [dbo].[ExteriorListMaster] ADD  DEFAULT ('1') FOR [IsActive]
GO
ALTER TABLE [dbo].[ExteriorListMaster] ADD  DEFAULT ('0') FOR [IsDeleted]
GO
ALTER TABLE [dbo].[HistoryAndRecordListMaster ] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[HistoryAndRecordListMaster ] ADD  DEFAULT ('1') FOR [CreatedBy]
GO
ALTER TABLE [dbo].[HistoryAndRecordListMaster ] ADD  DEFAULT ('1') FOR [IsActive]
GO
ALTER TABLE [dbo].[HistoryAndRecordListMaster ] ADD  DEFAULT ('0') FOR [IsDeleted]
GO
ALTER TABLE [dbo].[HistoryAndRecords] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[HistoryAndRecords] ADD  DEFAULT ('1') FOR [CreatedBy]
GO
ALTER TABLE [dbo].[HistoryAndRecords] ADD  DEFAULT ('1') FOR [IsActive]
GO
ALTER TABLE [dbo].[HistoryAndRecordsImage] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[HistoryAndRecordsImage] ADD  DEFAULT ('1') FOR [CreatedBy]
GO
ALTER TABLE [dbo].[HistoryAndRecordsImage] ADD  DEFAULT ('1') FOR [IsActive]
GO
ALTER TABLE [dbo].[InspectionAutoscoreInspected] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[InspectionAutoscoreInspected] ADD  DEFAULT ('1') FOR [CreatedBy]
GO
ALTER TABLE [dbo].[InspectionAutoscoreInspected] ADD  DEFAULT ('1') FOR [IsActive]
GO
ALTER TABLE [dbo].[InspectionCarPhoto] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[InspectionCarPhoto] ADD  DEFAULT ('1') FOR [CreatedBy]
GO
ALTER TABLE [dbo].[InspectionCarPhoto] ADD  DEFAULT ('1') FOR [IsActive]
GO
ALTER TABLE [dbo].[InspectionListMaster] ADD  CONSTRAINT [DF_InspectionListMaster_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[InspectionListMaster] ADD  CONSTRAINT [DF_InspectionListMaster_CreatedBy]  DEFAULT ((1)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[InspectionListMaster] ADD  CONSTRAINT [DF_InspectionListMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[InspectionListMaster] ADD  DEFAULT ('0') FOR [IsDeleted]
GO
ALTER TABLE [dbo].[PowerTrain] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[PowerTrain] ADD  DEFAULT ('1') FOR [CreatedBy]
GO
ALTER TABLE [dbo].[PowerTrain] ADD  DEFAULT ('1') FOR [IsActive]
GO
ALTER TABLE [dbo].[PowerTrainImage] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[PowerTrainImage] ADD  DEFAULT ('1') FOR [CreatedBy]
GO
ALTER TABLE [dbo].[PowerTrainImage] ADD  DEFAULT ('1') FOR [IsActive]
GO
ALTER TABLE [dbo].[PowerTrainListMaster ] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[PowerTrainListMaster ] ADD  DEFAULT ('1') FOR [CreatedBy]
GO
ALTER TABLE [dbo].[PowerTrainListMaster ] ADD  DEFAULT ('1') FOR [IsActive]
GO
ALTER TABLE [dbo].[PowerTrainListMaster ] ADD  DEFAULT ('0') FOR [IsDeleted]
GO
ALTER TABLE [dbo].[PremiumInspection] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[PremiumInspection] ADD  DEFAULT ('1') FOR [CreatedBy]
GO
ALTER TABLE [dbo].[PremiumInspection] ADD  DEFAULT ('1') FOR [IsActive]
GO
ALTER TABLE [dbo].[PremiumInspectionImage] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[PremiumInspectionImage] ADD  DEFAULT ('1') FOR [CreatedBy]
GO
ALTER TABLE [dbo].[PremiumInspectionImage] ADD  DEFAULT ('1') FOR [IsActive]
GO
ALTER TABLE [dbo].[PremiumInspectionMaster] ADD  CONSTRAINT [DF_PremiumInspectionMaster_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[PremiumInspectionMaster] ADD  CONSTRAINT [DF_PremiumInspectionMaster_CreatedBy]  DEFAULT ((1)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[PremiumInspectionMaster] ADD  CONSTRAINT [DF_PremiumInspectionMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ProductionYearMaster] ADD  DEFAULT ('1') FOR [IsActive]
GO
ALTER TABLE [dbo].[ProductionYearMaster] ADD  DEFAULT ('0') FOR [IsDeleted]
GO
ALTER TABLE [dbo].[RoadTest] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[RoadTest] ADD  DEFAULT ('1') FOR [CreatedBy]
GO
ALTER TABLE [dbo].[RoadTest] ADD  DEFAULT ('1') FOR [IsActive]
GO
ALTER TABLE [dbo].[RoadTestListMaster] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[RoadTestListMaster] ADD  DEFAULT ('1') FOR [CreatedBy]
GO
ALTER TABLE [dbo].[RoadTestListMaster] ADD  DEFAULT ('1') FOR [IsActive]
GO
ALTER TABLE [dbo].[RoadTestListMaster] ADD  DEFAULT ('0') FOR [IsDeleted]
GO
ALTER TABLE [dbo].[SteeringSystem] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[SteeringSystem] ADD  DEFAULT ('1') FOR [CreatedBy]
GO
ALTER TABLE [dbo].[SteeringSystem] ADD  DEFAULT ('1') FOR [IsActive]
GO
ALTER TABLE [dbo].[SteeringSystemListMaster] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[SteeringSystemListMaster] ADD  DEFAULT ('1') FOR [CreatedBy]
GO
ALTER TABLE [dbo].[SteeringSystemListMaster] ADD  DEFAULT ('1') FOR [IsActive]
GO
ALTER TABLE [dbo].[SteeringSystemListMaster] ADD  DEFAULT ('0') FOR [IsDeleted]
GO
/****** Object:  StoredProcedure [dbo].[DeleteAcAndEngineCoolingMaster]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[DeleteAcAndEngineCoolingMaster]
(
@Id bigint
)
AS
BEGIN
	BEGIN TRY
			update ACAndEngineCoolingListMaster set IsDeleted=1 where Id=@Id
			SELECT 1 AS MSG
	END TRY

	BEGIN CATCH
			SELECT 0 AS MSG,error_message() AS ErrorMessage
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteBrakingAndSafetyMaster]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[DeleteBrakingAndSafetyMaster]
(
@Id bigint
)
AS
BEGIN
	BEGIN TRY
			update BrakingAndSafetyListMaster set IsDeleted=1 where Id=@Id
			SELECT 1 AS MSG
	END TRY

	BEGIN CATCH
			SELECT 0 AS MSG,error_message() AS ErrorMessage
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteCarMaster]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[DeleteCarMaster]
(
@Id bigint
)
AS
BEGIN
	BEGIN TRY
			update CarMaster set IsDeleted=1 where Id=@Id
			SELECT 1 AS MSG
	END TRY

	BEGIN CATCH
			SELECT 0 AS MSG,error_message() AS ErrorMessage
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteCarOptionMaster]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[DeleteCarOptionMaster]
(
@Id bigint
)
AS
BEGIN
	BEGIN TRY
			update CarOptionListMaster set IsDeleted=1 where Id=@Id
			SELECT 1 AS MSG
	END TRY

	BEGIN CATCH
			SELECT 0 AS MSG,error_message() AS ErrorMessage
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteChassisConditionMaster]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[DeleteChassisConditionMaster]
(
@Id bigint
)
AS
BEGIN
	BEGIN TRY
			update ChassisConditionListMaster set IsDeleted=1 where Id=@Id
			SELECT 1 AS MSG
	END TRY

	BEGIN CATCH
			SELECT 0 AS MSG,error_message() AS ErrorMessage
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteCountryMaster]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[DeleteCountryMaster]
(
@Id bigint
)
AS
BEGIN
	BEGIN TRY
			update CountryMasterNew set IsDeleted=1 where Id=@Id
			SELECT 1 AS MSG
	END TRY

	BEGIN CATCH
			SELECT 0 AS MSG,error_message() AS ErrorMessage
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteElectricalSystemsMaster]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[DeleteElectricalSystemsMaster]
(
@Id bigint
)
AS
BEGIN
	BEGIN TRY
			update ElectricalSystemsListMaster set IsDeleted=1 where Id=@Id
			SELECT 1 AS MSG
	END TRY

	BEGIN CATCH
			SELECT 0 AS MSG,error_message() AS ErrorMessage
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteExteriorMaster]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[DeleteExteriorMaster]
(
@Id bigint
)
AS
BEGIN
	BEGIN TRY
			update ExteriorListMaster set IsDeleted=1 where Id=@Id
			SELECT 1 AS MSG
	END TRY

	BEGIN CATCH
			SELECT 0 AS MSG,error_message() AS ErrorMessage
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteHistoryAndRecordMaster]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[DeleteHistoryAndRecordMaster]
(
@Id bigint
)
AS
BEGIN
	BEGIN TRY
			update HistoryAndRecordListMaster set IsDeleted=1 where Id=@Id
			SELECT 1 AS MSG
	END TRY

	BEGIN CATCH
			SELECT 0 AS MSG,error_message() AS ErrorMessage
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteInspectionMaster]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[DeleteInspectionMaster]
(
@Id bigint
)
AS
BEGIN
	BEGIN TRY
			update InspectionListMaster set IsDeleted=1 where Id=@Id
			SELECT 1 AS MSG
	END TRY

	BEGIN CATCH
			SELECT 0 AS MSG,error_message() AS ErrorMessage
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[DeletePowerTrainMaster]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[DeletePowerTrainMaster]
(
@Id bigint
)
AS
BEGIN
	BEGIN TRY
			update PowerTrainListMaster set IsDeleted=1 where Id=@Id
			SELECT 1 AS MSG
	END TRY

	BEGIN CATCH
			SELECT 0 AS MSG,error_message() AS ErrorMessage
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteProductionYearMaster]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[DeleteProductionYearMaster]
(
@Id bigint
)
AS
BEGIN
	BEGIN TRY
			update ProductionYearMaster set IsDeleted=1 where Id=@Id
			SELECT 1 AS MSG
	END TRY

	BEGIN CATCH
			SELECT 0 AS MSG,error_message() AS ErrorMessage
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteRoadTestMaster]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create procedure [dbo].[DeleteRoadTestMaster]
(
@Id bigint
)
AS
BEGIN
	BEGIN TRY
			update RoadTestListMaster set IsDeleted=1 where Id=@Id
			SELECT 1 AS MSG
	END TRY

	BEGIN CATCH
			SELECT 0 AS MSG,error_message() AS ErrorMessage
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteSteeringSystemMaster]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[DeleteSteeringSystemMaster]
(
@Id bigint
)
AS
BEGIN
	BEGIN TRY
			update SteeringSystemListMaster set IsDeleted=1 where Id=@Id
			SELECT 1 AS MSG
	END TRY

	BEGIN CATCH
			SELECT 0 AS MSG,error_message() AS ErrorMessage
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[GetAcAndEngineCoolingList]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetAcAndEngineCoolingList]
AS
BEGIN 
	select * from ACAndEngineCoolingListMaster WHERE IsActive=1
END
GO
/****** Object:  StoredProcedure [dbo].[GetAcAndEngineCoolingListMaster]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create Procedure  [dbo].[GetAcAndEngineCoolingListMaster]---GetAcAndEngineCoolingListMaster  @AcAndEngineCooling='Steering Assembly'
@Id bigint=null,
@AcAndEngineCooling nvarchar(250)=null
AS
begin
	select Id ,AcAndEngineCooling from ACAndEngineCoolingListMaster
	where Id=Isnull(@Id,Id) and AcAndEngineCooling like '%'+Isnull(@AcAndEngineCooling,AcAndEngineCooling)+'%' and Isnull(IsDeleted,0)=0
	order by Id desc
end
GO
/****** Object:  StoredProcedure [dbo].[GetAllNotesList]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetAllNotesList] --[GetAllNotesList] @FK_PremiumInspectionId=27
@FK_PremiumInspectionId bigint
AS
BEGIN 
  --  select ImportantNotes,WearAndTear,OtherNotes from PremiumInspection
	 --INNER JOIN AllNotes on PremiumInspection.id=AllNotes.FK_PremiumInspectionId
  --  where  PremiumInspection.id=@FK_PremiumInspectionId and AllNotes.IsActive=1 AND PremiumInspection.IsActive=1



	SELECT *,(SELECT * from AllNotes B where A.Id=B.FK_PremiumInspectionId for json path)AllNotesDetails  from PremiumInspection A where Mobile=(select Mobile from PremiumInspection where id=@FK_PremiumInspectionId)


END



GO
/****** Object:  StoredProcedure [dbo].[GetBrakingAndSafetyList]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetBrakingAndSafetyList]
AS
BEGIN 
	select * from BrakingAndSafetyListMaster WHERE IsActive=1
END
GO
/****** Object:  StoredProcedure [dbo].[GetBrakingAndSafetyListMaster]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure  [dbo].[GetBrakingAndSafetyListMaster]---GetBrakingAndSafetyListMaster  @BrakingAndSafety='Rear Left'
@Id bigint=null,
@BrakingAndSafety nvarchar(250)=null
AS
begin
	select Id ,BrakingAndSafety from BrakingAndSafetyListMaster
	where Id=Isnull(@Id,Id) and BrakingAndSafety like '%'+Isnull(@BrakingAndSafety,BrakingAndSafety)+'%' and Isnull(IsDeleted,0)=0
	order by Id desc
end

----select * from BrakingAndSafetyListMaster
GO
/****** Object:  StoredProcedure [dbo].[GetCarList]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[GetCarList]
As
Begin
 select * from CarMaster where IsActive=1
End
GO
/****** Object:  StoredProcedure [dbo].[GetCarListMaster]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure  [dbo].[GetCarListMaster]---GetCarListMaster @Company='Maruti'
@Id bigint=null,
@Company nvarchar(250)=null,
@EngeenType nvarchar(250)=null
AS
begin
	select Id ,Company,CarName,ModelNumber,EngeenType from CarMaster
	where Id=Isnull(@Id,Id) and Company like '%'+Isnull(@Company,Company)+'%' and EngeenType=Isnull(@EngeenType,EngeenType) and Isnull(IsDeleted,0)=0
	order by Id desc
end
GO
/****** Object:  StoredProcedure [dbo].[GetCarOptionList]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetCarOptionList]
AS
BEGIN 
	select * from CarOptionListMaster WHERE IsActive=1
END
GO
/****** Object:  StoredProcedure [dbo].[GetCarOptionListMaster]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure  [dbo].[GetCarOptionListMaster]---GetCarOptionListMaster  @CarOption='su'
@Id bigint=null,
@CarOption nvarchar(250)=null
AS
begin
	select Id ,CarOption from CarOptionListMaster
	where Id=Isnull(@Id,Id) and CarOption like '%'+Isnull(@CarOption,CarOption)+'%' and Isnull(IsDeleted,0)=0
	order by Id desc
end
GO
/****** Object:  StoredProcedure [dbo].[GetChassisConditionList]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetChassisConditionList]
AS
BEGIN 
	select * from ChassisConditionListMaster WHERE IsActive=1
END
GO
/****** Object:  StoredProcedure [dbo].[GetChassisConditionListMaster]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure  [dbo].[GetChassisConditionListMaster]---GetChassisConditionListMaster  @ChassisCondition='su'
@Id bigint=null,
@ChassisCondition nvarchar(250)=null
AS
begin
	select Id ,ChassisCondition from ChassisConditionListMaster
	where Id=Isnull(@Id,Id) and ChassisCondition like '%'+Isnull(@ChassisCondition,ChassisCondition)+'%' and Isnull(IsDeleted,0)=0
	order by Id desc
end
GO
/****** Object:  StoredProcedure [dbo].[GetCountryList]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[GetCountryList]
As
Begin
 select * from Countrymasternew where IsActive=1
End
GO
/****** Object:  StoredProcedure [dbo].[GetCountryListMaster]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure  [dbo].[GetCountryListMaster]---GetCountryListMaster  @CountryName='su'
@Id bigint=null,
@CountryName nvarchar(250)=null
AS
begin
	select Id ,CountryName from CountryMasterNew
	where Id=Isnull(@Id,Id) and CountryName like '%'+Isnull(@CountryName,CountryName)+'%' and Isnull(IsDeleted,0)=0
	order by Id desc
end
GO
/****** Object:  StoredProcedure [dbo].[GetDashboardDetails]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE  [dbo].[GetDashboardDetails]
AS
BEGIN
	SELECT COUNT(Id)TotalInspection FROM InspectionListMaster WHERE ISNULL(IsDeleted,0)=0 and IsActive=1
	SELECT COUNT(Id)TotalProductionYear FROM ProductionYearMaster WHERE ISNULL(IsDeleted,0)=0 and IsActive=1
	SELECT COUNT(Id)TotalCountry FROM CountryMasterNew WHERE ISNULL(IsDeleted,0)=0 and IsActive=1
	SELECT COUNT(Id)TotalCarOption FROM CarOptionListMaster WHERE ISNULL(IsDeleted,0)=0 and IsActive=1
	SELECT COUNT(Id)TotalExterior FROM ExteriorListMaster WHERE ISNULL(IsDeleted,0)=0 and IsActive=1
	SELECT COUNT(Id)TotalElectricalSystems FROM ElectricalSystemsListMaster WHERE ISNULL(IsDeleted,0)=0 and IsActive=1
	SELECT COUNT(Id)TotalBrakingAndSafety FROM BrakingAndSafetyListMaster WHERE ISNULL(IsDeleted,0)=0 and IsActive=1
	SELECT COUNT(Id)TotalChassisCondition FROM ChassisConditionListMaster WHERE ISNULL(IsDeleted,0)=0 and IsActive=1
	SELECT COUNT(Id)TotalSteeringSystem FROM SteeringSystemListMaster WHERE ISNULL(IsDeleted,0)=0 and IsActive=1
	SELECT COUNT(Id)TotalACAndEngineCooling FROM ACAndEngineCoolingListMaster WHERE ISNULL(IsDeleted,0)=0 and IsActive=1
	SELECT COUNT(Id)TotalRoadTest FROM RoadTestListMaster WHERE ISNULL(IsDeleted,0)=0 and IsActive=1
	SELECT COUNT(Id)TotalPowerTrain FROM PowerTrainListMaster WHERE ISNULL(IsDeleted,0)=0 and IsActive=1
	SELECT COUNT(Id)TotalHistoryAndRecord FROM HistoryAndRecordListMaster WHERE ISNULL(IsDeleted,0)=0 and IsActive=1
END


GO
/****** Object:  StoredProcedure [dbo].[GetElectricalSystemsList]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetElectricalSystemsList]
AS
BEGIN 
	select * from ElectricalSystemsListMaster WHERE IsActive=1
END
GO
/****** Object:  StoredProcedure [dbo].[GetElectricalSystemsListMaster]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure  [dbo].[GetElectricalSystemsListMaster]---GetElectricalSystemsListMaster  @ElectricalSystems='Amer'
@Id bigint=null,
@ElectricalSystems nvarchar(250)=null
AS
begin
	select Id ,ElectricalSystems from ElectricalSystemsListMaster
	where Id=Isnull(@Id,Id) and ElectricalSystems like '%'+Isnull(@ElectricalSystems,ElectricalSystems)+'%' and Isnull(IsDeleted,0)=0
	order by Id desc
end
GO
/****** Object:  StoredProcedure [dbo].[GetExteriorList]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetExteriorList]
AS
BEGIN 
	select * from ExteriorListMaster WHERE IsActive=1
END
GO
/****** Object:  StoredProcedure [dbo].[GetExteriorListMaster]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure  [dbo].[GetExteriorListMaster]---GetExteriorListMaster  @Exterior='Left Mirror'
@Id bigint=null,
@Exterior nvarchar(250)=null
AS
begin
	select Id ,Exterior from ExteriorListMaster
	where Id=Isnull(@Id,Id) and Exterior like '%'+Isnull(@Exterior,Exterior)+'%' and Isnull(IsDeleted,0)=0
	order by Id desc
end
GO
/****** Object:  StoredProcedure [dbo].[GetHistoryAndRecordList]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetHistoryAndRecordList]
--@FK_PremiumInspectionId bigint
AS
BEGIN 

select * from [HistoryAndRecordListMaster] where IsActive=1

--SELECT HRM.HistoryAndRecord AS title,
--HR.Id
--,HR.NoOfLocalAccidents
--,HR.TypeOfUseInSide
--,HR.EngineChangeInSide
--,HR.AirBag
--,HR.TypeOfUseOutSide
--,HR.CarseerLastMeterReading
--,HR.BodyType
--,HR.EngineChangeTechnicalSpecs
--,HR.OwnershipTransferFee
--,HR.Owners
--,HR.StandardSeating
--,HR.Height
--,HR.HighwayMilleage
--,HR.YearlyRegistrationFee
--,HR.MadeIn
--,HR.Engine
--,HR.JordanianOwnership
--,HR.RegistrationType
--,HR.FuelCapacity
--,HR.CreatedDate
--,HR.CreatedBy
--,HR.IsActive
--,HR.CarTitle
--,HR.CarHistory
--,HR.CarMileage
--,HR.Remark
--,HR.Action
-- from HistoryAndRecordListMaster HRM left join HistoryAndRecords HR ON HR.Title=HRM.HistoryAndRecord 
-- --and FK_PremiumInspectionId=@FK_PremiumInspectionId  
-- and HR.IsActive=1
-- for json path
END
GO
/****** Object:  StoredProcedure [dbo].[GetHistoryAndRecordListMaster]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure  [dbo].[GetHistoryAndRecordListMaster]---GetExteriorListMaster  @Exterior='Spare Tire'
@Id bigint=null,
@HistoryAndRecord nvarchar(250)=null
AS
begin
	select Id ,HistoryAndRecord from HistoryAndRecordListMaster
	where Id=Isnull(@Id,Id) and HistoryAndRecord like '%'+Isnull(@HistoryAndRecord,HistoryAndRecord)+'%' and Isnull(IsDeleted,0)=0
	order by Id desc
end
GO
/****** Object:  StoredProcedure [dbo].[GetInspectionList]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetInspectionList]
As
Begin
 select * from InspectionListMaster where IsActive=1
End



GO
/****** Object:  StoredProcedure [dbo].[GetInspectionListMaster]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure  [dbo].[GetInspectionListMaster]---GetInspectionListMaster  @InspectionName='Car Title'
@Id bigint=null,
@InspectionName nvarchar(250)=null
AS
begin
	select Id ,InspectionName from InspectionListMaster
	where Id=Isnull(@Id,Id) and InspectionName like '%'+Isnull(@InspectionName,InspectionName)+'%' and Isnull(IsDeleted,0)=0
	order by Id desc
end
GO
/****** Object:  StoredProcedure [dbo].[GetInspectionPhotoList]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetInspectionPhotoList] --[GetInspectionPhotoList] ''
@FK_PremiumInspectionId bigint
As
Begin

	 SELECT *,(SELECT * from InspectionCarPhoto B where A.Id=B.FK_PremiumInspectionId for json path)InspectionCarPhotoDetails  from PremiumInspection A where Mobile=(select Mobile from PremiumInspection where id=@FK_PremiumInspectionId)

	 SELECT *,(SELECT * from InspectionAutoscoreInspected B where A.Id=B.FK_PremiumInspectionId for json path)InspectionAutoscoreInspectedDetails  from PremiumInspection A where Mobile=(select Mobile from PremiumInspection where id=@FK_PremiumInspectionId)

End

------select * from InspectionCarPhoto
------select * from InspectionAutoscoreInspected

---update InspectionCarPhoto set FK_PremiumInspectionId=2 where id=5
---update InspectionAutoscoreInspected set FK_PremiumInspectionId=2 where id in(5,6)
GO
/****** Object:  StoredProcedure [dbo].[GetPowerTrainList]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetPowerTrainList]
AS
BEGIN 
	select * from PowerTrainListMaster WHERE IsActive=1
END
GO
/****** Object:  StoredProcedure [dbo].[GetPowerTrainListMaster]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure  [dbo].[GetPowerTrainListMaster]---GetPowerTrainListMaster  @PowerTrain='All Notes'
@Id bigint=null,
@PowerTrain nvarchar(250)=null
AS
begin
	select Id ,PowerTrain from PowerTrainListMaster
	where Id=Isnull(@Id,Id) and PowerTrain like '%'+Isnull(@PowerTrain,PowerTrain)+'%' and Isnull(IsDeleted,0)=0
	order by Id desc
end
GO
/****** Object:  StoredProcedure [dbo].[GetPremiumInspectionList]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- exec [GetPremiumInspectionList] '8874410817'
CREATE procedure [dbo].[GetPremiumInspectionList] --[GetPremiumInspectionList] 1

@FK_PremiumInspectionId bigint =null
AS
BEGIN 
	--select  *,PremiumInspection.Mobile from PremiumInspection 
	--INNER JOIN PremiumInspectionImage ON PremiumInspection.Id=PremiumInspectionImage.FK_PremiumInspectionId 
	--WHERE PremiumInspection.IsActive=1 AND PremiumInspectionImage.IsActive=1 AND PremiumInspection.Mobile=@MobileNumber

 SELECT * from PremiumInspection A where Mobile=(select Mobile from PremiumInspection where id=@FK_PremiumInspectionId) 
 SELECT UploadFile as PremiumInspectionImage   from PremiumInspectionImage   where FK_PremiumInspectionId= @FK_PremiumInspectionId  
 
END


--select * from PremiumInspection
--select * from PremiumInspectionImage
GO
/****** Object:  StoredProcedure [dbo].[GetProductionYearList]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[GetProductionYearList]
As
Begin
 select * from ProductionYearMaster where IsActive=1
End
GO
/****** Object:  StoredProcedure [dbo].[GetProductionYearListMaster]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure  [dbo].[GetProductionYearListMaster]---GetProductionYearListMaster  @ProductionYear='Transmission Trouble Codes'
@Id bigint=null,
@ProductionYear nvarchar(250)=null
AS
begin
	select Id ,ProductionYear from ProductionYearMaster
	where Id=Isnull(@Id,Id) and ProductionYear like '%'+Isnull(@ProductionYear,ProductionYear)+'%' and Isnull(IsDeleted,0)=0
	order by Id desc
end
GO
/****** Object:  StoredProcedure [dbo].[GetReportDetails]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetReportDetails] ---GetReportDetails '24/Rep/044' GetReportDetails @FK_PremiumInspectionId=27
@ReportNumber nvarchar(20)=null,
@FK_PremiumInspectionId bigint=null
As
Begin
		select  CarName,ReportDate,Package,CarMake,CarModel,ProductionYear,EngineCapacity,CurrentMileage,LicensePlateNumber,EngineType,CarColor,
		CreatedDate,Mobile,ReportNumber,VINNumber,(select UploadFile from PremiumInspectionImage PrI  where P.Id=PrI.FK_PremiumInspectionId for json path)PremiumInspectionImage,
		(select ImportantNotes,WearAndTear,OtherNotes from AllNotes AN where P.Id=AN.FK_PremiumInspectionId for json path)AllNotes,
		(select ACLM.AcAndEngineCooling,ISNULL(Image,'')Image,ISNULL(Remark,'')Remark,ISNULL(Action,'')Action from AcAndEngineCoolinglistmaster ACLM left join AcAndEngineCooling AC on AC.Title=ACLM.AcAndEngineCooling and p.Id=AC.FK_PremiumInspectionId for json path)AcAndEngineCooling,
		(select BSLM.BrakingAndSafety,Isnull(Image,'')Image,Isnull(Remark,'')Remark,Isnull(Action,'')Action from BrakingAndSafetylistmaster BSLM left join BrakingAndSafety BS on BS.Title=BSLM.BrakingAndSafety and P.Id=BS.FK_PremiumInspectionId for json path)BrakingAndSafety,
		(select CCLM.ChassisCondition,ISNULL(Image,'')Image,ISNULL(Remark,'')Remark,ISNULL(Action,'')Action  from ChassisConditionlistmaster CCLM left join ChassisCondition CC on CC.Title=CCLM.ChassisCondition and P.Id=CC.FK_PremiumInspectionId for json path)ChassisCondition,
		(select ESLM.ElectricalSystems,Isnull(Image,'')Image,Isnull(Remark,'')Remark,Isnull(Action,'')Action from ElectricalSystemslistmaster ESLM left join ElectricalSystems ES on ES.Title=ESLM.ElectricalSystems and P.Id=ES.FK_PremiumInspectionId for json path)ElectricalSystems,
		(Select ELM.Exterior,ISNULL(Image,'')Image,ISNULL(Remark,'')Remark,ISNULL(Action,'')Action from ExteriorListMaster ELM left join Exterior E ON E.Title=ELM.Exterior AND P.Id=E.FK_PremiumInspectionId for json path)Exterior,
		(select PTLM.PowerTrain,Image,Remark,Action ,PT.Id as PK_PowerTrainId,((select Image from PowerTrainImage PTI where PT.Id=PTI.FK_PowerTrainId for json path))PowerTrainImage from PowerTrainlistmaster PTLM left join PowerTrain PT on PT.Title=PTLM.PowerTrain and P.Id=PT.FK_PremiumInspectionId for json path)PowerTrain,
		(select RTLM.RoadTest,Isnull(Image,'')Image,Isnull(Remark,'')Remark,Isnull(Action,'')Action from RoadTestListmaster RTLM left join RoadTest RT on RT.Title=RTLM.RoadTest and P.Id=RT.FK_PremiumInspectionId for json path)RoadTest,
		(select SSLM.SteeringSystem,ISNULL(Image,'')Image,ISNULL(Remark,'')Remark,ISNULL(Action,'')Action from SteeringSystemlistmaster SSLM  left join SteeringSystem SS on SS.Title=SSLM.SteeringSystem  and P.Id=SS.FK_PremiumInspectionId for json path)SteeringSystem,
		(select CarPhoto from InspectionCarPhoto ICP where P.Id=ICP.FK_PremiumInspectionId for json path)InspectionCarPhoto,(select AutoscoreInspected from InspectionAutoscoreInspected IAI where P.Id=IAI.FK_PremiumInspectionId for json path)InspectionAutoscoreInspected,
		(select HRLM.HistoryAndRecord,ISNULL(NoOfLocalAccidents,'')NoOfLocalAccidents,ISNULL(TypeOfUseInSide,'')TypeOfUseInSide,ISNULL(EngineChangeInSide,'')EngineChangeInSide,ISNULL(AirBag,'')AirBag,ISNULL(TypeOfUseOutSide,'')TypeOfUseOutSide,ISNULL(CarseerLastMeterReading,'')CarseerLastMeterReading,ISNULL(BodyType,'')BodyType,ISNULL(EngineChangeTechnicalSpecs,'')EngineChangeTechnicalSpecs,ISNULL(OwnershipTransferFee,'')OwnershipTransferFee,ISNULL(Owners,'')Owners,ISNULL(StandardSeating,'')StandardSeating,ISNULL(Height,'')Height,ISNULL(HighwayMilleage,'')HighwayMilleage,ISNULL(YearlyRegistrationFee,'')YearlyRegistrationFee,ISNULL(MadeIn,'')MadeIn,ISNULL(Engine,'')Engine,ISNULL(JordanianOwnership,'')JordanianOwnership,
        ISNULL(RegistrationType,'')RegistrationType,ISNULL(FuelCapacity,'')FuelCapacity,ISNULL(CarTitle,'')CarTitle,ISNULL(CarHistory,'')CarHistory,ISNULL(CarMileage,'')CarMileage,ISNULL(Remark,'')Remark,ISNULL(Action,'')Action,ISNULL(Title,'')Title,HR.Id as PK_HistoryAndRecords,(select Image from HistoryAndRecordsImage HRI where HR.Id=HRI.FK_HistoryAndRecordId)HistoryAndRecordsImage  from  HistoryAndRecordListMaster HRLM left join HistoryAndRecords HR on HR.Title=HRLM.HistoryAndRecord and P.Id=HR.FK_PremiumInspectionId for json path)HistoryAndRecords
		from PremiumInspection P
		where (id=@FK_PremiumInspectionId OR ReportNumber=@ReportNumber)  and  IsActive=1
end





--select * from [CarOptionListMaster]
--select * from [InspectionListMaster]
GO
/****** Object:  StoredProcedure [dbo].[GetReportDetailsNew]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetReportDetailsNew] ---GetReportDetailsNew '24/Rep/044' GetReportDetailsNew @FK_PremiumInspectionId=1
@ReportNumber nvarchar(20)=null,
@FK_PremiumInspectionId bigint=null
As
Begin
		select  CarName,ReportDate,Package,CarMake,CarModel,ProductionYear,EngineCapacity,CurrentMileage,LicensePlateNumber,EngineType,CarColor,
		CreatedDate,Mobile,Isnull(CustomerName,'N/A')CustomerName,ReportNumber,VINNumber,(select UploadFile from PremiumInspectionImage PrI  where P.Id=PrI.FK_PremiumInspectionId for json path)PremiumInspectionImage,
		(select ImportantNotes,WearAndTear,OtherNotes from AllNotes AN where P.Id=AN.FK_PremiumInspectionId for json path)AllNotes,(select ACLM.AcAndEngineCooling,ISNULL(Image,'')Image,ISNULL(Remark,'')Remark,ISNULL(Action,'')Action from AcAndEngineCoolinglistmaster ACLM left join AcAndEngineCooling AC on AC.Title=ACLM.AcAndEngineCooling and p.Id=AC.FK_PremiumInspectionId for json path)AcAndEngineCooling,
		(select BSLM.BrakingAndSafety,Isnull(Image,'')Image,Isnull(Remark,'')Remark,Isnull(Action,'')Action from BrakingAndSafetylistmaster BSLM left join BrakingAndSafety BS on BS.Title=BSLM.BrakingAndSafety and P.Id=BS.FK_PremiumInspectionId for json path)BrakingAndSafety,
		(select CCLM.ChassisCondition,ISNULL(Image,'')Image,ISNULL(Remark,'')Remark,ISNULL(Action,'')Action  from ChassisConditionlistmaster CCLM left join ChassisCondition CC on CC.Title=CCLM.ChassisCondition and P.Id=CC.FK_PremiumInspectionId for json path)ChassisCondition,
		(select ESLM.ElectricalSystems,Isnull(Image,'')Image,Isnull(Remark,'')Remark,Isnull(Action,'')Action from ElectricalSystemslistmaster ESLM left join ElectricalSystems ES on ES.Title=ESLM.ElectricalSystems and P.Id=ES.FK_PremiumInspectionId for json path)ElectricalSystems,
		(Select ELM.Exterior,ISNULL(Image,'')Image,ISNULL(Remark,'')Remark,ISNULL(Action,'')Action from ExteriorListMaster ELM left join Exterior E ON E.Title=ELM.Exterior AND P.Id=E.FK_PremiumInspectionId for json path)Exterior,
		(select PTLM.PowerTrain,Image,Remark,Action ,PT.Id as PK_PowerTrainId,((select Image from PowerTrainImage PTI where PT.Id=PTI.FK_PowerTrainId for json path))PowerTrainImage from PowerTrainlistmaster PTLM left join PowerTrain PT on PT.Title=PTLM.PowerTrain and P.Id=PT.FK_PremiumInspectionId for json path)PowerTrain,
		(select RTLM.RoadTest,Isnull(Image,'')Image,Isnull(Remark,'')Remark,Isnull(Action,'')Action from RoadTestListmaster RTLM left join RoadTest RT on RT.Title=RTLM.RoadTest and P.Id=RT.FK_PremiumInspectionId for json path)RoadTest,
		(select SSLM.SteeringSystem,ISNULL(Image,'')Image,ISNULL(Remark,'')Remark,ISNULL(Action,'')Action from SteeringSystemlistmaster SSLM  left join SteeringSystem SS on SS.Title=SSLM.SteeringSystem  and P.Id=SS.FK_PremiumInspectionId for json path)SteeringSystem,
		(select CarPhoto from InspectionCarPhoto ICP where P.Id=ICP.FK_PremiumInspectionId for json path)InspectionCarPhoto,(select AutoscoreInspected from InspectionAutoscoreInspected IAI where P.Id=IAI.FK_PremiumInspectionId for json path)InspectionAutoscoreInspected
		-------------------------------Main code start-------------------------------------------------------
        -- ,(Select HRLM.HistoryAndRecord,NoOfLocalAccidents,FK_PremiumInspectionId,TypeOfUseInSide,EngineChangeInSide,AirBag,TypeOfUseOutSide,CarseerLastMeterReading,BodyType,EngineChangeTechnicalSpecs,OwnershipTransferFee,Owners,StandardSeating,Height,HighwayMilleage,YearlyRegistrationFee,MadeIn,Engine,JordanianOwnership,RegistrationType,FuelCapacity,CarTitle,CarHistory,CarMileage
        --,Title,Remark,Action,(select Image from HistoryAndRecordsImage HRI where HRI.FK_HistoryAndRecordId=HR.Id for json path)HistoryAndRecordsImage from HistoryAndRecordListMaster HRLM left join HistoryAndRecords HR
        -- ON HR.Title=HRLM.HistoryAndRecord AND P.Id=HR.FK_PremiumInspectionId for json path)HistoryAndRecordNew
	    -------------------------------Main code End-------------------------------------------------------

	   --,(Select HRLM.HistoryAndRecord,NoOfLocalAccidents,FK_PremiumInspectionId,TypeOfUseInSide,EngineChangeInSide,AirBag,TypeOfUseOutSide,CarseerLastMeterReading,BodyType,EngineChangeTechnicalSpecs,OwnershipTransferFee,Owners,StandardSeating,Height,HighwayMilleage,YearlyRegistrationFee,MadeIn,Engine,JordanianOwnership,RegistrationType,FuelCapacity,CarTitle,CarHistory,CarMileage
    --   ,Title,Remark,Action,(select Image from HistoryAndRecordsImage HRI where HRI.FK_HistoryAndRecordId=HR.Id for json path)HistoryAndRecordsImage from HistoryAndRecordListMaster HRLM inner join HistoryAndRecords HR
    --    ON HR.Title=HRLM.HistoryAndRecord AND P.Id=HR.FK_PremiumInspectionId for json path)HistoryAndRecordNew


	   ,(Select HRLM.HistoryAndRecord,NoOfLocalAccidents,FK_PremiumInspectionId,TypeOfUseInSide,EngineChangeInSide,AirBag,TypeOfUseOutSide,CarseerLastMeterReading,BodyType,EngineChangeTechnicalSpecs,OwnershipTransferFee,Owners,StandardSeating,Height,HighwayMilleage,YearlyRegistrationFee,MadeIn,Engine,JordanianOwnership,RegistrationType,FuelCapacity,CarTitle,CarHistory,CarMileage
       ,Title,Remark,Action,(select CountryName from CountryMasterNew where CountryMasterNew.Id=HR.MadeIn)CountryName from HistoryAndRecordListMaster HRLM inner join HistoryAndRecords HR
        ON HR.Title=HRLM.HistoryAndRecord AND P.Id=HR.FK_PremiumInspectionId for json path)HistoryAndRecordNew

		from PremiumInspection P
		where (id=@FK_PremiumInspectionId OR ReportNumber=@ReportNumber)  and  IsActive=1
		-------------------------------by default data HistoryAndRecordListMaster start-------------------------------------------------------
		select HistoryAndRecord,Title,Remark,Action,Image,FK_HistoryAndRecordId,FK_PremiumInspectionId from HistoryAndRecords HR
		inner join HistoryAndRecordListMaster HRLM on HR.Title=HRLM.HistoryAndRecord
		inner join HistoryAndRecordsImage HRI on HRI.FK_HistoryAndRecordId=HR.Id
		where HR.FK_PremiumInspectionId=@FK_PremiumInspectionId

		-------------------------------by default data HistoryAndRecordListMaster end-------------------------------------------------------

end

---inner join CountryMasterNew CMN on CMN.Id=HR.MadeIn

--select * from HistoryAndRecordListMaster 
--select * from PremiumInspection
--select * from HistoryAndRecords 
--select * from HistoryAndRecordsImage
----update HistoryAndRecords set title='Car Title' where id=1

--select * from HistoryAndRecords 
--select * from CountryMasterNew 

----select (select CountryName from CountryMasterNew where CountryMasterNew.Id=HistoryAndRecords.MadeIn)CountryName from HistoryAndRecords 










GO
/****** Object:  StoredProcedure [dbo].[GetReportList]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetReportList]
AS
Begin
	select Id, isnull(ReportNumber,'N/A')ReportNumber,Isnull(VINNumber,'N/A')VINNumber from PremiumInspection where IsActive=1
End
GO
/****** Object:  StoredProcedure [dbo].[GetRoadTestList]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetRoadTestList]
AS
BEGIN 
	select * from RoadTestListMaster WHERE IsActive=1
END
GO
/****** Object:  StoredProcedure [dbo].[GetRoadTestListMaster]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure  [dbo].[GetRoadTestListMaster]---GetRoadTestListMaster  @RoadTest='1880'
@Id bigint=null,
@RoadTest nvarchar(250)=null
AS
begin
	select Id ,RoadTest from RoadTestListMaster
	where Id=Isnull(@Id,Id) and RoadTest like '%'+Isnull(@RoadTest,RoadTest)+'%' and Isnull(IsDeleted,0)=0
	order by Id desc
end
GO
/****** Object:  StoredProcedure [dbo].[GetSaveAcAndEngineCoolingList]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetSaveAcAndEngineCoolingList] --[GetSaveAcAndEngineCoolingList] 2
@FK_PremiumInspectionId bigint
As
Begin
	


	select *,(select ISNULL(AEC.Id,0)Id,ISNULL(ACLM.AcAndEngineCooling,'')Title,ISNULL(Remark,'')Remark,ISNULL(Image,'')Image,ISNULL(Action,'')Action,ISNULL(AEC.IsActive,'')IsActive from ACAndEngineCoolingListMaster ACLM left join AcAndEngineCooling AEC ON ACLM.AcAndEngineCooling=AEC.Title and  AEC.FK_PremiumInspectionId=@FK_PremiumInspectionId and  AEC.IsActive=1 for json path)AcAndEngineCoolingDetails
	from PremiumInspection A where Mobile=(select Mobile from PremiumInspection where id=@FK_PremiumInspectionId) and A.IsActive=1
End


--select * from PremiumInspection
--select * from AcAndEngineCooling

----update AcAndEngineCooling set FK_PremiumInspectionId=1 where id=1
GO
/****** Object:  StoredProcedure [dbo].[GetSaveBrakingAndSafetyList]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetSaveBrakingAndSafetyList] --[GetSaveBrakingAndSafetyList] 2
@FK_PremiumInspectionId bigint
As
Begin



		select *,(select BSM.BrakingAndSafety,BAS.Remark,BAS.Id,BAS.Image,BAS.Action,BAS.IsActive from BrakingAndSafetyListMaster BSM left join BrakingAndSafety BAS ON BSM.BrakingAndSafety=BAS.Title and FK_PremiumInspectionId=@FK_PremiumInspectionId and BAS.IsActive=1 for json path)BrakingAndSafetyDetails
	from PremiumInspection A where Mobile=(select Mobile from PremiumInspection where id=@FK_PremiumInspectionId) and A.IsActive=1
End



--select * from PremiumInspection
--select * from BrakingAndSafety

----update BrakingAndSafety set FK_PremiumInspectionId=1 where id=1

GO
/****** Object:  StoredProcedure [dbo].[GetSaveCarOptionList]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetSaveCarOptionList]  --GetSaveCarOptionList @FK_PremiumInspectionId=1
@FK_PremiumInspectionId bigint
AS
begin
	--select FK_PremiumInspectionId,FK_CarOptionMasterId,CarOption from CarOptions CO
	--right join CarOptionListMaster COLM on COLM.Id=CO.FK_CarOptionMasterId
	--where FK_PremiumInspectionId=@FK_PremiumInspectionId
	
IF OBJECT_ID('#temp', 'U') IS NOT NULL
BEGIN
    DROP TABLE #temp;  
END
    select	Id,CarOption,(SELECT ISNULL(1,0) from CarOptions where FK_PremiumInspectionId=@FK_PremiumInspectionId and FK_CarOptionMasterId=A.Id )Status into #temp from CarOptionListMaster  A where A.IsActive=1
    select Id,CarOption,ISNULL(status,0)status from #temp   
end


--select * from CarOptions
--select * from CarOptionListMaster
--select * from 
GO
/****** Object:  StoredProcedure [dbo].[GetSaveChassisConditionList]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[GetSaveChassisConditionList] ----[GetSaveChassisConditionList] '2'
@FK_PremiumInspectionId bigint
As
Begin

	--select *,(select * from ChassisCondition B where A.Id=B.FK_PremiumInspectionId and B.IsActive=1 for json path)ChassisConditionDetails
	--from PremiumInspection A where Mobile=(select Mobile from PremiumInspection where id=@FK_PremiumInspectionId) and A.IsActive=1

		select *,(select ChassisCondition,ISNULL(CC.Remark,'')Remark,ISNULL(CC.Action,'')Action ,ISNULL(Image,'')Image,ISNULL(CC.id,'')ID from ChassisConditionListMaster  CCM left join ChassisCondition 
CC ON CCM.ChassisCondition=CC.Title  for json path)ChassisConditionDetails
	from PremiumInspection A where Mobile=(select Mobile from PremiumInspection where id=@FK_PremiumInspectionId) and A.IsActive=1
End



--select * from PremiumInspection
--select * from ChassisCondition

----update ChassisCondition set FK_PremiumInspectionId=2 where id=2



GO
/****** Object:  StoredProcedure [dbo].[GetSaveElectricalSystemsList]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[GetSaveElectricalSystemsList]  ----[GetSaveElectricalSystemsList] 56
@FK_PremiumInspectionId bigint
As
Begin
	

select *,(select ISNULL(ELM.ElectricalSystems,'') AS title,ISNULL(ES.Remark,'')Remark,ISNULL(ES.Id,0)Id,ISNULL(ES.Image,'')AS Image,ISNULL(ES.IsActive,'')IsActive,ISNULL(ES.Action,'')Action  from ElectricalSystemsListMaster ELM left join ElectricalSystems ES ON ELM.ElectricalSystems
=ES.Title and ES.FK_PremiumInspectionId=@FK_PremiumInspectionId for json path)ElectricalSystemsDetails
	from PremiumInspection A 
	where Mobile=(select Mobile from PremiumInspection where id=@FK_PremiumInspectionId) and A.IsActive=1
End




GO
/****** Object:  StoredProcedure [dbo].[GetSaveExteriorList]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetSaveExteriorList] ---[GetSaveExteriorList]  @FK_PremiumInspectionId=27
@FK_PremiumInspectionId bigint
As
Begin
	
	select *,(select distinct Exterior,ISNULL(Remark,'')Remark,ISNULL(Image,'')Image,ISNULL(Action,'')Action from ExteriorListMaster E left join Exterior EX ON E.Exterior=EX.Title  and FK_PremiumInspectionId=@FK_PremiumInspectionId for json path)ExteriorDetails from PremiumInspection P where Mobile=(select Mobile from PremiumInspection where id=@FK_PremiumInspectionId)

End

--select * from PremiumInspection
--select * from Exterior
--select * from ExteriorListMaster
GO
/****** Object:  StoredProcedure [dbo].[GetSaveHistoryAndRecordsList]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetSaveHistoryAndRecordsList] ---[GetSaveHistoryAndRecordsList] 1
@FK_PremiumInspectionId bigint
As
Begin
-----select *,(select *,(select * from HistoryAndRecordsImage C where B.Id=C.FK_HistoryAndRecordId for json path)PremiumInspectionImageDetails from HistoryAndRecords B where A.Id=B.FK_PremiumInspectionId for json path )HistoryAndRecordsDetails from PremiumInspection A where Mobile=(select Mobile from PremiumInspection where id=@FK_PremiumInspectionId)


SELECT HRM.HistoryAndRecord AS title,HR.FK_PremiumInspectionId,
ISNULL(HR.Id,0)Id
,ISNULL(HR.NoOfLocalAccidents,'NA')NoOfLocalAccidents
,ISNULL(HR.TypeOfUseInSide,'NA')TypeOfUseInSide 
,ISNULL (HR.EngineChangeInSide,'N/A')EngineChangeInSide
,ISNULL (HR.AirBag,'N/A') AirBag
,ISNULL (HR.TypeOfUseOutSide,'N/A')TypeOfUseOutSide
,ISNULL (HR.CarseerLastMeterReading,'N/A')CarseerLastMeterReading
,ISNULL (HR.BodyType,'N/A')BodyType
,ISNULL (HR.EngineChangeTechnicalSpecs,'N/A')EngineChangeTechnicalSpecs
,ISNULL (HR.OwnershipTransferFee,'N/A')OwnershipTransferFee
,ISNULL (HR.Owners,'N/A')Owners
,ISNULL (HR.StandardSeating,'N/A')StandardSeating
,ISNULL (HR.Height,'N/A')Height
,ISNULL (HR.HighwayMilleage,'N/A')HighwayMilleage
,ISNULL (HR.YearlyRegistrationFee,'N/A')YearlyRegistrationFee
,ISNULL (HR.MadeIn,'N/A')MadeIn
,ISNULL (CML.CountryName,'N/A')CountryName
,ISNULL (HR.Engine,'N/A')Engine
,ISNULL (HR.JordanianOwnership,'N/A')JordanianOwnership
,ISNULL (HR.RegistrationType,'N/A')RegistrationType
,ISNULL (HR.FuelCapacity,'N/A')FuelCapacity
,ISNULL(HR.CreatedDate,'')CreatedDate
,ISNULL (HR.CreatedBy,1)CreatedBy
,ISNULL (HR.IsActive,1)IsActive
,ISNULL (HR.CarTitle,'N/A')CarTitle
,ISNULL (HR.CarHistory,'N/A')CarHistory
,ISNULL (HR.CarMileage,'N/A')CarMileage
,ISNULL (HR.Remark,'N/A')Remark
,ISNULL (HR.Action,'N/A')Action into #temp
 from HistoryAndRecordListMaster HRM LEFT JOIN HistoryAndRecords HR ON HR.Title=HRM.HistoryAndRecord 
 INNER JOIN Countrymasternew CML on CML.Id=HR.MadeIn
 AND HR.FK_PremiumInspectionId=@FK_PremiumInspectionId  
 AND HR.IsActive=1


select FK_PremiumInspectionId,a.title,a.Action,a.Remark,b.Image from  #temp a inner join HistoryAndRecordsImage b on  a.id=b.FK_HistoryAndRecordId and a.Id !=0 
for json path 
End





GO
/****** Object:  StoredProcedure [dbo].[GetSavePowerTrainList]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetSavePowerTrainList] --[GetSavePowerTrainList] '1'
@FK_PremiumInspectionId bigint
As
Begin
	--select * from PowerTrain 
	--INNER JOIN PowerTrainImage ON PowerTrain.Id=PowerTrainImage.FK_PowerTrainId
	--where PowerTrain.IsActive=1 AND PowerTrainImage.IsActive=1


	--select *,(select *,(select * from PowerTrainImage C where B.Id=C.FK_PowerTrainId for json path)PowerTrainImage 
	--from PowerTrain B where A.Id=B.FK_PremiumInspectionId for json path )
	--PowerTrainDetails from PremiumInspection A where Mobile=(select Mobile from PremiumInspection where id=@FK_PremiumInspectionId)


	SELECT PTM.ID,PowerTrain AS Title,PT.Remark,ISNULL(PT.Action,'Yes')Action,
	(select Image from PowerTrainImage C where PT.Id=C.FK_PowerTrainId and FK_PremiumInspectionId=@FK_PremiumInspectionId)Image 
	FROM PowerTrainListMaster PTM  left join PowerTrain PT ON PTM.ID=PT.Id and PT.FK_PremiumInspectionId=@FK_PremiumInspectionId 




End




GO
/****** Object:  StoredProcedure [dbo].[GetSaveRoadTestList]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetSaveRoadTestList] --[GetSaveRoadTestList] 2
@FK_PremiumInspectionId bigint
As
Begin
	
		select *,(select RT.Id,RTM.RoadTest,Remark,Image,Action from RoadTestListMaster RTM left join RoadTest RT ON RTM.RoadTest=RT.Title  and FK_PremiumInspectionId=@FK_PremiumInspectionId and rtm.IsActive=1 for json path)RoadTestDetails
	from PremiumInspection A where Mobile=(select Mobile from PremiumInspection where id=@FK_PremiumInspectionId) and A.IsActive=1
End

--select * from PremiumInspection
--select * from RoadTest

----update RoadTest set FK_PremiumInspectionId=2 where id=2
GO
/****** Object:  StoredProcedure [dbo].[GetSaveSteeringSystemList]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetSaveSteeringSystemList] ---[GetSaveSteeringSystemList] '2'
@FK_PremiumInspectionId bigint
As
Begin
	
	select *,(select ISNULL(SSM.SteeringSystem,'')SteeringSystem,ISNULL(SSM.Id,0)Id,ISNULL(SS.Image,'')Image,ISNULL(SS.Remark,'')Remark,ISNULL(SS.Action,'')Action from SteeringSystemListMaster SSM left join SteeringSystem SS ON SSM.SteeringSystem=SS.Title  AND SSM.IsActive=1 and FK_PremiumInspectionId=@FK_PremiumInspectionId for json path)SteeringSystemDetails
	from PremiumInspection A where Mobile=(select Mobile from PremiumInspection where id=@FK_PremiumInspectionId) and A.IsActive=1

End


--select * from PremiumInspection


----update SteeringSystem set FK_PremiumInspectionId=2 where id=2
GO
/****** Object:  StoredProcedure [dbo].[GetSteeringSystemList]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetSteeringSystemList]
AS
BEGIN 
	select * from SteeringSystemListMaster WHERE IsActive=1
END
GO
/****** Object:  StoredProcedure [dbo].[GetSteeringSystemListMaster]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure  [dbo].[GetSteeringSystemListMaster]---GetSteeringSystemListMaster  @SteeringSystem='1880'
@Id bigint=null,
@SteeringSystem nvarchar(250)=null
AS
begin
	select Id ,SteeringSystem from SteeringSystemListMaster
	where Id=Isnull(@Id,Id) and SteeringSystem like '%'+Isnull(@SteeringSystem,SteeringSystem)+'%' and Isnull(IsDeleted,0)=0
	order by Id desc
end
GO
/****** Object:  StoredProcedure [dbo].[SaveAcAndEngineCooling]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SaveAcAndEngineCooling]
 @Title nvarchar(250),
 @Image [nvarchar](max)=null ,
 @Remark [nvarchar](max) ,
 @Action [nvarchar](10) ,
 @FK_PremiumInspectionId bigint
AS
BEGIN 
	BEGIN TRANSACTION SaveAcAndEngineCooling
	BEGIN TRY
		INSERT INTO AcAndEngineCooling(Title,Image,Remark,Action,FK_PremiumInspectionId)
		VALUES(@Title,@Image,@Remark,@Action,@FK_PremiumInspectionId)

		SELECT 1 AS MSG
		COMMIT TRANSACTION SaveAcAndEngineCooling
	END TRY

	BEGIN CATCH
		SELECT 0 AS MSG,ERROR_MESSAGE() AS ErrorMessage
		COMMIT TRANSACTION SaveAcAndEngineCooling
	END CATCH
END

---select * from AcAndEngineCooling
---alter table AcAndEngineCooling add FK_PremiumInspectionId bigint
GO
/****** Object:  StoredProcedure [dbo].[SaveAcAndEngineCoolingMaster]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[SaveAcAndEngineCoolingMaster]
(
@AcAndEngineCooling nvarchar(250),
@CreatedBy bigint
)
AS
BEGIN
	BEGIN TRY
	Insert into ACAndEngineCoolingListMaster(AcAndEngineCooling,CreatedDate,CreatedBy)
	values(@AcAndEngineCooling,getdate(),@CreatedBy)

	SELECT 1 AS MSG
	END TRY

	BEGIN CATCH
	SELECT 0 AS MSG,error_message() AS ErrorMessage
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SaveAllNotes]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[SaveAllNotes]
(
    @ImportantNotes [nvarchar](max) NULL,
	@WearAndTear [nvarchar](max) NULL,
	@OtherNotes [nvarchar](max) NULL,
	@FK_PremiumInspectionId bigint
)
AS
BEGIN
	 BEGIN TRANSACTION SaveAllNotes    

		BEGIN TRY
		   Insert into AllNotes(ImportantNotes,WearAndTear,OtherNotes,FK_PremiumInspectionId)
		   values(@ImportantNotes,@WearAndTear,@OtherNotes,@FK_PremiumInspectionId)

		   SELECT 1 AS MSG
		   COMMIT TRANSACTION SaveAllNotes
		END TRY

		BEGIN CATCH
		   SELECT 0 AS MSG,error_message() AS ErrorMessage
		   ROLLBACK TRANSACTION SaveAllNotes
		END CATCH

END

---select * from AllNotes
---alter table AllNotes add FK_PremiumInspectionId bigint
GO
/****** Object:  StoredProcedure [dbo].[SaveBrakingAndSafety]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SaveBrakingAndSafety]
 @Title nvarchar(250),
 @Image [nvarchar](max)=null ,
 @Remark [nvarchar](max) ,
 @Action [nvarchar](10) ,
 @FK_PremiumInspectionId bigint
AS
BEGIN 
	BEGIN TRANSACTION SaveBrakingAndSafety
	BEGIN TRY
		INSERT INTO BrakingAndSafety(Title,Image,Remark,Action,FK_PremiumInspectionId)
		VALUES(@Title,@Image,@Remark,@Action,@FK_PremiumInspectionId)

		SELECT 1 AS MSG
		COMMIT TRANSACTION SaveBrakingAndSafety
	END TRY

	BEGIN CATCH
		SELECT 0 AS MSG,ERROR_MESSAGE() AS ErrorMessage
		COMMIT TRANSACTION SaveBrakingAndSafety
	END CATCH
END

---select * from BrakingAndSafety
---alter table BrakingAndSafety add FK_PremiumInspectionId bigint
GO
/****** Object:  StoredProcedure [dbo].[SaveBrakingAndSafetyMaster]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[SaveBrakingAndSafetyMaster]
(
@BrakingAndSafety nvarchar(250),
@CreatedBy bigint
)
AS
BEGIN
	BEGIN TRY
	Insert into BrakingAndSafetyListMaster(BrakingAndSafety,CreatedDate,CreatedBy)
	values(@BrakingAndSafety,getdate(),@CreatedBy)

	SELECT 1 AS MSG
	END TRY

	BEGIN CATCH
	SELECT 0 AS MSG,error_message() AS ErrorMessage
	END CATCH
END

----select * from BrakingAndSafetyListMaster




GO
/****** Object:  StoredProcedure [dbo].[SaveCarMaster]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[SaveCarMaster]
(
@Company nvarchar(250),
@CarName nvarchar(250),
@ModelNumber nvarchar(250),
@EngeenType nvarchar(250),
@CreatedBy bigint
)
AS
BEGIN
	BEGIN TRY
	Insert into CarMaster(Company,CarName,ModelNumber,EngeenType,CreatedDate,CreatedBy)
	values(@Company,@CarName,@ModelNumber,@EngeenType,getdate(),@CreatedBy)

	SELECT 1 AS MSG
	END TRY

	BEGIN CATCH
	SELECT 0 AS MSG,error_message() AS ErrorMessage
	END CATCH
END

----select * from CarMaster
GO
/****** Object:  StoredProcedure [dbo].[SaveCarOptionMaster]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[SaveCarOptionMaster]
(
@CarOption nvarchar(250),
@CreatedBy bigint
)
AS
BEGIN
	BEGIN TRY
	Insert into CarOptionListMaster(CarOption,CreatedDate,CreatedBy)
	values(@CarOption,getdate(),@CreatedBy)

	SELECT 1 AS MSG
	END TRY

	BEGIN CATCH
	SELECT 0 AS MSG,error_message() AS ErrorMessage
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SaveCarOptions]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SaveCarOptions]
(
@FK_PremiumInspectionId bigint,
@FK_CarOptionMasterId bigint=NULL
)
AS
BEGIN
	BEGIN TRY
	Insert into CarOptions(FK_PremiumInspectionId,FK_CarOptionMasterId,CreatedDate,CreatedBy)
	values(@FK_PremiumInspectionId,@FK_CarOptionMasterId,getdate(),1)

	SELECT 1 AS MSG
	END TRY

	BEGIN CATCH
	SELECT 0 AS MSG,error_message() AS ErrorMessage
	END CATCH
END

--select * from PremiumInspection
--select * from CarOptions
--select * from PremiumInspectionImage

---truncate table CarOptions
GO
/****** Object:  StoredProcedure [dbo].[SaveChassisCondition]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[SaveChassisCondition]
 @Title nvarchar(250),
 @Image [nvarchar](max)=null ,
 @Remark [nvarchar](max) ,
 @Action [nvarchar](10) ,
 @FK_PremiumInspectionId bigint
AS
BEGIN 
	BEGIN TRANSACTION SaveChassisCondition
	BEGIN TRY
		INSERT INTO ChassisCondition(Title,Image,Remark,Action,FK_PremiumInspectionId)
		VALUES(@Title,@Image,@Remark,@Action,@FK_PremiumInspectionId)

		SELECT 1 AS MSG
		COMMIT TRANSACTION SaveChassisCondition
	END TRY

	BEGIN CATCH
		SELECT 0 AS MSG,ERROR_MESSAGE() AS ErrorMessage
		COMMIT TRANSACTION SaveChassisCondition
	END CATCH
END

---select * from ChassisCondition
---alter table ChassisCondition add FK_PremiumInspectionId bigint
GO
/****** Object:  StoredProcedure [dbo].[SaveChassisConditionMaster]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SaveChassisConditionMaster]
(
@ChassisCondition nvarchar(250),
@CreatedBy bigint
)
AS
BEGIN
	BEGIN TRY
	Insert into ChassisConditionListMaster(ChassisCondition,CreatedDate,CreatedBy)
	values(@ChassisCondition,getdate(),@CreatedBy)

	SELECT 1 AS MSG
	END TRY

	BEGIN CATCH
	SELECT 0 AS MSG,error_message() AS ErrorMessage
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SaveCountryMaster]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[SaveCountryMaster]
(
@CountryName nvarchar(250),
@CreatedBy bigint
)
AS
BEGIN
	BEGIN TRY
	Insert into CountryMasterNew(CountryName,CreatedDate,CreatedBy)
	values(@CountryName,getdate(),@CreatedBy)

	SELECT 1 AS MSG
	END TRY

	BEGIN CATCH
	SELECT 0 AS MSG,error_message() AS ErrorMessage
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SaveElectricalSystems]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SaveElectricalSystems]
 @Title nvarchar(250),
 @Image [nvarchar](max)=null ,
 @Remark [nvarchar](max) ,
 @Action [nvarchar](10) ,
 @FK_PremiumInspectionId bigint
AS
BEGIN 
	BEGIN TRANSACTION SaveElectricalSystems
	BEGIN TRY
		INSERT INTO ElectricalSystems(Title,Image,Remark,Action,FK_PremiumInspectionId)
		VALUES(@Title,@Image,@Remark,@Action,@FK_PremiumInspectionId)

		SELECT 1 AS MSG
		COMMIT TRANSACTION SaveElectricalSystems
	END TRY

	BEGIN CATCH
		SELECT 0 AS MSG,ERROR_MESSAGE() AS ErrorMessage
		COMMIT TRANSACTION SaveElectricalSystems
	END CATCH
END

---select * from ElectricalSystems
---alter table ElectricalSystems add FK_PremiumInspectionId bigint
GO
/****** Object:  StoredProcedure [dbo].[SaveElectricalSystemsMaster]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[SaveElectricalSystemsMaster]
(
@ElectricalSystems nvarchar(250),
@CreatedBy bigint
)
AS
BEGIN
	BEGIN TRY
	Insert into ElectricalSystemsListMaster(ElectricalSystems,CreatedDate,CreatedBy)
	values(@ElectricalSystems,getdate(),@CreatedBy)

	SELECT 1 AS MSG
	END TRY

	BEGIN CATCH
	SELECT 0 AS MSG,error_message() AS ErrorMessage
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SaveExterior]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SaveExterior]
 @Title nvarchar(250),
 @Image [nvarchar](max)=null ,
 @Remark [nvarchar](max) ,
 @Action [nvarchar](10) ,
 @FK_PremiumInspectionId bigint
AS
BEGIN 
	BEGIN TRANSACTION SaveExterior
	BEGIN TRY
		INSERT INTO Exterior(Title,Image,Remark,Action,FK_PremiumInspectionId)
		VALUES(@Title,@Image,@Remark,@Action,@FK_PremiumInspectionId)

		SELECT 1 AS MSG
		COMMIT TRANSACTION SaveExterior
	END TRY

	BEGIN CATCH
		SELECT 0 AS MSG,ERROR_MESSAGE() AS ErrorMessage
		COMMIT TRANSACTION SaveExterior
	END CATCH
END

---select * from Exterior
---alter table Exterior add FK_PremiumInspectionId bigint
GO
/****** Object:  StoredProcedure [dbo].[SaveExteriorMaster]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[SaveExteriorMaster]
(
@Exterior nvarchar(250),
@CreatedBy bigint
)
AS
BEGIN
	BEGIN TRY
	Insert into ExteriorListMaster(Exterior,CreatedDate,CreatedBy)
	values(@Exterior,getdate(),@CreatedBy)

	SELECT 1 AS MSG
	END TRY

	BEGIN CATCH
	SELECT 0 AS MSG,error_message() AS ErrorMessage
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SaveHistoryAndRecordMaster]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[SaveHistoryAndRecordMaster]
(
@HistoryAndRecord nvarchar(250),
@CreatedBy bigint
)
AS
BEGIN
	BEGIN TRY
	Insert into HistoryAndRecordListMaster(HistoryAndRecord,CreatedDate,CreatedBy)
	values(@HistoryAndRecord,getdate(),@CreatedBy)

	SELECT 1 AS MSG
	END TRY

	BEGIN CATCH
	SELECT 0 AS MSG,error_message() AS ErrorMessage
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SaveHistoryAndRecords]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[SaveHistoryAndRecords]
(
   @CarTitle [nvarchar](250)=null ,
   @CarHistory [nvarchar](250)=null ,
   @CarMileage [nvarchar](250)=null ,
   @NoOfLocalAccidents [nvarchar](250)= NULL,
   @TypeOfUseInSide [nvarchar](250)= NULL,
   @EngineChangeInSide [nvarchar](250)= NULL,
   @AirBag [nvarchar](250)= NULL,
   @TypeOfUseOutSide [nvarchar](250)= NULL,
   @CarseerLastMeterReading [nvarchar](250) =NULL,
   @BodyType [nvarchar](250)= NULL,
   @EngineChangeTechnicalSpecs [nvarchar](250)= NULL,
   @OwnershipTransferFee [nvarchar](250)= NULL,
   @Owners [nvarchar](250)= NULL,
   @StandardSeating [nvarchar](250) =NULL,
   @Height [nvarchar](250)= NULL,
   @HighwayMilleage [nvarchar](250) =NULL,
   @YearlyRegistrationFee [nvarchar](250) =NULL,
   @MadeIn [nvarchar](250)= NULL,	
   @Engine [nvarchar](250)= NULL,
   @JordanianOwnership [nvarchar](250)= NULL,
   @RegistrationType [nvarchar](250) =NULL,	
   @FuelCapacity [nvarchar](250)= NULL,
   @Remark [nvarchar](250)= NULL,
   @Action [nvarchar](250)= NULL,
   @Title [nvarchar](250) =NULL,
   @FK_PremiumInspectionId bigint
)
AS
BEGIN
		BEGIN TRY
		DECLARE @FK_Id bigint

		Insert into HistoryAndRecords(CarTitle,CarHistory,CarMileage,NoOfLocalAccidents,TypeOfUseInSide,EngineChangeInSide,AirBag,TypeOfUseOutSide,CarseerLastMeterReading,BodyType,EngineChangeTechnicalSpecs,OwnershipTransferFee,Owners,StandardSeating,Height,HighwayMilleage,YearlyRegistrationFee,MadeIn,Engine,JordanianOwnership,RegistrationType,FuelCapacity,Remark,Action,Title,FK_PremiumInspectionId)
		values(@CarTitle,@CarHistory,@CarMileage,@NoOfLocalAccidents,@TypeOfUseInSide,@EngineChangeInSide,@AirBag,@TypeOfUseOutSide,@CarseerLastMeterReading,@BodyType,@EngineChangeTechnicalSpecs,@OwnershipTransferFee,@Owners,@StandardSeating,@Height,@HighwayMilleage,@YearlyRegistrationFee,@MadeIn,@Engine,@JordanianOwnership,@RegistrationType,@FuelCapacity,@Remark,@Action,@Title,@FK_PremiumInspectionId)

			set @FK_Id=SCOPE_IDENTITY() 

		SELECT 1 AS MSG,@FK_Id as FK_HistoryAndRecordId
		END TRY

		BEGIN CATCH
		SELECT 0 AS MSG,error_message() AS ErrorMessage
		END CATCH

END



---select * from HistoryAndRecords
---select * from HistoryAndRecordsImage
---alter table HistoryAndRecords add FK_PremiumInspectionId bigint


GO
/****** Object:  StoredProcedure [dbo].[SaveHistoryAndRecordsImage]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[SaveHistoryAndRecordsImage]
 @FK_HistoryAndRecordId bigint,
 @Image [nvarchar](max)
AS
BEGIN 

	BEGIN TRY
		INSERT INTO HistoryAndRecordsImage(FK_HistoryAndRecordId,Image)
		VALUES(@FK_HistoryAndRecordId,@Image)

		SELECT 1 AS MSG
		
	END TRY

	BEGIN CATCH
		SELECT 0 AS MSG,ERROR_MESSAGE() AS ErrorMessage
	
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SaveInspectionAutoscoreInspected]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SaveInspectionAutoscoreInspected]
(
  
   @AutoscoreInspected [nvarchar](max) NULL,
   @FK_PremiumInspectionId bigint
)
AS
BEGIN
	BEGIN TRANSACTION SaveInspectionAutoscoreInspected
	    
		BEGIN TRY

		Insert into InspectionAutoscoreInspected(AutoscoreInspected,FK_PremiumInspectionId)
		values(@AutoscoreInspected,@FK_PremiumInspectionId)

		SELECT 1 AS MSG
		COMMIT TRANSACTION SaveInspectionAutoscoreInspected
		END TRY

		BEGIN CATCH
		SELECT 0 AS MSG,error_message() AS ErrorMessage
		ROLLBACK TRANSACTION SaveInspectionAutoscoreInspected
		END CATCH

END

GO
/****** Object:  StoredProcedure [dbo].[SaveInspectionCarPhoto]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SaveInspectionCarPhoto]
(
   @CarPhoto [nvarchar](max),
   @FK_PremiumInspectionId bigint
)
AS
BEGIN
	   BEGIN TRANSACTION SaveInspectionCarPhoto    
		BEGIN TRY

		Insert into InspectionCarPhoto(CarPhoto,FK_PremiumInspectionId)
		values(@CarPhoto,@FK_PremiumInspectionId)

		SELECT 1 AS MSG
		COMMIT TRANSACTION SaveInspectionCarPhoto
		END TRY

		BEGIN CATCH
		SELECT 0 AS MSG,error_message() AS ErrorMessage
		ROLLBACK TRANSACTION SaveInspectionCarPhoto
		END CATCH
END


---------select * from InspectionCarPhoto
---------select * from InspectionAutoscoreInspected
---alter table InspectionCarPhoto add FK_PremiumInspectionId bigint
GO
/****** Object:  StoredProcedure [dbo].[SaveInspectionMaster]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[SaveInspectionMaster]
(
@InspectionName nvarchar(250),
@CreatedBy bigint
)
AS
BEGIN
	BEGIN TRY
	Insert into InspectionListMaster(InspectionName,CreatedDate,CreatedBy)
	values(@InspectionName,getdate(),@CreatedBy)

	SELECT 1 AS MSG
	END TRY

	BEGIN CATCH
	SELECT 0 AS MSG,error_message() AS ErrorMessage
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SavePowerTrain]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SavePowerTrain]
 @Title nvarchar(250),
 @Remark [nvarchar](max) ,
 @Image [nvarchar](max)=null,
 @Action [nvarchar](10) ,
 @FK_PremiumInspectionId bigint
AS
BEGIN 
	BEGIN TRY
		DECLARE @FK_Id bigint
		INSERT INTO PowerTrain(Title,Remark,Image,Action,FK_PremiumInspectionId) 
		VALUES(@Title,@Remark,@Image,@Action,@FK_PremiumInspectionId)

		set @FK_Id=SCOPE_IDENTITY() 

		SELECT 1 AS MSG,@FK_Id as FK_PowerTrainId
	END TRY

	BEGIN CATCH
		SELECT 0 AS MSG,ERROR_MESSAGE() AS ErrorMessage
	END CATCH
END

---select * from PowerTrain
---select * from PowerTrainImage
---alter table PowerTrain add FK_PremiumInspectionId bigint


GO
/****** Object:  StoredProcedure [dbo].[SavePowerTrainImage]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SavePowerTrainImage]
 @FK_PowerTrainId bigint,
 @Image [nvarchar](max)
AS
BEGIN 
	BEGIN TRANSACTION SavePowerTrainImage
	BEGIN TRY
		INSERT INTO PowerTrainImage(FK_PowerTrainId,Image)
		VALUES(@FK_PowerTrainId,@Image)

		SELECT 1 AS MSG
		COMMIT TRANSACTION SavePowerTrainImage
	END TRY

	BEGIN CATCH
		SELECT 0 AS MSG,ERROR_MESSAGE() AS ErrorMessage
		COMMIT TRANSACTION SavePowerTrainImage
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SavePowerTrainMaster]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[SavePowerTrainMaster]
(
@PowerTrain nvarchar(250),
@CreatedBy bigint
)
AS
BEGIN
	BEGIN TRY
	Insert into PowerTrainListMaster(PowerTrain,CreatedDate,CreatedBy)
	values(@PowerTrain,getdate(),@CreatedBy)

	SELECT 1 AS MSG
	END TRY

	BEGIN CATCH
	SELECT 0 AS MSG,error_message() AS ErrorMessage
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SavePremiumInspection]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SavePremiumInspection]
(
@CarName nvarchar(250)=null,
@ReportDate Nvarchar(250)=null,
@Package nvarchar(250)=null,
@CarMake nvarchar(250)=null,
@CarModel nvarchar(250)=null,
@ProductionYear nvarchar(250)=null,
@EngineCapacity nvarchar(250)=null,
@CurrentMileage nvarchar(250)=null,
@LicensePlateNumber nvarchar(250)=null,
@EngineType nvarchar(250)=null,
@CarColor nvarchar(250)=null,
@Mobile nvarchar(20)=null,
@CustomerName nvarchar(250)=null
)
AS
BEGIN
	BEGIN TRY
    DECLARE @FK_PremiumInspectionId bigint,@ReportNumber nvarchar(10),@VINNumber nvarchar(10)
	--------------------------------------Generate ReportNumber Start-----------------------------------------------------
	StepReportNumber:
	Set @ReportNumber= '24/Rep/'+'0'+RIGHT(CAST(ABS(CHECKSUM(NEWID())) % 1000 AS varchar(4)),4)
	if EXISTS(select ReportNumber from PremiumInspection where ReportNumber=@ReportNumber and IsActive=1)
	begin
		GoTo StepReportNumber
	end
	--------------------------------------Generate ReportNumber End-------------------------------------------------------
	--------------------------------------Generate VINNumber Start--------------------------------------------------------
	StepVINNumber:
	Set @VINNumber='24/Vin/'+'0'+RIGHT(CAST(ABS(CHECKSUM(NEWID())) % 1000 AS varchar(4)),4)
	if EXISTS(select VINNumber from PremiumInspection where VINNumber=@VINNumber and IsActive=1)
	begin
		GoTo StepVINNumber
	end
	--------------------------------------Generate VINNumber End----------------------------------------------------------
	INSERT INTO PremiumInspection(CarName,ReportDate,Package,CarMake,CarModel,ProductionYear,EngineCapacity,CurrentMileage,LicensePlateNumber,EngineType,CarColor,Mobile,CustomerName,ReportNumber,VINNumber)
	VALUES(@CarName ,@ReportDate,@Package,@CarMake,@CarModel,@ProductionYear,@EngineCapacity,@CurrentMileage,@LicensePlateNumber,@EngineType,@CarColor,@Mobile,@CustomerName,@ReportNumber,@VINNumber)
	
	set @FK_PremiumInspectionId=SCOPE_IDENTITY()
	SELECT 1 AS MSG,@FK_PremiumInspectionId as FK_PremiumInspectionId
	END TRY
	BEGIN CATCH
	SELECT 0 AS MSG,error_message() AS ErrorMessage
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SavePremiumInspectionImage]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SavePremiumInspectionImage]
(
@FK_PremiumInspectionId bigint,
@UploadFile nvarchar(max)=NULL
)
AS
BEGIN
	BEGIN TRANSACTION SavePremiumInspectionImage
	    
		BEGIN TRY

		Insert into PremiumInspectionImage(FK_PremiumInspectionId,UploadFile)
		values(@FK_PremiumInspectionId,@UploadFile)

		SELECT 1 AS MSG
		COMMIT TRANSACTION SavePremiumInspectionImage
		END TRY

		BEGIN CATCH
		SELECT 0 AS MSG,error_message() AS ErrorMessage
		ROLLBACK TRANSACTION SavePremiumInspectionImage
		END CATCH

END

-----select * from PremiumInspectionImage
---alter table PremiumInspectionImage add FK_PremiumInspectionId bigint
GO
/****** Object:  StoredProcedure [dbo].[SaveProductionYearMaster]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[SaveProductionYearMaster]
(
@ProductionYear nvarchar(250),
@CreatedBy bigint
)
AS
BEGIN
	BEGIN TRY
	Insert into ProductionYearMaster(ProductionYear,CreatedDate,CreatedBy)
	values(@ProductionYear,getdate(),@CreatedBy)

	SELECT 1 AS MSG
	END TRY

	BEGIN CATCH
	SELECT 0 AS MSG,error_message() AS ErrorMessage
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SaveRoadTest]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SaveRoadTest]
 @Title nvarchar(250),
 @Image [nvarchar](max)=null ,
 @Remark [nvarchar](max) ,
 @Action [nvarchar](10) ,
 @FK_PremiumInspectionId bigint
AS
BEGIN 
	BEGIN TRANSACTION SaveRoadTest
	BEGIN TRY
		INSERT INTO RoadTest(Title,Image,Remark,Action,FK_PremiumInspectionId)
		VALUES(@Title,@Image,@Remark,@Action,@FK_PremiumInspectionId)

		SELECT 1 AS MSG
		COMMIT TRANSACTION SaveRoadTest
	END TRY

	BEGIN CATCH
		SELECT 0 AS MSG,ERROR_MESSAGE() AS ErrorMessage
		COMMIT TRANSACTION SaveRoadTest
	END CATCH
END


---select * from RoadTest
---alter table RoadTest add FK_PremiumInspectionId bigint
GO
/****** Object:  StoredProcedure [dbo].[SaveRoadTestMaster]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[SaveRoadTestMaster]
(
@RoadTest nvarchar(250),
@CreatedBy bigint
)
AS
BEGIN
	BEGIN TRY
	Insert into RoadTestListMaster(RoadTest,CreatedDate,CreatedBy)
	values(@RoadTest,getdate(),@CreatedBy)

	SELECT 1 AS MSG
	END TRY

	BEGIN CATCH
	SELECT 0 AS MSG,error_message() AS ErrorMessage
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SaveSteeringSystem]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SaveSteeringSystem]
 @Title nvarchar(250),
 @Image [nvarchar](max)=null ,
 @Remark [nvarchar](max) ,
 @Action [nvarchar](10) ,
 @FK_PremiumInspectionId bigint
AS
BEGIN 
	BEGIN TRANSACTION SaveSteeringSystem
	BEGIN TRY
		INSERT INTO SteeringSystem(Title,Image,Remark,Action,FK_PremiumInspectionId)
		VALUES(@Title,@Image,@Remark,@Action,@FK_PremiumInspectionId)

		SELECT 1 AS MSG
		COMMIT TRANSACTION SaveSteeringSystem
	END TRY

	BEGIN CATCH
		SELECT 0 AS MSG,ERROR_MESSAGE() AS ErrorMessage
		COMMIT TRANSACTION SaveSteeringSystem
	END CATCH
END

---select * from SteeringSystem
---alter table SteeringSystem add FK_PremiumInspectionId bigint
GO
/****** Object:  StoredProcedure [dbo].[SaveSteeringSystemMaster]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[SaveSteeringSystemMaster]
(
@SteeringSystem nvarchar(250),
@CreatedBy bigint
)
AS
BEGIN
	BEGIN TRY
	Insert into SteeringSystemListMaster(SteeringSystem,CreatedDate,CreatedBy)
	values(@SteeringSystem,getdate(),@CreatedBy)

	SELECT 1 AS MSG
	END TRY

	BEGIN CATCH
	SELECT 0 AS MSG,error_message() AS ErrorMessage
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[TruncateAllTablesOfAutoGarageApi]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  procedure [dbo].[TruncateAllTablesOfAutoGarageApi]
AS
BEGIN 
--truncate table PremiumInspection
--truncate table PremiumInspectionImage
--truncate table AllNotes
--truncate table AcAndEngineCooling
--truncate table BrakingAndSafety
--truncate table ChassisCondition
--truncate table ElectricalSystems
--truncate table Exterior
--truncate table PowerTrain
--truncate table PowerTrainImage
--truncate table RoadTest
--truncate table SteeringSystem
--truncate table InspectionCarPhoto
--truncate table InspectionAutoscoreInspected
--truncate table HistoryAndRecords
--truncate table HistoryAndRecordsImage
--truncate table CarOptions

select * from PremiumInspection

END  

GO
/****** Object:  StoredProcedure [dbo].[UpdateAcAndEngineCoolingMaster]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create procedure [dbo].[UpdateAcAndEngineCoolingMaster]
(
@Id bigint,
@AcAndEngineCooling nvarchar(250)
)
AS
BEGIN
	BEGIN TRY
		Update ACAndEngineCoolingListMaster set AcAndEngineCooling=@AcAndEngineCooling where Id=@Id
		SELECT 1 AS MSG
	END TRY

	BEGIN CATCH
		SELECT 0 AS MSG,error_message() AS ErrorMessage
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateBrakingAndSafetyMaster]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UpdateBrakingAndSafetyMaster]
(
@Id bigint,
@BrakingAndSafety nvarchar(250)
)
AS
BEGIN
	BEGIN TRY
		Update BrakingAndSafetyListMaster set BrakingAndSafety=@BrakingAndSafety where Id=@Id
		SELECT 1 AS MSG
	END TRY

	BEGIN CATCH
		SELECT 0 AS MSG,error_message() AS ErrorMessage
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateCarMaster]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UpdateCarMaster]
(
@Id bigint,
@Company nvarchar(250),
@CarName nvarchar(250),
@ModelNumber nvarchar(250),
@EngeenType nvarchar(250)
)
AS
BEGIN
	BEGIN TRY
		Update CarMaster set Company=@Company,CarName=@CarName,ModelNumber=@ModelNumber,EngeenType=@EngeenType where Id=@Id
		SELECT 1 AS MSG
	END TRY

	BEGIN CATCH
		SELECT 0 AS MSG,error_message() AS ErrorMessage
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateCarOptionMaster]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UpdateCarOptionMaster]
(
@Id bigint,
@CarOption nvarchar(250)
)
AS
BEGIN
	BEGIN TRY
		Update CarOptionListMaster set CarOption=@CarOption where Id=@Id
		SELECT 1 AS MSG
	END TRY

	BEGIN CATCH
		SELECT 0 AS MSG,error_message() AS ErrorMessage
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateChassisConditionMaster]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UpdateChassisConditionMaster]
(
@Id bigint,
@ChassisCondition nvarchar(250)
)
AS
BEGIN
	BEGIN TRY
		Update ChassisConditionListMaster set ChassisCondition=@ChassisCondition where Id=@Id
		SELECT 1 AS MSG
	END TRY

	BEGIN CATCH
		SELECT 0 AS MSG,error_message() AS ErrorMessage
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateCountryMaster]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UpdateCountryMaster]
(
@Id bigint,
@CountryName nvarchar(250)
)
AS
BEGIN
	BEGIN TRY
		Update CountryMasterNew set CountryName=@CountryName where Id=@Id
		SELECT 1 AS MSG
	END TRY

	BEGIN CATCH
		SELECT 0 AS MSG,error_message() AS ErrorMessage
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateElectricalSystemsMaster]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[UpdateElectricalSystemsMaster]
(
@Id bigint,
@ElectricalSystems nvarchar(250)
)
AS
BEGIN
	BEGIN TRY
		Update ElectricalSystemsListMaster set ElectricalSystems=@ElectricalSystems where Id=@Id
		SELECT 1 AS MSG
	END TRY

	BEGIN CATCH
		SELECT 0 AS MSG,error_message() AS ErrorMessage
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateExteriorMaster]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[UpdateExteriorMaster]
(
@Id bigint,
@Exterior nvarchar(250)
)
AS
BEGIN
	BEGIN TRY
		Update ExteriorListMaster set Exterior=@Exterior where Id=@Id
		SELECT 1 AS MSG
	END TRY

	BEGIN CATCH
		SELECT 0 AS MSG,error_message() AS ErrorMessage
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateHistoryAndRecordMaster]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create procedure [dbo].[UpdateHistoryAndRecordMaster]
(
@Id bigint,
@HistoryAndRecord nvarchar(250)
)
AS
BEGIN
	BEGIN TRY
		Update HistoryAndRecordListMaster set HistoryAndRecord=@HistoryAndRecord where Id=@Id
		SELECT 1 AS MSG
	END TRY

	BEGIN CATCH
		SELECT 0 AS MSG,error_message() AS ErrorMessage
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateInspectionMaster]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[UpdateInspectionMaster]
(
@Id bigint,
@InspectionName nvarchar(250)
)
AS
BEGIN
	BEGIN TRY
		Update InspectionListMaster set InspectionName=@InspectionName where Id=@Id
		SELECT 1 AS MSG
	END TRY

	BEGIN CATCH
		SELECT 0 AS MSG,error_message() AS ErrorMessage
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[UpdatePowerTrainMaster]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create procedure [dbo].[UpdatePowerTrainMaster]
(
@Id bigint,
@PowerTrain nvarchar(250)
)
AS
BEGIN
	BEGIN TRY
		Update PowerTrainListMaster set PowerTrain=@PowerTrain where Id=@Id
		SELECT 1 AS MSG
	END TRY

	BEGIN CATCH
		SELECT 0 AS MSG,error_message() AS ErrorMessage
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateProductionYearMaster]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create procedure [dbo].[UpdateProductionYearMaster]
(
@Id bigint,
@ProductionYear nvarchar(250)
)
AS
BEGIN
	BEGIN TRY
		Update ProductionYearMaster set ProductionYear=@ProductionYear where Id=@Id
		SELECT 1 AS MSG
	END TRY

	BEGIN CATCH
		SELECT 0 AS MSG,error_message() AS ErrorMessage
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateRoadTestMaster]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[UpdateRoadTestMaster]
(
@Id bigint,
@RoadTest nvarchar(250)
)
AS
BEGIN
	BEGIN TRY
		Update RoadTestListMaster set RoadTest=@RoadTest where Id=@Id
		SELECT 1 AS MSG
	END TRY

	BEGIN CATCH
		SELECT 0 AS MSG,error_message() AS ErrorMessage
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateSteeringSystemMaster]    Script Date: 08-11-2024 10.33.52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[UpdateSteeringSystemMaster]
(
@Id bigint,
@SteeringSystem nvarchar(250)
)
AS
BEGIN
	BEGIN TRY
		Update SteeringSystemListMaster set SteeringSystem=@SteeringSystem where Id=@Id
		SELECT 1 AS MSG
	END TRY

	BEGIN CATCH
		SELECT 0 AS MSG,error_message() AS ErrorMessage
	END CATCH
END
GO
USE [master]
GO
ALTER DATABASE [AutoGarageApiNew25092024] SET  READ_WRITE 
GO
