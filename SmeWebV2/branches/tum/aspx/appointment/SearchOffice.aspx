<%@ Page Language="VB" AutoEventWireup="true" CodeFile="SearchOffice.aspx.vb"  Inherits="_SearchOffice" %>
<html>
<head>
<link href="style/StyleSheet.css" rel="stylesheet" type="text/css" />
    <link href="../../css/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body style="margin-top:0; margin-left:0;">
<form id="formVScheduleOffice"  runat="server">
<asp:Panel ID="PanelGridVScheduleOffice" runat="server" Height="255px" Width="535px" ScrollBars="Horizontal">
<table>
	<tr><td style="width: 495px">
		<asp:Label ID="lblSearchVar" runat="server" Text="Search"></asp:Label>
		<asp:DropDownList ID="ddlFieldValue" runat="server" Width="90px" >
		<asp:ListItem Text="ID" Value="ID"></asp:ListItem>
		<asp:ListItem Text="Name" Value="Name"></asp:ListItem>
		<asp:ListItem Text="Dept_Name" Value="Dept_Name"></asp:ListItem>
		<asp:ListItem Text="Tel" Value="Tel"></asp:ListItem>
		</asp:DropDownList>
		<asp:DropDownList ID="ddlOperator" runat="server" Width="109px" >
		<asp:ListItem Text="Contains" Value=" LIKE "></asp:ListItem>
		<asp:ListItem Text="Does Not Contain" Value=" Not LIKE "></asp:ListItem>
		<asp:ListItem Text="Less Than" Value=" &lt; "></asp:ListItem>
		<asp:ListItem Text="Equal To" Value=" = "></asp:ListItem>
		<asp:ListItem Text="Greater Than" Value=" &gt; "></asp:ListItem>
		<asp:ListItem Text="Not Equal To" Value=" &lt;&gt; "></asp:ListItem>
		</asp:DropDownList>
		<asp:TextBox ID="tbSearchValue" runat="server" Width="116px"></asp:TextBox>
		<asp:Button ID="btnSearchVar" runat="server" Text="Search" />&nbsp;
	</td></tr>
	<tr><td style="width: 495px; height: 292px">
<asp:GridView ID="GridVScheduleOffice" runat="server" AutoGenerateColumns="False"  AllowPaging="True" Width="465px" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4">
	<Columns>
		<asp:CommandField ShowSelectButton="True" />
		<asp:BoundField DataField="ID" HeaderText="ID" />
		<asp:BoundField DataField="Name" HeaderText="Name" />
		<asp:BoundField DataField="Dept_Name" HeaderText="Dept_Name" />
		<asp:BoundField DataField="Tel" HeaderText="Tel" />
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

