<%@ Page Language="VB" AutoEventWireup="true" MasterPageFile="~/MasterPage.master"
    CodeFile="empmanage.aspx.vb" Inherits="_empmanage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            font-size: small;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div>
        <asp:Panel ID="PanelGridAdminEmployee" runat="server">
            <table align="center">
                <tr>
                    <td>
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
                        <asp:GridView ID="GridAdminEmployee" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                            Width="728px" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px"
                            CellPadding="4" PageSize="15">
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
    </div>
    <div>
        <asp:Panel ID="PanelTbEmployee" runat="server" Width="811px" BackColor="Info"
            BorderColor="#FFC080" BorderStyle="Dashed" BorderWidth="1px">
            <table border="0">
                <tr>
                    <td colspan="5" align="left">
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Employee Profile" Width="146px"></asp:Label><br />
                    </td>
                </tr>
                <tr>
                    <td style="height: 26px">
                        <asp:Label ID="lblEMP_ID" Text="Employee ID" runat="server"></asp:Label>
                    </td>
                    <td style="width: 306px; height: 26px;">
                        <asp:TextBox ID="tbEMP_ID" runat="server" MaxLength="10" Width="98px"></asp:TextBox>
                    </td>
                    <td style="width: 104px; height: 26px;">
                        &nbsp;</td>
                    <td rowspan="20" style="width: 306px" align="left" valign="top">
                        &nbsp;<br />
                        <br />
                        <table>
                            <tr>
                                <td bgcolor="#33eedd" rowspan="1" style="width: 306px">
                                    <span class="style1"><strong>จัดการ Role สิทธิ์การใช้ </strong></span>
                                    <br />
                                    <asp:DropDownList ID="ddlRoleId" runat="server" Width="139px">
                                    </asp:DropDownList>
                                    &nbsp;<asp:Button ID="Button1" runat="server" Text="เพิ่ม Role" /> 

                                    <br />
                                    &nbsp;<asp:GridView ID="GridUserInrole" runat="server" CellPadding="4" 
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
                                    <br />
                                  <span class="style1">  * กรณีลบเลือก Select role แล้ว Delete </span></td>
                            </tr>
                            <tr>
                                <td style="height: 25px">
                                </td>
                                <td style="width: 306px; height: 25px;">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
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
                    <td style="width: 104px">
                        <asp:Label ID="lblEMAIL" Text="Email" runat="server" Width="81px"></asp:Label>
                    </td>
                    <td style="width: 306px">
                        <asp:TextBox ID="tbEMAIL" runat="server" MaxLength="30"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td bgcolor="#6699cc" style="width: 104px">
                        <asp:Label ID="lblUSERNAME" Text="Username" runat="server" Width="133px" Font-Bold="True"
                            ForeColor="Black"></asp:Label>
                    </td>
                    <td bgcolor="#6699cc" rowspan="1" style="width: 306px">
                        <asp:TextBox ID="tbUSERNAME" runat="server" MaxLength="10" Width="132px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#6699cc" style="width: 104px">
                        <asp:Label ID="lblPASSWD" Text="Password" runat="server" Font-Bold="True" ForeColor="Black"
                            Width="133px"></asp:Label>
                    </td>
                    <td bgcolor="#6699cc" rowspan="1" style="width: 306px">
                        <asp:TextBox ID="tbPASSWD" runat="server" MaxLength="20" Width="131px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="5">
                        <br />
                        <asp:Button ID="btnAdd" runat="server" BackColor="#C0FFC0" Font-Bold="True" 
                            ForeColor="Black" Text="Add" Width="80px" />
                        <asp:Button ID="btnUpdate" runat="server" BackColor="#C0FFC0" Font-Bold="True" 
                            ForeColor="Black" Text="Update" Width="84px" />
                        <asp:Button ID="btnDelete" runat="server" BackColor="#C0FFC0" Font-Bold="True" 
                            ForeColor="Black" Text="Delete" Width="84px" />
                        <asp:Button ID="btnCancel" runat="server" BackColor="#C0FFC0" Font-Bold="True" 
                            Text="Cancel" Width="80px" />
                        <br />
                        &nbsp;
                        <br />
                        &nbsp;
                        <br />
                    </td>
                </tr>
            </table>
            
        </asp:Panel>
    </div>
</asp:Content>
