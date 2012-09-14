Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class VScheduleOfficeDAL

	Private Shared className As String = "VScheduleOfficeDAL"

	Public Function getVScheduleOfficeByID(ByVal objVScheduleOffice As VScheduleOffice) As VScheduleOffice

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New VScheduleOffice()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "ID, Name, Dept_Name, tel " _
				& "FROM V_Schedule_Office " _
				& "WHERE ID=@ID " _
				& "ORDER BY ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@ID", objVScheduleOffice.ID)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingVScheduleOffice(reader)
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

	Public Function getVScheduleOfficeByID(ByVal ID As Integer) As VScheduleOffice

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New VScheduleOffice()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "ID, Name, Dept_Name, tel " _
				& "FROM V_Schedule_Office " _
				& "WHERE ID=@ID " _
				& "ORDER BY ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@ID", ID)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingVScheduleOffice(reader)
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

	Public Function getAllVScheduleOffice() As List (Of VScheduleOffice)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of VScheduleOffice)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "ID, Name, Dept_Name, tel " _
				& "FROM V_Schedule_Office " _
				& "ORDER BY ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingVScheduleOffice(reader))
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

	Public Function getAllVScheduleOfficeBySQL(ByVal sql AS String) As List (Of VScheduleOffice)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of VScheduleOffice)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingVScheduleOffice(reader))
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

	Public Sub insertVScheduleOffice(ByVal objVScheduleOffice As VScheduleOffice)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "INSERT INTO V_Schedule_Office " _
							& " (ID, Name, Dept_Name, tel) " _
							& " VALUES(@ID, @Name, @Dept_Name, @tel) "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@ID", objVScheduleOffice.ID)
			sqlCmd.Parameters.AddWithValue("@Name", objVScheduleOffice.Name)
			sqlCmd.Parameters.AddWithValue("@Dept_Name", objVScheduleOffice.Dept_Name)
			sqlCmd.Parameters.AddWithValue("@tel", objVScheduleOffice.tel)

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

	Public Sub updateVScheduleOffice(ByVal objVScheduleOffice As VScheduleOffice)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "UPDATE V_Schedule_Office SET " _
							& " Name=@Name, " _
							& " Dept_Name=@Dept_Name, " _
							& " tel=@tel " _
							& " WHERE ID=@ID "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@ID", objVScheduleOffice.ID)
			sqlCmd.Parameters.AddWithValue("@Name", objVScheduleOffice.Name)
			sqlCmd.Parameters.AddWithValue("@Dept_Name", objVScheduleOffice.Dept_Name)
			sqlCmd.Parameters.AddWithValue("@tel", objVScheduleOffice.tel)

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

	Public Sub deleteVScheduleOffice(ByVal objVScheduleOffice As VScheduleOffice)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM V_Schedule_Office WHERE ID=@ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@ID", objVScheduleOffice.ID)

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

	Public Sub deleteVScheduleOffice(ByVal ID As Integer)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM V_Schedule_Office WHERE ID=@ID"

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

	Public Function bindingVScheduleOffice(ByVal reader as SqlDataReader) As VScheduleOffice

		Dim objVScheduleOffice As New VScheduleOffice

		objVScheduleOffice.ID = CType(ConvertUtil.getObjectValue(reader("ID"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
		objVScheduleOffice.Name = CType(ConvertUtil.getObjectValue(reader("Name"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objVScheduleOffice.Dept_Name = CType(ConvertUtil.getObjectValue(reader("Dept_Name"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objVScheduleOffice.tel = CType(ConvertUtil.getObjectValue(reader("tel"), ConvertUtil.ObjectValueEnum.StringValue), String)

		Return objVScheduleOffice

	End Function

End Class
