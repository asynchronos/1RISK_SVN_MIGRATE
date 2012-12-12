

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[REPORT_EDW_ALSCOM_STATUS]
  @CIF int
AS
BEGIN
	
SELECT TOP 1 * 
FROM [Bay01].[dbo].[V_011_EDW_ALS_COM_APPLICATION]
where cif=@CIF


END

