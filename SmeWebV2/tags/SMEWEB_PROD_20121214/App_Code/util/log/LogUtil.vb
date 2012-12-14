Option Strict On
Option Explicit On

Imports Microsoft.VisualBasic

Public Class LogUtil
    Public Shared Sub InsertLog(ByVal logTypeId As String, ByVal logLevelId As String, ByVal ipAddress As String, ByVal empId As String, ByVal url As String, ByVal detail As String)

        Using logDB As New util.log.LogDataClassesDataContext()
            Dim logRecord As util.log.LOG_TABLE = New util.log.LOG_TABLE()

            logRecord.LOG_TYPE_ID = logTypeId
            logRecord.LOG_LEVEL_ID = logLevelId
            logRecord.IP_ADDRESS = ipAddress
            logRecord.EMP_ID = empId
            logRecord.URL = url
            logRecord.DETAIL = detail

            'Insert new customer บน LINQ (memory)
            logDB.LOG_TABLEs.InsertOnSubmit(logRecord)
            'Insert ข้อมูลจริงบน Table
            logDB.SubmitChanges()

        End Using
    End Sub

End Class
