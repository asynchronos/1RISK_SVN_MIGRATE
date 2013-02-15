Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class TbDegreeDAL

	Private Shared className As String = "TbDegreeDAL"

	Public Function getTbDegreeByDEGREE_CODE(ByVal objTbDegree As TbDegree) As TbDegree

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New TbDegree()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "DEGREE_CODE, DEGREE_NAME " _
				& "FROM TB_DEGREE " _
				& "WHERE DEGREE_CODE=@DEGREE_CODE " _
				& "ORDER BY DEGREE_CODE"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@DEGREE_CODE", objTbDegree.DEGREE_CODE)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingTbDegree(reader)
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

	Public Function getTbDegreeByDEGREE_CODE(ByVal DEGREE_CODE As Integer) As TbDegree

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New TbDegree()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "DEGREE_CODE, DEGREE_NAME " _
				& "FROM TB_DEGREE " _
				& "WHERE DEGREE_CODE=@DEGREE_CODE " _
				& "ORDER BY DEGREE_CODE"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@DEGREE_CODE", DEGREE_CODE)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingTbDegree(reader)
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

	Public Function getAllTbDegree() As List (Of TbDegree)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of TbDegree)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "DEGREE_CODE, DEGREE_NAME " _
				& "FROM TB_DEGREE " _
				& "ORDER BY DEGREE_CODE"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingTbDegree(reader))
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

	Public Function getAllTbDegreeBySQL(ByVal sql AS String) As List (Of TbDegree)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of TbDegree)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingTbDegree(reader))
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

	Public Sub insertTbDegree(ByVal objTbDegree As TbDegree)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "INSERT INTO TB_DEGREE " _
							& " (DEGREE_CODE, DEGREE_NAME) " _
							& " VALUES(@DEGREE_CODE, @DEGREE_NAME) "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@DEGREE_CODE", objTbDegree.DEGREE_CODE)
			sqlCmd.Parameters.AddWithValue("@DEGREE_NAME", objTbDegree.DEGREE_NAME)

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

	Public Sub updateTbDegree(ByVal objTbDegree As TbDegree)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "UPDATE TB_DEGREE SET " _
							& " DEGREE_NAME=@DEGREE_NAME " _
							& " WHERE DEGREE_CODE=@DEGREE_CODE "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@DEGREE_CODE", objTbDegree.DEGREE_CODE)
			sqlCmd.Parameters.AddWithValue("@DEGREE_NAME", objTbDegree.DEGREE_NAME)

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

	Public Sub deleteTbDegree(ByVal objTbDegree As TbDegree)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM TB_DEGREE WHERE DEGREE_CODE=@DEGREE_CODE"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@DEGREE_CODE", objTbDegree.DEGREE_CODE)

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

	Public Sub deleteTbDegree(ByVal DEGREE_CODE As Integer)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM TB_DEGREE WHERE DEGREE_CODE=@DEGREE_CODE"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@DEGREE_CODE", DEGREE_CODE)

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

	Public Function bindingTbDegree(ByVal reader as SqlDataReader) As TbDegree

		Dim objTbDegree As New TbDegree

		objTbDegree.DEGREE_CODE = CType(ConvertUtil.getObjectValue(reader("DEGREE_CODE"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
		objTbDegree.DEGREE_NAME = CType(ConvertUtil.getObjectValue(reader("DEGREE_NAME"), ConvertUtil.ObjectValueEnum.StringValue), String)

		Return objTbDegree

	End Function

End Class
