



CREATE    PROCEDURE [dbo].[REPORT_CREDIT_NO_UPLOAD_V2]
  @StartRow  int,
  @EndRow   int,
  @selectAuth nvarchar(50) 
AS
BEGIN
SET NOCOUNT ON;

-- procedure นี้จะ return data กลับไป 2 ชุด
-- ชุดแรกเป็น data และ ชุดที่สองเป็นจำนวน แถว
SELECT * FROM ( 
	SELECT  ROW_NUMBER() OVER (ORDER BY  APPDATE) AS row_num ,*  FROM  V_REPORT_CREDIT_NO_UPLOAD
	WHERE (FILE2 is NULL  or  FILE14 is NULL)
	AND APPTYPE=@selectAuth 
) AS Q1
WHERE Q1.row_num>=@StartRow AND Q1.row_num<=@EndRow 

;

SELECT COUNT(*) AS row_count FROM ( 
	SELECT  *  FROM  V_REPORT_CREDIT_NO_UPLOAD
	WHERE (FILE2 is NULL  or  FILE14 is NULL)
	AND APPTYPE=@selectAuth
) AS Q1


END









