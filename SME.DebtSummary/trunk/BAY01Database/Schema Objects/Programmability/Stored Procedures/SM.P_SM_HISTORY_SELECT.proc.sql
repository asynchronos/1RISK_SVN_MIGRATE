CREATE  PROCEDURE  [SM].[P_SM_HISTORY_SELECT]
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
  
  
END

