Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class UploadFileTypeDAL

	Private Shared className As String = "UploadFileTypeDAL"

	Public Function getUploadFileTypeByID(ByVal objUploadFileType As UploadFileType) As UploadFileType

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New UploadFileType()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "ID, TYPE " _
				& "FROM UPLOAD_FILE_TYPE " _
				& "WHERE ID=@ID " _
				& "ORDER BY ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@ID", objUploadFileType.ID)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingUploadFileType(reader)
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

	Public Function getUploadFileTypeByID(ByVal ID As String) As UploadFileType

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New UploadFileType()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "ID, TYPE " _
				& "FROM UPLOAD_FILE_TYPE " _
				& "WHERE ID=@ID " _
				& "ORDER BY ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@ID", ID)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingUploadFileType(reader)
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

	Public Function getAllUploadFileType() As List (Of UploadFileType)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of UploadFileType)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "ID, TYPE " _
				& "FROM UPLOAD_FILE_TYPE " _
				& "ORDER BY ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingUploadFileType(reader))
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

	Public Function getAllUploadFileTypeBySQL(ByVal sql AS String) As List (Of UploadFileType)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of UploadFileType)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingUploadFileType(reader))
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

	Public Sub insertUploadFileType(ByVal objUploadFileType As UploadFileType)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "INSERT INTO UPLOAD_FILE_TYPE " _
							& " (ID, TYPE) " _
							& " VALUES(@ID, @TYPE) "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@ID", objUploadFileType.ID)
			sqlCmd.Parameters.AddWithValue("@TYPE", objUploadFileType.TYPE)

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

	Public Sub updateUploadFileType(ByVal objUploadFileType As UploadFileType)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "UPDATE UPLOAD_FILE_TYPE SET " _
							& " TYPE=@TYPE " _
							& " WHERE ID=@ID "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@ID", objUploadFileType.ID)
			sqlCmd.Parameters.AddWithValue("@TYPE", objUploadFileType.TYPE)

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

	Public Sub deleteUploadFileType(ByVal objUploadFileType As UploadFileType)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM UPLOAD_FILE_TYPE WHERE ID=@ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@ID", objUploadFileType.ID)

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

	Public Sub deleteUploadFileType(ByVal ID As String)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM UPLOAD_FILE_TYPE WHERE ID=@ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@ID", ID)

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

	Public Function bindingUploadFileType(ByVal reader as SqlDataReader) As UploadFileType

		Dim objUploadFileType As New UploadFileType

		objUploadFileType.ID = CType(ConvertUtil.getObjectValue(reader("ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objUploadFileType.TYPE = CType(ConvertUtil.getObjectValue(reader("TYPE"), ConvertUtil.ObjectValueEnum.StringValue), String)

		Return objUploadFileType

	End Function

End Class
