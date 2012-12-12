-- =============================================
-- Author:		Prakit Sirisaksathaporn
-- Create date: 2008/01/22
-- Description:	GET_COLUMN_NAME
-- =============================================
CREATE PROCEDURE GET_COLUMN_NAME 
	-- Add the parameters for the stored procedure here
	@TABLE_NAME nvarchar(30)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT COLUMN_NAME --, data_type, character_maximum_length 
	FROM information_schema.columns
	WHERE TABLE_NAME = @TABLE_NAME
END
