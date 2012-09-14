<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CAControlling.aspx.vb" Inherits="CAControlling" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>CA Controlling</title>
</head>
<body>
    <form id="form1" runat="server">
        <table width="100%">
            <tr>
                <td valign="top" align="left">   
                    <asp:TreeView ID="TreeView1" runat="server" ImageSet="Contacts">
                    </asp:TreeView>
                   
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
