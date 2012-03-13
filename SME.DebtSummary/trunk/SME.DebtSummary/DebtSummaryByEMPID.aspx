<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="DebtSummaryByEMPID.aspx.cs" Inherits="SME.DebtSummary.DebtSummaryByEMPID" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager runat="server" ID="SM">
    </asp:ScriptManager>
    <asp:DropDownList ID="DDL_EmpFilterList" runat="server" AutoPostBack="True" DataSourceID="ODS_EmpFilterList"
        DataTextField="CATEGORY_DESC_TH" DataValueField="CATEGORY_VALUE" OnSelectedIndexChanged="DDL_EmpFilterList_SelectedIndexChanged">
    </asp:DropDownList>
    <asp:ObjectDataSource ID="ODS_EmpFilterList" runat="server" SelectMethod="GetEmployeeTree"
        TypeName="SME.DebtSummary.Core.DAL.EmployeeTreeRepository">
        <SelectParameters>
            <asp:QueryStringParameter Name="rootEmpId" QueryStringField="rootempid" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt"
        InteractiveDeviceInfos="(Collection)" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt"
        Width="100%">
        <LocalReport ReportPath="RDLC\CustomerDebtViewReport.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ODS_CustomerDebtView" Name="DataSetCustomerDebtView" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:ObjectDataSource ID="ODS_CustomerDebtView" runat="server" SelectMethod="GetByCusCIFSMEsProjected"
        TypeName="SME.DebtSummary.Core.DAL.ByCusCIFRespository">
        <SelectParameters>
            <asp:QueryStringParameter Name="rootEmpId" QueryStringField="rootempid" Type="String" />
            <asp:ControlParameter ControlID="DDL_EmpFilterList" DefaultValue="" Name="empIdFilter"
                PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>