


-- =============================================
-- Author:		Prakit
-- Create date: 21 Jul 2008
-- Update date: 19 Jul 2009
-- =============================================
CREATE PROCEDURE [dbo].[SP_CUSTOMER_SME_SELECT_BY_CM] 
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
					,SME.CUSTOMER_NAME
					,SME.BRANCH_NAME
					,SME.GROUP_SIZE_DETAIL
					,SME.CM_CODE
					,SME.GROUP_ID
					,SME.GROUP_SIZE_ID
					,SME.JUDGEMENT_ID
					,SME.JUDGEMENT_DETAIL
					,SME.BUSI_RISK1_ID
					,SME.BUSI_RISK1_DETAIL
			FROM CUSTOMER_SME02_01_WITH_LEVEL AS SME 
				INNER JOIN (SELECT DISTINCT T.[CM_CODE] 
							FROM #TMP AS T) AS CM ON CM.[CM_CODE] = SME.[CM_CODE]
			WHERE STATUS_ID = 1
			ORDER BY GROUP_ID,GROUP_SIZE_ID,SME.CIF

			DROP TABLE #TMP
		END

END












