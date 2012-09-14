Imports System.Drawing
Imports System.Drawing.Imaging
Imports System.IO

Partial Class test_Watermark
    Inherits aspx.MyPageClass

    '#Region "Get QueryingString"
    '    Public Function hasQueryString(ByVal name As String) As Boolean
    '        Return DirectCast(IIf(IsNothing(Request.QueryString.Item(name)), False, True), Boolean)
    '    End Function

    '    Public Function getQueryString(ByVal name As String) As String
    '        Return DirectCast(IIf(hasQueryString(name), Request.QueryString.Item(name), String.Empty), String)
    '    End Function
    '#End Region

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Response.ContentType = "image/png"

        Using MemStream As New MemoryStream()
            Using m As Watermark.TextImage = New Watermark.TextImage()
                m.SetText(getQueryString("text")).CreateTextImage().Save(MemStream, ImageFormat.Png)
                MemStream.WriteTo(Response.OutputStream)
            End Using
        End Using

        Response.Flush()
        Response.End()
    End Sub
End Class
