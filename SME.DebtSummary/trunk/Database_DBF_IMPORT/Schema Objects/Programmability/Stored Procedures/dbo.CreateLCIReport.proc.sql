
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CreateLCIReport]
	
AS
BEGIN
DECLARE @FileName nvarchar(100);
DECLARE @exDate  nvarchar(10);
set @exdate= right(convert(nvarchar,year(getdate())),2) + right('0'+ convert(nvarchar,month(getdate())),2) + right('0'+ convert(nvarchar,day(getdate())),2)
--print @exDate;
--print  right('0'+ convert(nvarchar,day(getdate())),2)
-- Drive Z มาจาการ map drive ที่ \\172.19.54.168\ftproot\
--SET @FileName = 'Z:\lci_lcid031_' + @exdate +'.txt'
--SET @FileName = '\\172.19.54.168\ftproot\lci_lcid031_' + @exdate +'.txt'
--SET @FileName = '\\172.19.14.082\d\download\lci_lcid031_' + @exdate +'.txt' 
SET @FileName = 'd:\web\lci_lcid031_' + @exdate +'.txt'
 

print @FileName;

 --drop table #TempTable

CREATE TABLE #TempTable
(
 c0 NVARCHAR(100),c1 NVARCHAR(100),c2 NVARCHAR(100),c3 NVARCHAR(100),c4 NVARCHAR(100)
,c5 NVARCHAR(100),c6 NVARCHAR(100),c7 NVARCHAR(100),c8 NVARCHAR(100),c9 NVARCHAR(100)
,c10 NVARCHAR(100),c11 NVARCHAR(100),c12 NVARCHAR(100),c13 NVARCHAR(100),c14 NVARCHAR(100),
c15 NVARCHAR(100),c16 NVARCHAR(100),c17 NVARCHAR(100),c18 NVARCHAR(100),c19 NVARCHAR(100),
c20 NVARCHAR(100),c21 NVARCHAR(100),c22 NVARCHAR(100),c23 NVARCHAR(100),c24 NVARCHAR(100),
c25 NVARCHAR(100),c26 NVARCHAR(100),c27 NVARCHAR(100),c28 NVARCHAR(100),c29 NVARCHAR(100),
c30 NVARCHAR(100),c31 NVARCHAR(100),c32 NVARCHAR(100),c33 NVARCHAR(100),c34 NVARCHAR(100),
c35 NVARCHAR(100),c36 NVARCHAR(100),c37 NVARCHAR(100),c38 NVARCHAR(100),c39 NVARCHAR(100),
c40 NVARCHAR(100),c41 NVARCHAR(100),c42 NVARCHAR(100),c43 NVARCHAR(100),c44 NVARCHAR(100),
c45 NVARCHAR(100),c46 NVARCHAR(100),c47 NVARCHAR(100),c48 NVARCHAR(100),c49 NVARCHAR(100),
c50 NVARCHAR(100),c51 NVARCHAR(100),c52 NVARCHAR(100),c53 NVARCHAR(100),c54 NVARCHAR(100),
c55 NVARCHAR(100),c56 NVARCHAR(100),c57 NVARCHAR(100),c58 NVARCHAR(100),c59 NVARCHAR(100),
c60 NVARCHAR(100),c61 NVARCHAR(100),c62 NVARCHAR(100),c63 NVARCHAR(100),c64 NVARCHAR(100),
c65 NVARCHAR(100),c66 NVARCHAR(100),c67 NVARCHAR(100),c68 NVARCHAR(100),c69 NVARCHAR(100),
c70 NVARCHAR(100),c71 NVARCHAR(100),c72 NVARCHAR(100),c73 NVARCHAR(100),c74 NVARCHAR(100),
c75 NVARCHAR(100),c76 NVARCHAR(100),c77 NVARCHAR(100),c78 NVARCHAR(100),c79 NVARCHAR(100),
c80 NVARCHAR(100),c81 NVARCHAR(100),c82 NVARCHAR(100),c83 NVARCHAR(100),c84 NVARCHAR(100),
c85 NVARCHAR(100),c86 NVARCHAR(100),c87 NVARCHAR(100),c88 NVARCHAR(100),c89 NVARCHAR(100),
c90 NVARCHAR(100),c91 NVARCHAR(100),c92 NVARCHAR(100),c93 NVARCHAR(100),c94 NVARCHAR(100),
c95 NVARCHAR(100),c96 NVARCHAR(100),c97 NVARCHAR(100),c98 NVARCHAR(100),c99 NVARCHAR(100),
c100 NVARCHAR(100),c101 NVARCHAR(100),c102 NVARCHAR(100),c103 NVARCHAR(100),c104 NVARCHAR(100),
c105 NVARCHAR(100),c106 NVARCHAR(100),c107 NVARCHAR(100),c108 NVARCHAR(100),c109 NVARCHAR(100),
c110 NVARCHAR(100),c111 NVARCHAR(100),c112 NVARCHAR(100),c113 NVARCHAR(100),c114 NVARCHAR(100),
c115 NVARCHAR(100),c116 NVARCHAR(100),c117 NVARCHAR(100),c118 NVARCHAR(100),c119 NVARCHAR(100),
c120 NVARCHAR(100),c121 NVARCHAR(100),c122 NVARCHAR(100),c123 NVARCHAR(100),c124 NVARCHAR(100),
c125 NVARCHAR(100),c126 NVARCHAR(100),c127 NVARCHAR(100),c128 NVARCHAR(100),c129 NVARCHAR(100),
c130 NVARCHAR(100),c131 NVARCHAR(100),c132 NVARCHAR(100),c133 NVARCHAR(100),c134 NVARCHAR(100)

)

