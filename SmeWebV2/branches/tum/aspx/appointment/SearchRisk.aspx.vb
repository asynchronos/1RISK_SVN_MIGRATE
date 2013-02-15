Imports System.Collections.Generic
Partial Class _SearchRisk
    Inherits System.Web.UI.Page
   
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack = False Then
            ShowGridVScheduleRiskTeam()
        End If

        regisScript()
    End Sub
    Protected Sub btnSearchVar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearchVar.Click
        Dim sqlString As String = "Select * From V_Schedule_Risk_Team"
        If tbSearchValue.Text <> "" Then
            If ddlOperator.SelectedValue = " LIKE " Or ddlOperator.SelectedValue = " Not LIKE " Then  '-- "Contains" comparison, e.g.,
                sqlString &= " Where " & ddlFieldValue.SelectedValue & _
                ddlOperator.SelectedValue & "N'%" & Replace(tbSearchValue.Text.Trim, "'", "''") & "%'"
            Else  '-- Numeric comparison, e.g.,
                sqlString &= " Where  " & ddlFieldValue.SelectedValue & _
                ddlOperator.SelectedValue & "'" & Replace(tbSearchValue.Text.Trim, "'", "''") & "'"
            End If
        End If
        Dim dal As New VScheduleRiskTeamDAL
        Dim arr As New List(Of VScheduleRiskTeam)
        arr = dal.getAllVScheduleRiskTeamBySQL(sqlString)
        GridVScheduleRiskTeam.DataSource = arr
        Session("GridVScheduleRiskTeam") = arr
        GridVScheduleRiskTeam.DataBind()
    End Sub

    Protected Sub GridVScheduleRiskTeam_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridVScheduleRiskTeam.SelectedIndexChanged
        Dim riskid, riskname, riskteam, risktel, script As String
        riskid = HttpUtility.HtmlDecode(DirectCast(GridVScheduleRiskTeam.Rows(GridVScheduleRiskTeam.SelectedIndex).FindControl("IDLabel"), Label).Text).Trim
        riskname = HttpUtility.HtmlDecode(DirectCast(GridVScheduleRiskTeam.Rows(GridVScheduleRiskTeam.SelectedIndex).FindControl("NameLabel"), Label).Text).Trim
        riskteam = HttpUtility.HtmlDecode(GridVScheduleRiskTeam.Rows(GridVScheduleRiskTeam.SelectedIndex).Cells(3).Text).Trim
        risktel = HttpUtility.HtmlDecode(GridVScheduleRiskTeam.Rows(GridVScheduleRiskTeam.SelectedIndex).Cells(4).Text).Trim

        If IsNothing(Request.QueryString.Item("return_target_id")) Then
            script = "<script language='javascript'>window.opener.setValueRisk('" & riskid & "','" & riskname & "','" & riskteam & "','" & risktel & "');window.close();</script>"
            Response.Write(script)
        End If
        
    End Sub
    Sub ShowGridVScheduleRiskTeam()
        Dim dal As New VScheduleRiskTeamDAL
        Dim arr As New List(Of VScheduleRiskTeam)
        arr = dal.getAllVScheduleRiskTeam
        GridVScheduleRiskTeam.DataSource = arr
        Session("GridVScheduleRiskTeam") = arr
        GridVScheduleRiskTeam.DataBind()
    End Sub
    Protected Sub GridVScheduleRiskTeam_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridVScheduleRiskTeam.PageIndexChanging
        GridVScheduleRiskTeam.PageIndex = e.NewPageIndex
        GridVScheduleRiskTeam.DataSource = Session("GridVScheduleRiskTeam")
        GridVScheduleRiskTeam.DataBind()
    End Sub

    Protected Sub regisScript()
        If Not IsNothing(Request.QueryString.Item("return_target_id")) Then
            'Dim LinkButton1 As LinkButton = DirectCast(sender, LinkButton)

            Dim returnScriptBlock As String = "function return2Opener(valueIdArray){" _
                                            + " var targetIdArray = eval(decodeURI(getValueFromQueryString('return_target_id')));" _
                                            + " for (var i=0;i<targetIdArray.length;i++){" _
                                            + "    if (i<valueIdArray.length){" _
                                            + "       setDomValueWithSeperate(ele(targetIdArray[i],window.opener),valueIdArray[i],',');" _
                                            + "    }" _
                                            + " }" _
                                            + "}"
            Page.ClientScript.RegisterClientScriptBlock(Me.GetType, "return2Opener", returnScriptBlock, True)

            'Dim row As GridViewRow = DirectCast(LinkButton1.Parent.Parent, GridViewRow)
            'Dim onClickScript As String = "return2Opener(['" + DirectCast(row.FindControl("NameLabel"), Label).Text + ":" + DirectCast(row.FindControl("IDLabel"), Label).Text + "']);window.close();;return false"
            'LinkButton1.Attributes.Add("onclick", onClickScript)
        End If
    End Sub

End Class
