-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[P_GET_EXPORTER_DETAIL_BY_CIF]
	-- Add the parameters for the stored procedure here
	@CIF int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT     Ex.CIF, CASE LEN(Cus.CFIRST_E) WHEN 0 THEN dbo.GetName(Cus.CUS_TITLE, Cus.CUS_FIRST, Cus.CUS_LAST) 
                      ELSE dbo.GetNameEng(Cus.CTITLE_E, Cus.CFIRST_E, Cus.CLAST_E) END AS Name, dbo.BUSINESS_TYPE_4.DESCRIPTION_EN AS BUSINESS_1, 
                      Ex.TOTAL_LIMIT, ISNULL(dbo.ByCustomer.Principal,0) AS Total_OS,dbo.DEBTDATE.ASOF AS OS_AsOf, Ex.GROUP_EXPOSURE, ISNULL(Ex.EXPORT_TO_1,2) EXPORT_TO_1, ISNULL(Ex.EXPORT_TO_2,2) EXPORT_TO_2, ISNULL(Ex.EXPORT_TO_3,2) EXPORT_TO_3, Ex.REVENUE, 
                      Ex.REVENUE_EXPORT, Ex.REVENUE_LOCAL, ISNULL(Ex.EX_CURRENCY_TYPE_1,4) EX_CURRENCY_TYPE_1, Ex.EX_PERCENTAGE_1, ISNULL(Ex.EX_CURRENCY_TYPE_2,4) EX_CURRENCY_TYPE_2, 
                      Ex.EX_PERCENTAGE_2, ISNULL(Ex.EX_CURRENCY_TYPE_3,4) EX_CURRENCY_TYPE_3, Ex.EX_PERCENTAGE_3, Ex.COGS, Ex.COGS_IMPORT, Ex.COGS_LOCAL, 
                      ISNULL(Ex.IM_CURRENCY_TYPE_1,4) IM_CURRENCY_TYPE_1, Ex.IM_PERCENTAGE_1, ISNULL(Ex.IM_CURRENCY_TYPE_2,4) IM_CURRENCY_TYPE_2, Ex.IM_PERCENTAGE_2, ISNULL(Ex.IM_CURRENCY_TYPE_3,4) IM_CURRENCY_TYPE_3, 
                      Ex.IM_PERCENTAGE_3, Ex.GROSS_MARGIN, Ex.SG_AND_A, Ex.NET_MARGIN, Ex.PAY_INTEREST, Ex.PAY_PRINCIPAL, Ex.UPDATE_BY, 
                      Ex.UPDATE_DATE,dbo.GetName(EMP.TITLE_NAME_E, EMP.EMPNAME_E, EMP.EMPSURNAME_E) AS UPDATE_NAME,CASE WHEN (ISNULL(Ex.PAY_INTEREST,0) + ISNULL(Ex.PAY_PRINCIPAL,0)) = 0 THEN NULL ELSE Ex.NET_MARGIN/(Ex.PAY_INTEREST+Ex.PAY_PRINCIPAL) END AS DSCR
                      ,CASE ISNULL(Ex.REVENUE,0) WHEN 0 THEN NULL ELSE Ex.GROSS_MARGIN/Ex.REVENUE*100 END AS GROSS_PERCENT
                      ,CASE ISNULL(Ex.REVENUE,0) WHEN 0 THEN NULL ELSE Ex.NET_MARGIN/Ex.REVENUE*100 END AS NET_PERCENT
					  ,Ex.REMARK
	FROM         dbo.EMPLOYEE01 AS EMP RIGHT OUTER JOIN
                      dbo.CUS_SME_EXPORTER AS Ex LEFT OUTER JOIN
                      dbo.ByCustomer ON Ex.CIF = dbo.ByCustomer.Cif ON EMP.EMP_ID = Ex.UPDATE_BY LEFT OUTER JOIN
                      dbo.BUSINESS_TYPE_4 INNER JOIN
                      dbo.CUSTOMER_SME AS Sme ON dbo.BUSINESS_TYPE_4.TYPE4_ID = Sme.BUSI_RISK1_ID RIGHT OUTER JOIN
                      dbo.CUSTOMER AS Cus ON Sme.CIF = Cus.CIF ON Ex.CIF = Cus.CIF CROSS JOIN
                      dbo.DEBTDATE
	WHERE (dbo.DEBTDATE.Upd_TABLE = 'ByCustomer') AND (Ex.CIF = @CIF)
END
