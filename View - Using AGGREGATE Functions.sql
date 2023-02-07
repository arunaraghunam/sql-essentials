CREATE VIEW dept_stats AS
SELECT d.id, d.[name],
COUNT(e.*) as employeecount,
SUM(e.Salary) as TotalSalary

FROM departments d
INNER JOIN Employee e ON d.id=e.Dept_id
GROUP BY d.id, d.[name];