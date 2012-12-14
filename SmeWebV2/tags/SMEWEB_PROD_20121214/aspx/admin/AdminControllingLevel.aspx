<%@ Page Language="VB" AutoEventWireup="true" MasterPageFile="~/MasterPage.master"
CodeFile="AdminControllingLevel.aspx.vb"  
Inherits="_AdminControllingLevel"  MaintainScrollPositionOnPostback="true"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" Runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
   
    <table>
        <tr>
            <td style="width: 124px; height: 6px">
<table>
	<tr><td style="width: 638px">
		<asp:Label ID="lblSearchVar" runat="server" Text="Search"></asp:Label>
		<asp:DropDownList ID="ddlFieldValue" runat="server" >
		<asp:ListItem Text="LEVEL_ID" Value="LEVEL_ID"></asp:ListItem>
		<asp:ListItem Text="LEVEL_CODE" Value="LEVEL_CODE"></asp:ListItem>
		<asp:ListItem Text="LEVEL_NAME" Value="LEVEL_NAME"></asp:ListItem>
		<asp:ListItem Text="LEVEL_ROOT" Value="LEVEL_ROOT"></asp:ListItem>
		</asp:DropDownList>
		<asp:DropDownList ID="ddlOperator" runat="server" >
		<asp:ListItem Text="Contains" Value=" LIKE "></asp:ListItem>
		<asp:ListItem Text="Does Not Contain" Value=" Not LIKE "></asp:ListItem>
		<asp:ListItem Text="Less Than" Value=" &lt; "></asp:ListItem>
		<asp:ListItem Text="Equal To" Value=" = "></asp:ListItem>
		<asp:ListItem Text="Greater Than" Value=" &gt; "></asp:ListItem>
		<asp:ListItem Text="Not Equal To" Value=" &lt;&gt; "></asp:ListItem>
		</asp:DropDownList>
		<asp:TextBox ID="tbSearchValue" runat="server"></asp:TextBox>
		<asp:Button ID="btnSearchVar" runat="server" Text="Search" />
		<asp:Button ID="btnAddNew" runat="server" Text="Add" />
	</td></tr>
	<tr><td style="width: 638px">
<asp:GridView ID="GridAdminControllingLevel" runat="server" AutoGenerateColumns="False"  AllowPaging="True" Width="592px" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4">
	<Columns>
		<asp:CommandField ShowSelectButton="True" />
		<asp:BoundField DataField="LEVEL_ID" HeaderText="LEVEL_ID" />
		<asp:BoundField DataField="LEVEL_CODE" HeaderText="LEVEL_CODE" />
		<asp:BoundField DataField="LEVEL_NAME" HeaderText="LEVEL_NAME" />
		<asp:BoundField DataField="LEVEL_ROOT" HeaderText="LEVEL_ROOT" />
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
	</td></tr>
	</table>
                &nbsp;</td>
            <td style="width: 538px; height: 6px">
