Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class RiskControllingDAL

    Private Shared className As String = "RiskControllingDAL"

    Public Function getCustomerInControllingSummary(ByVal EMP_IDs As String, ByVal selectColumn As String, ByVal groupBy As String, _
                        ByVal orderBy As String) As List(Of RiskCotrollingSummary)

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New List(Of RiskCotrollingSummary)
        Dim rows As New ArrayList()

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()

            Dim sqlCmd As New SqlCommand("SP_Port_CustomerInControllingSummary", conn)
            sqlCmd.CommandType = CommandType.StoredProcedure

            'sqlCmd.Parameters.AddWithValue("@CURRENT_PAGE", currentPage)
            'sqlCmd.Parameters.AddWithValue("@PAGE_SIZE", pageSize)
            sqlCmd.Parameters.AddWithValue("@EMP_IDs", EMP_IDs)
            sqlCmd.Parameters.AddWithValue("@SELECT_COLUMN", selectColumn)
            sqlCmd.Parameters.AddWithValue("@GROUP_BY", groupBy)
            sqlCmd.Parameters.AddWithValue("@ORDER_BY", orderBy)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result.Add(bindingRiskCotrollingSummary(reader))
            End While

            reader.Close()
            conn.Close()
        Catch ex As Exception
            Throw New Exception(ex.Message & " : " & ex.StackTrace)
        Finally
            If (conn.State = ConnectionState.Open) Then
                conn.Close()
            End If
        End Try

        Return result

    End Function

    Public Function getCustomerInControlling(ByVal EMP_ID As String, ByVal currentPage As Integer, _
                        ByVal pageSize As Integer, ByVal condition As String) As Hashtable

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New Hashtable()
        Dim rows As New ArrayList()

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()

            Dim sqlCmd As New SqlCommand("SP_Port_CustomerInControlling", conn)
            sqlCmd.CommandType = CommandType.StoredProcedure

            'Create a SqlParameter object to hold the output parameter value
            Dim totalRecords As New SqlParameter("@TOTAL_RECORDS", SqlDbType.Int)

            'IMPORTANT - must set Direction as ReturnValue
            totalRecords.Direction = ParameterDirection.InputOutput
            totalRecords.Value = 0

            'Finally, add the parameter to the Command's Parameters collection
            sqlCmd.Parameters.Add(totalRecords)

            'Add other parameter
            sqlCmd.Parameters.AddWithValue("@CURRENT_PAGE", currentPage)
            sqlCmd.Parameters.AddWithValue("@PAGE_SIZE", pageSize)
            sqlCmd.Parameters.AddWithValue("@EMP_ID", EMP_ID)
            sqlCmd.Parameters.AddWithValue("@CONDITION", condition)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                rows.Add(bindingCustomerInControlling(reader))
            End While

            While reader.NextResult()

            End While

            'Next Result เป็น False ถึงจะ get output ได้
            Dim totalRow As Integer = CType(sqlCmd.Parameters("@TOTAL_RECORDS").Value, Integer)

            result.Add("TOTAL_ROW", totalRow)
            result.Add("ROWS", rows)

            reader.Close()
            conn.Close()
        Catch ex As Exception
            Throw New Exception(ex.Message & " : " & ex.StackTrace)
        Finally
            If (conn.State = ConnectionState.Open) Then
                conn.Close()
            End If
        End Try

        Return result
    End Function

    Public Function bindingCustomerInControlling(ByVal reader As SqlDataReader) As Detail

        Dim obj As New Detail

        obj.Cif = CType(ConvertUtil.getObjectValue(reader("CIF"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        obj.Name = CType(ConvertUtil.getObjectValue(reader("Name"), ConvertUtil.ObjectValueEnum.StringValue), String)
        obj.Tdr = CType(ConvertUtil.getObjectValue(reader("Tdr"), ConvertUtil.ObjectValueEnum.StringValue), String)
        obj.ClassDebt = CType(ConvertUtil.getObjectValue(reader("Class"), ConvertUtil.ObjectValueEnum.StringValue), String)
        obj.AgingTxt = CType(ConvertUtil.getObjectValue(reader("AgingTxt"), ConvertUtil.ObjectValueEnum.StringValue), String)
        obj.Branch_T = CType(ConvertUtil.getObjectValue(reader("Branch_T"), ConvertUtil.ObjectValueEnum.StringValue), String)
        obj.Region_Name = CType(ConvertUtil.getObjectValue(reader("Region_Name"), ConvertUtil.ObjectValueEnum.StringValue), String)
        obj.Principal = CType(ConvertUtil.getObjectValue(reader("Principal"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        obj.Accru = CType(ConvertUtil.getObjectValue(reader("Accru"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        obj.Susp = CType(ConvertUtil.getObjectValue(reader("Susp"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)

        Return obj

    End Function

    Public Function bindingRiskCotrollingSummary(ByVal reader As SqlDataReader) As RiskCotrollingSummary

        Dim objRiskCotrollingSummary As New RiskCotrollingSummary

        objRiskCotrollingSummary.ClassDebt = CType(ConvertUtil.getObjectValue(reader("Class"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objRiskCotrollingSummary.Tdr = CType(ConvertUtil.getObjectValue(reader("Tdr"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objRiskCotrollingSummary.Agingtxt = CType(ConvertUtil.getObjectValue(reader("Agingtxt"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objRiskCotrollingSummary.Branch_T = CType(ConvertUtil.getObjectValue(reader("Branch_T"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objRiskCotrollingSummary.Region_Name = CType(ConvertUtil.getObjectValue(reader("Region_Name"), ConvertUtil.ObjectValueEnum.StringValue), String)

        objRiskCotrollingSummary.CountCIF = CType(ConvertUtil.getObjectValue(reader("CountCIF"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objRiskCotrollingSummary.Principal = CType(ConvertUtil.getObjectValue(reader("Principal"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objRiskCotrollingSummary.Accru = CType(ConvertUtil.getObjectValue(reader("Accru"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objRiskCotrollingSummary.Susp = CType(ConvertUtil.getObjectValue(reader("Susp"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)

        Return objRiskCotrollingSummary

    End Function

End Class