

Create PROCEDURE [dbo].[UspByCustomerSelProc]
(
    @CIF                int
)
AS
BEGIN
/*
SELECT 	Cif	,
		Name	, 
		BOTID	, 
		Busi_Type	, 
 		TDR	,
		Class	, 
		AGING	, 
		NPL	, 
		Limit	, 
		Principal	, 
		Accru	,
		Susp	, 
		UNEARNPRIN	, 
		UNEARNINT	,
		UseValue	, 
		Reserve	, 
		PVLOSS	,
		Totresv		,
		Limit_Out	,
		Principal_Out	,
		CUS_DEPT_FLAG	, 
		CUS_DEPT_TRAN	,
		NPLFLAG 	,
		STATUSPAY     ,
		PAY = case   when  Statuspay = 0  then  'ไม่มีการจ่ายภายใน 6 เดือนที่ผ่านมา'
			        when  Statuspay = 1  then  'จ่าย 1 เดือนภายใน 6 เดือนที่ผ่านมา'
			        when  Statuspay = 2  then  'จ่าย 2 เดือนภายใน 6 เดือนที่ผ่านมา'
			        when  Statuspay = 3  then  'จ่าย 3 เดือนภายใน 6 เดือนที่ผ่านมา'
			        when  Statuspay = 4  then  'จ่าย 4 เดือนภายใน 6 เดือนที่ผ่านมา'
			        when  Statuspay = 5  then  'จ่าย 5 เดือนภายใน 6 เดือนที่ผ่านมา'
			        when  Statuspay = 6  then  'จ่ายทุกเดือนภายใน 6 เดือนที่ผ่านมา'			
			        else    'ไม่ระบุ'
			        end
FROM 		ByCustomer
WHERE     Cif = @cif
*/
SELECT 	ByCus.Cif	,
		ByCus.Name	, 
		ByCus.BOTID	, 
		ByCus.Busi_Type	, 
 		ByCus.TDR	,
		ByCus.branch,
		b.branch_t ,
		ByCus.Class	, 
		ByCus.AGING	, 
		ByCus.PDGROUP,
		ByCus.NPL	, 
		ByCus.Limit	, 
		ByCus.Principal	, 
		ByCus.PrincipalFull,
		ByCus.Accru	,
		ByCus.AccruFull,
		ByCus.Susp	, 
		ByCus.SuspOri,
		ByCus.UNEARNPRIN	, 
		ByCus.UNEARNINT	,
		ByCus.UseValue	, 
		ByCus.Reserve	, 
		ByCus.PVLOSS	,
		ByCus.ExtraResv,
		ByCus.Totresv		,
		ByCus.Limit_Out	,
		ByCus.Principal_Out	,
		ByCus.CUS_DEPT_FLAG	, 
		ByCus.CUS_DEPT_TRAN	,
		ByCus.NPLFLAG 	,
		ByCus.STATUSPAY     ,
		PAY = case   when  ByCus.Statuspay = 0  then  'ไม่มีการจ่ายภายใน 6 เดือนที่ผ่านมา'
			        when  ByCus.Statuspay = 1  then  'จ่าย 1 เดือนภายใน 6 เดือนที่ผ่านมา'
			        when  ByCus.Statuspay = 2  then  'จ่าย 2 เดือนภายใน 6 เดือนที่ผ่านมา'
			        when  ByCus.Statuspay = 3  then  'จ่าย 3 เดือนภายใน 6 เดือนที่ผ่านมา'
			        when  ByCus.Statuspay = 4  then  'จ่าย 4 เดือนภายใน 6 เดือนที่ผ่านมา'
			        when  ByCus.Statuspay = 5  then  'จ่าย 5 เดือนภายใน 6 เดือนที่ผ่านมา'
			        when  ByCus.Statuspay = 6  then  'จ่ายทุกเดือนภายใน 6 เดือนที่ผ่านมา'			
			        else    'ไม่ระบุ'
			        end,
		chkTDR  =  case   UPPER(LEFT(ByCus.TDR ,2))  when  'NO'  then  '0'
							  else 1  end  
FROM 		ByCustomer ByCus left outer join  id_branch  b  on ByCus.branch  = b.id_branch
WHERE            Bycus.cif = @CIF

    RETURN(0)
END

