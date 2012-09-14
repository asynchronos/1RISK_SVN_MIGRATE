Option Explicit On
Option Strict On

Namespace SMEWeb

    Partial Class MasterPage
        Inherits System.Web.UI.MasterPage

        Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
            addHeaderLinkAt(0, "~/js/ext3.0/resources/css/ext-all.css")
            addHeaderScriptAt(1, "~/js/ext3.0/adapter/ext/ext-base.js")
            addHeaderScriptAt(2, "~/js/ext3.0/ext-all.js")

            addHeaderLinkAt(3, "~/theme/MyStyleSheet.css")

            addHeaderLinkAt(4, "~/HeaderControl/chrometheme/chromestyle2.css")
            addHeaderScriptAt(5, "~/HeaderControl/chromejs/chrome.js")

            addHeaderScriptAt(6, "~/js/jquery.js")
            addHeaderScriptAt(7, "~/js/common.js")
            addHeaderScriptAt(8, "~/js/MyNumber.js")
        End Sub

        Protected Sub addHeaderLinkAt(ByVal index As Integer, ByVal href As String)
            head.Controls.AddAt(index, New LiteralControl("<link type='text/css' rel='stylesheet' href='" + Page.ResolveUrl(href) + "'/>"))
        End Sub

        Protected Sub addHeaderScriptAt(ByVal index As Integer, ByVal src As String)
            head.Controls.AddAt(index, New LiteralControl("<script type='text/javascript' src='" + Page.ResolveUrl(src) + "'></script>"))
        End Sub

        Public ReadOnly Property BodyTag() As HtmlGenericControl
            Get
                Return MasterPageBodyTag
            End Get
            'Set(ByVal value As HtmlGenericControl)
            '    MasterPageBodyTag = value
            'End Set
        End Property

    End Class

End Namespace