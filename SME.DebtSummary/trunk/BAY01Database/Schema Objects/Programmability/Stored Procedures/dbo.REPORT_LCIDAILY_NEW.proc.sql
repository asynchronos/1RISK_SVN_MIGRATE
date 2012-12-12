
-- =============================================
-- Author:		big
-- Create date: 28 OCT 2008
-- Description:	 Get data from temp report to show customerdata for  aging > 15 days
-- =============================================
CREATE PROCEDURE [dbo].[REPORT_LCIDAILY_NEW]
	@EMP_ID nvarchar(10),
    @StrCri1 float,
    @StrCri2 float
AS
BEGIN
 
IF @EMP_ID IN ('214577','142927','136143','249987','249888','242024','224279')
  -- user เหล่านี้เห็นข้อมูลทั้งหมด
  -- 214577:นางสาว ชุติมา สิงห์พันธุ์ลเดช 
   --142927:นาย อุทัย ลลิตธรรมศิริ 
  -- 136143:นาย ธีรศักดิ์ เจ็งธรรม 
  -- 249987:นาย พิชยา ประสาทพร 
  -- 249888:นาย ประกิต สิริศักดิ์สถาพร 
   --224279:นางสาว ปิยะมาศ กรัณย์ภควุฒิ 
  -- 242024:นางสาว ชลมัย ประโยชน์พิบูลผล 
 
BEGIN
	 SELECT * 
	 FROM Temp_Report_LciDaily_New
	 WHERE (aging  > @StrCri1 and aging < @strCri2)
	 or cm_code is null
	 order by last_date_in desc
END
ELSE
BEGIN
	 SELECT * 
	 FROM Temp_Report_LciDaily_New
	 WHERE  cm_code in (select emp_id from F_FindEmpInSameLevelByEmpID(@EMP_ID))
	 and (aging  > @StrCri1 and aging < @strCri2)
	 or cm_code is null
	 order by last_date_in desc
END
 

 
 
 
END


--select judgement_detail from CUSTOMER_SME_FULL_DESC





