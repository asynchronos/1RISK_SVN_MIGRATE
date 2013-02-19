Imports log4net

Partial Class LoginSuccess
    Inherits aspx.MyPageClass

    Private Shared ReadOnly log As ILog = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType)
    Private Shared ReadOnly isDebugEnabled As Boolean = log.IsDebugEnabled

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Response.Write(User.Identity.Name)
        'log.Info(User.Identity.Name & " login.Now Checking Roles.")

        Dim dal = New TbEmployeeDAL()
        Dim emp As TbEmployee = dal.getTbEmployeeByUsername(User.Identity.Name)

        'have user
        If Not IsNothing(emp) Then

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
                Dim authTicket As New FormsAuthenticationTicket(1, User.Identity.Name, DateTime.Now, DateTime.Now.AddDays(1), False, userdata)

                'Now encrypt the ticket.
                Dim encryptedTicket As String = FormsAuthentication.Encrypt(authTicket)
                'Create a cookie and add the encrypted ticket to the cookie as data.
                Dim authCookie As HttpCookie = New HttpCookie(FormsAuthentication.FormsCookieName, encryptedTicket)
                authCookie.Expires = DateTime.Now.AddDays(1)

                'Add the cookie to the outgoing cookies collection.
                Response.Cookies.Add(authCookie)

                'Redirect the user to the originally requested page
                'Response.Redirect(FormsAuthentication.GetRedirectUrl(Login1.UserName, False))

                Dim clslog As New ClsLog
                clslog.InsertLog(1, Request.UserHostAddress, User.Identity.Name)

                'Redirect to Default URL
                'Response.Redirect(FormsAuthentication.DefaultUrl)
                'Response.Redirect(FormsAuthentication.GetRedirectUrl(User.Identity.Name, False))
                'FormsAuthentication.RedirectFromLoginPage(Login1.UserName, False)

                log.Info(Request.UserHostAddress & ":" & User.Identity.Name & ":Checking Roles Pass.")

                If (isDebugEnabled) Then
                    log.Debug("Check ReturnUrl.")
                End If

                If (hasQueryString("ReturnUrl")) Then
                    If (isDebugEnabled) Then
                        log.Debug("ReturnUrl:" + getQueryString("ReturnUrl"))
                    End If
                    Response.Redirect(getQueryString("ReturnUrl"))
                Else
                    Response.Redirect("~/aspx/mainpage.aspx")
                End If


                Exit Sub
            Else
                'user don't have role
                showError("Your username don't have role.")
            End If

        End If

        showError("Unkown Error, Please contact administrator.")
    End Sub

    Private Sub showError(ByVal errorMsg As String)
        'Redirect to login URL with error message
        log.Info(Request.UserHostAddress & ":" & User.Identity.Name & ":" & errorMsg)
        'log.Info(Page.ResolveUrl(FormsAuthentication.LoginUrl & "?msg=" & HttpUtility.UrlEncode(errorMsg)))
        Response.Redirect(Page.ResolveUrl(FormsAuthentication.LoginUrl & "?msg=" & HttpUtility.UrlEncode(errorMsg)))
        'Throw New SME.UserSystem.Core.Exceptions.UserProfileException(errorMsg)
    End Sub
End Class
