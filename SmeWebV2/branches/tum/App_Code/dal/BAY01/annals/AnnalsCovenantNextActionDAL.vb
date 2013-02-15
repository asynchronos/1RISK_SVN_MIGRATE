Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class AnnalsCovenantNextActionDAL

	Private Shared className As String = "AnnalsCovenantNextActionDAL"

	Public Function getAnnalsCovenantNextActionByNEXT_COVENANT_ACTION_ID(ByVal objAnnalsCovenantNextAction As AnnalsCovenantNextAction) As AnnalsCovenantNextAction

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New AnnalsCovenantNextAction()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "NEXT_COVENANT_ACTION_ID, NEXT_COVENANT_ACTION, PRIORITY " _
				& "FROM ANNALS_COVENANT_NEXT_ACTION " _
				& "WHERE NEXT_COVENANT_ACTION_ID=@NEXT_COVENANT_ACTION_ID " _
				& "ORDER BY NEXT_COVENANT_ACTION_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@NEXT_COVENANT_ACTION_ID", objAnnalsCovenantNextAction.NEXT_COVENANT_ACTION_ID)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingAnnalsCovenantNextAction(reader)
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

	Public Function getAnnalsCovenantNextActionByNEXT_COVENANT_ACTION_ID(ByVal NEXT_COVENANT_ACTION_ID As Integer) As AnnalsCovenantNextAction

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New AnnalsCovenantNextAction()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "NEXT_COVENANT_ACTION_ID, NEXT_COVENANT_ACTION, PRIORITY " _
				& "FROM ANNALS_COVENANT_NEXT_ACTION " _
				& "WHERE NEXT_COVENANT_ACTION_ID=@NEXT_COVENANT_ACTION_ID " _
				& "ORDER BY NEXT_COVENANT_ACTION_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@NEXT_COVENANT_ACTION_ID", NEXT_COVENANT_ACTION_ID)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingAnnalsCovenantNextAction(reader)
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

	Public Function getAllAnnalsCovenantNextAction() As List (Of AnnalsCovenantNextAction)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of AnnalsCovenantNextAction)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "NEXT_COVENANT_ACTION_ID, NEXT_COVENANT_ACTION, PRIORITY " _
				& "FROM ANNALS_COVENANT_NEXT_ACTION " _
				& "ORDER BY NEXT_COVENANT_ACTION_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingAnnalsCovenantNextAction(reader))
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

	Public Function getAllAnnalsCovenantNextActionBySQL(ByVal sql AS String) As List (Of AnnalsCovenantNextAction)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of AnnalsCovenantNextAction)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingAnnalsCovenantNextAction(reader))
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

	Public Sub insertAnnalsCovenantNextAction(ByVal objAnnalsCovenantNextAction As AnnalsCovenantNextAction)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "INSERT INTO ANNALS_COVENANT_NEXT_ACTION " _
							& " (NEXT_COVENANT_ACTION_ID, NEXT_COVENANT_ACTION, PRIORITY) " _
							& " VALUES(@NEXT_COVENANT_ACTION_ID, @NEXT_COVENANT_ACTION, @PRIORITY) "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@NEXT_COVENANT_ACTION_ID", objAnnalsCovenantNextAction.NEXT_COVENANT_ACTION_ID)
			sqlCmd.Parameters.AddWithValue("@NEXT_COVENANT_ACTION", objAnnalsCovenantNextAction.NEXT_COVENANT_ACTION)
			sqlCmd.Parameters.AddWithValue("@PRIORITY", objAnnalsCovenantNextAction.PRIORITY)

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

	Public Sub updateAnnalsCovenantNextAction(ByVal objAnnalsCovenantNextAction As AnnalsCovenantNextAction)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "UPDATE ANNALS_COVENANT_NEXT_ACTION SET " _
							& " NEXT_COVENANT_ACTION=@NEXT_COVENANT_ACTION, " _
							& " PRIORITY=@PRIORITY " _
							& " WHERE NEXT_COVENANT_ACTION_ID=@NEXT_COVENANT_ACTION_ID "
			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@NEXT_COVENANT_ACTION_ID", objAnnalsCovenantNextAction.NEXT_COVENANT_ACTION_ID)
			sqlCmd.Parameters.AddWithValue("@NEXT_COVENANT_ACTION", objAnnalsCovenantNextAction.NEXT_COVENANT_ACTION)
			sqlCmd.Parameters.AddWithValue("@PRIORITY", objAnnalsCovenantNextAction.PRIORITY)

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

	Public Sub deleteAnnalsCovenantNextAction(ByVal objAnnalsCovenantNextAction As AnnalsCovenantNextAction)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM ANNALS_COVENANT_NEXT_ACTION WHERE NEXT_COVENANT_ACTION_ID=@NEXT_COVENANT_ACTION_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@NEXT_COVENANT_ACTION_ID", objAnnalsCovenantNextAction.NEXT_COVENANT_ACTION_ID)

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

	Public Sub deleteAnnalsCovenantNextAction(ByVal NEXT_COVENANT_ACTION_ID As Integer)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM ANNALS_COVENANT_NEXT_ACTION WHERE NEXT_COVENANT_ACTION_ID=@NEXT_COVENANT_ACTION_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@NEXT_COVENANT_ACTION_ID", NEXT_COVENANT_ACTION_ID)

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

	Public Function bindingAnnalsCovenantNextAction(ByVal reader as SqlDataReader) As AnnalsCovenantNextAction

		Dim objAnnalsCovenantNextAction As New AnnalsCovenantNextAction

		objAnnalsCovenantNextAction.NEXT_COVENANT_ACTION_ID = CType(ConvertUtil.getObjectValue(reader("NEXT_COVENANT_ACTION_ID"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
		objAnnalsCovenantNextAction.NEXT_COVENANT_ACTION = CType(ConvertUtil.getObjectValue(reader("NEXT_COVENANT_ACTION"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objAnnalsCovenantNextAction.PRIORITY = CType(ConvertUtil.getObjectValue(reader("PRIORITY"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)

		Return objAnnalsCovenantNextAction

	End Function

End Class
