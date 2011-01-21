<%@ Control Language="VB" AutoEventWireup="false" CodeFile="webMenuControl.ascx.vb" Inherits="control.webMenu.WebMenuControl" %>

<div class="chromestyle" id="chromemenu">
    <ul>
        <asp:Literal ID="Literal_MM" runat="server" EnableViewState="true"></asp:Literal>
        <li id="LoginStatusMenu" runat="server" style="white-space: nowrap;">
            <asp:LoginStatus ID="LoginStatus" runat="server" 
                LogoutAction="RedirectToLoginPage" onloggingout="LoginStatus_LoggingOut" />
        </li>
    </ul>
</div>

<asp:Literal ID="Literal_MS" runat="server" EnableViewState="true"></asp:Literal>