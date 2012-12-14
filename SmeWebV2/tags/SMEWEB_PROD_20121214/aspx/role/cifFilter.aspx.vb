Option Explicit On
Option Strict On

Namespace aspx.role
    Partial Class cifFilter
        Inherits aspx.role.RolePageClass

        Protected Sub Butt_Search_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Butt_Search.Click
            If TextBox_CifFilter.Text.Equals(String.Empty) Then
                Hidd_CifFilter.Value = " "
            Else
                Hidd_CifFilter.Value = TextBox_CifFilter.Text
            End If
        End Sub

        Protected Sub LinkButt_RoleName_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Server.Transfer("~/aspx/role/role.aspx?action=view&" + queryStringRoleId + "=" + DirectCast(DirectCast(sender, LinkButton).Parent.FindControl("Label_RoleId"), Label).Text)
        End Sub
    End Class
End Namespace

