
-- =============================================
-- Author:		Pichaya  prasartporn
-- Create date: 2011/03/14
-- Description:	Get  employee in sme risk section
-- =============================================
CREATE    PROCEDURE [CLASSIFY].[P_GET_LIST_EMP_RISK]
AS
BEGIN

	SET NOCOUNT ON;

	         SELECT M.[EMP_ID], M.[TITLE_NAME] +M.[EMPNAME] + ' ' +M.[EMPSURNAME] as 'EMP_NAME'   
			FROM  CLASSIFY.CATEGORY  C
			left outer join   CLASSIFY.CATE_AND_EMP  E on c.category_key=e.category_key
			left outer join   [dbo].[EMPLOYEE01]  M  on  e.emp_id=m.emp_id
			where  c.category_type_key=8
			and  c.del_flag=0  and   m.emp_id  is not  null
			order by  M.[EMPNAME]

END







