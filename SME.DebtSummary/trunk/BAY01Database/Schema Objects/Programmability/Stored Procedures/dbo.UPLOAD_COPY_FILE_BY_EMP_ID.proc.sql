
-- =============================================
-- Author:		pichaya
-- Create date: 16/09/2009
-- Description:	-- ค้นหาไฟล์จาก v_upload_file
-- =============================================
CREATE   PROCEDURE [dbo].[UPLOAD_COPY_FILE_BY_EMP_ID]
	-- Add the parameters for the stored procedure here
	@emp_id nvarchar(10),
    @date1 nvarchar(10),
	@date2 nvarchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

    if @emp_id=Null
	begin
		set @emp_id=''
	end 

SELECT  distinct  *  
FROM  V_UPLOADFILE_APPROVE 
WHERE     ([APPROVE] = 1)  AND 
                      ([PROCESS_GROUP] = 'D') AND
                    --  ([FILE_TYPE] = 1) AND
					  ([EMP_APPROVE_ID]= @emp_id ) 
					  AND   ([APP-DATE] between @date1 and @date2)

END







