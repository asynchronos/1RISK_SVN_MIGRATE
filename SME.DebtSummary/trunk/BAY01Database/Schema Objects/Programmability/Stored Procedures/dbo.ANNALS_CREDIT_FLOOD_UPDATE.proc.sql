
CREATE  PROCEDURE [dbo].[ANNALS_CREDIT_FLOOD_UPDATE]
		@ID nvarchar(10),
        @IMPACT_TYPE int,
        @OPERATION int,
        @PROGRAM int,
        @IMPACT int,
        @IMPACT_DATE datetime,
        @UPDATE_USER nvarchar(10)
 AS 
 BEGIN 
	UPDATE [dbo].[ANNALS_CREDIT_FLOOD]
    SET [CONCERN_FLOOD]= 1
       ,[IMPACT_TYPE]= @IMPACT_TYPE
       ,[OPERATION]= @OPERATION
       ,[PROGRAM]=@PROGRAM
       ,[IMPACT]=@IMPACT
       ,[IMPACT_DATE]=@IMPACT_DATE
       ,[UPDATE_USER]=@UPDATE_USER
       ,[UPDATE_DATE]= getdate()
	WHERE ID=@ID
  END 




