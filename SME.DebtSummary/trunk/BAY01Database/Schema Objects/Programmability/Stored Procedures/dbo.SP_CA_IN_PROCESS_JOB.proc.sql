-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_CA_IN_PROCESS_JOB]
	-- Add the parameters for the stored procedure here
	@EMP_ID varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    -- Insert statements for procedure here
	SELECT COUNT(DISTINCT OLD_ID) AS ToTalProcessCA 
	FROM REPORT67_07_IN_PROCESS 
	WHERE (EMP_ID = @EMP_ID)
END
