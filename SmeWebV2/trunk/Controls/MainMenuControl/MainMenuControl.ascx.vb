Imports System.Diagnostics
Imports log4net

Namespace aspx.userControl

    Partial Class MainMenuControl
        Inherits System.Web.UI.UserControl

        Private Shared ReadOnly log As ILog = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType)
        Private Shared isDebugEnabled As Boolean = log.IsDebugEnabled

#Region "custom code"

        '����Ѻ������ edit menu ���� quick menu
        Private Sub showMenu()
            HomeMenu.Style.Item("display") = "inline"

            PortfolioMenu.Style.Item("display") = "inline"
            'SummaryMenu.Style.Item("display") = "none"
            AboutCustomerMenu.Style.Item("display") = "none"

            AnnalsCAMenu.Style.Item("display") = "inline"
            AnnalsMenu.Style.Item("display") = "inline"
            ReportMenu.Style.Item("display") = "inline"
            FinancialMenu.Style.Item("display") = "inline"
            AboutEmpMenu.Style.Item("display") = "inline"
            DownloadMenu.Style.Item("display") = "inline"
            ToolsMenu.Style.Item("display") = "inline"

            '��͹�����;�蹾�礢����������͹
            ReportPN2OD.Style.Item("display") = "none"
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

            If isDebugEnabled Then
                log.Debug("Roles:" + authTicket.UserData)
            End If

            '����� roles ���á������� ���ҧ����1 roles ����ʴ�����
            If IsNothing(roles) Or IsNothing(Session.Item(SessionKeyConst.EMP_ID)) Then
                Response.Redirect(Page.ResolveUrl("~/aspx/logout/logout.aspx"))
            Else
                showMenu()

                'check ����� role Administrator �������
                If HttpCookieUtil.hasRolesId(authCookie, RoleIdConst.R_ADMIN) Then
                    '����� admin ����ʴ����� admin
                    AdminMenu.Style.Item("display") = "inline"
                    '���ٹ������մҵ���Ѿവ����
                    'SummaryMenu.Style.Item("display") = "inline"
                End If

                'check ����� role RM �������
                If HttpCookieUtil.hasRolesId(authCookie, RoleIdConst.R_RM_USER) Then
                    '����� RM ��͹�ҧ����
                    HomeMenu.Style.Item("display") = "none"
                    PortfolioMenu.Style.Item("display") = "none"

                    AnnalsCAMenu.Style.Item("display") = "none"
                    AnnalsMenu.Style.Item("display") = "none"
                    FinancialMenu.Style.Item("display") = "none"
                    ToolsMenu.Style.Item("display") = "none"

                    'sub menu
                    'ReportCaById.Style.Item("display") = "none"
                    'ReportCaByCus.Style.Item("display") = "none"
                    ReportInProcessCA.Style.Item("display") = "none"
                    'ReportFileCA.Style.Item("display") = "none"
                    ReportCustomerEDW.Style.Item("display") = "none"
                    ReportAgingMoreThan15.Style.Item("display") = "none"
                    ReportNPLMovement.Style.Item("display") = "none"
                    ReportOdUtilization.Style.Item("display") = "none"
                    ReportPN2OD.Style.Item("display") = "none"
                End If

                'check ����� role audit attach �������
                If HttpCookieUtil.hasRolesId(authCookie, RoleIdConst.AUDIT_ATTACH) Then
                    HomeMenu.Style.Item("display") = "none"
                    PortfolioMenu.Style.Item("display") = "none"

                    AnnalsCAMenu.Style.Item("display") = "none"
                    AnnalsMenu.Style.Item("display") = "none"
                    'ReportMenu.Style.Item("display") = "none"
                    FinancialMenu.Style.Item("display") = "none"
                    DownloadMenu.Style.Item("display") = "none"
                    ToolsMenu.Style.Item("display") = "none"

                    'sub menu
                    ReportCaById.Style.Item("display") = "none"
                    ReportCaByCus.Style.Item("display") = "none"
                    ReportInProcessCA.Style.Item("display") = "none"
                    'ReportFileCA.Style.Item("display") = "none"
                    ReportCustomerEDW.Style.Item("display") = "none"
                    ReportAgingMoreThan15.Style.Item("display") = "none"
                    ReportNPLMovement.Style.Item("display") = "none"
                    ReportOdUtilization.Style.Item("display") = "none"
                    ReportPN2OD.Style.Item("display") = "none"

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

                'If HttpCookieUtil.hasRolesId(authCookie, RoleIdConst.R_CM_USER) Or HttpCookieUtil.hasRolesId(authCookie, RoleIdConst.R_ADMIN) Then
                '    ' ���ͺ�к� ���ͧ�ҡ server ��͹��ҧ����ҡ�ҡ process ���֧���ͧ���֧��§�����á��Ѻ ��ǹ���駵�� � ����֧�ҡ session ᷹   23/11/2009
                '    ' refactor at 2/8/2010
                '    If Session.Item("label_InProcessGroup") = "" Then
                '        '���� label �ҹ��ҧ 1 SEP 2009
                '        label_InProcessJob.Text = bindingTotalProcessCA(DS_InProcessJob, "��ҹ�ѧ�� CA ����������� : ")
                '        '�ҹ��ҧ�ͧ�����
                '        label_InProcessGroup.Text = bindingTotalProcessCA(DS_InProcessGroup, "��§ҹ�ͧ��ҹ�ѧ�� CA ����������� : ")

                '        'add ŧ Session
                '        Session.Item("label_InProcessJob") = label_InProcessJob.Text
                '        Session.Item("label_InProcessGroup") = label_InProcessGroup.Text

                '        'add tooltip
                '        label_InProcessGroup.ToolTip = "update ���������к�"
                '        label_InProcessJob.ToolTip = "update ���������к�"
                '    Else
                '        label_InProcessGroup.Text = Session.Item("label_InProcessGroup")
                '        label_InProcessJob.Text = Session.Item("label_InProcessJob")
                '    End If

                'End If

            End If

        End Sub

        'Protected Function bindingTotalProcessCA(ByVal dataSource As SqlDataSource, ByVal prefixText As String) As String
        '    Dim result As String = String.Empty
        '    Dim reader As Data.SqlClient.SqlDataReader = Nothing

        '    Try
        '        reader = DirectCast(dataSource.Select(DataSourceSelectArguments.Empty), Data.SqlClient.SqlDataReader)

        '        If reader.HasRows Then
        '            reader.Read()
        '            result = prefixText + reader.Item("ToTalProcessCA").ToString() + " CA"
        '        End If
        '    Catch ex As Exception
        '        result = "Error:" + ex.Message
        '    Finally
        '        If Not IsNothing(reader) Then
        '            If Not reader.IsClosed Then
        '                reader.Close()
        '            End If
        '        End If
        '    End Try

        '    Return result
        'End Function

