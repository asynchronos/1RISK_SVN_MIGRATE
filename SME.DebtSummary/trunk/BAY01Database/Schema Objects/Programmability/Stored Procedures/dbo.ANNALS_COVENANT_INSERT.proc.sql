﻿


	CREATE PROCEDURE [dbo].[ANNALS_COVENANT_INSERT]
		@IDEN int, 
		@CIF int, 
		@COVENANT_TYPE_ID nvarchar(1), 
		@DETAIL nvarchar(500), 
		@CREATE_DATE datetime, 
		@DEADLINE_DATE datetime, 
		@COVENANT_ACTION_ID nvarchar(2), 
		@REMARK nvarchar(500), 
		@ACTION_DATE datetime, 
		@USER_ID nchar(10), 
		@USER_UPDATE_DATE datetime, 
		@ID nvarchar(10),
		@COVENANT_DETAIL_ID nvarchar(3),
		@NEXT_COVENANT_ACTION_ID nvarchar(2), 
		@NEXT_ACTION_DATE datetime
 AS 
 BEGIN 
	 INSERT INTO ANNALS_COVENANT (
		CIF, 
		COVENANT_TYPE_ID, 
		DETAIL, 
		CREATE_DATE, 
		DEADLINE_DATE, 
		COVENANT_ACTION_ID, 
		REMARK, 
		ACTION_DATE, 
		NEXT_COVENANT_ACTION_ID, 
		NEXT_ACTION_DATE, 
		USER_ID, 
		USER_UPDATE_DATE, 
		ID,COVENANT_DETAIL_ID
		) VALUES(
		@CIF,
		@COVENANT_TYPE_ID,
		@DETAIL,
		getdate(),
		@DEADLINE_DATE,
		@COVENANT_ACTION_ID,
		@REMARK,
		@ACTION_DATE,
		@NEXT_COVENANT_ACTION_ID,
		@NEXT_ACTION_DATE,
		@USER_ID,
		getdate(),
		@ID,@COVENANT_DETAIL_ID) 
END 
BEGIN
	IF @COVENANT_ACTION_ID <> '4'
	BEGIN
		UPDATE ANNALS_CREDIT SET COVENANT_FLAG = 1 WHERE ID=@ID
	END
END
SET ANSI_NULLS ON



