-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  [dbo].[INSERTLOG] 
	-- Add the parameters for the stored procedure here
	@IP nvarchar(20),
	@USERNAME nvarchar(20),
    @LOG_TYPE_ID int,
	@ID nvarchar(20)
AS
BEGIN

	SET NOCOUNT ON;

     insert into TB_LOG (TRANDATE,IP,USERNAME,LOG_TYPE_ID,ID) values(getdate(),@IP,@USERNAME,@LOG_TYPE_ID,@ID)
END
