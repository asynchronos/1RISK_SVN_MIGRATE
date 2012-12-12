
Partial Class LoginWithAD
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        
        If Not IsNothing(Request.QueryString.Item("errorMsg")) Then
            'show error message
            Login1.FailureText = Request.QueryString.Item("errorMsg")
        ElseIf Not IsNothing(Request.QueryString.Item("ReturnUrl")) Then
            Dim authCookie As HttpCookie = Context.Request.Cookies(FormsAuthentication.FormsCookieName)

            If Not IsNothing(authCookie) Then
                Login1.FailureText = "คุณไม่มีสิทธิ์ในการดูข้อมูลหน้านี้<br />กรุณาเข้าระบบด้วยUSERNAMEที่มีสิทธิ์"

                Dim uDetail As UserDetail = HttpCookieUtil.getUserDetail(Context.Request.Cookies(FormsAuthentication.FormsCookieName))

                For i As Integer = 0 To uDetail.RoleIDList.Count - 1
                    Login1.FailureText = Login1.FailureText + "<br/> Role:" + uDetail.Role(i)
                Next
            Else
                Login1.FailureText = "Can not found cookie."
            End If

            If IsNothing(User) Then
                Login1.FailureText = "Can not find user identity."
            End If

            If IsNothing(Session.Item(SessionKeyConst.EMP_ID)) Then
                Login1.FailureText = "Can not find session."
            End If
        End If
    End Sub
End Class
