<%@ Page Language="VB" AutoEventWireup="true" CodeFile="Vcreditprocess.aspx.vb"  Inherits="_Vcreditprocess" %>

<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31BF3856AD364E35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
    <%@ Register Src="~/HeaderControl/HeaderControl.ascx" TagName="HeaderControl" TagPrefix="uc1" %>
<%@ Register Src="~/HeaderControl/HeadTagControl.ascx" TagName="HeadTagControl"
    TagPrefix="uc2" %>

<html>
<head>
 <uc2:HeadTagControl ID="HeadTagControl1" runat="server" />
<link href="../../css/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
<form id="formVcreditprocess"  runat="server">
       <uc1:HeaderControl ID="HeaderControl1" runat="server" />
		<asp:Label ID="lblSearchVar" runat="server" Text="Search"></asp:Label>
		<asp:DropDownList ID="ddlFieldValue" runat="server" Width="85px" >
		<asp:ListItem Text="ID" Value="ID"></asp:ListItem>
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
    &nbsp;
    <br />
<asp:GridView ID="GridVcreditprocess" runat="server" AutoGenerateColumns="False"  AllowPaging="True" Width="665px" CellPadding="4" ForeColor="#333333" GridLines="None">
	<Columns>
		<asp:BoundField DataField="ID" HeaderText="ID" />
		<asp:BoundField DataField="PROCESS" HeaderText="PROCESS" />
		<asp:BoundField DataField="Process_date" HeaderText="Process_date" />
        <asp:TemplateField>
                    <ItemTemplate>
              <asp:ImageButton ID="ImageButton1" runat="server" PostBackUrl='<%# "annalscredit.aspx?annals_id=" + Eval("id")  %>' ImageUrl="~/images/word.gif" />
                   </ItemTemplate>
        </asp:TemplateField>
	</Columns>
	<EmptyDataTemplate>
	 Don't have data
	</EmptyDataTemplate>
    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
    <AlternatingRowStyle BackColor="White" />
	</asp:GridView>
	</form>
</body>
</html>

