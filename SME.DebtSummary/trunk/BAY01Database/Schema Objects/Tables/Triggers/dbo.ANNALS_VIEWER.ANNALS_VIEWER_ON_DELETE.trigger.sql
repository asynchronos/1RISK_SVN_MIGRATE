-- =============================================
-- Author:		Prakit Sirisaksathaporn
-- Create date: 2008/02/26
-- Description:	TRIGGER ANNALS_VIEWER_ON_DELETE
-- =============================================
CREATE TRIGGER ANNALS_VIEWER_ON_DELETE 
   ON  ANNALS_VIEWER 
   AFTER DELETE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO ANNALS_VIEWER_DELETED
	SELECT ANNALS_TYPE,ANNALS_SEQ_NO,ANNALS_YEAR,EMP_ID,getdate() as DELETE_DATE,CREATE_DATE FROM DELETED

END
