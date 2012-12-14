Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class CustomerDAL

    Private Shared className As String = "CustomerDAL"
#Region "Insert Tempolary Customer"
    Public Sub insertCustomerTemp(ByVal objCustomer As Customer)

        'declare connection
        Dim conn As SqlConnection = Nothing

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()

            Dim sql As String = "INSERT INTO Customer " _
       & " (CIF, CUS_TITLE, CUS_FIRST, CUS_LAST) " _
       & " VALUES(@CIF, @CUS_TITLE, @CUS_FIRST, @CUS_LAST)"
            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@CIF", objCustomer.CIF)
            sqlCmd.Parameters.AddWithValue("@CUS_TITLE", objCustomer.CUS_TITLE)
            sqlCmd.Parameters.AddWithValue("@CUS_FIRST", objCustomer.CUS_FIRST)
            sqlCmd.Parameters.AddWithValue("@CUS_LAST", objCustomer.CUS_LAST)

            sqlCmd.ExecuteNonQuery()


            Dim sql2 As String = "INSERT INTO CustomerTemp " _
            & " (CIF,Create_date) " _
            & " VALUES(@CIF,getdate())"
            Dim sqlCmd2 As New SqlCommand(sql2, conn)
            sqlCmd2.Prepare()
            sqlCmd2.Parameters.AddWithValue("@CIF", objCustomer.CIF)
            sqlCmd2.ExecuteNonQuery()

        Catch ex As Exception
            Throw New Exception(ex.Message & " : " & ex.StackTrace)
        Finally
            If (conn.State = ConnectionState.Open) Then
                conn.Close()
            End If
            conn = Nothing
        End Try

    End Sub
#End Region
#Region "Custom Code"
    Public Function getCustomerTempByCIF(ByVal objCustomer As Customer) As Customer

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New Customer()

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()

            Dim sql As String = "SELECT " _
             & "C1.CIF, CUS_TITLE, CUS_FIRST, CUS_LAST, " _
             & "CUS1_TITLE, CUS1_FIRST, CUS1_LAST, CUS2_TITLE, " _
             & "CUS2_FIRST, CUS2_LAST, CUS3_TITLE, CUS3_FIRST, " _
             & "CUS3_LAST, CTITLE_E, CFIRST_E, CLAST_E, " _
             & "CifType, BOTID, MAIN_CUST, GROUP_CUST, " _
             & "GROUPCIF, BAYRATING, ADDR1, ADDR2, " _
             & "PROV, ZIPCODE, TEL_HOME, TEL_OFF, " _
             & "TAX_NO, CUS_TYPE, BUSI_TYPE, CLASS, " _
             & "IDCARD, OFFICR_ID, DATEFAS, BEINGCUST, " _
             & "BTHDATE, DEPTFLAG, DEPTTRAN, CIF0, " _
             & "CIF1, CIF2, PROVSHOP, SEX, " _
             & "ADDRWORK1, ADDRWORK2, ZIPSHOP, CARDTYPE, " _
             & "CARDNO " _
             & " FROM Customer as C1 inner join CustomerTemp as C2 on C1.CIF=C2.CIF " _
             & " WHERE C1.CIF=@CIF " _
             & " ORDER BY C1.CIF"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@CIF", objCustomer.CIF)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result = bindingCustomer(reader)
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

