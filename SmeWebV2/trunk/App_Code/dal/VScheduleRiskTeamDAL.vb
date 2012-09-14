Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class VScheduleRiskTeamDAL

	Private Shared className As String = "VScheduleRiskTeamDAL"

	Public Function getVScheduleRiskTeamByID(ByVal objVScheduleRiskTeam As VScheduleRiskTeam) As VScheduleRiskTeam

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New VScheduleRiskTeam()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "ID, Name, Team_name, Tel " _
				& "FROM V_Schedule_Risk_Team " _
				& "WHERE ID=@ID " _
				& "ORDER BY ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@ID", objVScheduleRiskTeam.ID)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingVScheduleRiskTeam(reader)
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

	Public Function getVScheduleRiskTeamByID(ByVal ID As String) As VScheduleRiskTeam

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New VScheduleRiskTeam()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "ID, Name, Team_name, Tel " _
				& "FROM V_Schedule_Risk_Team " _
				& "WHERE ID=@ID " _
				& "ORDER BY ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@ID", ID)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingVScheduleRiskTeam(reader)
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

	Public Function getAllVScheduleRiskTeam() As List (Of VScheduleRiskTeam)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of VScheduleRiskTeam)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "ID, Name, Team_name, Tel " _
				& "FROM V_Schedule_Risk_Team " _
				& "ORDER BY ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingVScheduleRiskTeam(reader))
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

	Public Function getAllVScheduleRiskTeamBySQL(ByVal sql AS String) As List (Of VScheduleRiskTeam)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of VScheduleRiskTeam)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingVScheduleRiskTeam(reader))
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

	Public Sub insertVScheduleRiskTeam(ByVal objVScheduleRiskTeam As VScheduleRiskTeam)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "INSERT INTO V_Schedule_Risk_Team " _
							& " (ID, Name, Team_name, Tel) " _
							& " VALUES(@ID, @Name, @Team_name, @Tel) "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@ID", objVScheduleRiskTeam.ID)
			sqlCmd.Parameters.AddWithValue("@Name", objVScheduleRiskTeam.Name)
			sqlCmd.Parameters.AddWithValue("@Team_name", objVScheduleRiskTeam.Team_name)
			sqlCmd.Parameters.AddWithValue("@Tel", objVScheduleRiskTeam.Tel)

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

	Public Sub updateVScheduleRiskTeam(ByVal objVScheduleRiskTeam As VScheduleRiskTeam)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "UPDATE V_Schedule_Risk_Team SET " _
							& " Name=@Name, " _
							& " Team_name=@Team_name, " _
							& " Tel=@Tel " _
							& " WHERE ID=@ID "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@ID", objVScheduleRiskTeam.ID)
			sqlCmd.Parameters.AddWithValue("@Name", objVScheduleRiskTeam.Name)
			sqlCmd.Parameters.AddWithValue("@Team_name", objVScheduleRiskTeam.Team_name)
			sqlCmd.Parameters.AddWithValue("@Tel", objVScheduleRiskTeam.Tel)

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

	Public Sub deleteVScheduleRiskTeam(ByVal objVScheduleRiskTeam As VScheduleRiskTeam)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM V_Schedule_Risk_Team WHERE ID=@ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@ID", objVScheduleRiskTeam.ID)

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

	Public Sub deleteVScheduleRiskTeam(ByVal ID As String)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM V_Schedule_Risk_Team WHERE ID=@ID"

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

	Public Function bindingVScheduleRiskTeam(ByVal reader as SqlDataReader) As VScheduleRiskTeam

		Dim objVScheduleRiskTeam As New VScheduleRiskTeam

		objVScheduleRiskTeam.ID = CType(ConvertUtil.getObjectValue(reader("ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objVScheduleRiskTeam.Name = CType(ConvertUtil.getObjectValue(reader("Name"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objVScheduleRiskTeam.Team_name = CType(ConvertUtil.getObjectValue(reader("Team_name"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objVScheduleRiskTeam.Tel = CType(ConvertUtil.getObjectValue(reader("Tel"), ConvertUtil.ObjectValueEnum.StringValue), String)

		Return objVScheduleRiskTeam

	End Function

End Class
