-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_CUSTOMER_SME_SIZE_GetAll]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [SIZE_ID]
		  ,[SIZE_DETAIL]
		  ,[PRIORITY]
	  FROM [CUSTOMER_SME_SIZE]
	ORDER BY PRIORITY
END
