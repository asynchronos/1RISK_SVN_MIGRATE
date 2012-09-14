Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class UploadFileDAL

	Private Shared className As String = "UploadFileDAL"

	Public Function getUploadFileByID(ByVal objUploadFile As UploadFile) As UploadFile

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New UploadFile()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "ID, USER_ID, FILE_TYPE, REMARK, " _
             & "COLL_ID, ANNALS_ID, PATH, CREATE_DATE, BeginCREATE_DATE " _
             & "FROM UPLOAD_FILE " _
             & "WHERE ID=@ID " _
             & "ORDER BY ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@ID", objUploadFile.ID)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingUploadFile(reader)
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

	Public Function getUploadFileByID(ByVal ID As Integer) As UploadFile

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New UploadFile()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "ID, USER_ID, FILE_TYPE, REMARK, " _
             & "COLL_ID, ANNALS_ID, PATH, CREATE_DATE, BeginCREATE_DATE  " _
             & "FROM UPLOAD_FILE " _
             & "WHERE ID=@ID " _
             & "ORDER BY ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@ID", ID)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingUploadFile(reader)
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

	Public Function getAllUploadFile() As List (Of UploadFile)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of UploadFile)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "ID, USER_ID, FILE_TYPE, REMARK, " _
             & "COLL_ID, ANNALS_ID, PATH, CREATE_DATE, BeginCREATE_DATE  " _
             & "FROM UPLOAD_FILE " _
             & "ORDER BY ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingUploadFile(reader))
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

	Public Function getAllUploadFileBySQL(ByVal sql AS String) As List (Of UploadFile)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of UploadFile)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingUploadFile(reader))
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

	Public Sub insertUploadFile(ByVal objUploadFile As UploadFile)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "INSERT INTO UPLOAD_FILE " _
                & " (USER_ID, FILE_TYPE, REMARK, COLL_ID, ANNALS_ID, PATH, CREATE_DATE, BeginCREATE_DATE ) " _
                & " VALUES(@USER_ID, @FILE_TYPE, @REMARK, @COLL_ID, @ANNALS_ID, @PATH, getdate(),@BeginCREATE_DATE) "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

            'sqlCmd.Parameters.AddWithValue("@ID", objUploadFile.ID)
			sqlCmd.Parameters.AddWithValue("@USER_ID", objUploadFile.USER_ID)
			sqlCmd.Parameters.AddWithValue("@FILE_TYPE", objUploadFile.FILE_TYPE)
			sqlCmd.Parameters.AddWithValue("@REMARK", objUploadFile.REMARK)
			sqlCmd.Parameters.AddWithValue("@COLL_ID", objUploadFile.COLL_ID)
			sqlCmd.Parameters.AddWithValue("@ANNALS_ID", objUploadFile.ANNALS_ID)
			sqlCmd.Parameters.AddWithValue("@PATH", objUploadFile.PATH)
            sqlCmd.Parameters.AddWithValue("@CREATE_DATE", objUploadFile.CREATE_DATE)
            sqlCmd.Parameters.AddWithValue("@BeginCREATE_DATE", objUploadFile.BeginCREATE_DATE)

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

	Public Sub updateUploadFile(ByVal objUploadFile As UploadFile)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "UPDATE UPLOAD_FILE SET " _
                & " USER_ID=@USER_ID, " _
                & " FILE_TYPE=@FILE_TYPE, " _
                & " REMARK=@REMARK, " _
                & " COLL_ID=@COLL_ID, " _
                & " ANNALS_ID=@ANNALS_ID, " _
                & " PATH=@PATH, " _
                & " CREATE_DATE=getDate(), " _
                & " BeginCREATE_DATE=@BeginCREATE_DATE " _
     & " WHERE ID=@ID "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@ID", objUploadFile.ID)
			sqlCmd.Parameters.AddWithValue("@USER_ID", objUploadFile.USER_ID)
			sqlCmd.Parameters.AddWithValue("@FILE_TYPE", objUploadFile.FILE_TYPE)
			sqlCmd.Parameters.AddWithValue("@REMARK", objUploadFile.REMARK)
			sqlCmd.Parameters.AddWithValue("@COLL_ID", objUploadFile.COLL_ID)
			sqlCmd.Parameters.AddWithValue("@ANNALS_ID", objUploadFile.ANNALS_ID)
			sqlCmd.Parameters.AddWithValue("@PATH", objUploadFile.PATH)
			sqlCmd.Parameters.AddWithValue("@CREATE_DATE", objUploadFile.CREATE_DATE)
            sqlCmd.Parameters.AddWithValue("@BeginCREATE_DATE", objUploadFile.BeginCREATE_DATE)

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

	Public Sub deleteUploadFile(ByVal objUploadFile As UploadFile)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM UPLOAD_FILE WHERE ID=@ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@ID", objUploadFile.ID)

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

	Public Sub deleteUploadFile(ByVal ID As Integer)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM UPLOAD_FILE WHERE ID=@ID"

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

	Public Function bindingUploadFile(ByVal reader as SqlDataReader) As UploadFile

		Dim objUploadFile As New UploadFile

		objUploadFile.ID = CType(ConvertUtil.getObjectValue(reader("ID"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
		objUploadFile.USER_ID = CType(ConvertUtil.getObjectValue(reader("USER_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objUploadFile.FILE_TYPE = CType(ConvertUtil.getObjectValue(reader("FILE_TYPE"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
		objUploadFile.REMARK = CType(ConvertUtil.getObjectValue(reader("REMARK"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objUploadFile.COLL_ID = CType(ConvertUtil.getObjectValue(reader("COLL_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objUploadFile.ANNALS_ID = CType(ConvertUtil.getObjectValue(reader("ANNALS_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objUploadFile.PATH = CType(ConvertUtil.getObjectValue(reader("PATH"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objUploadFile.CREATE_DATE = CType(ConvertUtil.getObjectValue(reader("CREATE_DATE"), ConvertUtil.ObjectValueEnum.DateValue), Date)
        objUploadFile.BeginCREATE_DATE = CType(ConvertUtil.getObjectValue(reader("BeginCREATE_DATE"), ConvertUtil.ObjectValueEnum.DateValue), Date)

		Return objUploadFile

	End Function

End Class
