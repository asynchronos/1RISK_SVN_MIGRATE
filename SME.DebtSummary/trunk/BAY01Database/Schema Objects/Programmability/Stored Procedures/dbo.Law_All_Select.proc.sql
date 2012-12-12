-- =============================================
-- Author:		Prakit Sirisaksathaporn
-- Create date: 2008/01/09
-- Description:	Law_All_Select
-- =============================================
CREATE PROCEDURE [dbo].[Law_All_Select] 
	-- Add the parameters for the stored procedure here
	@CIF_NO int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT CIF_NO, NAME, Id_CLine, CLineS, Id_BR2, BR2_Name, Count_Id_BR2, 
	LOM, C3_New, C33, C4_New, C44, isnull(FUND,0) as FUND, Id_4100, NOU, 
	PHO, RED2, DARA, isnull(CHAR2,0) as CHAR2, [4100_Detail], BR, Id_Branch, 
	Branch, AC, ACNO, ACCNO, Id_TAN, Tan_Name, Tan_Tel, 
	CASE id_branch WHEN 988 THEN br ELSE '' END AS OLD_BRANCH 
	FROM Law_ALL WHERE (CIF_NO = @CIF_NO)
END
