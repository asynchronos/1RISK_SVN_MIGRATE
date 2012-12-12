CREATE PROCEDURE [dbo].[UspDIC10SelProc]
           							/*  %%%%%BY  DTOM%%%%%  */
(
		@APPS_ID     int  
)
AS
BEGIN
SELECT     	@APPS_ID	APPS_ID	, 
		Dic10.COLL_ID			, 
		Dic10.GOODTYPE		, 
		Dic10.GOODQTY		,	 
		Dic10.GOODUNIT		, 
		Dic10.BUILDNAME		, 
		Dic10.ADDR			, 
		Dic10.SOI, Dic10.ROAD		, 
                      	Dic10.MOO			, 
		Dic10.DISTRICT		, 
		Dic10.AMPHUR			, 
		REF_PROVINCE.PROVINCE_NAME AS PROV
FROM         	Dic10 INNER JOIN  REF_PROVINCE ON Dic10.PROV_CODE = REF_PROVINCE.PROV_CODE
WHERE     	Dic10.COLL_ID  	IN         (SELECT     coll_id
				                            FROM          linkcoll
				                            WHERE      apps_id = @APPS_ID)
    
    RETURN(0)
END