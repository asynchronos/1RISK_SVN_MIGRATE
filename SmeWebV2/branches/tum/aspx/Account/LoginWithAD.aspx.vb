
Partial Class LoginWithAD
    Inherits aspx.MyPageClass

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim liter As Literal = DirectCast(Login1.FindControl("FailureText"), Literal)
        liter.Text = String.Empty

        'If Not IsNothing(Application("PageError")) Then
        '    pages = Application("PageError").ToString()
        'End If
        'If Not IsNothing(Application("LastError")) Then
        '    msg = (DirectCast(Application("LastError"), Exception)).Message
        'End If

        Dim errorsMsg As String = String.Empty

        If hasQueryString("msg") Then
            errorsMsg = errorsMsg & "Message : " + getQueryString("msg") + "<br />"
        End If
        If hasQueryString("pages") Then
            errorsMsg = errorsMsg & "Page : " + getQueryString("pages") + "<br />"
        End If
        

        If Not errorsMsg.Equals(String.Empty) Then
            If errorsMsg.IndexOf("in AD is Locked") >= 0 Then
                liter.Text = "Error : Please Call 5555 To Unlock Your AD.<br />" _
                & errorsMsg
            Else
                liter.Text = "Error : Please contact administrator.<br />" _
                & errorsMsg
            End If
        ElseIf Not IsNothing(Request.QueryString.Item("ReturnUrl")) Then
            Dim authCookie As HttpCookie = Context.Request.Cookies(FormsAuthentication.FormsCookieName)

            If Not IsNothing(authCookie) Then
                liter.Text = "คุณไม่มีสิทธิ์ในการดูข้อมูลหน้านี้<br />กรุณาเข้าระบบด้วยUSERNAMEที่มีสิทธิ์"

                Dim uDetail As UserDetail = HttpCookieUtil.getUserDetail(Context.Request.Cookies(FormsAuthentication.FormsCookieName))

                For i As Integer = 0 To uDetail.RoleIDList.Count - 1
                    liter.Text = liter.Text + "<br/> Role:" + uDetail.Role(i)
                Next
            Else
                liter.Text = "Can not found cookie."
            End If

            If IsNothing(User) Then
                liter.Text = "Can not find user identity."
            End If

            If IsNothing(Session.Item(SessionKeyConst.EMP_ID)) Then
                liter.Text = "Can not find session."
            End If
        Else
            liter.Text = errorsMsg
        End If

    End Sub
End Class
