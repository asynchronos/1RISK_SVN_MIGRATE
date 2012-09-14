Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class AnnalsSubjectDetailDAL

	Private Shared className As String = "AnnalsSubjectDetailDAL"

	Public Function getAnnalsSubjectDetailBySUBJECT_DETAIL_ID(ByVal objAnnalsSubjectDetail As AnnalsSubjectDetail) As AnnalsSubjectDetail

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New AnnalsSubjectDetail()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "SUBJECT_DETAIL_ID, SUBJECT_DETAIL, SUBJECT_DETAIL_ENG, SUBJECT_ID,SUBJECT_ACTION,PRIORITY " _
             & "FROM ANNALS_SUBJECT_DETAIL " _
             & "WHERE SUBJECT_DETAIL_ID=@SUBJECT_DETAIL_ID " _
             & "ORDER BY  PRIORITY ASC"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@SUBJECT_DETAIL_ID", objAnnalsSubjectDetail.SUBJECT_DETAIL_ID)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingAnnalsSubjectDetail(reader)
			End While

			reader.close()
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

	Public Function getAnnalsSubjectDetailBySUBJECT_DETAIL_ID(ByVal SUBJECT_DETAIL_ID As String) As AnnalsSubjectDetail

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New AnnalsSubjectDetail()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "SUBJECT_DETAIL_ID, SUBJECT_DETAIL, SUBJECT_DETAIL_ENG, SUBJECT_ID,SUBJECT_ACTION,PRIORITY " _
             & "FROM ANNALS_SUBJECT_DETAIL " _
             & "WHERE SUBJECT_DETAIL_ID=@SUBJECT_DETAIL_ID " _
             & "ORDER BY  PRIORITY ASC"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@SUBJECT_DETAIL_ID", SUBJECT_DETAIL_ID)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingAnnalsSubjectDetail(reader)
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

	Public Function getAllAnnalsSubjectDetail() As List (Of AnnalsSubjectDetail)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of AnnalsSubjectDetail)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "SUBJECT_DETAIL_ID, SUBJECT_DETAIL, SUBJECT_DETAIL_ENG, SUBJECT_ID,SUBJECT_ACTION,PRIORITY " _
             & "FROM ANNALS_SUBJECT_DETAIL " _
             & "ORDER BY  PRIORITY ASC"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingAnnalsSubjectDetail(reader))
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
    Public Function getAllAnnalsSubjectDetailBySubjectID(ByVal SUBJECT_ID As String) As List(Of AnnalsSubjectDetail)

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New List(Of AnnalsSubjectDetail)

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "SUBJECT_DETAIL_ID, SUBJECT_DETAIL, SUBJECT_DETAIL_ENG, SUBJECT_ID,SUBJECT_ACTION,PRIORITY " _
             & " FROM ANNALS_SUBJECT_DETAIL " _
             & " WHERE SUBJECT_ID=@SUBJECT_ID " _
             & " ORDER BY  PRIORITY ASC"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@SUBJECT_ID", SUBJECT_ID)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result.Add(bindingAnnalsSubjectDetail(reader))
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
	Public Function getAllAnnalsSubjectDetailBySQL(ByVal sql AS String) As List (Of AnnalsSubjectDetail)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of AnnalsSubjectDetail)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingAnnalsSubjectDetail(reader))
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

	Public Sub insertAnnalsSubjectDetail(ByVal objAnnalsSubjectDetail As AnnalsSubjectDetail)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "INSERT INTO ANNALS_SUBJECT_DETAIL " _
                & " (SUBJECT_DETAIL_ID, SUBJECT_DETAIL, SUBJECT_DETAIL_ENG, SUBJECT_ID) " _
                & " VALUES(@SUBJECT_DETAIL_ID, @SUBJECT_DETAIL, @SUBJECT_DETAIL_ENG, @SUBJECT_ID) "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@SUBJECT_DETAIL_ID", objAnnalsSubjectDetail.SUBJECT_DETAIL_ID)
			sqlCmd.Parameters.AddWithValue("@SUBJECT_DETAIL", objAnnalsSubjectDetail.SUBJECT_DETAIL)
			sqlCmd.Parameters.AddWithValue("@SUBJECT_DETAIL_ENG", objAnnalsSubjectDetail.SUBJECT_DETAIL_ENG)
			sqlCmd.Parameters.AddWithValue("@SUBJECT_ID", objAnnalsSubjectDetail.SUBJECT_ID)

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

	Public Sub updateAnnalsSubjectDetail(ByVal objAnnalsSubjectDetail As AnnalsSubjectDetail)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "UPDATE ANNALS_SUBJECT_DETAIL SET " _
							& " SUBJECT_DETAIL=@SUBJECT_DETAIL, " _
							& " SUBJECT_DETAIL_ENG=@SUBJECT_DETAIL_ENG, " _
							& " SUBJECT_ID=@SUBJECT_ID " _
							& " WHERE SUBJECT_DETAIL_ID=@SUBJECT_DETAIL_ID "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@SUBJECT_DETAIL_ID", objAnnalsSubjectDetail.SUBJECT_DETAIL_ID)
			sqlCmd.Parameters.AddWithValue("@SUBJECT_DETAIL", objAnnalsSubjectDetail.SUBJECT_DETAIL)
			sqlCmd.Parameters.AddWithValue("@SUBJECT_DETAIL_ENG", objAnnalsSubjectDetail.SUBJECT_DETAIL_ENG)
			sqlCmd.Parameters.AddWithValue("@SUBJECT_ID", objAnnalsSubjectDetail.SUBJECT_ID)

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

	Public Sub deleteAnnalsSubjectDetail(ByVal objAnnalsSubjectDetail As AnnalsSubjectDetail)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM ANNALS_SUBJECT_DETAIL WHERE SUBJECT_DETAIL_ID=@SUBJECT_DETAIL_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@SUBJECT_DETAIL_ID", objAnnalsSubjectDetail.SUBJECT_DETAIL_ID)

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

	Public Sub deleteAnnalsSubjectDetail(ByVal SUBJECT_DETAIL_ID As String)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM ANNALS_SUBJECT_DETAIL WHERE SUBJECT_DETAIL_ID=@SUBJECT_DETAIL_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@SUBJECT_DETAIL_ID", SUBJECT_DETAIL_ID)

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

	Public Function bindingAnnalsSubjectDetail(ByVal reader as SqlDataReader) As AnnalsSubjectDetail

		Dim objAnnalsSubjectDetail As New AnnalsSubjectDetail

		objAnnalsSubjectDetail.SUBJECT_DETAIL_ID = CType(ConvertUtil.getObjectValue(reader("SUBJECT_DETAIL_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objAnnalsSubjectDetail.SUBJECT_DETAIL = CType(ConvertUtil.getObjectValue(reader("SUBJECT_DETAIL"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objAnnalsSubjectDetail.SUBJECT_DETAIL_ENG = CType(ConvertUtil.getObjectValue(reader("SUBJECT_DETAIL_ENG"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsSubjectDetail.SUBJECT_ID = CType(ConvertUtil.getObjectValue(reader("SUBJECT_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsSubjectDetail.SUBJECT_ACTION = CType(ConvertUtil.getObjectValue(reader("SUBJECT_ACTION"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objAnnalsSubjectDetail.PRIORITY = CType(ConvertUtil.getObjectValue(reader("PRIORITY"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)

		Return objAnnalsSubjectDetail

	End Function

End Class