#End Region

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            '�� user role �ҡ cookie
            authenFormWithCookie()

            'set today date label
            todayDateLabel.Text = ConvertUtil.getDateFormatWithCulture(Date.Today, Application.Item(ApplicationKeyConst.App_Culture), ConvertUtil.DateWithCultureEnum.FullDate)
            'set version release label
            verLabel.Text = ConfigurationManager.AppSettings("ReleaseNote").ToString()

            'startchrome menu
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "startchrome", "cssdropdown.startchrome(""chromemenu"");", True)

            'Add javascript ����Ѻ�������˹ѧ������/�͡
            AnnalsDetailMenu.Attributes.Add("onclick", "popup = window.open('" + Page.ResolveUrl("~/aspx/annals/annalsDetail.aspx") + "','InsertPopup','toolbar=No,width=450,height=500,resizable=no,scrollbars=yes');popup.focus();")
            'Add javascript ����Ѻ�������˹ѧ����Թ����
            AnnalsCreditMenu.Attributes.Add("onclick", "creditPopup = window.open('" + Page.ResolveUrl("~/aspx/annals/annalsCredit.aspx") + "','creditPopup','toolbar=No,resizable=yes,scrollbars=yes');creditPopup.focus();")
            'Add javascript ����Ѻ PN TO OD
            ReportPN2OD.Attributes.Add("onclick", "PN2ODPopup = window.open('" + Page.ResolveUrl("~/aspx/report/OD_Nop/Movement_PN_to_OD_Jan11.xls") + "','PN2ODPopup','toolbar=Yes,resizable=yes,scrollbars=yes');PN2ODPopup.focus();")
            'Add javascript ����Ѻ CustomerSearchMenu
            CustomerSearchMenu.Attributes.Add("onclick", "cusSearchPopup = window.open('" + Page.ResolveUrl("~/aspx/customer/Customer.aspx") + "','cusSearchPopup','toolbar=No,width=400,height=380,resizable=no,scrollbars=yes');cusSearchPopup.focus();")
            'Add javascript ����Ѻ BranchSearchMenu
            BranchSearchMenu.Attributes.Add("onclick", "branchSearchPopup = window.open('" + Page.ResolveUrl("~/aspx/customer/Branch.aspx") + "','branchSearchPopup','toolbar=No,width=430,height=380,resizable=no,scrollbars=yes');branchSearchPopup.focus();")
            'Add javascript ����Ѻ BusinessSearchMenu
            BusinessSearchMenu.Attributes.Add("onclick", "businessSearchPopup = window.open('" + Page.ResolveUrl("~/aspx/customer/BusinessType.aspx") + "','businessSearchPopup','toolbar=No,width=1024,height=300,resizable=yes,scrollbars=yes');businessSearchPopup.focus();")
        End Sub

        'Protected Sub label_InProcessJob_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles label_InProcessJob.Load
        '    DirectCast(sender, Label).Attributes.Add("onclick", "window.location.replace('" + Page.ResolveUrl("~/aspx/report/InProcessCA.aspx?single=yes") + "');")
        'End Sub

        'Protected Sub label_InProcessGroup_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles label_InProcessGroup.Load
        '    DirectCast(sender, Label).Attributes.Add("onclick", "window.location.replace('" + Page.ResolveUrl("~/aspx/report/InProcessCA.aspx") + "');")
        'End Sub
    End Class
End Namespace

