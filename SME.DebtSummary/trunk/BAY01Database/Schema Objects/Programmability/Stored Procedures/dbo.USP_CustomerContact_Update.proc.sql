-- =============================================
-- Author:		Prakit Sirisaksathaporn
-- Create date: 2008/01/07
-- Description:	USP_CustomerContact_Update
-- =============================================
CREATE PROCEDURE [dbo].[USP_CustomerContact_Update]
	-- Add the parameters for the stored procedure here
	@CIF  int ,
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

    -- Insert statements for procedure here
	UPDATE [TB_CONTACT] 
	SET [SURNAME] = @SURNAME, [POS] = @POS, [Tel_Off] = @Tel_Off, [Tel_Mobile] = @Tel_Mobile, 
	[UP_DT] = getDate(), [EMP_UP] = NULL, [EMP_CR] = NULL 
	WHERE [CIF] = @CIF AND [NAME] = @NAME
END
