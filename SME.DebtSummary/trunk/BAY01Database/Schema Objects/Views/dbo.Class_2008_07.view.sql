CREATE VIEW [dbo].[Class_2008_07]
AS
SELECT     TOP (100) PERCENT dbo.CreditFilter01_CreditMaxProcessDate.ID, dbo.CreditFilter02_CreditAccount.MAIN_CIF, dbo.CreditFilter02_CreditAccount.CIF, 
                      dbo.CUSTOMER.CUS_TITLE, dbo.CUSTOMER.CUS_FIRST, dbo.CUSTOMER.CUS_LAST, dbo.CreditFilter02_CreditAccount.ACCNO, 
                      dbo.Cif_Class.Class5106, dbo.CreditFilter01_CreditMaxProcessDate.BRANCH_ID, dbo.CreditFilter01_CreditMaxProcessDate.REGION_ID, 
                      dbo.CreditFilter01_CreditMaxProcessDate.Undertaker, dbo.TB_EMPLOYEE.EMPNAME + ' ' + dbo.TB_EMPLOYEE.EMPSURNAME AS UndertakerName, 
                      dbo.Controlling_Level.LEVEL_NAME, dbo.CreditFilter01_CreditMaxProcessDate.EMP_APPROVE_ID, 
                      dbo.CreditFilter01_CreditMaxProcessDate.EMP_REQUEST_ID, dbo.CreditFilter01_CreditMaxProcessDate.EMP_APPROVE2_ID, 
                      dbo.CUSTOMER.BUSI_TYPE, dbo.Bus_Type.Bus_TypeD, dbo.CreditFilter01_CreditMaxProcessDate.PROCESS_GROUP, 
                      dbo.CreditFilter01_CreditMaxProcessDate.PROCESS_ID, dbo.CreditFilter01_CreditMaxProcessDate.PROCESS, 
                      dbo.CreditFilter01_CreditMaxProcessDate.PROCESS_DATE, dbo.CreditFilter01_CreditMaxProcessDate.CM_Judgement, 
                      dbo.CreditFilter02_CreditAccount.SUBJECT_ID, dbo.CreditFilter02_CreditAccount.SUBJECT, dbo.CreditFilter02_CreditAccount.SUBJECT_DETAIL_ID, 
                      dbo.CreditFilter02_CreditAccount.SUBJECT_DETAIL, dbo.CreditFilter01_CreditMaxProcessDate.BOARD_Others, 
                      dbo.CreditFilter01_CreditMaxProcessDate.DEP_ID, dbo.CreditFilter01_CreditMaxProcessDate.Others, 
                      dbo.CreditFilter01_CreditMaxProcessDate.Others2, dbo.CreditFilter01_CreditMaxProcessDate.Result, dbo.CreditFilter02_CreditAccount.VALUE, 
                      dbo.CreditFilter02_CreditAccount.VALUE_APPROVE
FROM         dbo.Controlling_UsersInLevel LEFT OUTER JOIN
                      dbo.Controlling_Level ON dbo.Controlling_UsersInLevel.LEVEL_ID = dbo.Controlling_Level.LEVEL_ID RIGHT OUTER JOIN
                      dbo.TB_EMPLOYEE AS TB_EMPLOYEE_1 ON dbo.Controlling_UsersInLevel.EMP_ID = TB_EMPLOYEE_1.EMP_ID RIGHT OUTER JOIN
                      dbo.CreditFilter02_CreditAccount INNER JOIN
                      dbo.CreditFilter01_CreditMaxProcessDate ON dbo.CreditFilter02_CreditAccount.ID = dbo.CreditFilter01_CreditMaxProcessDate.ID INNER JOIN
                      dbo.TB_EMPLOYEE ON dbo.CreditFilter01_CreditMaxProcessDate.Undertaker = dbo.TB_EMPLOYEE.EMP_ID ON 
                      TB_EMPLOYEE_1.EMP_ID = dbo.TB_EMPLOYEE.EMP_ID LEFT OUTER JOIN
                      dbo.Cif_Class RIGHT OUTER JOIN
                      dbo.Bus_Type INNER JOIN
                      dbo.CUSTOMER ON dbo.Bus_Type.Id_Bus_Type = dbo.CUSTOMER.BUSI_TYPE ON dbo.Cif_Class.Cif_No = dbo.CUSTOMER.CIF ON 
                      dbo.CreditFilter02_CreditAccount.CIF = dbo.CUSTOMER.CIF
WHERE     (dbo.CreditFilter01_CreditMaxProcessDate.PROCESS_GROUP = 'c') OR
                      (dbo.CreditFilter01_CreditMaxProcessDate.PROCESS_GROUP = 'd') OR
                      (dbo.CreditFilter01_CreditMaxProcessDate.PROCESS_GROUP = 'e')
ORDER BY dbo.CreditFilter01_CreditMaxProcessDate.ANNALS_SEQ_NO

