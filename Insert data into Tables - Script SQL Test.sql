-- Insert data into tables

USE [GPhC]
GO

INSERT INTO [dbo].[INSP.PHARMACY]
           ([PharmacyID]
           ,[Name]
           ,[PharmacyStatus]
           ,[RegionID]
           ,[ACC_address1PostalCode])
     VALUES
         --  ('831287','Pharmacy831287','Registered',4,'BA24BQ')
		-- ('831288','Pharmacy831288','Registered',4,'BA25EG')
		--('831289','Pharmacy8312890','Registered',4,'BA28DH')
		--('831290','Pharmacy831290','Registered',4,'BA24LN')
		('831291','Pharmacy831287','Registered',4,'BA24MQ')
GO

INSERT INTO [dbo].[INSP.REGION]
           ([RegionId]
           ,[Region])
     VALUES
           (2, 'North')

INSERT INTO [dbo].[INSP.REGION]
           ([RegionId]
           ,[Region])
     VALUES
		   (4, 'South')

		   INSERT INTO [dbo].[INSP.REGION]
           ([RegionId]
           ,[Region])
     VALUES
		   (8, 'East')
INSERT INTO [dbo].[INSP.REGION]
           ([RegionId]
           ,[Region])
     VALUES
		   (16,'West')
GO

 [dbo].[INSP.INSPECTION2]
           ([Pharmacyid]
           ,[ActualInspectionDate]
           ,[VisitType]
           ,[InspectionStatus]
           ,[InspectionJudgement])
     VALUES
           (831287, '30/07/2015','Routine','10.Complete','Poor')
		   --(831288, '27/09/2018','Routine','10.Complete','Satisfactory')
		   --(831288, '22/07/2015','Routine','10.Complete','Satisfactory')
		   --(831289, '30/09/2015', 'Routine','01.Unscheduled', 'Satisfactory')
		   --(831290, NULL, 'Routine', '02. Notification letter sent (for unannounced)', 'Satisfactory')
		   )
GO

INSERT INTO [dbo].[INSP.INSPECTIONSTATUS]
           ([InspectionStatusID]
           ,[InspectionStatus])
     VALUES
           (1, '01.Unscheduled')
		 --(2, '02, Notification letter sent (or unannounced)')
		 --(3, '03.In progress')
		 --(4, '04.Ready for QA')
		 --(5, '05.QA rejected')
		 --(6, 'Signed Off')
		 --(7, '07.Draft report sent')
		 --(8, '08.Publishable')
		 --(10, '10.Complete')
GO


