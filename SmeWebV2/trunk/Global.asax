<%@ Application Language="VB" %>
<%@ Import Namespace="log4net" %>
<%@ Import Namespace="System.Diagnostics" %>
<script RunAt="server">
    Private Shared ReadOnly log As ILog = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType)
    Private Shared ReadOnly isDebugEnabled As Boolean = log.IsDebugEnabled

    Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
        log4net.Config.XmlConfigurator.ConfigureAndWatch(New System.IO.FileInfo("D:\workspaces\2012\SmeWebV2\Log4net.SMEWeb.config"))
        'production
        'log4net.Config.XmlConfigurator.ConfigureAndWatch(New System.IO.FileInfo("D:\Web\SmeWeb\Log4net.SMEWeb.config"))

        log.Info("============================")
        log.Info(ConfigurationManager.AppSettings("APPLICATION_NAME") & "Started.")
        log.Info("============================")
        log.Info("IsDebugEnabled : " + isDebugEnabled)

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

        ''Creation of event log if it does not exist
        'Dim eventLogName As String = ConfigurationManager.AppSettings("APPLICATION_NAME")
        'If Not EventLog.SourceExists(eventLogName) Then
        '    EventLog.CreateEventSource(eventLogName, eventLogName)
        'End If

        ''Inserting into event log
        'Dim eLog As EventLog = New EventLog()
        'eLog.Source = eventLogName
        'eLog.WriteEntry(err.ToString(), EventLogEntryType.Error)

        'Insert full stack log by log4net
        log.Error(err.Message, err)

        'manage error to show on web
        If Not IsNothing(err.InnerException) Then
            err = err.InnerException
        End If

        Application("LastError") = err 'store the error for later
        Application("PageError") = HttpContext.Current.Request.Url.ToString()
        Server.ClearError() 'clear the error so we can continue onwards

        If Not IsNothing(HttpContext.Current.Session) Then
            'HttpContext.Current.Session.Add("LastError", err);
            'HttpContext.Current.Session.Add("PageError", HttpContext.Current.Request.Url.ToString());
        End If

        'send mail
        'System.Web.Mail.MailMessage mail = new System.Web.Mail.MailMessage();
        'String ErrorMessage = "The error description is as follows : " + ErrorDescription;
        'mail.To = "mail@domail.com";
        'mail.Subject = "Error in the " + EventLogName + "site";
        'mail.Priority = System.Web.Mail.MailPriority.High;
        'mail.BodyFormat = System.Web.Mail.MailFormat.Text;
        'mail.Body = ErrorMessage;
        'System.Web.Mail.SmtpMail.Send(mail);

        'redirect to error page
        If err.GetType().Equals(GetType(System.Runtime.InteropServices.COMException)) Or
            err.GetType().Equals(GetType(System.DirectoryServices.DirectoryServicesCOMException)) Then
            Response.Redirect("~/aspx/account/LoginWithAD.aspx")
        ElseIf err.GetType().Equals(GetType(System.Security.SecurityException)) Then
            Response.Redirect("~/aspx/error/unauthorized.aspx")
        Else
            'Response.Redirect("~/aspx/error/defaultError.aspx?page=" & Server.UrlEncode(Request.RawUrl) _
            '    & "&msg=" & err.InnerException.Message & err.InnerException.StackTrace)
            Response.Redirect("~/aspx/error/defaultError.aspx")
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
        'Dim log As New ClsLog
        'log.InsertLog(2, Request.UserHostAddress, DirectCast(Session.Item(SessionKeyConst.EMP_ID), String))

        If Not IsNothing(Session.Item(SessionKeyConst.EMP_ID)) Then
            log.Info(DirectCast(Session.Item(SessionKeyConst.EMP_ID), String) & " logout.")
        End If

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