CREATE PROCEDURE [dbo].[UspDIC14SelProc]
           							/*  %%%%%BY  DTOM%%%%%  */
(
		@APPS_ID     int  
)
AS
BEGIN
SELECT     	@APPS_ID		APPS_ID	, 
		Dic14.COLL_ID				, 
		Id_Shr_Type.Shr_Type, Dic14.NAME	, 
		Dic14.LISTE_FLAG			, 
		Dic14.CODE				, 
		Dic14.REGISTER			, 
		Dic14.CERT_NO			, 
                      	Dic14.NOSHR				, 
		Dic14.NOFROM				, 
		Dic14.NOTO				, 
		Dic14.PAR_VALUE			,
		COLLVAL.BUYCOLL	BUYCOLL	,
		COLLVAL.FORECASTVAL FORECASTVAL,
		COLLVAL.COLLVAL	COLLVAL	,
		COLLVAL.UNITVAL	UNITVAL	,
		COLLVAL.SELLER	SELLER	,
		COLLVAL.COMMENT	COMMENT
FROM         	Dic14 INNER JOIN      Id_Shr_Type ON Dic14.Id_Shr_Type = Id_Shr_Type.Id_Shr_Type
		LEFT OUTER JOIN COLLVAL ON Dic14.COLL_ID = COLLVAL.COLL_ID
WHERE    	Dic14.COLL_ID      IN     (SELECT     coll_id
			                            FROM          linkcoll
			                            WHERE      apps_id = @APPS_ID)
    
    RETURN(0)
END