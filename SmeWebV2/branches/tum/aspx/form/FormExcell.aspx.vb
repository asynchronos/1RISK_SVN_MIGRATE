Imports System.Data
Imports System.Data.OleDb
Imports System.Data.SqlClient

Partial Class aspx_form_FormExcell
    Inherits System.Web.UI.Page

    Protected Sub SaveButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles SaveButton.Click
        'declare connection
        Dim conn As SqlConnection = Nothing
        Dim ConnString = ConfigurationManager.ConnectionStrings("MISConnectionString").ToString
        conn = New SqlConnection(ConnString)
        conn.Open()
        Dim sqlCmd As New SqlCommand()
         Dim str1 As String
        Dim strc As String
        If FormIDTextBox.Text = "" Then Exit Sub
        Dim FormID As String = CInt(FormIDTextBox.Text)
        Dim colCount As Integer = 10 ' จำนวน column ใน tb_form_raw
        Try
            For Each gvr As GridViewRow In GridView1.Rows
                strc = ""
                str1 += "INSERT  INTO TB_FORM_RAW  VALUES (" & FormID & ","
                For i = 0 To gvr.Cells.Count - 1
                    strc += "'" & Server.HtmlDecode(gvr.Cells(i).Text) & "'"
                    If i < gvr.Cells.Count - 1 Then
                        strc += ","
                    End If
                Next
                For y = 1 To colCount - gvr.Cells.Count
                    strc += ",''"
                Next
                str1 += strc
                str1 += ");"
            Next
            ' Response.Write(str1)
            sqlCmd.Connection = conn
            sqlCmd.CommandText = str1
            sqlCmd.ExecuteNonQuery()
            sqlCmd.Dispose()
        Catch ex As Exception
            Response.Write("Can 't insert data.")
        End Try
        Response.Write("Create data complete.")
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim DBConnection = New OleDbConnection( _
                "Provider=Microsoft.Jet.OLEDB.4.0;" & _
                "Data Source=" & Server.MapPath("ExcellFile/EMP540316.xls") & ";" & _
                "Extended Properties=""Excel 8.0;HDR=Yes""")
        DBConnection.Open()
        Dim SQLString As String = "SELECT * FROM [Sheet1$]"
        Dim DBCommand = New OleDbCommand(SQLString, DBConnection)
        Dim DBReader As IDataReader = DBCommand.ExecuteReader()
        GridView1.DataSource = DBReader
        GridView1.DataBind()
        DBReader.Close()
        DBConnection.Close()


    End Sub
End Class
