-- Create Table to load data from Text file to SQL Table

USE SSIS
GO

CREATE TABLE FolderPath
(
ID int,
FilePath varchar(200),
[Filename] varchar(100)
)

INSERT INTO FolderPath
VALUES (1, 'C:\Users\Aruna Raghunam\Desktop\SSIS\SSIS Practice\ForLoop\Month\','Month*.txt')
,(2, 'C:\Users\Aruna Raghunam\Desktop\SSIS\SSIS Practice\ForLoop\Week\','Week*.txt')
,(3, 'C:\Users\Aruna Raghunam\Desktop\SSIS\SSIS Practice\ForLoop\Qtr\','Qtr*.txt')