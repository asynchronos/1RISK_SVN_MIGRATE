﻿
	CREATE PROCEDURE [dbo].[ANNALS_COVENANT_DELETE]
		@IDEN int,
		@ID nvarchar(10)
AS 
BEGIN 
	
DELETE  FROM ANNALS_COVENANT WHERE IDEN=@IDEN
	
declare @N int
	
	set @N = (Select count(*) from ANNALS_COVENANT where ID=@ID)
	IF @N < 1
	BEGIN
		UPDATE ANNALS_CREDIT SET COVENANT_FLAG = 0 WHERE ID=@ID
	END
END
