Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class CustomerSmeSizeDAL

	Private Shared className As String = "CustomerSmeSizeDAL"

	Public Function getCustomerSmeSizeBySIZE_ID(ByVal objCustomerSmeSize As CustomerSmeSize) As CustomerSmeSize

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New CustomerSmeSize()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "SIZE_ID, SIZE_DETAIL, PRIORITY " _
				& "FROM CUSTOMER_SME_SIZE " _
				& "WHERE SIZE_ID=@SIZE_ID " _
				& "ORDER BY SIZE_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@SIZE_ID", objCustomerSmeSize.SIZE_ID)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingCustomerSmeSize(reader)
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

	Public Function getCustomerSmeSizeBySIZE_ID(ByVal SIZE_ID As Integer) As CustomerSmeSize

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New CustomerSmeSize()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "SIZE_ID, SIZE_DETAIL, PRIORITY " _
				& "FROM CUSTOMER_SME_SIZE " _
				& "WHERE SIZE_ID=@SIZE_ID " _
				& "ORDER BY SIZE_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@SIZE_ID", SIZE_ID)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingCustomerSmeSize(reader)
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

	Public Function getAllCustomerSmeSize() As List (Of CustomerSmeSize)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of CustomerSmeSize)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "SIZE_ID, SIZE_DETAIL, PRIORITY " _
             & "FROM CUSTOMER_SME_SIZE " _
             & "ORDER BY PRIORITY"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingCustomerSmeSize(reader))
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

	Public Function getAllCustomerSmeSizeBySQL(ByVal sql AS String) As List (Of CustomerSmeSize)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of CustomerSmeSize)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingCustomerSmeSize(reader))
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

	Public Sub insertCustomerSmeSize(ByVal objCustomerSmeSize As CustomerSmeSize)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "INSERT INTO CUSTOMER_SME_SIZE " _
							& " (SIZE_ID, SIZE_DETAIL, PRIORITY) " _
							& " VALUES(@SIZE_ID, @SIZE_DETAIL, @PRIORITY) "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@SIZE_ID", objCustomerSmeSize.SIZE_ID)
			sqlCmd.Parameters.AddWithValue("@SIZE_DETAIL", objCustomerSmeSize.SIZE_DETAIL)
			sqlCmd.Parameters.AddWithValue("@PRIORITY", objCustomerSmeSize.PRIORITY)

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

	Public Sub updateCustomerSmeSize(ByVal objCustomerSmeSize As CustomerSmeSize)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "UPDATE CUSTOMER_SME_SIZE SET " _
							& " SIZE_DETAIL=@SIZE_DETAIL, " _
							& " PRIORITY=@PRIORITY " _
							& " WHERE SIZE_ID=@SIZE_ID "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@SIZE_ID", objCustomerSmeSize.SIZE_ID)
			sqlCmd.Parameters.AddWithValue("@SIZE_DETAIL", objCustomerSmeSize.SIZE_DETAIL)
			sqlCmd.Parameters.AddWithValue("@PRIORITY", objCustomerSmeSize.PRIORITY)

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

	Public Sub deleteCustomerSmeSize(ByVal objCustomerSmeSize As CustomerSmeSize)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM CUSTOMER_SME_SIZE WHERE SIZE_ID=@SIZE_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@SIZE_ID", objCustomerSmeSize.SIZE_ID)

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

	Public Sub deleteCustomerSmeSize(ByVal SIZE_ID As Integer)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM CUSTOMER_SME_SIZE WHERE SIZE_ID=@SIZE_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@SIZE_ID", SIZE_ID)

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

	Public Function bindingCustomerSmeSize(ByVal reader as SqlDataReader) As CustomerSmeSize

		Dim objCustomerSmeSize As New CustomerSmeSize

		objCustomerSmeSize.SIZE_ID = CType(ConvertUtil.getObjectValue(reader("SIZE_ID"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
		objCustomerSmeSize.SIZE_DETAIL = CType(ConvertUtil.getObjectValue(reader("SIZE_DETAIL"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objCustomerSmeSize.PRIORITY = CType(ConvertUtil.getObjectValue(reader("PRIORITY"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)

		Return objCustomerSmeSize

	End Function

End Class
