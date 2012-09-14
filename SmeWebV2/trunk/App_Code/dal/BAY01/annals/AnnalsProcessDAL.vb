Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class AnnalsProcessDAL

	Private Shared className As String = "AnnalsProcessDAL"
    Public Function getListAnnalsProcessByGroupBoard() As List(Of AnnalsProcess)

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New List(Of AnnalsProcess)

        Try

            Dim sql As String = "SELECT " _
                & "PROCESS_ID, PEOCESS_HEAD, PROCESS, PROCESS_GROUP " _
                & "FROM ANNALS_PROCESS " _
                 & "WHERE PROCESS_Group='C' or  PROCESS_Group='D' or PROCESS_Group='E' " _
                 & "ORDER BY PROCESS_ID"

            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result.Add(bindingAnnalsProcess(reader))
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
    Public Function getListAnnalsProcessByGroupComment() As List(Of AnnalsProcess)

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New List(Of AnnalsProcess)

        Try

            Dim sql As String = "SELECT " _
                & "PROCESS_ID, PEOCESS_HEAD, PROCESS, PROCESS_GROUP " _
                & "FROM ANNALS_PROCESS " _
                 & "WHERE PROCESS_Group='D' or PROCESS_Group='E' " _
                 & "ORDER BY PROCESS_ID"

            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result.Add(bindingAnnalsProcess(reader))
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
	Public Function getAnnalsProcessByPROCESS_ID(ByVal objAnnalsProcess As AnnalsProcess) As AnnalsProcess

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New AnnalsProcess()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "PROCESS_ID, PEOCESS_HEAD, PROCESS, PROCESS_GROUP " _
				& "FROM ANNALS_PROCESS " _
				& "WHERE PROCESS_ID=@PROCESS_ID " _
				& "ORDER BY PROCESS_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@PROCESS_ID", objAnnalsProcess.PROCESS_ID)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingAnnalsProcess(reader)
			End While

			reader.close()
		Catch ex As Exception
			Throw New Exception(ex.Message & " : " & ex.StackTrace)
		Finally
			If (conn.State = ConnectionState.Open) Then
				conn.Close()
			End IF
			conn = Nothing
		End Try

		Return result

	End Function

	Public Function getAnnalsProcessByPROCESS_ID(ByVal PROCESS_ID As String) As AnnalsProcess

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New AnnalsProcess()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "PROCESS_ID, PEOCESS_HEAD, PROCESS, PROCESS_GROUP " _
				& "FROM ANNALS_PROCESS " _
				& "WHERE PROCESS_ID=@PROCESS_ID " _
				& "ORDER BY PROCESS_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@PROCESS_ID", PROCESS_ID)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingAnnalsProcess(reader)
			End While

			reader.close()
		Catch ex As Exception
			Throw New Exception(ex.Message & " : " & ex.StackTrace)
		Finally
			If (conn.State = ConnectionState.Open) Then
				conn.Close()
			End IF
			conn = Nothing
		End Try

		Return result

	End Function

	Public Function getAllAnnalsProcess() As List (Of AnnalsProcess)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of AnnalsProcess)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "PROCESS_ID, PEOCESS_HEAD, PROCESS, PROCESS_GROUP " _
				& "FROM ANNALS_PROCESS " _
				& "ORDER BY PROCESS_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingAnnalsProcess(reader))
			End While

			reader.close()
			conn.Close()
		Catch ex As Exception
			Throw New Exception(ex.Message & " : " & ex.StackTrace)
		Finally
			If (conn.State = ConnectionState.Open) Then
				conn.Close()
			End IF
			conn = Nothing
		End Try

		Return result

	End Function

	Public Function getAllAnnalsProcessBySQL(ByVal sql AS String) As List (Of AnnalsProcess)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of AnnalsProcess)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingAnnalsProcess(reader))
			End While

			reader.close()
			conn.Close()
		Catch ex As Exception
			Throw New Exception(ex.Message & " : " & ex.StackTrace)
		Finally
			If (conn.State = ConnectionState.Open) Then
				conn.Close()
			End IF
			conn = Nothing
		End Try

		Return result

	End Function

	Public Sub insertAnnalsProcess(ByVal objAnnalsProcess As AnnalsProcess)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "INSERT INTO ANNALS_PROCESS " _
							& " (PROCESS_ID, PEOCESS_HEAD, PROCESS, PROCESS_GROUP) " _
							& " VALUES(@PROCESS_ID, @PEOCESS_HEAD, @PROCESS, @PROCESS_GROUP) "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@PROCESS_ID", objAnnalsProcess.PROCESS_ID)
			sqlCmd.Parameters.AddWithValue("@PEOCESS_HEAD", objAnnalsProcess.PEOCESS_HEAD)
			sqlCmd.Parameters.AddWithValue("@PROCESS", objAnnalsProcess.PROCESS)
			sqlCmd.Parameters.AddWithValue("@PROCESS_GROUP", objAnnalsProcess.PROCESS_GROUP)

			sqlCmd.ExecuteNonQuery()
		Catch ex As Exception
			Throw New Exception(ex.Message & " : " & ex.StackTrace)
		Finally
			If (conn.State = ConnectionState.Open) Then
				conn.Close()
			End IF
			conn = Nothing
		End Try

	End Sub

	Public Sub updateAnnalsProcess(ByVal objAnnalsProcess As AnnalsProcess)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "UPDATE ANNALS_PROCESS SET " _
							& " PEOCESS_HEAD=@PEOCESS_HEAD, " _
							& " PROCESS=@PROCESS, " _
							& " PROCESS_GROUP=@PROCESS_GROUP " _
							& " WHERE PROCESS_ID=@PROCESS_ID "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@PROCESS_ID", objAnnalsProcess.PROCESS_ID)
			sqlCmd.Parameters.AddWithValue("@PEOCESS_HEAD", objAnnalsProcess.PEOCESS_HEAD)
			sqlCmd.Parameters.AddWithValue("@PROCESS", objAnnalsProcess.PROCESS)
			sqlCmd.Parameters.AddWithValue("@PROCESS_GROUP", objAnnalsProcess.PROCESS_GROUP)

			sqlCmd.ExecuteNonQuery()
		Catch ex As Exception
			Throw New Exception(ex.Message & " : " & ex.StackTrace)
		Finally
			If (conn.State = ConnectionState.Open) Then
				conn.Close()
			End IF
			conn = Nothing
		End Try

	End Sub

	Public Sub deleteAnnalsProcess(ByVal objAnnalsProcess As AnnalsProcess)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM ANNALS_PROCESS WHERE PROCESS_ID=@PROCESS_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@PROCESS_ID", objAnnalsProcess.PROCESS_ID)

			sqlCmd.ExecuteNonQuery()
		Catch ex As Exception
			Throw New Exception(ex.Message & " : " & ex.StackTrace)
		Finally
			If (conn.State = ConnectionState.Open) Then
				conn.Close()
			End IF
			conn = Nothing
		End Try

	End Sub

	Public Sub deleteAnnalsProcess(ByVal PROCESS_ID As String)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM ANNALS_PROCESS WHERE PROCESS_ID=@PROCESS_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@PROCESS_ID", PROCESS_ID)

			sqlCmd.ExecuteNonQuery()
		Catch ex As Exception
			Throw New Exception(ex.Message & " : " & ex.StackTrace)
		Finally
			If (conn.State = ConnectionState.Open) Then
				conn.Close()
			End IF
			conn = Nothing
		End Try

	End Sub

	Public Function bindingAnnalsProcess(ByVal reader as SqlDataReader) As AnnalsProcess

		Dim objAnnalsProcess As New AnnalsProcess

		objAnnalsProcess.PROCESS_ID = CType(ConvertUtil.getObjectValue(reader("PROCESS_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objAnnalsProcess.PEOCESS_HEAD = CType(ConvertUtil.getObjectValue(reader("PEOCESS_HEAD"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objAnnalsProcess.PROCESS = CType(ConvertUtil.getObjectValue(reader("PROCESS"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objAnnalsProcess.PROCESS_GROUP = CType(ConvertUtil.getObjectValue(reader("PROCESS_GROUP"), ConvertUtil.ObjectValueEnum.StringValue), String)

		Return objAnnalsProcess

	End Function

End Class
