Imports System.IO
Imports System.Data.OleDb
Imports System.Data
Imports System.Data.SqlClient

Partial Class aspx_form_UploadExcel
    Inherits System.Web.UI.Page
    Shared savePath As String
    Shared sheetName As String
    Shared rawData As DataSet
    Dim ConnString = ConfigurationManager.ConnectionStrings("BAY01ConnectionString").ToString

    Protected Sub UploadButton_Click(sender As Object, e As System.EventArgs) Handles UploadButton.Click

        If FileUploadControl.HasFile Then

            Dim filename As String = Path.GetFileName(FileUploadControl.FileName)
            savePath = Server.MapPath("~/aspx/form/Excel/") & filename

            Try

                If System.IO.File.Exists(savePath) Then
                    System.IO.File.Delete(savePath)
                End If

                FileUploadControl.SaveAs(savePath)
                StatusLabel.Text = "Upload status: File uploaded!"
                showData()

                FileUploadControl.FileContent.Dispose()


            Catch ex As Exception
                StatusLabel.Text = "ไม่สามารถ upload : " + ex.Message
            End Try



        End If
    End Sub
    Sub showData()
        Try

            sheetName = TextBoxSheet.Text
            If sheetName = "" Then
                sheetName = "Sheet1"
            End If

            '  นำไฟล์ที่โหลดใส่ table 
            Dim DBconnection As OleDbConnection
            DBconnection = New OleDbConnection( _
                   "Provider=Microsoft.ACE.OLEDB.12.0;" & _
                   "Data Source=" & savePath & ";" & _
                   "Extended Properties=""Excel 12.0;HDR=NO;IMEX=1""")

            DBconnection.Open()
            Dim SQLString As String = "SELECT * FROM [" & sheetName & "$]"
            Dim DBCommand = New OleDbCommand(SQLString, DBconnection)
            Dim DBReader As IDataReader = DBCommand.ExecuteReader()


            rawData = New DataSet
            Dim table As New DataTable
            table.Load(DBReader)

            rawData.Tables.Add(table)

            GridViewData.DataSource = rawData
            GridViewData.DataBind()

            createTextBoxHeaderExcel()

            DBconnection.Close()
        Catch ex As Exception
            StatusLabel.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message
        End Try
    End Sub

    Sub createTextBoxHeaderExcel()

        If TextBoxRow.Text = "" Then
            Exit Sub
        End If
        If CInt(TextBoxRow.Text) < 1 Then
            Exit Sub
        End If
        Dim gr As Integer = CInt(TextBoxRow.Text)
        If gr < 1 Then gr = 1

        gr = gr - 1  '  แถวแรกใน grid คือ 0 

        ListBoxHead.Items.Clear()
        ListBoxKey.Items.Clear()

        If GridViewData.Rows.Count > 0 Then
            ListBoxHead.Rows = GridViewData.Rows(0).Cells.Count
            ListBoxKey.Rows = GridViewData.Rows(0).Cells.Count
            For i = 0 To GridViewData.Rows(0).Cells.Count - 1
                Dim str As String = GridViewData.Rows(gr).Cells(i).Text
                ListBoxHead.Items.Add(New ListItem(str, str))
                ListBoxKey.Items.Add(New ListItem(str, str))
            Next
        End If

        If ListBoxKey.Items.Count > 0 Then
            ListBoxKey.SelectedIndex = 0
        End If
    End Sub
    Sub createTextBoxHeaderSQL()

        If TextBoxRow.Text = "" Then
            Exit Sub
        End If
        If CInt(TextBoxRow.Text) < 1 Then
            Exit Sub
        End If
        Dim gr As Integer = CInt(TextBoxRow.Text)
        If gr < 1 Then gr = 1

        gr = gr - 1  '  แถวแรกใน grid คือ 0 

        ListBoxHead.Items.Clear()
        ListBoxKey.Items.Clear()

        If GridViewData.Rows.Count > 0 Then
            ListBoxHead.Rows = GridViewData.HeaderRow.Cells.Count
            ListBoxKey.Rows = GridViewData.HeaderRow.Cells.Count
            For i = 0 To GridViewData.HeaderRow.Cells.Count - 1
                Dim str As String = GridViewData.HeaderRow.Cells(i).Text
                ListBoxHead.Items.Add(New ListItem(str, str))
                ListBoxKey.Items.Add(New ListItem(str, str))
            Next
        End If

        If ListBoxKey.Items.Count > 0 Then
            ListBoxKey.SelectedIndex = 0
        End If
    End Sub

    Sub ChangeIndex(sender As Object, e As GridViewPageEventArgs)
        GridViewData.PageIndex = e.NewPageIndex
        showData()
    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack Then

        Else
            TextBoxRow.Text = 1
            TextBoxSheet.Text = "Sheet1"

        End If
    End Sub

    Protected Sub ButtonUpdateHead_Click(sender As Object, e As System.EventArgs) Handles ButtonUpdateHead.Click
        createTextBoxHeaderExcel()
    End Sub

    Protected Sub ButtonUpdateHeadValue_Click(sender As Object, e As System.EventArgs) Handles ButtonUpdateHeadValue.Click
        If TextBoxUpdateHead.Text = "" Then
            Exit Sub
        End If

        ListBoxHead.Items(ListBoxHead.SelectedIndex).Value = TextBoxUpdateHead.Text
        ListBoxHead.Items(ListBoxHead.SelectedIndex).Text = TextBoxUpdateHead.Text

    End Sub

    Protected Sub ListBoxHead_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ListBoxHead.SelectedIndexChanged
        TextBoxUpdateHead.Text = ListBoxHead.Items(ListBoxHead.SelectedIndex).Value
    End Sub

    Protected Sub ButtonSave_Click(sender As Object, e As System.EventArgs) Handles ButtonSave.Click
        Try
            Dim FormID = Request.QueryString("FormID")
            If FormID = "" Then
                LabelSaveMsg.Text = "ไม่พบ form ที่ต้องการบันทึก"
                Exit Sub
            End If


            If rawData.Tables.Count < 1 Then
                LabelSaveMsg.Text = " ไม่พบข้อมูลที่ต้องการบันทึก"
                Exit Sub
            End If

            Dim strTable As String
            Dim maxField As Integer ' ตัวแปร field มากที่สุด
            'If excelData.Tables(0).Columns.Count <= 10 Then
            '    strTable = "TB_FORM_RAW_10"
            '    maxField = 10
            'ElseIf excelData.Tables(0).Columns.Count <= 20 Then
            '    strTable = "TB_FORM_RAW_20"
            '    maxField = 20
            'ElseIf excelData.Tables(0).Columns.Count <= 30 Then
            '    strTable = "TB_FORM_RAW_30"
            '    maxField = 30
            'End If

            ' ต้องการให้บันทึกทีี่ form_raw เท่านั้น
            strTable = "FORM.TB_FORM_RAW"
            maxField = 20


            ' สร้าง string เพื่อ update การ select ข้อมูล

            Dim strH As New StringBuilder
            strH.Append("SELECT ")
            For i = 0 To ListBoxHead.Items.Count - 1
                Dim listF As String = ListBoxHead.Items(i).Value
                Dim dbF As String = "F" & i + 1
                If listF = "" Or listF.Length < 1 Then
                    listF = "F" & i
                End If
                strH.Append(dbF & " as '" & listF & "'")
                If i = maxField - 1 Then i = ListBoxHead.Items.Count - 1
                If i < ListBoxHead.Items.Count - 1 Then
                    strH.Append(",")
                End If

            Next
            strH.Append(" FROM  " & strTable & " WHERE FORM_ID=" & FormID)

            'Response.Write(strH)
            'Exit Sub 

            Dim strKey As String = ""

            strKey = ListBoxKey.Items(ListBoxKey.SelectedIndex).Value

            ' บันทึก
            Dim beginRow As Integer
            If TextBoxRow.Text = "" Then
                beginRow = 0
            Else
                beginRow = CInt(TextBoxRow.Text)
            End If

            Dim strI As New StringBuilder


            With rawData.Tables(0)
                ' ตรวจสอบจำนวน column ว่าควรเก็บใน table ที่มีขนาดฟิวเท่าไร


                For i = beginRow To .Rows.Count - 1
                    If .Rows(i).Item(0).ToString <> "" Then

                        strI.Append("Insert into " & strTable)
                        strI.Append(" values (" & FormID & ",")
                        ' กำหนดให้ไม่เกิน 20 ฟิว
                        For y = 0 To maxField - 1
                            ' ถ้าทำครบตามจำนวน ฟิวทีี่มากที่สุด แล้วให้เป็นค่าสูงสุดทันที  
                            ' ให้ใส่ข้อมูลจนครบฟิว จากนั้นให้ใส่ค่าว่างจนครบตามตาราง 10,20,30
                            If y <= .Columns.Count - 1 Then
                                strI.Append("'" & .Rows(i).Item(y).ToString.Replace("'", "") & "'")
                            Else
                                strI.Append("''")
                            End If
                            If y < maxField - 1 Then
                                strI.Append(",")
                            End If
                        Next
                        strI.Append(");")

                    End If

                Next
            End With

            'Response.Write(strI.ToString)



            Dim InsertDatasource As New SqlDataSource
            InsertDatasource.ConnectionString = ConnString
            InsertDatasource.InsertCommand = (strI.ToString)
            InsertDatasource.InsertCommandType = SqlDataSourceCommandType.Text
            InsertDatasource.Insert()


            Dim strKeyName As String = TextBoxKey.Text


            Dim Sql = "UPDATE  FORM.TB_FORM "
            Sql = Sql & " SET  TB_SQL=@TB_SQL "
            Sql = Sql & " ,TB_NAME_KEY=@KEY "
            Sql = Sql & " , KEY_ORDER = @KEY "
            Sql = Sql & " WHERE  FORM_ID = @FORM_ID"

            Dim UpdateDatasource As New SqlDataSource
            UpdateDatasource.ConnectionString = ConnString
            UpdateDatasource.UpdateCommand = (Sql)
            UpdateDatasource.UpdateCommandType = SqlDataSourceCommandType.Text
            UpdateDatasource.UpdateParameters.Add("FORM_ID", FormID)
            UpdateDatasource.UpdateParameters.Add("TB_SQL", strH.ToString)
            UpdateDatasource.UpdateParameters.Add("KEY", strKeyName)

            UpdateDatasource.Update()

            LabelSaveMsg.Text = " เพิ่มข้อมูลเริ่มต้นเรียบร้อย "

        Catch ex As Exception
            LabelSaveMsg.Text = "Error" & ex.Message
        End Try
       


    End Sub

    Protected Sub ListBoxKey_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ListBoxKey.SelectedIndexChanged
        TextBoxKey.Text = ListBoxKey.Items(ListBoxKey.SelectedIndex).Value
    End Sub
    Sub showFormData()
        Try

            sheetName = TextBoxSheet.Text
            If sheetName = "" Then
                sheetName = "Sheet1"
            End If

            '  นำไฟล์ที่โหลดใส่ table 
            Dim DBconnection As OleDbConnection
            DBconnection = New OleDbConnection( _
                   "Provider=Microsoft.ACE.OLEDB.12.0;" & _
                   "Data Source=" & savePath & ";" & _
                   "Extended Properties=""Excel 12.0;HDR=NO;IMEX=1""")

            DBconnection.Open()
            Dim SQLString As String = "SELECT * FROM [" & sheetName & "$]"
            Dim DBCommand = New OleDbCommand(SQLString, DBconnection)
            Dim DBReader As IDataReader = DBCommand.ExecuteReader()


            rawData = New DataSet
            Dim table As New DataTable
            table.Load(DBReader)

            rawData.Tables.Add(table)

            GridViewData.DataSource = rawData
            GridViewData.DataBind()

            createTextBoxHeaderExcel()

            DBconnection.Close()
        Catch ex As Exception
            StatusLabel.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message
        End Try
    End Sub

    Protected Sub ButtonRunSQL_Click(sender As Object, e As System.EventArgs) Handles ButtonRunSQL.Click
        If TextBoxSQLSelect.Text = "" Then
            RunSQLLabel.Text = " ระบุ sql"
            Exit Sub
        End If
        Try

            '  นำไฟล์ที่โหลดใส่ table 
            Dim strSQL As String
            strSQL = TextBoxSQLSelect.Text

            Dim SqlForm2 As New SqlDataSource
            SqlForm2.ConnectionString = ConnString
            SqlForm2.SelectCommand = strSQL
            SqlForm2.SelectCommandType = SqlDataSourceCommandType.Text
            Dim DvForm2 As New Data.DataView
            DvForm2 = CType(SqlForm2.Select(DataSourceSelectArguments.Empty), Data.DataView)


            rawData = New DataSet
            rawData.Tables.Add(DvForm2.Table.Copy)

            GridViewData.DataSource = rawData
            GridViewData.DataBind()

            createTextBoxHeaderSQL()

        Catch ex As Exception
            RunSQLLabel.Text = "Execute status: The file could not be uploaded. The following error occured: " + ex.Message
        End Try
    End Sub
End Class
