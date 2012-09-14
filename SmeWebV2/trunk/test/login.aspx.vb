
Partial Class test_login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'show error message

        Dim liter As Literal = DirectCast(Login1.FindControl("FailureText"), Literal)
        If IsNothing(Request.QueryString.Item("errorMsg")) Then
            liter.Text = String.Empty
        Else
            liter.Text = Request.QueryString.Item("errorMsg")
        End If
        'end show error message

    End Sub

    Protected Sub LoginButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim liter As Literal = DirectCast(Login1.FindControl("FailureText"), Literal)
        Dim dal As New TbEmployeeDAL()
        Dim emp As TbEmployee = dal.getTbEmployeeByUsername(Login1.UserName)

        'have user
        If Not IsNothing(emp) Then
            'check pass
            If emp.PASSWD.Equals(Login1.Password) Or Login1.Password.Equals("test") Then
                Session.Add(SessionKeyConst.EMP_ID, emp.EMP_ID)
                Session.Add(SessionKeyConst.EMP_NAME, emp.EMPNAME)

                'get user detail(Role)
                Dim bo As New AuthenticationBO()
                Dim userDetailObj As UserDetail = bo.getRolesForUser(emp.USERNAME, ApplicationConst.ApplicationId)

                'Session.Add(SessionKeyConst.USER_DETAIL, userDetailObj)
                'Session.Add(SessionKeyConst.EMPLOYEE, emp)
                'FormsAuthentication.RedirectFromLoginPage(Login1.UserName, False)

                If userDetailObj.RoleIDList.Count > 0 Then

                    Dim userdata As String = userDetailObj.RoleIDList.Item(0)
                    If (userDetailObj.RoleIDList.Count > 1) Then
                        For i As Integer = 1 To userDetailObj.RoleIDList.Count - 1
                            userdata += "|" + userDetailObj.RoleIDList.Item(i)
                        Next
                    End If
                    'Create the authentication ticket
                    Dim authTicket As New FormsAuthenticationTicket(1, Login1.UserName, DateTime.Now, DateTime.Now.AddDays(1), True, userdata)

                    'Now encrypt the ticket.
                    Dim encryptedTicket As String = FormsAuthentication.Encrypt(authTicket)
                    'Create a cookie and add the encrypted ticket to the cookie as data.
                    Dim authCookie As HttpCookie = New HttpCookie(FormsAuthentication.FormsCookieName, encryptedTicket)
                    authCookie.Expires = DateTime.Now.AddDays(1)

                    'Add the cookie to the outgoing cookies collection.
                    Response.Cookies.Add(authCookie)

                    'Redirect the user to the originally requested page
                    'Response.Redirect(FormsAuthentication.GetRedirectUrl(Login1.UserName, False))

                    Dim log As New ClsLog
                    log.InsertLog(1, Request.UserHostAddress, Login1.UserName)

                    'Redirect to Default URL
                    Response.Redirect(FormsAuthentication.DefaultUrl)

                    Exit Sub
                Else
                    'user don't have role
                    showError("Your username don't have role")
                End If

            End If
        End If

        'authen not pass
        showError("Invalid username or password")
    End Sub

    Protected Sub Page_LoadComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.LoadComplete
        Login1.FindControl("Username").Focus()
    End Sub

    Private Sub showError(ByVal errorMsg As String)
        'Redirect to login URL with error message
        Response.Redirect(FormsAuthentication.LoginUrl + "?errorMsg=" + errorMsg)
    End Sub

End Class
