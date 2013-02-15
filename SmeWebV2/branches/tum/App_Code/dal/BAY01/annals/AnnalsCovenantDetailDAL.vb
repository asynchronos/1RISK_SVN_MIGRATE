Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class AnnalsCovenantDetailDAL

	Private Shared className As String = "AnnalsCovenantDetailDAL"

	Public Function getAnnalsCovenantDetailByCOVENANT_DETAIL_ID(ByVal objAnnalsCovenantDetail As AnnalsCovenantDetail) As AnnalsCovenantDetail

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New AnnalsCovenantDetail()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "COVENANT_DETAIL_ID, COVENANT_DETAIL, PRIORITY, COVENANT_TYPE_ID " _
				& "FROM ANNALS_COVENANT_DETAIL " _
				& "WHERE COVENANT_DETAIL_ID=@COVENANT_DETAIL_ID " _
				& "ORDER BY COVENANT_DETAIL_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@COVENANT_DETAIL_ID", objAnnalsCovenantDetail.COVENANT_DETAIL_ID)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingAnnalsCovenantDetail(reader)
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

	Public Function getAnnalsCovenantDetailByCOVENANT_DETAIL_ID(ByVal COVENANT_DETAIL_ID As Integer) As AnnalsCovenantDetail

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New AnnalsCovenantDetail()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "COVENANT_DETAIL_ID, COVENANT_DETAIL, PRIORITY, COVENANT_TYPE_ID " _
				& "FROM ANNALS_COVENANT_DETAIL " _
				& "WHERE COVENANT_DETAIL_ID=@COVENANT_DETAIL_ID " _
				& "ORDER BY COVENANT_DETAIL_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@COVENANT_DETAIL_ID", COVENANT_DETAIL_ID)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingAnnalsCovenantDetail(reader)
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

    Public Function getAllAnnalsCovenantDetailByCOVENANT_TYPE_ID(ByVal COVENANT_TYPE_ID As Integer) As List(Of AnnalsCovenantDetail)

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New List(Of AnnalsCovenantDetail)

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & " COVENANT_DETAIL_ID, COVENANT_DETAIL_ID + ':' + SUBSTRING(COVENANT_DETAIL,0,50) AS COVENANT_DETAIL_SHORT, COVENANT_DETAIL_ID + ':' +COVENANT_DETAIL  AS  COVENANT_DETAIL,PRIORITY, COVENANT_TYPE_ID " _
             & " FROM ANNALS_COVENANT_DETAIL " _
             & " Where COVENANT_TYPE_ID = @COVENANT_TYPE_ID " _
             & " ORDER BY COVENANT_DETAIL_ID"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@COVENANT_TYPE_ID", COVENANT_TYPE_ID)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result.Add(bindingAnnalsCovenantDetail(reader))
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
    
	Public Function getAllAnnalsCovenantDetail() As List (Of AnnalsCovenantDetail)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of AnnalsCovenantDetail)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "COVENANT_DETAIL_ID, COVENANT_DETAIL, PRIORITY, COVENANT_TYPE_ID " _
				& "FROM ANNALS_COVENANT_DETAIL " _
				& "ORDER BY COVENANT_DETAIL_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingAnnalsCovenantDetail(reader))
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

	Public Function getAllAnnalsCovenantDetailBySQL(ByVal sql AS String) As List (Of AnnalsCovenantDetail)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of AnnalsCovenantDetail)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingAnnalsCovenantDetail(reader))
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

	Public Sub insertAnnalsCovenantDetail(ByVal objAnnalsCovenantDetail As AnnalsCovenantDetail)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "INSERT INTO ANNALS_COVENANT_DETAIL " _
							& " (COVENANT_DETAIL_ID, COVENANT_DETAIL, PRIORITY, COVENANT_TYPE_ID) " _
							& " VALUES(@COVENANT_DETAIL_ID, @COVENANT_DETAIL, @PRIORITY, @COVENANT_TYPE_ID) "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@COVENANT_DETAIL_ID", objAnnalsCovenantDetail.COVENANT_DETAIL_ID)
			sqlCmd.Parameters.AddWithValue("@COVENANT_DETAIL", objAnnalsCovenantDetail.COVENANT_DETAIL)
			sqlCmd.Parameters.AddWithValue("@PRIORITY", objAnnalsCovenantDetail.PRIORITY)
			sqlCmd.Parameters.AddWithValue("@COVENANT_TYPE_ID", objAnnalsCovenantDetail.COVENANT_TYPE_ID)

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

	Public Sub updateAnnalsCovenantDetail(ByVal objAnnalsCovenantDetail As AnnalsCovenantDetail)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "UPDATE ANNALS_COVENANT_DETAIL SET " _
							& " COVENANT_DETAIL=@COVENANT_DETAIL, " _
							& " PRIORITY=@PRIORITY, " _
							& " COVENANT_TYPE_ID=@COVENANT_TYPE_ID " _
							& " WHERE COVENANT_DETAIL_ID=@COVENANT_DETAIL_ID "
			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@COVENANT_DETAIL_ID", objAnnalsCovenantDetail.COVENANT_DETAIL_ID)
			sqlCmd.Parameters.AddWithValue("@COVENANT_DETAIL", objAnnalsCovenantDetail.COVENANT_DETAIL)
			sqlCmd.Parameters.AddWithValue("@PRIORITY", objAnnalsCovenantDetail.PRIORITY)
			sqlCmd.Parameters.AddWithValue("@COVENANT_TYPE_ID", objAnnalsCovenantDetail.COVENANT_TYPE_ID)

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

	Public Sub deleteAnnalsCovenantDetail(ByVal objAnnalsCovenantDetail As AnnalsCovenantDetail)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM ANNALS_COVENANT_DETAIL WHERE COVENANT_DETAIL_ID=@COVENANT_DETAIL_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@COVENANT_DETAIL_ID", objAnnalsCovenantDetail.COVENANT_DETAIL_ID)

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

	Public Sub deleteAnnalsCovenantDetail(ByVal COVENANT_DETAIL_ID As Integer)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM ANNALS_COVENANT_DETAIL WHERE COVENANT_DETAIL_ID=@COVENANT_DETAIL_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@COVENANT_DETAIL_ID", COVENANT_DETAIL_ID)

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

	Public Function bindingAnnalsCovenantDetail(ByVal reader as SqlDataReader) As AnnalsCovenantDetail

		Dim objAnnalsCovenantDetail As New AnnalsCovenantDetail

        objAnnalsCovenantDetail.COVENANT_DETAIL_ID = CType(ConvertUtil.getObjectValue(reader("COVENANT_DETAIL_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsCovenantDetail.COVENANT_DETAIL = CType(ConvertUtil.getObjectValue(reader("COVENANT_DETAIL"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsCovenantDetail.COVENANT_DETAIL_SHORT = CType(ConvertUtil.getObjectValue(reader("COVENANT_DETAIL_SHORT"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objAnnalsCovenantDetail.PRIORITY = CType(ConvertUtil.getObjectValue(reader("PRIORITY"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objAnnalsCovenantDetail.COVENANT_TYPE_ID = CType(ConvertUtil.getObjectValue(reader("COVENANT_TYPE_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)

		Return objAnnalsCovenantDetail

	End Function

End Class
