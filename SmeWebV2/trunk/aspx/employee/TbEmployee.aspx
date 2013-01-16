<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="TbEmployee.aspx.vb" Inherits="_TbEmployee" Title="Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Panel ID="PanelTbEmployee" runat="server" BackColor="Info"
        BorderColor="#FFC080" BorderStyle="Dashed" BorderWidth="1px">
        <table border="0">
            <tr>
                <td colspan="4" align="left">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Employee Profile" Width="146px"></asp:Label><br />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblEMP_ID" Text="Employee ID" runat="server"></asp:Label>
                </td>
                <td style="width: 306px">
                    <asp:TextBox ID="tbEMP_ID" runat="server" MaxLength="10" Width="98px" Enabled="False"
                        ReadOnly="True"></asp:TextBox>
                </td>
                <td style="width: 104px">
                    &nbsp;</td>
                <td rowspan="7" style="width: 306px" align="left" valign="top">
                    &nbsp;</td>
            </tr>
           
            <tr>
                <td>
                    <asp:Label ID="lblTITLE_CODE" Text="TITLE" runat="server" Width="79px"></asp:Label>
                </td>
                <td style="width: 306px">
                    <asp:DropDownList ID="ddlTITLE_CODE" runat="server" Width="75px">
                    </asp:DropDownList>
                </td>
                <td style="width: 104px">
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblEMPNAME" Text="Name" runat="server" Width="80px"></asp:Label>
                </td>
                <td style="width: 306px">
                    <asp:TextBox ID="tbEMPNAME" runat="server" MaxLength="50"></asp:TextBox>
                </td>
                <td style="width: 104px">
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblEMPSURNAME" Text="Surname" runat="server"></asp:Label>
                </td>
                <td style="width: 306px">
                    <asp:TextBox ID="tbEMPSURNAME" runat="server" MaxLength="50"></asp:TextBox>
                </td>
                <td style="width: 104px">
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblEMPNAME_E" Text="Name(Eng)" runat="server" Width="83px"></asp:Label>
                </td>
                <td style="width: 306px;">
                    <asp:TextBox ID="tbEMPNAME_E" runat="server" MaxLength="50"></asp:TextBox>
                </td>
                <td style="width: 104px;">
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblEMPSURNAME_E" Text="Surname(Eng)" runat="server"></asp:Label>
                </td>
                <td style="width: 306px">
                    <asp:TextBox ID="tbEMPSURNAME_E" runat="server" MaxLength="50"></asp:TextBox>
                </td>
                <td style="width: 104px">
                </td>
            </tr>
           
            <tr>
                <td>
                    <asp:Label ID="lblEMAIL" runat="server" Text="Email" Width="81px"></asp:Label>
                </td>
                <td style="width: 306px">
                    <asp:TextBox ID="tbEMAIL" runat="server" MaxLength="30"></asp:TextBox>
                </td>
                <td style="width: 104px">
                    &nbsp;</td>
                <td style="width: 306px">
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="height: 26px">
                    &nbsp;</td>
                <td style="width: 306px; height: 26px;">
                    &nbsp;</td>
                <td style="width: 104px; height: 26px;">
                    &nbsp;</td>
                <td style="width: 306px; height: 26px;">
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblUSERNAME" runat="server" Font-Bold="True" ForeColor="Black" 
                        Text="Username" Width="133px"></asp:Label>
                </td>
                <td style="width: 306px">
                    <asp:TextBox ID="tbUSERNAME" runat="server" MaxLength="10" ReadOnly="True" 
                        Width="132px"></asp:TextBox>
                </td>
                <td style="width: 104px">
                    &nbsp;</td>
                <td style="width: 306px">
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblPASSWD" runat="server" Font-Bold="True" ForeColor="Black" 
                        Text="Password" Width="133px"></asp:Label>
                </td>
                <td style="width: 306px">
                    <asp:TextBox ID="tbPASSWD" runat="server" MaxLength="20" Width="131px"></asp:TextBox>
                </td>
                <td style="width: 104px">
                    &nbsp;</td>
                <td rowspan="1" style="width: 306px">
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td style="width: 306px">
                    &nbsp;</td>
                <td style="width: 104px">
                    &nbsp;</td>
                <td rowspan="1" style="width: 306px">
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="height: 25px">
                </td>
                <td style="width: 306px; height: 25px;">
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" BackColor="#C0FFC0" Font-Bold="True"
                        ForeColor="Black" Width="84px" />
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="91px" BackColor="#C0FFC0"
                        Font-Bold="True" />
                </td>
                <td style="width: 104px; height: 25px;">
                </td>
                <td style="width: 306px; height: 25px;">
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    &nbsp; &nbsp;
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>
