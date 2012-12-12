
-- =============================================
-- Author:		SSPT
-- Create date: 26-08-2008
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[GET_CIFINFO]
	-- Add the parameters for the stored procedure here
	@cif Nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT cif,
	Cus_Title,
	cifname,
	ciftype,
	ISNULL(botid,0) botid,
	cus_type,
	BUSI_TYPE,
	Busi_name,
	class as cifClass,
	idcard,
	OFFICR_ID,
	DEPTFLAG,
	DEPTTRAN,
	ISNULL(DepartName,'')DepartName,
	CUS_FIRST,
	CUS_LAST
	FROM View_CifInfo
	WHERE cif = @cif 
END