declare  @sql2 nvarchar(200)

set @sql2='BULK INSERT #TempTable  
FROM '''+ @FileName + ''' WITH ( FIELDTERMINATOR =''!'', FIRSTROW = 2 )'
--print @sql2;

EXECUTE sp_executesql   @sql2	

 IF EXISTS(select * from sysobjects where name='LCIdaily')
   Begin
     drop table LCIdaily
   End

select
GetDate() as [DASOF],
Case When isnumeric(c0)=1 Then convert(integer,c0) Else NULL End as [BRAN],
c1  as [BRANCH_NAM],
Case When isnumeric(c2)=1 Then convert(integer,c2) Else NULL End as [ACCGL],
c3  as [ACCNO],
c4  as [CONTNO],
Case When isnumeric(c5)=1 Then convert(integer,c5) Else NULL End as [SEQNO],
Case When isnumeric(c6)=1 Then convert(integer,c6) Else NULL End as [CIF],
c7  as [CIF_NAME],
c8  as [APP_ID],
Case When isdate(c9)=1 Then convert(DateTime,c9,101) Else NULL End as [OPENDATE],
Case When isdate(c10)=1 Then convert(DateTime,c10,101) Else NULL End as [DUE_DATE],
Case When isdate(c11)=1 Then convert(DateTime,c11,101) Else NULL End as [ISSU_DATE],
Case When isdate(c12)=1 Then convert(DateTime,c12,101) Else NULL End as [LACT_DATE],
Case When isdate(c13)=1 Then convert(DateTime,c13,101) Else NULL End as [LPAY_DATE],
Case When isdate(c14)=1 Then convert(DateTime,c14,101) Else NULL End as [UPD_DATE],
Case When isnumeric(c5)=1 Then convert(integer,c5) Else NULL End as[DEPT]  ,
c16  as [DEPT_MAIN2]  ,
Case When isnumeric(17)=1 Then convert(integer,c17) Else NULL End as [DEPT_APPV]  ,
c18  as [DEPT_APPR2]  ,
Case When isnumeric(c19)=1 Then convert(integer,c17) Else NULL End as [DEPT_ISSU]  ,
c20  as [DEPT_ISSU2]  ,
Case When isnumeric(c21)=1 Then convert(integer,c21) Else NULL End as [DEPT_TRAN]  ,
c22  as [DEPT_TRAN_]  ,
Case When isnumeric(c23)=1 Then convert(Decimal(18,2),c23) Else NULL End as  [ST_PRIN],
Case When isnumeric(c24)=1 Then convert(Decimal(18,2),c24) Else NULL End as  [ST_ACCRU],
Case When isnumeric(c25)=1 Then convert(Decimal(18,2),c25) Else NULL End as  [ST_SUSP],
Case When isnumeric(c26)=1 Then convert(Decimal(18,2),c26) Else NULL End as  [PRINCIPAL],
Case When isnumeric(c27)=1 Then convert(Decimal(18,2),c27) Else NULL End as  [ACCRU],
Case When isnumeric(c28)=1 Then convert(Decimal(18,2),c28) Else NULL End as  [SUSP],
Case When isdate(c29)=1 Then convert(DateTime,c29,101) Else NULL End as [N_BAL_DATE],
Case When isdate(c30)=1 Then convert(DateTime,c30,101) Else NULL End as [N_PRI_DATE],
Case When isdate(c31)=1 Then convert(DateTime,c31,101) Else NULL End as [N_ACC_DATE],
Case When isdate(c32)=1 Then convert(DateTime,c32,101) Else NULL End as [N_SUS_DATE],
Case When isnumeric(c33)=1 Then convert(Decimal(18,2),c33) Else NULL End as  [N_BAL],
Case When isnumeric(c34)=1 Then convert(Decimal(18,2),c34) Else NULL End as [N_PRIN],
Case When isnumeric(c35)=1 Then convert(Decimal(18,2),c35) Else NULL End as  [N_ACCRU],
Case When isnumeric(c36)=1 Then convert(Decimal(18,2),c36) Else NULL End as  [N_SUSP],
Case When isdate(c37)=1 Then convert(DateTime,c37,101) Else NULL End as [P_PRI_DATE],
Case When isdate(c38)=1 Then convert(DateTime,c38,101) Else NULL End as [P_ACC_DATE],
Case When isdate(c39)=1 Then convert(DateTime,c39,101) Else NULL End as [P_SUSP_DATE],
Case When isnumeric(c40)=1 Then convert(Decimal(18,2),c40) Else NULL End as  [PAY_PRIN]  ,
Case When isnumeric(c41)=1 Then convert(Decimal(18,2),c41) Else NULL End as  [PAY_INT]  ,
Case When isnumeric(c42)=1 Then convert(Decimal(18,2),c42) Else NULL End as  [PAY_SUSP]  ,
Case When isdate(c43)=1 Then convert(DateTime,c43,101) Else NULL     End as [L_PRI_DATE],
Case When isdate(c44)=1 Then convert(DateTime,c44,101) Else NULL     End as [L_ACC_DATE],
Case When isdate(c45)=1 Then convert(DateTime,c45,101) Else NULL     End as[L_SUS_DATE],
Case When isnumeric(c46)=1 Then convert(Decimal(18,2),c46) Else NULL End as [L_PRIN]  ,
Case When isnumeric(c47)=1 Then convert(Decimal(18,2),c47) Else NULL End as  [L_ACCRU]  ,
Case When isnumeric(c48)=1 Then convert(Decimal(18,2),c48) Else NULL End as  [L_SUSP]  ,
Case When isdate(c49)=1 Then convert(DateTime,c49,101) Else NULL     End as  [PO_AC_DATE]  ,
Case When isnumeric(c50)=1 Then convert(Decimal(18,2),c50) Else NULL End as  [POST_PRIN]  ,
Case When isnumeric(c51)=1 Then convert(Decimal(18,2),c51) Else NULL End as  [POST_INT]  ,
Case When isnumeric(c52)=1 Then convert(Decimal(18,2),c52) Else NULL End as  [POST_SUSP]  ,
c53  as [ST_CAL_INT]  ,
c54  as [ADJ_INT]  ,
c55  as [INT_TYPE]  ,
Case When isnumeric(c56)=1 Then convert(Decimal(18,2),c56) Else NULL End as [INT_ADV]  ,
c57  as [RATE_TYPE]  ,
c58  as [RATE_TYPE_]  ,
Case When isnumeric(c59)=1 Then convert(Decimal(18,2),c59) Else NULL End as  [RATE_LOAD],
Case When isnumeric(c60)=1 Then convert(Decimal(18,2),c60) Else NULL End as  [INT_RATE],
Case When isnumeric(c61)=1 Then convert(Decimal(18,2),c61) Else NULL End as  [RESV_SYS],
Case When isnumeric(c62)=1 Then convert(Decimal(18,2),c62) Else NULL End as  [REQ_RESV],
Case When isnumeric(c63)=1 Then convert(Decimal(18,2),c63) Else NULL End as  [OFF_PRIN],
Case When isnumeric(c64)=1 Then convert(Decimal(18,2),c64) Else NULL End as  [OFF_ACCRU],
Case When isnumeric(c65)=1 Then convert(Decimal(18,2),c65) Else NULL End as  [AGING],
Case When isnumeric(c66)=1 Then convert(Decimal(18,2),c66) Else NULL End as  [MAX_AGING],
Case When isdate(67)=1 Then convert(DateTime,c67,101) Else NULL     End as [LI_OF_DATE],
Case When isdate(68)=1 Then convert(DateTime,c68,101) Else NULL     End as [LI_CL_DATE],
c69  as [LIMITNO],
c70  as [LIMIT_TYPE],
Case When isnumeric(c71)=1 Then convert(Decimal(18,2),c71) Else NULL End as [LIMIT],
Case When isnumeric(c72)=1 Then convert(Decimal(18,2),c72) Else NULL End as [FEE],
Case When isnumeric(c73)=1 Then convert(Decimal(18,2),c73) Else NULL End as [FEE_THYR],
Case When isnumeric(c74)=1 Then convert(Decimal(18,2),c74) Else NULL End as [FEE_LAYR],
Case When isnumeric(c75)=1 Then convert(Decimal(18,2),c75) Else NULL End as[REVT_ACCRU],
Case When isnumeric(c76)=1 Then convert(integer,c76) Else NULL End as [FCY_CODE],
c77  as [CURR_CODE_],
c78  as [LOAN_CODE],
c79  as [LOAN_CODE_],
c80  as [BUSI_TYPE],
c81  as [LOAN_PURP2],
c82  as [LOAN_TYPE],
c83  as [PROM_TYPE],
c84  as [PROMOTE_T2],
c85  as [LO_PR_TYPE],
c86  as [LOAN_PRIN2],
Case When isnumeric(c87)=1 Then convert(Decimal(18,2),c87) Else NULL End as [EXCHG_RATE],
c88  as [PAY_TERM],
Case When isnumeric(c89)=1 Then convert(Decimal(18,2),c89) Else NULL End as [PAY_AMT_PI],
Case When isnumeric(c90)=1 Then convert(integer,c90) Else NULL End as [NO_INSTALL],
c91  as [ACCT_CASE],
c92  as [ACCT_CASE_],
c93  as [CLASS],
c94  as [SME_TYPE],
c95  as [SME_TYPE_D] ,
Case When isnumeric(c96)=1 Then convert(Decimal(18,2),c96) Else NULL End as [REASON_COD]  ,
c97  as [REASON_CO2]  ,
c98  as [OFFICR_ID]  ,
c99  as [PERSONAL_N]  ,
c100  as [PERSONAL_O]  ,
c101  as [CASE_NO]  ,
Case When isnumeric(c102)=1 Then convert(integer,c102) Else NULL End as [AREA]  ,
c103  as [AREA_DESC]  ,
Case When isnumeric(c104)=1 Then convert(integer,c104) Else NULL End as [REGION]  ,
c105  as [REGION_DES]  ,
Case When isnumeric(c106)=1 Then convert(Decimal(18,2),c106) Else NULL End as [AVG_OUTSTA]  ,
Case When isnumeric(c107)=1 Then convert(Decimal(18,2),c107) Else NULL End as [MIN_INT_RA]  ,
Case When isnumeric(c108)=1 Then convert(Decimal(18,2),c108) Else NULL End as [MAX_INT_RA]  ,
c109  as [CLOSE_DATE]  ,
c110  as [OLD_DUE_DA]  ,
Case When isnumeric(c110)=1 Then convert(Decimal(18,2),c110) Else NULL End as [DUE_BAL],
c112  as [NOT_PAY_SI],
Case When isnumeric(c113)=1 Then convert(Decimal(18,2),c113) Else NULL End as[NOT_PAY],
c114  as [ASOF_DATE],
Case When isnumeric(115)=1 Then convert(Decimal(18,2),c115) Else NULL End as [LIMIT_VAL2],
c116  as [DPD],
c117  as [DAYS],
c118  as [ZERO_INT_D],
c119  as [RATE_MIN],
c120  as [RATE_MIN_D],
Case When isnumeric(c63)=1 Then convert(Decimal(18,2),c63) Else NULL End as [UNEARNPRIN],
Case When isnumeric(c64)=1 Then convert(Decimal(18,2),c64) Else NULL End as [UNEARNINT],
'@'+ rtrim(lTRIM(c0))+'-'+ rtrim(lTRIM(c1))+'-'+rtrim(lTRIM(c3))+'-'+rtrim(lTRIM(c4))+'-'+rtrim(lTRIM(c5))+'@' as [Keyind],
Case When isnumeric(115)=1 Then convert(Decimal(18,2),c115) Else NULL End as [Limitapp],
c121  as [Deptflag],
c126  as [c126],
c127  as [c127],
c128  as [c128],
c129  as [c129],
c130  as [c130],
c131  as [c131],
c132  as [c132],
c133  as [c133],
c134  as [c134]  
into LCIdaily 
from #TempTable

