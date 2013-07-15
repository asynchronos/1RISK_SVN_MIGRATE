
Partial Class aspx_error_DefaultError
    Inherits aspx.MyPageClass

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Dim pages As String = String.Empty
        'Dim msg As String = String.Empty

        'If Not IsNothing(Application("PageError")) Then
        '    pages = Application("PageError").ToString()
        'End If

        'If Not IsNothing(Application("LastError")) Then
        '    msg = (DirectCast(Application("LastError"), Exception)).Message
        'End If

        Dim errorsMsg As String = String.Empty

        If hasQueryString("m") Then
            errorsMsg = errorsMsg & "Message : " + getQueryString("msg") + "<br />"
        End If
        If hasQueryString("pages") Then
            errorsMsg = errorsMsg & "Page : " + getQueryString("pages") + "<br />"
        End If

        Error_Label.Text = "Error : Please contact administrator.<br />" _
                & errorsMsg
    End Sub
End Class
