-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[P_UPDATE_EXPORTER_DETAIL]
	-- Add the parameters for the stored procedure here
	@CIF int
   ,@TOTAL_LIMIT numeric(20,5)
   ,@TOTAL_OS numeric(20,5)
   ,@GROUP_EXPOSURE numeric(20,5)
   ,@REVENUE numeric(20,5)
   ,@REVENUE_EXPORT numeric(5,2)
   ,@REVENUE_LOCAL numeric(5,2)
   ,@COGS numeric(20,5)
   ,@COGS_IMPORT numeric(5,2)
   ,@COGS_LOCAL numeric(5,2)
   ,@GROSS_MARGIN numeric(20,5)
   ,@SG_AND_A numeric(20,5)
   ,@NET_MARGIN numeric(20,5)
   ,@PAY_INTEREST numeric(20,5)
   ,@PAY_PRINCIPAL numeric(20,5)
   ,@UPDATE_BY nvarchar(10)
   ,@UPDATE_DATE datetime
   ,@EXPORT_TO_1 int
   ,@EX_CURRENCY_TYPE_1 int
   ,@EX_PERCENTAGE_1 numeric(5,2)
   ,@EXPORT_TO_2 int
   ,@EX_CURRENCY_TYPE_2 int
   ,@EX_PERCENTAGE_2 numeric(5,2)
   ,@EXPORT_TO_3 int
   ,@EX_CURRENCY_TYPE_3 int
   ,@EX_PERCENTAGE_3 numeric(5,2)
   ,@IM_CURRENCY_TYPE_1 int
   ,@IM_PERCENTAGE_1 numeric(5,2)
   ,@IM_CURRENCY_TYPE_2 int
   ,@IM_PERCENTAGE_2 numeric(5,2)
   ,@IM_CURRENCY_TYPE_3 int
   ,@IM_PERCENTAGE_3 numeric(5,2)
   ,@REMARK text
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[CUS_SME_EXPORTER]
	   SET [TOTAL_LIMIT] = @TOTAL_LIMIT
		  ,[TOTAL_OS] = @TOTAL_OS
		  ,[GROUP_EXPOSURE] = @GROUP_EXPOSURE
		  ,[REVENUE] = @REVENUE
		  ,[REVENUE_EXPORT] = @REVENUE_EXPORT
		  ,[REVENUE_LOCAL] = @REVENUE_LOCAL
		  ,[COGS] = @COGS
		  ,[COGS_IMPORT] = @COGS_IMPORT
		  ,[COGS_LOCAL] = @COGS_LOCAL
		  ,[GROSS_MARGIN] = @GROSS_MARGIN
		  ,[SG_AND_A] = @SG_AND_A
		  ,[NET_MARGIN] = @NET_MARGIN
		  ,[PAY_INTEREST] = @PAY_INTEREST
		  ,[PAY_PRINCIPAL] = @PAY_PRINCIPAL
		  ,[UPDATE_BY] = @UPDATE_BY
		  ,[UPDATE_DATE] = @UPDATE_DATE
		  ,[EXPORT_TO_1] = @EXPORT_TO_1
		  ,[EX_CURRENCY_TYPE_1] = @EX_CURRENCY_TYPE_1
		  ,[EX_PERCENTAGE_1] = @EX_PERCENTAGE_1
		  ,[EXPORT_TO_2] = @EXPORT_TO_2
		  ,[EX_CURRENCY_TYPE_2] = @EX_CURRENCY_TYPE_2
		  ,[EX_PERCENTAGE_2] = @EX_PERCENTAGE_2
		  ,[EXPORT_TO_3] = @EXPORT_TO_3
		  ,[EX_CURRENCY_TYPE_3] = @EX_CURRENCY_TYPE_3
		  ,[EX_PERCENTAGE_3] = @EX_PERCENTAGE_3
		  ,[IM_CURRENCY_TYPE_1] = @IM_CURRENCY_TYPE_1
		  ,[IM_PERCENTAGE_1] = @IM_PERCENTAGE_1
		  ,[IM_CURRENCY_TYPE_2] = @IM_CURRENCY_TYPE_2
		  ,[IM_PERCENTAGE_2] = @IM_PERCENTAGE_2
		  ,[IM_CURRENCY_TYPE_3] = @IM_CURRENCY_TYPE_3
		  ,[IM_PERCENTAGE_3] = @IM_PERCENTAGE_3
		  ,[REMARK] = @REMARK
	 WHERE CIF = @CIF
END
