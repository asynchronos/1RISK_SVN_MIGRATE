<%@ Control Language="VB" AutoEventWireup="false" CodeFile="ExportControl.ascx.vb" Inherits="Controls_ExportControl_ExportControl" %>
<asp:Panel ID="ExportPanel" runat="server" Wrap="False" HorizontalAlign="Left">
    <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
        RepeatDirection="Horizontal" RepeatLayout="Flow">
        <asp:ListItem Value="0">Excel</asp:ListItem>
        <asp:ListItem Value="1">Word</asp:ListItem>
    </asp:RadioButtonList>
    <asp:Button ID="ExportButton" runat="server" Text="Export" />
</asp:Panel>
