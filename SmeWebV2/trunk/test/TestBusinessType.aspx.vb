
Partial Class test_TestBusinessType
    Inherits System.Web.UI.Page

    Private Sub addBlankListInDropDown(ByVal sender As Object)
        DirectCast(sender, DropDownList).Items.Insert(0, String.Empty)
    End Sub



    Protected Sub DropDownList1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList1.DataBound
        addBlankListInDropDown(sender)
    End Sub

    Protected Sub DropDownList2_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList2.DataBound
        addBlankListInDropDown(sender)
    End Sub

    Protected Sub DropDownList3_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList3.DataBound
        addBlankListInDropDown(sender)
    End Sub

    Protected Sub DropDownList4_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList4.DataBound
        addBlankListInDropDown(sender)
    End Sub

    Protected Sub DropDownList5_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList5.DataBound
        addBlankListInDropDown(sender)
    End Sub

    Protected Sub DropDownList6_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList6.DataBound
        addBlankListInDropDown(sender)
    End Sub

    Protected Sub DropDownList7_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList7.DataBound
        addBlankListInDropDown(sender)
    End Sub

    Protected Sub DropDownList8_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList8.DataBound
        addBlankListInDropDown(sender)
    End Sub

    Protected Sub DropDownList9_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList9.DataBound
        addBlankListInDropDown(sender)
    End Sub



    Private Sub clearDropDown(ByVal sender As Object)
        DirectCast(sender, DropDownList).Items.Clear()
    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList1.SelectedIndexChanged
        DropDownList2.Items.Clear()
        DropDownList3.Items.Clear()
        DropDownList4.Items.Clear()
        DropDownList5.Items.Clear()

        DropDownList6.Items.Clear()
        DropDownList7.Items.Clear()
        DropDownList8.Items.Clear()
        DropDownList9.Items.Clear()
    End Sub

    Protected Sub DropDownList2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList2.SelectedIndexChanged
        DropDownList3.Items.Clear()
        DropDownList4.Items.Clear()
        DropDownList5.Items.Clear()

        DropDownList6.Items.Clear()
        DropDownList7.Items.Clear()

        DropDownList9.Items.Clear()
    End Sub

    Protected Sub DropDownList3_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList3.SelectedIndexChanged
        DropDownList4.Items.Clear()
        DropDownList5.Items.Clear()

        DropDownList7.Items.Clear()
    End Sub

    Protected Sub DropDownList4_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList4.SelectedIndexChanged
        DropDownList5.Items.Clear()
    End Sub

    Protected Sub DropDownList5_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList5.SelectedIndexChanged

    End Sub

    Protected Sub DropDownList6_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList6.SelectedIndexChanged
        DropDownList4.Items.Clear()
        DropDownList5.Items.Clear()

        DropDownList7.Items.Clear()
    End Sub

    Protected Sub DropDownList7_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList7.SelectedIndexChanged
        DropDownList5.Items.Clear()
    End Sub

    Protected Sub DropDownList8_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList8.SelectedIndexChanged
        
    End Sub

    Protected Sub DropDownList9_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList9.SelectedIndexChanged
        
    End Sub
End Class
