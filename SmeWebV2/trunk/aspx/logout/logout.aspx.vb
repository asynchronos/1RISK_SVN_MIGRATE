Option Explicit On
Option Strict On

Imports log4net

Partial Class logout
    Inherits aspx.MyPageClass

    Private Shared ReadOnly log As ILog = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType)
    Private Shared ReadOnly isDebugEnabled As Boolean = log.IsDebugEnabled

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim hisLog As New ClsLog
        hisLog.InsertLog(2, Request.UserHostAddress, DirectCast(Session.Item(SessionKeyConst.EMP_ID), String))

        If (isDebugEnabled) Then
            log.Debug(User.Identity.Name & " logout.")
        End If

        FormsAuthentication.SignOut()
        Session.Abandon()
        Context.Request.Cookies.Clear()
        Response.Redirect("~/aspx/account/LoginWithAD.aspx")
    End Sub
End Class
