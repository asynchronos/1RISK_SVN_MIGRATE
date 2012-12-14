Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class AdminControllingUsersinlevelDAL

	Private Shared className As String = "AdminControllingUsersinlevelDAL"

	Public Function getAdminControllingUsersinlevelByLEVEL_ID(ByVal objAdminControllingUsersinlevel As AdminControllingUsersinlevel) As AdminControllingUsersinlevel

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New AdminControllingUsersinlevel()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "LEVEL_ID, EMP_ID " _
				& "FROM Controlling_UsersInLevel " _
				& "WHERE LEVEL_ID=@LEVEL_ID " _
				& "ORDER BY LEVEL_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@LEVEL_ID", objAdminControllingUsersinlevel.LEVEL_ID)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingAdminControllingUsersinlevel(reader)
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

	Public Function getAdminControllingUsersinlevelByLEVEL_ID(ByVal LEVEL_ID As String) As AdminControllingUsersinlevel

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New AdminControllingUsersinlevel()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "LEVEL_ID, EMP_ID " _
				& "FROM Controlling_UsersInLevel " _
				& "WHERE LEVEL_ID=@LEVEL_ID " _
				& "ORDER BY LEVEL_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@LEVEL_ID", LEVEL_ID)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingAdminControllingUsersinlevel(reader)
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
    Public Function getAllAdminControllingUsersinlevelByLevel_id(ByVal Level_id As String) As List(Of AdminControllingUsersinlevel)

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New List(Of AdminControllingUsersinlevel)

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "LEVEL_ID, EMP_ID " _
             & "FROM Controlling_UsersInLevel " _
         & "WHERE LEVEL_ID=@LEVEL_ID " _
         & "ORDER BY LEVEL_ID"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()
            sqlCmd.Parameters.AddWithValue("@LEVEL_ID", Level_id)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result.Add(bindingAdminControllingUsersinlevel(reader))
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
	Public Function getAllAdminControllingUsersinlevel() As List (Of AdminControllingUsersinlevel)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of AdminControllingUsersinlevel)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "LEVEL_ID, EMP_ID " _
				& "FROM Controlling_UsersInLevel " _
				& "ORDER BY LEVEL_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingAdminControllingUsersinlevel(reader))
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

	Public Function getAllAdminControllingUsersinlevelBySQL(ByVal sql AS String) As List (Of AdminControllingUsersinlevel)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of AdminControllingUsersinlevel)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingAdminControllingUsersinlevel(reader))
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

	Public Sub insertAdminControllingUsersinlevel(ByVal objAdminControllingUsersinlevel As AdminControllingUsersinlevel)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "INSERT INTO Controlling_UsersInLevel " _
							& " (LEVEL_ID, EMP_ID) " _
							& " VALUES(@LEVEL_ID, @EMP_ID) "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@LEVEL_ID", objAdminControllingUsersinlevel.LEVEL_ID)
			sqlCmd.Parameters.AddWithValue("@EMP_ID", objAdminControllingUsersinlevel.EMP_ID)

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

	Public Sub updateAdminControllingUsersinlevel(ByVal objAdminControllingUsersinlevel As AdminControllingUsersinlevel)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "UPDATE Controlling_UsersInLevel SET " _
                & " EMP_ID=@EMP_ID " _
                & " WHERE LEVEL_ID=@LEVEL_ID AND EMP_ID=@EMP_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@LEVEL_ID", objAdminControllingUsersinlevel.LEVEL_ID)
			sqlCmd.Parameters.AddWithValue("@EMP_ID", objAdminControllingUsersinlevel.EMP_ID)

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

	Public Sub deleteAdminControllingUsersinlevel(ByVal objAdminControllingUsersinlevel As AdminControllingUsersinlevel)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "DELETE FROM Controlling_UsersInLevel WHERE LEVEL_ID=@LEVEL_ID AND EMP_ID=@EMP_ID "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@LEVEL_ID", objAdminControllingUsersinlevel.LEVEL_ID)
            sqlCmd.Parameters.AddWithValue("@EMP_ID", objAdminControllingUsersinlevel.EMP_ID)

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

    Public Sub deleteAdminControllingUsersinlevel(ByVal LEVEL_ID As String, ByVal EMP_ID As String)

        'declare connection
        Dim conn As SqlConnection = Nothing

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "DELETE FROM Controlling_UsersInLevel WHERE LEVEL_ID=@LEVEL_ID AND EMP_ID=@EMP_ID "

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@LEVEL_ID", LEVEL_ID)
            sqlCmd.Parameters.AddWithValue("@EMP_ID", EMP_ID)

            sqlCmd.ExecuteNonQuery()
        Catch ex As Exception
            Throw New Exception(ex.Message & " : " & ex.StackTrace)
        Finally
            If (conn.State = ConnectionState.Open) Then
                conn.Close()
            End If
            conn = Nothing
        End Try

    End Sub

	Public Function bindingAdminControllingUsersinlevel(ByVal reader as SqlDataReader) As AdminControllingUsersinlevel

		Dim objAdminControllingUsersinlevel As New AdminControllingUsersinlevel

		objAdminControllingUsersinlevel.LEVEL_ID = CType(ConvertUtil.getObjectValue(reader("LEVEL_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objAdminControllingUsersinlevel.EMP_ID = CType(ConvertUtil.getObjectValue(reader("EMP_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)

		Return objAdminControllingUsersinlevel

	End Function

End Class
