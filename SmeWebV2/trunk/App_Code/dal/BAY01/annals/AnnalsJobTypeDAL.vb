Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class AnnalsJobTypeDAL

	Private Shared className As String = "AnnalsJobTypeDAL"

	Public Function getAnnalsJobTypeByJob_Type_Id(ByVal objAnnalsJobType As AnnalsJobType) As AnnalsJobType

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New AnnalsJobType()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "Job_Type_Id, Job_Type " _
				& "FROM ANNALS_JOB_TYPE " _
				& "WHERE Job_Type_Id=@Job_Type_Id " _
				& "ORDER BY Job_Type_Id"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@Job_Type_Id", objAnnalsJobType.Job_Type_Id)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingAnnalsJobType(reader)
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

	Public Function getAnnalsJobTypeByJob_Type_Id(ByVal Job_Type_Id As String) As AnnalsJobType

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New AnnalsJobType()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "Job_Type_Id, Job_Type " _
				& "FROM ANNALS_JOB_TYPE " _
				& "WHERE Job_Type_Id=@Job_Type_Id " _
				& "ORDER BY Job_Type_Id"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@Job_Type_Id", Job_Type_Id)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingAnnalsJobType(reader)
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

	Public Function getAllAnnalsJobType() As List (Of AnnalsJobType)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of AnnalsJobType)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = " SELECT " _
             & " Job_Type_Id, Job_Type " _
             & " FROM ANNALS_JOB_TYPE " _
             & " WHERE DEL_FLAG = 0 " _
             & " ORDER BY Job_Type_Id"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingAnnalsJobType(reader))
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

	Public Function getAllAnnalsJobTypeBySQL(ByVal sql AS String) As List (Of AnnalsJobType)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of AnnalsJobType)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingAnnalsJobType(reader))
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

	Public Sub insertAnnalsJobType(ByVal objAnnalsJobType As AnnalsJobType)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "INSERT INTO ANNALS_JOB_TYPE " _
							& " (Job_Type_Id, Job_Type) " _
							& " VALUES(@Job_Type_Id, @Job_Type) "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@Job_Type_Id", objAnnalsJobType.Job_Type_Id)
			sqlCmd.Parameters.AddWithValue("@Job_Type", objAnnalsJobType.Job_Type)

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

	Public Sub updateAnnalsJobType(ByVal objAnnalsJobType As AnnalsJobType)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "UPDATE ANNALS_JOB_TYPE SET " _
							& " Job_Type=@Job_Type " _
							& " WHERE Job_Type_Id=@Job_Type_Id "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@Job_Type_Id", objAnnalsJobType.Job_Type_Id)
			sqlCmd.Parameters.AddWithValue("@Job_Type", objAnnalsJobType.Job_Type)

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

	Public Sub deleteAnnalsJobType(ByVal objAnnalsJobType As AnnalsJobType)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM ANNALS_JOB_TYPE WHERE Job_Type_Id=@Job_Type_Id"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@Job_Type_Id", objAnnalsJobType.Job_Type_Id)

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

	Public Sub deleteAnnalsJobType(ByVal Job_Type_Id As String)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM ANNALS_JOB_TYPE WHERE Job_Type_Id=@Job_Type_Id"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@Job_Type_Id", Job_Type_Id)

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

	Public Function bindingAnnalsJobType(ByVal reader as SqlDataReader) As AnnalsJobType

		Dim objAnnalsJobType As New AnnalsJobType

		objAnnalsJobType.Job_Type_Id = CType(ConvertUtil.getObjectValue(reader("Job_Type_Id"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objAnnalsJobType.Job_Type = CType(ConvertUtil.getObjectValue(reader("Job_Type"), ConvertUtil.ObjectValueEnum.StringValue), String)

		Return objAnnalsJobType

	End Function

End Class
