Imports Microsoft.VisualBasic
Imports System.Data.SqlClient

Public Class ReportDAL

    Private Shared className As String = "ReportDAL"

    Public Shared Function CountCovenantReport(ByVal empId As String, ByVal isSingle As String) As Integer
        Dim result As Integer

        Using conn As SqlConnection = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "CA_REPORT.P_COVENANT_REPORT_LEVEL_DROPDOWN_TOTAL"
            Dim sqlCmd As New SqlCommand(sql, conn)

            sqlCmd.CommandType = System.Data.CommandType.StoredProcedure
            sqlCmd.Prepare()
            sqlCmd.Parameters.AddWithValue("@EMP_ID", empId)
            sqlCmd.Parameters.AddWithValue("@SINGLE", isSingle)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result = CType(ConvertUtil.getObjectValue(reader("TOTAL_COVENANT"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
            End While

            reader.Close()
        End Using

        Return result
    End Function

    Public Shared Function CountRatingExpiredReport(ByVal empId As String, ByVal isSingle As String) As Integer
        Dim result As Integer

        Using conn As SqlConnection = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "CUSTOMER.P_RATING_EXPIRED_REPORT_LEVEL_DROPDOWN_TOTAL"
            Dim sqlCmd As New SqlCommand(sql, conn)

            sqlCmd.CommandType = System.Data.CommandType.StoredProcedure
            sqlCmd.Prepare()
            sqlCmd.Parameters.AddWithValue("@EMP_ID", empId)
            sqlCmd.Parameters.AddWithValue("@SINGLE", isSingle)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result = CType(ConvertUtil.getObjectValue(reader("TOTAL_RATING_EXPIRED"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
            End While

            reader.Close()
        End Using

        Return result
    End Function

    Public Shared Function GetLastLoginXMinTotal(ByVal min As Integer) As Integer
        Dim result As Integer = 0

        Using conn As SqlConnection = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "DBO.GET_LAST_LOGIN_X_MIN_TOTAL"
            Dim sqlCmd As New SqlCommand(sql, conn)

            sqlCmd.CommandType = System.Data.CommandType.StoredProcedure
            sqlCmd.Prepare()
            sqlCmd.Parameters.AddWithValue("@min", min)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result = CType(ConvertUtil.getObjectValue(reader("TOTAL_LOGIN"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
            End While

            reader.Close()
        End Using

        Return result
    End Function
End Class
