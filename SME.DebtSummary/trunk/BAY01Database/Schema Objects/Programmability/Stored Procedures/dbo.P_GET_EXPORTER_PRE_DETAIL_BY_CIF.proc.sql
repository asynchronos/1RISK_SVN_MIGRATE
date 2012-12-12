
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[P_GET_EXPORTER_PRE_DETAIL_BY_CIF] 
	-- Add the parameters for the stored procedure here
	@CIF int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT     Cus.CIF, CASE LEN(Cus.CFIRST_E) WHEN 0 THEN dbo.GetName(Cus.CUS_TITLE, Cus.CUS_FIRST, Cus.CUS_LAST) 
                      ELSE dbo.GetNameEng(Cus.CTITLE_E, Cus.CFIRST_E, Cus.CLAST_E) END AS Name, 
                      dbo.BUSINESS_TYPE_4.DESCRIPTION_EN AS BUSINESS_1,ISNULL(dbo.ByCustomer.Principal,0) AS Total_OS,dbo.DEBTDATE.ASOF AS OS_AsOf
	FROM         dbo.ByCustomer RIGHT OUTER JOIN
                      dbo.CUSTOMER AS Cus ON dbo.ByCustomer.Cif = Cus.CIF LEFT OUTER JOIN
                      dbo.CUS_SME_EXPORTER AS Ex ON Cus.CIF = Ex.CIF LEFT OUTER JOIN
                      dbo.BUSINESS_TYPE_4 INNER JOIN
                      dbo.CUSTOMER_SME AS Sme ON dbo.BUSINESS_TYPE_4.TYPE4_ID = Sme.BUSI_RISK1_ID ON Cus.CIF = Sme.CIF CROSS JOIN
                      dbo.DEBTDATE
	WHERE     (dbo.DEBTDATE.Upd_TABLE = 'ByCustomer') AND (Cus.CIF = @CIF)
END

