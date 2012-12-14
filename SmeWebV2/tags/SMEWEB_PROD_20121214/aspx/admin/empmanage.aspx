<%@ Page Language="VB" AutoEventWireup="true"  MasterPageFile="~/MasterPage.master"
CodeFile="empmanage.aspx.vb"  
Inherits="_empmanage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" Runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
   
    <asp:Panel ID="PanelGridAdminEmployee" runat="server" Height="200px" Width="665px" >
        <table align="center">
            <tr>
                <td style="height: 27px; width: 731px;">
                    <br />
                    <br />
                    <br />
                    <asp:Label ID="lblSearchVar" runat="server" Text="Search"></asp:Label>
                    <asp:DropDownList ID="ddlFieldValue" runat="server">
                        <asp:ListItem Text="ID" Value="EMP_ID"></asp:ListItem>
                        <asp:ListItem Text="EMPNAME" Value="EMPNAME"></asp:ListItem>
                        <asp:ListItem Text="EMPSURNAME" Value="EMPSURNAME"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:DropDownList ID="ddlOperator" runat="server">
                        <asp:ListItem Text="Contains" Value=" LIKE "></asp:ListItem>
                        <asp:ListItem Text="Does Not Contain" Value=" Not LIKE "></asp:ListItem>
                        <asp:ListItem Text="Less Than" Value=" &lt; "></asp:ListItem>
                        <asp:ListItem Text="Equal To" Value=" = "></asp:ListItem>
                        <asp:ListItem Text="Greater Than" Value=" &gt; "></asp:ListItem>
                        <asp:ListItem Text="Not Equal To" Value=" &lt;&gt; "></asp:ListItem>
                    </asp:DropDownList>
                    <asp:TextBox ID="tbSearchValue" runat="server"></asp:TextBox>
                    <asp:Button ID="btnSearchVar" runat="server" Text="Search" />
                    <asp:Button ID="btnAddNew" runat="server" Text="Add New Employee" Width="131px" />
                </td>
            </tr>
            <tr>
                <td style="height: 311px; width: 731px;" align="left" valign="top">
                    <asp:Label ID="Label2" runat="server" Text="Please select employee to update"></asp:Label><br />
                    <asp:GridView ID="GridAdminEmployee" runat="server" AllowPaging="True" AutoGenerateColumns="False" Width="728px" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" PageSize="15">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="EMP_ID" HeaderText="Employee ID" />
                            <asp:BoundField DataField="EMPNAME" HeaderText="Name" />
                            <asp:BoundField DataField="EMPSURNAME" HeaderText="Surname " />
                        </Columns>
                        <EmptyDataTemplate>
                            Don't have data
                        </EmptyDataTemplate>
                        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                        <RowStyle BackColor="White" ForeColor="#330099" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                        <PagerSettings Mode="NumericFirstLast" />
                    </asp:GridView>
                    <br />
                </td>
            </tr>
        </table>
    </asp:Panel>
    &nbsp;<br />
<asp:Panel ID="PanelTbEmployee" runat="server" Height="200px" Width="789px" BackColor="Info" BorderColor="#FFC080" BorderStyle="Dashed" BorderWidth="1px">
<table border="0">
<tr><td colspan="5" align="left">
    <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Employee Profile" Width="146px"></asp:Label><br />
</td></tr><tr><td style="height: 26px"><asp:Label ID="lblEMP_ID" text="Employee ID" runat="server"></asp:Label></td><td style="width: 306px; height: 26px;"><asp:TextBox ID="tbEMP_ID" runat="server" maxlength="10" Width="98px"></asp:TextBox></td>
        <td style="width: 104px; height: 26px;">
    <asp:Label ID="lblIMAGENAME" text="Image" runat="server" Width="64px"></asp:Label></td>
        <td rowspan="7" style="width: 306px" align="left" valign="top">
        <asp:Image ID="Image" runat="server" BackColor="White" BorderColor="#E0E0E0" BorderWidth="5px"
            Height="104px" Width="86px" />
        <input id="FileUpload" type="file" runat="server" /></td>
    </tr>
    <tr>
        <td>
            </td>
        <td style="width: 306px">
            </td>
        <td style="width: 104px">
            </td>
    </tr>
<tr><td><asp:Label ID="lblTITLE_CODE" text="TITLE" runat="server" Width="79px"></asp:Label></td><td style="width: 306px"><asp:DropDownList ID="ddlTITLE_CODE" runat="server" Width="75px" ></asp:DropDownList></td>
 <td style="width: 104px">
    </td>
    </tr>

