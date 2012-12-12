
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[P_GetAllNCBCustomers]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [id_regist]
		  ,[first_name]
		  ,[last_name]
		  ,[name_ncb]
		  ,Right(convert(nvarchar(10),dob_ncb),2) + '-' + Substring(convert(nvarchar(10),dob_ncb),5,2)+ '-' + Convert(Nvarchar(10),Convert(int,(Left(convert(nvarchar(10),dob_ncb),4)))+ 543) as [dob_ncb]
		  ,[confirm]
		  ,[cif]
		  ,[ciftype]
		  ,[name_cim]
		  ,[idcard]
		  ,[cardno]
		  ,[cardtype]
		  ,[bth_date]
		  ,Right(convert(nvarchar(10),bth_date2),2) + '-' + Substring(convert(nvarchar(10),bth_date2),5,2)+ '-' + Convert(Nvarchar(10),Convert(int,(Left(convert(nvarchar(10),bth_date2),4)))+ 543) as bth_date2
		  ,[tax_no]
		  ,[name_all]
		  ,[address]
	  FROM [chkncb]
	ORDER BY [cif]
END

