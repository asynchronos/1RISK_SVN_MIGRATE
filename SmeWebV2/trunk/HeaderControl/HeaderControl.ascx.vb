Imports System.Diagnostics


Partial Class HeaderMainMenuControl_MainMenuControl
    Inherits System.Web.UI.UserControl

#Region "custom code"

    'สำหรับใช้เวลา edit menu ด้วย quick menu
    Private Sub showMenu()
        PortfolioMenu.Style.Item("display") = "inline"
        AboutCustomerMenu.Style.Item("display") = "none"

        AnnalsCAMenu.Style.Item("display") = "inline"
        AnnalsMenu.Style.Item("display") = "inline"
        ReportMenu.Style.Item("display") = "inline"
        StopMenu.Style.Item("display") = "inline"
        AboutEmpMenu.Style.Item("display") = "inline"
        DownloadMenu.Style.Item("display") = "inline"
    End Sub

    Private Sub authenFormWithCookie()
        'เช็ค roles จาก cookie
        'Extract the forms authentication cookie
        Dim cookieName As String = FormsAuthentication.FormsCookieName
        Dim authCookie As HttpCookie = Context.Request.Cookies(cookieName)
        If IsNothing(authCookie) Then
            'There is no authentication cookie.
            Return 'ออกจาก sub
        End If


        Dim authTicket As FormsAuthenticationTicket = Nothing
        Try
            authTicket = FormsAuthentication.Decrypt(authCookie.Value)
        Catch ex As Exception
            'Log exception details (omitted for simplicity)
            Return 'ออกจาก sub
        End Try

        If IsNothing(authTicket) Then
            'Cookie failed to decrypt.
            Return 'ออกจาก sub
        End If

        'When the ticket was created, the UserData property was assigned a pipe delimited string of role names.
        Dim roles As String() = authTicket.UserData.Split(New Char() {"|"})

        'ถ้ามี roles อะไรก็แล้วแต่ อย่างน้อย1 roles ให้แสดงเมนู
        If IsNothing(roles) Or IsNothing(Session.Item(SessionKeyConst.EMP_ID)) Then
            Response.Redirect(Page.ResolveUrl("~/aspx/logout/logout.aspx"))
        Else
            showMenu()

            'check ว่ามี role Administrator หรือไม่
            If HttpCookieUtil.hasRolesId(authCookie, RoleIdConst.R_ADMIN) Then
                'ถ้าเป็น admin ให้แสดงเมนู admin
                AdminMenu.Style.Item("display") = "inline"
            End If

            ''check ว่ามี role RM USER หรือไม่
            'If HttpCookieUtil.hasRolesId(authCookie, RoleIdConst.R_RM_USER) Then
            '    'ซ่อน MainMenu ดังนี้
            '    PortfolioMenu.Style.Item("display") = "none"
            '    'AboutCustomerMenu.Style.Item("display") = "none"
            '    'AppointMenu.Style.Item("display") = "none"
            '    AboutCustomerMenu.Style.Item("display") = "none"
            '    AnnalsMenu.Style.Item("display") = "none"
            '    'AnnalsCAMenu.Style.Item("display") = "none"
            '    'ReportMenu.Style.Item("display") = "none"

            '    'ซ่อน span ของ DropAnnalsCreditMenu
            '    DropAnnalsCreditMenuSpan.Style.Item("display") = "none"
            '    'ซ่อน sub menu เพิ่มหนังสือสินเชื่อ
            '    AnnalsCreditMenu.Style.Item("display") = "none"
            'End If
        End If

    End Sub

#End Region

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'เช็ค user role จาก cookie
        authenFormWithCookie()

        'set today date label
        todayDateLabel.Text = ConvertUtil.getDateFormatWithCulture(Date.Today, Application.Item(ApplicationKeyConst.App_Culture), ConvertUtil.DateWithCultureEnum.FullDate)

        'startchrome menu
        Page.ClientScript.RegisterStartupScript(Me.GetType(), "startchrome", "cssdropdown.startchrome(""chromemenu"");", True)

        'Add javascript สำหรับการเพิ่มหนังสือเข้า/ออก
        AnnalsDetailMenu.Attributes.Add("onclick", "popup = window.open('" + Page.ResolveUrl("~/aspx/annals/annalsDetail.aspx") + "','InsertPopup','toolbar=No,width=450,height=500,resizable=no,scrollbars=yes');popup.focus();")
        'Add javascript สำหรับการเพิ่มหนังสือสินเชื่อ
        AnnalsCreditMenu.Attributes.Add("onclick", "creditPopup = window.open('" + Page.ResolveUrl("~/aspx/annals/annalsCredit.aspx") + "','creditPopup','toolbar=No,resizable=yes,scrollbars=yes');creditPopup.focus();")

    End Sub


End Class
