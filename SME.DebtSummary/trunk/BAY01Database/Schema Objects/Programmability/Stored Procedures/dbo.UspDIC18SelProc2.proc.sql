﻿CREATE PROCEDURE [dbo].[UspDIC18SelProc2]
           							/*  %%%%%BY  DTOM%%%%%  */
(
		@APPS_ID     int  
)
AS
BEGIN
SELECT     	@APPS_ID		APPS_ID	, 
		Dic18.COLL_ID				, 
		Dic18.ROOM_NO			, 
		Dic18.FLOOR				, 
		Dic18.ROOM_AREA			, 
		Dic18.BUILDNAME			, 
		Dic18.ADDR				, 
		Dic18.SOI				, 
		Dic18.ROAD				, 
                      	Dic18.MOO				, 
		Dic18.DISTRICT			, 
		Dic18.AMPHUR				, 
		REF_PROVINCE.PROVINCE_NAME AS PROV,
		COLLVAL.BUYCOLL	BUYCOLL	,
		COLLVAL.FORECASTVAL FORECASTVAL,
		COLLVAL.PRICE_DEPT	PRICE_DEPT	,
		COLLVAL.COLLVAL	CCOLLVAL	,
		COLLVAL.UNITVAL	UNITVAL	,
		COLLVAL.SELLER	SELLER	,
		COLLVAL.COMMENT	COMMENT	,
		COLLGROUP.COLL_ID as CollNotSel	,
		COLLVAL.COLL_ID 	AS COLLGROUP
/*FROM         	Dic18 INNER JOIN  REF_PROVINCE ON Dic18.PROV_CODE = REF_PROVINCE.PROV_CODE
		LEFT OUTER JOIN COLLGROUP ON Dic18.COLL_ID = COLLGROUP.COLL_ID
		LEFT OUTER JOIN COLLVAL ON (COLLGROUP.CIDGROUP = COLLVAL.COLL_ID And COLLVAL.DATEDELETE IS NOT NULL)*/

FROM         	COLLVAL INNER JOIN COLLGROUP ON (COLLGROUP.CIDGROUP = COLLVAL.COLL_ID And COLLVAL.DATEDELETE IS NULL)
		RIGHT OUTER JOIN DIC18 ON COLLGROUP.COLL_ID=Dic18.COLL_ID
		INNER JOIN REF_PROVINCE ON Dic18.PROV_CODE = REF_PROVINCE.PROV_CODE
WHERE     	Dic18.COLL_ID        IN                 (SELECT     coll_id
				                            FROM          linkcoll
					               WHERE      apps_id = @APPS_ID)
    
    RETURN(0)
END