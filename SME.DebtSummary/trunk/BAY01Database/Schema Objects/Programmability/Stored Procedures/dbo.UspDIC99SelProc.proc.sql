CREATE PROCEDURE [dbo].[UspDIC99SelProc]
           							/*  %%%%%BY  DTOM%%%%%  */
(
		@APPS_ID     int  
)
AS
BEGIN
SELECT     	@APPS_ID		APPS_ID	, 
		Dic99.COLL_ID				, 
		Dic99.COLLNAME1 + '  ' + Dic99.COLLNAME2 AS COLLNAME, 
		Dic99.APPSFLAG			, 
		Dic99.BUILDNAME			, 
		Dic99.ADDR				, 
                      	Dic99.SOI				, 
		Dic99.ROAD				, 
		Dic99.MOO				, 
		Dic99.DISTRICT			, 
		Dic99.AMPHUR				, 
		REF_PROVINCE.PROVINCE_NAME AS PROV,
		COLLVAL.BUYCOLL	BUYCOLL	,
		COLLVAL.FORECASTVAL FORECASTVAL,
		COLLVAL.COLLVAL	COLLVAL	,
		COLLVAL.UNITVAL	UNITVAL	,
		COLLVAL.SELLER	SELLER	,
		COLLVAL.COMMENT	COMMENT
FROM         	Dic99   INNER JOIN    REF_PROVINCE ON Dic99.PROV_CODE = REF_PROVINCE.PROV_CODE
		LEFT OUTER JOIN COLLVAL ON Dic99.COLL_ID = COLLVAL.COLL_ID
WHERE     	Dic99.COLL_ID IN           (SELECT     coll_id
			                            FROM          linkcoll
			                            WHERE      apps_id =  @APPS_ID)
    
    RETURN(0)
END