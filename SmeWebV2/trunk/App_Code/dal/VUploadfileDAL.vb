Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class VUploadfileDAL

	Private Shared className As String = "VUploadfileDAL"

	Public Function getVUploadfileByID(ByVal objVUploadfile As VUploadfile) As VUploadfile

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New VUploadfile()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "ID, USER_ID, REMARK, TYPE, " _
             & "COLL_ID, ANNALS_ID, PATH, CREATE_DATE, " _
             & "FILE_TYPE ,FILE_YEAR " _
             & "FROM V_UPLOADFILE " _
             & "WHERE ID=@ID " _
             & "ORDER BY ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@ID", objVUploadfile.ID)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingVUploadfile(reader)
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

	Public Function getVUploadfileByID(ByVal ID As Integer) As VUploadfile

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New VUploadfile()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "ID, USER_ID, REMARK, TYPE, " _
             & "COLL_ID, ANNALS_ID, PATH, CREATE_DATE, " _
             & "FILE_TYPE ,FILE_YEAR " _
             & "FROM V_UPLOADFILE " _
             & "WHERE ID=@ID " _
             & "ORDER BY ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@ID", ID)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingVUploadfile(reader)
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

	Public Function getAllVUploadfile() As List (Of VUploadfile)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of VUploadfile)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "ID, USER_ID, REMARK, TYPE, " _
             & "COLL_ID, ANNALS_ID, PATH, CREATE_DATE, " _
               & "FILE_TYPE ,FILE_YEAR " _
             & "FROM V_UPLOADFILE " _
             & "ORDER BY ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingVUploadfile(reader))
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

	Public Function getAllVUploadfileBySQL(ByVal sql AS String) As List (Of VUploadfile)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of VUploadfile)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingVUploadfile(reader))
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

    Public Function bindingVUploadfile(ByVal reader As SqlDataReader) As VUploadfile

        Dim objVUploadfile As New VUploadfile

        objVUploadfile.ID = CType(ConvertUtil.getObjectValue(reader("ID"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objVUploadfile.USER_ID = CType(ConvertUtil.getObjectValue(reader("USER_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objVUploadfile.REMARK = CType(ConvertUtil.getObjectValue(reader("REMARK"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objVUploadfile.TYPE = CType(ConvertUtil.getObjectValue(reader("TYPE"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objVUploadfile.COLL_ID = CType(ConvertUtil.getObjectValue(reader("COLL_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objVUploadfile.ANNALS_ID = CType(ConvertUtil.getObjectValue(reader("ANNALS_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objVUploadfile.PATH = CType(ConvertUtil.getObjectValue(reader("PATH"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objVUploadfile.CREATE_DATE = CType(ConvertUtil.getObjectValue(reader("CREATE_DATE"), ConvertUtil.ObjectValueEnum.DateValue), Date)
        objVUploadfile.FILE_TYPE = CType(ConvertUtil.getObjectValue(reader("FILE_TYPE"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objVUploadfile.FILE_YEAR = CType(ConvertUtil.getObjectValue(reader("FILE_YEAR"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)

        Return objVUploadfile

    End Function

End Class
