Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class StopPayAbilityDAL

	Private Shared className As String = "StopPayAbilityDAL"

	Public Function getStopPayAbilityByPAY_ABILITY_ID(ByVal objStopPayAbility As StopPayAbility) As StopPayAbility

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New StopPayAbility()

		Try
            conn = StopConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "PAY_ABILITY_ID, PAY_ABILITY_DETAIL " _
				& "FROM STOP_PAY_ABILITY " _
				& "WHERE PAY_ABILITY_ID=@PAY_ABILITY_ID " _
				& "ORDER BY PAY_ABILITY_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@PAY_ABILITY_ID", objStopPayAbility.PAY_ABILITY_ID)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingStopPayAbility(reader)
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

	Public Function getStopPayAbilityByPAY_ABILITY_ID(ByVal PAY_ABILITY_ID As String) As StopPayAbility

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New StopPayAbility()

		Try
            conn = StopConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "PAY_ABILITY_ID, PAY_ABILITY_DETAIL " _
				& "FROM STOP_PAY_ABILITY " _
				& "WHERE PAY_ABILITY_ID=@PAY_ABILITY_ID " _
				& "ORDER BY PAY_ABILITY_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@PAY_ABILITY_ID", PAY_ABILITY_ID)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingStopPayAbility(reader)
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

	Public Function getAllStopPayAbility() As List (Of StopPayAbility)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of StopPayAbility)

		Try
            conn = StopConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "PAY_ABILITY_ID, PAY_ABILITY_DETAIL " _
				& "FROM STOP_PAY_ABILITY " _
				& "ORDER BY PAY_ABILITY_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingStopPayAbility(reader))
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

	Public Function getAllStopPayAbilityBySQL(ByVal sql AS String) As List (Of StopPayAbility)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of StopPayAbility)

		Try
            conn = StopConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingStopPayAbility(reader))
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

	Public Sub insertStopPayAbility(ByVal objStopPayAbility As StopPayAbility)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
            conn = StopConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "INSERT INTO STOP_PAY_ABILITY " _
							& " (PAY_ABILITY_ID, PAY_ABILITY_DETAIL) " _
							& " VALUES(@PAY_ABILITY_ID, @PAY_ABILITY_DETAIL) "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@PAY_ABILITY_ID", objStopPayAbility.PAY_ABILITY_ID)
			sqlCmd.Parameters.AddWithValue("@PAY_ABILITY_DETAIL", objStopPayAbility.PAY_ABILITY_DETAIL)

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

	Public Sub updateStopPayAbility(ByVal objStopPayAbility As StopPayAbility)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
            conn = StopConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "UPDATE STOP_PAY_ABILITY SET " _
							& " PAY_ABILITY_DETAIL=@PAY_ABILITY_DETAIL " _
							& " WHERE PAY_ABILITY_ID=@PAY_ABILITY_ID "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@PAY_ABILITY_ID", objStopPayAbility.PAY_ABILITY_ID)
			sqlCmd.Parameters.AddWithValue("@PAY_ABILITY_DETAIL", objStopPayAbility.PAY_ABILITY_DETAIL)

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

	Public Sub deleteStopPayAbility(ByVal objStopPayAbility As StopPayAbility)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
            conn = StopConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM STOP_PAY_ABILITY WHERE PAY_ABILITY_ID=@PAY_ABILITY_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@PAY_ABILITY_ID", objStopPayAbility.PAY_ABILITY_ID)

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

	Public Sub deleteStopPayAbility(ByVal PAY_ABILITY_ID As String)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
            conn = StopConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM STOP_PAY_ABILITY WHERE PAY_ABILITY_ID=@PAY_ABILITY_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@PAY_ABILITY_ID", PAY_ABILITY_ID)

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

	Public Function bindingStopPayAbility(ByVal reader as SqlDataReader) As StopPayAbility

		Dim objStopPayAbility As New StopPayAbility

		objStopPayAbility.PAY_ABILITY_ID = CType(ConvertUtil.getObjectValue(reader("PAY_ABILITY_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objStopPayAbility.PAY_ABILITY_DETAIL = CType(ConvertUtil.getObjectValue(reader("PAY_ABILITY_DETAIL"), ConvertUtil.ObjectValueEnum.StringValue), String)

		Return objStopPayAbility

	End Function

End Class
