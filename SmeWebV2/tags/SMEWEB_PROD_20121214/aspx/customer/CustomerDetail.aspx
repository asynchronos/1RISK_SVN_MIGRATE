<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CustomerDetail.aspx.vb" Inherits="aspx_CustomerDetail" %>

<%@ Register Src="~/CusMenuControl/CusMenuControll.ascx" TagName="CusMenuControll"
    TagPrefix="uc3" %>

<%@ Register Src="~/HeaderControl/HeaderControl.ascx" TagName="HeaderControl" TagPrefix="uc1" %>
<%@ Register Src="~/HeaderControl/HeadTagControl.ascx" TagName="HeadTagControl"
    TagPrefix="uc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>รายละเอียดลูกค้า</title>
    <uc2:HeadTagControl ID="HeadTagControl1" runat="server" />
</head>
<body>
    <form id="form1" runat="server">
    
        <uc1:HeaderControl ID="HeaderControl1" runat="server" />
        <uc3:CusMenuControll ID="CusMenuControll1" runat="server" />
       
        <table width="100%">
            <tr>
                <td colspan="2" valign="top">
                    <asp:FormView ID="CustomerDetailFormView" runat="server" Width="100%" CellPadding="4" ForeColor="#333333" DataSourceID="CusDetailDS">
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        
                        <ItemTemplate>
                            <br />
                            <table width="100%">
                                <tr>
                                    <td>
                                        <b>CIF :</b>
                                        <asp:Label ID="CIFLabel" runat="server" Text='<%# Eval("CIF") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <b>Name :</b>
                                        <asp:Label ID="CusNameLabel" runat="server" Text='<%# Eval("CUS_TITLE") & Eval("CUS_FIRST") & " " & Eval("CUS_LAST")%>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>Address :</b>
                                        <asp:Label ID="AddressLabel" runat="server" Text='<%#Eval("ADDR1") & "  " & Eval("ADDR2") & "  " & Eval("PROVINCE_H") & "  " & Eval("ZIPCODE") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <b>Tel :</b>
                                        <asp:Label ID="TEL_HOMELabel" runat="server" Text='<%# Eval("TEL_HOME") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>Office :</b>
                                        <asp:Label ID="OfficeLabel" runat="server" Text='<%#Eval("ADDRWORK1") & "  " & Eval("ADDRWORK2") & "  " & Eval("PROVINCE_S") & "  " & Eval("ZIPSHOP") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <b>Tel :</b>
                                        <asp:Label ID="TEL_OFFLabel" runat="server" Text='<%# Eval("TEL_OFF") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>Business Type :</b>
                                        <asp:Label ID="BusinessTypeLabel" runat="server" Text='<%#Eval("Id_Bus_Type") & " - " & Eval("Bus_TypeD") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <b>GROUP CIF :</b>
                                        <asp:Label ID="GROUPCIFLabel" runat="server" Text='<%# Eval("GROUPCIF") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <b>Be Customer Since(DD/MM/YYYY) :</b>
                                        <asp:Label ID="BEINGCUSTLabel" runat="server" OnDataBinding="changeBeginCustFormat"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <b>Controlling Unit :</b>
                                        <asp:Label ID="ControllingUnitLabel" runat="server" Text='<%#Eval("DEPTTRAN") & " - " & Eval("CRT_UNT") %>'></asp:Label>
                                    </td>
                                </tr>
                            </table>
                            <br />
                        </ItemTemplate>
                        <HeaderTemplate>
                            Customer Detail
                        </HeaderTemplate>
                    </asp:FormView>
                    <asp:SqlDataSource ID="CusDetailDS" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                        SelectCommand="UspCUS_Sel" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="Cif" QueryStringField="cif" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td valign="top">
                    <asp:GridView ID="ContactGridView" runat="server" CellPadding="4" ForeColor="#333333" AutoGenerateColumns="False" DataSourceID="ContactDS" DataKeyNames="CIF,NAME">
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <Columns>
                            <asp:BoundField DataField="CIF" HeaderText="CIF" ReadOnly="True" SortExpression="CIF"
                                Visible="False" />
                            <asp:TemplateField HeaderText="NAME" SortExpression="NAME">
                                <EditItemTemplate>
                                    <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("NAME") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("NAME") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ADDRESS" SortExpression="SURNAME">
                                <EditItemTemplate>
                                    <asp:TextBox ID="SurnameTextBox" runat="server" Text='<%# Bind("SURNAME") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="SurnameLabel" runat="server" Text='<%# Bind("SURNAME") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="POSITION" SortExpression="POS">
                                <EditItemTemplate>
                                    <asp:TextBox ID="PosTextBox" runat="server" Text='<%# Bind("POS") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="PosLabel" runat="server" Text='<%# Bind("POS") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Tel(Office)" SortExpression="Tel_Off">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TelOffTextBox" runat="server" Text='<%# Bind("Tel_Off") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="TelOffLabel" runat="server" Text='<%# Bind("Tel_Off") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="MOBILE" SortExpression="Tel_Mobile">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TelMobileTextBox" runat="server" Text='<%# Bind("Tel_Mobile") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="TelMobileLabel" runat="server" Text='<%# Bind("Tel_Mobile") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <EditItemTemplate>
                                    <asp:Button ID="UpdateBt" runat="server" CausesValidation="False" CommandName="Update"
                                        Text="Update" />
                                    <asp:Button ID="CancleBt" runat="server" CausesValidation="False" CommandName="Cancel"
                                        Text="Cancel" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Button ID="EditBt" runat="server" CausesValidation="False" CommandName="Edit"
                                        Text="Edit" />
                                    <asp:Button ID="DeleteBt" runat="server" CausesValidation="False" CommandName="Delete"
                                        OnClientClick="return confirmDelete()" Text="Delete" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <asp:Table ID="Table1" runat="server">
                                <asp:TableHeaderRow runat="server">
                                    <asp:TableHeaderCell runat="server" BackColor="#990000" Font-Bold="True" ForeColor="White" >
                                        NAME
                                    </asp:TableHeaderCell>
                                    <asp:TableHeaderCell runat="server" BackColor="#990000" Font-Bold="True" ForeColor="White" >
                                        ADDRESS
                                    </asp:TableHeaderCell>
                                    <asp:TableHeaderCell runat="server" BackColor="#990000" Font-Bold="True" ForeColor="White" >
                                        POSITION
                                    </asp:TableHeaderCell>
                                    <asp:TableHeaderCell runat="server" BackColor="#990000" Font-Bold="True" ForeColor="White" >
                                        Tel(Office)
                                    </asp:TableHeaderCell>
                                    <asp:TableHeaderCell runat="server" BackColor="#990000" Font-Bold="True" ForeColor="White" >
                                        MOBILE
                                    </asp:TableHeaderCell>
                                </asp:TableHeaderRow>
                                <asp:TableRow runat="server">
                                    <asp:TableCell runat="server" ColumnSpan="5" HorizontalAlign="Center" BackColor="#FFFBD6" ForeColor="#333333" >
                                        No Contact List
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </EmptyDataTemplate>
                        <SelectedRowStyle BackColor="#FFCC66" ForeColor="Navy" Font-Bold="True" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" /><RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="ContactDS" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                        SelectCommand="USP_CustomerContact_Select" SelectCommandType="StoredProcedure" DeleteCommand="USP_CustomerContact_Delete" DeleteCommandType="StoredProcedure" UpdateCommand="USP_CustomerContact_Update" UpdateCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="Cif" QueryStringField="cif" Type="Int32" />
                        </SelectParameters>
                        <DeleteParameters>
                            <asp:Parameter Name="CIF" Type="Int32" />
                            <asp:Parameter Name="NAME" Type="String" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="CIF" Type="Int32" />
                            <asp:Parameter Name="NAME" Type="String" />
                            <asp:Parameter Name="SURNAME" Type="String" />
                            <asp:Parameter Name="POS" Type="String" />
                            <asp:Parameter Name="Tel_Off" Type="String" />
                            <asp:Parameter Name="Tel_Mobile" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </td>
                
                <td valign="top">
                    <asp:DetailsView id="ContactDetailsView" runat="server" DataSourceID="ContactDetailDS" ForeColor="#333333" CellPadding="4" Width="125px" DataKeyNames="CIF,NAME" GridLines="None" Height="50px" AutoGenerateRows="False" DefaultMode="Insert">
                        <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True"></FooterStyle>

                        <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True"></CommandRowStyle>

                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333"></RowStyle>

                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center"></PagerStyle>
                        <Fields>
                            <asp:BoundField ReadOnly="True" DataField="CIF" SortExpression="CIF" HeaderText="CIF"></asp:BoundField>
                            <asp:BoundField ReadOnly="True" DataField="NAME" SortExpression="NAME" HeaderText="NAME"></asp:BoundField>
                            <asp:BoundField DataField="SURNAME" SortExpression="SURNAME" HeaderText="SURNAME"></asp:BoundField>
                            <asp:BoundField DataField="POS" SortExpression="POS" HeaderText="POS"></asp:BoundField>
                            <asp:BoundField DataField="Tel_Off" SortExpression="Tel_Off" HeaderText="Tel_Off"></asp:BoundField>
                            <asp:BoundField DataField="Tel_Mobile" SortExpression="Tel_Mobile" HeaderText="Tel_Mobile"></asp:BoundField>
                            <asp:CommandField ShowInsertButton="True"></asp:CommandField>
                        </Fields>

                        <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True"></FieldHeaderStyle>

                        <HeaderStyle BackColor="#990000" ForeColor="White" Font-Bold="True"></HeaderStyle>
                        <HeaderTemplate>
                            Add Contact List
                        </HeaderTemplate>

                        <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                    </asp:DetailsView>
                    <asp:SqlDataSource ID="ContactDetailDS" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" InsertCommand="USP_CustomerContact_Insert" InsertCommandType="StoredProcedure" SelectCommand="USP_CustomerContact_Select" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:Parameter Name="CIF" Type="Int32" />
                            <asp:Parameter Name="NAME" Type="String" />
                        </SelectParameters>
                        <InsertParameters>
                            <asp:Parameter Name="CIF" Type="Int32" />
                            <asp:Parameter Name="NAME" Type="String" />
                            <asp:Parameter Name="SURNAME" Type="String" />
                            <asp:Parameter Name="POS" Type="String" />
                            <asp:Parameter Name="Tel_Off" Type="String" />
                            <asp:Parameter Name="Tel_Mobile" Type="String" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
        
    </form>
</body>
</html>
