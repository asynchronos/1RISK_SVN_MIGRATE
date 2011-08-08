Public Class DefaultError
    Inherits UserSystem.WebPages.MyWebPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Error_Label.Text = "Error : Please contact administrator.<br />" + "Page : " + getQueryString("page") + "<br />" + "Message : " + getQueryString("msg") + "<br />"
    End Sub

End Class