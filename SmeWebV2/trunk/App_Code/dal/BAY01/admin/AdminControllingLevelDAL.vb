Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class AdminControllingLevelDAL

	Private Shared className As String = "AdminControllingLevelDAL"

	Public Function getAdminControllingLevelByLEVEL_ID(ByVal objAdminControllingLevel As AdminControllingLevel) As AdminControllingLevel

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New AdminControllingLevel()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "LEVEL_ID, LEVEL_CODE, LEVEL_NAME, LEVEL_ROOT " _
				& "FROM Controlling_Level " _
				& "WHERE LEVEL_ID=@LEVEL_ID " _
				& "ORDER BY LEVEL_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@LEVEL_ID", objAdminControllingLevel.LEVEL_ID)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingAdminControllingLevel(reader)
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

	Public Function getAdminControllingLevelByLEVEL_ID(ByVal LEVEL_ID As String) As AdminControllingLevel

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New AdminControllingLevel()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "LEVEL_ID, LEVEL_CODE, LEVEL_NAME, LEVEL_ROOT " _
				& "FROM Controlling_Level " _
				& "WHERE LEVEL_ID=@LEVEL_ID " _
				& "ORDER BY LEVEL_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@LEVEL_ID", LEVEL_ID)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingAdminControllingLevel(reader)
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

	Public Function getAllAdminControllingLevel() As List (Of AdminControllingLevel)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of AdminControllingLevel)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "LEVEL_ID, LEVEL_CODE, LEVEL_NAME, LEVEL_ROOT " _
				& "FROM Controlling_Level " _
				& "ORDER BY LEVEL_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingAdminControllingLevel(reader))
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

	Public Function getAllAdminControllingLevelBySQL(ByVal sql AS String) As List (Of AdminControllingLevel)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of AdminControllingLevel)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingAdminControllingLevel(reader))
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

	Public Sub insertAdminControllingLevel(ByVal objAdminControllingLevel As AdminControllingLevel)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "INSERT INTO Controlling_Level " _
							& " (LEVEL_ID, LEVEL_CODE, LEVEL_NAME, LEVEL_ROOT) " _
							& " VALUES(@LEVEL_ID, @LEVEL_CODE, @LEVEL_NAME, @LEVEL_ROOT) "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@LEVEL_ID", objAdminControllingLevel.LEVEL_ID)
			sqlCmd.Parameters.AddWithValue("@LEVEL_CODE", objAdminControllingLevel.LEVEL_CODE)
			sqlCmd.Parameters.AddWithValue("@LEVEL_NAME", objAdminControllingLevel.LEVEL_NAME)
			sqlCmd.Parameters.AddWithValue("@LEVEL_ROOT", objAdminControllingLevel.LEVEL_ROOT)

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

	Public Sub updateAdminControllingLevel(ByVal objAdminControllingLevel As AdminControllingLevel)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "UPDATE Controlling_Level SET " _
							& " LEVEL_CODE=@LEVEL_CODE, " _
							& " LEVEL_NAME=@LEVEL_NAME, " _
							& " LEVEL_ROOT=@LEVEL_ROOT " _
							& " WHERE LEVEL_ID=@LEVEL_ID "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@LEVEL_ID", objAdminControllingLevel.LEVEL_ID)
			sqlCmd.Parameters.AddWithValue("@LEVEL_CODE", objAdminControllingLevel.LEVEL_CODE)
			sqlCmd.Parameters.AddWithValue("@LEVEL_NAME", objAdminControllingLevel.LEVEL_NAME)
			sqlCmd.Parameters.AddWithValue("@LEVEL_ROOT", objAdminControllingLevel.LEVEL_ROOT)

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

	Public Sub deleteAdminControllingLevel(ByVal objAdminControllingLevel As AdminControllingLevel)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM Controlling_Level WHERE LEVEL_ID=@LEVEL_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@LEVEL_ID", objAdminControllingLevel.LEVEL_ID)

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

	Public Sub deleteAdminControllingLevel(ByVal LEVEL_ID As String)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM Controlling_Level WHERE LEVEL_ID=@LEVEL_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@LEVEL_ID", LEVEL_ID)

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

	Public Function bindingAdminControllingLevel(ByVal reader as SqlDataReader) As AdminControllingLevel

		Dim objAdminControllingLevel As New AdminControllingLevel

		objAdminControllingLevel.LEVEL_ID = CType(ConvertUtil.getObjectValue(reader("LEVEL_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objAdminControllingLevel.LEVEL_CODE = CType(ConvertUtil.getObjectValue(reader("LEVEL_CODE"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objAdminControllingLevel.LEVEL_NAME = CType(ConvertUtil.getObjectValue(reader("LEVEL_NAME"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objAdminControllingLevel.LEVEL_ROOT = CType(ConvertUtil.getObjectValue(reader("LEVEL_ROOT"), ConvertUtil.ObjectValueEnum.StringValue), String)

		Return objAdminControllingLevel

	End Function

End Class
