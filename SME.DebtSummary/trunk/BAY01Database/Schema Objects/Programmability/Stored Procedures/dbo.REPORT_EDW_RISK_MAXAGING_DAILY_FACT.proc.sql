
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[REPORT_EDW_RISK_MAXAGING_DAILY_FACT]
  @CIF int
AS
BEGIN
	
SELECT * 
FROM [Bay01].[dbo].[V_008_EDW_RISK_MAXAGING_D_M_CUST_F_007_AND_004]
where cif=@CIF



END
