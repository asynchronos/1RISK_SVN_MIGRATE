-- =============================================
-- Author:		Prakit Sirisaksathaporn
-- Create date: 2008/01/16
-- Description:	DailyByAccountSelected
-- =============================================
CREATE PROCEDURE [dbo].[SP_DailyByAccountSelected] 
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
	SELECT APP_ID, CONTNO, SEQNO, ISSU_DATE, CONVERT(datetime,DUE_DATE,101) AS DUE_DATE, RATE_TYPE, RATE_LOAD, INT_RATE, LPAY_DATE, PAY_PRIN, PAY_INT, PAY_SUSP, 
	Principal, Susp, UNEARNINT, UNEARNPRIN, Accru, AGING 
	FROM Detail_ByAcc 
	WHERE (CIF = @CIF) AND (ACCNO = @ACCNO) AND (CONTNO = @CONTNO) AND (SEQNO = @SEQNO) AND PRINCIPAL=CONVERT(MONEY,@PRINCIPAL)
END
