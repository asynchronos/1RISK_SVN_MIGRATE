Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class AnnalsCovenantActionDAL

	Private Shared className As String = "AnnalsCovenantActionDAL"

	Public Function getAnnalsCovenantActionByCOVENANT_ACTION_ID(ByVal objAnnalsCovenantAction As AnnalsCovenantAction) As AnnalsCovenantAction

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New AnnalsCovenantAction()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "COVENANT_ACTION_ID, COVENANT_ACTION, PRIORITY " _
				& "FROM ANNALS_COVENANT_ACTION " _
				& "WHERE COVENANT_ACTION_ID=@COVENANT_ACTION_ID " _
				& "ORDER BY COVENANT_ACTION_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@COVENANT_ACTION_ID", objAnnalsCovenantAction.COVENANT_ACTION_ID)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingAnnalsCovenantAction(reader)
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

	Public Function getAnnalsCovenantActionByCOVENANT_ACTION_ID(ByVal COVENANT_ACTION_ID As Integer) As AnnalsCovenantAction

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New AnnalsCovenantAction()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "COVENANT_ACTION_ID, COVENANT_ACTION, PRIORITY " _
				& "FROM ANNALS_COVENANT_ACTION " _
				& "WHERE COVENANT_ACTION_ID=@COVENANT_ACTION_ID " _
				& "ORDER BY COVENANT_ACTION_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@COVENANT_ACTION_ID", COVENANT_ACTION_ID)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingAnnalsCovenantAction(reader)
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

	Public Function getAllAnnalsCovenantAction() As List (Of AnnalsCovenantAction)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of AnnalsCovenantAction)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "COVENANT_ACTION_ID, COVENANT_ACTION, PRIORITY " _
				& "FROM ANNALS_COVENANT_ACTION " _
				& "ORDER BY COVENANT_ACTION_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingAnnalsCovenantAction(reader))
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

	Public Function getAllAnnalsCovenantActionBySQL(ByVal sql AS String) As List (Of AnnalsCovenantAction)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of AnnalsCovenantAction)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingAnnalsCovenantAction(reader))
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

	Public Sub insertAnnalsCovenantAction(ByVal objAnnalsCovenantAction As AnnalsCovenantAction)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "INSERT INTO ANNALS_COVENANT_ACTION " _
							& " (COVENANT_ACTION_ID, COVENANT_ACTION, PRIORITY) " _
							& " VALUES(@COVENANT_ACTION_ID, @COVENANT_ACTION, @PRIORITY) "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@COVENANT_ACTION_ID", objAnnalsCovenantAction.COVENANT_ACTION_ID)
			sqlCmd.Parameters.AddWithValue("@COVENANT_ACTION", objAnnalsCovenantAction.COVENANT_ACTION)
			sqlCmd.Parameters.AddWithValue("@PRIORITY", objAnnalsCovenantAction.PRIORITY)

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

	Public Sub updateAnnalsCovenantAction(ByVal objAnnalsCovenantAction As AnnalsCovenantAction)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "UPDATE ANNALS_COVENANT_ACTION SET " _
							& " COVENANT_ACTION=@COVENANT_ACTION, " _
							& " PRIORITY=@PRIORITY " _
							& " WHERE COVENANT_ACTION_ID=@COVENANT_ACTION_ID "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@COVENANT_ACTION_ID", objAnnalsCovenantAction.COVENANT_ACTION_ID)
			sqlCmd.Parameters.AddWithValue("@COVENANT_ACTION", objAnnalsCovenantAction.COVENANT_ACTION)
			sqlCmd.Parameters.AddWithValue("@PRIORITY", objAnnalsCovenantAction.PRIORITY)

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

	Public Sub deleteAnnalsCovenantAction(ByVal objAnnalsCovenantAction As AnnalsCovenantAction)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM ANNALS_COVENANT_ACTION WHERE COVENANT_ACTION_ID=@COVENANT_ACTION_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@COVENANT_ACTION_ID", objAnnalsCovenantAction.COVENANT_ACTION_ID)

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

	Public Sub deleteAnnalsCovenantAction(ByVal COVENANT_ACTION_ID As Integer)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM ANNALS_COVENANT_ACTION WHERE COVENANT_ACTION_ID=@COVENANT_ACTION_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@COVENANT_ACTION_ID", COVENANT_ACTION_ID)

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

	Public Function bindingAnnalsCovenantAction(ByVal reader as SqlDataReader) As AnnalsCovenantAction

		Dim objAnnalsCovenantAction As New AnnalsCovenantAction

		objAnnalsCovenantAction.COVENANT_ACTION_ID = CType(ConvertUtil.getObjectValue(reader("COVENANT_ACTION_ID"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
		objAnnalsCovenantAction.COVENANT_ACTION = CType(ConvertUtil.getObjectValue(reader("COVENANT_ACTION"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objAnnalsCovenantAction.PRIORITY = CType(ConvertUtil.getObjectValue(reader("PRIORITY"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)

		Return objAnnalsCovenantAction

	End Function

End Class
