Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class AuthenUsersinrolesDAL

	Private Shared className As String = "AuthenUsersinrolesDAL"

	Public Function getAuthenUsersinrolesByUserId(ByVal objAuthenUsersinroles As AuthenUsersinroles) As AuthenUsersinroles

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New AuthenUsersinroles()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "UserId, RoleId " _
				& "FROM Authen_UsersInRoles " _
				& "WHERE UserId=@UserId " _
				& "ORDER BY UserId"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@UserId", objAuthenUsersinroles.UserId)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingAuthenUsersinroles(reader)
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

	Public Function getAuthenUsersinrolesByUserId(ByVal UserId As String) As AuthenUsersinroles

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New AuthenUsersinroles()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "UserId, RoleId " _
				& "FROM Authen_UsersInRoles " _
				& "WHERE UserId=@UserId " _
				& "ORDER BY UserId"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@UserId", UserId)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingAuthenUsersinroles(reader)
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

	Public Function getAllAuthenUsersinroles() As List (Of AuthenUsersinroles)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of AuthenUsersinroles)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "UserId, RoleId " _
				& "FROM Authen_UsersInRoles " _
				& "ORDER BY UserId"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingAuthenUsersinroles(reader))
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

	Public Function getAllAuthenUsersinrolesBySQL(ByVal sql AS String) As List (Of AuthenUsersinroles)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of AuthenUsersinroles)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingAuthenUsersinroles(reader))
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

	Public Sub insertAuthenUsersinroles(ByVal objAuthenUsersinroles As AuthenUsersinroles)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "INSERT INTO Authen_UsersInRoles " _
							& " (UserId, RoleId) " _
							& " VALUES(@UserId, @RoleId) "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@UserId", objAuthenUsersinroles.UserId)
			sqlCmd.Parameters.AddWithValue("@RoleId", objAuthenUsersinroles.RoleId)

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

	Public Sub updateAuthenUsersinroles(ByVal objAuthenUsersinroles As AuthenUsersinroles)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "UPDATE Authen_UsersInRoles SET " _
							& " RoleId=@RoleId " _
							& " WHERE UserId=@UserId "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@UserId", objAuthenUsersinroles.UserId)
			sqlCmd.Parameters.AddWithValue("@RoleId", objAuthenUsersinroles.RoleId)

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

	Public Sub deleteAuthenUsersinroles(ByVal objAuthenUsersinroles As AuthenUsersinroles)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM Authen_UsersInRoles WHERE UserId=@UserId"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@UserId", objAuthenUsersinroles.UserId)

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

    Public Sub deleteAuthenUsersinroles(ByVal UserId As String, ByVal RoleId As String)

        'declare connection
        Dim conn As SqlConnection = Nothing

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "DELETE FROM Authen_UsersInRoles WHERE UserId=@UserId and RoleId = @RoleId"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@UserId", UserId)
            sqlCmd.Parameters.AddWithValue("@RoleId", RoleId)

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

	Public Function bindingAuthenUsersinroles(ByVal reader as SqlDataReader) As AuthenUsersinroles

		Dim objAuthenUsersinroles As New AuthenUsersinroles

		objAuthenUsersinroles.UserId = CType(ConvertUtil.getObjectValue(reader("UserId"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objAuthenUsersinroles.RoleId = CType(ConvertUtil.getObjectValue(reader("RoleId"), ConvertUtil.ObjectValueEnum.StringValue), String)

		Return objAuthenUsersinroles

	End Function

End Class
