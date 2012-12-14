<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="TbEducation.aspx.vb" Inherits="_TbEducation" Title="Education" %>

<%@ Register Src="MenuEmployee.ascx" TagName="MenuEmployee" TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <uc3:MenuEmployee ID="MenuEmployee1" runat="server" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Panel ID="PanelGridTbEducation" runat="server" Height="200px" Width="500px">
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Education  history"
                        Width="148px"></asp:Label><br />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="GridTbEducation" runat="server" AutoGenerateColumns="False" AllowPaging="True"
                        Width="911px" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px"
                        CellPadding="4">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="ID" HeaderText="ID" />
                            <asp:BoundField DataField="DEGREE_NAME" HeaderText="Degree" />
                            <asp:BoundField DataField="U_NAME" HeaderText="University Name" />
                            <asp:BoundField DataField="MAJOR" HeaderText="Major" />
                            <asp:BoundField DataField="DATEOFGRADUAT" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Date of Graduate"
                                HtmlEncode="False" />
                        </Columns>
                        <EmptyDataTemplate>
                            Don't have data
                        </EmptyDataTemplate>
                        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                        <RowStyle BackColor="White" ForeColor="#330099" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                    </asp:GridView>
                    <asp:Button ID="btnAddNew" runat="server" Text="Add ( เพิ่มข้อมูล )" Width="120px" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel ID="PanelTbEducation" runat="server" Height="200px" Width="427px" BackColor="Info"
        BorderColor="#C04000" BorderStyle="Dashed" BorderWidth="1px">
        <table border="0" style="width: 413px">
            <tr>
                <td colspan="3">
                    &nbsp;<asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Education  history"
                        Width="146px"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblID" Text="ID" runat="server"></asp:Label>
                </td>
                <td style="width: 258px">
                    <asp:TextBox ID="tbID" runat="server" MaxLength="10" ReadOnly="True" Width="48px"></asp:TextBox>&nbsp;
                    (Auto Number)
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblEMP_ID" Text="Employee ID" runat="server"></asp:Label>
                </td>
                <td style="width: 258px">
                    <asp:TextBox ID="tbEMP_ID" runat="server" MaxLength="10" ReadOnly="True" Width="78px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblDEGREE_CODE" Text="Degree" runat="server"></asp:Label>
                </td>
                <td style="width: 258px">
                    <asp:DropDownList ID="ddlDEGREE_CODE" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblU_NAME" Text="University Name" runat="server"></asp:Label>
                </td>
                <td style="width: 258px">
                    <asp:TextBox ID="tbU_NAME" runat="server" MaxLength="100" Width="265px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblMAJOR" Text="Major" runat="server"></asp:Label>
                </td>
                <td style="width: 258px">
                    <asp:TextBox ID="tbMAJOR" runat="server" MaxLength="50" Width="266px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblDATEOFGRADUAT" Text="Date of Graduate" runat="server"></asp:Label>
                </td>
                <td style="width: 258px">
                    <asp:DropDownList ID="ddlDayDATEOFGRADUAT" runat="server">
                    </asp:DropDownList>
                    <asp:DropDownList ID="ddlMonthDATEOFGRADUAT" runat="server">
                    </asp:DropDownList>
                    <asp:DropDownList ID="ddlYearDATEOFGRADUAT" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td style="width: 258px">
                    &nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td style="width: 258px">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Button ID="btnAdd" runat="server" Text="Add" />
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" />
                    <asp:Button ID="btnDelete" runat="server" Text="Delete" />
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" />
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>
