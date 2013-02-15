Imports System.Data.SqlClient
Imports System.Data

Partial Class aspx_form_RawManage
    Inherits System.Web.UI.Page
    Dim ConnString = ConfigurationManager.ConnectionStrings("BAY01ConnectionString").ToString
    Shared EditMode

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        If Page.IsPostBack = False Then
            showData()
        End If

    End Sub
    Sub showData()
        Dim FormID As String = Request.QueryString("FormID")

        If FormID = "" Then Exit Sub

        Dim SqlData As New SqlDataSource
        SqlData.ConnectionString = ConnString

        '  กรณีที่เป็น form แบบแก้ไขข้อมูล คือมีข้อมูลตั้งต้นและเลือกข้อมูลที่แก้ไข 


        Dim stringForm As String = " SELECT *  FROM  FORM.TB_FORM  WHERE  FORM_ID = " & FormID

        Dim SqlForm As New SqlDataSource
        SqlForm.ConnectionString = ConnString
        SqlForm.SelectCommand = stringForm
        SqlForm.SelectCommandType = SqlDataSourceCommandType.Text
        Dim DvForm As New Data.DataView
        DvForm = CType(SqlForm.Select(DataSourceSelectArguments.Empty), Data.DataView)
        Dim DtForm As System.Data.DataTable = DvForm.Table

        Dim strSQL As String
        If DtForm.Rows.Count >= 1 Then
            If IsDBNull(DtForm.Rows(0).Item("TB_SQL")) = False Then
                strSQL = DtForm.Rows(0).Item("TB_SQL")
                If strSQL <> "" Then
                    Dim SqlForm2 As New SqlDataSource
                    SqlForm2.ConnectionString = ConnString
                    SqlForm2.SelectCommand = strSQL
                    SqlForm2.SelectCommandType = SqlDataSourceCommandType.Text
                    Dim DvForm2 As New Data.DataView
                    DvForm2 = CType(SqlForm2.Select(DataSourceSelectArguments.Empty), Data.DataView)
                    Dim DtForm2 As System.Data.DataTable = DvForm2.Table

                    GridViewForm.DataSource = DtForm2
                    GridViewForm.DataBind()

                    PanelEdit.Visible = False
                    PanelGrid.Visible = True
                    ButtonDelete.Text = " ลบข้อมูล " & DvForm2.Table.Rows.Count & " record"


                End If
            End If

        End If

        If GridViewForm.Rows.Count > 0 Then
            ButtonDelete.Visible = True
        Else
            ButtonDelete.Visible = False
        End If

    End Sub

    Protected Sub GridViewForm_PageIndexChanging(sender As Object, e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridViewForm.PageIndexChanging

        GridViewForm.PageIndex = e.NewPageIndex
        showData()

    End Sub

    Sub GridViewDeletetCommand(ByVal sender As Object, ByVal e As GridViewDeleteEventArgs)

        Dim strValue As String = GridViewForm.Rows(e.RowIndex).Cells(1).Text
        Dim FormID As String = Request.QueryString("FormID")



        If FormID = "" Then Exit Sub
        If strValue = "" Then Exit Sub

        Dim Sql = "Delete  FORM.TB_FORM_RAW "
        Sql = Sql & " WHERE  FORM_ID = @FORM_ID"
        Sql = Sql & " AND  F1 = @VALUE"

        Dim DeleteDatasource As New SqlDataSource
        DeleteDatasource.ConnectionString = ConnString
        DeleteDatasource.DeleteCommand = (Sql)
        DeleteDatasource.DeleteCommandType = SqlDataSourceCommandType.Text
        DeleteDatasource.DeleteParameters.Add("FORM_ID", FormID)
        DeleteDatasource.DeleteParameters.Add("VALUE", strValue)

        DeleteDatasource.Delete()

        showData()

    End Sub

    Protected Sub runScirpt(ByVal str As String)
        str = " $(document).ready(function(){" & str & "});"
        Page.ClientScript.RegisterStartupScript(Me.GetType(), "", str, True)
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

    Protected Sub ButtonDelete_Click(sender As Object, e As System.EventArgs) Handles ButtonDelete.Click
        Dim FormID As String = Request.QueryString("FormID")

        If FormID = "" Then Exit Sub


        Dim Sql = "Delete  FORM.TB_FORM_RAW "
        Sql = Sql & " WHERE  FORM_ID = @FORM_ID"

        Dim DeleteDatasource As New SqlDataSource
        DeleteDatasource.ConnectionString = ConnString
        DeleteDatasource.DeleteCommand = (Sql)
        DeleteDatasource.DeleteCommandType = SqlDataSourceCommandType.Text
        DeleteDatasource.DeleteParameters.Add("FORM_ID", FormID)

        DeleteDatasource.Delete()

        showData()

    End Sub
End Class
