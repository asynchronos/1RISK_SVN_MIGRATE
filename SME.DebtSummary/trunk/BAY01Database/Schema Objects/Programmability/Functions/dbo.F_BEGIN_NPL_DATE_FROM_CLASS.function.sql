

-- =============================================
-- Author:		pichaya
-- Create date: 24/05/2010
--ส่งค่าเดือนที่เริ่มเป็น NPL  จากการส่งค่า ชั้นหนี้ย้อนหลัง
-- ส่งค่า 3  หมายความว่า เริ่มเป็น npl เมื่อ 3 เดือนที่แล้ว
-- จะดูว่าเริ่มเป็นเดือนอะไรต้องไปดูวันที่ข้อมูล
-- =============================================
CREATE  FUNCTION [dbo].[F_BEGIN_NPL_DATE_FROM_CLASS] 
(	
	 @ASOF  DATETIME,
     @CLASS_H   NVARCHAR(50)
)



RETURNS  DATETIME
AS
BEGIN

			DECLARE @i INT
			DECLARE @MBEGIN  INT
			DECLARE @BEGINNPLDATE DATETIME
			SET @i = 0
			SET @MBEGIN=0

			WHILE @i <=  len(@CLASS_H)
			BEGIN    
									-- PRINT ' Value N2 is ' + CAST(@i  AS VARCHAR(2)) 
								 -- PRINT   CAST(@i  AS VARCHAR(2)) + ' ' + substring(@CLASS_H,@i,1)  
					IF (substring(@CLASS_H,len(@CLASS_H)-@i,1) in ('ก','ข','ค'))
					BEGIN
						SET @MBEGIN=len(@CLASS_H)-@i;
						BREAK
					END
					SET @i = @i + 1;
			END 
			IF (@MBEGIN > 0 ) 
					 BEGIN
					        SET @BEGINNPLDATE=   DATEADD(month, -1 *  (@MBEGIN-1),@ASOF)   -- @MBEGIN -1 เพราะถ้าเป็น  1  คือเดือนปัจจุบัน
					  END
			ELSE
					 BEGIN
						    SET @BEGINNPLDATE=   NULL
			         END
			RETURN @BEGINNPLDATE
END



