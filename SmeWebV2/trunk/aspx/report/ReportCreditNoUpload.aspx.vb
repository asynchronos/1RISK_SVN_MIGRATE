' ทดสอบการส่งข้อมูลด้วย json ในรูปแบบของ array
Imports System.Web.Services
Imports System.Web
Imports System.Data
Imports System.Data.SqlClient

Partial Class aspx_report_ReportCreditNoUpload
    Inherits System.Web.UI.Page
    <System.Web.Script.Services.ScriptMethod()> _
       <System.Web.Services.WebMethod()> _
   Public Shared Function searchNoUpload(ByVal selectAuth As String, _
                                         ByVal sortOrder As String) As String

        'Dim PassDay As String = PassDay
        If selectAuth = "s" Then selectAuth = "สินเชื่อในอำนาจบุคคล"
        If selectAuth = "m" Then selectAuth = "สินเชื่อในอำนาจคณะกรรมการ กสช."
        Dim SqlDataSource1 As New SqlDataSource
        SqlDataSource1.ConnectionString = ConfigurationManager.ConnectionStrings("Bay01ConnectionString").ToString
        SqlDataSource1.SelectParameters.Clear()
        Dim parameter1 = New Parameter("APPTYPE", TypeCode.String, selectAuth)
        SqlDataSource1.SelectParameters.Add(parameter1)
        Dim parameter2 = New Parameter("SORTORDER", TypeCode.Int16, sortOrder)
        SqlDataSource1.SelectParameters.Add(parameter2)


        SqlDataSource1.SelectCommand = "REPORT_CREDIT_NO_UPLOAD"
        SqlDataSource1.SelectCommandType = SqlDataSourceCommandType.StoredProcedure
        Dim dv As New Data.DataView
        dv = CType(SqlDataSource1.Select(DataSourceSelectArguments.Empty), Data.DataView)

        ' แปลง dataview ให้ส่งค่าเป็น string json  ในรูปแบบ array {"data":[{'a':'value','b':'value'},{'c':'value,d:value'}]}

        Dim result As New StringBuilder()
        If Not dv Is Nothing Then
            result.Append("{""data"" : [")
            For ro As Integer = 0 To dv.Table.Rows.Count - 1
                result.Append("{")
                For col As Integer = 0 To dv.Table.Columns.Count - 1
                    result.Append(" '" & dv.Table.Columns(col).ColumnName & "': '" & dv.Table.Rows(ro)(col) & "'")
                    '  result = result & "'" & dv.Table.Rows(ro)(col) & "'"  ' ส่งแต่ data ไม่ส่ง column
                    If col < dv.Table.Columns.Count - 1 Then
                        result.Append(",")
                    End If
                Next
                result.Append("}")
                If ro < dv.Table.Rows.Count - 1 Then
                    result.Append(",")
                End If
            Next
            result.Append("]}")
        End If
        'MsgBox(result.ToString())
        Dim output As String
        output = result.ToString()
        Return output

    End Function
    <System.Web.Script.Services.ScriptMethod()> _
       <System.Web.Services.WebMethod()> _
   Public Shared Function updateStatusNoUpload(ByVal ID As String, ByVal ACTION As String) As String
        Dim result As String = ""


        Dim cnn As New SqlConnection
        cnn.ConnectionString = ConfigurationManager.ConnectionStrings("Bay01ConnectionString").ToString
        Dim UpdateCommand As SqlCommand = New SqlCommand()
        UpdateCommand.Connection = cnn
        Dim sql As String = "REPORT_CREDIT_NO_UPLOAD_UPDATE_STATUS"
        UpdateCommand.CommandType = CommandType.StoredProcedure
        UpdateCommand.CommandText = sql
        UpdateCommand.Parameters.Add("@ID", SqlDbType.NVarChar, 10).Value = ID
        UpdateCommand.Parameters.Add("@ACTION", SqlDbType.NVarChar, 5).Value = ACTION
        Try
            cnn.Open()
            UpdateCommand.ExecuteNonQuery()
            result = "1"
        Catch ex As Exception
            result = ex.Message
        Finally
            cnn.Close()
        End Try
        Return result
    End Function
End Class
