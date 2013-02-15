Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class TbProvinceDAL

	Private Shared className As String = "TbProvinceDAL"

	Public Function getTbProvinceByPROV_CODE(ByVal objTbProvince As TbProvince) As TbProvince

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New TbProvince()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "PROV_CODE, PROV_NAME, PROV_NAME_E, ZONE_CODE, " _
				& "AREA_CODE " _
				& "FROM TB_PROVINCE " _
				& "WHERE PROV_CODE=@PROV_CODE " _
				& "ORDER BY PROV_CODE"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@PROV_CODE", objTbProvince.PROV_CODE)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingTbProvince(reader)
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

	Public Function getTbProvinceByPROV_CODE(ByVal PROV_CODE As Integer) As TbProvince

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New TbProvince()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "PROV_CODE, PROV_NAME, PROV_NAME_E, ZONE_CODE, " _
				& "AREA_CODE " _
				& "FROM TB_PROVINCE " _
				& "WHERE PROV_CODE=@PROV_CODE " _
				& "ORDER BY PROV_CODE"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@PROV_CODE", PROV_CODE)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingTbProvince(reader)
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

	Public Function getAllTbProvince() As List (Of TbProvince)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of TbProvince)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "PROV_CODE, PROV_NAME, PROV_NAME_E, ZONE_CODE, " _
				& "AREA_CODE " _
				& "FROM TB_PROVINCE " _
				& "ORDER BY PROV_CODE"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingTbProvince(reader))
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

	Public Function getAllTbProvinceBySQL(ByVal sql AS String) As List (Of TbProvince)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of TbProvince)

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingTbProvince(reader))
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

	Public Sub insertTbProvince(ByVal objTbProvince As TbProvince)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "INSERT INTO TB_PROVINCE " _
							& " (PROV_CODE, PROV_NAME, PROV_NAME_E, ZONE_CODE, AREA_CODE) " _
							& " VALUES(@PROV_CODE, @PROV_NAME, @PROV_NAME_E, @ZONE_CODE, @AREA_CODE) "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@PROV_CODE", objTbProvince.PROV_CODE)
			sqlCmd.Parameters.AddWithValue("@PROV_NAME", objTbProvince.PROV_NAME)
			sqlCmd.Parameters.AddWithValue("@PROV_NAME_E", objTbProvince.PROV_NAME_E)
			sqlCmd.Parameters.AddWithValue("@ZONE_CODE", objTbProvince.ZONE_CODE)
			sqlCmd.Parameters.AddWithValue("@AREA_CODE", objTbProvince.AREA_CODE)

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

	Public Sub updateTbProvince(ByVal objTbProvince As TbProvince)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "UPDATE TB_PROVINCE SET " _
							& " PROV_NAME=@PROV_NAME, " _
							& " PROV_NAME_E=@PROV_NAME_E, " _
							& " ZONE_CODE=@ZONE_CODE, " _
							& " AREA_CODE=@AREA_CODE " _
							& " WHERE PROV_CODE=@PROV_CODE "

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@PROV_CODE", objTbProvince.PROV_CODE)
			sqlCmd.Parameters.AddWithValue("@PROV_NAME", objTbProvince.PROV_NAME)
			sqlCmd.Parameters.AddWithValue("@PROV_NAME_E", objTbProvince.PROV_NAME_E)
			sqlCmd.Parameters.AddWithValue("@ZONE_CODE", objTbProvince.ZONE_CODE)
			sqlCmd.Parameters.AddWithValue("@AREA_CODE", objTbProvince.AREA_CODE)

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

	Public Sub deleteTbProvince(ByVal objTbProvince As TbProvince)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM TB_PROVINCE WHERE PROV_CODE=@PROV_CODE"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@PROV_CODE", objTbProvince.PROV_CODE)

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

	Public Sub deleteTbProvince(ByVal PROV_CODE As Integer)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM TB_PROVINCE WHERE PROV_CODE=@PROV_CODE"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@PROV_CODE", PROV_CODE)

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

	Public Function bindingTbProvince(ByVal reader as SqlDataReader) As TbProvince

		Dim objTbProvince As New TbProvince

		objTbProvince.PROV_CODE = CType(ConvertUtil.getObjectValue(reader("PROV_CODE"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
		objTbProvince.PROV_NAME = CType(ConvertUtil.getObjectValue(reader("PROV_NAME"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objTbProvince.PROV_NAME_E = CType(ConvertUtil.getObjectValue(reader("PROV_NAME_E"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objTbProvince.ZONE_CODE = CType(ConvertUtil.getObjectValue(reader("ZONE_CODE"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objTbProvince.AREA_CODE = CType(ConvertUtil.getObjectValue(reader("AREA_CODE"), ConvertUtil.ObjectValueEnum.StringValue), String)

		Return objTbProvince

	End Function

End Class
