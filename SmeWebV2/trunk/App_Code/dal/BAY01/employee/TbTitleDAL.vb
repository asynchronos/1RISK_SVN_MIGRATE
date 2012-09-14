Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class TbTitleDAL

	Private Shared className As String = "TbTitleDAL"

	Public Function getTbTitleByTITLE_CODE(ByVal objTbTitle As TbTitle) As TbTitle

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New TbTitle()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "TITLE_CODE, TITLE_NAME, TITLE_NAME_E " _
				& "FROM TB_TITLE " _
				& "WHERE TITLE_CODE=@TITLE_CODE " _
				& "ORDER BY TITLE_CODE"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@TITLE_CODE", objTbTitle.TITLE_CODE)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingTbTitle(reader)
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

	Public Function getTbTitleByTITLE_CODE(ByVal TITLE_CODE As Integer) As TbTitle

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New TbTitle()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "TITLE_CODE, TITLE_NAME, TITLE_NAME_E " _
				& "FROM TB_TITLE " _
				& "WHERE TITLE_CODE=@TITLE_CODE " _
				& "ORDER BY TITLE_CODE"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@TITLE_CODE", TITLE_CODE)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingTbTitle(reader)
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

	Public Function getAllTbTitle() As List (Of TbTitle)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of TbTitle)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "TITLE_CODE, TITLE_NAME, TITLE_NAME_E " _
				& "FROM TB_TITLE " _
				& "ORDER BY TITLE_CODE"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingTbTitle(reader))
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

	Public Function getAllTbTitleBySQL(ByVal sql AS String) As List (Of TbTitle)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of TbTitle)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingTbTitle(reader))
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

	Public Sub insertTbTitle(ByVal objTbTitle As TbTitle)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "INSERT INTO TB_TITLE " _
							& " (TITLE_CODE, TITLE_NAME, TITLE_NAME_E) " _
							& " VALUES(@TITLE_CODE, @TITLE_NAME, @TITLE_NAME_E) "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@TITLE_CODE", objTbTitle.TITLE_CODE)
			sqlCmd.Parameters.AddWithValue("@TITLE_NAME", objTbTitle.TITLE_NAME)
			sqlCmd.Parameters.AddWithValue("@TITLE_NAME_E", objTbTitle.TITLE_NAME_E)

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

	Public Sub updateTbTitle(ByVal objTbTitle As TbTitle)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "UPDATE TB_TITLE SET " _
							& " TITLE_NAME=@TITLE_NAME, " _
							& " TITLE_NAME_E=@TITLE_NAME_E " _
							& " WHERE TITLE_CODE=@TITLE_CODE "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@TITLE_CODE", objTbTitle.TITLE_CODE)
			sqlCmd.Parameters.AddWithValue("@TITLE_NAME", objTbTitle.TITLE_NAME)
			sqlCmd.Parameters.AddWithValue("@TITLE_NAME_E", objTbTitle.TITLE_NAME_E)

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

	Public Sub deleteTbTitle(ByVal objTbTitle As TbTitle)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM TB_TITLE WHERE TITLE_CODE=@TITLE_CODE"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@TITLE_CODE", objTbTitle.TITLE_CODE)

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

	Public Sub deleteTbTitle(ByVal TITLE_CODE As Integer)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM TB_TITLE WHERE TITLE_CODE=@TITLE_CODE"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@TITLE_CODE", TITLE_CODE)

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

	Public Function bindingTbTitle(ByVal reader as SqlDataReader) As TbTitle

		Dim objTbTitle As New TbTitle

		objTbTitle.TITLE_CODE = CType(ConvertUtil.getObjectValue(reader("TITLE_CODE"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
		objTbTitle.TITLE_NAME = CType(ConvertUtil.getObjectValue(reader("TITLE_NAME"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objTbTitle.TITLE_NAME_E = CType(ConvertUtil.getObjectValue(reader("TITLE_NAME_E"), ConvertUtil.ObjectValueEnum.StringValue), String)

		Return objTbTitle

	End Function

End Class
