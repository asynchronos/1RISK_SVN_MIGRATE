Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class VLevelLeadEmpDAL

	Private Shared className As String = "VLevelLeadEmpDAL"

	Public Function getVLevelLeadEmpByLevel_id(ByVal objVLevelLeadEmp As VLevelLeadEmp) As VLevelLeadEmp

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New VLevelLeadEmp()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "Level_id, Level_Root, Level_Name, Level_Code, " _
             & "EMP_ID, TITLE_CODE,TITLE_Name, EMPNAME, EMPSURNAME " _
             & "FROM V_Level_Lead_Emp " _
             & "WHERE Level_id=@Level_id "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@Level_id", objVLevelLeadEmp.Level_id)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingVLevelLeadEmp(reader)
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

	Public Function getVLevelLeadEmpByLevel_id(ByVal Level_id As Integer) As VLevelLeadEmp

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New VLevelLeadEmp()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "Level_id, Level_Root, Level_Name, Level_Code, " _
             & "EMP_ID, TITLE_CODE,TITLE_Name, EMPNAME, EMPSURNAME " _
             & "FROM V_Level_Lead_Emp " _
             & "WHERE Level_id=@Level_id "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@Level_id", Level_id)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingVLevelLeadEmp(reader)
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

    Public Function getListVLevelLeadEmpByLevel_id(ByVal Level_id As String) As List(Of VLevelLeadEmp)

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New List(Of VLevelLeadEmp)

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "Level_id, Level_Root, Level_Name, Level_Code, " _
             & "EMP_ID, TITLE_CODE,TITLE_Name, EMPNAME, EMPSURNAME " _
             & "FROM V_Level_Lead_Emp " _
             & "WHERE Level_id=@Level_id "

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@Level_id", Level_id)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result.Add(bindingVLevelLeadEmp(reader))
            End While

            reader.Close()
        Catch ex As Exception
            Throw New Exception(ex.Message & " : " & ex.StackTrace)
        Finally
            If (conn.State = ConnectionState.Open) Then
                conn.Close()
            End If
            conn = Nothing
        End Try

        Return result

    End Function
    Public Function getListVLevelLeadEmpByEmp_id(ByVal Emp_id As String) As List(Of VLevelLeadEmp)

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New List(Of VLevelLeadEmp)

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "Level_id, Level_Root, Level_Name, Level_Code, " _
             & "EMP_ID, TITLE_CODE,TITLE_Name,EMPNAME, EMPSURNAME " _
             & "FROM V_Level_Lead_Emp " _
             & "WHERE Emp_id=@Emp_id "

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@Emp_id", Emp_id)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result.Add(bindingVLevelLeadEmp(reader))
            End While

            reader.Close()
        Catch ex As Exception
            Throw New Exception(ex.Message & " : " & ex.StackTrace)
        Finally
            If (conn.State = ConnectionState.Open) Then
                conn.Close()
            End If
            conn = Nothing
        End Try

        Return result

    End Function
    Public Function getListVLevelLeadEmpByRootID(ByVal Level_id As String) As List(Of VLevelLeadEmp)

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New List(Of VLevelLeadEmp)

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "Level_id, Level_Root, Level_Name, Level_Code, " _
             & "EMP_ID, TITLE_CODE,TITLE_Name,EMPNAME, EMPSURNAME " _
             & "FROM V_Level_Lead_Emp " _
             & "WHERE  Level_Root=@Level_id "

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@Level_id", Level_id)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result.Add(bindingVLevelLeadEmp(reader))
            End While

            reader.Close()
        Catch ex As Exception
            Throw New Exception(ex.Message & " : " & ex.StackTrace)
        Finally
            If (conn.State = ConnectionState.Open) Then
                conn.Close()
            End If
            conn = Nothing
        End Try

        Return result

    End Function
	Public Function getAllVLevelLeadEmp() As List (Of VLevelLeadEmp)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of VLevelLeadEmp)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "Level_id, Level_Root, Level_Name, Level_Code, " _
             & "EMP_ID, TITLE_CODE,TITLE_Name, EMPNAME, EMPSURNAME " _
             & "FROM V_Level_Lead_Emp " _
             & "ORDER BY Level_id"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingVLevelLeadEmp(reader))
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

	Public Function bindingVLevelLeadEmp(ByVal reader as SqlDataReader) As VLevelLeadEmp

		Dim objVLevelLeadEmp As New VLevelLeadEmp

        objVLevelLeadEmp.Level_id = CType(ConvertUtil.getObjectValue(reader("Level_id"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objVLevelLeadEmp.Level_Root = CType(ConvertUtil.getObjectValue(reader("Level_Root"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objVLevelLeadEmp.Level_Name = CType(ConvertUtil.getObjectValue(reader("Level_Name"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objVLevelLeadEmp.Level_Code = CType(ConvertUtil.getObjectValue(reader("Level_Code"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objVLevelLeadEmp.EMP_ID = CType(ConvertUtil.getObjectValue(reader("EMP_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objVLevelLeadEmp.TITLE_NAME = CType(ConvertUtil.getObjectValue(reader("TITLE_NAME"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objVLevelLeadEmp.TITLE_CODE = CType(ConvertUtil.getObjectValue(reader("TITLE_CODE"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objVLevelLeadEmp.EMPNAME = CType(ConvertUtil.getObjectValue(reader("EMPNAME"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objVLevelLeadEmp.EMPSURNAME = CType(ConvertUtil.getObjectValue(reader("EMPSURNAME"), ConvertUtil.ObjectValueEnum.StringValue), String)

		Return objVLevelLeadEmp

	End Function

End Class
