Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class TbRiskControlSummaryFilterDAL

    Private Shared className As String = "TbRiskControlSummaryFilterDAL"

    Public Function getTbRiskControlSummaryFilterByFilterID(ByVal objTbRiskControlSummaryFilter As TbRiskControlSummaryFilter) As TbRiskControlSummaryFilter
        Return getTbRiskControlSummaryFilterByFilterID(objTbRiskControlSummaryFilter.FilterID)
    End Function

    Public Function getTbRiskControlSummaryFilterByFilterID(ByVal FilterID As Integer) As TbRiskControlSummaryFilter

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New TbRiskControlSummaryFilter()

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "FilterID, FilterDesc, PropertyInClass, FilterTable, " _
             & "FilterColumn " _
             & "FROM TB_RISK_CONTROL_SUMMARY_FILTER " _
             & "WHERE FilterID=@FilterID " _
             & "ORDER BY FilterID"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@FilterID", FilterID)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result = bindingTbRiskControlSummaryFilter(reader)
            End While

            reader.close()
        Catch ex As Exception
            Throw New Exception(ex.Message & " : " & ex.StackTrace)
        Finally
            If (conn.State = ConnectionState.Open) Then
                conn.Close()
            End If
            conn = Nothing
        End Try

        Return result

    End Function

    Public Function getAllTbRiskControlSummaryFilter() As List(Of TbRiskControlSummaryFilter)

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New List(Of TbRiskControlSummaryFilter)

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "FilterID, FilterDesc, PropertyInClass, FilterTable, " _
             & "FilterColumn " _
             & "FROM TB_RISK_CONTROL_SUMMARY_FILTER " _
             & "ORDER BY FilterID"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result.Add(bindingTbRiskControlSummaryFilter(reader))
            End While

            reader.Close()
            conn.Close()
        Catch ex As Exception
            Throw New Exception(ex.Message & " : " & ex.StackTrace)
        Finally
            If (conn.State = ConnectionState.Open) Then
                conn.Close()
            End If
            conn = Nothing
        End Try

        Return result

    End Function

    Public Sub insertTbRiskControlSummaryFilter(ByVal objTbRiskControlSummaryFilter As TbRiskControlSummaryFilter)

        'declare connection
        Dim conn As SqlConnection = Nothing

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "INSERT INTO TB_RISK_CONTROL_SUMMARY_FILTER " _
                & " (FilterID, FilterDesc, PropertyInClass, FilterTable, FilterColumn) " _
                & " VALUES(@FilterID, @FilterDesc, @PropertyInClass, @FilterTable, @FilterColumn) "

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@FilterID", objTbRiskControlSummaryFilter.FilterID)
            sqlCmd.Parameters.AddWithValue("@FilterDesc", objTbRiskControlSummaryFilter.FilterDesc)
            sqlCmd.Parameters.AddWithValue("@PropertyInClass", objTbRiskControlSummaryFilter.PropertyInClass)
            sqlCmd.Parameters.AddWithValue("@FilterTable", objTbRiskControlSummaryFilter.FilterTable)
            sqlCmd.Parameters.AddWithValue("@FilterColumn", objTbRiskControlSummaryFilter.FilterColumn)

            sqlCmd.ExecuteNonQuery()
        Catch ex As Exception
            Throw New Exception(ex.Message & " : " & ex.StackTrace)
        Finally
            If (conn.State = ConnectionState.Open) Then
                conn.Close()
            End If
            conn = Nothing
        End Try

    End Sub

    Public Sub updateTbRiskControlSummaryFilter(ByVal objTbRiskControlSummaryFilter As TbRiskControlSummaryFilter)

        'declare connection
        Dim conn As SqlConnection = Nothing

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "UPDATE TB_RISK_CONTROL_SUMMARY_FILTER SET " _
                & " FilterDesc=@FilterDesc, " _
                & " PropertyInClass=@PropertyInClass, " _
                & " FilterTable=@FilterTable, " _
                & " FilterColumn=@FilterColumn " _
                & " WHERE FilterID=@FilterID "

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@FilterID", objTbRiskControlSummaryFilter.FilterID)
            sqlCmd.Parameters.AddWithValue("@FilterDesc", objTbRiskControlSummaryFilter.FilterDesc)
            sqlCmd.Parameters.AddWithValue("@PropertyInClass", objTbRiskControlSummaryFilter.PropertyInClass)
            sqlCmd.Parameters.AddWithValue("@FilterTable", objTbRiskControlSummaryFilter.FilterTable)
            sqlCmd.Parameters.AddWithValue("@FilterColumn", objTbRiskControlSummaryFilter.FilterColumn)

            sqlCmd.ExecuteNonQuery()
        Catch ex As Exception
            Throw New Exception(ex.Message & " : " & ex.StackTrace)
        Finally
            If (conn.State = ConnectionState.Open) Then
                conn.Close()
            End If
            conn = Nothing
        End Try

    End Sub

    Public Sub deleteTbRiskControlSummaryFilter(ByVal objTbRiskControlSummaryFilter As TbRiskControlSummaryFilter)
        deleteTbRiskControlSummaryFilter(objTbRiskControlSummaryFilter.FilterID)
    End Sub

    Public Sub deleteTbRiskControlSummaryFilter(ByVal FilterID As Integer)

        'declare connection
        Dim conn As SqlConnection = Nothing

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "DELETE FROM TB_RISK_CONTROL_SUMMARY_FILTER WHERE FilterID=@FilterID"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@FilterID", FilterID)

            sqlCmd.ExecuteNonQuery()
        Catch ex As Exception
            Throw New Exception(ex.Message & " : " & ex.StackTrace)
        Finally
            If (conn.State = ConnectionState.Open) Then
                conn.Close()
            End If
            conn = Nothing
        End Try

    End Sub

    Public Function bindingTbRiskControlSummaryFilter(ByVal reader As SqlDataReader) As TbRiskControlSummaryFilter

        Dim objTbRiskControlSummaryFilter As New TbRiskControlSummaryFilter

        objTbRiskControlSummaryFilter.FilterID = CType(ConvertUtil.getObjectValue(reader("FilterID"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objTbRiskControlSummaryFilter.FilterDesc = CType(ConvertUtil.getObjectValue(reader("FilterDesc"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objTbRiskControlSummaryFilter.PropertyInClass = CType(ConvertUtil.getObjectValue(reader("PropertyInClass"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objTbRiskControlSummaryFilter.FilterTable = CType(ConvertUtil.getObjectValue(reader("FilterTable"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objTbRiskControlSummaryFilter.FilterColumn = CType(ConvertUtil.getObjectValue(reader("FilterColumn"), ConvertUtil.ObjectValueEnum.StringValue), String)

        Return objTbRiskControlSummaryFilter

    End Function

End Class