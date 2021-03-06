CREATE  PROCEDURE  [SM].[P_SM_HISTORY_SELECT_BY_IDEN]
@IDEN  int
AS
BEGIN
		
  SELECT 
       IDEN 
      ,H.[CIF]
      ,[CustomerSize]
      ,S.CM_NAME
      ,[DPD]
      ,[Prin]
      ,[MoveForm]
      ,[DateIn]
      ,[COMMENT]
      , CIFNAME
  FROM [BAY01].[SM].[SM_HISTORY] H	
	   LEFT OUTER JOIN  [CUSTOMER_INFO] C
			ON H.CIF = C.CIF
	   LEFT OUTER JOIN  [CUSTOMER_SME01_VIEW] S
			ON H.CIF = S.CIF			
  WHERE IDEN=@IDEN
  
END

