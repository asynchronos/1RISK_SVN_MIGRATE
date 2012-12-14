Imports Microsoft.VisualBasic

Namespace aspx

    Public Class MyPageClass
        Inherits System.Web.UI.Page

#Region "Get QueryingString"
        Public Function hasQueryString(ByVal name As String) As Boolean
            Return DirectCast(IIf(IsNothing(Request.QueryString.Item(name)), False, True), Boolean)
        End Function

        Public Function getQueryString(ByVal name As String) As String
            Return DirectCast(IIf(hasQueryString(name), Request.QueryString.Item(name), String.Empty), String)
        End Function
#End Region

        Public Sub addHaederLinkAt(ByVal index As Integer, ByVal href As String)
            Dim headMaster As ContentPlaceHolder = Page.Master.FindControl("head")

            If Not IsNothing(headMaster) Then
                headMaster.Controls.RemoveAt(index)
                headMaster.Controls.AddAt(index, New LiteralControl("<link type='text/css' rel='stylesheet' href='" + Page.ResolveUrl(href) + "'/>"))
            End If
        End Sub

        Public Sub addHaederScriptAt(ByVal index As Integer, ByVal src As String)
            Dim headMaster As ContentPlaceHolder = Page.Master.FindControl("head")

            If Not IsNothing(headMaster) Then
                headMaster.Controls.RemoveAt(index)
                headMaster.Controls.AddAt(index, New LiteralControl("<script type='text/javascript' src='" + Page.ResolveUrl(src) + "'></script>"))
            End If
        End Sub

    End Class

End Namespace

