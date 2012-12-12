

-- =============================================
-- Author:		Pichaya  
-- Create date: 2011/03/15
-- Description:	Find  Category key by  emp_id  and  category type
-- =============================================
CREATE   PROCEDURE [CLASSIFY].[P_GET_CATE_KEY_BY_EMP]
	-- Add the parameters for the stored procedure here
	@EMP_ID  nvarchar(10),
    @CATE_TYPE_KEY  int
AS
BEGIN

	    SELECT     a.CATEGORY_KEY
		FROM          [CLASSIFY].[CATEGORY]   a 
		left outer join      [CLASSIFY].[CATE_AND_EMP] b  on a.category_key = b.category_key
		WHERE    b.emp_id=@EMP_ID  and  a.category_type_key=@CATE_TYPE_KEY

END






