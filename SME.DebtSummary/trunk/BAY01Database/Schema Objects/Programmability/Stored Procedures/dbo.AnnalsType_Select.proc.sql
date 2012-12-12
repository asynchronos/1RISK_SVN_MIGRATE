-- =============================================
-- Author:		Prakit Sirisaksathaporn
-- Create date: 2008/01/21
-- Description:	AnnalsType_Select
-- =============================================
CREATE PROCEDURE AnnalsType_Select
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT ANNALS_TYPE.* 
	FROM ANNALS_TYPE
END
