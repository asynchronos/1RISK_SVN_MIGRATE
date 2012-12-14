<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Branch.aspx.vb" Inherits="aspx_customer_Branch" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Branch</title>
    <script type="text/javascript" src="../../js/common.js"></script>
</head>
<body style="margin-bottom: 0;margin-left: 0; margin-right:0; margin-top:0;">
    <form id="form1" runat="server">
        <div>
            <table>
                    <tr>
                        <td align="center" valign="middle">
                            <asp:Label ID="KeywordsLabel" runat="server" Text="Keywords(ID,BRANCH) : " 
                                Font-Bold="True" ForeColor="Red"></asp:Label>
                            <asp:TextBox ID="KeywordsTextBox" runat="server"></asp:TextBox>
                            <asp:Button ID="SearchButton" runat="server" Text="Search" />
                            <asp:HiddenField ID="KeywordsField" runat="server" />
                        </td>
                    </tr>
                    
                    <tr>
                        <td align="center">
                        
                            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                                AutoGenerateColumns="False" CellPadding="4" DataSourceID="BranchDataSource" 
                                ForeColor="#333333" GridLines="None" Width="100%">
                                <PagerSettings Mode="NumericFirstLast" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <RowStyle BackColor="#EFF3FB" />
                                <Columns>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="SelectBranchLinkBt" runat="server" CausesValidation="False" 
                                                CommandName="Select" Text="Select" OnLoad="SelectBranchLinkBt_Load"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Id_Branch" SortExpression="Id_Branch">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="Id_Branch_TextBox" runat="server" Text='<%# Bind("Id_Branch") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Id_Branch" runat="server" Text='<%# Bind("Id_Branch") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Branch_T" SortExpression="Branch_T">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="Branch_T_TextBox" runat="server" Text='<%# Bind("Branch_T") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Branch_T" runat="server" Text='<%# Bind("Branch_T") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <EditRowStyle BackColor="#2461BF" />
                                <AlternatingRowStyle BackColor="White" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="BranchDataSource" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
                                SelectCommand="SELECT Id_Branch, Branch_T, Id_Region FROM Id_Branch WHERE (CONVERT (nvarchar(5), Id_Branch) + Branch_T LIKE @FILTER) ORDER BY Id_Branch">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="KeywordsField" Name="FILTER" 
                                        PropertyName="Value" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        
                        </td>
                    </tr>
            </table>
        </div>
    </form>
</body>
</html>
