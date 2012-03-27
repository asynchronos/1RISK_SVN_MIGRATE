<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="SMEDebtSizeView.aspx.cs" Inherits="SME.DebtSummary.Report.SMEDebtSizeView" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:ImageButton ID="IB_Back" runat="server" ImageUrl="~/Images/BackButton.gif" OnClick="IB_Back_Click"
        Width="36px" OnPreRender="IB_Back_Prerender" />
    <br />
    EMPLOYEE :
    <asp:DropDownList ID="DDL_EmpList" runat="server" AutoPostBack="True" DataSourceID="ODS_EmpList"
        DataTextField="CATEGORY_DESC_TH" DataValueField="CATEGORY_VALUE" OnSelectedIndexChanged="DDL_EmpList_SelectedIndexChanged">
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
    <asp:Label ID="LabelMISCustSize" runat="server" Text="Label"></asp:Label>
    <br />
    MIS STATUS :
    <asp:Label ID="LabelMISStatus" runat="server" Text="Label"></asp:Label>
    <br />
    CUSTOMER CLASS :
    <asp:Label ID="LabelCustomerClass" runat="server" Text="Label"></asp:Label>
    &nbsp;<rsweb:ReportViewer ID="RV_SMEDebtViewBySize" runat="server" Font-Names="Verdana"
        Font-Size="8pt" Height="100%" InteractiveDeviceInfos="(Collection)" WaitMessageFont-Names="Verdana"
        WaitMessageFont-Size="14pt" Width="100%">
        <LocalReport ReportPath="RDLC\ReportSMEViewBySize.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ODS_SMEDebtViewBySize" Name="DataSetCustomerDebtView" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:ObjectDataSource ID="ODS_SMEDebtViewBySize" runat="server" SelectMethod="GetByCusCIFSMEsProjected"
        TypeName="SME.DebtSummary.Core.DAL.ByCusCIFRespository">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDL_EmpList" Name="rootEmpId" PropertyName="SelectedValue"
                Type="String" />
            <asp:QueryStringParameter Name="misCustSizeId" QueryStringField="miscustsizeid" Type="String" />
            <asp:QueryStringParameter Name="misStatusId" QueryStringField="misstatusid" Type="String" />
            <asp:QueryStringParameter Name="customerClass" QueryStringField="customerclass" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>