-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[P_SME_RATING_TYPE_GetAll]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [RATING_TYPE_KEY]
		  ,[RATING_TYPE_DESC]
	  FROM [CUSTOMER_SME_RATING_TYPE]
	ORDER BY [PRIORITY]
END
