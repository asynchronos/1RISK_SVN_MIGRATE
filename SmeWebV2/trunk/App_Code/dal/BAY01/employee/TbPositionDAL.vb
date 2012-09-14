Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class TbPositionDAL

	Private Shared className As String = "TbPositionDAL"

	Public Function getTbPositionByPOSITION_CODE(ByVal objTbPosition As TbPosition) As TbPosition

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New TbPosition()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "POSITION_CODE, POSITON, POSITION_ENG " _
				& "FROM TB_POSITION " _
				& "WHERE POSITION_CODE=@POSITION_CODE " _
				& "ORDER BY POSITION_CODE"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@POSITION_CODE", objTbPosition.POSITION_CODE)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingTbPosition(reader)
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

	Public Function getTbPositionByPOSITION_CODE(ByVal POSITION_CODE As String) As TbPosition

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New TbPosition()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "POSITION_CODE, POSITON, POSITION_ENG " _
				& "FROM TB_POSITION " _
				& "WHERE POSITION_CODE=@POSITION_CODE " _
				& "ORDER BY POSITION_CODE"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@POSITION_CODE", POSITION_CODE)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingTbPosition(reader)
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

	Public Function getAllTbPosition() As List (Of TbPosition)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of TbPosition)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "POSITION_CODE, POSITON, POSITION_ENG " _
				& "FROM TB_POSITION " _
				& "ORDER BY POSITION_CODE"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingTbPosition(reader))
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

	Public Function getAllTbPositionBySQL(ByVal sql AS String) As List (Of TbPosition)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of TbPosition)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingTbPosition(reader))
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

	Public Sub insertTbPosition(ByVal objTbPosition As TbPosition)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "INSERT INTO TB_POSITION " _
							& " (POSITION_CODE, POSITON, POSITION_ENG) " _
							& " VALUES(@POSITION_CODE, @POSITON, @POSITION_ENG) "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@POSITION_CODE", objTbPosition.POSITION_CODE)
			sqlCmd.Parameters.AddWithValue("@POSITON", objTbPosition.POSITON)
			sqlCmd.Parameters.AddWithValue("@POSITION_ENG", objTbPosition.POSITION_ENG)

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

	Public Sub updateTbPosition(ByVal objTbPosition As TbPosition)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "UPDATE TB_POSITION SET " _
							& " POSITON=@POSITON, " _
							& " POSITION_ENG=@POSITION_ENG " _
							& " WHERE POSITION_CODE=@POSITION_CODE "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@POSITION_CODE", objTbPosition.POSITION_CODE)
			sqlCmd.Parameters.AddWithValue("@POSITON", objTbPosition.POSITON)
			sqlCmd.Parameters.AddWithValue("@POSITION_ENG", objTbPosition.POSITION_ENG)

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

	Public Sub deleteTbPosition(ByVal objTbPosition As TbPosition)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM TB_POSITION WHERE POSITION_CODE=@POSITION_CODE"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@POSITION_CODE", objTbPosition.POSITION_CODE)

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

	Public Sub deleteTbPosition(ByVal POSITION_CODE As String)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM TB_POSITION WHERE POSITION_CODE=@POSITION_CODE"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@POSITION_CODE", POSITION_CODE)

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

	Public Function bindingTbPosition(ByVal reader as SqlDataReader) As TbPosition

		Dim objTbPosition As New TbPosition

		objTbPosition.POSITION_CODE = CType(ConvertUtil.getObjectValue(reader("POSITION_CODE"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objTbPosition.POSITON = CType(ConvertUtil.getObjectValue(reader("POSITON"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objTbPosition.POSITION_ENG = CType(ConvertUtil.getObjectValue(reader("POSITION_ENG"), ConvertUtil.ObjectValueEnum.StringValue), String)

		Return objTbPosition

	End Function

End Class
