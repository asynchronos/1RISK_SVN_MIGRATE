CREATE  PROCEDURE  [SM].[P_SM_HISTORY_DELETE]
@IDEN  int
AS
BEGIN
		
  DELETE 
  FROM [SM].[SM_HISTORY]
  WHERE IDEN=@IDEN
  
END

