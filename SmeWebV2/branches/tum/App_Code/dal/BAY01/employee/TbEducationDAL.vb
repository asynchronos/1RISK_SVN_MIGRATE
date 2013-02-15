Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class TbEducationDAL

	Private Shared className As String = "TbEducationDAL"

	Public Function getTbEducationByID(ByVal objTbEducation As TbEducation) As TbEducation

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New TbEducation()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
                      & " ID, EMP_ID,TB_EDUCATION.DEGREE_CODE,U_NAME, " _
                      & " MAJOR, DATEOFGRADUAT, UP_DT,DELE, DEGREE_Name" _
                      & " FROM  TB_EDUCATION inner join TB_DEGREE ON TB_EDUCATION.DEGREE_CODE=TB_DEGREE.DEGREE_CODE" _
                      & " Where  ID=@ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@ID", objTbEducation.ID)
            'sqlCmd.Parameters.AddWithValue("@EMP_ID", objTbEducation.ID)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingTbEducation(reader)
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

	Public Function getTbEducationByID(ByVal ID As Integer) As TbEducation

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New TbEducation()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "ID, EMP_ID, DEGREE_CODE, U_NAME, " _
				& "MAJOR, DATEOFGRADUAT, UP_DT, DELE " _
				& "FROM TB_EDUCATION " _
				& "WHERE ID=@ID " _
				& "ORDER BY ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@ID", ID)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingTbEducation(reader)
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

    Public Function getAllTbEducationByEmpID(ByVal Emp_ID As String) As List(Of TbEducation)

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New List(Of TbEducation)

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & " ID, EMP_ID,TB_EDUCATION.DEGREE_CODE,U_NAME, " _
             & " MAJOR, DATEOFGRADUAT, UP_DT,DELE, DEGREE_Name" _
             & " FROM  TB_EDUCATION inner join TB_DEGREE ON TB_EDUCATION.DEGREE_CODE=TB_DEGREE.DEGREE_CODE" _
             & " Where EMP_ID=@EMP_ID"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@EMP_ID", Emp_ID)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result.Add(bindingTbEducation(reader))
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

	Public Function getAllTbEducationBySQL(ByVal sql AS String) As List (Of TbEducation)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of TbEducation)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingTbEducation(reader))
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

	Public Sub insertTbEducation(ByVal objTbEducation As TbEducation)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "INSERT INTO TB_EDUCATION " _
                & " ( EMP_ID, DEGREE_CODE, U_NAME, MAJOR, DATEOFGRADUAT, UP_DT, DELE) " _
                & " VALUES(@EMP_ID, @DEGREE_CODE, @U_NAME, @MAJOR, @DATEOFGRADUAT,getdate(),'') "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@EMP_ID", objTbEducation.EMP_ID)
			sqlCmd.Parameters.AddWithValue("@DEGREE_CODE", objTbEducation.DEGREE_CODE)
			sqlCmd.Parameters.AddWithValue("@U_NAME", objTbEducation.U_NAME)
			sqlCmd.Parameters.AddWithValue("@MAJOR", objTbEducation.MAJOR)
			sqlCmd.Parameters.AddWithValue("@DATEOFGRADUAT", objTbEducation.DATEOFGRADUAT)
            

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

	Public Sub updateTbEducation(ByVal objTbEducation As TbEducation)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "UPDATE TB_EDUCATION SET " _
                & " EMP_ID=@EMP_ID, " _
                & " DEGREE_CODE=@DEGREE_CODE, " _
                & " U_NAME=@U_NAME, " _
                & " MAJOR=@MAJOR, " _
                & " DATEOFGRADUAT=@DATEOFGRADUAT, " _
                & " UP_DT=getdate(), " _
                & " DELE='' " _
                & " WHERE ID=@ID "

            Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@ID", objTbEducation.ID)
			sqlCmd.Parameters.AddWithValue("@EMP_ID", objTbEducation.EMP_ID)
			sqlCmd.Parameters.AddWithValue("@DEGREE_CODE", objTbEducation.DEGREE_CODE)
			sqlCmd.Parameters.AddWithValue("@U_NAME", objTbEducation.U_NAME)
			sqlCmd.Parameters.AddWithValue("@MAJOR", objTbEducation.MAJOR)
			sqlCmd.Parameters.AddWithValue("@DATEOFGRADUAT", objTbEducation.DATEOFGRADUAT)
		

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

	Public Sub deleteTbEducation(ByVal objTbEducation As TbEducation)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM TB_EDUCATION WHERE ID=@ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@ID", objTbEducation.ID)

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

	Public Sub deleteTbEducation(ByVal ID As Integer)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM TB_EDUCATION WHERE ID=@ID"

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

	Public Function bindingTbEducation(ByVal reader as SqlDataReader) As TbEducation

		Dim objTbEducation As New TbEducation

		objTbEducation.ID = CType(ConvertUtil.getObjectValue(reader("ID"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
		objTbEducation.EMP_ID = CType(ConvertUtil.getObjectValue(reader("EMP_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objTbEducation.DEGREE_CODE = CType(ConvertUtil.getObjectValue(reader("DEGREE_CODE"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
		objTbEducation.U_NAME = CType(ConvertUtil.getObjectValue(reader("U_NAME"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objTbEducation.MAJOR = CType(ConvertUtil.getObjectValue(reader("MAJOR"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objTbEducation.DATEOFGRADUAT = CType(ConvertUtil.getObjectValue(reader("DATEOFGRADUAT"), ConvertUtil.ObjectValueEnum.DateValue), Date)
		objTbEducation.UP_DT = CType(ConvertUtil.getObjectValue(reader("UP_DT"), ConvertUtil.ObjectValueEnum.DateValue), Date)
        objTbEducation.DELE = CType(ConvertUtil.getObjectValue(reader("DELE"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objTbEducation.DEGREE_NAME = CType(ConvertUtil.getObjectValue(reader("DEGREE_NAME"), ConvertUtil.ObjectValueEnum.StringValue), String)

		Return objTbEducation

	End Function

End Class
