Imports System.Data
Imports System.Web.UI
Imports System.Data.SqlClient
Imports System.Web.Services
Imports System.Web

Partial Class aspx_report_ReportCreditNoUploadV2
    Inherits System.Web.UI.Page
    Dim CnnString As String = ConfigurationManager.ConnectionStrings("Bay01ConnectionString").ToString
    <System.Web.Script.Services.ScriptMethod()> _
   <System.Web.Services.WebMethod()> _
   Public Shared Function searchNoUpload(ByVal PageNumber As Integer, ByVal MaximumRows As Integer, ByVal selectAuth As String) As String

        'Dim PassDay As String = PassDay
        'Dim selectAuth As String = "s"
        If selectAuth = "s" Then selectAuth = "สินเชื่อในอำนาจบุคคล"
        If selectAuth = "m" Then selectAuth = "สินเชื่อในอำนาจคณะกรรมการ กสช."
        If selectAuth = "" Then selectAuth = "สินเชื่อในอำนาจบุคคล"
        Dim StartRow As Integer = PageNumber + 1
        Dim EndRow As Integer = PageNumber + MaximumRows

        Dim cnn As New SqlConnection
        cnn.ConnectionString = ConfigurationManager.ConnectionStrings("Bay01ConnectionString").ToString
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = cnn

        Dim sql As String = "REPORT_CREDIT_NO_UPLOAD_V2"
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = sql
        cmd.Parameters.AddWithValue("@StartRow", StartRow)
        cmd.Parameters.AddWithValue("@EndRow", EndRow)
        cmd.Parameters.AddWithValue("@selectAuth", selectAuth)

        Dim result As New StringBuilder()
        Try
            cnn.Open()
            cmd.ExecuteNonQuery()
            Dim dr As SqlDataReader = cmd.ExecuteReader()

            ' code เก่าดึงจาก datatable 
            'Dim dt As DataTable = New DataTable()
            'dt.Load(dr)

            'MsgBox(dt.Rows.Count)
            'result.Append("{")
            ''result.Append("""rows"" : " & dt.Rows.Count)
            'result.Append("""data"" : [")
            'For ro As Integer = 0 To dt.Rows.Count - 1
            '    result.Append("{")
            '    For col As Integer = 0 To dt.Columns.Count - 1
            '        'result.Append(" '" & dt.Columns(col).ColumnName & "':'" & dt.Rows(ro)(col) & "'")
            '        result.Append(("""" + dt.Columns(col).ColumnName.ToString() & """:" & """") + dt.Rows(ro)(col).ToString() & """")
            '        '  result = result & "'" & dv.Table.Rows(ro)(col) & "'"  ' ส่งแต่ data ไม่ส่ง column
            '        If col < dt.Columns.Count - 1 Then
            '            result.Append(",")
            '        End If
            '    Next
            '    result.Append("}")
            '    If ro < dt.Rows.Count - 1 Then
            '        result.Append(",")
            '    End If
            'Next

            ' ดึงจาก data reader แทน
            Dim i As Integer = 0
            result.Append("{")
            result.Append("""data"" : [")
            Do While dr.Read()
                result.Append("{")
                For i = 0 To 10
                    result.Append("""" + dr.GetName(i) & """:""" & dr.GetValue(i) & """")
                    result.Append(",")
                Next
                result.Remove(result.Length - 1, 1) ' Remove the last , and }
                result.Append("}")
                result.Append(",")
            Loop
            result.Remove(result.Length - 1, 1) ' Remove the last , and }
            result.Append("],")

            ' เมื่ออ่านจนจบให้ อ่าน data set 2 ที่ส่งมาจาก Store  ซึ่งจะแสดงจำนวน row_count ทั้งหมด  ใช้คำสั่ง NextResult()
            dr.NextResult()
            Dim rowCount As Integer
            If dr.HasRows Then
                Do While dr.Read()
                    rowCount = dr.GetInt32(0)
                Loop
            Else
                rowCount = 0
            End If
            result.Append("""RowCount"":" & rowCount & "}")


        Catch ex As Exception
            result.Append(ex.Message)
        Finally
            cnn.Close()
        End Try
        Return result.ToString

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
