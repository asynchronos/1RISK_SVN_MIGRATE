
Partial Class test_testAjax
    Inherits System.Web.UI.Page

    Protected Overrides Sub InitializeCulture()
        If Request.Form("ListBox1") IsNot Nothing Then
            Dim selectedLanguage As String = _
                Request.Form("ListBox1")
            UICulture = Request.Form("ListBox1")
            Culture = Request.Form("ListBox1")
            System.Threading.Thread.CurrentThread.CurrentCulture = _
                System.Globalization.CultureInfo.CreateSpecificCulture(selectedLanguage)
            System.Threading.Thread.CurrentThread.CurrentUICulture = New _
                System.Globalization.CultureInfo(selectedLanguage)
        Else
            'Dim selectedLanguage As String = "en-US"
            Dim selectedLanguage As String = "th-TH"
            UICulture = selectedLanguage
            Culture = selectedLanguage
            System.Threading.Thread.CurrentThread.CurrentCulture = _
                System.Globalization.CultureInfo.CreateSpecificCulture(selectedLanguage)
            System.Threading.Thread.CurrentThread.CurrentUICulture = New _
                System.Globalization.CultureInfo(selectedLanguage)
        End If
        MyBase.InitializeCulture()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'MsgBox(Date.Now.ToString(System.Globalization.CultureInfo.CurrentCulture.DateTimeFormat.ToString))
        Dim st As New System.Globalization.DateTimeFormatInfo()
        'st.ShortDatePattern
    End Sub

End Class
