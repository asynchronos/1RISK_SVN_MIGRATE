Imports log4net

Partial Class Login
    Inherits aspx.MyPageClass

    Private Shared ReadOnly log As ILog = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType)
    Private Shared ReadOnly isDebugEnabled As Boolean = log.IsDebugEnabled

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsNothing(Me.IsPostBack) Then
            Dim authTicket As FormsAuthenticationTicket = Me.getAuthTicket()

            'ถ้าถูก redirect มาหน้านี้แล้วมี ReturnUrl แสดงว่าไม่มีสิทธิ์ดูข้อมูลหน้าที่เรียกหรือ Server timeout
            If (Me.hasQueryString("ReturnUrl")) Then
                If Not IsNothing(authTicket) Then
                    FailureText.Text = "คุณไม่มีสิทธิ์ในการดูข้อมูลนี้"
                Else
                    FailureText.Text = "คุณไม่ได้ใช้งานนานเกินกว่า 30 นาที<br />กรุณา Login ใหม่อีกครั้ง"
                End If
            Else 'แสดงว่าไม่ได้ถูก redirect มา
                'ทำการเคลียร์ cookie ที่ค้างอยู่(ถ้ามี)
                If Not IsNothing(authTicket) Then
                    Dim username = authTicket.Name

                    FormsAuthentication.SignOut()
                    Session.Abandon()
                    Context.Request.Cookies.Clear()

                    log.Info(username + " logout.")
                End If
            End If
        End If
    End Sub

    Protected Sub LoginButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LoginButton.Click
        Dim client As New UserServiceReference.UserServiceClient()
        Dim result As UserServiceReference.UserModel = client.Authenticate(UserName.Text, Password.Text, _
                                                                           ConfigurationManager.AppSettings("APPLICATION_NAME"))

        If IsNothing(result) Then
            FailureText.Text = "Authenticate fail : Invalid username or password"
        Else
            If (result.RoleList.Count > 0) Then
                'Concat RoleList
                Dim roles As String = String.Empty

                For Each role As UserServiceReference.RoleModel In result.RoleList
                    roles = roles & "|" & role.ROLE_KEY
                Next
                'ตัด | ตัวแรกออก
                roles = roles.Substring(1)

                'Create the authentication ticket.
                Dim authTicket As New FormsAuthenticationTicket( _
                    1, result.EMP_ID, DateTime.Now, DateTime.Now.AddMinutes(30), False, _
                    roles)

                'Now encrypt the ticket.
                Dim encryptedTicket As String = FormsAuthentication.Encrypt(authTicket)

                'Create a cookie and add the encrypted ticket to the cookie as data.
                Dim authCookie As HttpCookie = New HttpCookie(FormsAuthentication.FormsCookieName, _
                    encryptedTicket)
                'set authCookie Expires
                authCookie.Expires = authTicket.Expiration

                'Add the cookie to the outgoing cookies collection.
                Response.Cookies.Add(authCookie)

                'Redirect the user to the originally requested page
                Response.Redirect(FormsAuthentication.GetRedirectUrl(result.EMP_ID, False))

                'Insert Log
                If (isDebugEnabled) Then

                    log.Info(result.EMP_ID + " login.")
                End If
            Else

                FailureText.Text = "Authorize fail : Invalid roles"
            End If
        End If
    End Sub
End Class
