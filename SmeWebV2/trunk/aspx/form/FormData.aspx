<%@ Page Language="VB" AutoEventWireup="false" CodeFile="FormData.aspx.vb" Inherits="aspx_form_FormData" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/ui-lightness/jquery-ui-1.8.23.custom.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        if (window.screen) {
            self.moveTo(0, 0);
            self.focus();
            self.resizeTo(screen.availWidth, screen.availHeight);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h2>
            <asp:Label ID="LabelName" runat="server" Text="" Style="font-weight: 700; color: #0033CC;"></asp:Label>
            &nbsp;
            <asp:Button ID="BtnClose" runat="server" Text="Close" />
            &nbsp;<asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/excell.jpg"
                Width="16px" />
            &nbsp;&lt; -- Export to excell&nbsp;</h2>
        <h4>
            <asp:Label ID="LabelDesc" runat="server" Text="" Style="font-weight: 700"></asp:Label>
        </h4>
        <h4>
            <asp:Label ID="LabelInsert" runat="server" Text="Insert Data"></asp:Label>
        </h4>
        <asp:GridView ID="GridForm" runat="server"  AllowSorting="true"
            Style="font-size: smaller; font-family: Tahoma" Font-Names="Tahoma"  
            BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
            ForeColor="Black" GridLines="Vertical" HeaderStyle-CssClass="ui-widget-header"  >
            <AlternatingRowStyle BackColor="White" />
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White"  Wrap="true"   />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE"  />
             <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
    </div>
    </form>
</body>
</html>
