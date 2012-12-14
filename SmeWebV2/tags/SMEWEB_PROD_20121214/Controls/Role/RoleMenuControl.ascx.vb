Option Explicit On
Option Strict On

Namespace aspx.userControl
    Partial Class RoleMenuControl
        Inherits System.Web.UI.UserControl

        Protected Sub LinkButt_RoleFilter_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButt_RoleFilter.Click
            Response.Redirect("~/aspx/role/roleFilter.aspx")
        End Sub

        Protected Sub LinkButt_CifFilter_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButt_CifFilter.Click
            Response.Redirect("~/aspx/role/cifFilter.aspx")
        End Sub

        Protected Sub LinkButt_EmpFilter_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButt_EmpFilter.Click
            Response.Redirect("~/aspx/role/empFilter.aspx")
        End Sub
    End Class
End Namespace


