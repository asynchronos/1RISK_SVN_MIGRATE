<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="SMEDebtSummary.aspx.cs" Inherits="SME.DebtSummary.Report.SMEDebtSummary" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="SM" runat="server">
    </asp:ScriptManager>
    EMPLOYEE :
    <asp:DropDownList ID="DDL_EmpList" runat="server" DataSourceID="ODS_EmpList" DataTextField="CATEGORY_DESC_TH"
        DataValueField="CATEGORY_VALUE" OnSelectedIndexChanged="DDL_EmpList_SelectedIndexChanged"
        AutoPostBack="True">
        <asp:ListItem>All</asp:ListItem>
    </asp:DropDownList>
    <asp:ObjectDataSource ID="ODS_EmpList" runat="server" SelectMethod="GetEmployeeTree"
        TypeName="SME.DebtSummary.Core.DAL.EmployeeTreeRepository">
        <SelectParameters>
            <asp:QueryStringParameter Name="rootEmpId" QueryStringField="rootempid" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    MIS CUST SIZE :
    <asp:DropDownList ID="DDL_MisCustSize" runat="server" AutoPostBack="True" DataSourceID="ODS_MisCustSize"
        DataTextField="MISCustSize" DataValueField="MISCustSizeID" OnSelectedIndexChanged="DDL_MisCustSize_SelectedIndexChanged"
        OnDataBound="DDL_MisCustSize_DataBound">
        <asp:ListItem>All</asp:ListItem>
    </asp:DropDownList>
    <asp:ObjectDataSource ID="ODS_MisCustSize" runat="server" SelectMethod="GetMISCustSizeListFromData"
        TypeName="SME.DebtSummary.Core.DAL.ByCusCIFRespository">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDL_EmpList" Name="rootEmpId" PropertyName="SelectedValue"
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <rsweb:ReportViewer ID="RV_Summary" runat="server" Width="100%" Font-Names="Verdana"
        Font-Size="8pt" InteractiveDeviceInfos="(Collection)" WaitMessageFont-Names="Verdana"
        WaitMessageFont-Size="14pt">
        <LocalReport ReportPath="RDLC\ReportCustomerDebtViewSummary.rdlc" EnableHyperlinks="True">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ODS_CustomerDebtView" Name="DataSetCustomerDebtView" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:ObjectDataSource ID="ODS_CustomerDebtView" runat="server" SelectMethod="GetByCusCIFSMEsProjected"
        TypeName="SME.DebtSummary.Core.DAL.ByCusCIFRespository">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDL_EmpList" Name="rootEmpId" PropertyName="SelectedValue"
                Type="String" />
            <asp:ControlParameter ControlID="DDL_MisCustSize" Name="misCustSizeId" PropertyName="SelectedValue"
                Type="String" />
            <asp:Parameter Name="customerClass" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>