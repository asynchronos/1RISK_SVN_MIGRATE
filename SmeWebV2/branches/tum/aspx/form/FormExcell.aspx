<%@ Page Language="VB" AutoEventWireup="false" CodeFile="FormExcell.aspx.vb" Inherits="aspx_form_FormExcell" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<style type="text/css">
  body {
         font-size:small ;
  }
</style>
</head>

<body>
    <form id="form1" runat="server">
    <div>
        <asp:Button ID="Button1" runat="server" Text="Load data from excell" />
    <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#DEDFDE" 
            BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black"  
            GridLines="Vertical" style="font-size: x-small; font-family: Tahoma">
        <RowStyle BackColor="#F7F7DE" />
        <FooterStyle BackColor="#CCCC99" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
        <asp:TextBox ID="FormIDTextBox" runat="server"></asp:TextBox>
        <asp:Button ID="SaveButton" runat="server" Text="Create data " />
    </div>
    </form>
    
</body>
</html>
