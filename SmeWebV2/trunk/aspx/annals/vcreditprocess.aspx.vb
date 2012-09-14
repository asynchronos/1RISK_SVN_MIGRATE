Imports System.Collections.Generic
Imports System.Globalization
Partial Class _Vcreditprocess
Inherits System.Web.UI.Page
'Protected cul As New CultureInfo("th-TH") ' ปี ไทย  
 Protected cul As New CultureInfo("en-US") ' ปี eng 
Protected Sub alert(ByVal str As String)
	 Response.Write("<script language=""javascript"">alert(""" & Str & """)</script>")
End sub 
 
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If User.Identity.Name = "" Then
            alert(" System time out.")
            Response.Redirect("../../login.aspx")
        End If
        If Page.IsPostBack = False Then
            ShowGridVcreditprocess()
        End If
    End Sub

Protected Sub btnSearchVar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearchVar.Click
        ShowGridVcreditprocess()
    End Sub

Sub ShowGridVcreditprocess
        Dim sql As String = "  select p.*,a.process from annals_credit_process p"
        sql += "  inner join annals_process  a on p.process_id=a.process_id"
        sql += "  WHERE process_date in  "
        sql += "  ( select max(process_date) as process_date from annals_credit_process "
        sql += "  group by id  ) "



        If tbSearchValue.Text <> "" Then
            If ddlOperator.SelectedValue = " LIKE " Or ddlOperator.SelectedValue = " Not LIKE " Then  '-- "Contains" comparison, e.g.,
                sql &= " and  p.id   like  N'%" & Replace(tbSearchValue.Text.Trim, "'", "''") & "%'"
            End If
        End If
        sql += " and emp_id ='" & User.Identity.Name & "' order by p.id desc"

        Dim dal As New vcreditprocessDAL
        Dim arr As New List(Of vcreditprocess)
        arr = dal.getAllvcreditprocessBySQL(sql)
        GridVcreditprocess.DataSource = arr
        Session("Gridvcreditprocess") = arr
        GridVcreditprocess.DataBind()
End Sub
Protected Sub GridVcreditprocess_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridVcreditprocess.PageIndexChanging
	GridVcreditprocess.PageIndex = e.NewPageIndex
	GridVcreditprocess.DataSource = Session("GridVcreditprocess")
	GridVcreditprocess.DataBind()
End Sub

    Protected Sub GridVcreditprocess_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridVcreditprocess.RowDataBound

    End Sub
End Class
