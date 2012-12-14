<%@ Page Language="VB" AutoEventWireup="true" CodeFile="SearchRisk.aspx.vb"  Inherits="_SearchRisk" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Search Risk</title>
    <link href="/style/StyleSheet.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../js/common.js"></script>
</head>
<body style="margin-top:0; margin-left:0;">
<form id="formVScheduleRiskTeam"  runat="server">
<asp:Panel ID="PanelGridVScheduleRiskTeam" runat="server" Height="100%"  Width="100%"
     HorizontalAlign="Left" ScrollBars="Horizontal">
<table>
	<tr><td>
		<asp:Label ID="lblSearchVar" runat="server" Text="Search"></asp:Label>
		<asp:DropDownList ID="ddlFieldValue" runat="server" >
		<asp:ListItem Text="ID" Value="ID"></asp:ListItem>
		<asp:ListItem Text="Name" Value="Name"></asp:ListItem>
		<asp:ListItem Text="Team_name" Value="Team_name"></asp:ListItem>
		<asp:ListItem Text="Tel" Value="Tel"></asp:ListItem>
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
		<asp:Button ID="btnSearchVar" runat="server" Text="Search" />&nbsp;
	</td></tr>
	<tr><td style="height: 293px">
<asp:GridView ID="GridVScheduleRiskTeam" runat="server" AutoGenerateColumns="False"  AllowPaging="True" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" Width="737px">
	<Columns>
        <asp:TemplateField ShowHeader="False">
            <ItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select" 
                OnClientClick='<%# "return2Opener([""" + Eval("Name") + ":" + Eval("ID") + """]);window.close();return false;" %>' Text="Select"></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="ID">
            <EditItemTemplate>
                <asp:TextBox ID="IDTextBox" runat="server" Text='<%# Bind("ID") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="IDLabel" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Name">
            <EditItemTemplate>
                <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
		<asp:BoundField DataField="Team_name" HeaderText="Team_name" />
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

