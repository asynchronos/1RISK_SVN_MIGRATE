Imports System.Data.SqlClient
Imports System.Data

Partial Class aspx_form_FieldManage
    Inherits System.Web.UI.Page
    Dim ConnString = ConfigurationManager.ConnectionStrings("BAY01ConnectionString").ToString
    Shared EditMode

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        If Page.IsPostBack = False Then
            showData()
        End If

    End Sub
    Sub showData()

        Dim SqlData As New SqlDataSource
        SqlData.ConnectionString = ConnString

        '  กรณีที่เป็น form แบบแก้ไขข้อมูล คือมีข้อมูลตั้งต้นและเลือกข้อมูลที่แก้ไข 
        Dim FormID As String = Request.QueryString("FormID")

        Dim stringForm As String = " SELECT *  FROM  FORM.TB_FORM_FIELD WHERE FORM_ID=" & FormID

        Dim SqlForm As New SqlDataSource
        SqlForm.ConnectionString = ConnString
        SqlForm.SelectCommand = stringForm
        SqlForm.SelectCommandType = SqlDataSourceCommandType.Text
        Dim DvForm As New Data.DataView
        DvForm = CType(SqlForm.Select(DataSourceSelectArguments.Empty), Data.DataView)
        Dim DtForm As System.Data.DataTable = DvForm.Table

        GridViewForm.DataSource = DtForm
        GridViewForm.DataBind()

        PanelEdit.Visible = False
        PanelGrid.Visible = True

    End Sub

    Protected Sub GridViewForm_PageIndexChanging(sender As Object, e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridViewForm.PageIndexChanging

        GridViewForm.PageIndex = e.NewPageIndex
        showData()

    End Sub

    Sub GridViewEditCommand(ByVal sender As Object, ByVal e As GridViewEditEventArgs)
        GridViewForm.EditIndex = e.NewEditIndex
        EditMode = "Edit"
        ButtonSave.Text = "Edit field"
        showEdit()
    End Sub

    Sub showEdit()

        Dim FIELD_ID As HiddenField = GridViewForm.Rows(GridViewForm.EditIndex).FindControl("FIELD_ID")

        Dim stringForm As String = " SELECT  *   FROM  FORM.TB_FORM_FIELD "
        stringForm += " WHERE  FIELD_ID= " & FIELD_ID.Value
        Dim SqlForm As New SqlDataSource
        SqlForm.ConnectionString = ConnString
        SqlForm.SelectCommand = stringForm
        SqlForm.SelectCommandType = SqlDataSourceCommandType.Text
        Dim DvForm As New Data.DataView
        DvForm = CType(SqlForm.Select(DataSourceSelectArguments.Empty), Data.DataView)
        Dim DtForm As System.Data.DataTable = DvForm.Table
        If DtForm.Rows.Count >= 1 Then
            With DtForm.Rows(0)
                '' ดูว่ามีชื่อตารางหรือชื่อ view มั้ย ถ้าไม่มีให้ไปดึงจาก TB_SQL
                If Not IsDBNull(.Item("FIELD_ID")) Then
                    TextBoxFieldID.Text = .Item("FIELD_ID")
                End If

                If Not IsDBNull(DtForm.Rows(0).Item("FIELD_NAME")) Then
                    TextBoxFieldName.Text = .Item("FIELD_NAME")
                End If

                If Not IsDBNull(.Item("FIELD_TEXT")) Then
                    TextBoxFieldText.Text = .Item("FIELD_TEXT")
                End If

                If Not IsDBNull(.Item("FIELD_TYPE")) Then
                    For i As Integer = 0 To SelectFieldType.Items.Count - 1
                        If SelectFieldType.Items(i).Value = .Item("FIELD_TYPE") Then
                            SelectFieldType.SelectedIndex = i
                            Exit For
                        End If
                    Next
                End If

                If Not IsDBNull(.Item("FIELD_WIDTH")) Then
                    TextBoxWidth.Text = .Item("FIELD_WIDTH")
                End If

                If Not IsDBNull(.Item("FIELD_TEXT_FOOT")) Then
                    TextBoxTextFoot.Text = .Item("FIELD_TEXT_FOOT")
                End If

                If Not IsDBNull(.Item("FIELD_GROUP")) Then
                    TextBoxGroup.Text = .Item("FIELD_GROUP")
                End If

                If Not IsDBNull(.Item("FIELD_DB_TYPE")) Then

                    For i As Integer = 0 To SelectFieldType.Items.Count - 1
                        If SelectFieldType.Items(i).Value = .Item("FIELD_DB_TYPE") Then
                            SelectFieldType.SelectedIndex = i
                            Exit For
                        End If
                    Next

                End If

                If Not IsDBNull(.Item("FIELD_MAX_LENGTH")) Then
                    TextBoxMaxLength.Text = .Item("FIELD_MAX_LENGTH")
                End If

                If Not IsDBNull(.Item("FIELD_MAX_VALUE")) Then
                    TextBoxMaxValue.Text = .Item("FIELD_MAX_VALUE")
                End If

                If Not IsDBNull(.Item("FIELD_MIN_VALUE")) Then
                    TextBoxMinValue.Text = .Item("FIELD_MIN_VALUE")
                End If

                If Not IsDBNull(.Item("FIELD_REQUIRED")) Then
                    For i As Integer = 0 To selectRequired.Items.Count - 1
                        If selectRequired.Items(i).Value = .Item("FIELD_REQUIRED") Then
                            selectRequired.SelectedIndex = i
                            Exit For
                        End If
                    Next
                End If

                If Not IsDBNull(.Item("FIELD_LIST_ID")) Then
                    TextBoxListID.Text = .Item("FIELD_LIST_ID")
                End If

                If Not IsDBNull(.Item("FIELD_LIST_VALUE")) Then
                    TextBoxListValue.Text = .Item("FIELD_LIST_VALUE")
                End If


            End With

        End If
        SqlForm.Dispose()



        PanelEdit.Visible = True
        PanelGrid.Visible = False
    End Sub

    Protected Sub runScirpt(ByVal str As String)
        str = " $(document).ready(function(){" & str & "});"
        Page.ClientScript.RegisterStartupScript(Me.GetType(), "", str, True)
    End Sub

    Protected Sub ButtonCancel_Click(sender As Object, e As System.EventArgs) Handles ButtonCancel.Click
        PanelEdit.Visible = False
        PanelGrid.Visible = True
    End Sub

    Protected Sub ButtonSave_Click(sender As Object, e As System.EventArgs) Handles ButtonSave.Click
        If Request.QueryString("FormID") = "" Then
            Exit Sub
        End If

        Dim formID As String = Request.QueryString("FormID")
        If TextBoxFieldName.Text = "" Then
            Exit Sub
        End If


        'declare connection
        Dim conn As SqlConnection = Nothing
        Dim sqlCmd As New SqlCommand()
        Dim sql As String = Nothing
        'Try
        conn = ConnectionUtil.getSqlConnectionFromWebConfig()

        sqlCmd.Connection = conn
        sqlCmd.Transaction = sqlCmd.Connection.BeginTransaction()


        If EditMode = "Add" Then
            sql = "INSERT INTO  FORM.TB_FORM_FIELD "
            sql = sql & "(FORM_ID,FIELD_NAME,FIELD_TEXT,FIELD_TYPE,FIELD_WIDTH,FIELD_TEXT_FOOT,FIELD_GROUP,FIELD_DB_TYPE,FIELD_MAX_LENGTH,FIELD_MIN_VALUE,FIELD_MAX_VALUE,FIELD_REQUIRED,FIELD_LIST_ID,FIELD_LIST_VALUE)"
            sql = sql & "VALUES"
            sql = sql & "(@FORM_ID,@FIELD_NAME,@FIELD_TEXT,@FIELD_TYPE,@FIELD_WIDTH,@FIELD_TEXT_FOOT,@FIELD_GROUP,@FIELD_DB_TYPE,@FIELD_MAX_LENGTH,@FIELD_MIN_VALUE,@FIELD_MAX_VALUE,@FIELD_REQUIRED,@FIELD_LIST_ID,@FIELD_LIST_VALUE)"
        Else
            sql = "UPDATE  FORM.TB_FORM_FIELD "
            sql = sql & " SET FORM_ID=@FORM_ID,FIELD_NAME=@FIELD_NAME,FIELD_TEXT=@FIELD_TEXT,FIELD_TYPE=@FIELD_TYPE,"
            sql = sql & " FIELD_WIDTH=@FIELD_WIDTH,FIELD_TEXT_FOOT=@FIELD_TEXT_FOOT,FIELD_GROUP=@FIELD_GROUP,"
            sql = sql & " FIELD_DB_TYPE=@FIELD_DB_TYPE,FIELD_MAX_LENGTH=@FIELD_MAX_LENGTH,FIELD_MIN_VALUE=@FIELD_MIN_VALUE,"
            sql = sql & " FIELD_MAX_VALUE=@FIELD_MAX_VALUE,FIELD_REQUIRED=@FIELD_REQUIRED,FIELD_LIST_ID=@FIELD_LIST_ID,FIELD_LIST_VALUE=@FIELD_LIST_VALUE"
            sql = sql & " WHERE  FIELD_ID = @FIELD_ID"

            sqlCmd.Parameters.AddWithValue("FIELD_ID", TextBoxFieldID.Text)

        End If


        sqlCmd.Parameters.AddWithValue("FORM_ID", FormID)
        sqlCmd.Parameters.AddWithValue("FIELD_NAME", TextBoxFieldName.Text)
        sqlCmd.Parameters.AddWithValue("FIELD_TEXT", TextBoxFieldText.Text)
        sqlCmd.Parameters.AddWithValue("FIELD_TYPE", SelectFieldType.SelectedValue)
        If TextBoxWidth.Text = "" Then
            sqlCmd.Parameters.AddWithValue("FIELD_WIDTH", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("FIELD_WIDTH", TextBoxWidth.Text)
        End If

        sqlCmd.Parameters.AddWithValue("FIELD_TEXT_FOOT", TextBoxTextFoot.Text)

        If TextBoxGroup.Text = "" Then
            sqlCmd.Parameters.AddWithValue("FIELD_GROUP", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("FIELD_GROUP", TextBoxGroup.Text)
        End If

        sqlCmd.Parameters.AddWithValue("FIELD_DB_TYPE", SelectDBType.SelectedValue)
        If TextBoxMaxLength.Text = "" Then
            sqlCmd.Parameters.AddWithValue("FIELD_MAX_LENGTH", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("FIELD_MAX_LENGTH", TextBoxMaxLength.Text)
        End If
        If TextBoxMinValue.Text = "" Then
            sqlCmd.Parameters.AddWithValue("FIELD_MIN_VALUE", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("FIELD_MIN_VALUE", TextBoxMinValue.Text)
        End If

        If TextBoxMaxValue.Text = "" Then
            sqlCmd.Parameters.AddWithValue("FIELD_MAX_VALUE", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("FIELD_MAX_VALUE", TextBoxMaxValue.Text)
        End If


        sqlCmd.Parameters.AddWithValue("FIELD_REQUIRED", selectRequired.SelectedValue)

        If TextBoxListID.Text = "" Then
            sqlCmd.Parameters.AddWithValue("FIELD_LIST_ID", System.DBNull.Value)
        Else
            sqlCmd.Parameters.AddWithValue("FIELD_LIST_ID", TextBoxListID.Text)
        End If

        sqlCmd.Parameters.AddWithValue("FIELD_LIST_VALUE", TextBoxListValue.Text)


        sqlCmd.CommandType = CommandType.Text
        'MsgBox(sql)

        sqlCmd.CommandText = sql
        sqlCmd.ExecuteNonQuery()
        sqlCmd.Transaction.Commit()

        'Catch ex As Exception
        'sqlCmd.Transaction.Rollback()
        'runScirpt("alert('Cannot save data. \n " & ex.Message.ToString.Replace("'", "") & "');")
        'Exit Sub
        'Finally
        If (conn.State = ConnectionState.Open) Then
            conn.Close()
        End If
        conn = Nothing
        showData()
        runScirpt("alert('" & "Complete" & "');")
    End Sub

    Protected Sub ButtonAdd_Click(sender As Object, e As System.EventArgs) Handles ButtonAdd.Click
        PanelEdit.Visible = True
        PanelGrid.Visible = False
        EditMode = "Add"
        ButtonSave.Text = "Add new field"
        clearINput()
    End Sub
    Sub clearINput()

        TextBoxFieldName.Text = ""
        TextBoxFieldText.Text = ""
        SelectFieldType.SelectedIndex = 0
        TextBoxWidth.Text = ""
        TextBoxTextFoot.Text = ""
        TextBoxGroup.Text = ""
        SelectDBType.SelectedIndex = 0
        TextBoxMaxLength.Text = ""
        TextBoxMinValue.Text = ""
        TextBoxMaxValue.Text = ""
        selectRequired.SelectedIndex = 0
        TextBoxListID.Text = ""
        TextBoxListValue.Text = ""


    End Sub

    Protected Sub GridViewForm_RowDataBound(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewForm.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            e.Row.Attributes.Add("OnMouseOver", "this.style.backgroundColor = 'lightblue';")
            If e.Row.RowState = DataControlRowState.Alternate Then
                Dim alColor As String = System.Drawing.ColorTranslator.ToHtml(GridViewForm.AlternatingRowStyle.BackColor)
                e.Row.Attributes.Add("OnMouseOut", "this.style.backgroundColor ='" & alColor & "'")
            Else
                Dim bkColor As String = System.Drawing.ColorTranslator.ToHtml(GridViewForm.RowStyle.BackColor)
                e.Row.Attributes.Add("OnMouseOut", "this.style.backgroundColor ='" & bkColor & "'")
            End If
        End If
    End Sub
End Class
