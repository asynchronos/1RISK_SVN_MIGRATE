Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class AdminControllingLeadsinlevelDAL

	Private Shared className As String = "AdminControllingLeadsinlevelDAL"

	Public Function getAdminControllingLeadsinlevelByLEVEL_ID(ByVal objAdminControllingLeadsinlevel As AdminControllingLeadsinlevel) As AdminControllingLeadsinlevel

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New AdminControllingLeadsinlevel()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "LEVEL_ID, EMP_ID " _
				& "FROM Controlling_LeadsInLevel " _
				& "WHERE LEVEL_ID=@LEVEL_ID " _
				& "ORDER BY LEVEL_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@LEVEL_ID", objAdminControllingLeadsinlevel.LEVEL_ID)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingAdminControllingLeadsinlevel(reader)
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

	Public Function getAdminControllingLeadsinlevelByLEVEL_ID(ByVal LEVEL_ID As String) As AdminControllingLeadsinlevel

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New AdminControllingLeadsinlevel()

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
				result = bindingAdminControllingLeadsinlevel(reader)
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
    Public Function getAllAdminControllingLeadsinlevelByLevel_id(ByVal Level_id As String) As List(Of AdminControllingLeadsinlevel)

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New List(Of AdminControllingLeadsinlevel)

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
                result.Add(bindingAdminControllingLeadsinlevel(reader))
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
	Public Function getAllAdminControllingLeadsinlevel() As List (Of AdminControllingLeadsinlevel)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of AdminControllingLeadsinlevel)

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
				result.Add(bindingAdminControllingLeadsinlevel(reader))
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

	Public Function getAllAdminControllingLeadsinlevelBySQL(ByVal sql AS String) As List (Of AdminControllingLeadsinlevel)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of AdminControllingLeadsinlevel)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingAdminControllingLeadsinlevel(reader))
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

	Public Sub insertAdminControllingLeadsinlevel(ByVal objAdminControllingLeadsinlevel As AdminControllingLeadsinlevel)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "INSERT INTO Controlling_LeadsInLevel " _
							& " (LEVEL_ID, EMP_ID) " _
							& " VALUES(@LEVEL_ID, @EMP_ID) "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@LEVEL_ID", objAdminControllingLeadsinlevel.LEVEL_ID)
			sqlCmd.Parameters.AddWithValue("@EMP_ID", objAdminControllingLeadsinlevel.EMP_ID)

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

	Public Sub updateAdminControllingLeadsinlevel(ByVal objAdminControllingLeadsinlevel As AdminControllingLeadsinlevel)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "UPDATE Controlling_LeadsInLevel SET " _
                & " EMP_ID=@EMP_ID " _
                & " WHERE LEVEL_ID=@LEVEL_ID AND EMP_ID=@EMP_ID "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@LEVEL_ID", objAdminControllingLeadsinlevel.LEVEL_ID)
			sqlCmd.Parameters.AddWithValue("@EMP_ID", objAdminControllingLeadsinlevel.EMP_ID)

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

	Public Sub deleteAdminControllingLeadsinlevel(ByVal objAdminControllingLeadsinlevel As AdminControllingLeadsinlevel)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "DELETE FROM Controlling_LeadsInLevel WHERE LEVEL_ID=@LEVEL_ID AND EMP_ID=@EMP_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@LEVEL_ID", objAdminControllingLeadsinlevel.LEVEL_ID)
            sqlCmd.Parameters.AddWithValue("@EMP_ID", objAdminControllingLeadsinlevel.EMP_ID)

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

	Public Sub deleteAdminControllingLeadsinlevel(ByVal LEVEL_ID As String)

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

	Public Function bindingAdminControllingLeadsinlevel(ByVal reader as SqlDataReader) As AdminControllingLeadsinlevel

		Dim objAdminControllingLeadsinlevel As New AdminControllingLeadsinlevel

		objAdminControllingLeadsinlevel.LEVEL_ID = CType(ConvertUtil.getObjectValue(reader("LEVEL_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objAdminControllingLeadsinlevel.EMP_ID = CType(ConvertUtil.getObjectValue(reader("EMP_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)

		Return objAdminControllingLeadsinlevel

	End Function

End Class
