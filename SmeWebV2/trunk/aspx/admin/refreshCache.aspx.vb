Option Explicit On
Option Strict On

Namespace aspx.admin
    Partial Class refreshCache
        Inherits aspx.MyPageClass

        Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
            If DropDownList1.SelectedIndex = 0 Then
                MyCacheFactory.refreshAllCache()
            Else
                MyCacheFactory.refreshCache(DropDownList1.SelectedIndex - 1)
            End If

            ResultLabel.Text = "Refresh Success"
        End Sub

        Protected Sub DropDownList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList1.SelectedIndexChanged
            ResultLabel.Text = ""
        End Sub
    End Class
End Namespace
