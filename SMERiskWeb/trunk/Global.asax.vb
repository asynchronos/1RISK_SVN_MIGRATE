Imports System.Web.SessionState
Imports log4net

Public Class Global_asax
    Inherits System.Web.HttpApplication

    Private Shared ReadOnly log As ILog = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType)
    Private Shared ReadOnly isDebugEnabled As Boolean = log.IsDebugEnabled

    Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
        log.Info("============================")
        log.Info("    Starting application")
        log.Info("============================")
    End Sub

    Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires when the session is started
    End Sub

    Sub Application_BeginRequest(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires at the beginning of each request
    End Sub

    Sub Application_AuthenticateRequest(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires upon attempting to authenticate the use
    End Sub

    Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
        Dim err As Exception = Server.GetLastError()

        If err.InnerException IsNot Nothing Then
            err = err.InnerException
            HttpContext.Current.Session.Add("LastError", err)
        End If

        If HttpContext.Current.Session IsNot Nothing Then
            HttpContext.Current.Session.Add("PageError", HttpContext.Current.Request.Url.ToString())
        End If

        If HttpContext.Current.User IsNot Nothing Then
            MDC.[Set]("user", HttpContext.Current.User.Identity.Name)
        End If
        MDC.[Set]("url", HttpContext.Current.Request.Url.ToString())
        'Insert log by log4net
        log.[Error](err.Message, err)

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
        If err.[GetType]().Equals(GetType(System.Security.SecurityException)) Then
            Response.Redirect("~/Pages/Error/UnAuthorized.aspx")
        ElseIf err.[GetType]().Equals(GetType(NotImplementedException)) Then
            Response.Redirect("~/Pages/Error/NotImplemented.aspx")
        Else
            Response.Redirect("~/Pages/Error/DefaultError.aspx")
        End If
    End Sub

    Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires when the session ends
    End Sub

    Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires when the application ends
    End Sub

End Class