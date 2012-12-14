Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class AnnalsCreditProcessDAL

	Private Shared className As String = "AnnalsCreditProcessDAL"

	Public Function getAnnalsCreditProcessByID(ByVal objAnnalsCreditProcess As AnnalsCreditProcess) As AnnalsCreditProcess

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New AnnalsCreditProcess()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "ID, EMP_ID,USER_ID, PROCESS_ID, PROCESS_DATE " _
             & "FROM ANNALS_CREDIT_PROCESS " _
             & "WHERE ID=@ID " _
             & "ORDER BY  PROCESS_DATE"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@ID", objAnnalsCreditProcess.ID)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingAnnalsCreditProcess(reader)
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

	Public Function getAnnalsCreditProcessByID(ByVal ID As String) As AnnalsCreditProcess

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New AnnalsCreditProcess()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "ID, EMP_ID,USER_ID, PROCESS_ID, PROCESS_DATE " _
             & "FROM ANNALS_CREDIT_PROCESS " _
             & "WHERE ID=@ID " _
             & "ORDER BY  PROCESS_DATE"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@ID", ID)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingAnnalsCreditProcess(reader)
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

	Public Function getAllAnnalsCreditProcess() As List (Of AnnalsCreditProcess)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of AnnalsCreditProcess)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "ID, EMP_ID,USER_ID, PROCESS_ID, PROCESS_DATE " _
             & "FROM ANNALS_CREDIT_PROCESS " _
             & "ORDER BY  PROCESS_DATE"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingAnnalsCreditProcess(reader))
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

	Public Function getAllAnnalsCreditProcessBySQL(ByVal sql AS String) As List (Of AnnalsCreditProcess)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of AnnalsCreditProcess)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingAnnalsCreditProcess(reader))
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

	Public Sub insertAnnalsCreditProcess(ByVal objAnnalsCreditProcess As AnnalsCreditProcess)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "INSERT INTO ANNALS_CREDIT_PROCESS " _
                & " (ID, EMP_ID,USER_ID,PROCESS_ID, PROCESS_DATE) " _
                & " VALUES(@ID, @EMP_ID,@USER_ID,@PROCESS_ID, @PROCESS_DATE) "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@ID", objAnnalsCreditProcess.ID)
            sqlCmd.Parameters.AddWithValue("@EMP_ID", objAnnalsCreditProcess.EMP_ID)
            sqlCmd.Parameters.AddWithValue("@USER_ID", objAnnalsCreditProcess.USER_ID)
            sqlCmd.Parameters.AddWithValue("@PROCESS_ID", objAnnalsCreditProcess.PROCESS_ID)
			sqlCmd.Parameters.AddWithValue("@PROCESS_DATE", objAnnalsCreditProcess.PROCESS_DATE)

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

	Public Sub updateAnnalsCreditProcess(ByVal objAnnalsCreditProcess As AnnalsCreditProcess)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "UPDATE ANNALS_CREDIT_PROCESS SET " _
                & " EMP_ID=@EMP_ID, " _
                & " USER_ID=@USER_ID, " _
                & " PROCESS_ID=@PROCESS_ID, " _
                & " PROCESS_DATE=@PROCESS_DATE " _
                & " WHERE ID=@ID "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@ID", objAnnalsCreditProcess.ID)
            sqlCmd.Parameters.AddWithValue("@EMP_ID", objAnnalsCreditProcess.EMP_ID)
            sqlCmd.Parameters.AddWithValue("@USER_ID", objAnnalsCreditProcess.EMP_ID)
            sqlCmd.Parameters.AddWithValue("@PROCESS_ID", objAnnalsCreditProcess.PROCESS_ID)
			sqlCmd.Parameters.AddWithValue("@PROCESS_DATE", objAnnalsCreditProcess.PROCESS_DATE)

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

	Public Sub deleteAnnalsCreditProcess(ByVal objAnnalsCreditProcess As AnnalsCreditProcess)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM ANNALS_CREDIT_PROCESS WHERE ID=@ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@ID", objAnnalsCreditProcess.ID)

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

	Public Sub deleteAnnalsCreditProcess(ByVal ID As String)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM ANNALS_CREDIT_PROCESS WHERE ID=@ID"

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

	Public Function bindingAnnalsCreditProcess(ByVal reader as SqlDataReader) As AnnalsCreditProcess

		Dim objAnnalsCreditProcess As New AnnalsCreditProcess

		objAnnalsCreditProcess.ID = CType(ConvertUtil.getObjectValue(reader("ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsCreditProcess.EMP_ID = CType(ConvertUtil.getObjectValue(reader("EMP_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsCreditProcess.EMP_ID = CType(ConvertUtil.getObjectValue(reader("USER_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsCreditProcess.PROCESS_ID = CType(ConvertUtil.getObjectValue(reader("PROCESS_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objAnnalsCreditProcess.PROCESS_DATE = CType(ConvertUtil.getObjectValue(reader("PROCESS_DATE"), ConvertUtil.ObjectValueEnum.DateValue), Date)

		Return objAnnalsCreditProcess

	End Function

End Class
