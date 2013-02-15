<%@ Control Language="VB" AutoEventWireup="false" CodeFile="RoleMenuControl.ascx.vb"
    Inherits="aspx.userControl.RoleMenuControl" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<div style="text-align: left; position: absolute; right: 0">
    <asp:Panel ID="Panel_Container" runat="server">
        <asp:Panel ID="Panel_Header" runat="server" CssClass="collapsePanelHeader" Width="150px" Height="30px">
            <div style="padding: 5px; cursor: pointer; vertical-align: middle;">
                <div style="float: left;">
                    <asp:Label ID="Label1" runat="server">Show Menu...</asp:Label>
                </div>
                <div style="float: right; vertical-align: middle;">
                    <asp:ImageButton ID="Image1" runat="server" ImageUrl="~/images/expand_blue.jpg" AlternateText="(Show Menu...)" />
                </div>
            </div>
        </asp:Panel>
        <asp:Panel ID="Panel_Detail" runat="server" CssClass="collapsePanel" Width="150px">
            <table>
                <tr align="left">
                    <td>
                        <asp:LinkButton ID="LinkButt_RoleFilter" runat="server" Text="Role Filter" />
                    </td>
                </tr>
                <tr align="left">
                    <td>
                        <asp:LinkButton ID="LinkButt_CifFilter" runat="server" Text="Cif Filter" />
                    </td>
                </tr>
                <tr align="left">
                    <td>
                        <asp:LinkButton ID="LinkButt_EmpFilter" runat="server" Text="Employee Filter" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtender" runat="Server"
            TargetControlID="Panel_Detail" ExpandControlID="Panel_Header" CollapseControlID="Panel_Header"
            TextLabelID="Label1" ImageControlID="Image1" ExpandedText="Hide Menu..." CollapsedText="Show Menu..."
            ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
            SuppressPostBack="true" />
    </asp:Panel>
</div>
<br />
