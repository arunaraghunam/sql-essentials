CREATE PROCEDURE sp_CalculateLearnerGrades
AS
BEGIN
    SET NOCOUNT ON;

    -- Assuming a table structure like:
    -- ExamResults (LearnerID INT, Score INT, TotalMarks INT, Grade CHAR(2))

    UPDATE ExamResults
    SET Grade = 
        CASE 
            WHEN (Score * 100.0 / TotalMarks) >= 90 THEN 'A'
            WHEN (Score * 100.0 / TotalMarks) >= 80 THEN 'B'
            WHEN (Score * 100.0 / TotalMarks) >= 70 THEN 'C'
            WHEN (Score * 100.0 / TotalMarks) >= 60 THEN 'D'
            ELSE 'F'
        END;
END;








