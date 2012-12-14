<%@ Page Language="VB" AutoEventWireup="true" CodeFile="UploadFileType.aspx.vb"  Inherits="_UploadFileType" %>
<html>
<body>
<form id="formUploadFileType"  runat="server">
<asp:Panel ID="PanelGridUploadFileType" runat="server" Height="200px" Width="500px">
<table>
	<tr><td>
		<asp:Label ID="lblSearchVar" runat="server" Text="Search"></asp:Label>
		<asp:DropDownList ID="ddlFieldValue" runat="server" >
		<asp:ListItem Text="ID" Value="ID"></asp:ListItem>
		<asp:ListItem Text="TYPE" Value="TYPE"></asp:ListItem>
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
	<tr><td>
<asp:GridView ID="GridUploadFileType" runat="server" AutoGenerateColumns="False"  AllowPaging="True">
	<Columns>
		<asp:CommandField ShowSelectButton="True" />
		<asp:BoundField DataField="ID" HeaderText="ID"  Visible="True" />
		<asp:BoundField DataField="TYPE" HeaderText="TYPE"  Visible="True" />
	</Columns>
	<EmptyDataTemplate>
	 Don't have data
	</EmptyDataTemplate>
	</asp:GridView>
	</td></tr>
	</table>
	</asp:Panel>
<asp:Panel ID="PanelUploadFileType" runat="server" Height="200px" Width="400px">
<table border="0">
<tr><td colspan="3">UploadFileType</td></tr><tr><td><asp:Label ID="lblID" text="ID" runat="server"></asp:Label></td><td><asp:TextBox ID="tbID" runat="server" maxlength="10"></asp:TextBox>
<asp:Button ID="btnSearch" runat="server" Text="Search" /> 
</td></tr>
<tr><td><asp:Label ID="lblTYPE" text="TYPE" runat="server"></asp:Label></td><td><asp:TextBox ID="tbTYPE" runat="server" maxlength="255"></asp:TextBox>
</td></tr>
<tr><td colspan="3">
<asp:Button ID="btnAdd" runat="server" Text="Add" /> 
<asp:Button ID="btnUpdate" runat="server" Text="Update" /> 
<asp:Button ID="btnDelete" runat="server" Text="Delete" />
<asp:Button ID="btnCancel" runat="server" Text="Cancel" />
</td></tr>
</table></asp:Panel></form>
</body>
</html>

