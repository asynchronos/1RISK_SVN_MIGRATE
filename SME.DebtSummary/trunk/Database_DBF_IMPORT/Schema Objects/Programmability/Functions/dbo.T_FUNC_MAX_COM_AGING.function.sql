-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION T_FUNC_MAX_COM_AGING 
(	
	-- Add the parameters for the function here
	@CIF int
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	SELECT TABLE1.CIF
		,TABLE1.ACCNO
		,TABLE1.ACCGL
		,TABLE1.AGING
	FROM (SELECT ROW_NUMBER() OVER(PARTITION BY CIF ORDER BY AGING DESC) AS SEQ
			,CIF,ACCNO,ACCGL,AGING
			FROM DBO.LCIdaily
			where CIF <> 0
				AND dbo.FIND_COMMERCIAL_BY_ACCGL(ACCGL) = 'C'
				AND (PRINCIPAL + ACCRU+ SUSP)>0
				AND CIF=@CIF) AS TABLE1
	WHERE SEQ=1
)
