
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE  PROCEDURE [dbo].[Insert_New_Branch_From_Leader] 

AS
BEGIN

INSERT INTO Id_Branch
                      (Id_Branch, Branch_T, Id_Region)
SELECT     Id_Branch, Branch_T, Id_Region
FROM       [LEADER].[CRME].[dbo].[Id_Branch]
WHERE     (Id_Branch NOT IN
                          (SELECT     Id_Branch
                            FROM      Id_Branch AS Id_Branch_1))

END

