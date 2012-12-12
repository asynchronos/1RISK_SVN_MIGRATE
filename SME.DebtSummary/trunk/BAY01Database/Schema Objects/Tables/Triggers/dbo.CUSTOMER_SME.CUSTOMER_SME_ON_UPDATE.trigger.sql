-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[CUSTOMER_SME_ON_UPDATE]
   ON  dbo.CUSTOMER_SME
   AFTER UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- เก็บข้อมูลลง History
    -- Insert statements for trigger here
	INSERT INTO [CUSTOMER_SME_HISTORY]
           ([CIF]
           ,[UPDATE_DATE]
           ,[JUDGEMENT_ID]
           ,[CM_CODE]
           ,[UPDATE_BY])
     (SELECT D.[CIF]
           ,D.[UPDATE_DATE]
           ,D.[JUDGEMENT_ID]
           ,D.[CM_CODE]
           ,D.[UPDATE_BY]
	FROM DELETED AS D INNER JOIN INSERTED AS I
		ON I.CIF = D.CIF
	WHERE (I.[JUDGEMENT_ID] <> D.[JUDGEMENT_ID])
	)

	-- TRIGGER FOR UPDATE ROLE
	DECLARE @CIF int;
	DECLARE @BRANCH_VALUE numeric(5,0);
	DECLARE @REGION_VALUE numeric(5,0);
	DECLARE @EMPID_VALUE nvarchar(10);

	DECLARE @OLD_EMPID_VALUE nvarchar(10);

	SELECT @OLD_EMPID_VALUE = CM_CODE
	FROM DELETED

	SELECT @CIF = I.CIF
			,@BRANCH_VALUE = I.BRANCH_ID
			,@REGION_VALUE = Id_Branch.Id_Region
			,@EMPID_VALUE = I.CM_CODE
	FROM INSERTED AS I INNER JOIN Id_Branch ON I.BRANCH_ID = Id_Branch.Id_Branch

	-- DELETE ROLE ของ CIF เฉพาะ Branch กับ Region(Category 2 และ 3 ตามลำดับเพราะ Branch กับ Region จะมีได้เพียงอย่างล่ะ 1)
	-- ส่วน EMP_ID(Category 1) จะลบเฉพาะที่เป็น CM_CODE เก่า
	DELETE FROM [RoleGroup_CifInRole] 
	WHERE EXISTS (SELECT C_IN_R.ID
					FROM [RoleGroup_CifInRole] AS C_IN_R INNER JOIN [RoleGroup_Role] AS R
						ON C_IN_R.ROLE_ID = R.ROLE_ID
					WHERE (C_IN_R.CIF = @CIF)
						AND (C_IN_R.ID = [RoleGroup_CifInRole].ID)
						AND (R.ROLE_CATEGORY_ID = 2 OR R.ROLE_CATEGORY_ID = 3
	-- SELECT CM_CODE เก่าขึ้นมาเพื่อลบ
								OR (R.ROLE_CATEGORY_ID = 1 AND R.ROLE_VALUE = @OLD_EMPID_VALUE))
				)

	-- INSERT new Role type EMP_ID
	INSERT INTO [RoleGroup_CifInRole]
			   ([CIF]
			   ,[ROLE_ID])
		(SELECT @CIF
				,R.ROLE_ID
		   FROM [RoleGroup_Role] AS R
		  WHERE R.ROLE_VALUE = @EMPID_VALUE
				AND R.ROLE_CATEGORY_ID = 1
		)

	-- INSERT new Role type Banch
	INSERT INTO [RoleGroup_CifInRole]
			   ([CIF]
			   ,[ROLE_ID])
		(SELECT @CIF
				,R.ROLE_ID
		   FROM [RoleGroup_Role] AS R
		  WHERE R.ROLE_VALUE = @BRANCH_VALUE
				AND R.ROLE_CATEGORY_ID = 2
		)

	-- INSERT new Role type Region
	INSERT INTO [RoleGroup_CifInRole]
			   ([CIF]
			   ,[ROLE_ID])
		(SELECT @CIF
				,R.ROLE_ID
		   FROM [RoleGroup_Role] AS R
		  WHERE R.ROLE_VALUE = @REGION_VALUE
				AND R.ROLE_CATEGORY_ID = 3
		)


END
