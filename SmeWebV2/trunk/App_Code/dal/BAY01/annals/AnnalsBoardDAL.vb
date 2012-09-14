Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class AnnalsBoardDAL

	Private Shared className As String = "AnnalsBoardDAL"

	Public Function getAnnalsBoardById(ByVal objAnnalsBoard As AnnalsBoard) As AnnalsBoard

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New AnnalsBoard()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "Id, Board, Master_Id, Priority " _
             & "FROM ANNALS_BOARD " _
             & "WHERE Id=@Id " _
             & "ORDER BY Priority"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@Id", objAnnalsBoard.Id)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingAnnalsBoard(reader)
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

	Public Function getAnnalsBoardById(ByVal Id As String) As AnnalsBoard

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New AnnalsBoard()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "Id, Board, Master_Id, Priority " _
             & "FROM ANNALS_BOARD " _
             & "WHERE Id=@Id " _
             & "ORDER BY Priority"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@Id", Id)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingAnnalsBoard(reader)
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

	Public Function getAllAnnalsBoard() As List (Of AnnalsBoard)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of AnnalsBoard)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "Id, Board, Master_Id, Priority " _
             & "FROM ANNALS_BOARD " _
             & "ORDER BY Priority"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingAnnalsBoard(reader))
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

	Public Function getAllAnnalsBoardBySQL(ByVal sql AS String) As List (Of AnnalsBoard)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of AnnalsBoard)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingAnnalsBoard(reader))
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

	Public Sub insertAnnalsBoard(ByVal objAnnalsBoard As AnnalsBoard)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "INSERT INTO ANNALS_BOARD " _
							& " (Id, Board, Master_Id, Priority) " _
							& " VALUES(@Id, @Board, @Master_Id, @Priority) "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@Id", objAnnalsBoard.Id)
			sqlCmd.Parameters.AddWithValue("@Board", objAnnalsBoard.Board)
			sqlCmd.Parameters.AddWithValue("@Master_Id", objAnnalsBoard.Master_Id)
			sqlCmd.Parameters.AddWithValue("@Priority", objAnnalsBoard.Priority)

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

	Public Sub updateAnnalsBoard(ByVal objAnnalsBoard As AnnalsBoard)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "UPDATE ANNALS_BOARD SET " _
							& " Board=@Board, " _
							& " Master_Id=@Master_Id, " _
							& " Priority=@Priority " _
							& " WHERE Id=@Id "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@Id", objAnnalsBoard.Id)
			sqlCmd.Parameters.AddWithValue("@Board", objAnnalsBoard.Board)
			sqlCmd.Parameters.AddWithValue("@Master_Id", objAnnalsBoard.Master_Id)
			sqlCmd.Parameters.AddWithValue("@Priority", objAnnalsBoard.Priority)

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

	Public Sub deleteAnnalsBoard(ByVal objAnnalsBoard As AnnalsBoard)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM ANNALS_BOARD WHERE Id=@Id"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@Id", objAnnalsBoard.Id)

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

	Public Sub deleteAnnalsBoard(ByVal Id As String)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM ANNALS_BOARD WHERE Id=@Id"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@Id", Id)

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

	Public Function bindingAnnalsBoard(ByVal reader as SqlDataReader) As AnnalsBoard

		Dim objAnnalsBoard As New AnnalsBoard

		objAnnalsBoard.Id = CType(ConvertUtil.getObjectValue(reader("Id"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objAnnalsBoard.Board = CType(ConvertUtil.getObjectValue(reader("Board"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objAnnalsBoard.Master_Id = CType(ConvertUtil.getObjectValue(reader("Master_Id"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objAnnalsBoard.Priority = CType(ConvertUtil.getObjectValue(reader("Priority"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)

		Return objAnnalsBoard

	End Function

End Class
