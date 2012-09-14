<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SearchEmployee.aspx.vb" Inherits="aspx_employee_SearchEmployee" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Search Employee ( ค้นหาพนักงาน) </title>
 
</head>
<body bgcolor="ghostwhite">
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label1" runat="server" Text="Search(id,name,lastname)"></asp:Label>
        <asp:TextBox ID="tbSearch" runat="server" Width="111px"></asp:TextBox><asp:Button
            ID="BtnSearch" runat="server" Text="Search" Width="53px" />
        <asp:Button
            ID="BtnShowall" runat="server" Text="All" Width="35px" />&nbsp;
        <asp:Panel ID="Panel1" runat="server" Height="450px" ScrollBars="Vertical" Width="680px" BackColor="White" BorderWidth="1px">
        <asp:TreeView ID="LevelTree" runat="server" ExpandDepth="1" Width="295px" BorderStyle="None" BorderWidth="1px" Height="110px">
            <LeafNodeStyle NodeSpacing="0px" />
        </asp:TreeView>
        </asp:Panel>
    
    </div>
    </form>
</body>
</html>
