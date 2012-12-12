Option Explicit On
Option Strict On

Partial Class logout
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim log As New ClsLog
        log.InsertLog(2, Request.UserHostAddress, DirectCast(Session.Item(SessionKeyConst.EMP_ID), String))
        FormsAuthentication.SignOut()
        Session.Abandon()
        Context.Request.Cookies.Clear()
        Response.Redirect(Page.ResolveUrl("~/aspx/account/LoginWithAD.aspx"))
    End Sub
End Class
