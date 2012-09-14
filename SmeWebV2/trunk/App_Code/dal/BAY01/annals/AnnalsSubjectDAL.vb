Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class AnnalsSubjectDAL

    Private Shared className As String = "AnnalsSubjectDAL"

    Public Function getAnnalsSubjectBySUBJECT_ID(ByVal objAnnalsSubject As AnnalsSubject) As AnnalsSubject

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New AnnalsSubject()

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "SUBJECT_ID, SUBJECT, SUBJECT_ENG, PIORITY, " _
             & "HASVALUE " _
             & "FROM ANNALS_SUBJECT " _
             & "WHERE SUBJECT_ID=@SUBJECT_ID " _
             & "ORDER BY SUBJECT_ID"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@SUBJECT_ID", objAnnalsSubject.SUBJECT_ID)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result = bindingAnnalsSubject(reader)
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

    Public Function getAnnalsSubjectBySUBJECT_ID(ByVal SUBJECT_ID As String) As AnnalsSubject

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New AnnalsSubject()

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "SUBJECT_ID, SUBJECT, SUBJECT_ENG, PIORITY, " _
             & "HASVALUE " _
             & "FROM ANNALS_SUBJECT " _
             & "WHERE SUBJECT_ID=@SUBJECT_ID " _
             & "ORDER BY SUBJECT_ID"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@SUBJECT_ID", SUBJECT_ID)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result = bindingAnnalsSubject(reader)
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

    Public Function getAllAnnalsSubject() As List(Of AnnalsSubject)

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New List(Of AnnalsSubject)

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "SUBJECT_ID, SUBJECT, SUBJECT_ENG, PIORITY, " _
             & "HASVALUE " _
             & "FROM ANNALS_SUBJECT " _
             & "ORDER BY SUBJECT_ID"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result.Add(bindingAnnalsSubject(reader))
            End While

            reader.close()
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

    Public Function getAllAnnalsSubjectBySQL(ByVal sql As String) As List(Of AnnalsSubject)

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New List(Of AnnalsSubject)

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result.Add(bindingAnnalsSubject(reader))
            End While

            reader.close()
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

    Public Sub insertAnnalsSubject(ByVal objAnnalsSubject As AnnalsSubject)

        'declare connection
        Dim conn As SqlConnection = Nothing

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "INSERT INTO ANNALS_SUBJECT " _
                & " (SUBJECT_ID, SUBJECT, SUBJECT_ENG, PIORITY, HASVALUE) " _
                & " VALUES(@SUBJECT_ID, @SUBJECT, @SUBJECT_ENG, @PIORITY, @HASVALUE) "

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@SUBJECT_ID", objAnnalsSubject.SUBJECT_ID)
            sqlCmd.Parameters.AddWithValue("@SUBJECT", objAnnalsSubject.SUBJECT)
            sqlCmd.Parameters.AddWithValue("@SUBJECT_ENG", objAnnalsSubject.SUBJECT_ENG)
            sqlCmd.Parameters.AddWithValue("@PIORITY", objAnnalsSubject.PIORITY)
            sqlCmd.Parameters.AddWithValue("@HASVALUE", objAnnalsSubject.HASVALUE)

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

    Public Sub updateAnnalsSubject(ByVal objAnnalsSubject As AnnalsSubject)

        'declare connection
        Dim conn As SqlConnection = Nothing

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "UPDATE ANNALS_SUBJECT SET " _
                & " SUBJECT=@SUBJECT, " _
                & " SUBJECT_ENG=@SUBJECT_ENG, " _
                & " PIORITY=@PIORITY, " _
                & " HASVALUE=@HASVALUE " _
                & " WHERE SUBJECT_ID=@SUBJECT_ID "
            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@SUBJECT_ID", objAnnalsSubject.SUBJECT_ID)
            sqlCmd.Parameters.AddWithValue("@SUBJECT", objAnnalsSubject.SUBJECT)
            sqlCmd.Parameters.AddWithValue("@SUBJECT_ENG", objAnnalsSubject.SUBJECT_ENG)
            sqlCmd.Parameters.AddWithValue("@PIORITY", objAnnalsSubject.PIORITY)
            sqlCmd.Parameters.AddWithValue("@HASVALUE", objAnnalsSubject.HASVALUE)

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

    Public Sub deleteAnnalsSubject(ByVal objAnnalsSubject As AnnalsSubject)

        'declare connection
        Dim conn As SqlConnection = Nothing

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "DELETE FROM ANNALS_SUBJECT WHERE SUBJECT_ID=@SUBJECT_ID"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@SUBJECT_ID", objAnnalsSubject.SUBJECT_ID)

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

    Public Sub deleteAnnalsSubject(ByVal SUBJECT_ID As String)

        'declare connection
        Dim conn As SqlConnection = Nothing

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "DELETE FROM ANNALS_SUBJECT WHERE SUBJECT_ID=@SUBJECT_ID"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@SUBJECT_ID", SUBJECT_ID)

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

    Public Function bindingAnnalsSubject(ByVal reader As SqlDataReader) As AnnalsSubject

        Dim objAnnalsSubject As New AnnalsSubject

        objAnnalsSubject.SUBJECT_ID = CType(ConvertUtil.getObjectValue(reader("SUBJECT_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsSubject.SUBJECT = CType(ConvertUtil.getObjectValue(reader("SUBJECT"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsSubject.SUBJECT_ENG = CType(ConvertUtil.getObjectValue(reader("SUBJECT_ENG"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsSubject.PIORITY = CType(ConvertUtil.getObjectValue(reader("PIORITY"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objAnnalsSubject.HASVALUE = CType(ConvertUtil.getObjectValue(reader("HASVALUE"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)

        Return objAnnalsSubject

    End Function

End Class