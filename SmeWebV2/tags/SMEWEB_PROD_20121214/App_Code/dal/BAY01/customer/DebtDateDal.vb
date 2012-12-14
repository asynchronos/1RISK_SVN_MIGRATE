Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class DebtdateDAL

    Private Shared className As String = "DebtdateDAL"

    Public Function getDebtdateByUpd_TABLE(ByVal objDebtdate As Debtdate) As Debtdate
        Return getDebtdateByUpd_TABLE(objDebtdate.Upd_TABLE)
    End Function

    Public Function getDebtdateByUpd_TABLE(ByVal Upd_TABLE As String) As Debtdate

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New Debtdate()

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig(ConnectionUtil.ConnectionString.BAY01ConnectionString)
            Dim sql As String = "SELECT " _
             & "Upd_TABLE, ASOF, Upd_DAY, Upd_MONTH, " _
             & "Upd_YEAR, Up_DT " _
             & "FROM DEBTDATE " _
             & "WHERE Upd_TABLE=@Upd_TABLE " _
             & "ORDER BY Upd_TABLE"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@Upd_TABLE", Upd_TABLE)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result = bindingDebtdate(reader)
            End While

            reader.Close()
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

    Public Function getAllDebtdate() As Hashtable

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New Hashtable()
        Dim rows As New ArrayList()

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig(ConnectionUtil.ConnectionString.BAY01ConnectionString)
            Dim sql As String = "SELECT " _
             & "Upd_TABLE, ASOF, Upd_DAY, Upd_MONTH, " _
             & "Upd_YEAR, Up_DT " _
             & "FROM DEBTDATE " _
             & "ORDER BY Upd_TABLE"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                rows.Add(bindingDebtdate(reader))
            End While

            result.Add("ROWS", rows)

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

    Public Sub insertDebtdate(ByVal objDebtdate As Debtdate)

        'declare connection
        Dim conn As SqlConnection = Nothing

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig(ConnectionUtil.ConnectionString.BAY01ConnectionString)
            Dim sql As String = "INSERT INTO DEBTDATE " _
                & " (Upd_TABLE, ASOF, Upd_DAY, Upd_MONTH, Upd_YEAR, Up_DT) " _
                & " VALUES(@Upd_TABLE, @ASOF, @Upd_DAY, @Upd_MONTH, @Upd_YEAR, @Up_DT) "

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@Upd_TABLE", objDebtdate.Upd_TABLE)
            sqlCmd.Parameters.AddWithValue("@ASOF", objDebtdate.ASOF)
            sqlCmd.Parameters.AddWithValue("@Upd_DAY", objDebtdate.Upd_DAY)
            sqlCmd.Parameters.AddWithValue("@Upd_MONTH", objDebtdate.Upd_MONTH)
            sqlCmd.Parameters.AddWithValue("@Upd_YEAR", objDebtdate.Upd_YEAR)
            sqlCmd.Parameters.AddWithValue("@Up_DT", objDebtdate.Up_DT)

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

    Public Sub updateDebtdate(ByVal objDebtdate As Debtdate)

        'declare connection
        Dim conn As SqlConnection = Nothing

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig(ConnectionUtil.ConnectionString.BAY01ConnectionString)
            Dim sql As String = "UPDATE DEBTDATE SET " _
                & " ASOF=@ASOF, " _
                & " Upd_DAY=@Upd_DAY, " _
                & " Upd_MONTH=@Upd_MONTH, " _
                & " Upd_YEAR=@Upd_YEAR, " _
                & " Up_DT=@Up_DT " _
                & " WHERE Upd_TABLE=@Upd_TABLE "

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@Upd_TABLE", objDebtdate.Upd_TABLE)
            sqlCmd.Parameters.AddWithValue("@ASOF", objDebtdate.ASOF)
            sqlCmd.Parameters.AddWithValue("@Upd_DAY", objDebtdate.Upd_DAY)
            sqlCmd.Parameters.AddWithValue("@Upd_MONTH", objDebtdate.Upd_MONTH)
            sqlCmd.Parameters.AddWithValue("@Upd_YEAR", objDebtdate.Upd_YEAR)
            sqlCmd.Parameters.AddWithValue("@Up_DT", objDebtdate.Up_DT)

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

    Public Sub deleteDebtdate(ByVal objDebtdate As Debtdate)
        deleteDebtdate(objDebtdate.Upd_TABLE)
    End Sub

    Public Sub deleteDebtdate(ByVal Upd_TABLE As String)

        'declare connection
        Dim conn As SqlConnection = Nothing

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig(ConnectionUtil.ConnectionString.BAY01ConnectionString)
            Dim sql As String = "DELETE FROM DEBTDATE WHERE Upd_TABLE=@Upd_TABLE"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@Upd_TABLE", Upd_TABLE)

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

    Public Function bindingDebtdate(ByVal reader As SqlDataReader) As Debtdate

        Dim objDebtdate As New Debtdate

        objDebtdate.Upd_TABLE = CType(ConvertUtil.getObjectValue(reader("Upd_TABLE"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objDebtdate.ASOF = CType(ConvertUtil.getObjectValue(reader("ASOF"), ConvertUtil.ObjectValueEnum.DateValue), Date)
        objDebtdate.Upd_DAY = CType(ConvertUtil.getObjectValue(reader("Upd_DAY"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objDebtdate.Upd_MONTH = CType(ConvertUtil.getObjectValue(reader("Upd_MONTH"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objDebtdate.Upd_YEAR = CType(ConvertUtil.getObjectValue(reader("Upd_YEAR"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objDebtdate.Up_DT = CType(ConvertUtil.getObjectValue(reader("Up_DT"), ConvertUtil.ObjectValueEnum.StringValue), String)

        Return objDebtdate

    End Function

End Class