<tr><td><asp:Label ID="lblEMPNAME" text="Name" runat="server" Width="80px"></asp:Label></td><td style="width: 306px"><asp:TextBox ID="tbEMPNAME" runat="server" maxlength="50"></asp:TextBox>

</td>
    <td style="width: 104px">
    </td>
</tr>
    <tr>
        <td>
    <asp:Label ID="lblEMPSURNAME" text="Surname" runat="server"></asp:Label></td>
        <td style="width: 306px">
    <asp:TextBox ID="tbEMPSURNAME" runat="server" maxlength="50"></asp:TextBox></td>
        <td style="width: 104px">
        </td>
    </tr>
<tr><td><asp:Label ID="lblEMPNAME_E" text="Name(Eng)" runat="server" Width="83px"></asp:Label></td><td style="width: 306px;"><asp:TextBox ID="tbEMPNAME_E" runat="server" maxlength="50"></asp:TextBox></td>
    <td style="width: 104px;">
    </td>
</tr>
<tr><td>
    <asp:Label ID="lblEMPSURNAME_E" text="Surname(Eng)" runat="server"></asp:Label></td><td style="width: 306px">
    <asp:TextBox ID="tbEMPSURNAME_E" runat="server" maxlength="50"></asp:TextBox></td>
    <td style="width: 104px">
    </td>
</tr>
<tr><td><asp:Label ID="lblTAX_NO" text="Tax Number" runat="server" Width="79px"></asp:Label></td><td style="width: 306px"><asp:TextBox ID="tbTAX_NO" runat="server" maxlength="10"></asp:TextBox></td>
    <td style="width: 104px">
    <asp:Label ID="lblEMAIL" text="Email" runat="server" Width="81px"></asp:Label></td>
    <td style="width: 306px">
    <asp:TextBox ID="tbEMAIL" runat="server" maxlength="30"></asp:TextBox></td>
</tr>
<tr><td><asp:Label ID="lblADDRESS" text="Address" runat="server" Width="80px"></asp:Label></td><td style="width: 306px"><asp:TextBox ID="tbADDRESS" runat="server" maxlength="30" Width="251px"></asp:TextBox></td>
    <td style="width: 104px">
    </td>
    <td style="width: 306px">
    </td>
</tr>
<tr><td><asp:Label ID="lblROAD" text="Road" runat="server" Width="69px"></asp:Label></td><td style="width: 306px"><asp:TextBox ID="tbROAD" runat="server" maxlength="30"></asp:TextBox></td>
    <td style="width: 104px">
    <asp:Label ID="lblIDCARD" text="Id Card" runat="server"></asp:Label></td>
    <td style="width: 306px">
    <asp:TextBox ID="tbIDCARD" runat="server" maxlength="13"></asp:TextBox></td>
</tr>
<tr><td style="height: 26px"><asp:Label ID="lblLOCALITY" text="Locality" runat="server"></asp:Label></td><td style="width: 306px; height: 26px;"><asp:TextBox ID="tbLOCALITY" runat="server" maxlength="30"></asp:TextBox></td>
    <td style="width: 104px; height: 26px;">
    <asp:Label ID="lblACCNO" text="Account Number" runat="server" Width="156px"></asp:Label></td>
    <td style="width: 306px; height: 26px;">
    <asp:TextBox ID="tbACCNO" runat="server" maxlength="16"></asp:TextBox></td>
</tr>
<tr><td><asp:Label ID="lblZIPCODE" text="Zipcode" runat="server"></asp:Label></td><td style="width: 306px"><asp:TextBox ID="tbZIPCODE" runat="server" maxlength="5" Width="81px"></asp:TextBox></td>
    <td style="width: 104px">
    <asp:Label ID="lblSOI" text="Soi" runat="server"></asp:Label></td>
    <td style="width: 306px">
    <asp:TextBox ID="tbSOI" runat="server" maxlength="20"></asp:TextBox></td>
