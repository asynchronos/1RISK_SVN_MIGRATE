-- =============================================
-- Author:		Prakit Sirisaksathaporn
-- Create date: 2008/01/18
-- Description:	Annals_Insert
-- =============================================
CREATE PROCEDURE [dbo].[Annals_Insert] 
	-- Add the parameters for the stored procedure here
	@ANNALS_TYPE nvarchar(1),
	@SENDER nvarchar(255),
	@RECIVER nvarchar(MAX),
	@REFERENCE nvarchar(100),
	@HEADER nvarchar(100),
	@DETAIL nvarchar(MAX),
	@DEPART_REFER smallint,
	@DATE_IN_ANNALS datetime,
	@ANNALS_SEQ_NO_OUT nvarchar(5) OUTPUT,
	@ANNALS_YEAR_OUT nvarchar(4) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT @ANNALS_YEAR_OUT = year(getdate())

	SELECT @ANNALS_SEQ_NO_OUT = right('00000'+convert(nvarchar(5),ISNULL(MAX(ANNALS_SEQ_NO),0)+1),5)
	FROM ANNALS
	WHERE ANNALS_TYPE = @ANNALS_TYPE
	AND ANNALS_YEAR = @ANNALS_YEAR_OUT

	INSERT INTO [ANNALS] ([ANNALS_TYPE], [ANNALS_SEQ_NO], [ANNALS_YEAR], [SENDER], 
	[RECIVER], [REFERENCE], [HEADER], [DETAIL], [DATE_IN_ANNALS], [ANNALS_CREATE_DATE], 
	[ANNALS_UPDATE_DATE], [DEPART_REFER]) 
	VALUES (@ANNALS_TYPE, @ANNALS_SEQ_NO_OUT, @ANNALS_YEAR_OUT, @SENDER, @RECIVER, @REFERENCE, 
	@HEADER, @DETAIL, @DATE_IN_ANNALS, getdate(), getdate(),@DEPART_REFER)

END
