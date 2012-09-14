<%@ Page Language="VB" AutoEventWireup="true" CodeFile="SearchCustomerRisk.aspx.vb"  Inherits="_SearchCustomerRisk" %>
<html>

<body style="margin-top:0; margin-left:0; font-size:small ">
<form id="formTbCustomerRisk"  runat="server">
<asp:Panel ID="PanelGridTbCustomerRisk" runat="server" Height="200px" Width="500px" ScrollBars="Horizontal">
<table>
	<tr><td>
		<asp:Label ID="lblSearchVar" runat="server" Text="Search"></asp:Label>
		<asp:DropDownList ID="ddlFieldValue" runat="server" >
		<asp:ListItem Text="Cif" Value="Cif"></asp:ListItem>
		<asp:ListItem Text="Name" Value="Name"></asp:ListItem>
	   </asp:DropDownList>
		<asp:DropDownList ID="ddlOperator" runat="server" >
		<asp:ListItem Text="Contains" Value=" LIKE "></asp:ListItem>
		<asp:ListItem Text="Does Not Contain" Value=" Not LIKE "></asp:ListItem>
		<asp:ListItem Text="Less Than" Value=" &lt; "></asp:ListItem>
		<asp:ListItem Text="Equal To" Value=" = "></asp:ListItem>
		<asp:ListItem Text="Greater Than" Value=" &gt; "></asp:ListItem>
		<asp:ListItem Text="Not Equal To" Value=" &lt;&gt; "></asp:ListItem>
		</asp:DropDownList>
		<asp:TextBox ID="tbSearchValue" runat="server" Width="112px"></asp:TextBox>
		<asp:Button ID="btnSearchVar" runat="server" Text="Search" />&nbsp;
	</td></tr>
	<tr><td style="height: 293px">
<asp:GridView ID="GridTbCustomerRisk" runat="server" AutoGenerateColumns="False"  AllowPaging="True" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" Width="486px">
	<Columns>
		<asp:CommandField ShowSelectButton="True" />
		<asp:BoundField DataField="Cif" HeaderText="Cif" />
		<asp:BoundField DataField="Name" HeaderText="Name" />

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

