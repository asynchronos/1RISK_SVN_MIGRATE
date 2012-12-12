CREATE PROCEDURE  [SM].[P_SM_HISTORY_INSERT]
	@CIF money,
	@CustomerSize nvarchar(50),
	@DPD	money,
	@Prin	money,
	@MoveForm nvarchar(50)
AS
BEGIN
	INSERT INTO [SM].[SM_HISTORY]
           ([CIF]
           ,[CustomerSize]
           ,[DPD]
           ,[Prin]
           ,[MoveForm]
           ,[DateIn])
     VALUES
           (@CIF
           ,@CustomerSize
           ,@DPD
           ,@Prin
           ,@MoveForm
           ,getdate())
END

