Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class AnnalsCovenantTypeDAL

	Private Shared className As String = "AnnalsCovenantTypeDAL"

	Public Function getAnnalsCovenantTypeByCOVENANT_TYPE_ID(ByVal objAnnalsCovenantType As AnnalsCovenantType) As AnnalsCovenantType

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New AnnalsCovenantType()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "COVENANT_TYPE_ID, COVENANT_TYPE, PRIORITY " _
             & "FROM ANNALS_COVENANT_TYPE " _
             & "WHERE COVENANT_TYPE_ID=@COVENANT_TYPE_ID " _
             & "ORDER BY  PRIORITY"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@COVENANT_TYPE_ID", objAnnalsCovenantType.COVENANT_TYPE_ID)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingAnnalsCovenantType(reader)
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

	Public Function getAnnalsCovenantTypeByCOVENANT_TYPE_ID(ByVal COVENANT_TYPE_ID As Integer) As AnnalsCovenantType

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New AnnalsCovenantType()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "COVENANT_TYPE_ID, COVENANT_TYPE, PRIORITY " _
             & "FROM ANNALS_COVENANT_TYPE " _
             & "WHERE COVENANT_TYPE_ID=@COVENANT_TYPE_ID " _
             & "ORDER BY PRIORITY"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@COVENANT_TYPE_ID", COVENANT_TYPE_ID)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingAnnalsCovenantType(reader)
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

	Public Function getAllAnnalsCovenantType() As List (Of AnnalsCovenantType)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of AnnalsCovenantType)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "COVENANT_TYPE_ID, COVENANT_TYPE, PRIORITY " _
             & "FROM ANNALS_COVENANT_TYPE " _
             & "ORDER BY  PRIORITY"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingAnnalsCovenantType(reader))
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

	Public Function getAllAnnalsCovenantTypeBySQL(ByVal sql AS String) As List (Of AnnalsCovenantType)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of AnnalsCovenantType)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingAnnalsCovenantType(reader))
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

	Public Sub insertAnnalsCovenantType(ByVal objAnnalsCovenantType As AnnalsCovenantType)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "INSERT INTO ANNALS_COVENANT_TYPE " _
							& " (COVENANT_TYPE_ID, COVENANT_TYPE, PRIORITY) " _
							& " VALUES(@COVENANT_TYPE_ID, @COVENANT_TYPE, @PRIORITY) "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@COVENANT_TYPE_ID", objAnnalsCovenantType.COVENANT_TYPE_ID)
			sqlCmd.Parameters.AddWithValue("@COVENANT_TYPE", objAnnalsCovenantType.COVENANT_TYPE)
			sqlCmd.Parameters.AddWithValue("@PRIORITY", objAnnalsCovenantType.PRIORITY)

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

	Public Sub updateAnnalsCovenantType(ByVal objAnnalsCovenantType As AnnalsCovenantType)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "UPDATE ANNALS_COVENANT_TYPE SET " _
							& " COVENANT_TYPE=@COVENANT_TYPE, " _
							& " PRIORITY=@PRIORITY " _
							& " WHERE COVENANT_TYPE_ID=@COVENANT_TYPE_ID "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@COVENANT_TYPE_ID", objAnnalsCovenantType.COVENANT_TYPE_ID)
			sqlCmd.Parameters.AddWithValue("@COVENANT_TYPE", objAnnalsCovenantType.COVENANT_TYPE)
			sqlCmd.Parameters.AddWithValue("@PRIORITY", objAnnalsCovenantType.PRIORITY)

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

	Public Sub deleteAnnalsCovenantType(ByVal objAnnalsCovenantType As AnnalsCovenantType)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM ANNALS_COVENANT_TYPE WHERE COVENANT_TYPE_ID=@COVENANT_TYPE_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@COVENANT_TYPE_ID", objAnnalsCovenantType.COVENANT_TYPE_ID)

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

	Public Sub deleteAnnalsCovenantType(ByVal COVENANT_TYPE_ID As Integer)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM ANNALS_COVENANT_TYPE WHERE COVENANT_TYPE_ID=@COVENANT_TYPE_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@COVENANT_TYPE_ID", COVENANT_TYPE_ID)

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

	Public Function bindingAnnalsCovenantType(ByVal reader as SqlDataReader) As AnnalsCovenantType

		Dim objAnnalsCovenantType As New AnnalsCovenantType

        objAnnalsCovenantType.COVENANT_TYPE_ID = CType(ConvertUtil.getObjectValue(reader("COVENANT_TYPE_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objAnnalsCovenantType.COVENANT_TYPE = CType(ConvertUtil.getObjectValue(reader("COVENANT_TYPE"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objAnnalsCovenantType.PRIORITY = CType(ConvertUtil.getObjectValue(reader("PRIORITY"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)

		Return objAnnalsCovenantType

	End Function

End Class
