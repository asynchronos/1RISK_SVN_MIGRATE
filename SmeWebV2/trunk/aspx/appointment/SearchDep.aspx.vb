Imports System.Collections.Generic
Partial Class _SearchDep
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack = False Then
            ShowGridIdBranch()
        End If
    End Sub
   
    Protected Sub btnSearchVar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearchVar.Click
        Dim sqlString As String = "Select * From Id_Branch"
        If tbSearchValue.Text <> "" Then
            If ddlOperator.SelectedValue = " LIKE " Or ddlOperator.SelectedValue = " Not LIKE " Then  '-- "Contains" comparison, e.g.,
                sqlString &= " Where " & ddlFieldValue.SelectedValue & _
                ddlOperator.SelectedValue & "N'%" & Replace(tbSearchValue.Text.Trim, "'", "''") & "%'"
            Else  '-- Numeric comparison, e.g.,
                sqlString &= " Where  " & ddlFieldValue.SelectedValue & _
                ddlOperator.SelectedValue & "'" & Replace(tbSearchValue.Text.Trim, "'", "''") & "'"
            End If
        End If
        Dim dal As New IdBranchDAL
        Dim arr As New List(Of IdBranch)
        arr = dal.getAllIdBranchBySQL(sqlString)
        GridIdBranch.DataSource = arr
        Session("GridIdBranch") = arr
        GridIdBranch.DataBind()
    End Sub
 
 
    Protected Sub GridIdBranch_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridIdBranch.SelectedIndexChanged
        Dim Id_Branch, Branch_T, Branch_E, script As String
        Id_Branch = HttpUtility.HtmlDecode(GridIdBranch.Rows(GridIdBranch.SelectedIndex).Cells(1).Text).Trim
        Branch_T = HttpUtility.HtmlDecode(GridIdBranch.Rows(GridIdBranch.SelectedIndex).Cells(2).Text).Trim
        Branch_E = HttpUtility.HtmlDecode(GridIdBranch.Rows(GridIdBranch.SelectedIndex).Cells(3).Text).Trim
        script = "<script language='javascript'>window.opener.setValueDep('" & Id_Branch & "','" & Branch_T & "');window.close();</script>"
        Response.Write(script)

    End Sub
    Sub ShowGridIdBranch()
        Dim dal As New IdBranchDAL
        Dim arr As New List(Of IdBranch)
        arr = dal.getAllIdBranch
        GridIdBranch.DataSource = arr
        Session("GridIdBranch") = arr
        GridIdBranch.DataBind()
    End Sub
    Protected Sub GridIdBranch_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridIdBranch.PageIndexChanging
        GridIdBranch.PageIndex = e.NewPageIndex
        GridIdBranch.DataSource = Session("GridIdBranch")
        GridIdBranch.DataBind()
    End Sub
End Class
