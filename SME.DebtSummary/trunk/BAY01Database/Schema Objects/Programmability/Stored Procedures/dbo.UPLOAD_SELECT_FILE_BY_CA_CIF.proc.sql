
-- =============================================
-- Author:		pichaya
-- Create date: 16/09/2009
-- Description:	-- ค้นหาไฟล์จาก v_upload_file
-- =============================================
CREATE PROCEDURE [dbo].[UPLOAD_SELECT_FILE_BY_CA_CIF]
	-- Add the parameters for the stored procedure here
    @cif int,
	@id nvarchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	if @cif=Null
	begin
		set @cif=99999999999
	end 
    if @id=Null
	begin
		set @id=''
	end 

	SELECT     TOP (100) PERCENT dbo.V_UPLOADFILE.ID, dbo.V_UPLOADFILE.USER_ID, dbo.V_UPLOADFILE.REMARK, dbo.V_UPLOADFILE.TYPE, 
                      dbo.V_UPLOADFILE.COLL_ID, dbo.V_UPLOADFILE.ANNALS_ID, dbo.V_UPLOADFILE.PATH, dbo.V_UPLOADFILE.CREATE_DATE, 
                      dbo.V_UPLOADFILE.FILE_TYPE
	FROM         dbo.ANNALS_CREDIT_ACCOUNT RIGHT OUTER JOIN
                      dbo.V_UPLOADFILE ON dbo.ANNALS_CREDIT_ACCOUNT.ID = dbo.V_UPLOADFILE.ANNALS_ID
	WHERE     (dbo.ANNALS_CREDIT_ACCOUNT.CIF = @cif) or  (substring(dbo.V_UPLOADFILE.ANNALS_ID,2,5)=@id)
	GROUP BY dbo.V_UPLOADFILE.ID, dbo.V_UPLOADFILE.USER_ID, dbo.V_UPLOADFILE.REMARK, dbo.V_UPLOADFILE.TYPE, dbo.V_UPLOADFILE.COLL_ID, 
                      dbo.V_UPLOADFILE.ANNALS_ID, dbo.V_UPLOADFILE.PATH, dbo.V_UPLOADFILE.CREATE_DATE, dbo.V_UPLOADFILE.FILE_TYPE

END

