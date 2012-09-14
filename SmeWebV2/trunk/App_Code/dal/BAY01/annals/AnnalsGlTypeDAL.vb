Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class AnnalsGlTypeDAL

	Private Shared className As String = "AnnalsGlTypeDAL"

	Public Function getAnnalsGlTypeByDECB_RD_ID(ByVal objAnnalsGlType As AnnalsGlType) As AnnalsGlType

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New AnnalsGlType()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "DECB_RD_ID, DECB_RD " _
				& "FROM ANNALS_GL_TYPE " _
				& "WHERE DECB_RD_ID=@DECB_RD_ID " _
				& "ORDER BY DECB_RD_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@DECB_RD_ID", objAnnalsGlType.DECB_RD_ID)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingAnnalsGlType(reader)
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

	Public Function getAnnalsGlTypeByDECB_RD_ID(ByVal DECB_RD_ID As String) As AnnalsGlType

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New AnnalsGlType()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "DECB_RD_ID, DECB_RD " _
				& "FROM ANNALS_GL_TYPE " _
				& "WHERE DECB_RD_ID=@DECB_RD_ID " _
				& "ORDER BY DECB_RD_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@DECB_RD_ID", DECB_RD_ID)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingAnnalsGlType(reader)
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

	Public Function getAllAnnalsGlType() As List (Of AnnalsGlType)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of AnnalsGlType)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "DECB_RD_ID, DECB_RD " _
             & "FROM ANNALS_GL_TYPE " _
             & "ORDER BY PRIORITY, DECB_RD"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingAnnalsGlType(reader))
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

	Public Function getAllAnnalsGlTypeBySQL(ByVal sql AS String) As List (Of AnnalsGlType)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of AnnalsGlType)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingAnnalsGlType(reader))
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

	Public Sub insertAnnalsGlType(ByVal objAnnalsGlType As AnnalsGlType)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "INSERT INTO ANNALS_GL_TYPE " _
							& " (DECB_RD_ID, DECB_RD) " _
							& " VALUES(@DECB_RD_ID, @DECB_RD) "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@DECB_RD_ID", objAnnalsGlType.DECB_RD_ID)
			sqlCmd.Parameters.AddWithValue("@DECB_RD", objAnnalsGlType.DECB_RD)

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

	Public Sub updateAnnalsGlType(ByVal objAnnalsGlType As AnnalsGlType)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "UPDATE ANNALS_GL_TYPE SET " _
							& " DECB_RD=@DECB_RD " _
							& " WHERE DECB_RD_ID=@DECB_RD_ID "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@DECB_RD_ID", objAnnalsGlType.DECB_RD_ID)
			sqlCmd.Parameters.AddWithValue("@DECB_RD", objAnnalsGlType.DECB_RD)

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

	Public Sub deleteAnnalsGlType(ByVal objAnnalsGlType As AnnalsGlType)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM ANNALS_GL_TYPE WHERE DECB_RD_ID=@DECB_RD_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@DECB_RD_ID", objAnnalsGlType.DECB_RD_ID)

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

	Public Sub deleteAnnalsGlType(ByVal DECB_RD_ID As String)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM ANNALS_GL_TYPE WHERE DECB_RD_ID=@DECB_RD_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@DECB_RD_ID", DECB_RD_ID)

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

	Public Function bindingAnnalsGlType(ByVal reader as SqlDataReader) As AnnalsGlType

		Dim objAnnalsGlType As New AnnalsGlType

		objAnnalsGlType.DECB_RD_ID = CType(ConvertUtil.getObjectValue(reader("DECB_RD_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objAnnalsGlType.DECB_RD = CType(ConvertUtil.getObjectValue(reader("DECB_RD"), ConvertUtil.ObjectValueEnum.StringValue), String)

		Return objAnnalsGlType

	End Function

End Class
