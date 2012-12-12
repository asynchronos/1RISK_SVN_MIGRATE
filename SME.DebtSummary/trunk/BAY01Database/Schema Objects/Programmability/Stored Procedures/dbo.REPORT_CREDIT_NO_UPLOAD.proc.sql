




CREATE PROCEDURE [dbo].[REPORT_CREDIT_NO_UPLOAD]
  @APPTYPE  nvarchar(50),
  @SORTORDER int
 
AS
BEGIN
SET NOCOUNT ON;

--DECLARE @SortOrder  int;
--SET @SortOrder	=2

SELECT  * FROM (	
			SELECT  T.ID,CIF,CUSTOMER,EMPLOYEE,[APP-TYPE] as 'APPTYPE',PROCESS,[APP-DATE] as 'APPDATE',
      			(SELECT  TOP 1 ID  FROM UPLOAD_FILE F WHERE FILE_TYPE =2 AND F.ANNALS_ID=T.ID) as 'FILE2', 
     			(SELECT TOP 1  ID FROM UPLOAD_FILE F WHERE FILE_TYPE =14 AND F.ANNALS_ID=T.ID) as 'FILE14',
                 A.WAITING 
				   --,datediff(d,[APP-DATE],getdate()) as 'PASS_DAY',F.ANNALS_ID
				FROM  dbo.TEMP_REPORT_PRODUCT  T  LEFT OUTER JOIN ANNALS_STATUS  A
                ON   T.ID=A.ID
					  -- หาเอกสารที่มีไฟล์   2. รายงานวิเคราะห์ และ 14.CAอนุมัติครั้งนี้  
				WHERE T.PROCESS_GROUP IN ('C','D','E') AND T.[APP-DATE] > convert(datetime,'01/06/2010',103)
) AS Q 
WHERE (Q.FILE2 is NULL  or Q.FILE14 is NULL)
AND Q.APPTYPE = @APPTYPE

ORDER BY 
                       CASE  WHEN @SORTORDER = 1 THEN Q.APPDATE   END  ASC,
					   CASE  WHEN @SORTORDER = 2 THEN Q.WAITING     END  DESC
						    	

END




