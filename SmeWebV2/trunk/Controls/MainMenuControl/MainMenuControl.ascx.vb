Imports System.Diagnostics
Imports log4net

Namespace aspx.userControl

    Partial Class MainMenuControl
        Inherits System.Web.UI.UserControl

        Private Shared ReadOnly log As ILog = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType)
        Private Shared isDebugEnabled As Boolean = log.IsDebugEnabled

#Region "custom code"

        'สำหรับใช้เวลา edit menu ด้วย quick menu
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

            'ซ่อนเมนูรอพี่นพเช็คข้อมูลใหม่ก่อน
            ReportPN2OD.Style.Item("display") = "none"
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

            If isDebugEnabled Then
                log.Debug("Roles:" + authTicket.UserData)
            End If

            'ถ้ามี roles อะไรก็แล้วแต่ อย่างน้อย1 roles ให้แสดงเมนู
            If IsNothing(roles) Or IsNothing(Session.Item(SessionKeyConst.EMP_ID)) Then
                Response.Redirect(Page.ResolveUrl("~/aspx/logout/logout.aspx"))
            Else
                showMenu()

                'check ว่ามี role Administrator หรือไม่
                If HttpCookieUtil.hasRolesId(authCookie, RoleIdConst.R_ADMIN) Then
                    'ถ้าเป็น admin ให้แสดงเมนู admin
                    AdminMenu.Style.Item("display") = "inline"
                    'เมนูนี้ไม่มีดาต้าอัพเดตแล้ว
                    'SummaryMenu.Style.Item("display") = "inline"
                End If

                'check ว่ามี role RM หรือไม่
                If HttpCookieUtil.hasRolesId(authCookie, RoleIdConst.R_RM_USER) Then
                    'ถ้าเป็น RM ซ่อนบางเมนู
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

                'check ว่ามี role audit attach หรือไม่
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

                'If HttpCookieUtil.hasRolesId(authCookie, RoleIdConst.R_CM_USER) Or HttpCookieUtil.hasRolesId(authCookie, RoleIdConst.R_ADMIN) Then
                '    ' ทดสอบระบบ เนื่องจาก server ค่อนข้างช้ามากจาก process นี้จึงทดลองให้ดึงเพียงครั้งแรกครับ ส่วนครั้งต่อ ๆ ไปให้ดึงจาก session แทน   23/11/2009
                '    ' refactor at 2/8/2010
                '    If Session.Item("label_InProcessGroup") = "" Then
                '        'เพิ่ม label งานค้าง 1 SEP 2009
                '        label_InProcessJob.Text = bindingTotalProcessCA(DS_InProcessJob, "ท่านยังมี CA ที่ทำไม่เสร็จ : ")
                '        'งานค้างของกลุ่ม
                '        label_InProcessGroup.Text = bindingTotalProcessCA(DS_InProcessGroup, "สายงานของท่านยังมี CA ที่ทำไม่เสร็จ : ")

                '        'add ลง Session
                '        Session.Item("label_InProcessJob") = label_InProcessJob.Text
                '        Session.Item("label_InProcessGroup") = label_InProcessGroup.Text

                '        'add tooltip
                '        label_InProcessGroup.ToolTip = "update เมื่อเข้าระบบ"
                '        label_InProcessJob.ToolTip = "update เมื่อเข้าระบบ"
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
            'เช็ค user role จาก cookie
            authenFormWithCookie()

            'set today date label
            todayDateLabel.Text = ConvertUtil.getDateFormatWithCulture(Date.Today, Application.Item(ApplicationKeyConst.App_Culture), ConvertUtil.DateWithCultureEnum.FullDate)
            'set version release label
            verLabel.Text = ConfigurationManager.AppSettings("ReleaseNote").ToString()

            'startchrome menu
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "startchrome", "cssdropdown.startchrome(""chromemenu"");", True)

            'Add javascript สำหรับการเพิ่มหนังสือเข้า/ออก
            AnnalsDetailMenu.Attributes.Add("onclick", "popup = window.open('" + Page.ResolveUrl("~/aspx/annals/annalsDetail.aspx") + "','InsertPopup','toolbar=No,width=450,height=500,resizable=no,scrollbars=yes');popup.focus();")
            'Add javascript สำหรับการเพิ่มหนังสือสินเชื่อ
            AnnalsCreditMenu.Attributes.Add("onclick", "creditPopup = window.open('" + Page.ResolveUrl("~/aspx/annals/annalsCredit.aspx") + "','creditPopup','toolbar=No,resizable=yes,scrollbars=yes');creditPopup.focus();")
            'Add javascript สำหรับ PN TO OD
            ReportPN2OD.Attributes.Add("onclick", "PN2ODPopup = window.open('" + Page.ResolveUrl("~/aspx/report/OD_Nop/Movement_PN_to_OD_Jan11.xls") + "','PN2ODPopup','toolbar=Yes,resizable=yes,scrollbars=yes');PN2ODPopup.focus();")
            'Add javascript สำหรับ CustomerSearchMenu
            CustomerSearchMenu.Attributes.Add("onclick", "cusSearchPopup = window.open('" + Page.ResolveUrl("~/aspx/customer/Customer.aspx") + "','cusSearchPopup','toolbar=No,width=400,height=380,resizable=no,scrollbars=yes');cusSearchPopup.focus();")
            'Add javascript สำหรับ BranchSearchMenu
            BranchSearchMenu.Attributes.Add("onclick", "branchSearchPopup = window.open('" + Page.ResolveUrl("~/aspx/customer/Branch.aspx") + "','branchSearchPopup','toolbar=No,width=430,height=380,resizable=no,scrollbars=yes');branchSearchPopup.focus();")
            'Add javascript สำหรับ BusinessSearchMenu
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

