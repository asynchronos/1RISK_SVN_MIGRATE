<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CMControllingTree.aspx.vb" Inherits="employee_CMControllingTree" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Search CM</title>
    <script type="text/javascript" src="../../js/common.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label1" runat="server" Text="Keywords(ID,NAME) : " 
            Font-Bold="True" ForeColor="Red"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Search" />
        <asp:TreeView ID="TreeView1" runat="server" ImageSet="Contacts">
        </asp:TreeView>
    </div>
    </form>
</body>
</html>
