
Partial Class LoginWithAD
    Inherits aspx.MyPageClass

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim liter As Literal = DirectCast(Login1.FindControl("FailureText"), Literal)
        liter.Text = String.Empty

        If Not IsNothing(Request.QueryString.Item("errorMsg")) Then
            'show error message
            liter.Text = Request.QueryString.Item("errorMsg").Replace("&#13;", "<br/>").TrimStart().TrimEnd()
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
        End If
    End Sub
End Class
