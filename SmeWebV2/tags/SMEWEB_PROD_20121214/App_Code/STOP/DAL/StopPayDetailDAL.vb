Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class StopPayDetailDAL

	Private Shared className As String = "StopPayDetailDAL"

	Public Function getStopPayDetailByPAY_DETAIL_ID(ByVal objStopPayDetail As StopPayDetail) As StopPayDetail

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New StopPayDetail()

		Try
            conn = StopConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "PAY_DETAIL_ID, PAY_DETAIL " _
				& "FROM STOP_PAY_DETAIL " _
				& "WHERE PAY_DETAIL_ID=@PAY_DETAIL_ID " _
				& "ORDER BY PAY_DETAIL_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@PAY_DETAIL_ID", objStopPayDetail.PAY_DETAIL_ID)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingStopPayDetail(reader)
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

	Public Function getStopPayDetailByPAY_DETAIL_ID(ByVal PAY_DETAIL_ID As String) As StopPayDetail

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New StopPayDetail()

		Try
            conn = StopConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "PAY_DETAIL_ID, PAY_DETAIL " _
				& "FROM STOP_PAY_DETAIL " _
				& "WHERE PAY_DETAIL_ID=@PAY_DETAIL_ID " _
				& "ORDER BY PAY_DETAIL_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@PAY_DETAIL_ID", PAY_DETAIL_ID)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingStopPayDetail(reader)
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

	Public Function getAllStopPayDetail() As List (Of StopPayDetail)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of StopPayDetail)

		Try
            conn = StopConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "PAY_DETAIL_ID, PAY_DETAIL " _
				& "FROM STOP_PAY_DETAIL " _
				& "ORDER BY PAY_DETAIL_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingStopPayDetail(reader))
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

	Public Function getAllStopPayDetailBySQL(ByVal sql AS String) As List (Of StopPayDetail)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of StopPayDetail)

		Try
            conn = StopConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingStopPayDetail(reader))
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

	Public Sub insertStopPayDetail(ByVal objStopPayDetail As StopPayDetail)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
            conn = StopConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "INSERT INTO STOP_PAY_DETAIL " _
							& " (PAY_DETAIL_ID, PAY_DETAIL) " _
							& " VALUES(@PAY_DETAIL_ID, @PAY_DETAIL) "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@PAY_DETAIL_ID", objStopPayDetail.PAY_DETAIL_ID)
			sqlCmd.Parameters.AddWithValue("@PAY_DETAIL", objStopPayDetail.PAY_DETAIL)

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

	Public Sub updateStopPayDetail(ByVal objStopPayDetail As StopPayDetail)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
            conn = StopConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "UPDATE STOP_PAY_DETAIL SET " _
							& " PAY_DETAIL=@PAY_DETAIL " _
							& " WHERE PAY_DETAIL_ID=@PAY_DETAIL_ID "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@PAY_DETAIL_ID", objStopPayDetail.PAY_DETAIL_ID)
			sqlCmd.Parameters.AddWithValue("@PAY_DETAIL", objStopPayDetail.PAY_DETAIL)

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

	Public Sub deleteStopPayDetail(ByVal objStopPayDetail As StopPayDetail)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
            conn = StopConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM STOP_PAY_DETAIL WHERE PAY_DETAIL_ID=@PAY_DETAIL_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@PAY_DETAIL_ID", objStopPayDetail.PAY_DETAIL_ID)

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

	Public Sub deleteStopPayDetail(ByVal PAY_DETAIL_ID As String)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
            conn = StopConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM STOP_PAY_DETAIL WHERE PAY_DETAIL_ID=@PAY_DETAIL_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@PAY_DETAIL_ID", PAY_DETAIL_ID)

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

	Public Function bindingStopPayDetail(ByVal reader as SqlDataReader) As StopPayDetail

		Dim objStopPayDetail As New StopPayDetail

		objStopPayDetail.PAY_DETAIL_ID = CType(ConvertUtil.getObjectValue(reader("PAY_DETAIL_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objStopPayDetail.PAY_DETAIL = CType(ConvertUtil.getObjectValue(reader("PAY_DETAIL"), ConvertUtil.ObjectValueEnum.StringValue), String)

		Return objStopPayDetail

	End Function

End Class
