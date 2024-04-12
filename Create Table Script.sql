
-- Create table script for GPhC database

USE [GPhC]
GO

/****** Object:  Table [dbo].[INSP.INSPECTION2]    Script Date: 12/04/2024 20:44:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[INSP.INSPECTION2](
	[Pharmacyid] [int] NOT NULL,
	[ActualInspectionDate] [varchar](50) NOT NULL,
	[VisitType] [char](10) NOT NULL,
	[InspectionStatus] [varchar](20) NOT NULL,
	[InspectionJudgement] [varchar](20) NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[INSP.INSPECTIONSTATUS](
	[InspectionStatusID] [int] NULL,
	[InspectionStatus] [varchar](50) NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[INSP.PHARMACY](
	[PharmacyID] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[PharmacyStatus] [char](20) NOT NULL,
	[RegionID] [int] NOT NULL,
	[ACC_address1PostalCode] [varchar](10) NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[INSP.REGION](
	[RegionId] [int] NOT NULL,
	[Region] [char](10) NOT NULL
) ON [PRIMARY]
GO





