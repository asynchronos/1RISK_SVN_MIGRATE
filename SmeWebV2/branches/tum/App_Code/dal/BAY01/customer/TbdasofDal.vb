Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class TbdasofDAL

    Private Shared className As String = "TbdasofDAL"

    Public Function getTbdasofByTB_TABLE(ByVal objTbdasof As Tbdasof) As Tbdasof
        Return getTbdasofByTB_TABLE(objTbdasof.TB_TABLE)
    End Function

    Public Function getTbdasofByTB_TABLE(ByVal TB_TABLE As String) As Tbdasof

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New Tbdasof()

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig(ConnectionUtil.ConnectionString.BAY01ConnectionString)
            Dim sql As String = "SELECT " _
             & "TB_TABLE, OLDDASOF, DASOF, DAY_ASOF, " _
             & "MONTH_ASOF, YEAR_ASOF, UP_DT " _
             & "FROM TBDASOF " _
             & "WHERE TB_TABLE=@TB_TABLE " _
             & "ORDER BY TB_TABLE"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@TB_TABLE", TB_TABLE)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result = bindingTbdasof(reader)
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

    Public Function getAllTbdasof() As Hashtable

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New Hashtable()
        Dim rows As New ArrayList()

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig(ConnectionUtil.ConnectionString.BAY01ConnectionString)
            Dim sql As String = "SELECT " _
             & "TB_TABLE, OLDDASOF, DASOF, DAY_ASOF, " _
             & "MONTH_ASOF, YEAR_ASOF, UP_DT " _
             & "FROM TBDASOF " _
             & "ORDER BY TB_TABLE"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                rows.Add(bindingTbdasof(reader))
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

    Public Sub insertTbdasof(ByVal objTbdasof As Tbdasof)

        'declare connection
        Dim conn As SqlConnection = Nothing

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig(ConnectionUtil.ConnectionString.BAY01ConnectionString)
            Dim sql As String = "INSERT INTO TBDASOF " _
                & " (TB_TABLE, OLDDASOF, DASOF, DAY_ASOF, MONTH_ASOF, YEAR_ASOF, UP_DT) " _
                & " VALUES(@TB_TABLE, @OLDDASOF, @DASOF, @DAY_ASOF, @MONTH_ASOF, @YEAR_ASOF, @UP_DT) "

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@TB_TABLE", objTbdasof.TB_TABLE)
            sqlCmd.Parameters.AddWithValue("@OLDDASOF", objTbdasof.OLDDASOF)
            sqlCmd.Parameters.AddWithValue("@DASOF", objTbdasof.DASOF)
            sqlCmd.Parameters.AddWithValue("@DAY_ASOF", objTbdasof.DAY_ASOF)
            sqlCmd.Parameters.AddWithValue("@MONTH_ASOF", objTbdasof.MONTH_ASOF)
            sqlCmd.Parameters.AddWithValue("@YEAR_ASOF", objTbdasof.YEAR_ASOF)
            sqlCmd.Parameters.AddWithValue("@UP_DT", objTbdasof.UP_DT)

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

    Public Sub updateTbdasof(ByVal objTbdasof As Tbdasof)

        'declare connection
        Dim conn As SqlConnection = Nothing

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig(ConnectionUtil.ConnectionString.BAY01ConnectionString)
            Dim sql As String = "UPDATE TBDASOF SET " _
                & " OLDDASOF=@OLDDASOF, " _
                & " DASOF=@DASOF, " _
                & " DAY_ASOF=@DAY_ASOF, " _
                & " MONTH_ASOF=@MONTH_ASOF, " _
                & " YEAR_ASOF=@YEAR_ASOF, " _
                & " UP_DT=@UP_DT " _
                & " WHERE TB_TABLE=@TB_TABLE "

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@TB_TABLE", objTbdasof.TB_TABLE)
            sqlCmd.Parameters.AddWithValue("@OLDDASOF", objTbdasof.OLDDASOF)
            sqlCmd.Parameters.AddWithValue("@DASOF", objTbdasof.DASOF)
            sqlCmd.Parameters.AddWithValue("@DAY_ASOF", objTbdasof.DAY_ASOF)
            sqlCmd.Parameters.AddWithValue("@MONTH_ASOF", objTbdasof.MONTH_ASOF)
            sqlCmd.Parameters.AddWithValue("@YEAR_ASOF", objTbdasof.YEAR_ASOF)
            sqlCmd.Parameters.AddWithValue("@UP_DT", objTbdasof.UP_DT)

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

    Public Sub deleteTbdasof(ByVal objTbdasof As Tbdasof)
        deleteTbdasof(objTbdasof.TB_TABLE)
    End Sub

    Public Sub deleteTbdasof(ByVal TB_TABLE As String)

        'declare connection
        Dim conn As SqlConnection = Nothing

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig(ConnectionUtil.ConnectionString.BAY01ConnectionString)
            Dim sql As String = "DELETE FROM TBDASOF WHERE TB_TABLE=@TB_TABLE"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@TB_TABLE", TB_TABLE)

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

    Public Function bindingTbdasof(ByVal reader As SqlDataReader) As Tbdasof

        Dim objTbdasof As New Tbdasof

        objTbdasof.TB_TABLE = CType(ConvertUtil.getObjectValue(reader("TB_TABLE"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objTbdasof.OLDDASOF = CType(ConvertUtil.getObjectValue(reader("OLDDASOF"), ConvertUtil.ObjectValueEnum.DateValue), Date)
        objTbdasof.DASOF = CType(ConvertUtil.getObjectValue(reader("DASOF"), ConvertUtil.ObjectValueEnum.DateValue), Date)
        objTbdasof.DAY_ASOF = CType(ConvertUtil.getObjectValue(reader("DAY_ASOF"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objTbdasof.MONTH_ASOF = CType(ConvertUtil.getObjectValue(reader("MONTH_ASOF"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objTbdasof.YEAR_ASOF = CType(ConvertUtil.getObjectValue(reader("YEAR_ASOF"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objTbdasof.UP_DT = CType(ConvertUtil.getObjectValue(reader("UP_DT"), ConvertUtil.ObjectValueEnum.DateValue), Date)

        Return objTbdasof

    End Function

End Class