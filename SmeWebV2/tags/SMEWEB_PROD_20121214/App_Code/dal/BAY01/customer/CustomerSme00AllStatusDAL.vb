Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class CustomerSme00AllStatusDAL

	Private Shared className As String = "CustomerSme00AllStatusDAL"

	Public Function getCustomerSme00AllStatusByCIF(ByVal CIF As Integer) As CustomerSme00AllStatus

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New CustomerSme00AllStatus()

		Try
			conn = ConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "CIF, CUSTOMER_NAME, CUSTOMER_NAME2, CUSTOMER_NAME_E, " _
				& "CUSTOMER_NAME_E2, GROUP_ID, CM_CODE, CM_NAME, " _
				& "CM_NAME_E, OLD_CM_CODE, OLD_CM_NAME, OLD_CM_NAME_E, " _
				& "BRANCH_ID, BRANCH_NAME, Id_Region, Region_Name, " _
				& "REGION_NAME2, GROUP_SIZE_ID, GROUP_SIZE_DETAIL, GROUP_EXPOSURE, " _
				& "NEXT_REVIEW_DATE, JUDGEMENT_ID, JUDGEMENT_DETAIL, BUSI_RISK1_ID, " _
				& "BUSI_RISK1_DETAIL, BUSI_RISK2_ID, BUSI_RISK2_DETAIL, BUSI_RISK3_ID, " _
				& "BUSI_RISK3_DETAIL, UPDATE_BY, UPDATE_BY_NAME, UPDATE_DATE, " _
				& "BUSI_TYPE_CIM, DEPTFLAG, DEPTTRAN, OFFICR_ID, " _
				& "OFFICR_NAME, CONTROLLING_UNIT, CONTROLLING_UNIT_E, REGION_CONTROLLING_UNIT, " _
				& "BUSINESS_DESTINATION_ID, BUSINESS_DESTINATION_DESC, EXPORT_WEIGHT, LOCAL_WEIGHT, " _
				& "STATUS_ID, STATUS_DETAIL, SIZE_ID, SIZE_DETAIL, " _
				& "RATING_TYPE_KEY, RATING_KEY, RATING_UPDATE_DATE, OLD_REGION_ID, " _
				& "OLD_REGION_NAME " _
				& "FROM CUSTOMER_SME00_ALL_STATUS " _
				& "WHERE CIF=@CIF " _
				& "ORDER BY CIF"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@CIF", CIF)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingCustomerSme00AllStatus(reader)
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

    Public Function bindingCustomerSme00AllStatus(ByVal reader As SqlDataReader) As CustomerSme00AllStatus

        Dim objCustomerSme00AllStatus As New CustomerSme00AllStatus

        objCustomerSme00AllStatus.CIF = CType(ConvertUtil.getObjectValue(reader("CIF"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objCustomerSme00AllStatus.CUSTOMER_NAME = CType(ConvertUtil.getObjectValue(reader("CUSTOMER_NAME"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomerSme00AllStatus.CUSTOMER_NAME2 = CType(ConvertUtil.getObjectValue(reader("CUSTOMER_NAME2"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomerSme00AllStatus.CUSTOMER_NAME_E = CType(ConvertUtil.getObjectValue(reader("CUSTOMER_NAME_E"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomerSme00AllStatus.CUSTOMER_NAME_E2 = CType(ConvertUtil.getObjectValue(reader("CUSTOMER_NAME_E2"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomerSme00AllStatus.GROUP_ID = CType(ConvertUtil.getObjectValue(reader("GROUP_ID"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objCustomerSme00AllStatus.CM_CODE = CType(ConvertUtil.getObjectValue(reader("CM_CODE"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomerSme00AllStatus.CM_NAME = CType(ConvertUtil.getObjectValue(reader("CM_NAME"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomerSme00AllStatus.CM_NAME_E = CType(ConvertUtil.getObjectValue(reader("CM_NAME_E"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomerSme00AllStatus.OLD_CM_CODE = CType(ConvertUtil.getObjectValue(reader("OLD_CM_CODE"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomerSme00AllStatus.OLD_CM_NAME = CType(ConvertUtil.getObjectValue(reader("OLD_CM_NAME"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomerSme00AllStatus.OLD_CM_NAME_E = CType(ConvertUtil.getObjectValue(reader("OLD_CM_NAME_E"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomerSme00AllStatus.BRANCH_ID = CType(ConvertUtil.getObjectValue(reader("BRANCH_ID"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objCustomerSme00AllStatus.BRANCH_NAME = CType(ConvertUtil.getObjectValue(reader("BRANCH_NAME"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomerSme00AllStatus.Id_Region = CType(ConvertUtil.getObjectValue(reader("Id_Region"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objCustomerSme00AllStatus.Region_Name = CType(ConvertUtil.getObjectValue(reader("Region_Name"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomerSme00AllStatus.REGION_NAME2 = CType(ConvertUtil.getObjectValue(reader("REGION_NAME2"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomerSme00AllStatus.GROUP_SIZE_ID = CType(ConvertUtil.getObjectValue(reader("GROUP_SIZE_ID"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objCustomerSme00AllStatus.GROUP_SIZE_DETAIL = CType(ConvertUtil.getObjectValue(reader("GROUP_SIZE_DETAIL"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomerSme00AllStatus.GROUP_EXPOSURE = CType(ConvertUtil.getObjectValue(reader("GROUP_EXPOSURE"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objCustomerSme00AllStatus.NEXT_REVIEW_DATE = CType(ConvertUtil.getObjectValue(reader("NEXT_REVIEW_DATE"), ConvertUtil.ObjectValueEnum.DateValue), Date)
        objCustomerSme00AllStatus.JUDGEMENT_ID = CType(ConvertUtil.getObjectValue(reader("JUDGEMENT_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomerSme00AllStatus.JUDGEMENT_DETAIL = CType(ConvertUtil.getObjectValue(reader("JUDGEMENT_DETAIL"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomerSme00AllStatus.BUSI_RISK1_ID = CType(ConvertUtil.getObjectValue(reader("BUSI_RISK1_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomerSme00AllStatus.BUSI_RISK1_DETAIL = CType(ConvertUtil.getObjectValue(reader("BUSI_RISK1_DETAIL"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomerSme00AllStatus.BUSI_RISK2_ID = CType(ConvertUtil.getObjectValue(reader("BUSI_RISK2_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomerSme00AllStatus.BUSI_RISK2_DETAIL = CType(ConvertUtil.getObjectValue(reader("BUSI_RISK2_DETAIL"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomerSme00AllStatus.BUSI_RISK3_ID = CType(ConvertUtil.getObjectValue(reader("BUSI_RISK3_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomerSme00AllStatus.BUSI_RISK3_DETAIL = CType(ConvertUtil.getObjectValue(reader("BUSI_RISK3_DETAIL"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomerSme00AllStatus.UPDATE_BY = CType(ConvertUtil.getObjectValue(reader("UPDATE_BY"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomerSme00AllStatus.UPDATE_BY_NAME = CType(ConvertUtil.getObjectValue(reader("UPDATE_BY_NAME"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomerSme00AllStatus.UPDATE_DATE = CType(ConvertUtil.getObjectValue(reader("UPDATE_DATE"), ConvertUtil.ObjectValueEnum.DateValue), Date)
        objCustomerSme00AllStatus.BUSI_TYPE_CIM = CType(ConvertUtil.getObjectValue(reader("BUSI_TYPE_CIM"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomerSme00AllStatus.DEPTFLAG = CType(ConvertUtil.getObjectValue(reader("DEPTFLAG"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objCustomerSme00AllStatus.DEPTTRAN = CType(ConvertUtil.getObjectValue(reader("DEPTTRAN"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objCustomerSme00AllStatus.OFFICR_ID = CType(ConvertUtil.getObjectValue(reader("OFFICR_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomerSme00AllStatus.OFFICR_NAME = CType(ConvertUtil.getObjectValue(reader("OFFICR_NAME"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomerSme00AllStatus.CONTROLLING_UNIT = CType(ConvertUtil.getObjectValue(reader("CONTROLLING_UNIT"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomerSme00AllStatus.CONTROLLING_UNIT_E = CType(ConvertUtil.getObjectValue(reader("CONTROLLING_UNIT_E"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomerSme00AllStatus.REGION_CONTROLLING_UNIT = CType(ConvertUtil.getObjectValue(reader("REGION_CONTROLLING_UNIT"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomerSme00AllStatus.BUSINESS_DESTINATION_ID = CType(ConvertUtil.getObjectValue(reader("BUSINESS_DESTINATION_ID"), ConvertUtil.ObjectValueEnum.DoubleValue), Decimal)
        objCustomerSme00AllStatus.BUSINESS_DESTINATION_DESC = CType(ConvertUtil.getObjectValue(reader("BUSINESS_DESTINATION_DESC"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomerSme00AllStatus.EXPORT_WEIGHT = CType(ConvertUtil.getObjectValue(reader("EXPORT_WEIGHT"), ConvertUtil.ObjectValueEnum.DoubleValue), Decimal)
        objCustomerSme00AllStatus.LOCAL_WEIGHT = CType(ConvertUtil.getObjectValue(reader("LOCAL_WEIGHT"), ConvertUtil.ObjectValueEnum.DoubleValue), Decimal)
        objCustomerSme00AllStatus.STATUS_ID = CType(ConvertUtil.getObjectValue(reader("STATUS_ID"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objCustomerSme00AllStatus.STATUS_DETAIL = CType(ConvertUtil.getObjectValue(reader("STATUS_DETAIL"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomerSme00AllStatus.SIZE_ID = CType(ConvertUtil.getObjectValue(reader("SIZE_ID"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objCustomerSme00AllStatus.SIZE_DETAIL = CType(ConvertUtil.getObjectValue(reader("SIZE_DETAIL"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomerSme00AllStatus.RATING_TYPE_KEY = CType(ConvertUtil.getObjectValue(reader("RATING_TYPE_KEY"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objCustomerSme00AllStatus.RATING_KEY = CType(ConvertUtil.getObjectValue(reader("RATING_KEY"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objCustomerSme00AllStatus.RATING_UPDATE_DATE = CType(ConvertUtil.getObjectValue(reader("RATING_UPDATE_DATE"), ConvertUtil.ObjectValueEnum.DateValue), Date)
        objCustomerSme00AllStatus.OLD_REGION_ID = CType(ConvertUtil.getObjectValue(reader("OLD_REGION_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomerSme00AllStatus.OLD_REGION_NAME = CType(ConvertUtil.getObjectValue(reader("OLD_REGION_NAME"), ConvertUtil.ObjectValueEnum.StringValue), String)

        Return objCustomerSme00AllStatus

    End Function

End Class
