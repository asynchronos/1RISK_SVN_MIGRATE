<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="aspx_Default" %>


<%@ Register src="../Controls/editor/editor_manager.ascx" tagname="editor_manager" tagprefix="uc1" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
   
    <uc1:editor_manager ID="editor_manager1" runat="server" />
   
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="file:///c/a.doc">HyperLink</asp:HyperLink>
   
    </form>
</body>
</html>
