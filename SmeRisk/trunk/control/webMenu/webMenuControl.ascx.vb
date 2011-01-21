Imports log4net

Namespace control.webMenu
    Partial Class WebMenuControl
        Inherits System.Web.UI.UserControl

        Private Shared ReadOnly log As ILog = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType)
        Private Shared ReadOnly isDebugEnabled As Boolean = log.IsDebugEnabled

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            'Only procees if the user is authenticated
            If (Request.IsAuthenticated) Then
                Try
                    Literal_MM.Text = Session("MM")
                    Literal_MS.Text = Session("MS")
                Catch ex As Exception
                    Literal_MM.Text = String.Empty
                    Literal_MS.Text = String.Empty
                End Try

                'session ไม่มีค่าโหลดเมนูจาก web service
                If (Literal_MM.Text.Trim().Equals(String.Empty)) _
                    Or (Literal_MS.Text.Trim().Equals(String.Empty)) Then

                    Dim authTicket As FormsAuthenticationTicket = Me.getAuthTicket()

                    If Not IsNothing(authTicket) Then
                        Using menuClin As MenuServiceReference.MenuServiceClient = New MenuServiceReference.MenuServiceClient()
                            Literal_MM.Text = menuClin.getMainMenu(authTicket.UserData _
                                                                   , "|" _
                                                                   , ConfigurationManager.AppSettings("APPLICATION_NAME") _
                                                                   , Page.ResolveUrl("~"))
                            Literal_MS.Text = menuClin.getSubMenu(authTicket.UserData _
                                                                   , "|" _
                                                                   , ConfigurationManager.AppSettings("APPLICATION_NAME") _
                                                                   , Page.ResolveUrl("~"))
                        End Using
                    End If

                End If

            End If
        End Sub

        Protected Sub LoginStatus_LoggingOut(ByVal sender As Object, ByVal e As LoginCancelEventArgs)
            Dim username As String = String.Empty
            Dim authTicket As FormsAuthenticationTicket = Me.getAuthTicket()

            If Not IsNothing(authTicket) Then
                'เก็บค่า EMP_ID เอาไว้ก่อน
                username = authTicket.Name

                FormsAuthentication.SignOut()
                Session.RemoveAll()
                Session.Abandon()
                Context.Request.Cookies.Clear()

                log.Info(username & " logout.")
            End If
        End Sub

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
    End Class
End Namespace
