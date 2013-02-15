
Partial Class aspx_report_RatingNotification
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

End Class
