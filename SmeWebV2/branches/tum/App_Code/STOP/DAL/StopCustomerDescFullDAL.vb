Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class StopCustomerDescFullDAL

	Private Shared className As String = "StopCustomerDescFullDAL"

    Public Function getStopCustomerDescFullByCIF(ByVal objStopCustomerDescFull As StopCustomerDescFull) As StopCustomerDescFull

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New StopCustomerDescFull()

        Try
            conn = StopConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT  *  " _
             & "FROM STOP_CUSTOMER_DESC_FULL " _
             & "WHERE CIF=@CIF " _
             & "ORDER BY PRINCIPAL"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@CIF", objStopCustomerDescFull.CIF)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result = bindingStopCustomerDescFull(reader)
            End While

            reader.Close()
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
    Public Function getStopCustomerDescFullByCIF_SM(ByVal objStopCustomerDescFull As StopCustomerDescFull) As StopCustomerDescFull

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New StopCustomerDescFull()

        Try
            conn = StopConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT  *  " _
             & "FROM STOP_CUSTOMER_DESC_FULL_DUP_SM_G4 " _
             & "WHERE CIF=@CIF " _
             & "ORDER BY PRINCIPAL"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@CIF", objStopCustomerDescFull.CIF)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result = bindingStopCustomerDescFull_SM(reader)
            End While

            reader.Close()
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
    Public Function getStopCustomerDescFullByCIF_SS(ByVal objStopCustomerDescFull As StopCustomerDescFull) As StopCustomerDescFull

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New StopCustomerDescFull()

        Try
            conn = StopConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT  *  " _
             & "FROM STOP_CUSTOMER_DESC_FULL_DUP_SM_NOT_G4 " _
             & "WHERE CIF=@CIF " _
             & "ORDER BY PRINCIPAL"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@CIF", objStopCustomerDescFull.CIF)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result = bindingStopCustomerDescFull_SM(reader)
            End While

            reader.Close()
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
    Public Function getStopCustomerDescFullByCIF(ByVal Cif As Double) As StopCustomerDescFull

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New StopCustomerDescFull()

        Try
            conn = StopConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT  * " _
           & " FROM STOP_CUSTOMER_DESC_FULL " _
             & "WHERE cif=@cif " _
             & "ORDER BY PRINCIPAL"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@cif", Cif)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result = bindingStopCustomerDescFull(reader)
            End While

            reader.Close()
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
    Public Function getAllStopCustomerDescFull() As List(Of StopCustomerDescFull)

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New List(Of StopCustomerDescFull)

        Try
            conn = StopConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT  * " _
           & " FROM STOP_CUSTOMER_DESC_FULL " _
           & "ORDER BY PRINCIPAL"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result.Add(bindingStopCustomerDescFull(reader))
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
    Public Function getAllStopCustomerDescFullBySQL(ByVal sql As String) As List(Of StopCustomerDescFull)

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New List(Of StopCustomerDescFull)

        Try
            conn = StopConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result.Add(bindingStopCustomerDescFull(reader))
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
    Public Function bindingStopCustomerDescFull(ByVal reader As SqlDataReader) As StopCustomerDescFull

        Dim objStopCustomerDescFull As New StopCustomerDescFull

        objStopCustomerDescFull.PRINCIPAL = CType(ConvertUtil.getObjectValue(reader("PRINCIPAL"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objStopCustomerDescFull.ACCRU = CType(ConvertUtil.getObjectValue(reader("ACCRU"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objStopCustomerDescFull.AGING_DPD_C = CType(ConvertUtil.getObjectValue(reader("AGING_DPD_C"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objStopCustomerDescFull.AGING_DPD_O = CType(ConvertUtil.getObjectValue(reader("AGING_DPD_O"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objStopCustomerDescFull.AGING_H = CType(ConvertUtil.getObjectValue(reader("AGING_H"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.HAS_OTHER_CLASS = CType(ConvertUtil.getObjectValue(reader("HAS_OTHER_CLASS"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.CLASS_H = CType(ConvertUtil.getObjectValue(reader("CLASS_H"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.CLASS_H_M = CType(ConvertUtil.getObjectValue(reader("CLASS_H_M"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.IS_TDR = CType(ConvertUtil.getObjectValue(reader("IS_TDR"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.OD_UTILIZE = CType(ConvertUtil.getObjectValue(reader("OD_UTILIZE"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objStopCustomerDescFull.BUSINESS_CIM_FLAG = CType(ConvertUtil.getObjectValue(reader("BUSINESS_CIM_FLAG"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.BUSINESS_CODE = CType(ConvertUtil.getObjectValue(reader("BUSINESS_CODE"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.BUSINESS_DESC = CType(ConvertUtil.getObjectValue(reader("BUSINESS_DESC"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.CIF = CType(ConvertUtil.getObjectValue(reader("CIF"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objStopCustomerDescFull.AGING_DPD_IN = CType(ConvertUtil.getObjectValue(reader("AGING_DPD_IN"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objStopCustomerDescFull.HAS_OTHER_CLASS_IN = CType(ConvertUtil.getObjectValue(reader("HAS_OTHER_CLASS_IN"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.IS_TDR_IN = CType(ConvertUtil.getObjectValue(reader("IS_TDR_IN"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.OD_UTILIZE_IN = CType(ConvertUtil.getObjectValue(reader("OD_UTILIZE_IN"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objStopCustomerDescFull.JUDGEMENT_ID_IN = CType(ConvertUtil.getObjectValue(reader("JUDGEMENT_ID_IN"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.BUSINESS_CIM_FLAG_IN = CType(ConvertUtil.getObjectValue(reader("BUSINESS_CIM_FLAG_IN"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.BUSINESS_CODE_IN = CType(ConvertUtil.getObjectValue(reader("BUSINESS_CODE_IN"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.BUSINESS_DESC_IN = CType(ConvertUtil.getObjectValue(reader("BUSINESS_DESC_IN"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.AGING_CRITERIA_IN = CType(ConvertUtil.getObjectValue(reader("AGING_CRITERIA_IN"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.CLASS_CRITERIA_IN = CType(ConvertUtil.getObjectValue(reader("CLASS_CRITERIA_IN"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.TDR_CRITERIA_IN = CType(ConvertUtil.getObjectValue(reader("TDR_CRITERIA_IN"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.OD_UTILIZE_CRITERIA_IN = CType(ConvertUtil.getObjectValue(reader("OD_UTILIZE_CRITERIA_IN"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.JUDGEMENT_CRITERIA_IN = CType(ConvertUtil.getObjectValue(reader("JUDGEMENT_CRITERIA_IN"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.BUSINESS_CRITERIA_IN = CType(ConvertUtil.getObjectValue(reader("BUSINESS_CRITERIA_IN"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.DATE_IN = CType(ConvertUtil.getObjectValue(reader("DATE_IN"), ConvertUtil.ObjectValueEnum.DateValue), Date)
        objStopCustomerDescFull.UPDATE_ACTION_ID = CType(ConvertUtil.getObjectValue(reader("UPDATE_ACTION_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.UPDATE_ACTION_DATE = CType(ConvertUtil.getObjectValue(reader("UPDATE_ACTION_DATE"), ConvertUtil.ObjectValueEnum.DateValue), Date)
        objStopCustomerDescFull.UPDATE_ACTION_USER = CType(ConvertUtil.getObjectValue(reader("UPDATE_ACTION_USER"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.UPDATE_PAY_ABILITY_ID = CType(ConvertUtil.getObjectValue(reader("UPDATE_PAY_ABILITY_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.UPDATE_DEPT_RESOLVE_ID = CType(ConvertUtil.getObjectValue(reader("UPDATE_DEPT_RESOLVE_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.UPDATE_TDR_DATE = CType(ConvertUtil.getObjectValue(reader("UPDATE_TDR_DATE"), ConvertUtil.ObjectValueEnum.DateValue), Date)
        objStopCustomerDescFull.CONTROLLING_UNIT = CType(ConvertUtil.getObjectValue(reader("CONTROLLING_UNIT"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.REGION_CONTROLLING_UNIT = CType(ConvertUtil.getObjectValue(reader("REGION_CONTROLLING_UNIT"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.CM_CODE = CType(ConvertUtil.getObjectValue(reader("CM_CODE"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.CM_NAME = CType(ConvertUtil.getObjectValue(reader("CM_NAME"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.CUSTOMER_NAME = CType(ConvertUtil.getObjectValue(reader("CUSTOMER_NAME"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.LEVEL_NAME = CType(ConvertUtil.getObjectValue(reader("LEVEL_NAME"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.LEVEL_NAME_2 = CType(ConvertUtil.getObjectValue(reader("LEVEL_NAME_2"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.DEPTFLAG = CType(ConvertUtil.getObjectValue(reader("DEPTFLAG"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objStopCustomerDescFull.DEPTTRAN = CType(ConvertUtil.getObjectValue(reader("DEPTTRAN"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objStopCustomerDescFull.UPDATE_COMMENT = CType(ConvertUtil.getObjectValue(reader("UPDATE_COMMENT"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.UPDATE_PROBLEM = CType(ConvertUtil.getObjectValue(reader("UPDATE_PROBLEM"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.Judgement = CType(ConvertUtil.getObjectValue(reader("Judgement"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.Judgement_in = CType(ConvertUtil.getObjectValue(reader("Judgement_in"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.ACTION_DETAIL = CType(ConvertUtil.getObjectValue(reader("ACTION_DETAIL"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.PAY_ABILITY_DETAIL = CType(ConvertUtil.getObjectValue(reader("PAY_ABILITY_DETAIL"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.DEPT_RESOLVE_DETAIL = CType(ConvertUtil.getObjectValue(reader("DEPT_RESOLVE_DETAIL"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.UPDATE_PAY_DETAIL_ID = CType(ConvertUtil.getObjectValue(reader("UPDATE_PAY_DETAIL_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.SUSP = CType(ConvertUtil.getObjectValue(reader("SUSP"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objStopCustomerDescFull.AGING_DPD = CType(ConvertUtil.getObjectValue(reader("AGING_DPD"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objStopCustomerDescFull.MOVEMENT = CType(ConvertUtil.getObjectValue(reader("MOVEMENT"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objStopCustomerDescFull.JUDGEMENT_ID = CType(ConvertUtil.getObjectValue(reader("JUDGEMENT_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.OD_AS_OF = CType(ConvertUtil.getObjectValue(reader("OD_AS_OF"), ConvertUtil.ObjectValueEnum.DateValue), Date)
        objStopCustomerDescFull.TDR_DATE_REPORT = CType(ConvertUtil.getObjectValue(reader("TDR_DATE_REPORT"), ConvertUtil.ObjectValueEnum.DateValue), Date)
        objStopCustomerDescFull.JUDGEMENT_SNAPDATE = CType(ConvertUtil.getObjectValue(reader("JUDGEMENT_SNAPDATE"), ConvertUtil.ObjectValueEnum.DateValue), Date)
        objStopCustomerDescFull.UPDATE_PREDICT_NPL = CType(ConvertUtil.getObjectValue(reader("UPDATE_PREDICT_NPL"), ConvertUtil.ObjectValueEnum.StringValue), String) ' 27/04/2553

        Return objStopCustomerDescFull

    End Function
    Public Function bindingStopCustomerDescFull_SM(ByVal reader As SqlDataReader) As StopCustomerDescFull

        Dim objStopCustomerDescFull As New StopCustomerDescFull

        objStopCustomerDescFull.PRINCIPAL = CType(ConvertUtil.getObjectValue(reader("PRINCIPAL"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objStopCustomerDescFull.ACCRU = CType(ConvertUtil.getObjectValue(reader("ACCRU"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objStopCustomerDescFull.AGING_DPD_C = CType(ConvertUtil.getObjectValue(reader("AGING_DPD_C"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objStopCustomerDescFull.AGING_DPD_O = CType(ConvertUtil.getObjectValue(reader("AGING_DPD_O"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objStopCustomerDescFull.AGING_H = CType(ConvertUtil.getObjectValue(reader("AGING_H"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.HAS_OTHER_CLASS = CType(ConvertUtil.getObjectValue(reader("HAS_OTHER_CLASS"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.CLASS_H = CType(ConvertUtil.getObjectValue(reader("CLASS_H"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.CLASS_H_M = CType(ConvertUtil.getObjectValue(reader("CLASS_H_M"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.IS_TDR = CType(ConvertUtil.getObjectValue(reader("IS_TDR"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.OD_UTILIZE = CType(ConvertUtil.getObjectValue(reader("OD_UTILIZE"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objStopCustomerDescFull.BUSINESS_CIM_FLAG = CType(ConvertUtil.getObjectValue(reader("BUSINESS_CIM_FLAG"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.BUSINESS_CODE = CType(ConvertUtil.getObjectValue(reader("BUSINESS_CODE"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.BUSINESS_DESC = CType(ConvertUtil.getObjectValue(reader("BUSINESS_DESC"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.CIF = CType(ConvertUtil.getObjectValue(reader("CIF"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objStopCustomerDescFull.AGING_DPD_IN = CType(ConvertUtil.getObjectValue(reader("AGING_DPD_IN"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objStopCustomerDescFull.HAS_OTHER_CLASS_IN = CType(ConvertUtil.getObjectValue(reader("HAS_OTHER_CLASS_IN"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.IS_TDR_IN = CType(ConvertUtil.getObjectValue(reader("IS_TDR_IN"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.OD_UTILIZE_IN = CType(ConvertUtil.getObjectValue(reader("OD_UTILIZE_IN"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objStopCustomerDescFull.JUDGEMENT_ID_IN = CType(ConvertUtil.getObjectValue(reader("JUDGEMENT_ID_IN"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.BUSINESS_CIM_FLAG_IN = CType(ConvertUtil.getObjectValue(reader("BUSINESS_CIM_FLAG_IN"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.BUSINESS_CODE_IN = CType(ConvertUtil.getObjectValue(reader("BUSINESS_CODE_IN"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.BUSINESS_DESC_IN = CType(ConvertUtil.getObjectValue(reader("BUSINESS_DESC_IN"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.AGING_CRITERIA_IN = CType(ConvertUtil.getObjectValue(reader("AGING_CRITERIA_IN"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.CLASS_CRITERIA_IN = CType(ConvertUtil.getObjectValue(reader("CLASS_CRITERIA_IN"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.TDR_CRITERIA_IN = CType(ConvertUtil.getObjectValue(reader("TDR_CRITERIA_IN"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.OD_UTILIZE_CRITERIA_IN = CType(ConvertUtil.getObjectValue(reader("OD_UTILIZE_CRITERIA_IN"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.JUDGEMENT_CRITERIA_IN = CType(ConvertUtil.getObjectValue(reader("JUDGEMENT_CRITERIA_IN"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.BUSINESS_CRITERIA_IN = CType(ConvertUtil.getObjectValue(reader("BUSINESS_CRITERIA_IN"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.DATE_IN = CType(ConvertUtil.getObjectValue(reader("DATE_IN"), ConvertUtil.ObjectValueEnum.DateValue), Date)
        objStopCustomerDescFull.UPDATE_ACTION_ID = CType(ConvertUtil.getObjectValue(reader("UPDATE_ACTION_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.UPDATE_ACTION_DATE = CType(ConvertUtil.getObjectValue(reader("UPDATE_ACTION_DATE"), ConvertUtil.ObjectValueEnum.DateValue), Date)
        objStopCustomerDescFull.UPDATE_ACTION_USER = CType(ConvertUtil.getObjectValue(reader("UPDATE_ACTION_USER"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.UPDATE_PAY_ABILITY_ID = CType(ConvertUtil.getObjectValue(reader("UPDATE_PAY_ABILITY_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.UPDATE_DEPT_RESOLVE_ID = CType(ConvertUtil.getObjectValue(reader("UPDATE_DEPT_RESOLVE_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.UPDATE_TDR_DATE = CType(ConvertUtil.getObjectValue(reader("UPDATE_TDR_DATE"), ConvertUtil.ObjectValueEnum.DateValue), Date)
        objStopCustomerDescFull.CONTROLLING_UNIT = CType(ConvertUtil.getObjectValue(reader("CONTROLLING_UNIT"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.REGION_CONTROLLING_UNIT = CType(ConvertUtil.getObjectValue(reader("REGION_CONTROLLING_UNIT"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.CM_CODE = CType(ConvertUtil.getObjectValue(reader("CM_CODE"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.CM_NAME = CType(ConvertUtil.getObjectValue(reader("CM_NAME"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.CUSTOMER_NAME = CType(ConvertUtil.getObjectValue(reader("CUSTOMER_NAME"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.LEVEL_NAME = CType(ConvertUtil.getObjectValue(reader("LEVEL_NAME"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.LEVEL_NAME_2 = CType(ConvertUtil.getObjectValue(reader("LEVEL_NAME_2"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.DEPTFLAG = CType(ConvertUtil.getObjectValue(reader("DEPTFLAG"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objStopCustomerDescFull.DEPTTRAN = CType(ConvertUtil.getObjectValue(reader("DEPTTRAN"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objStopCustomerDescFull.UPDATE_COMMENT = CType(ConvertUtil.getObjectValue(reader("UPDATE_COMMENT"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.UPDATE_PROBLEM = CType(ConvertUtil.getObjectValue(reader("UPDATE_PROBLEM"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.Judgement = CType(ConvertUtil.getObjectValue(reader("Judgement"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.Judgement_in = CType(ConvertUtil.getObjectValue(reader("Judgement_in"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.ACTION_DETAIL = CType(ConvertUtil.getObjectValue(reader("ACTION_DETAIL"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.PAY_ABILITY_DETAIL = CType(ConvertUtil.getObjectValue(reader("PAY_ABILITY_DETAIL"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.DEPT_RESOLVE_DETAIL = CType(ConvertUtil.getObjectValue(reader("DEPT_RESOLVE_DETAIL"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.UPDATE_PAY_DETAIL_ID = CType(ConvertUtil.getObjectValue(reader("UPDATE_PAY_DETAIL_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.SUSP = CType(ConvertUtil.getObjectValue(reader("SUSP"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objStopCustomerDescFull.AGING_DPD = CType(ConvertUtil.getObjectValue(reader("AGING_DPD"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objStopCustomerDescFull.MOVEMENT = CType(ConvertUtil.getObjectValue(reader("MOVEMENT"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objStopCustomerDescFull.JUDGEMENT_ID = CType(ConvertUtil.getObjectValue(reader("JUDGEMENT_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.ID_StatusG = CType(ConvertUtil.getObjectValue(reader("ID_StatusG"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.StatusG_Thai = CType(ConvertUtil.getObjectValue(reader("StatusG_Thai"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.OD_AS_OF = CType(ConvertUtil.getObjectValue(reader("OD_AS_OF"), ConvertUtil.ObjectValueEnum.DateValue), Date)
        objStopCustomerDescFull.TDR_DATE_REPORT = CType(ConvertUtil.getObjectValue(reader("TDR_DATE_REPORT"), ConvertUtil.ObjectValueEnum.DateValue), Date)
        objStopCustomerDescFull.JUDGEMENT_SNAPDATE = CType(ConvertUtil.getObjectValue(reader("JUDGEMENT_SNAPDATE"), ConvertUtil.ObjectValueEnum.DateValue), Date)
        objStopCustomerDescFull.PAY_STATUS_ID = CType(ConvertUtil.getObjectValue(reader("PAY_STATUS_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.PAY_STATUS_DETAIL = CType(ConvertUtil.getObjectValue(reader("PAY_STATUS_DETAIL"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objStopCustomerDescFull.UPDATE_PREDICT_NPL = CType(ConvertUtil.getObjectValue(reader("UPDATE_PREDICT_NPL"), ConvertUtil.ObjectValueEnum.StringValue), String) ' 27/04/2553


        Return objStopCustomerDescFull

    End Function

End Class
