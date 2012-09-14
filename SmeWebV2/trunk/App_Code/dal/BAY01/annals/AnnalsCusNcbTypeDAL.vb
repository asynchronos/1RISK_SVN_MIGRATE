Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class AnnalsCusNcbTypeDAL

	Private Shared className As String = "AnnalsCusNcbTypeDAL"

	Public Function getAnnalsCusNcbTypeByCUS_NCB_TYPE_ID(ByVal objAnnalsCusNcbType As AnnalsCusNcbType) As AnnalsCusNcbType

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New AnnalsCusNcbType()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "CUS_NCB_TYPE_ID, CUS_NCB_TYPE, PIORITY " _
				& "FROM ANNALS_CUS_NCB_TYPE " _
				& "WHERE CUS_NCB_TYPE_ID=@CUS_NCB_TYPE_ID " _
				& "ORDER BY CUS_NCB_TYPE_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@CUS_NCB_TYPE_ID", objAnnalsCusNcbType.CUS_NCB_TYPE_ID)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingAnnalsCusNcbType(reader)
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

	Public Function getAnnalsCusNcbTypeByCUS_NCB_TYPE_ID(ByVal CUS_NCB_TYPE_ID As Integer) As AnnalsCusNcbType

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New AnnalsCusNcbType()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "CUS_NCB_TYPE_ID, CUS_NCB_TYPE, PIORITY " _
				& "FROM ANNALS_CUS_NCB_TYPE " _
				& "WHERE CUS_NCB_TYPE_ID=@CUS_NCB_TYPE_ID " _
				& "ORDER BY CUS_NCB_TYPE_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@CUS_NCB_TYPE_ID", CUS_NCB_TYPE_ID)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingAnnalsCusNcbType(reader)
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

	Public Function getAllAnnalsCusNcbType() As List (Of AnnalsCusNcbType)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of AnnalsCusNcbType)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "CUS_NCB_TYPE_ID, CUS_NCB_TYPE, PIORITY " _
             & "FROM ANNALS_CUS_NCB_TYPE  WHERE DEL_FLAG <> 1" _
             & "ORDER BY CUS_NCB_TYPE_ID"

            '   MsgBox(sql)
			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingAnnalsCusNcbType(reader))
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

	Public Function getAllAnnalsCusNcbTypeBySQL(ByVal sql AS String) As List (Of AnnalsCusNcbType)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of AnnalsCusNcbType)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingAnnalsCusNcbType(reader))
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

	Public Sub insertAnnalsCusNcbType(ByVal objAnnalsCusNcbType As AnnalsCusNcbType)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "INSERT INTO ANNALS_CUS_NCB_TYPE " _
							& " (CUS_NCB_TYPE_ID, CUS_NCB_TYPE, PIORITY) " _
							& " VALUES(@CUS_NCB_TYPE_ID, @CUS_NCB_TYPE, @PIORITY) "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@CUS_NCB_TYPE_ID", objAnnalsCusNcbType.CUS_NCB_TYPE_ID)
			sqlCmd.Parameters.AddWithValue("@CUS_NCB_TYPE", objAnnalsCusNcbType.CUS_NCB_TYPE)
			sqlCmd.Parameters.AddWithValue("@PIORITY", objAnnalsCusNcbType.PIORITY)

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

	Public Sub updateAnnalsCusNcbType(ByVal objAnnalsCusNcbType As AnnalsCusNcbType)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "UPDATE ANNALS_CUS_NCB_TYPE SET " _
							& " CUS_NCB_TYPE=@CUS_NCB_TYPE, " _
							& " PIORITY=@PIORITY " _
							& " WHERE CUS_NCB_TYPE_ID=@CUS_NCB_TYPE_ID "
			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@CUS_NCB_TYPE_ID", objAnnalsCusNcbType.CUS_NCB_TYPE_ID)
			sqlCmd.Parameters.AddWithValue("@CUS_NCB_TYPE", objAnnalsCusNcbType.CUS_NCB_TYPE)
			sqlCmd.Parameters.AddWithValue("@PIORITY", objAnnalsCusNcbType.PIORITY)

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

	Public Sub deleteAnnalsCusNcbType(ByVal objAnnalsCusNcbType As AnnalsCusNcbType)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM ANNALS_CUS_NCB_TYPE WHERE CUS_NCB_TYPE_ID=@CUS_NCB_TYPE_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@CUS_NCB_TYPE_ID", objAnnalsCusNcbType.CUS_NCB_TYPE_ID)

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

	Public Sub deleteAnnalsCusNcbType(ByVal CUS_NCB_TYPE_ID As Integer)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM ANNALS_CUS_NCB_TYPE WHERE CUS_NCB_TYPE_ID=@CUS_NCB_TYPE_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@CUS_NCB_TYPE_ID", CUS_NCB_TYPE_ID)

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

	Public Function bindingAnnalsCusNcbType(ByVal reader as SqlDataReader) As AnnalsCusNcbType

		Dim objAnnalsCusNcbType As New AnnalsCusNcbType

		objAnnalsCusNcbType.CUS_NCB_TYPE_ID = CType(ConvertUtil.getObjectValue(reader("CUS_NCB_TYPE_ID"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
		objAnnalsCusNcbType.CUS_NCB_TYPE = CType(ConvertUtil.getObjectValue(reader("CUS_NCB_TYPE"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objAnnalsCusNcbType.PIORITY = CType(ConvertUtil.getObjectValue(reader("PIORITY"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)

		Return objAnnalsCusNcbType

	End Function

End Class
