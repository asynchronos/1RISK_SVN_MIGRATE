Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Public Class redshirt
    Dim CnnString As String = ConfigurationManager.ConnectionStrings("RedShirtConnectionString").ToString
    Function InsertData( _
     ByVal CIF As Integer, _
     ByVal NAME As String, _
     ByVal NAME_ENG As String, _
     ByVal LIMIT As Integer, _
     ByVal OS As Integer, _
     ByVal ACCOUNT As Integer, _
     ByVal CONTRACT_DATE As Date, _
     ByVal TYPE_OF_HELP As Integer, _
     ByVal APPROVE_DATE As Date, _
    ByVal TYPE_OF_APPROVAL As Integer, _
    ByVal SINGNING_DATE As Date, _
    ByVal AFFECT_TYPE As Integer, _
    ByVal CM As String, _
    ByVal CM_HEAD As String, _
    ByVal CM_GROUP As String, _
    ByVal REMARK As String, _
    ByVal EMP_ID As String) As String

        Dim result As String = ""
        Dim cnn As New SqlConnection
        cnn.ConnectionString = CnnString
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = cnn
        Dim sql As String = "P_REDSHIRT_INSERT"
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = sql
        cmd.Parameters.Add("@CIF", SqlDbType.BigInt).Value = CIF
        cmd.Parameters.Add("@NAME", SqlDbType.NVarChar, 50).Value = NAME
        cmd.Parameters.Add("@NAME_ENG", SqlDbType.NVarChar, 50).Value = NAME_ENG
        cmd.Parameters.Add("@LIMIT", SqlDbType.Money).Value = LIMIT
        cmd.Parameters.Add("@OS", SqlDbType.Money).Value = OS
        cmd.Parameters.Add("@ACCOUNT", SqlDbType.BigInt).Value = ACCOUNT
        cmd.Parameters.Add("@CONTRACT_DATE", SqlDbType.DateTime).Value = CONTRACT_DATE
        cmd.Parameters.Add("@TYPE_OF_HELP", SqlDbType.Int).Value = TYPE_OF_HELP
        cmd.Parameters.Add("@APPROVE_DATE", SqlDbType.DateTime).Value = APPROVE_DATE
        cmd.Parameters.Add("@TYPE_OF_APPROVAL", SqlDbType.Int).Value = TYPE_OF_APPROVAL
        cmd.Parameters.Add("@SINGNING_DATE", SqlDbType.DateTime).Value = SINGNING_DATE
        cmd.Parameters.Add("@CONDITION_DATE", SqlDbType.DateTime).Value = CONTRACT_DATE
        cmd.Parameters.Add("@AFFECT_TYPE", SqlDbType.Int).Value = AFFECT_TYPE
        cmd.Parameters.Add("@CM ", SqlDbType.NVarChar).Value = CM
        cmd.Parameters.Add("@CM_HEAD", SqlDbType.NVarChar).Value = CM_HEAD
        cmd.Parameters.Add("@CM_GROUP", SqlDbType.NVarChar).Value = CM_GROUP
        cmd.Parameters.Add("@REMARK", SqlDbType.NVarChar).Value = REMARK
        cmd.Parameters.Add("@EMP_ID", SqlDbType.NVarChar).Value = EMP_ID
        Try
            cnn.Open()
            cmd.ExecuteNonQuery()
            result = "1"
        Catch ex As Exception
            result = ex.Message
        Finally
            cnn.Close()
        End Try
        Return result
    End Function

    Function updateData( _
        ByVal IDEN As Integer, _
         ByVal CIF As Integer, _
         ByVal LIMIT As String, _
        ByVal TYPE_OF_BUSINESS As Integer, _
        ByVal OTHER_BUSINESS As String, _
        ByVal TYPE_OF_ZONE As Integer, _
        ByVal LOCATION As String, _
         ByVal CONTRACT_DATE As String, _
         ByVal TYPE_OF_HELP As Integer, _
         ByVal APPROVE_DATE As String, _
        ByVal TYPE_OF_APPROVAL As Integer, _
        ByVal SIGNING_DATE As String, _
        ByVal CONDITION_DATE As String, _
        ByVal CUSTOMER_TYPE As String, _
        ByVal CM As String, _
        ByVal CM_HEAD As String, _
        ByVal CM_GROUP As String, _
        ByVal REMARK As String, _
        ByVal EMP_ID As String) As String

        Dim result As String = ""
        Dim cnn As New SqlConnection
        cnn.ConnectionString = CnnString
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = cnn
        Dim sql As String = "P_REDSHIRT_UPDATE"
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = sql
        cmd.Parameters.Add("@CIF", SqlDbType.BigInt).Value = CIF

        If LIMIT = "" Then
            cmd.Parameters.AddWithValue("@LIMIT", System.DBNull.Value)
        Else
            cmd.Parameters.Add("@LIMIT", SqlDbType.Float).Value = CDec(LIMIT)
        End If


        cmd.Parameters.Add("@CM ", SqlDbType.NVarChar).Value = CM
        cmd.Parameters.Add("@CM_HEAD", SqlDbType.NVarChar).Value = CM_HEAD
        cmd.Parameters.Add("@CM_GROUP", SqlDbType.NVarChar).Value = CM_GROUP
        cmd.Parameters.Add("@EMP_ID", SqlDbType.NVarChar).Value = EMP_ID

        cmd.Parameters.AddWithValue("@REMARK", REMARK)

        cmd.Parameters.AddWithValue("@TYPE_OF_APPROVAL", TYPE_OF_APPROVAL)
        cmd.Parameters.AddWithValue("@TYPE_OF_HELP", TYPE_OF_HELP)
        cmd.Parameters.AddWithValue("@CUSTOMER_TYPE", CUSTOMER_TYPE)




        '' *** หาวิธีเช็ค ปี ให้สามารถส่งค่าโดยดูจากระบบด้วย

        'If CONTRACT_DATE = "" Then
        '    cmd.Parameters.Add("@CONTRACT_DATE", SqlDbType.DateTime).Value = System.DBNull.Value
        'Else
        '    If Year(CDate(CONTRACT_DATE)) < 2500 Then CONTRACT_DATE = DateAdd("YYYY", 543, CONTRACT_DATE)
        '    cmd.Parameters.AddWithValue("@CONTRACT_DATE", CDate(CONTRACT_DATE))
        'End If

        'If APPROVE_DATE = "" Then
        '    cmd.Parameters.Add("@APPROVE_DATE", SqlDbType.DateTime).Value = System.DBNull.Value
        'Else
        '    If Year(CDate(APPROVE_DATE)) < 2500 Then CONTRACT_DATE = DateAdd("YYYY", 543, APPROVE_DATE)
        '    cmd.Parameters.Add("@APPROVE_DATE", SqlDbType.DateTime).Value = CDate(APPROVE_DATE)
        'End If

        'If CONDITION_DATE = "" Then
        '    cmd.Parameters.Add("@CONDITION_DATE", SqlDbType.DateTime).Value = System.DBNull.Value
        'Else
        '    If Year(CDate(CONDITION_DATE)) < 2500 Then CONTRACT_DATE = DateAdd("YYYY", 543, CONDITION_DATE)
        '    cmd.Parameters.Add("@CONDITION_DATE", SqlDbType.DateTime).Value = CDate(CONDITION_DATE)
        'End If

        'If SINGNING_DATE = "" Then
        '    cmd.Parameters.Add("@SINGNING_DATE", SqlDbType.DateTime).Value = System.DBNull.Value
        'Else
        '    If Year(CDate(SINGNING_DATE)) < 2500 Then CONTRACT_DATE = DateAdd("YYYY", 543, SINGNING_DATE)
        '    cmd.Parameters.Add("@SINGNING_DATE", SqlDbType.DateTime).Value = CDate(SINGNING_DATE)
        'End If


        cmd.Parameters.AddWithValue("@IDEN", IDEN)

        If TYPE_OF_BUSINESS = 0 Then
            cmd.Parameters.AddWithValue("@TYPE_OF_BUSINESS", System.DBNull.Value)
        Else
            cmd.Parameters.AddWithValue("@TYPE_OF_BUSINESS", TYPE_OF_BUSINESS)
        End If

        If OTHER_BUSINESS = "" Then
            cmd.Parameters.AddWithValue("@OTHER_BUSINESS", System.DBNull.Value)
        Else
            cmd.Parameters.AddWithValue("@OTHER_BUSINESS", OTHER_BUSINESS)
        End If

        If TYPE_OF_ZONE = 0 Then
            cmd.Parameters.AddWithValue("@TYPE_OF_ZONE", System.DBNull.Value)
        Else
            cmd.Parameters.AddWithValue("@TYPE_OF_ZONE", TYPE_OF_ZONE)
        End If

        If LOCATION = "" Then
            cmd.Parameters.AddWithValue("@LOCATION", System.DBNull.Value)
        Else
            cmd.Parameters.AddWithValue("@LOCATION", LOCATION)
        End If


        If CONTRACT_DATE = "" Then
            cmd.Parameters.AddWithValue("@CONTRACT_DATE", System.DBNull.Value)
        Else
            cmd.Parameters.AddWithValue("@CONTRACT_DATE", CONTRACT_DATE)
        End If

        If APPROVE_DATE = "" Then
            cmd.Parameters.AddWithValue("@APPROVE_DATE", System.DBNull.Value)
        Else
            cmd.Parameters.AddWithValue("@APPROVE_DATE", APPROVE_DATE)
        End If

        If CONDITION_DATE = "" Then
            cmd.Parameters.AddWithValue("@CONDITION_DATE", System.DBNull.Value)
        Else
            cmd.Parameters.AddWithValue("@CONDITION_DATE", CONDITION_DATE)
        End If

        If SIGNING_DATE = "" Then
            cmd.Parameters.AddWithValue("@SIGNING_DATE", System.DBNull.Value)
        Else
            cmd.Parameters.AddWithValue("@SIGNING_DATE", SIGNING_DATE)
        End If


        Try
            cnn.Open()
            cmd.ExecuteNonQuery()
            result = "1"
        Catch ex As Exception
            result = ex.Message
        Finally
            cnn.Close()
        End Try
        Return result
        Return "1"
    End Function
    Public Function showData() As String
        Dim result As String = ""
        Dim cnn As New SqlConnection
        cnn.ConnectionString = CnnString
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = cnn
        Dim sql As String = "P_REDSHIRT_SHOW"
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = sql
        Try
            cnn.Open()
            cmd.ExecuteNonQuery()
            Dim dr As SqlDataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection)
            Dim dt As DataTable = New DataTable()
            dt.Load(dr)
            result = GetJson(dt)
        Catch ex As Exception
            result = ex.Message
        Finally
            cnn.Close()
        End Try
        Return result
    End Function
    Public Function showDataByEMP(ByVal EMP_ID As String) As String
        Dim result As String = ""
        Dim cnn As New SqlConnection
        cnn.ConnectionString = CnnString
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = cnn
        Dim sql As String = "P_REDSHIRT_SHOW_BY_EMP"
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = sql
        cmd.Parameters.AddWithValue("@EMP_ID", EMP_ID)
        Try
            cnn.Open()
            cmd.ExecuteNonQuery()
            Dim dr As SqlDataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection)
            Dim dt As DataTable = New DataTable()
            dt.Load(dr)
            result = GetJson(dt)
        Catch ex As Exception
            result = ex.Message
        Finally
            cnn.Close()
        End Try
        Return result
    End Function
    Public Function showDataPaging(ByVal PageNumber As Integer, ByVal MaximumRows As Integer) As String

        Dim StartRow As Integer
        Dim EndRow As Integer

        StartRow = PageNumber + 1
        EndRow = PageNumber + MaximumRows

        
        Dim result As String = ""
        Dim cnn As New SqlConnection
        cnn.ConnectionString = CnnString
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = cnn
        Dim sql As String = "P_REDSHIRT_SHOW_PAGING"
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = sql
        cmd.Parameters.AddWithValue("@StartRow", StartRow)
        cmd.Parameters.AddWithValue("@EndRow", EndRow)

        Try
            cnn.Open()
            cmd.ExecuteNonQuery()
            Dim dr As SqlDataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection)
            Dim dt As DataTable = New DataTable()
            dt.Load(dr)
            result = GetJson(dt)
        Catch ex As Exception
            result = ex.Message
        Finally
            cnn.Close()
        End Try
        Return result
    End Function
    Function deleteData( _
         ByVal IDEN As Integer) As String

        Dim result As String = ""
        Dim cnn As New SqlConnection
        cnn.ConnectionString = CnnString
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = cnn
        Dim sql As String = "P_REDSHIRT_DELETE"
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = sql
        cmd.Parameters.Add("@IDEN", SqlDbType.BigInt).Value = IDEN

        Try
            cnn.Open()
            cmd.ExecuteNonQuery()
            result = "1"
        Catch ex As Exception
            result = ex.Message
        Finally
            cnn.Close()
        End Try
        Return result
    End Function
    Public Function showTypeOfHelp() As String

        Dim result As String = ""
        Dim cnn As New SqlConnection
        cnn.ConnectionString = CnnString
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = cnn
        Dim sql As String = "P_HELP_TYPE_SHOW"
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = sql

        Try
            cnn.Open()
            cmd.ExecuteNonQuery()
            Dim dr As SqlDataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection)
            Dim dt As DataTable = New DataTable()
            dt.Load(dr)
            result = GetJson(dt)
        Catch ex As Exception
            result = ex.Message
        Finally
            cnn.Close()
        End Try
        Return result

    End Function
    Public Function showTypeOfCustomer() As String

        Dim result As String = ""
        Dim cnn As New SqlConnection
        cnn.ConnectionString = CnnString
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = cnn
        Dim sql As String = "P_CUSTOMER_TYPE_SHOW"
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = sql
        Try
            cnn.Open()
            cmd.ExecuteNonQuery()
            Dim dr As SqlDataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection)
            Dim dt As DataTable = New DataTable()
            dt.Load(dr)
            result = GetJson(dt)
        Catch ex As Exception
            result = ex.Message
        Finally
            cnn.Close()
        End Try
        Return result

    End Function
    Public Function showTypeOfBusiness() As String

        Dim result As String = ""
        Dim cnn As New SqlConnection
        cnn.ConnectionString = CnnString
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = cnn
        Dim sql As String = "P_BUSINESS_TYPE_SHOW"
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = sql
        Try
            cnn.Open()
            cmd.ExecuteNonQuery()
            Dim dr As SqlDataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection)
            Dim dt As DataTable = New DataTable()
            dt.Load(dr)
            result = GetJson(dt)
        Catch ex As Exception
            result = ex.Message
        Finally
            cnn.Close()
        End Try
        Return result

    End Function
    Public Function showTypeOfZone() As String

        Dim result As String = ""
        Dim cnn As New SqlConnection
        cnn.ConnectionString = CnnString
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = cnn
        Dim sql As String = "P_ZONE_SHOW"
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = sql
        Try
            cnn.Open()
            cmd.ExecuteNonQuery()
            Dim dr As SqlDataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection)
            Dim dt As DataTable = New DataTable()
            dt.Load(dr)
            result = GetJson(dt)
        Catch ex As Exception
            result = ex.Message
        Finally
            cnn.Close()
        End Try
        Return result

    End Function
    Public Function showCustomerName(ByVal CIF As Integer) As String
        Dim result As String = ""
        Dim cnn As New SqlConnection
        cnn.ConnectionString = CnnString
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = cnn
        Dim sql As String = "P_CUSTOMER_SHOW_NAME"
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = sql
        cmd.Parameters.Add("@CIF", SqlDbType.BigInt).Value = CIF

        Try
            cnn.Open()
            cmd.ExecuteNonQuery()
            Dim dr As SqlDataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection)
            Dim dt As DataTable = New DataTable()
            dt.Load(dr)
            result = GetJson(dt)
        Catch ex As Exception
            result = ex.Message
        Finally
            cnn.Close()
        End Try
        Return result
    End Function
    Public Function showEMP() As String
        Dim result As String = ""
        Dim cnn As New SqlConnection
        cnn.ConnectionString = CnnString
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = cnn
        Dim sql As String = "P_EMPLOYEE_SHOW"
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = sql

        Try
            cnn.Open()
            cmd.ExecuteNonQuery()
            Dim dr As SqlDataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection)
            Dim dt As DataTable = New DataTable()
            dt.Load(dr)
            result = GetJson(dt)
        Catch ex As Exception
            result = ex.Message
        Finally
            cnn.Close()
        End Try
        Return result
    End Function
    Public Function showEMPName(ByVal EMP_ID As String) As String
        Dim result As String = ""
        Dim cnn As New SqlConnection
        cnn.ConnectionString = CnnString
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = cnn
        Dim sql As String = "P_EMPLOYEE_SHOW_NAME"
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = sql
        cmd.Parameters.Add("@EMP_ID", SqlDbType.BigInt).Value = EMP_ID

        Try
            cnn.Open()
            cmd.ExecuteNonQuery()
            Dim dr As SqlDataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection)
            Dim dt As DataTable = New DataTable()
            dt.Load(dr)
            result = GetJson(dt)
        Catch ex As Exception
            result = ex.Message
        Finally
            cnn.Close()
        End Try
        Return result
    End Function
    Public Function showLEVEL() As String
        Dim result As String = ""
        Dim cnn As New SqlConnection
        cnn.ConnectionString = CnnString
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = cnn
        Dim sql As String = "P_LEVEL_SHOW"
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = sql

        Try
            cnn.Open()
            cmd.ExecuteNonQuery()
            Dim dr As SqlDataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection)
            Dim dt As DataTable = New DataTable()
            dt.Load(dr)
            result = GetJson(dt)
        Catch ex As Exception
            result = ex.Message
        Finally
            cnn.Close()
        End Try
        Return result
    End Function
    Public Function GetJson(ByVal dt As DataTable) As String
        Dim result As New StringBuilder()
        Try
            result.Append("{""rows"" : " & dt.Rows.Count)
            result.Append(",""data"" : [")
            For ro As Integer = 0 To dt.Rows.Count - 1
                result.Append("{")
                For col As Integer = 0 To dt.Columns.Count - 1
                    Dim strJson = dt.Columns(col).ColumnName.ToString()
                    'result.Append(" '" & dt.Columns(col).ColumnName & "':'" & dt.Rows(ro)(col) & "'")
                    strJson = strJson.Replace("""", "\""")
                    result.Append(("""" + strJson & """:" & """") + dt.Rows(ro)(col).ToString() & """")
                    '  result = result & "'" & dv.Table.Rows(ro)(col) & "'"  ' ส่งแต่ data ไม่ส่ง column
                    If col < dt.Columns.Count - 1 Then
                        result.Append(",")
                    End If
                Next
                result.Append("}")
                If ro < dt.Rows.Count - 1 Then
                    result.Append(",")
                End If
            Next
            result.Append("]}")
        Catch ex As Exception
            result.Append(ex.Message)
        Finally
        End Try
        Return result.ToString
    End Function
    Public Function GetJsonArray(ByVal dt As DataTable) As String
        Dim result As New StringBuilder()
        Try
            result.Append("{""rows"" : " & dt.Rows.Count)
            result.Append(",""data"" : [")
            For ro As Integer = 0 To dt.Rows.Count - 1
                result.Append("[")
                For col As Integer = 0 To dt.Columns.Count - 1
                    result.Append("'" & dt.Rows(ro)(col) & "'")
                    '  result = result & "'" & dv.Table.Rows(ro)(col) & "'"  ' ส่งแต่ data ไม่ส่ง column
                    If col < dt.Columns.Count - 1 Then
                        result.Append(",")
                    End If
                Next
                result.Append("]")
                If ro < dt.Rows.Count - 1 Then
                    result.Append(",")
                End If
            Next
            result.Append("]}")
        Catch ex As Exception
            result.Append(ex.Message)
        Finally
        End Try
        Return result.ToString
    End Function
End Class
