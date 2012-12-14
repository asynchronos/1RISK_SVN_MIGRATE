
Partial Class aspx_report_CACovenantReport
    Inherits System.Web.UI.Page

    Protected Sub DDL_Level_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DDL_CATEGORY.DataBound
        Select Case DirectCast(sender, DropDownList).Items.Count
            Case 0
                DirectCast(sender, DropDownList).Visible = False
                Label_Header.Visible = False
            Case Else
                DirectCast(sender, DropDownList).Visible = True
                Label_Header.Visible = True
        End Select
    End Sub

    Protected Sub GV_COVENANT_REPORT_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GV_COVENANT_REPORT.RowDataBound

        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim reportColor As String = DataBinder.Eval(e.Row.DataItem, "REPORT_FLAG").ToString()

            If reportColor.ToLower().Equals("red") Then
                e.Row.ForeColor = Drawing.Color.Red
            ElseIf reportColor.ToLower().Equals("yellow") Then
                e.Row.ForeColor = Drawing.Color.Goldenrod
            ElseIf reportColor.ToLower().Equals("green") Then
                e.Row.ForeColor = Drawing.Color.DarkGreen
            Else
                'e.Row.ForeColor = Drawing.Color.Black
            End If
        End If
        
    End Sub
End Class
