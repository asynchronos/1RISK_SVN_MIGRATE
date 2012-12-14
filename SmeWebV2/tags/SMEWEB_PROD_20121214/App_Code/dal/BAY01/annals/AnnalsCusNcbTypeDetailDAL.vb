Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class AnnalsCusNcbTypeDetailDAL

	Private Shared className As String = "AnnalsCusNcbTypeDetailDAL"

	Public Function getAnnalsCusNcbTypeDetailByCUS_NCB_TYPE_DETAIL_ID(ByVal objAnnalsCusNcbTypeDetail As AnnalsCusNcbTypeDetail) As AnnalsCusNcbTypeDetail

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New AnnalsCusNcbTypeDetail()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "CUS_NCB_TYPE_DETAIL_ID, CUS_NCB_TYPE_ID, CUS_NCB_TYPE_DETAIL, PIORITY, " _
				& "DEL_FLAG " _
				& "FROM ANNALS_CUS_NCB_TYPE_DETAIL " _
				& "WHERE CUS_NCB_TYPE_DETAIL_ID=@CUS_NCB_TYPE_DETAIL_ID " _
				& "ORDER BY CUS_NCB_TYPE_DETAIL_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@CUS_NCB_TYPE_DETAIL_ID", objAnnalsCusNcbTypeDetail.CUS_NCB_TYPE_DETAIL_ID)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingAnnalsCusNcbTypeDetail(reader)
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

    Public Function getListAnnalsCusNcbTypeDetail(ByVal custNcbTypeID As Integer) As List(Of AnnalsCusNcbTypeDetail)

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New List(Of AnnalsCusNcbTypeDetail)

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = " SELECT " _
             & " CUS_NCB_TYPE_DETAIL_ID, CUS_NCB_TYPE_ID, CUS_NCB_TYPE_DETAIL, PIORITY, " _
             & " DEL_FLAG " _
             & " FROM ANNALS_CUS_NCB_TYPE_DETAIL " _
             & " WHERE CUS_NCB_TYPE_ID=@CUS_NCB_TYPE_ID AND DEL_FLAG  <> 1 " _
             & " ORDER BY CUS_NCB_TYPE_DETAIL_ID"



            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()
            sqlCmd.Parameters.AddWithValue("@CUS_NCB_TYPE_ID", custNcbTypeID)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result.Add(bindingAnnalsCusNcbTypeDetail(reader))
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

	Public Function getAllAnnalsCusNcbTypeDetail() As List (Of AnnalsCusNcbTypeDetail)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of AnnalsCusNcbTypeDetail)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "CUS_NCB_TYPE_DETAIL_ID, CUS_NCB_TYPE_ID, CUS_NCB_TYPE_DETAIL, PIORITY, " _
				& "DEL_FLAG " _
				& "FROM ANNALS_CUS_NCB_TYPE_DETAIL " _
				& "ORDER BY CUS_NCB_TYPE_DETAIL_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingAnnalsCusNcbTypeDetail(reader))
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

	Public Function getAllAnnalsCusNcbTypeDetailBySQL(ByVal sql AS String) As List (Of AnnalsCusNcbTypeDetail)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of AnnalsCusNcbTypeDetail)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingAnnalsCusNcbTypeDetail(reader))
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

	Public Sub insertAnnalsCusNcbTypeDetail(ByVal objAnnalsCusNcbTypeDetail As AnnalsCusNcbTypeDetail)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "INSERT INTO ANNALS_CUS_NCB_TYPE_DETAIL " _
							& " (CUS_NCB_TYPE_DETAIL_ID, CUS_NCB_TYPE_ID, CUS_NCB_TYPE_DETAIL, PIORITY, DEL_FLAG) " _
							& " VALUES(@CUS_NCB_TYPE_DETAIL_ID, @CUS_NCB_TYPE_ID, @CUS_NCB_TYPE_DETAIL, @PIORITY, @DEL_FLAG) "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@CUS_NCB_TYPE_DETAIL_ID", objAnnalsCusNcbTypeDetail.CUS_NCB_TYPE_DETAIL_ID)
			sqlCmd.Parameters.AddWithValue("@CUS_NCB_TYPE_ID", objAnnalsCusNcbTypeDetail.CUS_NCB_TYPE_ID)
			sqlCmd.Parameters.AddWithValue("@CUS_NCB_TYPE_DETAIL", objAnnalsCusNcbTypeDetail.CUS_NCB_TYPE_DETAIL)
			sqlCmd.Parameters.AddWithValue("@PIORITY", objAnnalsCusNcbTypeDetail.PIORITY)
			sqlCmd.Parameters.AddWithValue("@DEL_FLAG", objAnnalsCusNcbTypeDetail.DEL_FLAG)

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

	Public Sub updateAnnalsCusNcbTypeDetail(ByVal objAnnalsCusNcbTypeDetail As AnnalsCusNcbTypeDetail)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "UPDATE ANNALS_CUS_NCB_TYPE_DETAIL SET " _
							& " CUS_NCB_TYPE_ID=@CUS_NCB_TYPE_ID, " _
							& " CUS_NCB_TYPE_DETAIL=@CUS_NCB_TYPE_DETAIL, " _
							& " PIORITY=@PIORITY, " _
							& " DEL_FLAG=@DEL_FLAG " _
							& " WHERE CUS_NCB_TYPE_DETAIL_ID=@CUS_NCB_TYPE_DETAIL_ID "
			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@CUS_NCB_TYPE_DETAIL_ID", objAnnalsCusNcbTypeDetail.CUS_NCB_TYPE_DETAIL_ID)
			sqlCmd.Parameters.AddWithValue("@CUS_NCB_TYPE_ID", objAnnalsCusNcbTypeDetail.CUS_NCB_TYPE_ID)
			sqlCmd.Parameters.AddWithValue("@CUS_NCB_TYPE_DETAIL", objAnnalsCusNcbTypeDetail.CUS_NCB_TYPE_DETAIL)
			sqlCmd.Parameters.AddWithValue("@PIORITY", objAnnalsCusNcbTypeDetail.PIORITY)
			sqlCmd.Parameters.AddWithValue("@DEL_FLAG", objAnnalsCusNcbTypeDetail.DEL_FLAG)

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

	Public Sub deleteAnnalsCusNcbTypeDetail(ByVal objAnnalsCusNcbTypeDetail As AnnalsCusNcbTypeDetail)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM ANNALS_CUS_NCB_TYPE_DETAIL WHERE CUS_NCB_TYPE_DETAIL_ID=@CUS_NCB_TYPE_DETAIL_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@CUS_NCB_TYPE_DETAIL_ID", objAnnalsCusNcbTypeDetail.CUS_NCB_TYPE_DETAIL_ID)

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

	Public Sub deleteAnnalsCusNcbTypeDetail(ByVal CUS_NCB_TYPE_DETAIL_ID As Integer)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM ANNALS_CUS_NCB_TYPE_DETAIL WHERE CUS_NCB_TYPE_DETAIL_ID=@CUS_NCB_TYPE_DETAIL_ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@CUS_NCB_TYPE_DETAIL_ID", CUS_NCB_TYPE_DETAIL_ID)

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

	Public Function bindingAnnalsCusNcbTypeDetail(ByVal reader as SqlDataReader) As AnnalsCusNcbTypeDetail

		Dim objAnnalsCusNcbTypeDetail As New AnnalsCusNcbTypeDetail

		objAnnalsCusNcbTypeDetail.CUS_NCB_TYPE_DETAIL_ID = CType(ConvertUtil.getObjectValue(reader("CUS_NCB_TYPE_DETAIL_ID"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
		objAnnalsCusNcbTypeDetail.CUS_NCB_TYPE_ID = CType(ConvertUtil.getObjectValue(reader("CUS_NCB_TYPE_ID"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
		objAnnalsCusNcbTypeDetail.CUS_NCB_TYPE_DETAIL = CType(ConvertUtil.getObjectValue(reader("CUS_NCB_TYPE_DETAIL"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objAnnalsCusNcbTypeDetail.PIORITY = CType(ConvertUtil.getObjectValue(reader("PIORITY"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
		objAnnalsCusNcbTypeDetail.DEL_FLAG = CType(ConvertUtil.getObjectValue(reader("DEL_FLAG"), ConvertUtil.ObjectValueEnum.BooleanValue), Boolean)

		Return objAnnalsCusNcbTypeDetail

	End Function

End Class
