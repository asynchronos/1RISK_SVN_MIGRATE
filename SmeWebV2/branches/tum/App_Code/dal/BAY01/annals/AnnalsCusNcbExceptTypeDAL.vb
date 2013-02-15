Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class AnnalsCusNcbExceptTypeDAL

	Private Shared className As String = "AnnalsCusNcbExceptTypeDAL"

	Public Function getAnnalsCusNcbExceptTypeByCUS_NCB_EXCEPT_TYPE_ID(ByVal objAnnalsCusNcbExceptType As AnnalsCusNcbExceptType) As AnnalsCusNcbExceptType

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New AnnalsCusNcbExceptType()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "CUS_NCB_EXCEPT_TYPE_ID, CUS_NCB_EXCEPT_TYPE, PIORITY " _
				& "FROM ANNALS_CUS_NCB_EXCEPT_TYPE " _
				& "WHERE CUS_NCB_EXCEPT_TYPE_ID=@CUS_NCB_EXCEPT_TYPE_ID " _
				& "ORDER BY CUS_NCB_EXCEPT_TYPE_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@CUS_NCB_EXCEPT_TYPE_ID", objAnnalsCusNcbExceptType.CUS_NCB_EXCEPT_TYPE_ID)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingAnnalsCusNcbExceptType(reader)
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

	Public Function getAnnalsCusNcbExceptTypeByCUS_NCB_EXCEPT_TYPE_ID(ByVal CUS_NCB_EXCEPT_TYPE_ID As Integer) As AnnalsCusNcbExceptType

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New AnnalsCusNcbExceptType()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "CUS_NCB_EXCEPT_TYPE_ID, CUS_NCB_EXCEPT_TYPE, PIORITY " _
				& "FROM ANNALS_CUS_NCB_EXCEPT_TYPE " _
				& "WHERE CUS_NCB_EXCEPT_TYPE_ID=@CUS_NCB_EXCEPT_TYPE_ID " _
				& "ORDER BY CUS_NCB_EXCEPT_TYPE_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@CUS_NCB_EXCEPT_TYPE_ID", CUS_NCB_EXCEPT_TYPE_ID)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingAnnalsCusNcbExceptType(reader)
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

	Public Function getAllAnnalsCusNcbExceptType() As List (Of AnnalsCusNcbExceptType)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of AnnalsCusNcbExceptType)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "CUS_NCB_EXCEPT_TYPE_ID, CUS_NCB_EXCEPT_TYPE, PIORITY " _
				& "FROM ANNALS_CUS_NCB_EXCEPT_TYPE " _
				& "ORDER BY CUS_NCB_EXCEPT_TYPE_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingAnnalsCusNcbExceptType(reader))
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

	Public Function getAllAnnalsCusNcbExceptTypeBySQL(ByVal sql AS String) As List (Of AnnalsCusNcbExceptType)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of AnnalsCusNcbExceptType)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingAnnalsCusNcbExceptType(reader))
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

	Public Sub insertAnnalsCusNcbExceptType(ByVal objAnnalsCusNcbExceptType As AnnalsCusNcbExceptType)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "INSERT INTO ANNALS_CUS_NCB_EXCEPT_TYPE " _
							& " (CUS_NCB_EXCEPT_TYPE_ID, CUS_NCB_EXCEPT_TYPE, PIORITY) " _
							& " VALUES(@CUS_NCB_EXCEPT_TYPE_ID, @CUS_NCB_EXCEPT_TYPE, @PIORITY) "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@CUS_NCB_EXCEPT_TYPE_ID", objAnnalsCusNcbExceptType.CUS_NCB_EXCEPT_TYPE_ID)
			sqlCmd.Parameters.AddWithValue("@CUS_NCB_EXCEPT_TYPE", objAnnalsCusNcbExceptType.CUS_NCB_EXCEPT_TYPE)
			sqlCmd.Parameters.AddWithValue("@PIORITY", objAnnalsCusNcbExceptType.PIORITY)

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

	Public Sub updateAnnalsCusNcbExceptType(ByVal objAnnalsCusNcbExceptType As AnnalsCusNcbExceptType)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "UPDATE ANNALS_CUS_NCB_EXCEPT_TYPE SET " _
							& " CUS_NCB_EXCEPT_TYPE=@CUS_NCB_EXCEPT_TYPE, " _
							& " PIORITY=@PIORITY " _
							& " WHERE CUS_NCB_EXCEPT_TYPE_ID=@CUS_NCB_EXCEPT_TYPE_ID "
			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@CUS_NCB_EXCEPT_TYPE_ID", objAnnalsCusNcbExceptType.CUS_NCB_EXCEPT_TYPE_ID)
			sqlCmd.Parameters.AddWithValue("@CUS_NCB_EXCEPT_TYPE", objAnnalsCusNcbExceptType.CUS_NCB_EXCEPT_TYPE)
			sqlCmd.Parameters.AddWithValue("@PIORITY", objAnnalsCusNcbExceptType.PIORITY)

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

	Public Sub deleteAnnalsCusNcbExceptType(ByVal objAnnalsCusNcbExceptType As AnnalsCusNcbExceptType)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM ANNALS_CUS_NCB_EXCEPT_TYPE WHERE CUS_NCB_EXCEPT_TYPE_ID=@CUS_NCB_EXCEPT_TYPE_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@CUS_NCB_EXCEPT_TYPE_ID", objAnnalsCusNcbExceptType.CUS_NCB_EXCEPT_TYPE_ID)

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

	Public Sub deleteAnnalsCusNcbExceptType(ByVal CUS_NCB_EXCEPT_TYPE_ID As Integer)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM ANNALS_CUS_NCB_EXCEPT_TYPE WHERE CUS_NCB_EXCEPT_TYPE_ID=@CUS_NCB_EXCEPT_TYPE_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@CUS_NCB_EXCEPT_TYPE_ID", CUS_NCB_EXCEPT_TYPE_ID)

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

	Public Function bindingAnnalsCusNcbExceptType(ByVal reader as SqlDataReader) As AnnalsCusNcbExceptType

		Dim objAnnalsCusNcbExceptType As New AnnalsCusNcbExceptType

		objAnnalsCusNcbExceptType.CUS_NCB_EXCEPT_TYPE_ID = CType(ConvertUtil.getObjectValue(reader("CUS_NCB_EXCEPT_TYPE_ID"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
		objAnnalsCusNcbExceptType.CUS_NCB_EXCEPT_TYPE = CType(ConvertUtil.getObjectValue(reader("CUS_NCB_EXCEPT_TYPE"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objAnnalsCusNcbExceptType.PIORITY = CType(ConvertUtil.getObjectValue(reader("PIORITY"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)

		Return objAnnalsCusNcbExceptType

	End Function

End Class
