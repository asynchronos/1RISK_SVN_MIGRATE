
Partial Class aspx_error_DefaultError
    Inherits aspx.MyPageClass

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim page As String = String.Empty
        Dim msg As String = String.Empty

        If Not IsNothing(Application("PageError")) Then
            Page = Application("PageError").ToString()
        End If

        If Not IsNothing(Application("LastError")) Then
            msg = (DirectCast(Application("LastError"), Exception)).Message
        End If

        Error_Label.Text = "Error : Please contact administrator.<br />" _
                & "Page : " + page + "<br />" _
                & "Message : " + msg + "<br />"
    End Sub
End Class
