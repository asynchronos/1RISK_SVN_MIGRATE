Option Explicit On
Option Strict On

Partial Class MasterPage
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        addHeaderLinkAt(0, "~/control/webMenu/chrometheme/chromestyle2.css")
        addHeaderScriptAt(1, "~/control/webMenu/chromejs/chrome.js")
        addHeaderScriptAt(2, "~/js/common.js")
    End Sub

    Protected Sub addHeaderLinkAt(ByVal index As Integer, ByVal href As String)
        head.Controls.AddAt(index, New LiteralControl("<link type='text/css' rel='stylesheet' href='" + Page.ResolveUrl(href) + "'/>"))
    End Sub

    Protected Sub addHeaderScriptAt(ByVal index As Integer, ByVal src As String)
        head.Controls.AddAt(index, New LiteralControl("<script type='text/javascript' src='" + Page.ResolveUrl(src) + "'></script>"))
    End Sub

End Class