</tr>
    <tr>
        <td>
    <asp:Label ID="lblTEL_MOBILE" text="Mobile" runat="server"></asp:Label></td>
        <td style="width: 306px">
            <asp:TextBox ID="tbTEL_MOBILE" runat="server" maxlength="20"></asp:TextBox></td>
        <td style="width: 104px">
    <asp:Label ID="lblDISTRINCT" text="District" runat="server"></asp:Label></td>
        <td rowspan="1" style="width: 306px">
    <asp:TextBox ID="tbDISTRINCT" runat="server" maxlength="30"></asp:TextBox></td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblTEL_HOME" text="Tel Home" runat="server"></asp:Label></td>
        <td style="width: 306px">
            <asp:TextBox ID="tbTEL_HOME" runat="server" maxlength="30" Width="102px"></asp:TextBox></td>
        <td style="width: 104px">
    <asp:Label ID="lblPROV_CODE" text="Province" runat="server"></asp:Label></td>
        <td rowspan="1" style="width: 306px">
    <asp:DropDownList ID="ddlPROV_CODE" runat="server" Width="196px" ></asp:DropDownList></td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblTEL_INDOOR" text="Tel Indoor" runat="server"></asp:Label></td>
        <td style="width: 306px">
            <asp:TextBox ID="tbTEL_INDOOR" runat="server" maxlength="30"></asp:TextBox></td>
        <td style="width: 104px">
        </td>
        <td rowspan="1" style="width: 306px">
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblDATEOFBIRTH" text="Date of  Birth" runat="server" Width="88px"></asp:Label></td>
        <td style="width: 306px">
            <asp:DropDownList ID="ddlDayDATEOFBIRTH" runat="server"></asp:DropDownList>
<asp:DropDownList ID="ddlMonthDATEOFBIRTH" runat="server"></asp:DropDownList>
<asp:DropDownList ID="ddlYearDATEOFBIRTH" runat="server" Width="82px"></asp:DropDownList>
        </td>
        <td bgcolor="#6699cc" style="width: 104px">
            <asp:Label ID="lblUSERNAME" text="Username" runat="server" Width="133px" Font-Bold="True" ForeColor="Black"></asp:Label></td>
        <td bgcolor="#6699cc" rowspan="1" style="width: 306px">
            <asp:TextBox ID="tbUSERNAME" runat="server" maxlength="10" Width="132px"></asp:TextBox></td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblDATEOFSTART" text="Date of Start" runat="server"></asp:Label></td>
        <td style="width: 306px">
            <asp:DropDownList ID="ddlDayDATEOFSTART" runat="server"></asp:DropDownList>
<asp:DropDownList ID="ddlMonthDATEOFSTART" runat="server"></asp:DropDownList>
<asp:DropDownList ID="ddlYearDATEOFSTART" runat="server" Width="83px"></asp:DropDownList>
        </td>
        <td bgcolor="#6699cc" style="width: 104px">
            <asp:Label ID="lblPASSWD" text="Password" runat="server" Font-Bold="True" ForeColor="Black" Width="133px"></asp:Label></td>
        <td bgcolor="#6699cc" rowspan="1" style="width: 306px">
            <asp:TextBox ID="tbPASSWD" runat="server" maxlength="20" Width="131px"></asp:TextBox></td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblPOSITION_CODE" text="Position" runat="server"></asp:Label></td>
        <td style="width: 306px">
            <asp:DropDownList ID="ddlPOSITION_CODE" runat="server" Width="247px" ></asp:DropDownList></td>
        <td bgcolor="#6699cc" style="width: 104px">
            <asp:Label ID="Label3" runat="server" Text="Role" Width="131px" Font-Bold="True"></asp:Label></td>
        <td bgcolor="#6699cc" rowspan="1" style="width: 306px">
            <asp:DropDownList ID="ddlRoleId" runat="server" Width="139px">
            </asp:DropDownList>&nbsp;<asp:Button ID="Button1" runat="server" Text="Add Role" />
        </td>
    </tr>
    <tr>
        <td style="height: 19px">
        </td>
        <td style="width: 306px; height: 19px;">
        </td>
        <td style="width: 104px; height: 19px;">
        </td>
        <td rowspan="1" style="width: 306px; height: 19px;">
            &nbsp;</td>
    </tr>
<tr><td style="height: 25px"></td><td style="width: 306px; height: 25px;"><asp:Button ID="btnAdd" runat="server" Text="Add" BackColor="#C0FFC0" Font-Bold="True" ForeColor="Black" Width="80px" />
    <asp:Button ID="btnUpdate" runat="server" Text="Update" BackColor="#C0FFC0" Font-Bold="True" ForeColor="Black" Width="84px" />
    <asp:Button ID="btnDelete" runat="server" Text="Delete" BackColor="#C0FFC0" Font-Bold="True" ForeColor="Black" Width="84px" />
<asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="80px" BackColor="#C0FFC0" Font-Bold="True" /></td>
    <td style="width: 104px; height: 25px;">
        &nbsp;</td>
    <td style="width: 306px; height: 25px;">
        <asp:GridView ID="GridUserInrole" runat="server" CellPadding="4" 
            ForeColor="#333333" GridLines="None" Width="231px">
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        &nbsp;</td>
</tr>
<tr><td colspan="5">
    &nbsp; &nbsp;
</td></tr>
</table></asp:Panel>
</asp:Content>
