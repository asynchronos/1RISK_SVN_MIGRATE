
Partial Class test_Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim ss As String = "000001:s.sssss,4545.45:78787878.doc"
        Dim mm As String = "."
        'MsgBox(ss.Substring(ss.LastIndexOf(mm) + 1))
    End Sub

    Protected Sub ControllingTree1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles ControllingTree1.Load
        DirectCast(sender, ControllingTree).EMP_ID_ROOT = "119016"
    End Sub

    Protected Sub ControllingTree1_SelectedNodeChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ControllingTree1.SelectedNodeChanged
        'MsgBox(ControllingTree1.SelectedValueType)
        'MsgBox(ControllingTree1.SelectedValue)
        TextBox1.Text = ControllingTree1.SelectedValue
    End Sub
End Class
