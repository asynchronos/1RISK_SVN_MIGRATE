Imports System.Diagnostics


Partial Class HeaderMainMenuControl_MainMenuControl
    Inherits System.Web.UI.UserControl

#Region "custom code"

    '����Ѻ������ edit menu ���� quick menu
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
        '�� roles �ҡ cookie
        'Extract the forms authentication cookie
        Dim cookieName As String = FormsAuthentication.FormsCookieName
        Dim authCookie As HttpCookie = Context.Request.Cookies(cookieName)
        If IsNothing(authCookie) Then
            'There is no authentication cookie.
            Return '�͡�ҡ sub
        End If


        Dim authTicket As FormsAuthenticationTicket = Nothing
        Try
            authTicket = FormsAuthentication.Decrypt(authCookie.Value)
        Catch ex As Exception
            'Log exception details (omitted for simplicity)
            Return '�͡�ҡ sub
        End Try

        If IsNothing(authTicket) Then
            'Cookie failed to decrypt.
            Return '�͡�ҡ sub
        End If

        'When the ticket was created, the UserData property was assigned a pipe delimited string of role names.
        Dim roles As String() = authTicket.UserData.Split(New Char() {"|"})

        '����� roles ���á������� ���ҧ����1 roles ����ʴ�����
        If IsNothing(roles) Or IsNothing(Session.Item(SessionKeyConst.EMP_ID)) Then
            Response.Redirect(Page.ResolveUrl("~/aspx/logout/logout.aspx"))
        Else
            showMenu()

            'check ����� role Administrator �������
            If HttpCookieUtil.hasRolesId(authCookie, RoleIdConst.R_ADMIN) Then
                '����� admin ����ʴ����� admin
                AdminMenu.Style.Item("display") = "inline"
            End If

            ''check ����� role RM USER �������
            'If HttpCookieUtil.hasRolesId(authCookie, RoleIdConst.R_RM_USER) Then
            '    '��͹ MainMenu �ѧ���
            '    PortfolioMenu.Style.Item("display") = "none"
            '    'AboutCustomerMenu.Style.Item("display") = "none"
            '    'AppointMenu.Style.Item("display") = "none"
            '    AboutCustomerMenu.Style.Item("display") = "none"
            '    AnnalsMenu.Style.Item("display") = "none"
            '    'AnnalsCAMenu.Style.Item("display") = "none"
            '    'ReportMenu.Style.Item("display") = "none"

            '    '��͹ span �ͧ DropAnnalsCreditMenu
            '    DropAnnalsCreditMenuSpan.Style.Item("display") = "none"
            '    '��͹ sub menu ����˹ѧ����Թ����
            '    AnnalsCreditMenu.Style.Item("display") = "none"
            'End If
        End If

    End Sub

#End Region

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        '�� user role �ҡ cookie
        authenFormWithCookie()

        'set today date label
        todayDateLabel.Text = ConvertUtil.getDateFormatWithCulture(Date.Today, Application.Item(ApplicationKeyConst.App_Culture), ConvertUtil.DateWithCultureEnum.FullDate)

        'startchrome menu
        Page.ClientScript.RegisterStartupScript(Me.GetType(), "startchrome", "cssdropdown.startchrome(""chromemenu"");", True)

        'Add javascript ����Ѻ�������˹ѧ������/�͡
        AnnalsDetailMenu.Attributes.Add("onclick", "popup = window.open('" + Page.ResolveUrl("~/aspx/annals/annalsDetail.aspx") + "','InsertPopup','toolbar=No,width=450,height=500,resizable=no,scrollbars=yes');popup.focus();")
        'Add javascript ����Ѻ�������˹ѧ����Թ����
        AnnalsCreditMenu.Attributes.Add("onclick", "creditPopup = window.open('" + Page.ResolveUrl("~/aspx/annals/annalsCredit.aspx") + "','creditPopup','toolbar=No,resizable=yes,scrollbars=yes');creditPopup.focus();")

    End Sub


End Class
