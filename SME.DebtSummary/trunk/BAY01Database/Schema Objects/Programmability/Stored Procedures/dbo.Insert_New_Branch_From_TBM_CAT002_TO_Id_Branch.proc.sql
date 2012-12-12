-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE Insert_New_Branch_From_TBM_CAT002_TO_Id_Branch 

AS
BEGIN

	Insert into Id_Branch(Id_Branch,Branch_T,Branch_E,Id_Region) 
select IBRNO as 'Id_Branch',
       NBRTHAI as 'Branch_T' ,
       NBRENG as 'Branch_E'  ,
       IAREA  as 'Id_Region' from TBM_CAT002
Where IBRNO not in (select Id_Branch from Id_Branch)

END
