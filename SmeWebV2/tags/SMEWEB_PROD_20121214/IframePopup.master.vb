Option Explicit On
Option Strict On

Partial Class IframePopup
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        addHeaderLinkAt(0, "~/js/ext3.0/resources/css/ext-all.css")
        addHeaderLinkAt(1, "~/theme/MyStyleSheet.css")

        addHeaderScriptAt(2, "~/js/ext3.0/adapter/ext/ext-base.js")
        addHeaderScriptAt(3, "~/js/ext3.0/ext-all.js")

        addHeaderScriptAt(4, "~/js/jquery.js")
        addHeaderScriptAt(5, "~/js/common.js")
    End Sub

    Protected Sub addHeaderLinkAt(ByVal index As Integer, ByVal href As String)
        head.Controls.AddAt(index, New LiteralControl("<link type='text/css' rel='stylesheet' href='" + Page.ResolveUrl(href) + "'/>"))
    End Sub

    Protected Sub addHeaderScriptAt(ByVal index As Integer, ByVal src As String)
        head.Controls.AddAt(index, New LiteralControl("<script type='text/javascript' src='" + Page.ResolveUrl(src) + "'></script>"))
    End Sub

End Class

