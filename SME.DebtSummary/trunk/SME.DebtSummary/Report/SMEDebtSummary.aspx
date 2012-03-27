<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="SMEDebtSummary.aspx.cs" Inherits="SME.DebtSummary.Report.SMEDebtSummary" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="SM" runat="server">
    </asp:ScriptManager>
    <asp:ImageButton ID="IB_Back" runat="server" ImageUrl="~/Images/BackButton.gif" OnClick="IB_Back_Click"
        Width="36px" OnPreRender="IB_Back_Prerender" />
    <br />
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
    <br />
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
    <br />
    MIS STATUS :
    <asp:DropDownList ID="DDL_MisStatus" runat="server" AutoPostBack="True" DataSourceID="ODS_MisStatus"
        DataTextField="MISStatus" DataValueField="MISStatusID" OnSelectedIndexChanged="DDL_MisStatus_SelectedIndexChanged"
        AppendDataBoundItems="True">
        <asp:ListItem>All</asp:ListItem>
    </asp:DropDownList>
    <asp:ObjectDataSource ID="ODS_MisStatus" runat="server" SelectMethod="GetStatuses"
        TypeName="SME.DebtSummary.Core.DAL.CustomerSmeRepository"></asp:ObjectDataSource>
    <rsweb:ReportViewer ID="RV_SMEDebtSummary" runat="server" Font-Names="Verdana" Font-Size="8pt"
        Height="100%" InteractiveDeviceInfos="(Collection)" WaitMessageFont-Names="Verdana"
        WaitMessageFont-Size="14pt" Width="100%">
        <LocalReport EnableHyperlinks="True" ReportPath="RDLC\ReportSmeSummary.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ODS_SMEDebtSummary" Name="DataSetCustomerDebtView" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:ObjectDataSource ID="ODS_SMEDebtSummary" runat="server" SelectMethod="GetByCusCIFSMEsProjected"
        TypeName="SME.DebtSummary.Core.DAL.ByCusCIFRespository">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDL_EmpList" Name="rootEmpId" PropertyName="SelectedValue"
                Type="String" />
            <asp:ControlParameter ControlID="DDL_MisCustSize" Name="misCustSizeId" PropertyName="SelectedValue"
                Type="String" />
            <asp:ControlParameter ControlID="DDL_MisStatus" Name="misStatusId" PropertyName="SelectedValue"
                Type="String" />
            <asp:Parameter Name="customerClass" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>