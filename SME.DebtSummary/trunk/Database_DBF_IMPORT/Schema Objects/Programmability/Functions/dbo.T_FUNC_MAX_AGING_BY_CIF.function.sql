-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION T_FUNC_MAX_AGING_BY_CIF 
(	
	-- Add the parameters for the function here
	@CIF int
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	SELECT TABLE2.CIF,TABLE2.AGING,TABLE2.ACCGL,TABLE2.COM_FLAG
	FROM (SELECT ROW_NUMBER() OVER(PARTITION BY TABLE1.CIF ,TABLE1.COM_FLAG ORDER BY AGING DESC) AS SEQ, TABLE1.*
			FROM (select CIF,AGING,ACCGL,dbo.FIND_COMMERCIAL_BY_ACCGL(ACCGL) AS COM_FLAG
				from DBO.LCIdaily
				where CIF <> 0
				AND (PRINCIPAL + ACCRU+ SUSP)>0
				AND CIF=@CIF) AS TABLE1
			) AS TABLE2
	WHERE SEQ=1
)
