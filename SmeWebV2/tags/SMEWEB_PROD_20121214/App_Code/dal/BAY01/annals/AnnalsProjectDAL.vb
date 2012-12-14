Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class AnnalsProjectDAL

	Private Shared className As String = "AnnalsProjectDAL"

	Public Function getAnnalsProjectByProject_Code(ByVal objAnnalsProject As AnnalsProject) As AnnalsProject

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New AnnalsProject()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "Project_Code, Project_Name, Priority " _
             & "FROM ANNALS_PROJECT " _
             & "WHERE Project_Code=@Project_Code " _
             & "ORDER BY Priority"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@Project_Code", objAnnalsProject.Project_Code)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingAnnalsProject(reader)
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

	Public Function getAnnalsProjectByProject_Code(ByVal Project_Code As String) As AnnalsProject

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New AnnalsProject()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "Project_Code, Project_Name, Priority " _
             & "FROM ANNALS_PROJECT " _
             & "WHERE Project_Code=@Project_Code " _
             & "ORDER BY Priority"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@Project_Code", Project_Code)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingAnnalsProject(reader)
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

	Public Function getAllAnnalsProject() As List (Of AnnalsProject)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of AnnalsProject)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "Project_Code, Project_Name, Priority " _
             & "FROM ANNALS_PROJECT " _
             & "ORDER BY Priority"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingAnnalsProject(reader))
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

	Public Function getAllAnnalsProjectBySQL(ByVal sql AS String) As List (Of AnnalsProject)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of AnnalsProject)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingAnnalsProject(reader))
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

	Public Sub insertAnnalsProject(ByVal objAnnalsProject As AnnalsProject)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "INSERT INTO ANNALS_PROJECT " _
							& " (Project_Code, Project_Name, Priority) " _
							& " VALUES(@Project_Code, @Project_Name, @Priority) "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@Project_Code", objAnnalsProject.Project_Code)
			sqlCmd.Parameters.AddWithValue("@Project_Name", objAnnalsProject.Project_Name)
			sqlCmd.Parameters.AddWithValue("@Priority", objAnnalsProject.Priority)

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

	Public Sub updateAnnalsProject(ByVal objAnnalsProject As AnnalsProject)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "UPDATE ANNALS_PROJECT SET " _
							& " Project_Name=@Project_Name, " _
							& " Priority=@Priority " _
							& " WHERE Project_Code=@Project_Code "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@Project_Code", objAnnalsProject.Project_Code)
			sqlCmd.Parameters.AddWithValue("@Project_Name", objAnnalsProject.Project_Name)
			sqlCmd.Parameters.AddWithValue("@Priority", objAnnalsProject.Priority)

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

	Public Sub deleteAnnalsProject(ByVal objAnnalsProject As AnnalsProject)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM ANNALS_PROJECT WHERE Project_Code=@Project_Code"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@Project_Code", objAnnalsProject.Project_Code)

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

	Public Sub deleteAnnalsProject(ByVal Project_Code As String)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM ANNALS_PROJECT WHERE Project_Code=@Project_Code"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@Project_Code", Project_Code)

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

	Public Function bindingAnnalsProject(ByVal reader as SqlDataReader) As AnnalsProject

		Dim objAnnalsProject As New AnnalsProject

		objAnnalsProject.Project_Code = CType(ConvertUtil.getObjectValue(reader("Project_Code"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objAnnalsProject.Project_Name = CType(ConvertUtil.getObjectValue(reader("Project_Name"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objAnnalsProject.Priority = CType(ConvertUtil.getObjectValue(reader("Priority"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)

		Return objAnnalsProject

	End Function

End Class