<asp:Panel ID="PanelAdminControllingLevel" runat="server" Height="200px" Width="400px">
<table border="0">
<tr><td colspan="3">AdminControllingLevel</td></tr><tr><td style="width: 139px"><asp:Label ID="lblLEVEL_ID" text="LEVEL_ID" runat="server"></asp:Label></td><td><asp:TextBox ID="tbLEVEL_ID" runat="server" maxlength="5"></asp:TextBox>
<asp:Button ID="btnSearch" runat="server" Text="Search" /> 
</td></tr>
<tr><td style="width: 139px"><asp:Label ID="lblLEVEL_CODE" text="LEVEL_CODE" runat="server"></asp:Label></td><td><asp:TextBox ID="tbLEVEL_CODE" runat="server" maxlength="10" Width="154px"></asp:TextBox>
</td></tr>
<tr><td style="width: 139px"><asp:Label ID="lblLEVEL_NAME" text="LEVEL_NAME" runat="server"></asp:Label></td><td><asp:TextBox ID="tbLEVEL_NAME" runat="server" maxlength="255" Width="441px"></asp:TextBox>
</td></tr>
<tr><td style="width: 139px"><asp:Label ID="lblLEVEL_ROOT" text="LEVEL_ROOT" runat="server"></asp:Label></td><td><asp:DropDownList ID="ddlLEVEL_ROOT" runat="server" Width="442px" ></asp:DropDownList></td></tr>
<tr><td colspan="3">
<asp:Button ID="btnAdd" runat="server" Text="Add" /> 
<asp:Button ID="btnUpdate" runat="server" Text="Update" /> 
<asp:Button ID="btnDelete" runat="server" Text="Delete" />
<asp:Button ID="btnCancel" runat="server" Text="Cancel" />
</td></tr>
</table></asp:Panel>
            </td>
        </tr>
        <tr>
            <td style="width: 124px" align="left" valign="top">
                                Leaders&nbsp; in Level
                                <asp:Button ID="btnAddNew2" runat="server" Text="Add" /><br />
                                <asp:GridView ID="GridAdminControllingLeadsinlevel" runat="server"
                                    AutoGenerateColumns="False" Width="457px" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="LEVEL_ID" HeaderText="LEVEL_ID" />
                                        <asp:BoundField DataField="EMP_ID" HeaderText="EMP_ID" />
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
                &nbsp;
                                    <table border="0">
                                        <tr>
                                            <td colspan="3" style="width: 395px">
                                                AdminControllingLeadsinlevel</td>
                                        </tr>
                                        <tr>
                                            <td style="width: 113px">
                                            </td>
                                            <td style="width: 318px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 113px">
                                                <asp:Label ID="lblEMP_ID" runat="server" Text="EMP_ID"></asp:Label></td>
                                            <td style="width: 318px">
                                                <asp:DropDownList ID="ddlEMP_ID" runat="server" Width="297px">
                                                </asp:DropDownList></td>
                                        </tr>
                                        <tr>
                                            <td colspan="3" style="width: 395px">
                                                <asp:Button ID="btnAdd2" runat="server" Text="Add" />
                                                <asp:Button ID="btnUpdate2" runat="server" Text="Update" Enabled="False" />
                                                <asp:Button ID="btnDelete2" runat="server" Text="Delete" />
                                                <asp:Button ID="btnCancel2" runat="server" Text="Cancel" />
                                            </td>
                                        </tr>
                                    </table>
            </td>
            <td style="width: 538px">
                Users in Level
                <asp:Button ID="btnAddnew3" runat="server" Text="Add" /><br />
                <asp:GridView ID="GridAdminControllingUsersinlevel" runat="server"
                    AutoGenerateColumns="False" Width="420px" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" PageSize="1">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="LEVEL_ID" HeaderText="LEVEL_ID" />
                        <asp:BoundField DataField="EMP_ID" HeaderText="EMP_ID" />
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
                &nbsp; &nbsp;
                    <table border="0">
                        <tr>
                            <td colspan="3" style="width: 408px">
                                AdminControllingUsersinlevel</td>
                        </tr>
                        <tr>
                            <td style="width: 101px">
                            </td>
                            <td style="width: 148px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 101px">
                                <asp:Label ID="Label4" runat="server" Text="EMP_ID"></asp:Label></td>
                            <td style="width: 148px">
                                <asp:DropDownList ID="DDLempid2" runat="server" Width="307px">
                                </asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="width: 408px">
                                <asp:Button ID="btnAdd3" runat="server" Text="Add" />
                                <asp:Button ID="btnUpdate3" runat="server" Text="Update" Enabled="False" />
                                <asp:Button ID="btnDelete3" runat="server" Text="Delete" />
                                <asp:Button ID="btnCancel3" runat="server" Text="Cancel" />
                            </td>
                        </tr>
                    </table>
            </td>
        </tr>
    </table>
</asp:Content>
