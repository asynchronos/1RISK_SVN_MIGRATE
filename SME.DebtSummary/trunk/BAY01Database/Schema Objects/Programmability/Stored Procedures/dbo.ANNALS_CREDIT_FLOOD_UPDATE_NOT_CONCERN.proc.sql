
CREATE  PROCEDURE [dbo].[ANNALS_CREDIT_FLOOD_UPDATE_NOT_CONCERN]
		@ID nvarchar(10),
        @UPDATE_USER nvarchar(10)
 AS 
 BEGIN 
	UPDATE [dbo].[ANNALS_CREDIT_FLOOD]
    SET [CONCERN_FLOOD]= 0
       ,[IMPACT_TYPE]= null
       ,[OPERATION]= null
       ,[PROGRAM]=null
       ,[IMPACT]=null
       ,[IMPACT_DATE]=null
       ,[UPDATE_USER]=@UPDATE_USER
       ,[UPDATE_DATE]= getdate()
	WHERE ID=@ID
  END 




