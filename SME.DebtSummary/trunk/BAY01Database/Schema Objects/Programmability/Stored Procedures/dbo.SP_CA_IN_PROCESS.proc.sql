-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_CA_IN_PROCESS]
	-- Add the parameters for the stored procedure here
	@EMP_ID nvarchar(10),
	@LEVEL_ID nvarchar(5),
	@SINGLE varchar(3)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    -- Insert statements for procedure here
	IF @SINGLE = 'yes'
		BEGIN
			SELECT	CONVERT(int,OLD_ID) AS OLD_ID, CA_NO_ID, SUBJECT_GROUP, CIF, CUS_NAME, LAST_PROCESS_GROUP, LAST_PROCESS_ID, LAST_PROCESS, CA_CREATE_DATE, 
					LAST_PROCESS_DATE, EMP_ID, EMP_NAME, LEVEL_ID, LEVEL_NAME, Customer_Size, SIZE_DETAIL, SEND_TO_BOARD_DATE, REGION_ID, REGION_NAME
					,dbo.FindWorkingTime(CA_CREATE_DATE, GETDATE(), '08', '30', '17', '30')/(60*60*8.0) AS TIME_USE
			FROM	REPORT67_07_IN_PROCESS AS R67
			WHERE	SEQ = 1 AND EMP_ID = @EMP_ID
			ORDER BY CA_CREATE_DATE
		END
	ELSE
		BEGIN
			SELECT	CONVERT(int,OLD_ID) AS OLD_ID, CA_NO_ID, SUBJECT_GROUP, CIF, CUS_NAME, LAST_PROCESS_GROUP, LAST_PROCESS_ID, LAST_PROCESS, CA_CREATE_DATE, 
					LAST_PROCESS_DATE, EMP_ID, EMP_NAME, LEVEL_ID, LEVEL_NAME, Customer_Size, SIZE_DETAIL, SEND_TO_BOARD_DATE, REGION_ID, REGION_NAME
					,dbo.FindWorkingTime(CA_CREATE_DATE, GETDATE(), '08', '30', '17', '30')/(60*60*8.0) AS TIME_USE
			FROM	REPORT67_07_IN_PROCESS AS R67
			--WHERE	SEQ = 1 AND R67.LEVEL_ID=@LEVEL_ID AND R67.EMP_ID IN (
			--			SELECT DISTINCT EMP_ID
			--			FROM V_Role_EmpInRole_With_Mapping E_IN_R
			--			WHERE E_IN_R.ROLE_ID IN (
			--										SELECT DISTINCT E_IN_R.ROLE_ID
			--										FROM V_Role_EmpInRole_With_Mapping E_IN_R INNER JOIN RoleGroup_Role R ON R.ROLE_ID = E_IN_R.ROLE_ID
			--										WHERE R.ROLE_CATEGORY_ID = 4 AND EMP_ID = @EMP_ID
			--									)
			--		)
			WHERE	SEQ = 1 AND R67.LEVEL_ID=@LEVEL_ID
			ORDER BY CA_CREATE_DATE
		END
END
