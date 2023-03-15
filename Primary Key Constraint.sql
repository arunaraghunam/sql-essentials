CREATE TABLE [dbo].[Student]
(
StudentID int NOT NULL,
StudName varchar(20) NOT NULL,
DateofBirth date
)

INSERT INTO [dbo].[Student] VALUES (101, 'Gary', '29-01-1990')

INSERT INTO [dbo].[Student] VALUES (102, 'John', '03-11-1989')

CREATE TABLE [dbo].[Student1]
(
StudentID int NOT NULL,
StudName varchar(20) NOT NULL,
Email nvarchar(50) NULL
)

ALTER TABLE Student1
ADD PRIMARY KEY (StudentID)

INSERT INTO Student1 VALUES (201, 'Mary', 'Mary@gmail.com')
INSERT INTO Student1 VALUES (201, 'Tim', 'tIM@GMAIL.COM')
--O/P gives PK violation error

INSERT INTO Student1 VALUES (202, 'Tim', 'tIM@GMAIL.COM')