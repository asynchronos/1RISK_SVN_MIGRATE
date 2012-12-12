-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Role_Edit_CifInRole]
	-- Add the parameters for the stored procedure here
	@Cif int,
	@Roles varchar(MAX),
	@CategoryId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	BEGIN TRY
		BEGIN TRANSACTION

			-- split ข้อมูลลง Table
			CREATE TABLE #TMP(
				ROLE_ID NUMERIC(5,0) NOT NULL,
			 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
			(
				ROLE_ID ASC
			)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
			) ON [PRIMARY]

			INSERT INTO #TMP
			SELECT DISTINCT CONVERT(NUMERIC(5,0),TXT)
			FROM SPILT_CHAR_TEXT_TO_TABLE_WITH_DELIMITER(@Roles,';')
			--end split ข้อมูลลง Table

			-- Delete ข้อมูลที่มี CIF=CIFส่งมา
			-- และ Role ไม่ได้อยู่ใน List ที่ส่งมา
			DELETE FROM RoleGroup_CifInRole
			WHERE RoleGroup_CifInRole.CIF=@Cif
				AND EXISTS (SELECT *
							FROM RoleGroup_Role AS R
							WHERE R.ROLE_CATEGORY_ID=@CategoryId
								AND R.ROLE_ID=RoleGroup_CifInRole.ROLE_ID)
				AND NOT EXISTS (SELECT *
								FROM #TMP
								WHERE #TMP.ROLE_ID=RoleGroup_CifInRole.ROLE_ID)

			-- Insert Roles
			INSERT INTO RoleGroup_CifInRole
				   ([CIF]
				   ,[ROLE_ID])
			(
			 SELECT @Cif,ROLE_ID
			 FROM #TMP
			 WHERE NOT EXISTS (SELECT *
								FROM RoleGroup_CifInRole AS C_IN_R
								WHERE C_IN_R.CIF=@Cif
									AND C_IN_R.ROLE_ID=#TMP.ROLE_ID)
			 )

			DROP TABLE #TMP
		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		IF @@TRANCOUNT > 0

		ROLLBACK; --RollBack in case of Error

		-- you can Raise ERROR with RAISEERROR() Statement including the details of the exception

		DECLARE @ErrorMessage NVARCHAR(4000);
		DECLARE @ErrorSeverity INT;
		DECLARE @ErrorState INT;

		SELECT @ErrorMessage = ERROR_MESSAGE(),
			   @ErrorSeverity = ERROR_SEVERITY(),
			   @ErrorState = ERROR_STATE();

		-- Use RAISERROR inside the CATCH block to return 
		-- error information about the original error that 
		-- caused execution to jump to the CATCH block.
		RAISERROR (@ErrorMessage, -- Message text.
				   @ErrorSeverity, -- Severity.
				   @ErrorState -- State.
				   );

	END CATCH

END