--Drop table #TempTable
--select * from LCIdaily

-- ลบ table ก่อน insert
Drop table LCIreport


SELECT 
dasof,
cif,
cif_name,
app_id,
accgl,
CASE
 WHEN  rtrim(ltrim(app_id))= 'ALS'  then  'Long Term Loans'
 WHEN  rtrim(ltrim(app_id))= 'CTS'  then 
			CASE  
				WHEN   SUBSTRING(rtrim(LTRIM(accgl)),1,2) IN ('11','13') THEN  'Advances Under Commitment' 
				WHEN   SUBSTRING(rtrim(LTRIM(accgl)),1,2) IN ('16','20') THEN  'Contingent'
			END 
 WHEN  rtrim(ltrim(app_id))='IM' AND LEN(rtrim(ltrim(app_id)))=2 THEN  'OD' 
 WHEN  rtrim(ltrim(app_id))= 'IMX' THEN 'Trade Finance'			
 WHEN  rtrim(ltrim(app_id))= 'PNS' THEN 'PN' 
 WHEN  rtrim(LTRIM(app_id)) = 'PR' THEN  'Bill Discounted' 
 ELSE  app_id	
end 
as prod_type,
aging,
bran,
accno,
contno,
seqno,
limit,
principal,
unearnprin,
accru,
unearnint,
susp
into LCIreport
--FROM LCIdaily WHERE INLIST(SUBSTRING(ALLTRIM(STR(accgl)),1,2),'11','13','16','20')  into table &dir\report4tum
FROM LCIdaily 
WHERE SUBSTRING(RTRIM(LTRIM(accgl)),1,2) IN ('11','13','16','20')  
AND aging >0.15 AND bran < 800
AND RTRIM(LTRIM(accgl)) NOT IN ('1310341','1310343') -- 'Housing Loans'
AND RTRIM(LTRIM(accgl)) NOT IN ('1310353','1310354') -- 'Personal Loans'
AND SUBSTRING(RTRIM(LTRIM(accgl)),1,5) <> '13105' -- 'Staff Loans'
AND RTRIM(LTRIM(accgl)) NOT IN ('1320111','1320123') -- 'Sugar'
AND (principal + accru + susp) > 0
order by [app_id] asc


END

