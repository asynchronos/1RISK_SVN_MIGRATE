


-- =============================================
-- Author:		Prakit
-- Create date: 20 Feb 2009
-- Update date: 24 Feb 2009
-- Description:	CUSTOMER_SME_SELECT_BY_CM_EXPORT
-- =============================================
CREATE PROCEDURE [dbo].[SP_CUSTOMER_SME_SELECT_BY_CM_EXPORT] 
	-- Add the parameters for the stored procedure here
	@CM_CODE nvarchar(MAX)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	-- Insert statements for procedure here
	IF (@CM_CODE IS NULL) OR (@CM_CODE = '') OR (@CM_CODE = '0')
		BEGIN
			SELECT CIF, CUSTOMER_NAME, BRANCH_NAME, GROUP_SIZE_DETAIL, CM_CODE 
			FROM CUSTOMER_SME02_01_WITH_LEVEL 
			WHERE (CM_CODE IS NULL)
			ORDER BY GROUP_ID,GROUP_SIZE_ID,CIF
		END
	ELSE
		BEGIN

			CREATE TABLE #TMP(
				[CM_CODE] [nvarchar](10) COLLATE Thai_CI_AS NOT NULL,
			 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
			(
				[CM_CODE] ASC
			)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
			) ON [PRIMARY]

			INSERT INTO #TMP
			SELECT DISTINCT TXT 
			FROM SPILT_CHAR_TEXT_TO_TABLE_WITH_DELIMITER(@CM_CODE,';')

			SELECT SME.CIF
					,SME.GROUP_ID
					,SME.CUSTOMER_NAME
					,SME.CUSTOMER_NAME2
					,SME.CUSTOMER_NAME_E
					,SME.CUSTOMER_NAME_E2
					,SME.BaySize					
					,SME.AGING
					,SME.Class
					,SME.JUDGEMENT_DETAIL
					,SME.BRANCH_NAME
					,SME.Region_Name
					,SME.CONTROLLING_UNIT
					,SME.CONTROLLING_UNIT_E
					,SME.REGION_CONTROLLING_UNIT
					,SME.Rating
					,SME.Tdr
					,SME.GROUP_SIZE_DETAIL
					,SME.Principal
					,SME.Accru
					,SME.Susp
					,SME.Contingent
					,SME.UseValue
					,SME.Totresv
					,SME.Full_IAS39
					,SME.ResvFull
					,SME.BUSI_RISK1_DETAIL
					,SME.CM_NAME
					,dbo.getName(EMP.TITLE_NAME_E + '.', EMP.EMPNAME_E, EMP.EMPSURNAME_E) AS CM_NAME_E
					,SME.PASS_LEADER
 
			FROM CUSTOMER_SME04_03_WATCH_LIST_STATUS AS SME INNER JOIN
                      EMPLOYEE01 AS EMP ON SME.CM_CODE = EMP.EMP_ID
			WHERE EXISTS (SELECT T.[CM_CODE] 
							FROM #TMP AS T
							WHERE T.[CM_CODE] = SME.CM_CODE)
				AND STATUS_ID = 1
			ORDER BY SME.GROUP_ID,SME.GROUP_SIZE_ID,SME.CIF
		END

END

