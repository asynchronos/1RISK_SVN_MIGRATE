-- =============================================
-- Author:		Prakit Sirisaksathaporn
-- Create date: 2008/01/18
-- Description:	Annals_Update
-- =============================================
CREATE PROCEDURE [dbo].[Annals_Update] 
	-- Add the parameters for the stored procedure here
	@SENDER nvarchar(255),
	@RECIVER nvarchar(MAX),
	@REFERENCE nvarchar(100),
	@HEADER nvarchar(100),
	@DETAIL nvarchar(MAX),
	@DEPART_REFER smallint,
	@DATE_IN_ANNALS datetime,
	@original_ANNALS_TYPE nvarchar(1),
	@original_ANNALS_SEQ_NO nvarchar(5),
	@original_ANNALS_YEAR nvarchar(4),
	@original_SENDER nvarchar(255),
	@original_RECIVER nvarchar(MAX),
	@original_REFERENCE nvarchar(100),
	@original_HEADER nvarchar(100),
	@original_DETAIL nvarchar(MAX),
	@original_DEPART_REFER smallint,
	@original_DATE_IN_ANNALS datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE [ANNALS] SET [SENDER] = @SENDER, [RECIVER] = @RECIVER, [REFERENCE] = @REFERENCE, 
	[HEADER] = @HEADER, [DETAIL] = @DETAIL, [DATE_IN_ANNALS] = @DATE_IN_ANNALS, 
	[ANNALS_UPDATE_DATE] = getdate(), [DEPART_REFER] = @DEPART_REFER 
	WHERE [ANNALS_TYPE] = @original_ANNALS_TYPE 
	AND [ANNALS_SEQ_NO] = @original_ANNALS_SEQ_NO 
	AND [ANNALS_YEAR] = @original_ANNALS_YEAR 
END
