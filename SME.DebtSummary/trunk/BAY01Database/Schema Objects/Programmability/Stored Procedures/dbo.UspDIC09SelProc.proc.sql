CREATE PROCEDURE [dbo].[UspDIC09SelProc]
           							/*  %%%%%BY  DTOM%%%%%  */
(
		@APPS_ID     int  
)
AS
BEGIN
SELECT     	@APPS_ID 		APPS_ID	, 
		Dic09.COLL_ID				, 
		Dic09.MACHTYPE			, 
		Id_Fled_Type.Fled_Type AS FLEDTYPE, 
		Dic09.MACHNO				, 
		Dic09.BUILDNAME			, 
		Dic09.ADDR				, 
                      	Dic09.SOI				, 
		Dic09.ROAD				, 
		Dic09.MOO  				, 
		Dic09.DISTRICT			, 
		Dic09.AMPHUR				, 
		REF_PROVINCE.PROVINCE_NAME AS PROV,
		COLLVAL.BUYCOLL	BUYCOLL	,
		COLLVAL.FORECASTVAL FORECASTVAL,
		COLLVAL.COLLVAL	COLLVAL	,
		COLLVAL.UNITVAL	UNITVAL	,
		COLLVAL.SELLER	SELLER	,
		COLLVAL.COMMENT	COMMENT
FROM         	Dic09 INNER JOIN   Id_Fled_Type ON Dic09.Id_Fled_Type = Id_Fled_Type.Id_Fled_Type 
		INNER JOIN    REF_PROVINCE ON Dic09.PROV_CODE = REF_PROVINCE.PROV_CODE
		LEFT OUTER JOIN COLLVAL ON Dic09.COLL_ID = COLLVAL.COLL_ID
WHERE     	Dic09.COLL_ID IN          (SELECT     coll_id
			                            FROM          linkcoll
			                            WHERE      apps_id = @APPS_ID)
  
    RETURN(0)
END