
CREATE  PROCEDURE [dbo].[ANNALS_CREDIT_FLOOD_INSERT_NOT_CONCERN]
		@ID nvarchar(10),
        @UPDATE_USER nvarchar(10)
 AS 
 BEGIN 
	INSERT INTO [dbo].[ANNALS_CREDIT_FLOOD]
           ([ID]
           ,[CONCERN_FLOOD]
           ,[UPDATE_USER]
           ,[UPDATE_DATE])
     VALUES
          ( @ID
           ,0
           ,@UPDATE_USER
           ,getdate()
           )
END 




