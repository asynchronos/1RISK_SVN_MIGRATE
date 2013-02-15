Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class CustomerInfoDAL

	Private Shared className As String = "CustomerInfoDAL"

	Public Function getCustomerInfoByCIF(ByVal objCustomerInfo As CustomerInfo) As CustomerInfo

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New CustomerInfo()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "CIF, Cifname, CifType, BOTID, " _
				& "CUS_TYPE, BUSI_TYPE, Busi_name, CLASS, " _
				& "IDCARD, OFFICR_ID, DEPTFLAG, DEPTTRAN, " _
				& "DepartName, CARDTYPE, CARDNO " _
				& "FROM CUSTOMER_INFO " _
				& "WHERE CIF=@CIF " _
				& "ORDER BY CIF"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@CIF", objCustomerInfo.CIF)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingCustomerInfo(reader)
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

	Public Function getCustomerInfoByCIF(ByVal CIF As Integer) As CustomerInfo

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New CustomerInfo()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "CIF, Cifname, CifType, BOTID, " _
				& "CUS_TYPE, BUSI_TYPE, Busi_name, CLASS, " _
				& "IDCARD, OFFICR_ID, DEPTFLAG, DEPTTRAN, " _
				& "DepartName, CARDTYPE, CARDNO " _
				& "FROM CUSTOMER_INFO " _
				& "WHERE CIF=@CIF " _
				& "ORDER BY CIF"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@CIF", CIF)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingCustomerInfo(reader)
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

    Public Function bindingCustomerInfo(ByVal reader As SqlDataReader) As CustomerInfo

        Dim objCustomerInfo As New CustomerInfo

        objCustomerInfo.CIF = CType(ConvertUtil.getObjectValue(reader("CIF"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objCustomerInfo.Cifname = CType(ConvertUtil.getObjectValue(reader("Cifname"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomerInfo.CifType = CType(ConvertUtil.getObjectValue(reader("CifType"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomerInfo.BOTID = CType(ConvertUtil.getObjectValue(reader("BOTID"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objCustomerInfo.CUS_TYPE = CType(ConvertUtil.getObjectValue(reader("CUS_TYPE"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomerInfo.BUSI_TYPE = CType(ConvertUtil.getObjectValue(reader("BUSI_TYPE"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomerInfo.Busi_name = CType(ConvertUtil.getObjectValue(reader("Busi_name"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomerInfo.CCLASS = CType(ConvertUtil.getObjectValue(reader("CLASS"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomerInfo.IDCARD = CType(ConvertUtil.getObjectValue(reader("IDCARD"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomerInfo.OFFICR_ID = CType(ConvertUtil.getObjectValue(reader("OFFICR_ID"), ConvertUtil.ObjectValueEnum.NumbericValue), Single)
        objCustomerInfo.DEPTFLAG = CType(ConvertUtil.getObjectValue(reader("DEPTFLAG"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objCustomerInfo.DEPTTRAN = CType(ConvertUtil.getObjectValue(reader("DEPTTRAN"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objCustomerInfo.DepartName = CType(ConvertUtil.getObjectValue(reader("DepartName"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomerInfo.CARDTYPE = CType(ConvertUtil.getObjectValue(reader("CARDTYPE"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomerInfo.CARDNO = CType(ConvertUtil.getObjectValue(reader("CARDNO"), ConvertUtil.ObjectValueEnum.StringValue), String)

        Return objCustomerInfo

    End Function

End Class
