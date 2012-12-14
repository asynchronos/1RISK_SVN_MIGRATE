Imports System.Data.SqlClient
Imports System.Data

Partial Class aspx_form_FormManage
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


        Dim stringForm As String = " SELECT *  FROM  FORM.TB_FORM ORDER BY FORM_ID DESC"

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
        ButtonSave.Text = "Edit form"
        showEdit()
    End Sub

    Sub showEdit()

        Dim FormID As HiddenField = GridViewForm.Rows(GridViewForm.EditIndex).FindControl("Form_ID")

        Dim stringForm As String = " SELECT  *   FROM  FORM.TB_FORM"
        stringForm += " WHERE  FORM_ID= " & FormID.Value
        Dim SqlForm As New SqlDataSource
        SqlForm.ConnectionString = ConnString
        SqlForm.SelectCommand = stringForm
        SqlForm.SelectCommandType = SqlDataSourceCommandType.Text
        Dim DvForm As New Data.DataView
        DvForm = CType(SqlForm.Select(DataSourceSelectArguments.Empty), Data.DataView)
        Dim DtForm As System.Data.DataTable = DvForm.Table
        If DtForm.Rows.Count >= 1 Then

            '' ดูว่ามีชื่อตารางหรือชื่อ view มั้ย ถ้าไม่มีให้ไปดึงจาก TB_SQL
            If Not IsDBNull(DtForm.Rows(0).Item("FORM_ID")) Then
                TextBoxFormID.Text = DtForm.Rows(0).Item("FORM_ID")
            End If
            If Not IsDBNull(DtForm.Rows(0).Item("FORM_NAME")) Then
                TextBoxFormName.Text = DtForm.Rows(0).Item("FORM_NAME")
            End If
            If Not IsDBNull(DtForm.Rows(0).Item("FORM_DESC")) Then
                TextBoxFormDesc.Text = DtForm.Rows(0).Item("FORM_DESC")
            End If

            If Not IsDBNull(DtForm.Rows(0).Item("TB_SQL")) Then
                TextBoxSQL.Text = DtForm.Rows(0).Item("TB_SQL")
            End If

            If Not IsDBNull(DtForm.Rows(0).Item("TB_NAME_KEY")) Then
                TextBoxNameKey.Text = DtForm.Rows(0).Item("TB_NAME_KEY")
            End If

            '' กรณีที่ต้องการแสดงข้อมูลเฉพาะบุคคล
            '' หรือมีการส่ง query มาจากภายนอก  จะฟิวเตอตรง data

            If Not IsDBNull(DtForm.Rows(0).Item("TB_QUERY_KEY")) Then
                TextBoxQueryKey.Text = DtForm.Rows(0).Item("TB_QUERY_KEY")
            End If
            If Not IsDBNull(DtForm.Rows(0).Item("TB_QUERY_KEY_VALUE")) Then
                TextBoxQueryKeyValue.Text = DtForm.Rows(0).Item("TB_QUERY_KEY_VALUE")
            End If

            If Not IsDBNull(DtForm.Rows(0).Item("FORM_TYPE_ID")) Then
                TextBoxFormType.Text = DtForm.Rows(0).Item("FORM_TYPE_ID")
            End If

            If Not IsDBNull(DtForm.Rows(0).Item("KEY_ORDER")) Then
                TextBoxKeyOrder.Text = DtForm.Rows(0).Item("KEY_ORDER")
            End If

            If Not IsDBNull(DtForm.Rows(0).Item("FORM_STATUS")) Then
                TextBoxStatus.Text = DtForm.Rows(0).Item("FORM_STATUS")
            End If



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


        If TextBoxFormName.Text = "" Then
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
            sql = "INSERT INTO  FORM.TB_FORM"
            sql = sql & "(FORM_NAME,FORM_DESC,TB_NAME_KEY,TB_SQL,TB_QUERY_KEY,TB_QUERY_KEY_VALUE,KEY_ORDER,FORM_STATUS,FORM_TYPE_ID)"
            sql = sql & "VALUES"
            sql = sql & "(@FORM_NAME,@FORM_DESC,@TB_NAME_KEY,@TB_SQL,@TB_QUERY_KEY,@TB_QUERY_KEY_VALUE,@KEY_ORDER,@FORM_STATUS,@FORM_TYPE_ID);"
        Else
            sql = "UPDATE  FORM.TB_FORM "
            sql = sql & " SET FORM_NAME=@FORM_NAME,FORM_DESC=@FORM_DESC,TB_NAME_KEY=@TB_NAME_KEY,"
            sql = sql & " TB_SQL=@TB_SQL,TB_QUERY_KEY=@TB_QUERY_KEY,TB_QUERY_KEY_VALUE=@TB_QUERY_KEY_VALUE,"
            sql = sql & " KEY_ORDER=@KEY_ORDER,FORM_STATUS=@FORM_STATUS,FORM_TYPE_ID=@FORM_TYPE_ID"
            sql = sql & " WHERE  FORM_ID = @FORM_ID"

            sqlCmd.Parameters.AddWithValue("FORM_ID", TextBoxFormID.Text)

        End If


        sqlCmd.Parameters.AddWithValue("FORM_NAME", TextBoxFormName.Text)
        sqlCmd.Parameters.AddWithValue("FORM_DESC", TextBoxFormDesc.Text)
        sqlCmd.Parameters.AddWithValue("TB_NAME_KEY", TextBoxNameKey.Text)
        sqlCmd.Parameters.AddWithValue("TB_SQL", TextBoxSQL.Text)
        sqlCmd.Parameters.AddWithValue("TB_QUERY_KEY", TextBoxQueryKey.Text)
        sqlCmd.Parameters.AddWithValue("TB_QUERY_KEY_VALUE", TextBoxQueryKeyValue.Text)
        sqlCmd.Parameters.AddWithValue("KEY_ORDER", TextBoxKeyOrder.Text)
        sqlCmd.Parameters.AddWithValue("FORM_STATUS", TextBoxStatus.Text)
        sqlCmd.Parameters.AddWithValue("FORM_TYPE_ID", TextBoxFormType.Text)

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
        ButtonSave.Text = "Add new form"
        clearINput()
    End Sub
    Sub clearINput()

        TextBoxFormID.Text = ""
        TextBoxFormName.Text = ""
        TextBoxFormDesc.Text = ""
        TextBoxSQL.Text = ""
        TextBoxNameKey.Text = ""
        TextBoxQueryKey.Text = ""
        TextBoxQueryKeyValue.Text = ""
        TextBoxFormType.Text = ""
        TextBoxKeyOrder.Text = ""
        TextBoxStatus.Text = ""

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
