CREATE PROCEDURE [dbo].[UspDIC15SelProc]
           							/*  %%%%%BY  DTOM%%%%%  */
(
		@APPS_ID     int  
)
AS
BEGIN
SELECT     	@APPS_ID		APPS_ID	, 
		Dic15.COLL_ID			, 
		Dic15.NAME			, 
		Dic15.SHIP_NO			, 
		Dic15.REGIS_PORT		, 
		Dic15.WEIGHT			, 
		Dic15.POWER			, 
		Dic15.BUILDNAME		, 
		Dic15.ADDR			, 
                      	Dic15.SOI			, 
		Dic15.ROAD			, 
		Dic15.MOO			, 
		Dic15.DISTRICT		, 
		Dic15.AMPHUR			, 
		REF_PROVINCE.PROVINCE_NAME AS PROV,
		COLLVAL.BUYCOLL	BUYCOLL	,
		COLLVAL.FORECASTVAL FORECASTVAL,
		COLLVAL.COLLVAL	COLLVAL	,
		COLLVAL.UNITVAL	UNITVAL	,
		COLLVAL.SELLER	SELLER	,
		COLLVAL.COMMENT	COMMENT
FROM         	Dic15 INNER JOIN     REF_PROVINCE ON Dic15.PROV_CODE = REF_PROVINCE.PROV_CODE
		LEFT OUTER JOIN COLLVAL ON Dic15.COLL_ID = COLLVAL.COLL_ID
WHERE    	Dic15.COLL_ID   IN       (SELECT     coll_id
 			                           FROM          linkcoll
			                            WHERE      apps_id = @APPS_ID)
    
    RETURN(0)
END