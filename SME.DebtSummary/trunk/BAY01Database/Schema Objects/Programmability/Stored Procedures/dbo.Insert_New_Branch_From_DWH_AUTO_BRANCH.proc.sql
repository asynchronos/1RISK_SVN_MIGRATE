-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Insert_New_Branch_From_DWH_AUTO_BRANCH] 
AS
BEGIN
INSERT INTO Id_Branch
                     (Id_Branch, Branch_T, Id_Region)
select  BRANCH_CODE,BRANCH_NAME_THAI,REGION_CODE
from  EDW..DWHADMIN.AUTO_BRANCH 
WHERE     (BRANCH_CODE NOT IN
                          (SELECT     Id_Branch
                            FROM      Id_Branch))

END
