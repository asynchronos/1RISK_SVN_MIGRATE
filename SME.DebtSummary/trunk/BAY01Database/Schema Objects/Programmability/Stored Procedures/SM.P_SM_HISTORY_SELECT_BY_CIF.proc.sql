CREATE  PROCEDURE  [SM].[P_SM_HISTORY_SELECT_BY_CIF]
@CIF  int
AS
BEGIN
		
  SELECT 
       IDEN 
      ,[CIF]
      ,[CustomerSize]
      ,[DPD]
      ,[Prin]
      ,[MoveForm]
      ,[DateIn]
      ,[COMMENT]
      
  FROM [Bay01].[SM].[SM_HISTORY]	
  WHERE CIF=@CIF
  ORDER BY DateIn desc
  
END

