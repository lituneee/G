--SELECT FORMAT (getdate(), 'hh tt') Hour
--SELECT FORMAT (getdate(), 'dddd') Date
--SELECT FORMAT (getdate(), 'MMMM') Month
--SELECT FORMAT (getdate(), 'yyyy') Year

DECLARE @dt DATE =CAST('08/29/2023' AS DATE)
DECLARE @format VARCHAR(20);
DECLARE @type VARCHAR(20) = 'WeekNumber'; -- Hour, Date, Month, Year & WeekNumber


SELECT @format = CASE @type
					 WHEN 'Hour'			THEN	'hh tt'
					 WHEN 'Date'			THEN	'dddd'
					 WHEN 'Month'			THEN	'MMMM'
					 WHEN 'Year'			THEN	'yyyy'
					 WHEN 'WeekNumber'		THEN	'WeekNumber'
				END


SELECT x.label, T, COUNT(1) AS RecordCount
FROM (
    SELECT label = IIF(NOT @format = 'WeekNumber', FORMAT (GETDATE(), @format), CASE DATEPART(WEEK, @dt) - DATEPART(WEEK, DATEADD(MONTH, DATEDIFF(MONTH, 0, @dt), 0)) + 1   
        WHEN 1 THEN '1st Week'
        WHEN 2 THEN '2nd Week'
        WHEN 3 THEN '3rd Week'
        WHEN 4 THEN '4th Week'
        WHEN 5 THEN '5th Week'
        WHEN 6 THEN '6th Week'
    END), 'TEST' AS T
) x
GROUP BY x.label, X.T;