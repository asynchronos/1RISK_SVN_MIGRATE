Imports System.Collections.Generic
Partial Class _SearchOffice
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack = False Then
            ShowGridVScheduleOffice()
        End If
    End Sub
    Protected Sub btnSearchVar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearchVar.Click
        Dim sqlString As String = "Select * From V_Schedule_Office"
        If tbSearchValue.Text <> "" Then
            If ddlOperator.SelectedValue = " LIKE " Or ddlOperator.SelectedValue = " Not LIKE " Then  '-- "Contains" comparison, e.g.,
                sqlString &= " Where " & ddlFieldValue.SelectedValue & _
                ddlOperator.SelectedValue & "N'%" & Replace(tbSearchValue.Text.Trim, "'", "''") & "%'"
            Else  '-- Numeric comparison, e.g.,
                sqlString &= " Where  " & ddlFieldValue.SelectedValue & _
                ddlOperator.SelectedValue & "'" & Replace(tbSearchValue.Text.Trim, "'", "''") & "'"
            End If
        End If
        Dim dal As New VScheduleOfficeDAL
        Dim arr As New List(Of VScheduleOffice)
        arr = dal.getAllVScheduleOfficeBySQL(sqlString)
        GridVScheduleOffice.DataSource = arr
        Session("GridVScheduleOffice") = arr
        GridVScheduleOffice.DataBind()
    End Sub
    Protected Sub GridVScheduleOffice_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridVScheduleOffice.SelectedIndexChanged
        Dim id, name, dept, tel, script As String
        id = HttpUtility.HtmlDecode(GridVScheduleOffice.Rows(GridVScheduleOffice.SelectedIndex).Cells(1).Text).Trim
        name = HttpUtility.HtmlDecode(GridVScheduleOffice.Rows(GridVScheduleOffice.SelectedIndex).Cells(2).Text).Trim
        dept = HttpUtility.HtmlDecode(GridVScheduleOffice.Rows(GridVScheduleOffice.SelectedIndex).Cells(3).Text).Trim
        tel = HttpUtility.HtmlDecode(GridVScheduleOffice.Rows(GridVScheduleOffice.SelectedIndex).Cells(4).Text).Trim
        script = "<script language='javascript'>window.opener.setValueEmp('" & id & "','" & name & "','" & dept & "','" & tel & "');window.close();</script>"
        Response.Write(script)
    End Sub
    Sub ShowGridVScheduleOffice()
        Dim dal As New VScheduleOfficeDAL
        Dim arr As New List(Of VScheduleOffice)
        arr = dal.getAllVScheduleOffice
        GridVScheduleOffice.DataSource = arr
        Session("GridVScheduleOffice") = arr
        GridVScheduleOffice.DataBind()
    End Sub
    Protected Sub GridVScheduleOffice_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridVScheduleOffice.PageIndexChanging
        GridVScheduleOffice.PageIndex = e.NewPageIndex
        GridVScheduleOffice.DataSource = Session("GridVScheduleOffice")
        GridVScheduleOffice.DataBind()
    End Sub
End Class
