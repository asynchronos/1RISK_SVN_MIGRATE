-- =============================================
-- Author:		Prakit Sirisaksathaporn
-- Create date: 2008/01/07
-- Description:	USP_CustomerContact_Insert
-- =============================================
CREATE PROCEDURE [dbo].[USP_CustomerContact_Insert]
	-- Add the parameters for the stored procedure here
	@CIF  int,
	@NAME nvarchar(255),
	@SURNAME nvarchar(255),
	@POS nvarchar(255),
	@Tel_Off varchar(50),
	@Tel_Mobile varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	INSERT INTO [TB_CONTACT] ([CIF], [NAME], [SURNAME], [POS], 
		[Tel_Off], [Tel_Mobile], [UP_DT], [EMP_UP], [CR_DT], [EMP_CR]) 
		VALUES (@CIF, @NAME, @SURNAME, @POS, @Tel_Off, @Tel_Mobile, 
		getdate(), NULL, getdate(), NULL)
END
