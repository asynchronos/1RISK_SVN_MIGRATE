
CREATE  PROCEDURE [dbo].[ANNALS_CREDIT_FLOOD_INSERT]
		@ID nvarchar(10),
        @IMPACT_TYPE int,
        @OPERATION int,
        @PROGRAM int,
        @IMPACT int,
        @IMPACT_DATE datetime,
        @UPDATE_USER nvarchar(10)
 AS 
 BEGIN 
	INSERT INTO [dbo].[ANNALS_CREDIT_FLOOD]
           ([ID]
           ,[CONCERN_FLOOD]
           ,[IMPACT_TYPE]
           ,[OPERATION]
           ,[PROGRAM]
           ,[IMPACT]
           ,[IMPACT_DATE]
           ,[UPDATE_USER]
           ,[UPDATE_DATE])
     VALUES
          ( @ID
           ,1
           ,@IMPACT_TYPE
           ,@OPERATION
           ,@PROGRAM
           ,@IMPACT
           ,@IMPACT_DATE
           ,@UPDATE_USER
           ,getdate()
           )
END 




