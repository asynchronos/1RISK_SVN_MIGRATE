<%@ Control Language="VB" AutoEventWireup="false" CodeFile="MainMenuControl.ascx.vb"
    Inherits="aspx.userControl.MainMenuControl" %>
<asp:Panel ID="Panel1" runat="server" BackImageUrl="~/Controls/MainMenuControl/images/bg_yellow.gif">
    <table width="100%">
        <tr>
            <td align="left" rowspan="3" width="40%">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/Controls/MainMenuControl/images/logo_yellow.gif" />
            </td>
            <td align="center" width="60%">
                <table width="100%">
                    <tr>
                        <td>
                            <%--<div id="inProcessDiv" style="float: left;">
                                <asp:Label ID="label_InProcessJob" myClientId="label_InProcessJob" runat="server"
                                    Text="" Style="cursor: pointer;">
                                </asp:Label>
                                <asp:SqlDataSource ID="DS_InProcessJob" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                                    DataSourceMode="DataReader" SelectCommand="CA_REPORT.P_CA_IN_PROCESS_JOB" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="EMP_ID" SessionField="EMP_ID" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>--%>
                            <div id="loginDiv" style="float: right;">
                                <asp:LoginName ID="LoginName1" runat="server" Visible="false" />
                                <%  If Not IsNothing(Session.Item(SessionKeyConst.EMP_NAME)) Then
                                        Response.Write(Session.Item(SessionKeyConst.EMP_NAME) + ":" + Session.Item(SessionKeyConst.EMP_ID))
                                    End If
                                %>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <%--<div id="inProcessGroupDiv" style="float: left;">
                                <asp:Label ID="label_InProcessGroup" myClientId="label_InProcessGroup" runat="server"
                                    Text="" Style="cursor: pointer;"></asp:Label>
                                <asp:SqlDataSource ID="DS_InProcessGroup" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                                    DataSourceMode="DataReader" SelectCommand="CA_REPORT.P_CA_IN_PROCESS_TOTAL_BY_LEVEL" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="EMP_ID" SessionField="EMP_ID" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>--%>
                            <div id="dateDiv" style="float: right;">
                                <asp:Label ID="todayDateLabel" runat="server"></asp:Label>
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Panel>
<table style="width: 100%;" cellpadding="0" cellspacing="0" border="0">
    <tr style="font-size: small;">
        <td>
            <div class="chromestyle" id="chromemenu">
                <ul>
                    <li id="LoginStatusMenu" runat="server" style="white-space: nowrap;">
                        <asp:LoginStatus ID="LoginStatus1" runat="server" LogoutAction="Redirect" LogoutPageUrl="~/aspx/logout/logout.aspx" />
                    </li>
                    <li id="HomeMenu" runat="server" style="display: none; white-space: nowrap;">
                        <asp:HyperLink ID="HyperLink1" runat="server" Target="_self" ToolTip="หน้าแรก"
                           NavigateUrl="~/aspx/mainpage.aspx">Home</asp:HyperLink>
                    </li>
                    <li id="PortfolioMenu" runat="server" style="display: none; white-space: nowrap;">
                        <asp:HyperLink ID="PortfolioLink" runat="server" rel="DropPortfolioMenu" ToolTip="Portfolio"
                            NavigateUrl="JavaScript:void(0);">Portfolio</asp:HyperLink></li>
                    <li id="AboutCustomerMenu" runat="server" style="display: none; white-space: nowrap;">
                        <asp:HyperLink ID="AboutCustomerLink" runat="server" rel="DropAboutCustomerMenu"
                            ToolTip="เกี่ยวกับลูกค้า" NavigateUrl="JavaScript:void(0);">เกี่ยวกับลูกค้า</asp:HyperLink></li>
                    <li id="AnnalsCAMenu" runat="server" style="display: none; white-space: nowrap;">
                        <asp:HyperLink ID="AnnalsCALink" runat="server" rel="DropAnnalsCreditMenu" ToolTip="หนังสือสินเชื่อ(CA)"
                            NavigateUrl="JavaScript:void(0);">หนังสือสินเชื่อ(CA)</asp:HyperLink></li>
                    <li id="AnnalsMenu" runat="server" style="display: none; white-space: nowrap;">
                        <asp:HyperLink ID="AnnalsLink" runat="server" rel="DropAnnalsMenu" ToolTip="หนังสือทั่วไป"
                            NavigateUrl="JavaScript:void(0);">หนังสือทั่วไป</asp:HyperLink></li>
                    <li id="ReportMenu" runat="server" style="display: none; white-space: nowrap;">
                        <asp:HyperLink ID="ReportLink" runat="server" rel="DropReportMenu" ToolTip="รายงาน"
                            NavigateUrl="JavaScript:void(0);">รายงาน</asp:HyperLink></li>
               <%--     <li id="StopMenu" runat="server" style="display: none; white-space: nowrap;">
                        <asp:HyperLink ID="StopLink" runat="server" rel="DropStopMenu" ToolTip="SM Report"
                            NavigateUrl="JavaScript:void(0);">Stop Program</asp:HyperLink></li>      --%>
                    <li id="FinancialMenu" runat="server" style="display: none; white-space: nowrap;">
                        <asp:HyperLink ID="FinancialLink" runat="server" rel="DropFinancialMenu" ToolTip="Financial Data"
                            NavigateUrl="JavaScript:void(0);">Financial Program</asp:HyperLink></li>
                    <li id="AboutEmpMenu" runat="server" style="display: none; white-space: nowrap;">
                        <asp:HyperLink ID="AboutEmpLink" runat="server" Target="_self" ToolTip="ข้อมูลส่วนตัว"
                            NavigateUrl="~/aspx/employee/TbEmployee.aspx">ข้อมูลส่วนตัว</asp:HyperLink></li>
                    <li id="DownloadMenu" runat="server" style="display: none; white-space: nowrap;">
                        <asp:HyperLink ID="DownloadLink" runat="server" Target="_self" ToolTip="Download"
                            NavigateUrl="~/aspx/download/downloadPage.aspx">Download</asp:HyperLink></li>
                    <li id="ToolsMenu" runat="server" style="display: none; white-space: nowrap;">
                        <asp:HyperLink ID="ToolsLink" runat="server" rel="DropToolsMenu" ToolTip="Tools"
                            NavigateUrl="javascript:void(0)">Tools</asp:HyperLink></li>
                    <li id="AdminMenu" runat="server" style="display: none; white-space: nowrap;">
                        <asp:HyperLink ID="AdminLink" runat="server" rel="DropAdminMenu" ToolTip="Admin"
                            NavigateUrl="javascript:void(0)">Admin</asp:HyperLink></li>
                </ul>
            </div>
            <!--LoginStatus1 drop down menu -->
            <div id="DropLoginStatus1" class="dropmenudiv">
            </div>
            <!--PortfolioMenu drop down menu -->
            <div id="DropPortfolioMenu" class="dropmenudiv">
                <%--<asp:HyperLink ID="SummaryMenu" runat="server" Target="_self" ToolTip="Debt Summary"
                    NavigateUrl="~/aspx/portfolio/Summary.aspx">Debt Summary</asp:HyperLink>
                <span class="qmdividerx"></span>--%>
                <asp:HyperLink ID="CustomerPortMenu" runat="server" Target="_self" ToolTip="Customer Port"
                    NavigateUrl="~/aspx/customer/SmeCustomerByCM.aspx">Customer Port</asp:HyperLink>
                <asp:HyperLink ID="CustomerDetailMenu" runat="server" Target="_self" ToolTip="Customer Detail"
                    NavigateUrl="~/aspx/portfolio/smeCustomerDetail.aspx">Customer Detail</asp:HyperLink>
            </div>
            <!--AboutCustomerMenu drop down menu -->
            <div id="DropAboutCustomerMenu" class="dropmenudiv">
                <asp:HyperLink ID="SearchCustomerMenu" runat="server" Target="_self" ToolTip="ค้นหาลูกค้า"
                    NavigateUrl="~/aspx/customer/CustomerSearch.aspx">ค้นหาลูกค้า</asp:HyperLink>
                <span class="qmdividerx"></span>
                <asp:HyperLink ID="CusDetailMenu" runat="server" Target="_self" ToolTip="Detail"
                    NavigateUrl="~/aspx/customer/CustomerDetail.aspx">Detail</asp:HyperLink>
                <asp:HyperLink ID="CusDebtMenu" runat="server" Target="_self" ToolTip="ภาระหนี้"
                    NavigateUrl="~/aspx/customer/CustomerDebt.aspx">ภาระหนี้</asp:HyperLink>
                <asp:HyperLink ID="CusDebtPrevMenu" runat="server" Target="_self" ToolTip="ภาระหนี้ย้อนหลัง"
                    NavigateUrl="~/aspx/customer/CustomerDebtPrev.aspx">ภาระหนี้ย้อนหลัง</asp:HyperLink>
                <asp:HyperLink ID="CusClassDebtMenu" runat="server" Target="_self" ToolTip="ชั้นหนี้ย้อนหลัง/Rating"
                    NavigateUrl="~/aspx/customer/CustomerClassDebt.aspx">ชั้นหนี้ย้อนหลัง/Rating</asp:HyperLink>
                <asp:HyperLink ID="CusCollMenu" runat="server" Target="_self" ToolTip="รายละเอียดหลักประกัน"
                    NavigateUrl="~/aspx/customer/CustomerCollateral.aspx">รายละเอียดหลักประกัน</asp:HyperLink>
                <asp:HyperLink ID="CusCollPersonMenu" runat="server" Target="_self" ToolTip="ผู้คำประกัน"
                    NavigateUrl="~/aspx/customer/CustomerCollateralPerson.aspx">ผู้คำประกัน</asp:HyperLink>
                <asp:HyperLink ID="CusLawMenu" runat="server" Target="_self" ToolTip="รายละเอียดกฎหมาย"
                    NavigateUrl="~/aspx/customer/CustomerLaw.aspx">รายละเอียดกฎหมาย</asp:HyperLink>
                <span class="qmdividerx"></span>
                <asp:HyperLink ID="CusGroupMaganementMenu" runat="server" Target="_self" ToolTip="เพิ่ม/ลด/จัดกลุ่มลูกค้า SME"
                    NavigateUrl="~/aspx/customer/SmeGroupManagement.aspx">เพิ่ม/ลด/จัดกลุ่มลูกค้า SME</asp:HyperLink>
                <asp:HyperLink ID="CusFilterByCM" runat="server" Target="_self" ToolTip="ค้นหาลูกค้าตามรหัสพนักงาน"
                    NavigateUrl="~/aspx/customer/SmeCustomerByCM.aspx">ค้นหาลูกค้าตามรหัสพนักงาน</asp:HyperLink>
            </div>
            <!--AppointMenu drop down menu -->
            <div id="DropAppointMenu" class="dropmenudiv">
            </div>
            <!--AnnalsCreditMenu drop down menu -->
            <div id="DropAnnalsCreditMenu" class="dropmenudiv">
                <asp:HyperLink ID="CASearchMenu" runat="server" Target="_self" ToolTip="ค้นหาหนังสือสินเชื่อ"
                    NavigateUrl="~/aspx/annals/CASearch.aspx">ค้นหาหนังสือสินเชื่อ</asp:HyperLink>
                <span id="DropAnnalsCreditMenuSpan" runat="server" class="qmdividerx"></span>
                <asp:HyperLink ID="AnnalsCreditMenu" runat="server" Target="_self" ToolTip="เพิ่มหนังสือสินเชื่อ(CA)"
                    NavigateUrl="JavaScript:void(0);">เพิ่มหนังสือสินเชื่อ</asp:HyperLink>
            </div>
            <!--AnnalsMenu drop down menu -->
            <div id="DropAnnalsMenu" class="dropmenudiv">
                <asp:HyperLink ID="AnnalsSearchMenu" runat="server" Target="_self" ToolTip="ค้นหาหนังสือ"
                    NavigateUrl="~/aspx/annals/annalsSearch.aspx">ค้นหาหนังสือ</asp:HyperLink>
                <span class="qmdividerx"></span>
                <asp:HyperLink ID="AnnalsDetailMenu" runat="server" Target="_self" ToolTip="เพิ่มหนังสือทั่วไป"
                    NavigateUrl="JavaScript:void(0);">เพิ่มหนังสือทั่วไป</asp:HyperLink>
            </div>
            <!--AboutEmpMenu drop down menu -->
            <div id="DropAboutEmpMenu" class="dropmenudiv">
            </div>
            <!--Report drop down menu -->
            <div id="DropReportMenu" class="dropmenudiv">
                   <asp:HyperLink ID="ReportCaById" runat="server" Target="_self" ToolTip="รายงานสินเชื่อรายหนังสือ"
                    NavigateUrl="~/aspx/report/SelectReport.aspx?Reptype=cr">รายงานสินเชื่อรายหนังสือ</asp:HyperLink>
                <asp:HyperLink ID="ReportCaByCus" runat="server" Target="_self" ToolTip="รายงานสินเชื่อรายลูกค้า"
                    NavigateUrl="~/aspx/report/SelectReport.aspx?Reptype=crdt">รายงานสินเชื่อรายลูกค้า</asp:HyperLink>
                <asp:HyperLink ID="ReportInProcessCA" runat="server" Target="_self" ToolTip="รายงานหนังสือที่ยังไม่เสร็จ"
                    NavigateUrl="~/aspx/report/InProcessCA.aspx">รายงานหนังสือที่ยังไม่เสร็จ</asp:HyperLink>
                <asp:HyperLink ID="ReportFileCA" runat="server" Target="_self" ToolTip="ค้นหาไฟล์เอกสาร CA"
                    NavigateUrl="~/aspx/uploadfile/SearchUploadFile.aspx">ค้นหาไฟล์เอกสาร CA</asp:HyperLink>
                <asp:HyperLink ID="ReportCustomerEDW" runat="server" Target="_self" ToolTip="ค้นหาภาระหนี้รายวัน"
                    NavigateUrl="~/aspx/report/ReportEdwRiskMaxAgingDailyFact.aspx">ค้นหาภาระหนี้รายวัน</asp:HyperLink>
                <span class="qmdividerx"></span>
                <asp:HyperLink ID="ReportAgingMoreThan15" runat="server" Target="_self" ToolTip="รายงานข้อมูลลูกค้าที่ Aging มากกว่า 15 วัน"
                    NavigateUrl="~/aspx/report/reportaginglcicustomertdrnew.aspx">รายงานAgingมากกว่า15วัน</asp:HyperLink>
                <asp:HyperLink ID="ReportNPLMovement" runat="server" Target="_self" ToolTip="NPL Movement"
                    NavigateUrl="~/aspx/report/NPLMovementChart.aspx">NPL Movement Chart</asp:HyperLink>
                <span class="qmdividerx"></span>
                <asp:HyperLink ID="ReportOdUtilization" runat="server" Target="_self" ToolTip="รายงานสรุปการใช้วงเงินO/D"
                    NavigateUrl="~/aspx/report/OdUtilization24.aspx">รายงานสรุปการใช้วงเงินO/D</asp:HyperLink>
                <asp:HyperLink ID="ReportPN2OD" runat="server" Target="_self"
                    ToolTip="PN to OD" NavigateUrl="JavaScript:void(0);">PN TO OD</asp:HyperLink>
                <asp:HyperLink ID="ReportCustomerCimHightRisk" runat="server" Target="_self" ToolTip="Construction Draw Down"
                    NavigateUrl="~/aspx/report/ReportCustomerCimHightRisk.aspx">Construction Draw Down</asp:HyperLink>
              
            </div>
            <!--DownloadMenu drop down menu -->
            <div id="DropDownloadMenu" class="dropmenudiv">
            </div>
            <!--StopMenu drop down menu -->
