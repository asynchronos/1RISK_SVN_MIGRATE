Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class AuthenRolesDAL

	Private Shared className As String = "AuthenRolesDAL"

	Public Function getAuthenRolesByRoleId(ByVal objAuthenRoles As AuthenRoles) As AuthenRoles

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New AuthenRoles()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "RoleId, RoleName, Description, AppId " _
				& "FROM Authen_Roles " _
				& "WHERE RoleId=@RoleId " _
				& "ORDER BY RoleId"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@RoleId", objAuthenRoles.RoleId)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingAuthenRoles(reader)
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

	Public Function getAuthenRolesByRoleId(ByVal RoleId As String) As AuthenRoles

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New AuthenRoles()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "RoleId, RoleName, Description, AppId " _
				& "FROM Authen_Roles " _
				& "WHERE RoleId=@RoleId " _
				& "ORDER BY RoleId"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@RoleId", RoleId)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingAuthenRoles(reader)
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

	Public Function getAllAuthenRoles() As List (Of AuthenRoles)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of AuthenRoles)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "RoleId, RoleName, Description, AppId " _
				& "FROM Authen_Roles " _
				& "ORDER BY RoleId"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingAuthenRoles(reader))
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

	Public Function getAllAuthenRolesBySQL(ByVal sql AS String) As List (Of AuthenRoles)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of AuthenRoles)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingAuthenRoles(reader))
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

	Public Sub insertAuthenRoles(ByVal objAuthenRoles As AuthenRoles)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "INSERT INTO Authen_Roles " _
							& " (RoleId, RoleName, Description, AppId) " _
							& " VALUES(@RoleId, @RoleName, @Description, @AppId) "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@RoleId", objAuthenRoles.RoleId)
			sqlCmd.Parameters.AddWithValue("@RoleName", objAuthenRoles.RoleName)
			sqlCmd.Parameters.AddWithValue("@Description", objAuthenRoles.Description)
			sqlCmd.Parameters.AddWithValue("@AppId", objAuthenRoles.AppId)

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

	Public Sub updateAuthenRoles(ByVal objAuthenRoles As AuthenRoles)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "UPDATE Authen_Roles SET " _
							& " RoleName=@RoleName, " _
							& " Description=@Description, " _
							& " AppId=@AppId " _
							& " WHERE RoleId=@RoleId "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@RoleId", objAuthenRoles.RoleId)
			sqlCmd.Parameters.AddWithValue("@RoleName", objAuthenRoles.RoleName)
			sqlCmd.Parameters.AddWithValue("@Description", objAuthenRoles.Description)
			sqlCmd.Parameters.AddWithValue("@AppId", objAuthenRoles.AppId)

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

	Public Sub deleteAuthenRoles(ByVal objAuthenRoles As AuthenRoles)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM Authen_Roles WHERE RoleId=@RoleId"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@RoleId", objAuthenRoles.RoleId)

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

	Public Sub deleteAuthenRoles(ByVal RoleId As String)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM Authen_Roles WHERE RoleId=@RoleId"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@RoleId", RoleId)

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

	Public Function bindingAuthenRoles(ByVal reader as SqlDataReader) As AuthenRoles

		Dim objAuthenRoles As New AuthenRoles

		objAuthenRoles.RoleId = CType(ConvertUtil.getObjectValue(reader("RoleId"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objAuthenRoles.RoleName = CType(ConvertUtil.getObjectValue(reader("RoleName"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objAuthenRoles.Description = CType(ConvertUtil.getObjectValue(reader("Description"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objAuthenRoles.AppId = CType(ConvertUtil.getObjectValue(reader("AppId"), ConvertUtil.ObjectValueEnum.StringValue), String)

		Return objAuthenRoles

	End Function

End Class
