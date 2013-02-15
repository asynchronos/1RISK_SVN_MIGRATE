
Partial Class aspx_common_ThProvince
    Inherits System.Web.UI.Page

    Protected Sub DropDownListProvince_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownListProvince.DataBound
        DropDownListProvince.Items.Insert(0, "...โปรดเลือก...")
    End Sub

    Protected Sub DropDownListDistrict_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownListDistrict.DataBound
        DropDownListDistrict.Items.Insert(0, "...โปรดเลือก...")
    End Sub


    Protected Sub DropDownListSubDistrict_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownListSubDistrict.DataBound
        DropDownListSubDistrict.Items.Insert(0, "...โปรดเลือก...")
    End Sub

    Protected Sub DropDownListProvince_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownListProvince.SelectedIndexChanged
        DropDownListSubDistrict.SelectedIndex = -1
        DropDownListDistrict.SelectedIndex = -1

    End Sub
End Class
