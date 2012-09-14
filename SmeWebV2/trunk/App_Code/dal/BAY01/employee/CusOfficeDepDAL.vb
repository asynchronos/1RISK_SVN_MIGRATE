Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class CusOfficeDepDAL

	Private Shared className As String = "CusOfficeDepDAL"
    Public Function getCusOfficeDepByRisk(ByVal Risk_ID As String) As List(Of CusOfficeDep)
        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New List(Of CusOfficeDep)

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "Cif, Name, ClassE, " _
             & "Class, Principal, Oname, DepTranT, " _
             & "RISK_ID " _
             & "FROM CUS_OFFICE_DEP " _
             & "WHERE risk_id=@risk_id " _
             & "ORDER BY Cif"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@risk_id", Risk_ID)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result.Add(bindingCusOfficeDep(reader))
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
    Public Function getAllCusOfficeDep() As List(Of CusOfficeDep)

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New List(Of CusOfficeDep)

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "Cif, Name, ClassE, " _
             & "Class, Principal, Oname, DepTranT, " _
             & "RISK_ID " _
             & "FROM CUS_OFFICE_DEP " _
             & "ORDER BY Cif"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result.Add(bindingCusOfficeDep(reader))
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
    Public Function getPageCusOfficeDepByRisk(ByVal Risk_ID As String, _
                                              ByVal CurrentPage As Double, _
                                              ByVal PageSizes As Double) As List(Of CusOfficeDep)
        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New List(Of CusOfficeDep)

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String
            sql = " WITH TB_Cust_temp As (SELECT  ROW_NUMBER() OVER(ORDER BY cif ) as 'RowNumber',*  FROM CUS_OFFICE_DEP  "
            sql = sql & " Where risk_id='" & Risk_ID & "'"
            sql = sql & ")"
            sql = sql & ""
            sql = sql & " SELECT * FROM TB_Cust_temp "
            sql = sql & " WHERE RowNumBer BETWEEN (" & CurrentPage & "-1) * " & PageSizes & " + 1 AND " & CurrentPage & " * " & PageSizes
            sql = sql & " and risk_id='" & Risk_ID & "'"
            Dim sqlCmd As New SqlCommand(sql, conn)

            Debug.Print(sql)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@risk_id", Risk_ID)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result.Add(bindingCusOfficeDep(reader))
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
    Public Function getRecordCount(ByVal risk_id As String) As Double

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New List(Of CusOfficeDep)

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT count(*) FROM CUS_OFFICE_DEP "
            sql += " WHERE risk_id='" & risk_id & "'"


            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@risk_id", risk_id)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            If (reader.HasRows) Then
                reader.Read()
                Dim recordcount As Integer = reader.GetInt32(0)
                Return recordcount
            End If

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

    End Function
    Public Function bindingCusOfficeDep(ByVal reader As SqlDataReader) As CusOfficeDep

        Dim objCusOfficeDep As New CusOfficeDep

        objCusOfficeDep.Cif = CType(ConvertUtil.getObjectValue(reader("Cif"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objCusOfficeDep.Name = CType(ConvertUtil.getObjectValue(reader("Name"), ConvertUtil.ObjectValueEnum.StringValue), String)
        'objCusOfficeDep.GECustSize = CType(ConvertUtil.getObjectValue(reader("GECustSize"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCusOfficeDep.ClassE = CType(ConvertUtil.getObjectValue(reader("ClassE"), ConvertUtil.ObjectValueEnum.StringValue), String)
        'objCusOfficeDep.ClassT = CType(ConvertUtil.getObjectValue(reader("Class"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCusOfficeDep.Principal = CType(ConvertUtil.getObjectValue(reader("Principal"), ConvertUtil.ObjectValueEnum.DoubleValue), Double)
        objCusOfficeDep.Oname = CType(ConvertUtil.getObjectValue(reader("Oname"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCusOfficeDep.DepTranT = CType(ConvertUtil.getObjectValue(reader("DepTranT"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objCusOfficeDep.RISK_ID = CType(ConvertUtil.getObjectValue(reader("RISK_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)

        Return objCusOfficeDep

    End Function

End Class
