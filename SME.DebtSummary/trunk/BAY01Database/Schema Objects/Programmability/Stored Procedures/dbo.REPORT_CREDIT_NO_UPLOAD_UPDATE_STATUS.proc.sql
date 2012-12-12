

CREATE  PROCEDURE [dbo].[REPORT_CREDIT_NO_UPLOAD_UPDATE_STATUS]
  @ID  nvarchar(10),
  @ACTION  nvarchar(5)
 
AS
BEGIN
	SET NOCOUNT ON;
	--  @ACTION ดูว่าเป็นกานเพิ่มหรือลบ  add,del
    IF @ACTION='add'
    BEGIN
		INSERT INTO  ANNALS_STATUS  VALUES(@ID,1)
    END
	IF @ACTION='del'
    BEGIN
		DELETE FROM ANNALS_STATUS  WHERE ID=@ID
	END

END



