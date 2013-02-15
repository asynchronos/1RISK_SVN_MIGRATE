Imports System.IO.File
Imports System.Globalization
Partial Class aspx_uploadfile_testCopyFile
    Inherits System.Web.UI.Page
    Dim ConnString As String = ConfigurationManager.ConnectionStrings("Bay01ConnectionString").ToString
    'Dim cul As New CultureInfo("en-US") ' ปี eng 

    Dim cul As New CultureInfo("th-TH") ' ปี  THAI
    Dim dtForm As New System.Data.DataTable


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            tbEmpID.Text = User.Identity.Name

        End If

    End Sub

    Protected Sub btnQuery_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnQuery.Click
        If tbEmpID.Text = "" Or tbDate1.Text = "" Or tbDate2.Text = "" Then
            Response.Write("Please insert  emp-id  and date ")
            Exit Sub
        End If

        Dim d1 As Date = Date.Parse(tbDate1.Text, cul)
        Dim d2 As Date = Date.Parse(tbDate2.Text, cul)

        Dim dd1 As String = Right("00" & d1.Day, 2)
        Dim mm1 As String = Right("00" & d1.Month, 2)
        Dim yy1 As String = d1.Year.ToString

        Dim dd2 As String = Right("00" & d2.Day, 2)
        Dim mm2 As String = Right("00" & d2.Month, 2)
        Dim yy2 As String = d2.Year.ToString

        Dim strD1 As String = yy1 & mm1 & dd1
        Dim strD2 As String = yy2 & mm2 & dd2


        'MsgBox(strD1)
        Dim stringForm As String = "UPLOAD_COPY_FILE_BY_EMP_ID"
        Dim SqlForm As New SqlDataSource
        SqlForm.ConnectionString = ConnString
        SqlForm.SelectCommandType = SqlDataSourceCommandType.StoredProcedure
        ' SqlForm.SelectParameters.Add("date1", d1)
        'SqlForm.SelectParameters.Add("date2", d2)
        SqlForm.SelectParameters.Clear()
        SqlForm.SelectParameters.Add("emp_id", tbEmpID.Text)
        SqlForm.SelectParameters.Add("date1", strD1)
        SqlForm.SelectParameters.Add("date2", strD2)


        SqlForm.SelectCommand = stringForm

        Dim DvForm As New Data.DataView
        DvForm = CType(SqlForm.Select(DataSourceSelectArguments.Empty), Data.DataView)
        dtForm = DvForm.Table
        If dtForm.Rows.Count > 1 Then
            Session("dtForm") = dtForm
            lblQuery.Text = "Found : " & dtForm.Rows.Count & " files"
            BtnCopy.Visible = True
        Else
            BtnCopy.Visible = False
            lblQuery.Text = " Not found data."
            lblMessage.Visible = False
        End If

        lblMessage.Text = ""
        HyperlinkFile.Text = ""


    End Sub

    Protected Sub BtnCopy_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnCopy.Click

        Dim SourceFile As String = Nothing
        Dim DestinationFile As String = Nothing
        Dim errorLog As String = Nothing
        lblMessage.Text = ""
        lblMessage.Visible = True
        Dim dtForm As System.Data.DataTable = Session("dtForm")
        HyperlinkFile.NavigateUrl = "file://\\172.19.54.2\FileApprove"
        HyperlinkFile.Text = "\\172.19.54.2\FileApprove"

        ' ลบไฟล์ใน folder  approve
        Dim s As String
        For Each s In System.IO.Directory.GetFiles(Server.MapPath("../../FileUpload/FileApprove/"))
            System.IO.File.Delete(s)
        Next s

        'copy file 
        For i As Integer = 0 To dtForm.Rows.Count - 1
            Try

                SourceFile = Server.MapPath("../../FileUpload/" & dtForm.Rows(i).Item("FILE_TYPE") & "/" & dtForm.Rows(i).Item("PATH"))
                DestinationFile = Server.MapPath("../../FileUpload/FileApprove/" & dtForm.Rows(i).Item("FILE_TYPE") & "_" & dtForm.Rows(i).Item("PATH"))

                Copy(SourceFile, DestinationFile)
                lblMessage.Text += "Copy " & DestinationFile & " complete. " & "<br>"
            Catch ex As Exception
                lblMessage.Text += "Error " & ex.Message & "<br>"
            End Try
        Next
    End Sub
End Class
