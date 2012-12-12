-- =============================================
-- Author:		Prakit Sirisaksathaporn
-- Create date: 2008/01/16
-- Description:	MonthlyByAccount
-- =============================================
CREATE PROCEDURE [dbo].[SP_MonthlyByAccount] 
	-- Add the parameters for the stored procedure here
	@CIF  int ,
	@ACCNO nvarchar(16)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT     TOP (100) PERCENT dbo.ByAccount.Cif,dbo.getName(CUS.CUS_TITLE, CUS.CUS_FIRST, CUS.CUS_LAST) AS [Name], dbo.ByAccount.Branch, dbo.ByAccount.ACCGL, dbo.ByAccount.ACCNO, dbo.ByAccount.CONTNO, 
                      dbo.ByAccount.SEQNO, dbo.ByAccount.AGING, dbo.ByAccount.Limit, dbo.ByAccount.Principal, dbo.ByAccount.Accru, dbo.ByAccount.Susp, 
                      dbo.ByAccount.Pay_PRIN, dbo.ByAccount.Pay_INT, dbo.ByAccount.Pay_SUSP, 'No Monthly Data' AS LPAY_DATE, dbo.CIMfms.DECB_RD
	FROM         dbo.ByAccount INNER JOIN
						  dbo.CIMfms ON dbo.ByAccount.ACCGL = dbo.CIMfms.ACCGL INNER JOIN
						  dbo.CUSTOMER AS CUS ON dbo.ByAccount.Cif = CUS.CIF
	WHERE     (dbo.ByAccount.Cif = @CIF) AND (dbo.ByAccount.ACCNO = @ACCNO)
	ORDER BY dbo.ByAccount.CONTNO, dbo.ByAccount.SEQNO, dbo.ByAccount.Principal
END
