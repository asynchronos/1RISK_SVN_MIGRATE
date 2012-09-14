<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Customer.aspx.vb" Inherits="aspx_customer_Customer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customer</title>
    <script type="text/javascript" src="../../js/common.js"></script>
    <script type="text/javascript">
        
    </script>
</head>
<body style="margin-bottom: 0;margin-left: 0; margin-right:0; margin-top:0;">
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td align="center">
                        <asp:DropDownList ID="FieldNameList" runat="server">
                            <asp:ListItem Value="CUSTOMER.CIF">CIF</asp:ListItem>
                            <asp:ListItem Value="CUSTOMER.CUS_TITLE + CUSTOMER.CUS_FIRST + CUSTOMER.CUS_LAST">NAME</asp:ListItem>
                        </asp:DropDownList>
                        <asp:TextBox ID="ValueTextBox" runat="server"></asp:TextBox>
                        <asp:Button ID="SearchButton" runat="server" Text="Search" 
                            ValidationGroup="beforeSearch" />
                        <asp:CustomValidator ID="CustomValidator_ValidateFilter" runat="server" 
                            ErrorMessage="CIF ต้องเป็นตัวเลขเท่านั้น" OnServerValidate="ValidateFilter" 
                            ControlToValidate="ValueTextBox" ValidateEmptyText="True" 
                            ValidationGroup="beforeSearch"></asp:CustomValidator>
                    </td>
                </tr>
                
                <tr>
                    <td align="center">
                    
                        <asp:GridView ID="CustomerGridView" runat="server" AutoGenerateColumns="False" 
                            CellPadding="4" ForeColor="#333333" 
                            GridLines="None" Width="100%">
                            <PagerSettings Mode="NumericFirstLast" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <RowStyle BackColor="#EFF3FB" />
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="SelectCIFLinkBt" runat="server" CausesValidation="False" 
                                            CommandName="Select" OnLoad="SelectCIFLinkBt_Load" Text="Select"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="CIF" SortExpression="CIF">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="CIF_TEXTBOX" runat="server" Text='<%# Bind("CIF") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="CIF" runat="server" Text='<%# Bind("CIF") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="NAME" SortExpression="NAME">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="NAME_TEXTBOX" runat="server" Text='<%# Bind("NAME") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="NAME" runat="server" Text='<%# Bind("NAME") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#2461BF" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>
                        
                        <asp:Panel ID="PagingPanel" runat="server" HorizontalAlign="Center" Width="100%" Visible="False">
                            <asp:ImageButton ID="PrevImgBt" runat="server" OnCommand="Paging_Click" CommandName="Prev" ImageUrl="~/images/previous.gif" ImageAlign="Baseline" />
                            <asp:Label ID="CurrentPageLabel" runat="server">1</asp:Label>
                            <asp:Label ID="PageSeparateLabel" runat="server" Text="/"></asp:Label>
                            <asp:Label ID="TotalPageLabel" runat="server">1</asp:Label>
                            <asp:ImageButton ID="NextImgBt" runat="server" OnCommand="Paging_Click" CommandName="Next" ImageUrl="~/images/next.gif" ImageAlign="Baseline" />
                            GO TO PAGE : <asp:TextBox ID="CurrentPageText" runat="server" MaxLength="5" Width="6ex" Wrap="False"></asp:TextBox>
                            <asp:Button ID="PageJumpBt" runat="server" OnCommand="Paging_Click" CommandName="Jump" Text="Go!" />
                        </asp:Panel>
                        
                    </td>
                </tr>
            </table>
            
        </div>
    </form>
</body>
</html>
