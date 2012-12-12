

CREATE procedure [dbo].[ANNALS_CREDIT_CHECK_REFERENCE] 
@Reference nvarchar(50)
AS
BEGIN

	SELECT  top 1 p.ID,substring(process_id,1,1)  as PROCESS_GROUP
	FROM annals  a  left outer join annals_credit_process p
	ON  annals_type + annals_seq_no+ annals_year  =  id
	WHERE  ANNALS_TYPE='1'  and REFERENCE=@Reference
	ORDER  BY p.process_date desc


END


