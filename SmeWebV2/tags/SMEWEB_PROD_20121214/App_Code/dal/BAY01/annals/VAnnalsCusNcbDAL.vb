Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class VAnnalsCusNcbDAL

	Private Shared className As String = "VAnnalsCusNcbDAL"

	Public Function getVAnnalsCusNcbByID(ByVal objVAnnalsCusNcb As VAnnalsCusNcb) As VAnnalsCusNcb

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New VAnnalsCusNcb()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "ID, CIF, Cifname, CUS_NCB_TYPE_ID, " _
             & "CUS_NCB_TYPE, CUS_NCB_TYPE_DETAIL_ID, CUS_NCB_TYPE_DETAIL, CUS_NCB_DATE, " _
             & "DETAIL, DEPT_ID, DEPT, CUS_TYPE_ID, " _
             & "CUS_TYPE, AUTH_1_ID, AUTH_1_NAME, AUTH_2_ID, " _
             & "AUTH_2_NAME " _
             & "FROM V_ANNALS_CUS_NCB " _
             & "WHERE ID=@ID " _
             & "AND CIF=@CIF " _
             & "ORDER BY ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@ID", objVAnnalsCusNcb.ID)
            sqlCmd.Parameters.AddWithValue("@CIF", objVAnnalsCusNcb.CIF)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingVAnnalsCusNcb(reader)
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

	Public Function getVAnnalsCusNcbByID(ByVal ID As String) As VAnnalsCusNcb

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New VAnnalsCusNcb()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "ID, CIF, Cifname, CUS_NCB_TYPE_ID, " _
				& "CUS_NCB_TYPE, CUS_NCB_TYPE_DETAIL_ID, CUS_NCB_TYPE_DETAIL, CUS_NCB_DATE, " _
				& "DETAIL, DEPT_ID, DEPT, CUS_TYPE_ID, " _
				& "CUS_TYPE, AUTH_1_ID, AUTH_1_NAME, AUTH_2_ID, " _
				& "AUTH_2_NAME " _
				& "FROM V_ANNALS_CUS_NCB " _
				& "WHERE ID=@ID " _
				& "ORDER BY ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@ID", ID)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingVAnnalsCusNcb(reader)
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

	Public Function getAllVAnnalsCusNcb() As List (Of VAnnalsCusNcb)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of VAnnalsCusNcb)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "ID, CIF, Cifname, CUS_NCB_TYPE_ID, " _
				& "CUS_NCB_TYPE, CUS_NCB_TYPE_DETAIL_ID, CUS_NCB_TYPE_DETAIL, CUS_NCB_DATE, " _
				& "DETAIL, DEPT_ID, DEPT, CUS_TYPE_ID, " _
				& "CUS_TYPE, AUTH_1_ID, AUTH_1_NAME, AUTH_2_ID, " _
				& "AUTH_2_NAME " _
				& "FROM V_ANNALS_CUS_NCB " _
				& "ORDER BY ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingVAnnalsCusNcb(reader))
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

	Public Function getAllVAnnalsCusNcbBySQL(ByVal sql AS String) As List (Of VAnnalsCusNcb)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of VAnnalsCusNcb)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingVAnnalsCusNcb(reader))
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

	Public Sub insertVAnnalsCusNcb(ByVal objVAnnalsCusNcb As VAnnalsCusNcb)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "INSERT INTO V_ANNALS_CUS_NCB " _
							& " (ID, CIF, Cifname, CUS_NCB_TYPE_ID, CUS_NCB_TYPE, CUS_NCB_TYPE_DETAIL_ID, CUS_NCB_TYPE_DETAIL, CUS_NCB_DATE, DETAIL, DEPT_ID, DEPT, CUS_TYPE_ID, CUS_TYPE, AUTH_1_ID, AUTH_1_NAME, AUTH_2_ID, AUTH_2_NAME) " _
							& " VALUES(@ID, @CIF, @Cifname, @CUS_NCB_TYPE_ID, @CUS_NCB_TYPE, @CUS_NCB_TYPE_DETAIL_ID, @CUS_NCB_TYPE_DETAIL, @CUS_NCB_DATE, @DETAIL, @DEPT_ID, @DEPT, @CUS_TYPE_ID, @CUS_TYPE, @AUTH_1_ID, @AUTH_1_NAME, @AUTH_2_ID, @AUTH_2_NAME) "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@ID", objVAnnalsCusNcb.ID)
			sqlCmd.Parameters.AddWithValue("@CIF", objVAnnalsCusNcb.CIF)
			sqlCmd.Parameters.AddWithValue("@Cifname", objVAnnalsCusNcb.Cifname)
			sqlCmd.Parameters.AddWithValue("@CUS_NCB_TYPE_ID", objVAnnalsCusNcb.CUS_NCB_TYPE_ID)
			sqlCmd.Parameters.AddWithValue("@CUS_NCB_TYPE", objVAnnalsCusNcb.CUS_NCB_TYPE)
			sqlCmd.Parameters.AddWithValue("@CUS_NCB_TYPE_DETAIL_ID", objVAnnalsCusNcb.CUS_NCB_TYPE_DETAIL_ID)
			sqlCmd.Parameters.AddWithValue("@CUS_NCB_TYPE_DETAIL", objVAnnalsCusNcb.CUS_NCB_TYPE_DETAIL)
			sqlCmd.Parameters.AddWithValue("@CUS_NCB_DATE", objVAnnalsCusNcb.CUS_NCB_DATE)
			sqlCmd.Parameters.AddWithValue("@DETAIL", objVAnnalsCusNcb.DETAIL)
			sqlCmd.Parameters.AddWithValue("@DEPT_ID", objVAnnalsCusNcb.DEPT_ID)
			sqlCmd.Parameters.AddWithValue("@DEPT", objVAnnalsCusNcb.DEPT)
			sqlCmd.Parameters.AddWithValue("@CUS_TYPE_ID", objVAnnalsCusNcb.CUS_TYPE_ID)
			sqlCmd.Parameters.AddWithValue("@CUS_TYPE", objVAnnalsCusNcb.CUS_TYPE)
			sqlCmd.Parameters.AddWithValue("@AUTH_1_ID", objVAnnalsCusNcb.AUTH_1_ID)
			sqlCmd.Parameters.AddWithValue("@AUTH_1_NAME", objVAnnalsCusNcb.AUTH_1_NAME)
			sqlCmd.Parameters.AddWithValue("@AUTH_2_ID", objVAnnalsCusNcb.AUTH_2_ID)
			sqlCmd.Parameters.AddWithValue("@AUTH_2_NAME", objVAnnalsCusNcb.AUTH_2_NAME)

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

	Public Sub updateVAnnalsCusNcb(ByVal objVAnnalsCusNcb As VAnnalsCusNcb)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "UPDATE V_ANNALS_CUS_NCB SET " _
							& " CIF=@CIF, " _
							& " Cifname=@Cifname, " _
							& " CUS_NCB_TYPE_ID=@CUS_NCB_TYPE_ID, " _
							& " CUS_NCB_TYPE=@CUS_NCB_TYPE, " _
							& " CUS_NCB_TYPE_DETAIL_ID=@CUS_NCB_TYPE_DETAIL_ID, " _
							& " CUS_NCB_TYPE_DETAIL=@CUS_NCB_TYPE_DETAIL, " _
							& " CUS_NCB_DATE=@CUS_NCB_DATE, " _
							& " DETAIL=@DETAIL, " _
							& " DEPT_ID=@DEPT_ID, " _
							& " DEPT=@DEPT, " _
							& " CUS_TYPE_ID=@CUS_TYPE_ID, " _
							& " CUS_TYPE=@CUS_TYPE, " _
							& " AUTH_1_ID=@AUTH_1_ID, " _
							& " AUTH_1_NAME=@AUTH_1_NAME, " _
							& " AUTH_2_ID=@AUTH_2_ID, " _
							& " AUTH_2_NAME=@AUTH_2_NAME " _
							& " WHERE ID=@ID "
			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@ID", objVAnnalsCusNcb.ID)
			sqlCmd.Parameters.AddWithValue("@CIF", objVAnnalsCusNcb.CIF)
			sqlCmd.Parameters.AddWithValue("@Cifname", objVAnnalsCusNcb.Cifname)
			sqlCmd.Parameters.AddWithValue("@CUS_NCB_TYPE_ID", objVAnnalsCusNcb.CUS_NCB_TYPE_ID)
			sqlCmd.Parameters.AddWithValue("@CUS_NCB_TYPE", objVAnnalsCusNcb.CUS_NCB_TYPE)
			sqlCmd.Parameters.AddWithValue("@CUS_NCB_TYPE_DETAIL_ID", objVAnnalsCusNcb.CUS_NCB_TYPE_DETAIL_ID)
			sqlCmd.Parameters.AddWithValue("@CUS_NCB_TYPE_DETAIL", objVAnnalsCusNcb.CUS_NCB_TYPE_DETAIL)
			sqlCmd.Parameters.AddWithValue("@CUS_NCB_DATE", objVAnnalsCusNcb.CUS_NCB_DATE)
			sqlCmd.Parameters.AddWithValue("@DETAIL", objVAnnalsCusNcb.DETAIL)
			sqlCmd.Parameters.AddWithValue("@DEPT_ID", objVAnnalsCusNcb.DEPT_ID)
			sqlCmd.Parameters.AddWithValue("@DEPT", objVAnnalsCusNcb.DEPT)
			sqlCmd.Parameters.AddWithValue("@CUS_TYPE_ID", objVAnnalsCusNcb.CUS_TYPE_ID)
			sqlCmd.Parameters.AddWithValue("@CUS_TYPE", objVAnnalsCusNcb.CUS_TYPE)
			sqlCmd.Parameters.AddWithValue("@AUTH_1_ID", objVAnnalsCusNcb.AUTH_1_ID)
			sqlCmd.Parameters.AddWithValue("@AUTH_1_NAME", objVAnnalsCusNcb.AUTH_1_NAME)
			sqlCmd.Parameters.AddWithValue("@AUTH_2_ID", objVAnnalsCusNcb.AUTH_2_ID)
			sqlCmd.Parameters.AddWithValue("@AUTH_2_NAME", objVAnnalsCusNcb.AUTH_2_NAME)

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

	Public Sub deleteVAnnalsCusNcb(ByVal objVAnnalsCusNcb As VAnnalsCusNcb)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM V_ANNALS_CUS_NCB WHERE ID=@ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@ID", objVAnnalsCusNcb.ID)

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

	Public Sub deleteVAnnalsCusNcb(ByVal ID As String)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM V_ANNALS_CUS_NCB WHERE ID=@ID"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@ID", ID)

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

	Public Function bindingVAnnalsCusNcb(ByVal reader as SqlDataReader) As VAnnalsCusNcb

		Dim objVAnnalsCusNcb As New VAnnalsCusNcb

		objVAnnalsCusNcb.ID = CType(ConvertUtil.getObjectValue(reader("ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objVAnnalsCusNcb.CIF = CType(ConvertUtil.getObjectValue(reader("CIF"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
		objVAnnalsCusNcb.Cifname = CType(ConvertUtil.getObjectValue(reader("Cifname"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objVAnnalsCusNcb.CUS_NCB_TYPE_ID = CType(ConvertUtil.getObjectValue(reader("CUS_NCB_TYPE_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objVAnnalsCusNcb.CUS_NCB_TYPE = CType(ConvertUtil.getObjectValue(reader("CUS_NCB_TYPE"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objVAnnalsCusNcb.CUS_NCB_TYPE_DETAIL_ID = CType(ConvertUtil.getObjectValue(reader("CUS_NCB_TYPE_DETAIL_ID"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
		objVAnnalsCusNcb.CUS_NCB_TYPE_DETAIL = CType(ConvertUtil.getObjectValue(reader("CUS_NCB_TYPE_DETAIL"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objVAnnalsCusNcb.CUS_NCB_DATE = CType(ConvertUtil.getObjectValue(reader("CUS_NCB_DATE"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objVAnnalsCusNcb.DETAIL = CType(ConvertUtil.getObjectValue(reader("DETAIL"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objVAnnalsCusNcb.DEPT_ID = CType(ConvertUtil.getObjectValue(reader("DEPT_ID"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
		objVAnnalsCusNcb.DEPT = CType(ConvertUtil.getObjectValue(reader("DEPT"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objVAnnalsCusNcb.CUS_TYPE_ID = CType(ConvertUtil.getObjectValue(reader("CUS_TYPE_ID"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
		objVAnnalsCusNcb.CUS_TYPE = CType(ConvertUtil.getObjectValue(reader("CUS_TYPE"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objVAnnalsCusNcb.AUTH_1_ID = CType(ConvertUtil.getObjectValue(reader("AUTH_1_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objVAnnalsCusNcb.AUTH_1_NAME = CType(ConvertUtil.getObjectValue(reader("AUTH_1_NAME"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objVAnnalsCusNcb.AUTH_2_ID = CType(ConvertUtil.getObjectValue(reader("AUTH_2_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objVAnnalsCusNcb.AUTH_2_NAME = CType(ConvertUtil.getObjectValue(reader("AUTH_2_NAME"), ConvertUtil.ObjectValueEnum.StringValue), String)

		Return objVAnnalsCusNcb

	End Function

End Class
