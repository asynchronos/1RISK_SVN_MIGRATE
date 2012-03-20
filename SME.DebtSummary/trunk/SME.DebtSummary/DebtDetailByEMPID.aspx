<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DebtDetailByEMPID.aspx.cs" Inherits="SME.DebtSummary.DebtDetailByEMPID" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana"
        Font-Size="8pt" InteractiveDeviceInfos="(Collection)"
        WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="100%">
        <LocalReport ReportPath="RDLC\CustomerDebtViewDetailReport.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ODS_CustomerDebtView"
                    Name="DataSetCustomerDebtView" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:ObjectDataSource ID="ODS_CustomerDebtView" runat="server"
        SelectMethod="GetByCusCIFSMEsProjected"
        TypeName="SME.DebtSummary.Core.DAL.ByCusCIFRespository">
        <SelectParameters>
            <asp:QueryStringParameter Name="rootEmpId" QueryStringField="rootempid"
                Type="String" />
            <asp:Parameter Name="empIdFilter" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
