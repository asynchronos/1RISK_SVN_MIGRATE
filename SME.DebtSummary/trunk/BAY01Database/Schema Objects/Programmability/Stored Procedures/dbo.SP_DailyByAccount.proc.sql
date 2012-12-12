-- =============================================
-- Author:		Prakit Sirisaksathaporn
-- Create date: 2008/01/16
-- Description:	DailyByAccount
-- =============================================
CREATE PROCEDURE [dbo].[SP_DailyByAccount] 
	-- Add the parameters for the stored procedure here
	@CIF  int ,
	@ACCNO nvarchar(16)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT     TOP (100) PERCENT dbo.Detail_ByAcc.CIF, dbo.GetName(CUS.CUS_TITLE, CUS.CUS_FIRST, CUS.CUS_LAST) AS [Name], dbo.Detail_ByAcc.Branch, 
                      dbo.Detail_ByAcc.AccGL, dbo.Detail_ByAcc.ACCNO, dbo.Detail_ByAcc.CONTNO, dbo.Detail_ByAcc.SEQNO, dbo.Detail_ByAcc.AGING, 
                      dbo.Detail_ByAcc.Limit, dbo.Detail_ByAcc.Principal, dbo.Detail_ByAcc.Accru, dbo.Detail_ByAcc.Susp, dbo.Detail_ByAcc.PAY_PRIN, 
                      dbo.Detail_ByAcc.PAY_INT, dbo.Detail_ByAcc.PAY_SUSP, dbo.Detail_ByAcc.LPAY_DATE, dbo.CIMfms.DECB_RD
	FROM         dbo.Detail_ByAcc INNER JOIN
						  dbo.CIMfms ON dbo.Detail_ByAcc.AccGL = dbo.CIMfms.ACCGL INNER JOIN
						  dbo.CUSTOMER AS CUS ON dbo.Detail_ByAcc.CIF = CUS.CIF
	WHERE     (dbo.Detail_ByAcc.CIF = @CIF) AND (dbo.Detail_ByAcc.ACCNO = @ACCNO)
	ORDER BY dbo.Detail_ByAcc.CONTNO, dbo.Detail_ByAcc.SEQNO, dbo.Detail_ByAcc.Principal
END
