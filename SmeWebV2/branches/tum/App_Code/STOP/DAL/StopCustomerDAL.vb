Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class StopCustomerDAL

	Private Shared className As String = "StopCustomerDAL"

	Public Function getStopCustomerByCIF(ByVal objStopCustomer As StopCustomer) As StopCustomer

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New StopCustomer()

		Try
            conn = StopConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "CIF, AGING_DPD_IN, AGING_DPD_C_IN, AGING_DPD_O_IN, " _
				& "AGING_H_IN, HAS_OTHER_CLASS_IN, CLASS_H_IN, IS_TDR_IN, " _
				& "OD_UTILIZE_IN, MOVEMENT_IN, JUDGEMENT_ID_IN, BUSINESS_CIM_FLAG_IN, " _
				& "BUSINESS_CODE_IN, BUSINESS_DESC_IN, AGING_CRITERIA_IN, CLASS_CRITERIA_IN, " _
				& "TDR_CRITERIA_IN, OD_UTILIZE_CRITERIA_IN, JUDGEMENT_CRITERIA_IN, BUSINESS_CRITERIA_IN, " _
				& "DATE_IN, UPDATE_ACTION_ID, UPDATE_ACTION_DATE, UPDATE_ACTION_USER, " _
				& "UPDATE_PAY_ABILITY_ID, UPDATE_PAY_DETAIL_ID, UPDATE_DEPT_RESOLVE_ID, UPDATE_TDR_DATE, " _
				& "UPDATE_COMMENT, SEQUENCE " _
				& "FROM STOP_CUSTOMER " _
				& "WHERE CIF=@CIF " _
				& "ORDER BY CIF"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@CIF", objStopCustomer.CIF)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingStopCustomer(reader)
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

	Public Function getStopCustomerByCIF(ByVal CIF As Integer) As StopCustomer

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New StopCustomer()

		Try
            conn = StopConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "CIF, AGING_DPD_IN, AGING_DPD_C_IN, AGING_DPD_O_IN, " _
				& "AGING_H_IN, HAS_OTHER_CLASS_IN, CLASS_H_IN, IS_TDR_IN, " _
				& "OD_UTILIZE_IN, MOVEMENT_IN, JUDGEMENT_ID_IN, BUSINESS_CIM_FLAG_IN, " _
				& "BUSINESS_CODE_IN, BUSINESS_DESC_IN, AGING_CRITERIA_IN, CLASS_CRITERIA_IN, " _
				& "TDR_CRITERIA_IN, OD_UTILIZE_CRITERIA_IN, JUDGEMENT_CRITERIA_IN, BUSINESS_CRITERIA_IN, " _
				& "DATE_IN, UPDATE_ACTION_ID, UPDATE_ACTION_DATE, UPDATE_ACTION_USER, " _
				& "UPDATE_PAY_ABILITY_ID, UPDATE_PAY_DETAIL_ID, UPDATE_DEPT_RESOLVE_ID, UPDATE_TDR_DATE, " _
				& "UPDATE_COMMENT, SEQUENCE " _
				& "FROM STOP_CUSTOMER " _
				& "WHERE CIF=@CIF " _
				& "ORDER BY CIF"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@CIF", CIF)

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result = bindingStopCustomer(reader)
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

	Public Function getAllStopCustomer() As List (Of StopCustomer)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of StopCustomer)

		Try
            conn = StopConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "SELECT " _
				& "CIF, AGING_DPD_IN, AGING_DPD_C_IN, AGING_DPD_O_IN, " _
				& "AGING_H_IN, HAS_OTHER_CLASS_IN, CLASS_H_IN, IS_TDR_IN, " _
				& "OD_UTILIZE_IN, MOVEMENT_IN, JUDGEMENT_ID_IN, BUSINESS_CIM_FLAG_IN, " _
				& "BUSINESS_CODE_IN, BUSINESS_DESC_IN, AGING_CRITERIA_IN, CLASS_CRITERIA_IN, " _
				& "TDR_CRITERIA_IN, OD_UTILIZE_CRITERIA_IN, JUDGEMENT_CRITERIA_IN, BUSINESS_CRITERIA_IN, " _
				& "DATE_IN, UPDATE_ACTION_ID, UPDATE_ACTION_DATE, UPDATE_ACTION_USER, " _
				& "UPDATE_PAY_ABILITY_ID, UPDATE_PAY_DETAIL_ID, UPDATE_DEPT_RESOLVE_ID, UPDATE_TDR_DATE, " _
				& "UPDATE_COMMENT, SEQUENCE " _
				& "FROM STOP_CUSTOMER " _
				& "ORDER BY CIF"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingStopCustomer(reader))
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

	Public Function getAllStopCustomerBySQL(ByVal sql AS String) As List (Of StopCustomer)

		'declare connection
		Dim conn As SqlConnection = Nothing
		'declare result
		Dim result As New List(Of StopCustomer)

		Try
            conn = StopConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

			While reader.Read()
				result.Add(bindingStopCustomer(reader))
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

    'Public Sub insertStopCustomer(ByVal objStopCustomer As StopCustomer)

    '	'declare connection
    '	Dim conn As SqlConnection = Nothing

    '	Try
    '           conn = StopConnectionUtil.getSqlConnectionFromWebConfig()
    '		Dim sql As String = "INSERT INTO STOP_CUSTOMER " _
    '						& " (CIF, AGING_DPD_IN, AGING_DPD_C_IN, AGING_DPD_O_IN, AGING_H_IN, HAS_OTHER_CLASS_IN, CLASS_H_IN, IS_TDR_IN, OD_UTILIZE_IN, MOVEMENT_IN, JUDGEMENT_ID_IN, BUSINESS_CIM_FLAG_IN, BUSINESS_CODE_IN, BUSINESS_DESC_IN, AGING_CRITERIA_IN, CLASS_CRITERIA_IN, TDR_CRITERIA_IN, OD_UTILIZE_CRITERIA_IN, JUDGEMENT_CRITERIA_IN, BUSINESS_CRITERIA_IN, DATE_IN, UPDATE_ACTION_ID, UPDATE_ACTION_DATE, UPDATE_ACTION_USER, UPDATE_PAY_ABILITY_ID, UPDATE_PAY_DETAIL_ID, UPDATE_DEPT_RESOLVE_ID, UPDATE_TDR_DATE, UPDATE_COMMENT, SEQUENCE) " _
    '						& " VALUES(@CIF, @AGING_DPD_IN, @AGING_DPD_C_IN, @AGING_DPD_O_IN, @AGING_H_IN, @HAS_OTHER_CLASS_IN, @CLASS_H_IN, @IS_TDR_IN, @OD_UTILIZE_IN, @MOVEMENT_IN, @JUDGEMENT_ID_IN, @BUSINESS_CIM_FLAG_IN, @BUSINESS_CODE_IN, @BUSINESS_DESC_IN, @AGING_CRITERIA_IN, @CLASS_CRITERIA_IN, @TDR_CRITERIA_IN, @OD_UTILIZE_CRITERIA_IN, @JUDGEMENT_CRITERIA_IN, @BUSINESS_CRITERIA_IN, @DATE_IN, @UPDATE_ACTION_ID, @UPDATE_ACTION_DATE, @UPDATE_ACTION_USER, @UPDATE_PAY_ABILITY_ID, @UPDATE_PAY_DETAIL_ID, @UPDATE_DEPT_RESOLVE_ID, @UPDATE_TDR_DATE, @UPDATE_COMMENT, @SEQUENCE) "

    '		Dim sqlCmd As New SqlCommand(sql, conn)
    '		sqlCmd.Prepare()

    '		sqlCmd.Parameters.AddWithValue("@CIF", objStopCustomer.CIF)
    '		sqlCmd.Parameters.AddWithValue("@AGING_DPD_IN", objStopCustomer.AGING_DPD_IN)
    '		sqlCmd.Parameters.AddWithValue("@AGING_DPD_C_IN", objStopCustomer.AGING_DPD_C_IN)
    '		sqlCmd.Parameters.AddWithValue("@AGING_DPD_O_IN", objStopCustomer.AGING_DPD_O_IN)
    '		sqlCmd.Parameters.AddWithValue("@AGING_H_IN", objStopCustomer.AGING_H_IN)
    '		sqlCmd.Parameters.AddWithValue("@HAS_OTHER_CLASS_IN", objStopCustomer.HAS_OTHER_CLASS_IN)
    '		sqlCmd.Parameters.AddWithValue("@CLASS_H_IN", objStopCustomer.CLASS_H_IN)
    '		sqlCmd.Parameters.AddWithValue("@IS_TDR_IN", objStopCustomer.IS_TDR_IN)
    '		sqlCmd.Parameters.AddWithValue("@OD_UTILIZE_IN", objStopCustomer.OD_UTILIZE_IN)
    '		sqlCmd.Parameters.AddWithValue("@MOVEMENT_IN", objStopCustomer.MOVEMENT_IN)
    '		sqlCmd.Parameters.AddWithValue("@JUDGEMENT_ID_IN", objStopCustomer.JUDGEMENT_ID_IN)
    '		sqlCmd.Parameters.AddWithValue("@BUSINESS_CIM_FLAG_IN", objStopCustomer.BUSINESS_CIM_FLAG_IN)
    '		sqlCmd.Parameters.AddWithValue("@BUSINESS_CODE_IN", objStopCustomer.BUSINESS_CODE_IN)
    '		sqlCmd.Parameters.AddWithValue("@BUSINESS_DESC_IN", objStopCustomer.BUSINESS_DESC_IN)
    '		sqlCmd.Parameters.AddWithValue("@AGING_CRITERIA_IN", objStopCustomer.AGING_CRITERIA_IN)
    '		sqlCmd.Parameters.AddWithValue("@CLASS_CRITERIA_IN", objStopCustomer.CLASS_CRITERIA_IN)
    '		sqlCmd.Parameters.AddWithValue("@TDR_CRITERIA_IN", objStopCustomer.TDR_CRITERIA_IN)
    '		sqlCmd.Parameters.AddWithValue("@OD_UTILIZE_CRITERIA_IN", objStopCustomer.OD_UTILIZE_CRITERIA_IN)
    '		sqlCmd.Parameters.AddWithValue("@JUDGEMENT_CRITERIA_IN", objStopCustomer.JUDGEMENT_CRITERIA_IN)
    '		sqlCmd.Parameters.AddWithValue("@BUSINESS_CRITERIA_IN", objStopCustomer.BUSINESS_CRITERIA_IN)
    '		sqlCmd.Parameters.AddWithValue("@DATE_IN", objStopCustomer.DATE_IN)
    '		sqlCmd.Parameters.AddWithValue("@UPDATE_ACTION_ID", objStopCustomer.UPDATE_ACTION_ID)
    '		sqlCmd.Parameters.AddWithValue("@UPDATE_ACTION_DATE", objStopCustomer.UPDATE_ACTION_DATE)
    '		sqlCmd.Parameters.AddWithValue("@UPDATE_ACTION_USER", objStopCustomer.UPDATE_ACTION_USER)
    '		sqlCmd.Parameters.AddWithValue("@UPDATE_PAY_ABILITY_ID", objStopCustomer.UPDATE_PAY_ABILITY_ID)
    '		sqlCmd.Parameters.AddWithValue("@UPDATE_PAY_DETAIL_ID", objStopCustomer.UPDATE_PAY_DETAIL_ID)
    '		sqlCmd.Parameters.AddWithValue("@UPDATE_DEPT_RESOLVE_ID", objStopCustomer.UPDATE_DEPT_RESOLVE_ID)
    '		sqlCmd.Parameters.AddWithValue("@UPDATE_TDR_DATE", objStopCustomer.UPDATE_TDR_DATE)
    '		sqlCmd.Parameters.AddWithValue("@UPDATE_COMMENT", objStopCustomer.UPDATE_COMMENT)
    '		sqlCmd.Parameters.AddWithValue("@SEQUENCE", objStopCustomer.SEQUENCE)

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

	Public Sub updateStopCustomer(ByVal objStopCustomer As StopCustomer)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
            conn = StopConnectionUtil.getSqlConnectionFromWebConfig()

            Dim sqlCmd As New SqlCommand("S06_UPDATE_STOP_INSERT_ACTION_HISTORY", conn)
            sqlCmd.CommandType = CommandType.StoredProcedure

			sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@CIF", objStopCustomer.CIF)
            sqlCmd.Parameters.AddWithValue("@DATE_IN", objStopCustomer.DATE_IN)
            sqlCmd.Parameters.AddWithValue("@UPDATE_ACTION_ID", objStopCustomer.UPDATE_ACTION_ID)
            sqlCmd.Parameters.AddWithValue("@UPDATE_PAY_ABILITY_ID", objStopCustomer.UPDATE_PAY_ABILITY_ID)
            sqlCmd.Parameters.AddWithValue("@UPDATE_DEPT_RESOLVE_ID", objStopCustomer.UPDATE_DEPT_RESOLVE_ID)
            sqlCmd.Parameters.AddWithValue("@UPDATE_ACTION_USER", objStopCustomer.UPDATE_ACTION_USER)
            sqlCmd.Parameters.AddWithValue("@UPDATE_COMMENT", objStopCustomer.UPDATE_COMMENT)
            sqlCmd.Parameters.AddWithValue("@UPDATE_PROBLEM", objStopCustomer.UPDATE_PROBLEM)  '  เพิ่มวันที่ 11/07/2009  
            sqlCmd.Parameters.AddWithValue("@UPDATE_PREDICT_NPL", objStopCustomer.UPDATE_PREDICT_NPL)  '  เพิ่มวันที่ 27/04/2010  

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

	Public Sub deleteStopCustomer(ByVal objStopCustomer As StopCustomer)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
            conn = StopConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM STOP_CUSTOMER WHERE CIF=@CIF"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@CIF", objStopCustomer.CIF)

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

	Public Sub deleteStopCustomer(ByVal CIF As Integer)

		'declare connection
		Dim conn As SqlConnection = Nothing

		Try
            conn = StopConnectionUtil.getSqlConnectionFromWebConfig()
			Dim sql As String = "DELETE FROM STOP_CUSTOMER WHERE CIF=@CIF"

			Dim sqlCmd As New SqlCommand(sql, conn)
			sqlCmd.Prepare()

			sqlCmd.Parameters.AddWithValue("@CIF", CIF)

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
    Public Sub moveToBMR(ByVal CIF As Integer)

        'declare connection
        Dim conn As SqlConnection = Nothing

        Try
            conn = StopConnectionUtil.getSqlConnectionFromWebConfig()

            Dim sqlCmd As New SqlCommand("S15_MOVE_2_STOP_CUSTOMER_EXCEPTION", conn)
            sqlCmd.CommandType = CommandType.StoredProcedure

            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@CIF", CIF)
            sqlCmd.Parameters.AddWithValue("@COMMENT", "")

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
	Public Function bindingStopCustomer(ByVal reader as SqlDataReader) As StopCustomer

		Dim objStopCustomer As New StopCustomer

		objStopCustomer.CIF = CType(ConvertUtil.getObjectValue(reader("CIF"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
		objStopCustomer.AGING_DPD_IN = CType(ConvertUtil.getObjectValue(reader("AGING_DPD_IN"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
		objStopCustomer.AGING_DPD_C_IN = CType(ConvertUtil.getObjectValue(reader("AGING_DPD_C_IN"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
		objStopCustomer.AGING_DPD_O_IN = CType(ConvertUtil.getObjectValue(reader("AGING_DPD_O_IN"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
		objStopCustomer.AGING_H_IN = CType(ConvertUtil.getObjectValue(reader("AGING_H_IN"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objStopCustomer.HAS_OTHER_CLASS_IN = CType(ConvertUtil.getObjectValue(reader("HAS_OTHER_CLASS_IN"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objStopCustomer.CLASS_H_IN = CType(ConvertUtil.getObjectValue(reader("CLASS_H_IN"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objStopCustomer.IS_TDR_IN = CType(ConvertUtil.getObjectValue(reader("IS_TDR_IN"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objStopCustomer.OD_UTILIZE_IN = CType(ConvertUtil.getObjectValue(reader("OD_UTILIZE_IN"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
		objStopCustomer.MOVEMENT_IN = CType(ConvertUtil.getObjectValue(reader("MOVEMENT_IN"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
		objStopCustomer.JUDGEMENT_ID_IN = CType(ConvertUtil.getObjectValue(reader("JUDGEMENT_ID_IN"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objStopCustomer.BUSINESS_CIM_FLAG_IN = CType(ConvertUtil.getObjectValue(reader("BUSINESS_CIM_FLAG_IN"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objStopCustomer.BUSINESS_CODE_IN = CType(ConvertUtil.getObjectValue(reader("BUSINESS_CODE_IN"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objStopCustomer.BUSINESS_DESC_IN = CType(ConvertUtil.getObjectValue(reader("BUSINESS_DESC_IN"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objStopCustomer.AGING_CRITERIA_IN = CType(ConvertUtil.getObjectValue(reader("AGING_CRITERIA_IN"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objStopCustomer.CLASS_CRITERIA_IN = CType(ConvertUtil.getObjectValue(reader("CLASS_CRITERIA_IN"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objStopCustomer.TDR_CRITERIA_IN = CType(ConvertUtil.getObjectValue(reader("TDR_CRITERIA_IN"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objStopCustomer.OD_UTILIZE_CRITERIA_IN = CType(ConvertUtil.getObjectValue(reader("OD_UTILIZE_CRITERIA_IN"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objStopCustomer.JUDGEMENT_CRITERIA_IN = CType(ConvertUtil.getObjectValue(reader("JUDGEMENT_CRITERIA_IN"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objStopCustomer.BUSINESS_CRITERIA_IN = CType(ConvertUtil.getObjectValue(reader("BUSINESS_CRITERIA_IN"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objStopCustomer.DATE_IN = CType(ConvertUtil.getObjectValue(reader("DATE_IN"), ConvertUtil.ObjectValueEnum.DateValue), Date)
		objStopCustomer.UPDATE_ACTION_ID = CType(ConvertUtil.getObjectValue(reader("UPDATE_ACTION_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objStopCustomer.UPDATE_ACTION_DATE = CType(ConvertUtil.getObjectValue(reader("UPDATE_ACTION_DATE"), ConvertUtil.ObjectValueEnum.DateValue), Date)
		objStopCustomer.UPDATE_ACTION_USER = CType(ConvertUtil.getObjectValue(reader("UPDATE_ACTION_USER"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objStopCustomer.UPDATE_PAY_ABILITY_ID = CType(ConvertUtil.getObjectValue(reader("UPDATE_PAY_ABILITY_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objStopCustomer.UPDATE_PAY_DETAIL_ID = CType(ConvertUtil.getObjectValue(reader("UPDATE_PAY_DETAIL_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objStopCustomer.UPDATE_DEPT_RESOLVE_ID = CType(ConvertUtil.getObjectValue(reader("UPDATE_DEPT_RESOLVE_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
		objStopCustomer.UPDATE_TDR_DATE = CType(ConvertUtil.getObjectValue(reader("UPDATE_TDR_DATE"), ConvertUtil.ObjectValueEnum.DateValue), Date)
        objStopCustomer.UPDATE_COMMENT = CType(ConvertUtil.getObjectValue(reader("UPDATE_COMMENT"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomer.UPDATE_PROBLEM = CType(ConvertUtil.getObjectValue(reader("UPDATE_PROBLEM"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomer.UPDATE_PREDICT_NPL = CType(ConvertUtil.getObjectValue(reader("UPDATE_PREDICT_NPL"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomer.SEQUENCE = CType(ConvertUtil.getObjectValue(reader("SEQUENCE"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)

		Return objStopCustomer

	End Function

End Class
