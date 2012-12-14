
Partial Class aspx_stop_sm_history
    Inherits System.Web.UI.Page

    Protected Sub ImageButtonAdd_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles ImageButtonAdd.Load
        If HttpCookieUtil.hasRolesId(Context.Request.Cookies(FormsAuthentication.FormsCookieName), RoleIdConst.R_ADMIN) Then
            ImageButtonAdd.Visible = True
        Else
            ImageButtonAdd.Visible = False
        End If
    End Sub
End Class
