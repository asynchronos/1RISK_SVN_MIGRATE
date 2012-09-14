Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class StopDeptResolveProcessDAL

	Private Shared className As String = "StopDeptResolveProcessDAL"

	Public Function getStopDeptResolveProcessByDEPT_RESOLVE_ID(ByVal objStopDeptResolveProcess As StopDeptResolveProcess) As StopDeptResolveProcess

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New StopDeptResolveProcess()

		Try
            conn = StopConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "DEPT_RESOLVE_ID, DEPT_RESOLVE_DETAIL " _
				& "FROM STOP_DEPT_RESOLVE_PROCESS " _
				& "WHERE DEPT_RESOLVE_ID=@DEPT_RESOLVE_ID " _
				& "ORDER BY DEPT_RESOLVE_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@DEPT_RESOLVE_ID", objStopDeptResolveProcess.DEPT_RESOLVE_ID)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingStopDeptResolveProcess(reader)
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

	Public Function getStopDeptResolveProcessByDEPT_RESOLVE_ID(ByVal DEPT_RESOLVE_ID As String) As StopDeptResolveProcess

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New StopDeptResolveProcess()

		Try
            conn = StopConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "DEPT_RESOLVE_ID, DEPT_RESOLVE_DETAIL " _
				& "FROM STOP_DEPT_RESOLVE_PROCESS " _
				& "WHERE DEPT_RESOLVE_ID=@DEPT_RESOLVE_ID " _
				& "ORDER BY DEPT_RESOLVE_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@DEPT_RESOLVE_ID", DEPT_RESOLVE_ID)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingStopDeptResolveProcess(reader)
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

	Public Function getAllStopDeptResolveProcess() As List (Of StopDeptResolveProcess)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of StopDeptResolveProcess)

		Try
            conn = StopConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "DEPT_RESOLVE_ID, DEPT_RESOLVE_DETAIL " _
				& "FROM STOP_DEPT_RESOLVE_PROCESS " _
				& "ORDER BY DEPT_RESOLVE_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingStopDeptResolveProcess(reader))
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

	Public Function getAllStopDeptResolveProcessBySQL(ByVal sql AS String) As List (Of StopDeptResolveProcess)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of StopDeptResolveProcess)

		Try
            conn = StopConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingStopDeptResolveProcess(reader))
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

	Public Sub insertStopDeptResolveProcess(ByVal objStopDeptResolveProcess As StopDeptResolveProcess)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
            conn = StopConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "INSERT INTO STOP_DEPT_RESOLVE_PROCESS " _
							& " (DEPT_RESOLVE_ID, DEPT_RESOLVE_DETAIL) " _
							& " VALUES(@DEPT_RESOLVE_ID, @DEPT_RESOLVE_DETAIL) "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@DEPT_RESOLVE_ID", objStopDeptResolveProcess.DEPT_RESOLVE_ID)
			sqlCmd.Parameters.AddWithValue("@DEPT_RESOLVE_DETAIL", objStopDeptResolveProcess.DEPT_RESOLVE_DETAIL)

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

	Public Sub updateStopDeptResolveProcess(ByVal objStopDeptResolveProcess As StopDeptResolveProcess)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
            conn = StopConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "UPDATE STOP_DEPT_RESOLVE_PROCESS SET " _
							& " DEPT_RESOLVE_DETAIL=@DEPT_RESOLVE_DETAIL " _
							& " WHERE DEPT_RESOLVE_ID=@DEPT_RESOLVE_ID "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@DEPT_RESOLVE_ID", objStopDeptResolveProcess.DEPT_RESOLVE_ID)
			sqlCmd.Parameters.AddWithValue("@DEPT_RESOLVE_DETAIL", objStopDeptResolveProcess.DEPT_RESOLVE_DETAIL)

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

	Public Sub deleteStopDeptResolveProcess(ByVal objStopDeptResolveProcess As StopDeptResolveProcess)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
            conn = StopConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM STOP_DEPT_RESOLVE_PROCESS WHERE DEPT_RESOLVE_ID=@DEPT_RESOLVE_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@DEPT_RESOLVE_ID", objStopDeptResolveProcess.DEPT_RESOLVE_ID)

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

	Public Sub deleteStopDeptResolveProcess(ByVal DEPT_RESOLVE_ID As String)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
            conn = StopConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM STOP_DEPT_RESOLVE_PROCESS WHERE DEPT_RESOLVE_ID=@DEPT_RESOLVE_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@DEPT_RESOLVE_ID", DEPT_RESOLVE_ID)

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

	Public Function bindingStopDeptResolveProcess(ByVal reader as SqlDataReader) As StopDeptResolveProcess

		Dim objStopDeptResolveProcess As New StopDeptResolveProcess

		objStopDeptResolveProcess.DEPT_RESOLVE_ID = CType(ConvertUtil.getObjectValue(reader("DEPT_RESOLVE_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objStopDeptResolveProcess.DEPT_RESOLVE_DETAIL = CType(ConvertUtil.getObjectValue(reader("DEPT_RESOLVE_DETAIL"), ConvertUtil.ObjectValueEnum.StringValue), String)

		Return objStopDeptResolveProcess

	End Function

End Class
