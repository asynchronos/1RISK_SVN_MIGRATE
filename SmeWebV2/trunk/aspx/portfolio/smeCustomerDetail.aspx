<%@ Page Title="Customer Detail" Language="VB" MasterPageFile="~/MasterPage.master"
    AutoEventWireup="false" CodeFile="smeCustomerDetail.aspx.vb" Inherits="aspx.portfolio.smeCustomerDetail" %>

<%@ Register Src="../../Controls/Customer/CustomerMenuControl.ascx" TagName="CustomerMenuControl"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True"
        EnableScriptLocalization="True">
    </asp:ScriptManager>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <uc1:CustomerMenuControl ID="CustomerMenuControl1" runat="server" Menu1_TargetIframe_myid="iframeMain"
                Menu1Url="~/aspx/customer/SmeCustomerManagement.aspx" Menu1Text="รายละเอียดทั่วไป"
                Menu2_TargetIframe_myid="iframeMain" Menu2Url="~/aspx/customer/SmeGroupManagement.aspx"
                Menu2Text="จัดกลุ่มลูกค้า" Menu3_TargetIframe_myid="iframeMain" Menu3Url="~/aspx/customer/CustomerDebt.aspx"
                Menu3Text="ภาระหนี้" Menu4_TargetIframe_myid="iframeMain" Menu4Url="~/aspx/customer/CustomerDebtPrev.aspx"
                Menu4Text="ภาระหนี้ย้อนหลัง" Menu5_TargetIframe_myid="iframeMain" Menu5Url="~/aspx/customer/CustomerClassDebt.aspx"
                Menu5Text="ชั้นหนี้/เรตติ้ง" Menu6_TargetIframe_myid="iframeMain" Menu6Url="~/aspx/customer/CustomerCollateral.aspx"
                Menu6Text="รายละเอียดหลักประกัน" Menu7_TargetIframe_myid="iframeMain" Menu7Url="~/aspx/customer/CustomerCollateralPerson.aspx"
                Menu7Text="บุคคลค้ำประกัน" Menu8_TargetIframe_myid="iframeMain" Menu8Url="~/aspx/customer/CustomerLaw.aspx"
                Menu8Text="สถานะขั้นตอนกฎหมายล่าสุด" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <iframe id="iframeMain" myid="iframeMain" frameborder="0" width="100%" style="min-height: 500px"
        src='<%= Page.ResolveUrl("~/IframeLoader.aspx?url=")+Page.ResolveUrl("~/aspx/customer/SmeCustomerManagement.aspx") %>'>
    </iframe>
</asp:Content>