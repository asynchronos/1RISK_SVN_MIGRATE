<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CustomerSearch.aspx.vb" Inherits="aspx_customer_CustomerSearch" %>

<%@ Register Src="~/HeaderControl/HeaderControl.ascx" TagName="HeaderControl" TagPrefix="uc1" %>
<%@ Register Src="~/HeaderControl/HeadTagControl.ascx" TagName="HeadTagControl"
    TagPrefix="uc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>ค้นหาลูกค้า</title>
    <uc2:HeadTagControl ID="HeadTagControl1" runat="server" />
</head>
<body>
    <form id="form1" runat="server">

        <uc1:HeaderControl ID="HeaderControl1" runat="server" />
        
        <table cellpadding="10" width="100%">
            <tr>
                <td align="center">
                    <asp:DropDownList ID="FieldNameList" runat="server">
                        <asp:ListItem>CIF</asp:ListItem>
                        <asp:ListItem Value="CUSTOMER.CUS_TITLE + CUSTOMER.CUS_FIRST + CUSTOMER.CUS_LAST">NAME</asp:ListItem>
                    </asp:DropDownList>
                    <asp:TextBox ID="ValueTextBox" runat="server"></asp:TextBox>
                    <asp:Button ID="SearchButton" runat="server" Text="Search" />
                </td>
            </tr>
            <tr>
                <td align="center">
                    <table>
                        <tr>
                            <td>
                                <asp:GridView ID="CustomerListGridView" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Cif" ForeColor="#333333" GridLines="None" Width="100%">
                                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="Cif" HeaderText="Cif" ReadOnly="True" SortExpression="Cif" />
                                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                        <asp:CommandField ShowSelectButton="True" />
                                    </Columns>
                                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                    <EmptyDataTemplate>
                                        Customer not found.
                                    </EmptyDataTemplate>
                                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                    <AlternatingRowStyle BackColor="White" />
                                </asp:GridView>
                                <asp:Panel ID="PagingPanel" runat="server" HorizontalAlign="Center" Width="100%" Visible="False">
                                    <asp:ImageButton ID="PrevImgBt" runat="server" OnCommand="Paging_Click" CommandName="Prev" ImageUrl="~/images/previous.gif" ImageAlign="Baseline" />
                                    <asp:Label ID="CurrentPageLabel" runat="server"></asp:Label>
                                    <asp:Label ID="PageSeparateLabel" runat="server" Text="/"></asp:Label>
                                    <asp:Label ID="TotalPageLabel" runat="server"></asp:Label>
                                    <asp:ImageButton ID="NextImgBt" runat="server" OnCommand="Paging_Click" CommandName="Next" ImageUrl="~/images/next.gif" ImageAlign="Baseline" />
                                    GO TO PAGE : <asp:TextBox ID="CurrentPageText" runat="server" MaxLength="5" Width="5ex" Wrap="False"></asp:TextBox>
                                    <asp:Button ID="PageJumpBt" runat="server" OnCommand="Paging_Click" CommandName="Jump" Text="Go!" />
                                </asp:Panel>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        
    </form>
</body>
</html>
