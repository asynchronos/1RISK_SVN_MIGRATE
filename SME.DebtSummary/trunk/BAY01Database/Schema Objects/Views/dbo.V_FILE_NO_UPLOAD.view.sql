
CREATE VIEW [dbo].[V_FILE_NO_UPLOAD]
AS
SELECT     ID, CIF, CUSTOMER, EMPLOYEE, APPTYPE, PROCESS, APPDATE, FILE2, FILE14, WAITING
FROM         (SELECT     T.ID, T.CIF, T.CUSTOMER, T.EMPLOYEE, T.[APP-TYPE] AS 'APPTYPE', T.PROCESS, T.[APP-DATE] AS 'APPDATE',
                                                  (SELECT     TOP (1) ID
                                                    FROM          dbo.UPLOAD_FILE AS F
                                                    WHERE      (FILE_TYPE = 2) AND (ANNALS_ID = T.ID)) AS 'FILE2',
                                                  (SELECT     TOP (1) ID
                                                    FROM          dbo.UPLOAD_FILE AS F
                                                    WHERE      (FILE_TYPE = 14) AND (ANNALS_ID = T.ID)) AS 'FILE14', A.WAITING
                       FROM          dbo.TEMP_REPORT_PRODUCT AS T LEFT OUTER JOIN
                                              dbo.ANNALS_STATUS AS A ON T.ID = A.ID
                       WHERE      (T.PROCESS_GROUP IN ('C', 'D', 'E')) AND (T.[APP-DATE] > CONVERT(datetime, '01/01/2010', 103))) AS Q
where file14 is NULL

