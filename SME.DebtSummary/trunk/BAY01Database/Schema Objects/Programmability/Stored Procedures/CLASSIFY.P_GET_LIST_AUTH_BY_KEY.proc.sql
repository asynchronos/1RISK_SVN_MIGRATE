





-- =============================================
-- Author:		
-- Create date: 
-- Description:	[P_GET_LIST_AUTH_BY_KEY]
-- =============================================
CREATE  PROCEDURE [CLASSIFY].[P_GET_LIST_AUTH_BY_KEY]
	-- Add the parameters for the stored procedure here
	@CATE_KEY int
AS
BEGIN

	       SELECT M.[EMP_ID], M.[TITLE_NAME] +M.[EMPNAME] + ' ' +M.[EMPSURNAME] as 'EMP_NAME'   
			FROM  CLASSIFY.CATEGORY  C
			left outer join   CLASSIFY.CATE_AND_EMP  E on c.category_key=e.category_key
			left outer join   [dbo].[EMPLOYEE01]  M  on  e.emp_id=m.emp_id
			where  E.Category_Key= @CATE_KEY
			and  c.del_flag=0  and   m.emp_id  is not  null
			order by  m.EMPNAME		

END






