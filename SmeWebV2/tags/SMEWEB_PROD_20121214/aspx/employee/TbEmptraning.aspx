<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="TbEmptraning.aspx.vb" Inherits="_TbEmptraning" Title="Training" %>

<%@ Register Src="MenuEmployee.ascx" TagName="MenuEmployee" TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <uc3:MenuEmployee ID="MenuEmployee1" runat="server" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Panel ID="PanelGridTbEmptraning" runat="server" Height="200px" Width="500px">
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Training history" Width="144px"></asp:Label>&nbsp;<br />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="GridTbEmptraning" runat="server" AutoGenerateColumns="False" AllowPaging="True"
                        Width="923px" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px"
                        CellPadding="4">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="ID_NO" HeaderText="ID" />
                            <asp:BoundField DataField="EMP_ID" HeaderText="Employee ID" />
                            <asp:BoundField DataField="NAMETRAIN" HeaderText="Train Name" />
                            <asp:BoundField DataField="PLACE" HeaderText="Place" />
                            <asp:BoundField DataField="STARTDATE" HeaderText="Date of Start" DataFormatString="{0:dd/MM/yyyy}"
                                HtmlEncode="False" />
                            <asp:BoundField DataField="FINISHDATE" HeaderText="Date of finish" DataFormatString="{0:dd/MM/yyyy}"
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
    <asp:Panel ID="PanelTbEmptraning" runat="server" Height="200px" Width="400px" BackColor="Info"
        BorderColor="#C04000" BorderStyle="Dashed" BorderWidth="1px">
        <table border="0">
            <tr>
                <td colspan="3">
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Employee Ttraning History"
                        Width="219px"></asp:Label><br />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblID_NO" Text="ID" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="tbID_NO" runat="server" MaxLength="10" ReadOnly="True" Width="58px"></asp:TextBox>&nbsp;
                    (Auto Number)
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblEMP_ID" Text="Employee ID" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="tbEMP_ID" runat="server" MaxLength="50" ReadOnly="True" Width="108px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblNAMETRAIN" Text="Train Name" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="tbNAMETRAIN" runat="server" MaxLength="255" Width="257px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblPLACE" Text="Place" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="tbPLACE" runat="server" MaxLength="100" Width="257px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblSTARTDATE" Text="Date of Start" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlDaySTARTDATE" runat="server">
                    </asp:DropDownList>
                    <asp:DropDownList ID="ddlMonthSTARTDATE" runat="server">
                    </asp:DropDownList>
                    <asp:DropDownList ID="ddlYearSTARTDATE" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblFINISHDATE" Text="Date of finish" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlDayFINISHDATE" runat="server">
                    </asp:DropDownList>
                    <asp:DropDownList ID="ddlMonthFINISHDATE" runat="server">
                    </asp:DropDownList>
                    <asp:DropDownList ID="ddlYearFINISHDATE" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    &nbsp;&nbsp;
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
