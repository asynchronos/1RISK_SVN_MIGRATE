<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WebMenuControl.ascx.cs"
    Inherits="UserSystem.WebUserControl.WebMenu.WebMenuControl" %>
<div class="chromestyle" id="chromemenu">
    <ul>
        <asp:Literal ID="Literal_MM" runat="server" EnableViewState="true"></asp:Literal>
        <li id="LoginStatusMenu" runat="server" style="white-space: nowrap;">
            <asp:LoginStatus ID="LoginStatus" runat="server" LogoutAction="RedirectToLoginPage"
                OnLoggingOut="LoginStatus_LoggingOut" />
        </li>
    </ul>
</div>
<asp:SqlDataSource ID="SqlDS_Menu" runat="server" ConnectionString="<%$ ConnectionStrings:USERConnectionString %>"
    SelectCommand="P_GetMenuByRolesAndAppName" OnSelecting="SqlDS_Menu_Selecting"
    SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:Parameter Name="roles" Type="String" />
        <asp:Parameter Name="delimeter" Type="String" />
        <asp:Parameter Name="appName" Type="String" DefaultValue="USER_SYSTEM" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:Literal ID="Literal_MS" runat="server" EnableViewState="true"></asp:Literal>