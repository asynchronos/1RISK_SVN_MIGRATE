
Imports Microsoft.VisualBasic
Imports log4net

Namespace aspx
    Public MustInherit Class MyPageClass
        Inherits System.Web.UI.Page

        Private Shared ReadOnly log As ILog = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType)
        Private Shared ReadOnly isDebugEnabled As Boolean = log.IsDebugEnabled

        'constructor
        Public Sub MyPageClass()

        End Sub

        Protected Function hasQueryString(ByVal name As String) As Boolean
            Return DirectCast(IIf(IsNothing(Request.QueryString.Item(name)), False, True), Boolean)
        End Function

        Protected Function getQueryString(ByVal name As String) As String
            Return DirectCast(IIf(hasQueryString(name), Request.QueryString.Item(name), String.Empty), String)
        End Function

        Protected Function getAuthTicket() As FormsAuthenticationTicket
            Dim authTicket As FormsAuthenticationTicket = Nothing

            Dim authCookie As HttpCookie = Context.Request.Cookies(FormsAuthentication.FormsCookieName)

            Try
                authTicket = FormsAuthentication.Decrypt(authCookie.Value)
            Catch argEx As ArgumentException
                log.Error(argEx.Message, argEx)
            Catch ex As Exception
                log.Error(ex.Message, ex)
            End Try

            Return authTicket
        End Function

        Protected Sub logActivity(ByVal action As String)
            'Only proceed if the user is authenticated
            If Request.IsAuthenticated Then
                If Not IsNothing(User) Then
                    'call web service for log activity
                    Using userClin As UserServiceReference.UserServiceClient = New UserServiceReference.UserServiceClient()

                        userClin.updateUserActivity(User.Identity.Name _
                                                    , Integer.Parse(ConfigurationManager.AppSettings("APPLICATION_KEY")) _
                                                    , action _
                                                    , DateTime.Now)

                    End Using
                End If
            End If

        End Sub
    End Class
End Namespace