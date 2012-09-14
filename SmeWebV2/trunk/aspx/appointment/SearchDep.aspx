<%@ Page Language="VB" AutoEventWireup="true" CodeFile="SearchDep.aspx.vb"  Inherits="_SearchDep" %>
<html>
<head>
<link href="style/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body style="margin-top:0; margin-left:0;">
<form id="formIdBranch"  runat="server">
<asp:Panel ID="PanelGridIdBranch" runat="server" Height="200px" Width="500px" HorizontalAlign="Left" ScrollBars="Horizontal">
<table>
	<tr><td>
		<asp:Label ID="lblSearchVar" runat="server" Text="Search"></asp:Label>
		<asp:DropDownList ID="ddlFieldValue" runat="server" >
		<asp:ListItem Text="Id_Branch" Value="Id_Branch"></asp:ListItem>
		<asp:ListItem Text="Branch_T" Value="Branch_T"></asp:ListItem>
		<asp:ListItem Text="Branch_E" Value="Branch_E"></asp:ListItem>
		
		</asp:DropDownList>
		<asp:DropDownList ID="ddlOperator" runat="server" >
		<asp:ListItem Text="Contains" Value=" LIKE "></asp:ListItem>
		<asp:ListItem Text="Does Not Contain" Value=" Not LIKE "></asp:ListItem>
		<asp:ListItem Text="Less Than" Value=" &lt; "></asp:ListItem>
		<asp:ListItem Text="Equal To" Value=" = "></asp:ListItem>
		<asp:ListItem Text="Greater Than" Value=" &gt; "></asp:ListItem>
		<asp:ListItem Text="Not Equal To" Value=" &lt;&gt; "></asp:ListItem>
		</asp:DropDownList>
		<asp:TextBox ID="tbSearchValue" runat="server" Width="119px"></asp:TextBox>
		<asp:Button ID="btnSearchVar" runat="server" Text="Search" />&nbsp;
	</td></tr>
	<tr><td>
<asp:GridView ID="GridIdBranch" runat="server" AutoGenerateColumns="False"  AllowPaging="True" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" Width="507px">
	<Columns>
		<asp:CommandField ShowSelectButton="True" />
		<asp:BoundField DataField="Id_Branch" HeaderText="Id_Branch" />
		<asp:BoundField DataField="Branch_T" HeaderText="Branch_T" />
		<asp:BoundField DataField="Branch_E" HeaderText="Branch_E" />
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
	</asp:Panel>
</form>
</body>
</html>

