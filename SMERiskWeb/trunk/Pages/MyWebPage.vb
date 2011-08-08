Imports log4net

Namespace UserSystem.WebPages
    Public MustInherit Class MyWebPage
        Inherits System.Web.UI.Page
        Private Shared ReadOnly log As ILog = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType)
        Private Shared ReadOnly isDebugEnabled As Boolean = log.IsDebugEnabled

        '
        ' TODO: Add constructor logic here
        '
        Public Sub New()
        End Sub

        Protected Function hasQueryString(ByVal name As [String]) As Boolean
            Dim result As Boolean = False

            If Request.QueryString(name) IsNot Nothing Then
                result = True
            End If

            Return result
        End Function

        Protected Function getQueryString(ByVal name As [String]) As [String]
            Dim result As [String] = Nothing

            If Me.hasQueryString(name) Then
                result = Request.QueryString(name)
            End If

            Return result
        End Function

        Protected Function getAuthTicket() As FormsAuthenticationTicket
            Dim authTicket As FormsAuthenticationTicket = Nothing
            Dim authCookie As HttpCookie = Context.Request.Cookies(FormsAuthentication.FormsCookieName)

            If authCookie IsNot Nothing Then
                Try
                    authTicket = FormsAuthentication.Decrypt(authCookie.Value)
                Catch argEx As ArgumentException
                    log.[Error](argEx.Message, argEx)
                Catch ex As Exception
                    log.[Error](ex.Message, ex)
                End Try
            End If

            Return authTicket
        End Function

        Protected Sub logActivity(ByVal action As [String])
            Dim empId As [String] = [String].Empty
            If User IsNot Nothing Then
                empId = User.Identity.Name
            Else
                empId = Me.getAuthTicket().Name
            End If

            logActivity(empId, action)
        End Sub

        Public Shared Sub logActivity(ByVal empId As [String], ByVal action As [String])
            'service.user.UserService uServ = new service.user.UserService();

            'uServ.updateUserActivity(empId
            '    , int.Parse(ConfigurationManager.AppSettings["APPLICATION_KEY"])
            '    , action
            '    , DateTime.Now // DateTime.UtcNow
            ');
        End Sub
    End Class
End Namespace
