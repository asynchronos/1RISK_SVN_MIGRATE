<%@ Page Title="First Page" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false"
    CodeFile="mainpage.aspx.vb" Inherits="aspx_mainpage" %>

<%@ Register Src="../Controls/Chart/Chart.ascx" TagName="Chart" TagPrefix="uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .navy
        {
            background-color: Lime;
            color: Navy;
        }
        .red
        {
            background-color: Aqua;
            color: Red;
        }
        .individualJob
        {
            background-color: Red;
        }
        .groupJob
        {
            background-color: Yellow;
        }
        #divDoc table
        {
            margin: 0px;
            padding: 0px;
            font-size: medium;
        }
        .style1
        {
            font-size: small;
        }
    </style>
    <script type="text/javascript">
        function setValueToDOM(domObj, value) {
            if (domObj.tagName.toLowerCase() == 'input') {
                domObj.value = value;
            } else if (domObj.tagName.toLowerCase() == 'div'
                        || domObj.tagName.toLowerCase() == 'span') {
                domObj.innerHTML = value;
            } else {
                alert("setValueToDOM fail.[" + domObj.id + ":" + value + "]");
                throw "setValueToDOM fail.[" + domObj.id + ":" + value + "]";
            }
        }

        //result - this contains any values returned from my method. In this case it will be the id of the item that was inserted.
        //userContext - this is an optional item that can be passed into the original call to the method and will just be passed on to the callback method. I am not using this parameter in this situation
        //methodName - this is the name of the method that was called which resulted in the OnSucceeded method being called. In my case, this will be the string "GetCustomersFullNameByCif"
        function onSuccess(result, userContext, methodName) {
            var targetElement = Ext.select(userContext).first();

            //เช็คว่ามี Element นี้หรือไม่
            if (targetElement) {//ถ้ามี Element นี้
                if (result.status == "success") {
                    setValueToDOM(targetElement.dom, result.detail);
                } else {
                    alert(result.detail);
                    setValueToDOM(targetElement.dom, methodName + " failed.");
                }
            } else {
                throw userContext + " not found.";
            }
        }

        function onFailed(error, userContext, methodName) {
            //alert(error.constructor);
            if (error.get_statusCode() != 0)
                alert(methodName + " error:" + error.get_statusCode());
            //alert(error.get_message());
        }

        Ext.onReady(function () {
            var empIdHF = Ext.select("[ExtId=Hidden_EMP_ID]").first();

            //            if (empIdHF.dom.value) {
            //                alert(empIdHF.dom.value);
            //            } else {
            //                alert("No Value");
            //            }

            var service = new SmeWeb.CAWCFService();
            service.CountCovenant(empIdHF.dom.value, 'yes', onSuccess, onFailed, '[ExtId=TotalCovenantSingleDiv]');
            service.CountCovenant(empIdHF.dom.value, 'no', onSuccess, onFailed, '[ExtId=TotalCovenantGroupDiv]');
            service.getInProcessJob(empIdHF.dom.value, onSuccess, onFailed, '[ExtId=TotalCAInProcessSingleDiv]');
            service.getInProcessGroup(empIdHF.dom.value, onSuccess, onFailed, '[ExtId=TotalCAInProcessGroupDiv]');

            var service = new SmeWeb.CustomerWCFService();
            service.CountRatingExpired(empIdHF.dom.value, 'yes', onSuccess, onFailed, '[ExtId=TotalRatingExpiredSingleDiv]');
            service.CountRatingExpired(empIdHF.dom.value, 'no', onSuccess, onFailed, '[ExtId=TotalRatingExpiredGroupDiv]');

            var service = new SmeWeb.EmployeeWCFService();
            service.GetLastLoginXMinTotal(60, onSuccess, onFailed, '[ExtId=LastLogin30MinLabel]');

            var timerId = 0;
            var timerId2 = 0;

            //            Ext.fly('CAInProcessSingleTd').addClass('individualJob');
            Ext.fly('CAInProcessGroupTd').addClass('groupJob');

            //            Ext.fly('CovenantSingleTd').addClass('individualJob');
            Ext.fly('CovenantGroupTd').addClass('groupJob');

            //            Ext.fly('RatingExpiredSingleTd').addClass('individualJob');
            Ext.fly('RatingExpiredGroupTd').addClass('groupJob');

            timerId = setInterval(singleBink, 1000);
            timerId2 = setInterval(groupBink, 1000);

            function singleBink() {
                swap(Ext.fly('CAInProcessSingleTd'), 'individualJob');
                swap(Ext.fly('CovenantSingleTd'), 'individualJob');
                swap(Ext.fly('RatingExpiredSingleTd'), 'individualJob');
            }

            function groupBink() {
                swap(Ext.fly('CAInProcessGroupTd'), 'groupJob');
                swap(Ext.fly('CovenantGroupTd'), 'groupJob');
                swap(Ext.fly('RatingExpiredGroupTd'), 'groupJob');
            }

            function swap(div, className) {
                if (div.hasClass(className)) {
                    div.removeClass(className);
                } else {
                    div.addClass(className);
                }
            }
        });
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True"
        EnableScriptLocalization="True">
        <Services>
            <asp:ServiceReference Path="~/webservice/CAWCFService.svc" />
            <asp:ServiceReference Path="~/webservice/CustomerWCFService.svc" />
            <asp:ServiceReference Path="~/webservice/EmployeeWCFService.svc" />
        </Services>
    </asp:ScriptManager>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div id="main">
        <table id="table1" runat="server" width="80%">
            <tr>
                <td valign="top">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="White" Text="Anounment / ประกาศ"
                        Font-Names="Ms sans sarif" Font-Size="18pt" BackColor="Olive"></asp:Label>
                    <br />
                    <table border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <asp:Label ID="Label3" runat="server" BackColor="#006600" Font-Bold="True" Font-Names="Ms sans sarif"
                                    Font-Size="10pt" ForeColor="White" Text="** Form Review ** "></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <iframe id="I1" name="I1" src="form/FormMain.aspx?mode=1"></iframe>
                            </td>
                        </tr>
                    </table>
                    <div id="divDoc">
                        &nbsp;<strong><span class="style1">** ดาวโหลดเอกสารคู่มือ </span></strong>
                        <asp:TreeView ID="TreeView2" runat="server" ExpandDepth="0" NodeIndent="15" BackColor="#EEFFEE"
                            Width="300px">
                            <ParentNodeStyle Font-Bold="False" ImageUrl="~/images/imageIcon/folder.gif" VerticalPadding="0px" />
                            <HoverNodeStyle Font-Underline="True" ForeColor="#6666AA" />
                            <SelectedNodeStyle Font-Underline="False" HorizontalPadding="0px" VerticalPadding="0px"
                                BorderStyle="Ridge" />
                            <RootNodeStyle ImageUrl="~/images/imageIcon/My Computer.ico" VerticalPadding="0px" />
                            <NodeStyle Font-Names="Tahoma" Font-Size="8pt" ForeColor="Black" HorizontalPadding="0px"
                                NodeSpacing="0px" VerticalPadding="0px" />
                            <LeafNodeStyle ImageUrl="~/images/imageIcon/txt.gif" HorizontalPadding="0px" VerticalPadding="0px" />
                        </asp:TreeView>
                    </div>
                </td>
                <td valign="top" align="left">
                    <input id="Hidden_EMP_ID" runat="server" extid="Hidden_EMP_ID" type="hidden" />
                    <asp:Label ID="Label2" runat="server" Text="Today Login: "></asp:Label>
                    <asp:Label ID="lblUserOnline" runat="server"></asp:Label>
                    <img alt="people" src="../images/People.gif" style="width: 16px; height: 16px" />
                    <br />
                    <asp:Label ID="Label4" runat="server" Text="Last Login(60 min): "></asp:Label>
                    <asp:Label ID="LastLogin30MinLabel" ExtId="LastLogin30MinLabel" runat="server">Loading...</asp:Label>
                    <img alt="people" src="../images/People.gif" style="width: 16px; height: 16px" />
                    <table style="border-width: thin; width: 100%;">
                        <tr style="background-color: Gray">
                            <td align="left" style="font-family: 'MS Sans Serif'; font-size: 12px; text-decoration: underline;
                                font-weight: bold; color: #FFFFFF;">
                                <img alt="" src="../images/ball_glass_yellowS.gif" style="width: 16px; height: 16px" /><asp:HyperLink
                                    ID="HyperLink3" runat="server" Font-Bold="True" Font-Size="10pt" ForeColor="White"
                                    NavigateUrl="~/aspx/annals/CASearch.aspx">CA / หนังสือสินเชื่อ</asp:HyperLink>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <table cellpadding="0" cellspacing="0" border="0" style="width: 101%">
                                    <tr>
                                        <td align="left" style="width: 60%">
                                            <img alt="" src="../images/ball_glass_yellowS.gif" style="width: 16px; height: 16px;" />
                                            CA In Process Report
                                        </td>
                                        <td align="right">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:HyperLink ID="CAInProcessSingleHyperLink" runat="server" NavigateUrl="~/aspx/report/InProcessCA.aspx?single=yes"
                                                ExtId="CAInProcessSingleHyperLink">
                                                Individual :
                                            </asp:HyperLink>
                                        </td>
                                        <td id="CAInProcessSingleTd" align="center">
                                            <div id="TotalCAInProcessSingleDiv" extid="TotalCAInProcessSingleDiv" style="float: right;
                                                position: relative;">
                                                Loading...</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:HyperLink ID="CAInProcessGroupHyperLink" runat="server" NavigateUrl="~/aspx/report/InProcessCA.aspx"
                                                ExtId="CAInProcessGroupHyperLink">
                                                Group :
                                            </asp:HyperLink>
                                        </td>
                                        <td id="CAInProcessGroupTd" align="center">
                                            <div id="TotalCAInProcessGroupDiv" extid="TotalCAInProcessGroupDiv" style="float: right;
                                                position: relative;">
                                                Loading...</div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <table cellpadding="0" cellspacing="0" border="0" style="width: 101%">
                                    <tr>
                                        <td align="left" style="width: 60%">
                                            <img alt="" src="../images/ball_glass_yellowS.gif" style="width: 16px; height: 16px;" />
                                            Covenant Report
                                        </td>
                                        <td align="right">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:HyperLink ID="CACovenantReportSingleHL" runat="server" NavigateUrl="~/aspx/report/CACovenantReport.aspx?single=yes"
                                                ExtId="CACovenantReportSingleHL">
                                                Individual :
                                            </asp:HyperLink>
                                        </td>
                                        <td id="CovenantSingleTd" align="center">
                                            <div id="TotalCovenantSingleDiv" extid="TotalCovenantSingleDiv" style="float: right;
                                                position: relative;">
                                                Loading...</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:HyperLink ID="CACovenantReportGroupHL" runat="server" NavigateUrl="~/aspx/report/CACovenantReport.aspx"
                                                ExtId="CACovenantReportGroupHL">
                                                Group :
                                            </asp:HyperLink>
                                        </td>
                                        <td id="CovenantGroupTd" align="center">
                                            <div id="TotalCovenantGroupDiv" extid="TotalCovenantGroupDiv" style="float: right;
                                                position: relative;">
                                                Loading...</div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <table cellpadding="0" cellspacing="0" border="0" style="width: 101%">
                                    <tr>
                                        <td align="left" style="width: 60%">
                                            <img alt="" src="../images/ball_glass_yellowS.gif" style="width: 16px; height: 16px;" />
                                            Rating Expired Report
                                        </td>
                                        <td align="right">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:HyperLink ID="RatingExpiredReportSingleHL" runat="server" NavigateUrl="~/aspx/report/RatingNotification.aspx?single=yes"
                                                ExtId="RatingExpiredReportSingleHL">
                                                Individual :
                                            </asp:HyperLink>
                                        </td>
                                        <td id="RatingExpiredSingleTd" align="center">
                                            <div id="Div1" extid="TotalRatingExpiredSingleDiv" style="float: right; position: relative;">
                                                Loading...</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:HyperLink ID="RatingExpiredReportGroupHL" runat="server" NavigateUrl="~/aspx/report/RatingNotification.aspx"
                                                ExtId="RatingExpiredReportGroupHL">
                                                Group :
                                            </asp:HyperLink>
                                        </td>
                                        <td id="RatingExpiredGroupTd" align="center">
                                            <div id="Div2" extid="TotalRatingExpiredGroupDiv" style="float: right; position: relative;">
                                                Loading...</div>
                                        </td>
                                    </tr>
                                </table>
                                <table style="border-width: thin; width: 100%;">
                                    <tr style="background-color: Gray">
                                        <td align="left">
                                            <img alt="" src="../images/ball_glass_yellowS.gif" style="width: 16px; height: 16px" /><asp:HyperLink
                                                ID="HyperLink1" runat="server" Font-Bold="True" Font-Size="10pt" ForeColor="White"
                                                NavigateUrl="~/aspx/customer/CreditPerformance.aspx">Credit Performance</asp:HyperLink>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            <asp:Literal ID="Literal2" runat="server"></asp:Literal>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr style="background-color: Gray">
                                        <td align="left">
                                            <img alt="" src="../images/ball_glass_yellowS.gif" style="width: 16px; height: 16px" /><asp:HyperLink
                                                ID="HyperLink2" runat="server" Font-Bold="True" Font-Size="10pt" ForeColor="White"
                                                NavigateUrl="~/aspx/portfolio/smeCustomerDetail.aspx">Customer
                     Port/ พอร์ท ลูกค้า</asp:HyperLink>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr style="background-color: Gray">
                                        <td align="left">
                                            <img alt="" src="../images/ball_glass_yellowS.gif" style="width: 16px; height: 16px" /><asp:HyperLink
                                                ID="HyperLink4" runat="server" Font-Bold="True" Font-Size="10pt" ForeColor="White"
                                                NavigateUrl="~/aspx/download/CreditReview.aspx">Customer
                    Credit Review (ฝ่ายสอบทาน)</asp:HyperLink>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td valign="top">
                </td>
                <td valign="top" align="left">
                </td>
            </tr>
            <tr>
                <td valign="top">
                    &nbsp;
                </td>
                <td valign="top" align="center">
                </td>
            </tr>
        </table>
    </div>
</asp:Content>