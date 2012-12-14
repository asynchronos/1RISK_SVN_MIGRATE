<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="TbEmployee.aspx.vb" Inherits="_TbEmployee" Title="Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Panel ID="PanelTbEmployee" runat="server" Height="200px" Width="789px" BackColor="Info"
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
                    <asp:Label ID="lblIMAGENAME" Text="Image" runat="server" Width="64px"></asp:Label>
                </td>
                <td rowspan="7" style="width: 306px" align="left" valign="top">
                    <asp:Image ID="Image" runat="server" BackColor="White" BorderColor="#E0E0E0" BorderWidth="5px"
                        Height="104px" Width="86px" />
                    <input id="FileUpload" type="file" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td style="width: 306px">
                </td>
                <td style="width: 104px">
                </td>
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
                    <asp:Label ID="lblTAX_NO" Text="Tax Number" runat="server" Width="79px"></asp:Label>
                </td>
                <td style="width: 306px">
                    <asp:TextBox ID="tbTAX_NO" runat="server" MaxLength="10"></asp:TextBox>
                </td>
                <td style="width: 104px">
                    <asp:Label ID="lblEMAIL" Text="Email" runat="server" Width="81px"></asp:Label>
                </td>
                <td style="width: 306px">
                    <asp:TextBox ID="tbEMAIL" runat="server" MaxLength="30"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblADDRESS" Text="Address" runat="server" Width="80px"></asp:Label>
                </td>
                <td style="width: 306px">
                    <asp:TextBox ID="tbADDRESS" runat="server" MaxLength="30" Width="251px"></asp:TextBox>
                </td>
                <td style="width: 104px">
                </td>
                <td style="width: 306px">
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblROAD" Text="Road" runat="server" Width="69px"></asp:Label>
                </td>
                <td style="width: 306px">
                    <asp:TextBox ID="tbROAD" runat="server" MaxLength="30"></asp:TextBox>
                </td>
                <td style="width: 104px">
                    <asp:Label ID="lblIDCARD" Text="Id Card" runat="server"></asp:Label>
                </td>
                <td style="width: 306px">
                    <asp:TextBox ID="tbIDCARD" runat="server" MaxLength="13"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="height: 26px">
                    <asp:Label ID="lblLOCALITY" Text="Locality" runat="server"></asp:Label>
                </td>
                <td style="width: 306px; height: 26px;">
                    <asp:TextBox ID="tbLOCALITY" runat="server" MaxLength="30"></asp:TextBox>
                </td>
                <td style="width: 104px; height: 26px;">
                    <asp:Label ID="lblACCNO" Text="Account Number" runat="server" Width="156px"></asp:Label>
                </td>
                <td style="width: 306px; height: 26px;">
                    <asp:TextBox ID="tbACCNO" runat="server" MaxLength="16"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblZIPCODE" Text="Zipcode" runat="server"></asp:Label>
                </td>
                <td style="width: 306px">
                    <asp:TextBox ID="tbZIPCODE" runat="server" MaxLength="5" Width="81px"></asp:TextBox>
                </td>
                <td style="width: 104px">
                    <asp:Label ID="lblSOI" Text="Soi" runat="server"></asp:Label>
                </td>
                <td style="width: 306px">
                    <asp:TextBox ID="tbSOI" runat="server" MaxLength="20"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblTEL_MOBILE" Text="Mobile" runat="server"></asp:Label>
                </td>
                <td style="width: 306px">
                    <asp:TextBox ID="tbTEL_MOBILE" runat="server" MaxLength="20"></asp:TextBox>
                </td>
                <td style="width: 104px">
                    <asp:Label ID="lblDISTRINCT" Text="District" runat="server"></asp:Label>
                </td>
                <td rowspan="1" style="width: 306px">
                    <asp:TextBox ID="tbDISTRINCT" runat="server" MaxLength="30"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblTEL_HOME" Text="Tel Home" runat="server"></asp:Label>
                </td>
                <td style="width: 306px">
                    <asp:TextBox ID="tbTEL_HOME" runat="server" MaxLength="30" Width="102px"></asp:TextBox>
                </td>
                <td style="width: 104px">
                    <asp:Label ID="lblPROV_CODE" Text="Province" runat="server"></asp:Label>
                </td>
                <td rowspan="1" style="width: 306px">
                    <asp:DropDownList ID="ddlPROV_CODE" runat="server" Width="196px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblTEL_INDOOR" Text="Tel Indoor" runat="server"></asp:Label>
                </td>
                <td style="width: 306px">
                    <asp:TextBox ID="tbTEL_INDOOR" runat="server" MaxLength="30"></asp:TextBox>
                </td>
                <td style="width: 104px">
                </td>
                <td rowspan="1" style="width: 306px">
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblDATEOFBIRTH" Text="Date of  Birth" runat="server" Width="88px"></asp:Label>
                </td>
                <td style="width: 306px">
                    <asp:DropDownList ID="ddlDayDATEOFBIRTH" runat="server">
                    </asp:DropDownList>
                    <asp:DropDownList ID="ddlMonthDATEOFBIRTH" runat="server">
                    </asp:DropDownList>
                    <asp:DropDownList ID="ddlYearDATEOFBIRTH" runat="server">
                    </asp:DropDownList>
                </td>
                <td bgcolor="#6699cc" style="width: 104px">
                    <asp:Label ID="lblUSERNAME" Text="Username" runat="server" Width="133px" Font-Bold="True"
                        ForeColor="Black"></asp:Label>
                </td>
                <td bgcolor="#6699cc" rowspan="1" style="width: 306px">
                    <asp:TextBox ID="tbUSERNAME" runat="server" MaxLength="10" Width="132px" ReadOnly="True"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblDATEOFSTART" Text="Date of Start" runat="server"></asp:Label>
                </td>
                <td style="width: 306px">
                    <asp:DropDownList ID="ddlDayDATEOFSTART" runat="server">
                    </asp:DropDownList>
                    <asp:DropDownList ID="ddlMonthDATEOFSTART" runat="server">
                    </asp:DropDownList>
                    <asp:DropDownList ID="ddlYearDATEOFSTART" runat="server">
                    </asp:DropDownList>
                </td>
                <td bgcolor="#6699cc" style="width: 104px">
                    <asp:Label ID="lblPASSWD" Text="Password" runat="server" Font-Bold="True" ForeColor="Black"
                        Width="133px"></asp:Label>
                </td>
                <td bgcolor="#6699cc" rowspan="1" style="width: 306px">
                    <asp:TextBox ID="tbPASSWD" runat="server" MaxLength="20" Width="131px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblPOSITION_CODE" Text="Position" runat="server"></asp:Label>
                </td>
                <td style="width: 306px">
                    <asp:DropDownList ID="ddlPOSITION_CODE" runat="server" Width="247px">
                    </asp:DropDownList>
                </td>
                <td style="width: 104px">
                </td>
                <td rowspan="1" style="width: 306px">
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td style="width: 306px">
                </td>
                <td style="width: 104px">
                </td>
                <td rowspan="1" style="width: 306px">
                </td>
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
