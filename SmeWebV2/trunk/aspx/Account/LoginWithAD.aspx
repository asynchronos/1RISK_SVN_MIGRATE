<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false"
    CodeFile="LoginWithAD.aspx.vb" Inherits="LoginWithAD" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Login ID="Login1" runat="server" BackColor="#EFF3FB" BorderColor="#B5C7DE" BorderPadding="4"
        BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em"
        ForeColor="#333333">
        <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
        <LoginButtonStyle BackColor="White" BorderColor="#507CD1" BorderStyle="Solid" BorderWidth="1px"
            Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" />
        <TextBoxStyle Font-Size="0.8em" />
        <TitleTextStyle BackColor="#507CD1" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
    </asp:Login>
</asp:Content>