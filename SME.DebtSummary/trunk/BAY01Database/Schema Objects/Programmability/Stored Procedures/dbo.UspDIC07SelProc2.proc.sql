﻿CREATE PROCEDURE [dbo].[UspDIC07SelProc2]
           							/*  %%%%%BY  DTOM%%%%%  */
(
		@APPS_ID     int  
)
AS
BEGIN
SELECT     	@APPS_ID		APPS_ID	, 
		Dic07.COLL_ID		COLL_ID	, 
		Id_Build_Type.Build_Type AS BUIL_TYPE, 
		Dic07.BUILD_ROAD	BUILD_ROAD	, 
		Dic07.BUILD_GROU	BUILD_GROU	, 
		Dic07.BUIL_FLOOR	BUIL_FLOOR	, 
                      	Dic07.BUIL_AREA	BUIL_AREA	, 
		Dic07.BUILNAME	BUILNAME	, 
		Dic07.BUILD_ADDR	BUILD_ADDR	, 
		Dic07.BUILD_SOI	BUILD_SOI	, 
		Dic07.DISTRICT	DISTRICT	, 
		Dic07.AMPHUR		AMPHUR	, 
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
/*FROM         	Dic07 INNER JOIN  Id_Build_Type ON Dic07.Id_Build_Type = Id_Build_Type.Id_Build_Type 
		INNER JOIN       REF_PROVINCE ON Dic07.PROV_CODE = REF_PROVINCE.PROV_CODE
		LEFT OUTER JOIN COLLGROUP ON Dic07.COLL_ID = COLLGROUP.COLL_ID
		LEFT OUTER JOIN COLLVAL ON COLLGROUP.CIDGROUP = COLLVAL.COLL_ID*/

FROM         	COLLVAL INNER JOIN COLLGROUP ON (COLLGROUP.CIDGROUP = COLLVAL.COLL_ID And COLLVAL.DATEDELETE IS NULL)
		RIGHT OUTER JOIN DIC07 ON COLLGROUP.COLL_ID=Dic07.COLL_ID
		INNER JOIN   Id_Build_Type ON Dic07.Id_Build_Type = Id_Build_Type.Id_Build_Type 
		LEFT OUTER JOIN REF_PROVINCE ON Dic07.PROV_CODE = REF_PROVINCE.PROV_CODE

WHERE     	Dic07.COLL_ID   IN    (SELECT     coll_id
			                        FROM          linkcoll
                            		           WHERE      APPS_ID = @APPS_ID)
    
    RETURN(0)
END