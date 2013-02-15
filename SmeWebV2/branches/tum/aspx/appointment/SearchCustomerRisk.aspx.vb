Imports System.Collections.Generic
Partial Class _SearchCustomerRisk
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack = False Then
            ShowGridTbCustomerRisk()
        End If
    End Sub
  
    Protected Sub btnSearchVar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearchVar.Click
        Dim sqlString As String = "Select * From TB_CUSTOMER_RISK"
        If tbSearchValue.Text <> "" Then
            If ddlOperator.SelectedValue = " LIKE " Or ddlOperator.SelectedValue = " Not LIKE " Then  '-- "Contains" comparison, e.g.,
                sqlString &= " Where " & ddlFieldValue.SelectedValue & _
                ddlOperator.SelectedValue & "N'%" & Replace(tbSearchValue.Text.Trim, "'", "''") & "%'"
            Else  '-- Numeric comparison, e.g.,
                sqlString &= " Where  " & ddlFieldValue.SelectedValue & _
                ddlOperator.SelectedValue & "'" & Replace(tbSearchValue.Text.Trim, "'", "''") & "'"
            End If
        End If
        Dim dal As New TbCustomerRiskDAL
        Dim arr As New List(Of TbCustomerRisk)
        arr = dal.getAllTbCustomerRiskBySQL(sqlString)
        GridTbCustomerRisk.DataSource = arr
        Session("GridTbCustomerRisk") = arr
        GridTbCustomerRisk.DataBind()
    End Sub
    Protected Sub GridTbCustomerRisk_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridTbCustomerRisk.SelectedIndexChanged
        Dim cif, Name, script As String
        cif = HttpUtility.HtmlDecode(GridTbCustomerRisk.Rows(GridTbCustomerRisk.SelectedIndex).Cells(1).Text).Trim
        Name = HttpUtility.HtmlDecode(GridTbCustomerRisk.Rows(GridTbCustomerRisk.SelectedIndex).Cells(2).Text).Trim
        script = "<script language='javascript'>window.opener.setValueCust('" & cif & "','" & Name & "');window.close();</script>"
        Response.Write(script)
    End Sub
    Sub ShowGridTbCustomerRisk()
        Dim dal As New TbCustomerRiskDAL
        Dim arr As New List(Of TbCustomerRisk)
        arr = dal.getAllTbCustomerRisk
        GridTbCustomerRisk.DataSource = arr
        Session("GridTbCustomerRisk") = arr
        GridTbCustomerRisk.DataBind()
    End Sub
    Protected Sub GridTbCustomerRisk_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridTbCustomerRisk.PageIndexChanging
        GridTbCustomerRisk.PageIndex = e.NewPageIndex
        GridTbCustomerRisk.DataSource = Session("GridTbCustomerRisk")
        GridTbCustomerRisk.DataBind()
    End Sub
End Class
