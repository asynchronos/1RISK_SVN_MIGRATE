-- =============================================
-- Author:		Prakit Sirisaksathaporn
-- Create date: 2008/01/16
-- Description:	MonthlyByAccountSelected
-- =============================================
CREATE PROCEDURE [dbo].[SP_MonthlyByAccountSelected] 
	-- Add the parameters for the stored procedure here
	@CIF  int ,
	@ACCNO nvarchar(16) ,
	@CONTNO nvarchar(13) ,
	@SEQNO int ,
	@PRINCIPAL nvarchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 'No Monthly Data' AS APP_ID, CONTNO, SEQNO, ISSU_DATE, DUE_DATE, RATE_TYPE, RATE_LOAD, 
	INT_RATE, 'No Monthly Data' AS LPAY_DATE, Pay_PRIN, Pay_INT, Pay_SUSP, Principal, Susp, 
	UNEARNINT, UNEARNPRIN, Accru, AGING 
	FROM ByAccount 
	WHERE (Cif = @CIF) AND (ACCNO = @ACCNO) AND (CONTNO = @CONTNO) 
	AND (SEQNO = @SEQNO) AND (Principal = CONVERT (MONEY, @PRINCIPAL))
END
