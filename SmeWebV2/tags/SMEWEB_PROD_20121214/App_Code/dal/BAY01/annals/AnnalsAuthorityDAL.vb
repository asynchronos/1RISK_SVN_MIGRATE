Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class AnnalsAuthorityDAL

	Private Shared className As String = "AnnalsAuthorityDAL"

	Public Function getAnnalsAuthorityByAuthority_id(ByVal objAnnalsAuthority As AnnalsAuthority) As AnnalsAuthority

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New AnnalsAuthority()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "Authority_id, Authority, Priority " _
             & "FROM ANNALS_AUTHORITY " _
             & "WHERE Authority_id=@Authority_id " _
             & "ORDER BY Priority"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@Authority_id", objAnnalsAuthority.Authority_id)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingAnnalsAuthority(reader)
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

	Public Function getAnnalsAuthorityByAuthority_id(ByVal Authority_id As String) As AnnalsAuthority

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New AnnalsAuthority()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "Authority_id, Authority, Priority " _
             & "FROM ANNALS_AUTHORITY " _
             & "WHERE Authority_id=@Authority_id " _
             & "ORDER BY Priority"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@Authority_id", Authority_id)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingAnnalsAuthority(reader)
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

	Public Function getAllAnnalsAuthority() As List (Of AnnalsAuthority)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of AnnalsAuthority)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "Authority_id, Authority, Priority " _
             & "FROM ANNALS_AUTHORITY " _
             & "ORDER BY Priority"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingAnnalsAuthority(reader))
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

	Public Function getAllAnnalsAuthorityBySQL(ByVal sql AS String) As List (Of AnnalsAuthority)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of AnnalsAuthority)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingAnnalsAuthority(reader))
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

	Public Sub insertAnnalsAuthority(ByVal objAnnalsAuthority As AnnalsAuthority)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "INSERT INTO ANNALS_AUTHORITY " _
							& " (Authority_id, Authority, Priority) " _
							& " VALUES(@Authority_id, @Authority, @Priority) "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@Authority_id", objAnnalsAuthority.Authority_id)
			sqlCmd.Parameters.AddWithValue("@Authority", objAnnalsAuthority.Authority)
			sqlCmd.Parameters.AddWithValue("@Priority", objAnnalsAuthority.Priority)

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

	Public Sub updateAnnalsAuthority(ByVal objAnnalsAuthority As AnnalsAuthority)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "UPDATE ANNALS_AUTHORITY SET " _
							& " Authority=@Authority, " _
							& " Priority=@Priority " _
							& " WHERE Authority_id=@Authority_id "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@Authority_id", objAnnalsAuthority.Authority_id)
			sqlCmd.Parameters.AddWithValue("@Authority", objAnnalsAuthority.Authority)
			sqlCmd.Parameters.AddWithValue("@Priority", objAnnalsAuthority.Priority)

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

	Public Sub deleteAnnalsAuthority(ByVal objAnnalsAuthority As AnnalsAuthority)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM ANNALS_AUTHORITY WHERE Authority_id=@Authority_id"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@Authority_id", objAnnalsAuthority.Authority_id)

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

	Public Sub deleteAnnalsAuthority(ByVal Authority_id As String)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM ANNALS_AUTHORITY WHERE Authority_id=@Authority_id"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@Authority_id", Authority_id)

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

	Public Function bindingAnnalsAuthority(ByVal reader as SqlDataReader) As AnnalsAuthority

		Dim objAnnalsAuthority As New AnnalsAuthority

		objAnnalsAuthority.Authority_id = CType(ConvertUtil.getObjectValue(reader("Authority_id"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objAnnalsAuthority.Authority = CType(ConvertUtil.getObjectValue(reader("Authority"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objAnnalsAuthority.Priority = CType(ConvertUtil.getObjectValue(reader("Priority"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)

		Return objAnnalsAuthority

	End Function

End Class
