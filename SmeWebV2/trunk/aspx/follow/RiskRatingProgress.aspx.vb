
Partial Class aspx_follow_RiskRatingProgress
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim mpContentPlaceHolder As ContentPlaceHolder

        mpContentPlaceHolder = _
            CType(Master.FindControl("head"),  _
            ContentPlaceHolder)
        If Not mpContentPlaceHolder Is Nothing Then
            mpContentPlaceHolder.Controls.RemoveAt(2)
            mpContentPlaceHolder.Controls.RemoveAt(1)
            mpContentPlaceHolder.Controls.RemoveAt(0)

            mpContentPlaceHolder.Controls.AddAt(0, New LiteralControl("<link type='text/css' id='link0' rel='stylesheet' href='" + Page.ResolveUrl("~/js/ext-4.2.0.663/resources/css/ext-all.css") + "'/>"))
            mpContentPlaceHolder.Controls.AddAt(1, New LiteralControl("<script id='script1' src='" + Page.ResolveUrl("~/js/ext-4.2.0.663/ext-all-debug.js") + "'></script>"))
            mpContentPlaceHolder.Controls.AddAt(1, New LiteralControl("<script id='script2'>var empId='" + User.Identity.Name + "';var appPath='" + Page.ResolveUrl("~") + "';</script>"))
        End If
    End Sub
End Class
