Option Explicit On
Option Strict On

Partial Class aspx_download_checkBeforeDownload
    Inherits System.Web.UI.Page

    Private downLoadLogType As String = "00006"
    Private infoLogLevel As String = "00001"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim url As String = Request.QueryString.Get("url")

        If IsNothing(url) Then
            Label1.Text = "ยังไม่มีการระบุ URL"
        Else
            LogUtil.InsertLog(downLoadLogType, infoLogLevel, Request.UserHostAddress, User.Identity.Name, HttpUtility.UrlDecode(Request.RawUrl, Request.ContentEncoding), User.Identity.Name + " download file on " + Page.ResolveUrl(url))
            Response.Redirect(url, True)
        End If

    End Sub
End Class
