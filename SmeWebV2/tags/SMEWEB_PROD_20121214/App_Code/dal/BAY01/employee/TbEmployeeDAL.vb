Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.Collections.Generic

Public Class TbEmployeeDAL

    Private Shared className As String = "TbEmployeeDAL"
#Region "Custom Code"
    Public Function getTbEmployeeByUsername(ByVal username As String) As TbEmployee

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As TbEmployee = Nothing

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            'Dim sql As String = "SELECT " _
            ' & "EMP_ID, TITLE_CODE, EMPNAME, EMPSURNAME, " _
            ' & "EMPNAME_E, EMPSURNAME_E, EMAIL, IDCARD, " _
            ' & "TAX_NO, ACCNO, ADDRESS, SOI, " _
            ' & "ROAD, LOCALITY, DISTRINCT, PROV_CODE, " _
            ' & "ZIPCODE, TEL_HOME, TEL_MOBILE, TEL_INDOOR, " _
            ' & "DATEOFBIRTH, IMAGENAME, DATEOFSTART, STATUS, " _
            ' & "TEAM_ID, GROUP_HEAD, ROLE, PERMIT, " _
            ' & "USERNAME, PASSWD, UP_DT, Dept, " _
            ' & "Id_Region, Id_Branch, POSITION_CODE, Id_Region_Group, " _
            ' & "Id_Branch_Group, Id_Group_Group, LEVEL_ID " _
            ' & "FROM TB_EMPLOYEE " _
            ' & "WHERE USERNAME=@USERNAME AND PASSWD=@PASSWD " _
            ' & "ORDER BY EMP_ID"

            'Dim sqlCmd As New SqlCommand(sql, conn)
            'sqlCmd.Prepare()

            Dim sqlCmd As New SqlCommand("GetTbEmployeeByUsername", conn)
            sqlCmd.CommandType = CommandType.StoredProcedure

            sqlCmd.Parameters.AddWithValue("@USERNAME", username)
            'sqlCmd.Parameters.AddWithValue("@PASSWD", password)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result = bindingAuthenUser(reader)
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
    Public Function getAllTbEmployeeBySQL(ByVal sql As String) As List(Of TbEmployee)

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New List(Of TbEmployee)

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result.Add(bindingTbEmployee(reader))
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
    Public Sub updateTbEmployee(ByVal objTbEmployee As TbEmployee)

        'declare connection
        Dim conn As SqlConnection = Nothing

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "UPDATE TB_EMPLOYEE SET " _
                & " TITLE_CODE=@TITLE_CODE, " _
                & " EMPNAME=@EMPNAME, " _
                & " EMPSURNAME=@EMPSURNAME, " _
                & " EMPNAME_E=@EMPNAME_E, " _
                & " EMPSURNAME_E=@EMPSURNAME_E, " _
                & " EMAIL=@EMAIL, " _
                & " IDCARD=@IDCARD, " _
                & " TAX_NO=@TAX_NO, " _
                & " ACCNO=@ACCNO, " _
                & " ADDRESS=@ADDRESS, " _
                & " SOI=@SOI, " _
                & " ROAD=@ROAD, " _
                & " LOCALITY=@LOCALITY, " _
                & " DISTRINCT=@DISTRINCT, " _
                & " PROV_CODE=@PROV_CODE, " _
                & " ZIPCODE=@ZIPCODE, " _
                & " TEL_HOME=@TEL_HOME, " _
                & " TEL_MOBILE=@TEL_MOBILE, " _
                & " TEL_INDOOR=@TEL_INDOOR, " _
                & " DATEOFBIRTH=@DATEOFBIRTH, " _
                & " IMAGENAME=@IMAGENAME, " _
                & " DATEOFSTART=@DATEOFSTART, " _
                & " USERNAME=@USERNAME, " _
                & " PASSWD=@PASSWD, " _
                & " UP_DT=getdate(), " _
                & " POSITION_CODE=@POSITION_CODE " _
                & " WHERE EMP_ID=@EMP_ID "

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@EMP_ID", objTbEmployee.EMP_ID)
            sqlCmd.Parameters.AddWithValue("@TITLE_CODE", objTbEmployee.TITLE_CODE)
            sqlCmd.Parameters.AddWithValue("@EMPNAME", objTbEmployee.EMPNAME)
            sqlCmd.Parameters.AddWithValue("@EMPSURNAME", objTbEmployee.EMPSURNAME)
            sqlCmd.Parameters.AddWithValue("@EMPNAME_E", objTbEmployee.EMPNAME_E)
            sqlCmd.Parameters.AddWithValue("@EMPSURNAME_E", objTbEmployee.EMPSURNAME_E)
            sqlCmd.Parameters.AddWithValue("@EMAIL", objTbEmployee.EMAIL)
            sqlCmd.Parameters.AddWithValue("@IDCARD", objTbEmployee.IDCARD)
            sqlCmd.Parameters.AddWithValue("@TAX_NO", objTbEmployee.TAX_NO)
            sqlCmd.Parameters.AddWithValue("@ACCNO", objTbEmployee.ACCNO)
            sqlCmd.Parameters.AddWithValue("@ADDRESS", objTbEmployee.ADDRESS)
            sqlCmd.Parameters.AddWithValue("@SOI", objTbEmployee.SOI)
            sqlCmd.Parameters.AddWithValue("@ROAD", objTbEmployee.ROAD)
            sqlCmd.Parameters.AddWithValue("@LOCALITY", objTbEmployee.LOCALITY)
            sqlCmd.Parameters.AddWithValue("@DISTRINCT", objTbEmployee.DISTRINCT)
            sqlCmd.Parameters.AddWithValue("@PROV_CODE", objTbEmployee.PROV_CODE)
            sqlCmd.Parameters.AddWithValue("@ZIPCODE", objTbEmployee.ZIPCODE)
            sqlCmd.Parameters.AddWithValue("@TEL_HOME", objTbEmployee.TEL_HOME)
            sqlCmd.Parameters.AddWithValue("@TEL_MOBILE", objTbEmployee.TEL_MOBILE)
            sqlCmd.Parameters.AddWithValue("@TEL_INDOOR", objTbEmployee.TEL_INDOOR)
            sqlCmd.Parameters.AddWithValue("@DATEOFBIRTH", objTbEmployee.DATEOFBIRTH)
            sqlCmd.Parameters.AddWithValue("@IMAGENAME", objTbEmployee.IMAGENAME)
            sqlCmd.Parameters.AddWithValue("@DATEOFSTART", objTbEmployee.DATEOFSTART)
            ' sqlCmd.Parameters.AddWithValue("@STATUS", objTbEmployee.STATUS)
            ' sqlCmd.Parameters.AddWithValue("@TEAM_ID", objTbEmployee.TEAM_ID)
            ' sqlCmd.Parameters.AddWithValue("@GROUP_HEAD", objTbEmployee.GROUP_HEAD)
            ' sqlCmd.Parameters.AddWithValue("@ROLE", objTbEmployee.ROLE)
            'sqlCmd.Parameters.AddWithValue("@PERMIT", objTbEmployee.PERMIT)
            sqlCmd.Parameters.AddWithValue("@USERNAME", objTbEmployee.USERNAME)
            sqlCmd.Parameters.AddWithValue("@PASSWD", objTbEmployee.PASSWD)
            '  sqlCmd.Parameters.AddWithValue("@UP_DT", objTbEmployee.UP_DT)
            ' sqlCmd.Parameters.AddWithValue("@Dept", objTbEmployee.Dept)
            ' sqlCmd.Parameters.AddWithValue("@Id_Region", objTbEmployee.Id_Region)
            ' sqlCmd.Parameters.AddWithValue("@Id_Branch", objTbEmployee.Id_Branch)
            sqlCmd.Parameters.AddWithValue("@POSITION_CODE", objTbEmployee.POSITION_CODE)
            ' sqlCmd.Parameters.AddWithValue("@Id_Region_Group", objTbEmployee.Id_Region_Group)
            ' sqlCmd.Parameters.AddWithValue("@Id_Branch_Group", objTbEmployee.Id_Branch_Group)
            ' sqlCmd.Parameters.AddWithValue("@Id_Group_Group", objTbEmployee.Id_Group_Group)
            ' sqlCmd.Parameters.AddWithValue("@LEVEL_ID", objTbEmployee.LEVEL_ID)

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
    Public Function bindingAuthenUser(ByVal reader As SqlDataReader) As TbEmployee

        Dim objTbEmployee As New TbEmployee

        objTbEmployee.EMP_ID = CType(ConvertUtil.getObjectValue(reader("EMP_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objTbEmployee.TITLE_CODE = CType(ConvertUtil.getObjectValue(reader("TITLE_CODE"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objTbEmployee.EMPNAME = CType(ConvertUtil.getObjectValue(reader("EMPNAME"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objTbEmployee.EMPSURNAME = CType(ConvertUtil.getObjectValue(reader("EMPSURNAME"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objTbEmployee.EMPNAME_E = CType(ConvertUtil.getObjectValue(reader("EMPNAME_E"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objTbEmployee.EMPSURNAME_E = CType(ConvertUtil.getObjectValue(reader("EMPSURNAME_E"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objTbEmployee.USERNAME = CType(ConvertUtil.getObjectValue(reader("USERNAME"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objTbEmployee.PASSWD = CType(ConvertUtil.getObjectValue(reader("PASSWD"), ConvertUtil.ObjectValueEnum.StringValue), String)

        Return objTbEmployee

    End Function
    Public Function getListTbEmployeeByLeadLevel_ID(ByVal Level_id As Integer) As List(Of TbEmployee)

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New List(Of TbEmployee)

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT  E.EMP_ID,TITLE_CODE, EMPNAME, EMPSURNAME, " _
             & "EMPNAME_E, EMPSURNAME_E, EMAIL, IDCARD, " _
             & "TAX_NO, ACCNO, ADDRESS, SOI, " _
             & "ROAD, LOCALITY, DISTRINCT, PROV_CODE, " _
             & "ZIPCODE, TEL_HOME, TEL_MOBILE, TEL_INDOOR, " _
             & "DATEOFBIRTH, IMAGENAME, DATEOFSTART, STATUS, " _
             & "TEAM_ID, GROUP_HEAD, ROLE, PERMIT, " _
             & "USERNAME, PASSWD, UP_DT, Dept, " _
             & "Id_Region, Id_Branch, POSITION_CODE, Id_Region_Group, " _
             & "Id_Branch_Group, Id_Group_Group, E.LEVEL_ID " _
             & "FROM TB_EMPLOYEE AS E INNER JOIN TB_LEAD AS L ON L.EMP_ID = E.EMP_ID " _
             & "WHERE L.LEVEL_ID=@LEVEL_ID " _
             & "ORDER BY EMP_ID"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@LEVEL_ID", Level_id)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result.Add(bindingTbEmployee(reader))
            End While

            reader.Close()
        Catch ex As Exception
            Throw New Exception(ex.Message & " : " & ex.StackTrace)
        Finally
            'close connction & set to Nothing
            Try
                conn.Close()
            Catch ignore As Exception

            End Try
            conn = Nothing
        End Try

        Return result

    End Function

    Public Function getListEmployeeForDropdown() As List(Of TbEmployee)
        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New List(Of TbEmployee)
        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = Nothing
            sql += "SELECT  EMP_ID,TB_EMPLOYEE.TITLE_CODE, EMPSURNAME, " _
             & "EMPNAME_E, EMPSURNAME_E, EMAIL, IDCARD, " _
             & "TAX_NO, ACCNO, ADDRESS, SOI, " _
             & "ROAD, LOCALITY, DISTRINCT, PROV_CODE, " _
             & "ZIPCODE, TEL_HOME, TEL_MOBILE, TEL_INDOOR, " _
             & "DATEOFBIRTH, IMAGENAME, DATEOFSTART, STATUS, " _
             & "TEAM_ID, GROUP_HEAD, ROLE, PERMIT, " _
             & "USERNAME, PASSWD, UP_DT, Dept, " _
             & "Id_Region, Id_Branch, POSITION_CODE, Id_Region_Group, " _
             & "Id_Branch_Group, Id_Group_Group,LEVEL_ID,"
            sql += " EMP_ID +':'+ TB_TITLE.TITLE_NAME + ' ' + dbo.TB_EMPLOYEE.EMPNAME + '   ' + dbo.TB_EMPLOYEE.EMPSURNAME AS EMPNAME "
            sql += "  FROM    TB_EMPLOYEE INNER JOIN  TB_TITLE "
            sql += "  ON  TB_EMPLOYEE.TITLE_CODE = TB_TITLE.TITLE_CODE  order by EMP_ID"
            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()
            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()
            While reader.Read()
                result.Add(bindingTbEmployee(reader))
            End While
            reader.Close()
        Catch ex As Exception
            Throw New Exception(ex.Message & " : " & ex.StackTrace)
        Finally
            'close connction & set to Nothing
            Try
                conn.Close()
            Catch ignore As Exception

            End Try
            conn = Nothing
        End Try

        Return result
    End Function

#End Region

#Region "GetByPK"
    Public Function getTbEmployeeByEMP_ID(ByVal objTbEmployee As TbEmployee) As TbEmployee
        Return getTbEmployeeByEMP_ID(objTbEmployee.EMP_ID)
    End Function

    Public Function getTbEmployeeByEMP_ID(ByVal EMP_ID As String) As TbEmployee

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As TbEmployee = Nothing

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "EMP_ID, TITLE_CODE, EMPNAME, EMPSURNAME, " _
             & "EMPNAME_E, EMPSURNAME_E, EMAIL, IDCARD, " _
             & "TAX_NO, ACCNO, ADDRESS, SOI, " _
             & "ROAD, LOCALITY, DISTRINCT, PROV_CODE, " _
             & "ZIPCODE, TEL_HOME, TEL_MOBILE, TEL_INDOOR, " _
             & "DATEOFBIRTH, IMAGENAME, DATEOFSTART, STATUS, " _
             & "TEAM_ID, GROUP_HEAD, ROLE, PERMIT, " _
             & "USERNAME, PASSWD, UP_DT, Dept, " _
             & "Id_Region, Id_Branch, POSITION_CODE, Id_Region_Group, " _
             & "Id_Branch_Group, Id_Group_Group, LEVEL_ID " _
             & "FROM TB_EMPLOYEE " _
             & "WHERE EMP_ID=@EMP_ID " _
             & "ORDER BY EMP_ID"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@EMP_ID", EMP_ID)

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result = bindingTbEmployee(reader)
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
#End Region

#Region "GetAll"
    Public Function getAllTbEmployee() As List(Of TbEmployee)

        'declare connection
        Dim conn As SqlConnection = Nothing
        'declare result
        Dim result As New List(Of TbEmployee)

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "SELECT " _
             & "EMP_ID, TITLE_CODE, EMPNAME, EMPSURNAME, " _
             & "EMPNAME_E, EMPSURNAME_E, EMAIL, IDCARD, " _
             & "TAX_NO, ACCNO, ADDRESS, SOI, " _
             & "ROAD, LOCALITY, DISTRINCT, PROV_CODE, " _
             & "ZIPCODE, TEL_HOME, TEL_MOBILE, TEL_INDOOR, " _
             & "DATEOFBIRTH, IMAGENAME, DATEOFSTART, STATUS, " _
             & "TEAM_ID, GROUP_HEAD, ROLE, PERMIT, " _
             & "USERNAME, PASSWD, UP_DT, Dept, " _
             & "Id_Region, Id_Branch, POSITION_CODE, Id_Region_Group, " _
             & "Id_Branch_Group, Id_Group_Group, LEVEL_ID " _
             & "FROM TB_EMPLOYEE " _
             & "ORDER BY EMP_ID"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            Dim reader As SqlDataReader = sqlCmd.ExecuteReader()

            While reader.Read()
                result.Add(bindingTbEmployee(reader))
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
#End Region

#Region "Insert"
    Public Sub insertTbEmployee(ByVal objTbEmployee As TbEmployee)

        'declare connection
        Dim conn As SqlConnection = Nothing

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "INSERT INTO TB_EMPLOYEE " _
                & " (EMP_ID, TITLE_CODE, EMPNAME, EMPSURNAME, EMPNAME_E, EMPSURNAME_E, EMAIL, IDCARD, TAX_NO, ACCNO, ADDRESS, SOI, ROAD, LOCALITY, DISTRINCT, PROV_CODE, ZIPCODE, TEL_HOME, TEL_MOBILE, TEL_INDOOR, DATEOFBIRTH, IMAGENAME, DATEOFSTART, STATUS, TEAM_ID, GROUP_HEAD, ROLE, PERMIT, USERNAME, PASSWD, UP_DT, Dept, Id_Region, Id_Branch, POSITION_CODE, Id_Region_Group, Id_Branch_Group, Id_Group_Group, LEVEL_ID) " _
                & " VALUES(@EMP_ID, @TITLE_CODE, @EMPNAME, @EMPSURNAME, @EMPNAME_E, @EMPSURNAME_E, @EMAIL, @IDCARD, @TAX_NO, @ACCNO, @ADDRESS, @SOI, @ROAD, @LOCALITY, @DISTRINCT, @PROV_CODE, @ZIPCODE, @TEL_HOME, @TEL_MOBILE, @TEL_INDOOR, @DATEOFBIRTH, @IMAGENAME, @DATEOFSTART, @STATUS, @TEAM_ID, @GROUP_HEAD, @ROLE, @PERMIT, @USERNAME, @PASSWD, @UP_DT, @Dept, @Id_Region, @Id_Branch, @POSITION_CODE, @Id_Region_Group, @Id_Branch_Group, @Id_Group_Group, @LEVEL_ID) "

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@EMP_ID", objTbEmployee.EMP_ID)
            sqlCmd.Parameters.AddWithValue("@TITLE_CODE", objTbEmployee.TITLE_CODE)
            sqlCmd.Parameters.AddWithValue("@EMPNAME", objTbEmployee.EMPNAME)
            sqlCmd.Parameters.AddWithValue("@EMPSURNAME", objTbEmployee.EMPSURNAME)
            sqlCmd.Parameters.AddWithValue("@EMPNAME_E", objTbEmployee.EMPNAME_E)
            sqlCmd.Parameters.AddWithValue("@EMPSURNAME_E", objTbEmployee.EMPSURNAME_E)
            sqlCmd.Parameters.AddWithValue("@EMAIL", objTbEmployee.EMAIL)
            sqlCmd.Parameters.AddWithValue("@IDCARD", objTbEmployee.IDCARD)
            sqlCmd.Parameters.AddWithValue("@TAX_NO", objTbEmployee.TAX_NO)
            sqlCmd.Parameters.AddWithValue("@ACCNO", objTbEmployee.ACCNO)
            sqlCmd.Parameters.AddWithValue("@ADDRESS", objTbEmployee.ADDRESS)
            sqlCmd.Parameters.AddWithValue("@SOI", objTbEmployee.SOI)
            sqlCmd.Parameters.AddWithValue("@ROAD", objTbEmployee.ROAD)
            sqlCmd.Parameters.AddWithValue("@LOCALITY", objTbEmployee.LOCALITY)
            sqlCmd.Parameters.AddWithValue("@DISTRINCT", objTbEmployee.DISTRINCT)
            sqlCmd.Parameters.AddWithValue("@PROV_CODE", objTbEmployee.PROV_CODE)
            sqlCmd.Parameters.AddWithValue("@ZIPCODE", objTbEmployee.ZIPCODE)
            sqlCmd.Parameters.AddWithValue("@TEL_HOME", objTbEmployee.TEL_HOME)
            sqlCmd.Parameters.AddWithValue("@TEL_MOBILE", objTbEmployee.TEL_MOBILE)
            sqlCmd.Parameters.AddWithValue("@TEL_INDOOR", objTbEmployee.TEL_INDOOR)
            sqlCmd.Parameters.AddWithValue("@DATEOFBIRTH", objTbEmployee.DATEOFBIRTH)
            sqlCmd.Parameters.AddWithValue("@IMAGENAME", objTbEmployee.IMAGENAME)
            sqlCmd.Parameters.AddWithValue("@DATEOFSTART", objTbEmployee.DATEOFSTART)
            sqlCmd.Parameters.AddWithValue("@STATUS", objTbEmployee.STATUS)
            sqlCmd.Parameters.AddWithValue("@TEAM_ID", objTbEmployee.TEAM_ID)
            sqlCmd.Parameters.AddWithValue("@GROUP_HEAD", objTbEmployee.GROUP_HEAD)
            sqlCmd.Parameters.AddWithValue("@ROLE", objTbEmployee.ROLE)
            sqlCmd.Parameters.AddWithValue("@PERMIT", objTbEmployee.PERMIT)
            sqlCmd.Parameters.AddWithValue("@USERNAME", objTbEmployee.USERNAME)
            sqlCmd.Parameters.AddWithValue("@PASSWD", objTbEmployee.PASSWD)
            sqlCmd.Parameters.AddWithValue("@UP_DT", objTbEmployee.UP_DT)
            sqlCmd.Parameters.AddWithValue("@Dept", objTbEmployee.Dept)
            sqlCmd.Parameters.AddWithValue("@Id_Region", objTbEmployee.Id_Region)
            sqlCmd.Parameters.AddWithValue("@Id_Branch", objTbEmployee.Id_Branch)
            sqlCmd.Parameters.AddWithValue("@POSITION_CODE", objTbEmployee.POSITION_CODE)
            sqlCmd.Parameters.AddWithValue("@Id_Region_Group", objTbEmployee.Id_Region_Group)
            sqlCmd.Parameters.AddWithValue("@Id_Branch_Group", objTbEmployee.Id_Branch_Group)
            sqlCmd.Parameters.AddWithValue("@Id_Group_Group", objTbEmployee.Id_Group_Group)
            sqlCmd.Parameters.AddWithValue("@LEVEL_ID", objTbEmployee.LEVEL_ID)

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
#End Region

#Region "Delete"
    Public Sub deleteTbEmployee(ByVal objTbEmployee As TbEmployee)
        deleteTbEmployee(objTbEmployee.EMP_ID)
    End Sub

    Public Sub deleteTbEmployee(ByVal EMP_ID As String)

        'declare connection
        Dim conn As SqlConnection = Nothing

        Try
            conn = ConnectionUtil.getSqlConnectionFromWebConfig()
            Dim sql As String = "DELETE FROM TB_EMPLOYEE WHERE EMP_ID=@EMP_ID"

            Dim sqlCmd As New SqlCommand(sql, conn)
            sqlCmd.Prepare()

            sqlCmd.Parameters.AddWithValue("@EMP_ID", EMP_ID)

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
#End Region

#Region "Binding"
    Public Function bindingTbEmployee(ByVal reader As SqlDataReader) As TbEmployee

        Dim objTbEmployee As New TbEmployee

        objTbEmployee.EMP_ID = CType(ConvertUtil.getObjectValue(reader("EMP_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objTbEmployee.TITLE_CODE = CType(ConvertUtil.getObjectValue(reader("TITLE_CODE"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objTbEmployee.EMPNAME = CType(ConvertUtil.getObjectValue(reader("EMPNAME"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objTbEmployee.EMPSURNAME = CType(ConvertUtil.getObjectValue(reader("EMPSURNAME"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objTbEmployee.EMPNAME_E = CType(ConvertUtil.getObjectValue(reader("EMPNAME_E"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objTbEmployee.EMPSURNAME_E = CType(ConvertUtil.getObjectValue(reader("EMPSURNAME_E"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objTbEmployee.EMAIL = CType(ConvertUtil.getObjectValue(reader("EMAIL"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objTbEmployee.IDCARD = CType(ConvertUtil.getObjectValue(reader("IDCARD"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objTbEmployee.TAX_NO = CType(ConvertUtil.getObjectValue(reader("TAX_NO"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objTbEmployee.ACCNO = CType(ConvertUtil.getObjectValue(reader("ACCNO"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objTbEmployee.ADDRESS = CType(ConvertUtil.getObjectValue(reader("ADDRESS"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objTbEmployee.SOI = CType(ConvertUtil.getObjectValue(reader("SOI"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objTbEmployee.ROAD = CType(ConvertUtil.getObjectValue(reader("ROAD"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objTbEmployee.LOCALITY = CType(ConvertUtil.getObjectValue(reader("LOCALITY"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objTbEmployee.DISTRINCT = CType(ConvertUtil.getObjectValue(reader("DISTRINCT"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objTbEmployee.PROV_CODE = CType(ConvertUtil.getObjectValue(reader("PROV_CODE"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objTbEmployee.ZIPCODE = CType(ConvertUtil.getObjectValue(reader("ZIPCODE"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objTbEmployee.TEL_HOME = CType(ConvertUtil.getObjectValue(reader("TEL_HOME"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objTbEmployee.TEL_MOBILE = CType(ConvertUtil.getObjectValue(reader("TEL_MOBILE"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objTbEmployee.TEL_INDOOR = CType(ConvertUtil.getObjectValue(reader("TEL_INDOOR"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objTbEmployee.DATEOFBIRTH = CType(ConvertUtil.getObjectValue(reader("DATEOFBIRTH"), ConvertUtil.ObjectValueEnum.DateValue), Date)
        objTbEmployee.IMAGENAME = CType(ConvertUtil.getObjectValue(reader("IMAGENAME"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objTbEmployee.DATEOFSTART = CType(ConvertUtil.getObjectValue(reader("DATEOFSTART"), ConvertUtil.ObjectValueEnum.DateValue), Date)
        objTbEmployee.STATUS = CType(ConvertUtil.getObjectValue(reader("STATUS"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objTbEmployee.TEAM_ID = CType(ConvertUtil.getObjectValue(reader("TEAM_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objTbEmployee.GROUP_HEAD = CType(ConvertUtil.getObjectValue(reader("GROUP_HEAD"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objTbEmployee.ROLE = CType(ConvertUtil.getObjectValue(reader("ROLE"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objTbEmployee.PERMIT = CType(ConvertUtil.getObjectValue(reader("PERMIT"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objTbEmployee.USERNAME = CType(ConvertUtil.getObjectValue(reader("USERNAME"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objTbEmployee.PASSWD = CType(ConvertUtil.getObjectValue(reader("PASSWD"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objTbEmployee.UP_DT = CType(ConvertUtil.getObjectValue(reader("UP_DT"), ConvertUtil.ObjectValueEnum.DateValue), Date)
        objTbEmployee.Dept = CType(ConvertUtil.getObjectValue(reader("Dept"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objTbEmployee.Id_Region = CType(ConvertUtil.getObjectValue(reader("Id_Region"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objTbEmployee.Id_Branch = CType(ConvertUtil.getObjectValue(reader("Id_Branch"), ConvertUtil.ObjectValueEnum.NumbericValue), Integer)
        objTbEmployee.POSITION_CODE = CType(ConvertUtil.getObjectValue(reader("POSITION_CODE"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objTbEmployee.Id_Region_Group = CType(ConvertUtil.getObjectValue(reader("Id_Region_Group"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objTbEmployee.Id_Branch_Group = CType(ConvertUtil.getObjectValue(reader("Id_Branch_Group"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objTbEmployee.Id_Group_Group = CType(ConvertUtil.getObjectValue(reader("Id_Group_Group"), ConvertUtil.ObjectValueEnum.StringValue), String)
        objTbEmployee.LEVEL_ID = CType(ConvertUtil.getObjectValue(reader("LEVEL_ID"), ConvertUtil.ObjectValueEnum.StringValue), String)

        Return objTbEmployee

    End Function

#End Region

End Class