<%--            <div id="DropStopMenu" class="dropmenudiv">
                <asp:HyperLink ID="StopProgramMenu" runat="server" Target="_self" ToolTip="Stop Program"
                    NavigateUrl="~/aspx/stop/stop_summary.aspx">Stop Program</asp:HyperLink>
                <asp:HyperLink ID="StopHistoryMenu" runat="server" Target="_self" ToolTip="Stop History"
                    NavigateUrl="~/aspx/stop/StopHistory.aspx">Stop History</asp:HyperLink>  
                 <asp:HyperLink ID="SMreportMenu" runat="server" Target="_self" ToolTip="SM Report"
                    NavigateUrl="~/aspx/stop/sm_history.aspx">SM Report</asp:HyperLink>
            </div>--%>
             <div id="DropFinancialMenu" class="dropmenudiv">
                <asp:HyperLink ID="FinancialProgramMenu" runat="server" Target="_self" ToolTip="Financial Program"
                    NavigateUrl="~/aspx/smes/financial_ca_list.aspx">Financial Program</asp:HyperLink>
            </div>
            <!--ToolsMenu drop down menu -->
            <div id="DropToolsMenu" class="dropmenudiv">
                <asp:HyperLink ID="CustomerSearchMenu" runat="server" Target="_self" ToolTip="Customer Search"
                    NavigateUrl="JavaScript:void(0);">Customer Search</asp:HyperLink>
                <asp:HyperLink ID="BranchSearchMenu" runat="server" Target="_self" ToolTip="Branch Search"
                    NavigateUrl="JavaScript:void(0);">Branch Search</asp:HyperLink>
                <asp:HyperLink ID="BusinessSearchMenu" runat="server" Target="_self" ToolTip="Business Search"
                    NavigateUrl="JavaScript:void(0);">Business Search</asp:HyperLink>
            </div>
            <!--AdminMenu drop down menu -->
            <div id="DropAdminMenu" class="dropmenudiv">
                <asp:HyperLink ID="AdminControllingLevelMenu" runat="server" Target="_self" ToolTip="Admin Controlling Level"
                    NavigateUrl="~/aspx/admin/AdminControllingLevel.aspx">Admin Controlling Level</asp:HyperLink>
                <asp:HyperLink ID="empmanageMenu" runat="server" Target="_self" ToolTip="Emp Manage"
                    NavigateUrl="~/aspx/admin/empmanage.aspx">Emp Manage</asp:HyperLink>
                <asp:HyperLink ID="RefreshCacheMenu" runat="server" Target="_self" ToolTip="Refresh Cache"
                    NavigateUrl="~/aspx/admin/refreshCache.aspx">Refresh Cache</asp:HyperLink>
                <asp:HyperLink ID="checkBrowserMenu" runat="server" Target="_self" ToolTip="Check Browser"
                    NavigateUrl="~/test/checkBrowser.htm">Check Browser</asp:HyperLink>
                <asp:HyperLink ID="logViewMenu" runat="server" Target="_self" ToolTip="Log" NavigateUrl="~/aspx/admin/log.aspx">Log</asp:HyperLink>
                <asp:HyperLink ID="roleManageMenu" runat="server" Target="_self" ToolTip="Role Manage"
                    NavigateUrl="~/aspx/role/roleFilter.aspx">
                    Role Manage
                </asp:HyperLink>
                <asp:HyperLink ID="HyperLinkCAApproveList" runat="server" Target="_self" ToolTip="CA Approve List"
                    NavigateUrl="~/aspx/admin/CAApproveList.aspx">
                    CA Approve List<asp:Image ID="Image2" runat="server" ImageUrl="~/images/ani_new.gif" />
                </asp:HyperLink>
            </div>
        </td>
    </tr>
</table>
