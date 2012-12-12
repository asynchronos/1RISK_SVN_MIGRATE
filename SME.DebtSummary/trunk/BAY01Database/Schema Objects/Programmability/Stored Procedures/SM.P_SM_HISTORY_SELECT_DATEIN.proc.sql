CREATE  PROCEDURE  [SM].[P_SM_HISTORY_SELECT_DATEIN]
AS
BEGIN
		
  SELECT distinct convert(varchar,[DateIn],103) as datein
      
  FROM [Bay01].[SM].[SM_HISTORY]	
  
  order by datein desc
  
  
END

