Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class AnnalsCusNcbDAL

	Private Shared className As String = "AnnalsCusNcbDAL"

	Public Function getAnnalsCusNcbByID(ByVal objAnnalsCusNcb As AnnalsCusNcb) As AnnalsCusNcb

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New AnnalsCusNcb()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "ID, CIF, CUS_NCB_TYPE_ID, CUS_NCB_DATE, " _
             & "CUS_NCB_TYPE_DETAIL_ID, DETAIL, DEPT_ID, CUS_TYPE_ID, " _
             & "AUTH_1_ID, AUTH_2_ID " _
             & "FROM ANNALS_CUS_NCB " _
             & "WHERE ID=@ID AND CIF=@CIF " _
             & "ORDER BY ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@ID", objAnnalsCusNcb.ID)
            sqlCmd.Parameters.AddWithValue("@CIF", objAnnalsCusNcb.CIF)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingAnnalsCusNcb(reader)
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

	Public Function getAnnalsCusNcbByID(ByVal ID As String) As AnnalsCusNcb

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New AnnalsCusNcb()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "ID, CIF, CUS_NCB_TYPE_ID, CUS_NCB_DATE, " _
				& "CUS_NCB_TYPE_DETAIL_ID, DETAIL, DEPT_ID, CUS_TYPE_ID, " _
				& "AUTH_1_ID, AUTH_2_ID " _
				& "FROM ANNALS_CUS_NCB " _
				& "WHERE ID=@ID " _
				& "ORDER BY ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@ID", ID)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingAnnalsCusNcb(reader)
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

	Public Function getAllAnnalsCusNcb() As List (Of AnnalsCusNcb)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of AnnalsCusNcb)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "ID, CIF, CUS_NCB_TYPE_ID, CUS_NCB_DATE, " _
				& "CUS_NCB_TYPE_DETAIL_ID, DETAIL, DEPT_ID, CUS_TYPE_ID, " _
				& "AUTH_1_ID, AUTH_2_ID " _
				& "FROM ANNALS_CUS_NCB " _
				& "ORDER BY ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingAnnalsCusNcb(reader))
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

	Public Function getAllAnnalsCusNcbBySQL(ByVal sql AS String) As List (Of AnnalsCusNcb)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of AnnalsCusNcb)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingAnnalsCusNcb(reader))
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

	Public Sub insertAnnalsCusNcb(ByVal objAnnalsCusNcb As AnnalsCusNcb)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "INSERT INTO ANNALS_CUS_NCB " _
							& " (ID, CIF, CUS_NCB_TYPE_ID, CUS_NCB_DATE, CUS_NCB_TYPE_DETAIL_ID, DETAIL, DEPT_ID, CUS_TYPE_ID, AUTH_1_ID, AUTH_2_ID) " _
							& " VALUES(@ID, @CIF, @CUS_NCB_TYPE_ID, @CUS_NCB_DATE, @CUS_NCB_TYPE_DETAIL_ID, @DETAIL, @DEPT_ID, @CUS_TYPE_ID, @AUTH_1_ID, @AUTH_2_ID) "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@ID", objAnnalsCusNcb.ID)
            sqlCmd.Parameters.AddWithValue("@CIF", objAnnalsCusNcb.CIF)
			sqlCmd.Parameters.AddWithValue("@CUS_NCB_TYPE_ID", objAnnalsCusNcb.CUS_NCB_TYPE_ID)
			sqlCmd.Parameters.AddWithValue("@CUS_NCB_DATE", objAnnalsCusNcb.CUS_NCB_DATE)
			sqlCmd.Parameters.AddWithValue("@CUS_NCB_TYPE_DETAIL_ID", objAnnalsCusNcb.CUS_NCB_TYPE_DETAIL_ID)
			sqlCmd.Parameters.AddWithValue("@DETAIL", objAnnalsCusNcb.DETAIL)
			sqlCmd.Parameters.AddWithValue("@DEPT_ID", objAnnalsCusNcb.DEPT_ID)
			sqlCmd.Parameters.AddWithValue("@CUS_TYPE_ID", objAnnalsCusNcb.CUS_TYPE_ID)
			sqlCmd.Parameters.AddWithValue("@AUTH_1_ID", objAnnalsCusNcb.AUTH_1_ID)
			sqlCmd.Parameters.AddWithValue("@AUTH_2_ID", objAnnalsCusNcb.AUTH_2_ID)

            sqlCmd.ExecuteNonQuery()

            'MsgBox(sql)
		Catch ex As Exception
			Throw New Exception(ex.Message & " : " & ex.StackTrace)
		Finally
			If (conn.State = ConnectionState.Open) Then
				conn.Close()
			End IF
			conn = Nothing
		End Try

	End Sub

	Public Sub updateAnnalsCusNcb(ByVal objAnnalsCusNcb As AnnalsCusNcb)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "UPDATE ANNALS_CUS_NCB SET " _
                & " CUS_NCB_TYPE_ID=@CUS_NCB_TYPE_ID, " _
                & " CUS_NCB_DATE=@CUS_NCB_DATE, " _
                & " CUS_NCB_TYPE_DETAIL_ID=@CUS_NCB_TYPE_DETAIL_ID, " _
                & " DETAIL=@DETAIL, " _
                & " DEPT_ID=@DEPT_ID, " _
                & " CUS_TYPE_ID=@CUS_TYPE_ID, " _
                & " AUTH_1_ID=@AUTH_1_ID, " _
                & " AUTH_2_ID=@AUTH_2_ID " _
                & " WHERE ID=@ID AND CIF=@CIF"
			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@ID", objAnnalsCusNcb.ID)
			sqlCmd.Parameters.AddWithValue("@CIF", objAnnalsCusNcb.CIF)
			sqlCmd.Parameters.AddWithValue("@CUS_NCB_TYPE_ID", objAnnalsCusNcb.CUS_NCB_TYPE_ID)
			sqlCmd.Parameters.AddWithValue("@CUS_NCB_DATE", objAnnalsCusNcb.CUS_NCB_DATE)
			sqlCmd.Parameters.AddWithValue("@CUS_NCB_TYPE_DETAIL_ID", objAnnalsCusNcb.CUS_NCB_TYPE_DETAIL_ID)
			sqlCmd.Parameters.AddWithValue("@DETAIL", objAnnalsCusNcb.DETAIL)
			sqlCmd.Parameters.AddWithValue("@DEPT_ID", objAnnalsCusNcb.DEPT_ID)
			sqlCmd.Parameters.AddWithValue("@CUS_TYPE_ID", objAnnalsCusNcb.CUS_TYPE_ID)
			sqlCmd.Parameters.AddWithValue("@AUTH_1_ID", objAnnalsCusNcb.AUTH_1_ID)
			sqlCmd.Parameters.AddWithValue("@AUTH_2_ID", objAnnalsCusNcb.AUTH_2_ID)

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

	Public Sub deleteAnnalsCusNcb(ByVal objAnnalsCusNcb As AnnalsCusNcb)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "DELETE FROM ANNALS_CUS_NCB WHERE ID=@ID AND CIF=@CIF"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@ID", objAnnalsCusNcb.ID)
            sqlCmd.Parameters.AddWithValue("@CIF", objAnnalsCusNcb.CIF)

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

    'Public Sub deleteAnnalsCusNcb(ByVal ID As String)

    '	'declare connection
    '	Dim conn As SqlConnection = Nothing

    '	Try
    '		conn = ConnectionUtil.getSqlConnectionFromWebConfig()
    '		Dim sql As String = "DELETE FROM ANNALS_CUS_NCB WHERE ID=@ID"

    '		Dim sqlCmd As New SqlCommand(sql, conn)
    '		sqlCmd.Prepare()

    '		sqlCmd.Parameters.AddWithValue("@ID", ID)

    '		sqlCmd.ExecuteNonQuery()
    '	Catch ex As Exception
    '		Throw New Exception(ex.Message & " : " & ex.StackTrace)
    '	Finally
    '		If (conn.State = ConnectionState.Open) Then
    '			conn.Close()
    '		End IF
    '		conn = Nothing
    '	End Try

    'End Sub

	Public Function bindingAnnalsCusNcb(ByVal reader as SqlDataReader) As AnnalsCusNcb

		Dim objAnnalsCusNcb As New AnnalsCusNcb

		objAnnalsCusNcb.ID = CType(ConvertUtil.getObjectValue(reader("ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objAnnalsCusNcb.CIF = CType(ConvertUtil.getObjectValue(reader("CIF"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
		objAnnalsCusNcb.CUS_NCB_TYPE_ID = CType(ConvertUtil.getObjectValue(reader("CUS_NCB_TYPE_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objAnnalsCusNcb.CUS_NCB_DATE = CType(ConvertUtil.getObjectValue(reader("CUS_NCB_DATE"), ConvertUtil.ObjectValueEnum.DateValue), Date)
		objAnnalsCusNcb.CUS_NCB_TYPE_DETAIL_ID = CType(ConvertUtil.getObjectValue(reader("CUS_NCB_TYPE_DETAIL_ID"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
		objAnnalsCusNcb.DETAIL = CType(ConvertUtil.getObjectValue(reader("DETAIL"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objAnnalsCusNcb.DEPT_ID = CType(ConvertUtil.getObjectValue(reader("DEPT_ID"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
		objAnnalsCusNcb.CUS_TYPE_ID = CType(ConvertUtil.getObjectValue(reader("CUS_TYPE_ID"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
		objAnnalsCusNcb.AUTH_1_ID = CType(ConvertUtil.getObjectValue(reader("AUTH_1_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objAnnalsCusNcb.AUTH_2_ID = CType(ConvertUtil.getObjectValue(reader("AUTH_2_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)

		Return objAnnalsCusNcb

	End Function

End Class
