﻿
CREATE PROCEDURE [dbo].[ANNALS_NCB_AUTH2_SELECT]

AS 
BEGIN 
	
    SELECT  EMP_ID,TITLE_NAME + EMPNAME + ' ' + EMPSURNAME as EMP_NAME
	FROM EMPLOYEE01
	WHERE EMP_ID IN ('095448','128678','087668','141051','119016','113308')

END

