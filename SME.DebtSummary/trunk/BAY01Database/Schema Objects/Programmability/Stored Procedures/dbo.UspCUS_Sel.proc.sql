CREATE PROCEDURE [dbo].[UspCUS_Sel]
(
    @CIF                int
)
AS
BEGIN
IF (SELECT DEPTFLAG FROM CUSTOMER WHERE CIF = @CIF) = 1
BEGIN
    SELECT CIF,
           CUS_TITLE,
           CUS_FIRST,
           CUS_LAST,
           ADDR1,
           ADDR2,
           PROV_H.PROVINCE_NAME AS PROVINCE_H,
           CUSTOMER.ZIPCODE,
           TEL_HOME,
           TEL_OFF,
           TAX_NO,
           BUSI_TYPE,
           CLASS,
           BOTID,
           IDCARD,
           SEX,
           BTHDATE,
           ADDRWORK1,
           ADDRWORK2,
           PROV_S.PROVINCE_NAME AS PROVINCE_S,
           ZIPSHOP,
           CARDTYPE,
           CARDNO,
           BEINGCUST,
           DEPTFLAG,
           DEPTTRAN,
           GROUPCIF,
           D.DEPART_T AS CRT_UNT,
           B.Id_Bus_Type,
           B.Bus_TypeD
FROM         CUSTOMER LEFT OUTER JOIN
                      REF_PROVINCE PROV_H ON CUSTOMER.PROV = PROV_H.PROV_CODE LEFT OUTER  JOIN
                      Id_Department D ON CUSTOMER.DEPTTRAN = D.Id_Depart LEFT OUTER JOIN
                      REF_PROVINCE PROV_S ON CUSTOMER.PROVSHOP = PROV_S.PROV_CODE LEFT OUTER JOIN
                      Bus_Type B ON CUSTOMER.BUSI_TYPE = B.Id_Bus_Type
     WHERE CIF        = @CIF
END
ELSE
BEGIN
    SELECT CIF,
           CUS_TITLE,
           CUS_FIRST,
           CUS_LAST,
           ADDR1,
           ADDR2,
           PROV_H.PROVINCE_NAME AS PROVINCE_H,
           CUSTOMER.ZIPCODE,
           TEL_HOME,
           TEL_OFF,
           TAX_NO,
           BUSI_TYPE,
           CLASS,
           BOTID,
           IDCARD,
           SEX,
           BTHDATE,
           ADDRWORK1,
           ADDRWORK2,
           PROV_S.PROVINCE_NAME AS PROVINCE_S,
           ZIPSHOP,
           CARDTYPE,
           CARDNO,
           BEINGCUST,
           DEPTFLAG,
           DEPTTRAN,
           GROUPCIF,
           D.BRANCH_T  AS CRT_UNT,
           B.Id_Bus_Type,
           B.Bus_TypeD
FROM         CUSTOMER LEFT OUTER  JOIN
                      Id_Branch D ON CUSTOMER.DEPTTRAN = D.Id_Branch LEFT OUTER  JOIN
                      REF_PROVINCE PROV_H ON CUSTOMER.PROV = PROV_H.PROV_CODE LEFT OUTER JOIN
                      REF_PROVINCE PROV_S ON CUSTOMER.PROVSHOP = PROV_S.PROV_CODE LEFT OUTER JOIN
                      Bus_Type B ON CUSTOMER.BUSI_TYPE = B.Id_Bus_Type
     WHERE CIF        = @CIF
END

    RETURN(0)
END
