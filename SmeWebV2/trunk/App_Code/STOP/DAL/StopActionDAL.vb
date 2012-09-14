Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class StopActionDAL

	Private Shared className As String = "StopActionDAL"

	Public Function getStopActionByACTION_ID(ByVal objStopAction As StopAction) As StopAction

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New StopAction()

		Try
            conn = StopConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "ACTION_ID, ACTION_DETAIL, ACTION_GROUP, ACTION_PRIORITY " _
             & "FROM STOP_ACTION " _
             & "WHERE ACTION_ID=@ACTION_ID " _
             & "ORDER BY ACTION_PRIORITY ASC"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@ACTION_ID", objStopAction.ACTION_ID)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingStopAction(reader)
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

	Public Function getStopActionByACTION_ID(ByVal ACTION_ID As String) As StopAction

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New StopAction()

		Try
            conn = StopConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "ACTION_ID, ACTION_DETAIL, ACTION_GROUP, ACTION_PRIORITY " _
             & "FROM STOP_ACTION " _
             & "WHERE ACTION_ID=@ACTION_ID " _
             & "ORDER BY ACTION_PRIORITY ASC"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@ACTION_ID", ACTION_ID)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingStopAction(reader)
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

	Public Function getAllStopAction() As List (Of StopAction)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of StopAction)

		Try
            conn = StopConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "ACTION_ID, ACTION_DETAIL, ACTION_GROUP, ACTION_PRIORITY " _
             & "FROM STOP_ACTION " _
             & "ORDER BY ACTION_PRIORITY ASC"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingStopAction(reader))
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

	Public Function getAllStopActionBySQL(ByVal sql AS String) As List (Of StopAction)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of StopAction)

		Try
            conn = StopConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingStopAction(reader))
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

	Public Sub insertStopAction(ByVal objStopAction As StopAction)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
            conn = StopConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "INSERT INTO STOP_ACTION " _
							& " (ACTION_ID, ACTION_DETAIL, ACTION_GROUP, ACTION_PRIORITY) " _
							& " VALUES(@ACTION_ID, @ACTION_DETAIL, @ACTION_GROUP, @ACTION_PRIORITY) "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@ACTION_ID", objStopAction.ACTION_ID)
			sqlCmd.Parameters.AddWithValue("@ACTION_DETAIL", objStopAction.ACTION_DETAIL)
			sqlCmd.Parameters.AddWithValue("@ACTION_GROUP", objStopAction.ACTION_GROUP)
			sqlCmd.Parameters.AddWithValue("@ACTION_PRIORITY", objStopAction.ACTION_PRIORITY)

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

	Public Sub updateStopAction(ByVal objStopAction As StopAction)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
            conn = StopConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "UPDATE STOP_ACTION SET " _
							& " ACTION_DETAIL=@ACTION_DETAIL, " _
							& " ACTION_GROUP=@ACTION_GROUP, " _
							& " ACTION_PRIORITY=@ACTION_PRIORITY " _
							& " WHERE ACTION_ID=@ACTION_ID "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@ACTION_ID", objStopAction.ACTION_ID)
			sqlCmd.Parameters.AddWithValue("@ACTION_DETAIL", objStopAction.ACTION_DETAIL)
			sqlCmd.Parameters.AddWithValue("@ACTION_GROUP", objStopAction.ACTION_GROUP)
			sqlCmd.Parameters.AddWithValue("@ACTION_PRIORITY", objStopAction.ACTION_PRIORITY)

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

	Public Sub deleteStopAction(ByVal objStopAction As StopAction)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
            conn = StopConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM STOP_ACTION WHERE ACTION_ID=@ACTION_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@ACTION_ID", objStopAction.ACTION_ID)

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

	Public Sub deleteStopAction(ByVal ACTION_ID As String)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
            conn = StopConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM STOP_ACTION WHERE ACTION_ID=@ACTION_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@ACTION_ID", ACTION_ID)

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

	Public Function bindingStopAction(ByVal reader as SqlDataReader) As StopAction

		Dim objStopAction As New StopAction

		objStopAction.ACTION_ID = CType(ConvertUtil.getObjectValue(reader("ACTION_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objStopAction.ACTION_DETAIL = CType(ConvertUtil.getObjectValue(reader("ACTION_DETAIL"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objStopAction.ACTION_GROUP = CType(ConvertUtil.getObjectValue(reader("ACTION_GROUP"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objStopAction.ACTION_PRIORITY = CType(ConvertUtil.getObjectValue(reader("ACTION_PRIORITY"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)

		Return objStopAction

	End Function

End Class
