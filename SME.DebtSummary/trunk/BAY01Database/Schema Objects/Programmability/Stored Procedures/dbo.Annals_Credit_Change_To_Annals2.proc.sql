-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE Annals_Credit_Change_To_Annals2
@ID nvarchar(5),
@Year nvarchar(4)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	EXEC Annals_Credit_Change_To_Annals @ID,@Year,'เรื่องอื่นๆ','เปลี่ยนจากหนังสือสินเชื่อเป็นหนังสือทั่วไป';
END
