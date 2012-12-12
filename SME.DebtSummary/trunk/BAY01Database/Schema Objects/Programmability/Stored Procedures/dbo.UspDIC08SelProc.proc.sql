CREATE PROCEDURE [dbo].[UspDIC08SelProc]
           							/*  %%%%%BY  DTOM%%%%%  */
(
		@APPS_ID     int  
)
AS
BEGIN
SELECT     	@APPS_ID		APPS_ID	, 
		Dic08.COLL_ID		COLL_ID	, 
		Id_Rental_Type.Rental_Type AS RENTALTYPE, 
		Dic08.RENTALNAME	RENTALNAME, 
		Dic08.REN_CNT_NO			, 
		Dic08.CNT_DATE			, 
                      	Dic08.CNT_DUE			, 
		Dic08.REN_OWNER			, 
		Dic08.REN_REN_BY			, 
		Dic08.BUILDNAME			, 
		Dic08.REN_ADDR			, 
		Dic08.REN_SOR			, 
		Dic08.REN_ROAD			, 
                      	Dic08.REN_MOO			, 
		Dic08.DISTRICT			, 
		Dic08.AMPHUR				, 
		REF_PROVINCE.PROVINCE_NAME AS PROV
FROM         	Dic08    INNER JOIN   Id_Rental_Type ON Dic08.Id_Rental_Type = Id_Rental_Type.Id_Rental_Type
 		INNER JOIN              REF_PROVINCE ON Dic08.PROV_CODE = REF_PROVINCE.PROV_CODE
		LEFT OUTER JOIN COLLVAL ON Dic08.COLL_ID = COLLVAL.COLL_ID
WHERE     	Dic08.COLL_ID             IN           (SELECT     coll_id
                            				FROM          linkcoll
                            				WHERE      APPS_ID = @APPS_ID)
    
    RETURN(0)
END