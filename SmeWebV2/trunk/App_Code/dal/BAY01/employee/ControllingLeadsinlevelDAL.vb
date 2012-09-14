Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class ControllingLeadsinlevelDAL

	Private Shared className As String = "ControllingLeadsinlevelDAL"

#Region "GetByPK"
	Public Function getControllingLeadsinlevelByLEVEL_ID(ByVal objControllingLeadsinlevel As ControllingLeadsinlevel) As ControllingLeadsinlevel
		Return getControllingLeadsinlevelByLEVEL_ID(objControllingLeadsinlevel.LEVEL_ID)
	End Function

	Public Function getControllingLeadsinlevelByLEVEL_ID(ByVal LEVEL_ID As String) As ControllingLeadsinlevel

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As ControllingLeadsinlevel = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "LEVEL_ID, EMP_ID " _
				& "FROM Controlling_LeadsInLevel " _
				& "WHERE LEVEL_ID=@LEVEL_ID " _
				& "ORDER BY LEVEL_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@LEVEL_ID", LEVEL_ID)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingControllingLeadsinlevel(reader)
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
#End Region

#Region "GetAll"
	Public Function getAllControllingLeadsinlevel() As List (Of ControllingLeadsinlevel)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of ControllingLeadsinlevel)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "LEVEL_ID, EMP_ID " _
				& "FROM Controlling_LeadsInLevel " _
				& "ORDER BY LEVEL_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingControllingLeadsinlevel(reader))
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
#End Region

#Region "Insert"
	Public Sub insertControllingLeadsinlevel(ByVal objControllingLeadsinlevel As ControllingLeadsinlevel)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "INSERT INTO Controlling_LeadsInLevel " _
							& " (LEVEL_ID, EMP_ID) " _
							& " VALUES(@LEVEL_ID, @EMP_ID) "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@LEVEL_ID", objControllingLeadsinlevel.LEVEL_ID)
			sqlCmd.Parameters.AddWithValue("@EMP_ID", objControllingLeadsinlevel.EMP_ID)

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
#End Region

#Region "Update"
	Public Sub updateControllingLeadsinlevel(ByVal objControllingLeadsinlevel As ControllingLeadsinlevel)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "UPDATE Controlling_LeadsInLevel SET " _
							& " EMP_ID=@EMP_ID " _
							& " WHERE LEVEL_ID=@LEVEL_ID "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@LEVEL_ID", objControllingLeadsinlevel.LEVEL_ID)
			sqlCmd.Parameters.AddWithValue("@EMP_ID", objControllingLeadsinlevel.EMP_ID)

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
#End Region

#Region "Delete"
	Public Sub deleteControllingLeadsinlevel(ByVal objControllingLeadsinlevel As ControllingLeadsinlevel)
		deleteControllingLeadsinlevel(objControllingLeadsinlevel.LEVEL_ID)
	End Sub

	Public Sub deleteControllingLeadsinlevel(ByVal LEVEL_ID As String)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM Controlling_LeadsInLevel WHERE LEVEL_ID=@LEVEL_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@LEVEL_ID", LEVEL_ID)

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
#End Region

#Region "Binding"
	Public Function bindingControllingLeadsinlevel(ByVal reader as SqlDataReader) As ControllingLeadsinlevel

		Dim objControllingLeadsinlevel As New ControllingLeadsinlevel

		objControllingLeadsinlevel.LEVEL_ID = CType(ConvertUtil.getObjectValue(reader("LEVEL_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objControllingLeadsinlevel.EMP_ID = CType(ConvertUtil.getObjectValue(reader("EMP_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)

		Return objControllingLeadsinlevel

	End Function
#End Region

End Class
