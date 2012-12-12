
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[P_CHECK_RATING_UPDATE_DATE_OLDER_BY_CA] 
	-- Add the parameters for the stored procedure here
	@CA_OLD_ID nvarchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT R.OLD_ID, R.CIF
	FROM	(
				-- FIND ALL CIF MUST HAS CHECK IN CA
				SELECT DISTINCT CA.OLD_ID, CA.CIF
				FROM REPORT07_SUMMARY CA
				WHERE CA.OLD_ID = @CA_OLD_ID
				UNION -- CIF FROM CA (MAY BE NEW SME AND NOT HAS GROUP_ID) WITH CIF FROM GROUP_ID
				SELECT T.OLD_ID,SME.CIF
				FROM CUSTOMER_SME SME CROSS JOIN REPORT07_SUMMARY T
				WHERE EXISTS(	-- FIND GROUP_ID BY CIF
								SELECT DISTINCT GROUP_ID
								FROM CUSTOMER_SME C
								WHERE EXISTS(	-- FIND CIF IN CA
												SELECT DISTINCT CIF 
												FROM REPORT07_SUMMARY RS 
												WHERE RS.CIF = C.CIF 
													AND RS.OLD_ID = @CA_OLD_ID
											)
									AND C.GROUP_ID = SME.GROUP_ID
							)
					AND T.OLD_ID = @CA_OLD_ID
			) R LEFT OUTER JOIN CUSTOMER_SME CS
		ON R.CIF = CS.CIF
	WHERE R.OLD_ID = @CA_OLD_ID
		-- check rating update is older than 1 month or not
		AND DATEDIFF(day
				,ISNULL(CS.RATING_UPDATE_DATE, DATEADD(Month,-1,GETDATE()))
				,GETDATE()
				) >= 30
END

