<%@ Application Language="VB" %>
<%@ Import Namespace="System.Diagnostics" %>
<script RunAt="server">

    Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs on application startup
        Dim cul As System.Globalization.CultureInfo = System.Threading.Thread.CurrentThread.CurrentCulture
        Application.Add(ApplicationKeyConst.App_Culture, cul)
        Application("UserOnline") = 0
    End Sub

    Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs on application shutdown

    End Sub

    Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
        Dim err As Exception = Server.GetLastError()

        'Creation of event log if it does not exist
        Dim eventLogName As String = ConfigurationManager.AppSettings("APPLICATION_NAME")
        If Not EventLog.SourceExists(eventLogName) Then
            EventLog.CreateEventSource(eventLogName, eventLogName)
        End If

        'Inserting into event log
        Dim eLog As EventLog = New EventLog()
        eLog.Source = eventLogName
        eLog.WriteEntry(err.ToString(), EventLogEntryType.Error)

        'redirect to error page
        If err.GetType().Equals(GetType(System.Runtime.InteropServices.COMException)) Or
            err.GetType().Equals(GetType(System.DirectoryServices.DirectoryServicesCOMException)) Then
            Response.Redirect("~/aspx/account/LoginWithAD.aspx?errorMsg=" & err.Message)
        ElseIf err.GetType().Equals(GetType(System.Security.SecurityException)) Then
            Response.Redirect("~/aspx/error/unauthorized.aspx?page=" & Server.UrlEncode(Request.RawUrl))
        Else
            Response.Redirect("~/aspx/error/defaultError.aspx?page=" & Server.UrlEncode(Request.RawUrl) _
                & "&msg=" & err.InnerException.Message & err.InnerException.StackTrace)
        End If
    End Sub

    Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when a new session is started
        Session("Start") = Now
        Application.Lock()
        Application("UserOnline") = CInt(Application("UserOnline")) + 1
        Application.UnLock()

    End Sub

    Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when a session ends.
        ' Note: The Session_End event is raised only when the sessionstate mode
        ' is set to InProc in the Web.config file. If session mode is set to StateServer
        ' or SQLServer, the event is not raised.
        Dim log As New ClsLog
        log.InsertLog(2, Request.UserHostAddress, DirectCast(Session.Item(SessionKeyConst.EMP_ID), String))

        Application.Lock()
        Application("UserOnline") = CInt(Application("UserOnline")) - 1
        Application.UnLock()

    End Sub

    Sub Session_OnEnd(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when a session ends.
        ' Note: The Session_End event is raised only when the sessionstate mode
        ' is set to InProc in the Web.config file. If session mode is set to StateServer
        ' or SQLServer, the event is not raised.
        Dim log As New ClsLog
        log.InsertLog(2, Request.UserHostAddress, DirectCast(Session.Item(SessionKeyConst.EMP_ID), String))

        Application.Lock()
        Application("UserOnline") = CInt(Application("UserOnline")) - 1
        Application.UnLock()

    End Sub

    Sub Application_AuthenticateRequest(ByVal sender As Object, ByVal e As EventArgs)
        If Request.IsAuthenticated Then

            'Dim bo As New AuthenticationBO()
            'Dim userDetailObj As UserDetail = bo.getRolesForUser(User.Identity.Name, ApplicationConst.ApplicationId)

            'Dim roleList As ArrayList = userDetailObj.RoleList
            'Dim roleListArray As String() = roleList.ToArray(GetType(String))

            'HttpContext.Current.User = New System.Security.Principal.GenericPrincipal(User.Identity, roleListArray)

            'Extract the forms authentication cookie
            Dim cookieName As String = FormsAuthentication.FormsCookieName
            Dim authCookie As HttpCookie = Context.Request.Cookies(cookieName)
            If IsNothing(authCookie) Then
                Response.Redirect(FormsAuthentication.LoginUrl + "?errorMsg=Global.asax : Can't find " + cookieName)
                'There is no authentication cookie.
                Return
            End If

            Dim authTicket As FormsAuthenticationTicket = Nothing
            Try
                authTicket = FormsAuthentication.Decrypt(authCookie.Value)
            Catch ex As Exception
                Response.Redirect(FormsAuthentication.LoginUrl + "?errorMsg=Global.asax : Have exception when decrypt " + cookieName)
                'Log exception details (omitted for simplicity)
                Return
            End Try

            If IsNothing(authTicket) Then
                Response.Redirect(FormsAuthentication.LoginUrl + "?errorMsg=Global.asax : Don' have authTicket in " + cookieName)
                'Cookie failed to decrypt.
                Return
            End If

            'When the ticket was created, the UserData property was assigned a pipe delimited string of role names.
            Dim roles As String() = authTicket.UserData.Split(New Char() {"|"})

            'Create an Identity object
            Dim id As FormsIdentity = New FormsIdentity(authTicket)
            'This principal will flow throughout the request.
            Dim principal As System.Security.Principal.GenericPrincipal = New System.Security.Principal.GenericPrincipal(id, roles)

            'Attach the new principal object to the current HttpContext object
            Context.User = principal

            'add new Expires to cookie
            'authCookie.Expires = DateTime.Now.AddMinutes(30)

        End If
    End Sub

</script>