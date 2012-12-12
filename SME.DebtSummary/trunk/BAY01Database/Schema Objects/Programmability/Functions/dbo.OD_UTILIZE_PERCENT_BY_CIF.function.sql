-- =============================================
-- Author:		Prakit Sirisaksathaporn
-- Create date: 11 DEC 2008
-- Description:	ใช้หาค่า %Utilize สูงสุดของแต่ละ CIF
-- =============================================
CREATE FUNCTION [OD_UTILIZE_PERCENT_BY_CIF] 
(
	-- Add the parameters for the function here
	@CIF int
)
RETURNS smallmoney
AS
BEGIN
	-- Declare the return variable here
	DECLARE @RESULT smallmoney

	-- Add the T-SQL statements to compute the return value here
	SELECT @RESULT=NEW_OD.PERCENT_UTILIZE
	FROM (SELECT ROW_NUMBER() OVER(PARTITION BY CIF ORDER BY (UTILIZ_AVG*100)/(LIM_AVG) DESC) AS SEQ
			  ,[accno]
			  ,[cif]
			  ,(UTILIZ_AVG*100)/(LIM_AVG) AS PERCENT_UTILIZE
			  ,[name]
			  ,[mvmdr_avg]
			  ,[mvmcr_avg]
			  ,[utiliz_avg]
			  ,[maxbalavg]
			  ,[minbalavg]
			  ,[LIM_AVG]
			  ,[run_date]
		  FROM [Bay01_test].[dbo].[REP_OD]) AS NEW_OD
	WHERE SEQ=1 AND CIF=@CIF

	-- Return the result of the function
	RETURN @RESULT

END
