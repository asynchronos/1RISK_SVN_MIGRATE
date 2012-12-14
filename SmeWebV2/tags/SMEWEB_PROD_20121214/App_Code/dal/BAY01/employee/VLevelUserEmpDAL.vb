Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class VLevelUserEmpDAL

    Private Shared className As String = "VLevelUserEmpDAL"

    Public Function getVLevelUserEmpByLEVEL_ID(ByVal objVLevelUserEmp As VLevelUserEmp) As VLevelUserEmp

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New VLevelUserEmp()

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "LEVEL_ID, LEVEL_CODE, LEVEL_NAME, LEVEL_ROOT, " _
             & "EMP_ID, TITLE_NAME, TITLE_CODE, EMPNAME, " _
             & "EMPSURNAME " _
             & "FROM V_Level_User_Emp " _
             & "WHERE LEVEL_ID=@LEVEL_ID " _
             & "ORDER BY LEVEL_ID"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@LEVEL_ID", objVLevelUserEmp.LEVEL_ID)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result = bindingVLevelUserEmp(reader)
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
    Public Function getVLevelUserEmpByLEVEL_ID(ByVal LEVEL_ID As String) As VLevelUserEmp

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New VLevelUserEmp()

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "LEVEL_ID, LEVEL_CODE, LEVEL_NAME, LEVEL_ROOT, " _
             & "EMP_ID, TITLE_NAME, TITLE_CODE, EMPNAME, " _
             & "EMPSURNAME " _
             & "FROM V_Level_User_Emp " _
             & "WHERE LEVEL_ID=@LEVEL_ID " _
             & "ORDER BY LEVEL_ID"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@LEVEL_ID", LEVEL_ID)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result = bindingVLevelUserEmp(reader)
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
    Public Function getListVLevelUserEmpByRootID(ByVal LEVEL_ID As String) As List(Of VLevelUserEmp)

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New List(Of VLevelUserEmp)

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "LEVEL_ID, LEVEL_CODE, LEVEL_NAME, LEVEL_ROOT, " _
             & "EMP_ID, TITLE_NAME, TITLE_CODE, EMPNAME, " _
             & "EMPSURNAME " _
             & "FROM V_Level_User_Emp " _
            & "WHERE Level_root=@LEVEL_ID " _
            & "ORDER BY LEVEL_ID"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@LEVEL_ID", LEVEL_ID)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result.Add(bindingVLevelUserEmp(reader))
            End While

            reader.Close()
            conn.Close()
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
    Public Function getListVLevelUserEmpByEMP_ID(ByVal EMP_ID As String) As List(Of VLevelUserEmp)

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New List(Of VLevelUserEmp)

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "LEVEL_ID, LEVEL_CODE, LEVEL_NAME, LEVEL_ROOT, " _
             & "EMP_ID, TITLE_NAME, TITLE_CODE, EMPNAME, " _
             & "EMPSURNAME " _
             & "FROM V_Level_User_Emp " _
            & "WHERE EMP_ID=@EMP_ID " _
            & "ORDER BY LEVEL_ID"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@EMP_ID", EMP_ID)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result.Add(bindingVLevelUserEmp(reader))
            End While

            reader.Close()
            conn.Close()
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
    Public Function getListVLevelUserEmpByLevel_id(ByVal LEVEL_ID As String) As List(Of VLevelUserEmp)

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New List(Of VLevelUserEmp)

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "LEVEL_ID, LEVEL_CODE, LEVEL_NAME, LEVEL_ROOT, " _
             & "EMP_ID, TITLE_NAME, TITLE_CODE, EMPNAME, " _
             & "EMPSURNAME " _
             & "FROM V_Level_User_Emp " _
            & "WHERE Level_ID=@LEVEL_ID " _
            & "ORDER BY LEVEL_ID"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@LEVEL_ID", LEVEL_ID)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result.Add(bindingVLevelUserEmp(reader))
            End While

            reader.Close()
            conn.Close()
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
    Public Function getListALLVLevelUserEmp() As List(Of VLevelUserEmp)

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New List(Of VLevelUserEmp)

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "LEVEL_ID, LEVEL_CODE, LEVEL_NAME, LEVEL_ROOT, " _
             & "EMP_ID, TITLE_NAME, TITLE_CODE, EMPNAME, " _
             & "EMPSURNAME " _
             & " FROM V_Level_User_Emp " _
              & " ORDER BY LEVEL_ID"
            ' ยกเว้นรหัสของพี่โป้ง และ พี่ยุก
            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result.Add(bindingVLevelUserEmp(reader))
            End While

            reader.Close()
            conn.Close()
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
    Public Function getListALLVLevelUserEmpNoBoss() As List(Of VLevelUserEmp)

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New List(Of VLevelUserEmp)

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "LEVEL_ID, LEVEL_CODE, LEVEL_NAME, LEVEL_ROOT, " _
             & "EMP_ID, TITLE_NAME, TITLE_CODE, EMPNAME, " _
             & "EMPSURNAME " _
             & "FROM V_Level_User_Emp " _
             & " WHERE EMP_ID  <> '128678' and EMP_ID <> '095448'" _
                   & "ORDER BY LEVEL_ID"
            ' ยกเว้นรหัสของพี่โป้ง และ พี่ยุก
            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result.Add(bindingVLevelUserEmp(reader))
            End While

            reader.Close()
            conn.Close()
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
	Public Function getAllVLevelUserEmpBySQL(ByVal sql AS String) As List (Of VLevelUserEmp)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of VLevelUserEmp)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingVLevelUserEmp(reader))
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
    Public Function bindingVLevelUserEmp(ByVal reader As SqlDataReader) As VLevelUserEmp

        Dim objVLevelUserEmp As New VLevelUserEmp

        objVLevelUserEmp.LEVEL_ID = CType(ConvertUtil.getObjectValue(reader("LEVEL_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objVLevelUserEmp.LEVEL_CODE = CType(ConvertUtil.getObjectValue(reader("LEVEL_CODE"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objVLevelUserEmp.LEVEL_NAME = CType(ConvertUtil.getObjectValue(reader("LEVEL_NAME"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objVLevelUserEmp.LEVEL_ROOT = CType(ConvertUtil.getObjectValue(reader("LEVEL_ROOT"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objVLevelUserEmp.EMP_ID = CType(ConvertUtil.getObjectValue(reader("EMP_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objVLevelUserEmp.TITLE_NAME = CType(ConvertUtil.getObjectValue(reader("TITLE_NAME"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objVLevelUserEmp.TITLE_CODE = CType(ConvertUtil.getObjectValue(reader("TITLE_CODE"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objVLevelUserEmp.EMPNAME = CType(ConvertUtil.getObjectValue(reader("EMPNAME"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objVLevelUserEmp.EMPSURNAME = CType(ConvertUtil.getObjectValue(reader("EMPSURNAME"), ConvertUtil.ObjectValueEnum.StringValue), String)

        Return objVLevelUserEmp

    End Function

End Class