#End Region

    Public Function getCustomerByCIF(ByVal objCustomer As Customer) As Customer

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New Customer()

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "CIF, CUS_TITLE, CUS_FIRST, CUS_LAST, " _
             & "CUS1_TITLE, CUS1_FIRST, CUS1_LAST, CUS2_TITLE, " _
             & "CUS2_FIRST, CUS2_LAST, CUS3_TITLE, CUS3_FIRST, " _
             & "CUS3_LAST, CTITLE_E, CFIRST_E, CLAST_E, " _
             & "CifType, BOTID, MAIN_CUST, GROUP_CUST, " _
             & "GROUPCIF, BAYRATING, ADDR1, ADDR2, " _
             & "PROV, ZIPCODE, TEL_HOME, TEL_OFF, " _
             & "TAX_NO, CUS_TYPE, BUSI_TYPE, CLASS, " _
             & "IDCARD, OFFICR_ID, DATEFAS, BEINGCUST, " _
             & "BTHDATE, DEPTFLAG, DEPTTRAN, CIF0, " _
             & "CIF1, CIF2, PROVSHOP, SEX, " _
             & "ADDRWORK1, ADDRWORK2, ZIPSHOP, CARDTYPE, " _
             & "CARDNO " _
             & "FROM Customer " _
             & "WHERE CIF=@CIF " _
             & "ORDER BY CIF"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@CIF", objCustomer.CIF)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result = bindingCustomer(reader)
                'MsgBox(result.CUS1_FIRST + result.CUS_TITLE)
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

    Public Function getCustomerByCIF(ByVal CIF As Integer) As Customer

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New Customer()

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()

            Dim sql As String = "SELECT " _
    & "CIF, CUS_TITLE, CUS_FIRST, CUS_LAST, " _
    & "CUS1_TITLE, CUS1_FIRST, CUS1_LAST, CUS2_TITLE, " _
    & "CUS2_FIRST, CUS2_LAST, CUS3_TITLE, CUS3_FIRST, " _
    & "CUS3_LAST, CTITLE_E, CFIRST_E, CLAST_E, " _
    & "CifType, BOTID, MAIN_CUST, GROUP_CUST, " _
    & "GROUPCIF, BAYRATING, ADDR1, ADDR2, " _
    & "PROV, ZIPCODE, TEL_HOME, TEL_OFF, " _
    & "TAX_NO, CUS_TYPE, BUSI_TYPE, CLASS, " _
    & "IDCARD, OFFICR_ID, DATEFAS, BEINGCUST, " _
    & "BTHDATE, DEPTFLAG, DEPTTRAN, CIF0, " _
    & "CIF1, CIF2, PROVSHOP, SEX, " _
    & "ADDRWORK1, ADDRWORK2, ZIPSHOP, CARDTYPE, " _
    & "CARDNO " _
    & "FROM Customer " _
    & "WHERE CIF=@CIF " _
    & "ORDER BY CIF"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@CIF", CIF)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result = bindingCustomer(reader)
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

    Public Function getAllCustomer() As List(Of Customer)

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New List(Of Customer)

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()

            Dim sql As String = "SELECT " _
    & "CIF, CUS_TITLE, CUS_FIRST, CUS_LAST, " _
    & "CUS1_TITLE, CUS1_FIRST, CUS1_LAST, CUS2_TITLE, " _
    & "CUS2_FIRST, CUS2_LAST, CUS3_TITLE, CUS3_FIRST, " _
    & "CUS3_LAST, CTITLE_E, CFIRST_E, CLAST_E, " _
    & "CifType, BOTID, MAIN_CUST, GROUP_CUST, " _
    & "GROUPCIF, BAYRATING, ADDR1, ADDR2, " _
    & "PROV, ZIPCODE, TEL_HOME, TEL_OFF, " _
    & "TAX_NO, CUS_TYPE, BUSI_TYPE, CLASS, " _
    & "IDCARD, OFFICR_ID, DATEFAS, BEINGCUST, " _
    & "BTHDATE, DEPTFLAG, DEPTTRAN, CIF0, " _
    & "CIF1, CIF2, PROVSHOP, SEX, " _
    & "ADDRWORK1, ADDRWORK2, ZIPSHOP, CARDTYPE, " _
    & "CARDNO " _
    & "FROM Customer " _
    & "ORDER BY CIF"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result.Add(bindingCustomer(reader))
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

    Public Function getAllCustomerBySQL(ByVal sql As String) As List(Of Customer)

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New List(Of Customer)

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result.Add(bindingCustomer(reader))
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

    Public Sub insertCustomer(ByVal objCustomer As Customer)

        'declare connection
        Dim conn As SqlConnection = Nothing

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()

            Dim sql As String = "INSERT INTO Customer " _
       & " (CIF, CUS_TITLE, CUS_FIRST, CUS_LAST, CUS1_TITLE, CUS1_FIRST, CUS1_LAST, CUS2_TITLE, CUS2_FIRST, CUS2_LAST, CUS3_TITLE, CUS3_FIRST, CUS3_LAST, CTITLE_E, CFIRST_E, CLAST_E, CifType, BOTID, MAIN_CUST, GROUP_CUST, GROUPCIF, BAYRATING, ADDR1, ADDR2, PROV, ZIPCODE, TEL_HOME, TEL_OFF, TAX_NO, CUS_TYPE, BUSI_TYPE, CLASS, IDCARD, OFFICR_ID, DATEFAS, BEINGCUST, BTHDATE, DEPTFLAG, DEPTTRAN, CIF0, CIF1, CIF2, PROVSHOP, SEX, ADDRWORK1, ADDRWORK2, ZIPSHOP, CARDTYPE, CARDNO) " _
       & " VALUES(@CIF, @CUS_TITLE, @CUS_FIRST, @CUS_LAST, @CUS1_TITLE, @CUS1_FIRST, @CUS1_LAST, @CUS2_TITLE, @CUS2_FIRST, @CUS2_LAST, @CUS3_TITLE, @CUS3_FIRST, @CUS3_LAST, @CTITLE_E, @CFIRST_E, @CLAST_E, @CifType, @BOTID, @MAIN_CUST, @GROUP_CUST, @GROUPCIF, @BAYRATING, @ADDR1, @ADDR2, @PROV, @ZIPCODE, @TEL_HOME, @TEL_OFF, @TAX_NO, @CUS_TYPE, @BUSI_TYPE, @CLASS, @IDCARD, @OFFICR_ID, @DATEFAS, @BEINGCUST, @BTHDATE, @DEPTFLAG, @DEPTTRAN, @CIF0, @CIF1, @CIF2, @PROVSHOP, @SEX, @ADDRWORK1, @ADDRWORK2, @ZIPSHOP, @CARDTYPE, @CARDNO) "

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@CIF", objCustomer.CIF)
            sqlCmd.Parameters.AddWithValue("@CUS_TITLE", objCustomer.CUS_TITLE)
            sqlCmd.Parameters.AddWithValue("@CUS_FIRST", objCustomer.CUS_FIRST)
            sqlCmd.Parameters.AddWithValue("@CUS_LAST", objCustomer.CUS_LAST)
            sqlCmd.Parameters.AddWithValue("@CUS1_TITLE", objCustomer.CUS1_TITLE)
            sqlCmd.Parameters.AddWithValue("@CUS1_FIRST", objCustomer.CUS1_FIRST)
            sqlCmd.Parameters.AddWithValue("@CUS1_LAST", objCustomer.CUS1_LAST)
            sqlCmd.Parameters.AddWithValue("@CUS2_TITLE", objCustomer.CUS2_TITLE)
            sqlCmd.Parameters.AddWithValue("@CUS2_FIRST", objCustomer.CUS2_FIRST)
            sqlCmd.Parameters.AddWithValue("@CUS2_LAST", objCustomer.CUS2_LAST)
            sqlCmd.Parameters.AddWithValue("@CUS3_TITLE", objCustomer.CUS3_TITLE)
            sqlCmd.Parameters.AddWithValue("@CUS3_FIRST", objCustomer.CUS3_FIRST)
            sqlCmd.Parameters.AddWithValue("@CUS3_LAST", objCustomer.CUS3_LAST)
            sqlCmd.Parameters.AddWithValue("@CTITLE_E", objCustomer.CTITLE_E)
            sqlCmd.Parameters.AddWithValue("@CFIRST_E", objCustomer.CFIRST_E)
            sqlCmd.Parameters.AddWithValue("@CLAST_E", objCustomer.CLAST_E)
            sqlCmd.Parameters.AddWithValue("@CifType", objCustomer.CifType)
            sqlCmd.Parameters.AddWithValue("@BOTID", objCustomer.BOTID)
            sqlCmd.Parameters.AddWithValue("@MAIN_CUST", objCustomer.MAIN_CUST)
            sqlCmd.Parameters.AddWithValue("@GROUP_CUST", objCustomer.GROUP_CUST)
            sqlCmd.Parameters.AddWithValue("@GROUPCIF", objCustomer.GROUPCIF)
            sqlCmd.Parameters.AddWithValue("@BAYRATING", objCustomer.BAYRATING)
            sqlCmd.Parameters.AddWithValue("@ADDR1", objCustomer.ADDR1)
            sqlCmd.Parameters.AddWithValue("@ADDR2", objCustomer.ADDR2)
            sqlCmd.Parameters.AddWithValue("@PROV", objCustomer.PROV)
            sqlCmd.Parameters.AddWithValue("@ZIPCODE", objCustomer.ZIPCODE)
            sqlCmd.Parameters.AddWithValue("@TEL_HOME", objCustomer.TEL_HOME)
            sqlCmd.Parameters.AddWithValue("@TEL_OFF", objCustomer.TEL_OFF)
            sqlCmd.Parameters.AddWithValue("@TAX_NO", objCustomer.TAX_NO)
            sqlCmd.Parameters.AddWithValue("@CUS_TYPE", objCustomer.CUS_TYPE)
            sqlCmd.Parameters.AddWithValue("@BUSI_TYPE", objCustomer.BUSI_TYPE)
            sqlCmd.Parameters.AddWithValue("@CLASS", objCustomer.CLASSES)
            sqlCmd.Parameters.AddWithValue("@IDCARD", objCustomer.IDCARD)
            sqlCmd.Parameters.AddWithValue("@OFFICR_ID", objCustomer.OFFICR_ID)
            sqlCmd.Parameters.AddWithValue("@DATEFAS", objCustomer.DATEFAS)
            sqlCmd.Parameters.AddWithValue("@BEINGCUST", objCustomer.BEINGCUST)
            sqlCmd.Parameters.AddWithValue("@BTHDATE", objCustomer.BTHDATE)
            sqlCmd.Parameters.AddWithValue("@DEPTFLAG", objCustomer.DEPTFLAG)
            sqlCmd.Parameters.AddWithValue("@DEPTTRAN", objCustomer.DEPTTRAN)
            sqlCmd.Parameters.AddWithValue("@CIF0", objCustomer.CIF0)
            sqlCmd.Parameters.AddWithValue("@CIF1", objCustomer.CIF1)
            sqlCmd.Parameters.AddWithValue("@CIF2", objCustomer.CIF2)
            sqlCmd.Parameters.AddWithValue("@PROVSHOP", objCustomer.PROVSHOP)
            sqlCmd.Parameters.AddWithValue("@SEX", objCustomer.SEX)
            sqlCmd.Parameters.AddWithValue("@ADDRWORK1", objCustomer.ADDRWORK1)
            sqlCmd.Parameters.AddWithValue("@ADDRWORK2", objCustomer.ADDRWORK2)
            sqlCmd.Parameters.AddWithValue("@ZIPSHOP", objCustomer.ZIPSHOP)
            sqlCmd.Parameters.AddWithValue("@CARDTYPE", objCustomer.CARDTYPE)
            sqlCmd.Parameters.AddWithValue("@CARDNO", objCustomer.CARDNO)

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

    Public Sub updateCustomer(ByVal objCustomer As Customer)

        'declare connection
        Dim conn As SqlConnection = Nothing

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()

            Dim sql As String = "UPDATE Customer SET " _
       & " CUS_TITLE=@CUS_TITLE, " _
       & " CUS_FIRST=@CUS_FIRST, " _
       & " CUS_LAST=@CUS_LAST  " _
       & " WHERE CIF=@CIF "

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@CIF", objCustomer.CIF)
            sqlCmd.Parameters.AddWithValue("@CUS_TITLE", objCustomer.CUS_TITLE)
            sqlCmd.Parameters.AddWithValue("@CUS_FIRST", objCustomer.CUS_FIRST)
            sqlCmd.Parameters.AddWithValue("@CUS_LAST", objCustomer.CUS_LAST)
            'sqlCmd.Parameters.AddWithValue("@CUS1_TITLE", objCustomer.CUS1_TITLE)
            'sqlCmd.Parameters.AddWithValue("@CUS1_FIRST", objCustomer.CUS1_FIRST)
            'sqlCmd.Parameters.AddWithValue("@CUS1_LAST", objCustomer.CUS1_LAST)
            'sqlCmd.Parameters.AddWithValue("@CUS2_TITLE", objCustomer.CUS2_TITLE)
            'sqlCmd.Parameters.AddWithValue("@CUS2_FIRST", objCustomer.CUS2_FIRST)
            'sqlCmd.Parameters.AddWithValue("@CUS2_LAST", objCustomer.CUS2_LAST)
            'sqlCmd.Parameters.AddWithValue("@CUS3_TITLE", objCustomer.CUS3_TITLE)
            'sqlCmd.Parameters.AddWithValue("@CUS3_FIRST", objCustomer.CUS3_FIRST)
            'sqlCmd.Parameters.AddWithValue("@CUS3_LAST", objCustomer.CUS3_LAST)
            'sqlCmd.Parameters.AddWithValue("@CTITLE_E", objCustomer.CTITLE_E)
            'sqlCmd.Parameters.AddWithValue("@CFIRST_E", objCustomer.CFIRST_E)
            'sqlCmd.Parameters.AddWithValue("@CLAST_E", objCustomer.CLAST_E)
            'sqlCmd.Parameters.AddWithValue("@CifType", objCustomer.CifType)
            'sqlCmd.Parameters.AddWithValue("@BOTID", objCustomer.BOTID)
            'sqlCmd.Parameters.AddWithValue("@MAIN_CUST", objCustomer.MAIN_CUST)
            'sqlCmd.Parameters.AddWithValue("@GROUP_CUST", objCustomer.GROUP_CUST)
            'sqlCmd.Parameters.AddWithValue("@GROUPCIF", objCustomer.GROUPCIF)
            'sqlCmd.Parameters.AddWithValue("@BAYRATING", objCustomer.BAYRATING)
            'sqlCmd.Parameters.AddWithValue("@ADDR1", objCustomer.ADDR1)
            'sqlCmd.Parameters.AddWithValue("@ADDR2", objCustomer.ADDR2)
            'sqlCmd.Parameters.AddWithValue("@PROV", objCustomer.PROV)
            'sqlCmd.Parameters.AddWithValue("@ZIPCODE", objCustomer.ZIPCODE)
            'sqlCmd.Parameters.AddWithValue("@TEL_HOME", objCustomer.TEL_HOME)
            'sqlCmd.Parameters.AddWithValue("@TEL_OFF", objCustomer.TEL_OFF)
            'sqlCmd.Parameters.AddWithValue("@TAX_NO", objCustomer.TAX_NO)
            'sqlCmd.Parameters.AddWithValue("@CUS_TYPE", objCustomer.CUS_TYPE)
            'sqlCmd.Parameters.AddWithValue("@BUSI_TYPE", objCustomer.BUSI_TYPE)
            'sqlCmd.Parameters.AddWithValue("@CLASS", objCustomer.CLASSES)
            'sqlCmd.Parameters.AddWithValue("@IDCARD", objCustomer.IDCARD)
            'sqlCmd.Parameters.AddWithValue("@OFFICR_ID", objCustomer.OFFICR_ID)
            'sqlCmd.Parameters.AddWithValue("@DATEFAS", objCustomer.DATEFAS)
            'sqlCmd.Parameters.AddWithValue("@BEINGCUST", objCustomer.BEINGCUST)
            'sqlCmd.Parameters.AddWithValue("@BTHDATE", objCustomer.BTHDATE)
            'sqlCmd.Parameters.AddWithValue("@DEPTFLAG", objCustomer.DEPTFLAG)
            'sqlCmd.Parameters.AddWithValue("@DEPTTRAN", objCustomer.DEPTTRAN)
            'sqlCmd.Parameters.AddWithValue("@CIF0", objCustomer.CIF0)
            'sqlCmd.Parameters.AddWithValue("@CIF1", objCustomer.CIF1)
            'sqlCmd.Parameters.AddWithValue("@CIF2", objCustomer.CIF2)
            'sqlCmd.Parameters.AddWithValue("@PROVSHOP", objCustomer.PROVSHOP)
            'sqlCmd.Parameters.AddWithValue("@SEX", objCustomer.SEX)
            'sqlCmd.Parameters.AddWithValue("@ADDRWORK1", objCustomer.ADDRWORK1)
            'sqlCmd.Parameters.AddWithValue("@ADDRWORK2", objCustomer.ADDRWORK2)
            'sqlCmd.Parameters.AddWithValue("@ZIPSHOP", objCustomer.ZIPSHOP)
            'sqlCmd.Parameters.AddWithValue("@CARDTYPE", objCustomer.CARDTYPE)
            'sqlCmd.Parameters.AddWithValue("@CARDNO", objCustomer.CARDNO)

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

    Public Sub deleteCustomer(ByVal objCustomer As Customer)

        'declare connection
        Dim conn As SqlConnection = Nothing

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "DELETE FROM Customer WHERE CIF=@CIF"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@CIF", objCustomer.CIF)

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

    Public Sub deleteCustomer(ByVal CIF As Integer)

        'declare connection
        Dim conn As SqlConnection = Nothing

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "DELETE FROM Customer WHERE CIF=@CIF"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@CIF", CIF)

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

    Public Function bindingCustomer(ByVal reader As SqlDataReader) As Customer

        Dim objCustomer As New Customer

        objCustomer.CIF = CType(ConvertUtil.getObjectValue(reader("CIF"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objCustomer.CUS_TITLE = CType(ConvertUtil.getObjectValue(reader("CUS_TITLE"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomer.CUS_FIRST = CType(ConvertUtil.getObjectValue(reader("CUS_FIRST"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomer.CUS_LAST = CType(ConvertUtil.getObjectValue(reader("CUS_LAST"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomer.CUS1_TITLE = CType(ConvertUtil.getObjectValue(reader("CUS1_TITLE"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomer.CUS1_FIRST = CType(ConvertUtil.getObjectValue(reader("CUS1_FIRST"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomer.CUS1_LAST = CType(ConvertUtil.getObjectValue(reader("CUS1_LAST"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomer.CUS2_TITLE = CType(ConvertUtil.getObjectValue(reader("CUS2_TITLE"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomer.CUS2_FIRST = CType(ConvertUtil.getObjectValue(reader("CUS2_FIRST"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomer.CUS2_LAST = CType(ConvertUtil.getObjectValue(reader("CUS2_LAST"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomer.CUS3_TITLE = CType(ConvertUtil.getObjectValue(reader("CUS3_TITLE"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomer.CUS3_FIRST = CType(ConvertUtil.getObjectValue(reader("CUS3_FIRST"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomer.CUS3_LAST = CType(ConvertUtil.getObjectValue(reader("CUS3_LAST"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomer.CTITLE_E = CType(ConvertUtil.getObjectValue(reader("CTITLE_E"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomer.CFIRST_E = CType(ConvertUtil.getObjectValue(reader("CFIRST_E"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomer.CLAST_E = CType(ConvertUtil.getObjectValue(reader("CLAST_E"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomer.CifType = CType(ConvertUtil.getObjectValue(reader("CifType"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomer.BOTID = CType(ConvertUtil.getObjectValue(reader("BOTID"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objCustomer.MAIN_CUST = CType(ConvertUtil.getObjectValue(reader("MAIN_CUST"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objCustomer.GROUP_CUST = CType(ConvertUtil.getObjectValue(reader("GROUP_CUST"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomer.GROUPCIF = CType(ConvertUtil.getObjectValue(reader("GROUPCIF"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objCustomer.BAYRATING = CType(ConvertUtil.getObjectValue(reader("BAYRATING"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomer.ADDR1 = CType(ConvertUtil.getObjectValue(reader("ADDR1"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomer.ADDR2 = CType(ConvertUtil.getObjectValue(reader("ADDR2"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomer.PROV = CType(ConvertUtil.getObjectValue(reader("PROV"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomer.ZIPCODE = CType(ConvertUtil.getObjectValue(reader("ZIPCODE"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objCustomer.TEL_HOME = CType(ConvertUtil.getObjectValue(reader("TEL_HOME"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomer.TEL_OFF = CType(ConvertUtil.getObjectValue(reader("TEL_OFF"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomer.TAX_NO = CType(ConvertUtil.getObjectValue(reader("TAX_NO"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomer.CUS_TYPE = CType(ConvertUtil.getObjectValue(reader("CUS_TYPE"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomer.BUSI_TYPE = CType(ConvertUtil.getObjectValue(reader("BUSI_TYPE"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objCustomer.CLASSES = CType(ConvertUtil.getObjectValue(reader("CLASS"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomer.IDCARD = CType(ConvertUtil.getObjectValue(reader("IDCARD"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomer.OFFICR_ID = CType(ConvertUtil.getObjectValue(reader("OFFICR_ID"), ConvertUtil.ObjectValueEnum.NumbericValue), Single)
        objCustomer.DATEFAS = CType(ConvertUtil.getObjectValue(reader("DATEFAS"), ConvertUtil.ObjectValueEnum.DateValue), Date)
        objCustomer.BEINGCUST = CType(ConvertUtil.getObjectValue(reader("BEINGCUST"), ConvertUtil.ObjectValueEnum.DateValue), Date)
        objCustomer.BTHDATE = CType(ConvertUtil.getObjectValue(reader("BTHDATE"), ConvertUtil.ObjectValueEnum.DateValue), Date)
        objCustomer.DEPTFLAG = CType(ConvertUtil.getObjectValue(reader("DEPTFLAG"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objCustomer.DEPTTRAN = CType(ConvertUtil.getObjectValue(reader("DEPTTRAN"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objCustomer.CIF0 = CType(ConvertUtil.getObjectValue(reader("CIF0"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objCustomer.CIF1 = CType(ConvertUtil.getObjectValue(reader("CIF1"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objCustomer.CIF2 = CType(ConvertUtil.getObjectValue(reader("CIF2"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objCustomer.PROVSHOP = CType(ConvertUtil.getObjectValue(reader("PROVSHOP"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objCustomer.SEX = CType(ConvertUtil.getObjectValue(reader("SEX"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomer.ADDRWORK1 = CType(ConvertUtil.getObjectValue(reader("ADDRWORK1"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomer.ADDRWORK2 = CType(ConvertUtil.getObjectValue(reader("ADDRWORK2"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomer.ZIPSHOP = CType(ConvertUtil.getObjectValue(reader("ZIPSHOP"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objCustomer.CARDTYPE = CType(ConvertUtil.getObjectValue(reader("CARDTYPE"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCustomer.CARDNO = CType(ConvertUtil.getObjectValue(reader("CARDNO"), ConvertUtil.ObjectValueEnum.StringValue), String)

        Return objCustomer

    End Function

End Class