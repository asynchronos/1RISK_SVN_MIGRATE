
Partial Class test_Default2
    Inherits System.Web.UI.Page

    Private Sub addBlankListInDropDown(ByVal sender As Object)
        DirectCast(sender, DropDownList).Items.Insert(0, String.Empty)
    End Sub



    Protected Sub DropDownList4_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList4.Load
        'DirectCast(sender, DropDownList).SelectedIndex = DropDownList1.SelectedIndex
    End Sub

    Protected Sub DropDownList8_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList8.Load
        'DirectCast(sender, DropDownList).SelectedIndex = DropDownList1.SelectedIndex
    End Sub

    Protected Sub DropDownList12_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList12.Load
        'DirectCast(sender, DropDownList).SelectedIndex = DropDownList1.SelectedIndex
    End Sub




    Protected Sub DropDownList1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList1.DataBound
        'addBlankListInDropDown(sender)
    End Sub

    Protected Sub DropDownList2_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList2.DataBound
        'addBlankListInDropDown(sender)
    End Sub

    Protected Sub DropDownList3_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList3.DataBound
        'addBlankListInDropDown(sender)
    End Sub

    Protected Sub DropDownList4_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList4.DataBound
        'addBlankListInDropDown(sender)
    End Sub

    Protected Sub DropDownList5_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList5.DataBound
        'addBlankListInDropDown(sender)
    End Sub

    Protected Sub DropDownList6_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList6.DataBound
        'addBlankListInDropDown(sender)
    End Sub

    Protected Sub DropDownList7_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList7.DataBound
        'addBlankListInDropDown(sender)
    End Sub

    Protected Sub DropDownList8_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList8.DataBound
        'addBlankListInDropDown(sender)
    End Sub

    Protected Sub DropDownList9_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList9.DataBound
        'addBlankListInDropDown(sender)
    End Sub

    Protected Sub DropDownList10_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList10.DataBound
        'addBlankListInDropDown(sender)
    End Sub

    Protected Sub DropDownList11_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList11.DataBound
        'addBlankListInDropDown(sender)
    End Sub

    Protected Sub DropDownList12_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList12.DataBound
        'addBlankListInDropDown(sender)
    End Sub

    Protected Sub DropDownList13_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList13.DataBound
        'addBlankListInDropDown(sender)
    End Sub

    Protected Sub DropDownList14_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList14.DataBound
        'addBlankListInDropDown(sender)
    End Sub

    Protected Sub DropDownList15_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList15.DataBound
        'addBlankListInDropDown(sender)
    End Sub

    Protected Sub DropDownList16_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList16.DataBound
        'addBlankListInDropDown(sender)
    End Sub




    Protected Sub DropDownList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList1.SelectedIndexChanged
        DropDownList2.Items.Clear()
        DropDownList3.Items.Clear()

        DropDownList5.Items.Clear()
        DropDownList6.Items.Clear()
        DropDownList7.Items.Clear()

        DropDownList9.Items.Clear()
        DropDownList10.Items.Clear()
        DropDownList11.Items.Clear()

        DropDownList13.Items.Clear()
        DropDownList14.Items.Clear()
        DropDownList15.Items.Clear()
        DropDownList16.Items.Clear()

        DropDownList4.SelectedIndex = DropDownList1.SelectedIndex
        DropDownList8.SelectedIndex = DropDownList1.SelectedIndex
        DropDownList12.SelectedIndex = DropDownList1.SelectedIndex
    End Sub

    Protected Sub DropDownList2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList2.SelectedIndexChanged
        DropDownList3.Items.Clear()
    End Sub

    Protected Sub DropDownList3_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList3.SelectedIndexChanged
        
    End Sub



    Protected Sub DropDownList4_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList4.SelectedIndexChanged
        DropDownList5.Items.Clear()
        DropDownList6.Items.Clear()
        DropDownList7.Items.Clear()
    End Sub

    Protected Sub DropDownList5_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList5.SelectedIndexChanged
        DropDownList6.Items.Clear()
        DropDownList7.Items.Clear()
    End Sub

    Protected Sub DropDownList6_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList6.SelectedIndexChanged
        DropDownList7.Items.Clear()
    End Sub

    Protected Sub DropDownList7_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList7.SelectedIndexChanged

    End Sub



    Protected Sub DropDownList8_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList8.SelectedIndexChanged
        DropDownList9.Items.Clear()
        DropDownList10.Items.Clear()
        DropDownList11.Items.Clear()
    End Sub

    Protected Sub DropDownList9_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList9.SelectedIndexChanged
        DropDownList10.Items.Clear()
        DropDownList11.Items.Clear()
    End Sub

    Protected Sub DropDownList10_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList10.SelectedIndexChanged
        DropDownList11.Items.Clear()
    End Sub

    Protected Sub DropDownList11_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList11.SelectedIndexChanged

    End Sub




    Protected Sub DropDownList12_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList12.SelectedIndexChanged
        DropDownList13.Items.Clear()
        DropDownList14.Items.Clear()
        DropDownList15.Items.Clear()
        DropDownList16.Items.Clear()
    End Sub

    Protected Sub DropDownList13_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList13.SelectedIndexChanged
        DropDownList14.Items.Clear()
        DropDownList15.Items.Clear()
        DropDownList16.Items.Clear()
    End Sub

    Protected Sub DropDownList14_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList14.SelectedIndexChanged
        DropDownList15.Items.Clear()
        DropDownList16.Items.Clear()
    End Sub

    Protected Sub DropDownList15_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList15.SelectedIndexChanged
        DropDownList16.Items.Clear()
    End Sub

    Protected Sub DropDownList16_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList16.SelectedIndexChanged

    End Sub
End Class
