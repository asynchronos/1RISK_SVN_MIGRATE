
Partial Class BusinessTypeMaintain
    Inherits System.Web.UI.Page

    Protected Sub DropDownList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList1.SelectedIndexChanged
        DropDownList2.Items.Clear()
        DropDownList3.Items.Clear()
    End Sub

    Protected Sub DropDownList2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList2.SelectedIndexChanged
        DropDownList3.Items.Clear()
    End Sub
End Class
