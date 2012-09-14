<%@ Page Title="Customer By Port" Language="VB" MasterPageFile="~/MasterPage.master"
    AutoEventWireup="false" CodeFile="SmeCustomerByCM.aspx.vb" Inherits="aspx.customer.SmeCustomerByCM" 
    EnableEventValidation="false" %>

<%@ Register Src="../../Controls/ExportControl/ExportControl.ascx" TagName="ExportControl"
    TagPrefix="uc3" %>
<%@ Register Src="~/Controls/ControllingTree/ControllingTree.ascx" TagName="ControllingTree"
    TagPrefix="uc4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <table>
        <tr valign="top">
            <td>
                <uc4:ControllingTree ID="ControllingTree1" runat="server" />
                <asp:HiddenField ID="Hidd_TreeSelectedValue" runat="server" />
                <asp:HiddenField ID="Hidd_TreeSelectedValueType" runat="server" />
                <asp:HiddenField ID="Hidd_TreeSelectedEmpIds" runat="server" />
            </td>
            <td>
                <asp:Label ID="TreeSelectedLabel" runat="server" Text="Label" Font-Bold="True" Font-Italic="False"
                    Font-Size="Larger" ForeColor="Red" Font-Underline="True"></asp:Label>
                <br />
                <uc3:ExportControl ID="ExportControl1" runat="server" ControlName="GridView1" Filename="Customer"
                    Visible="False" ExportDatasourceID="SqlDataSource1_Export" wordVisible="False"
                    ButtonText="Export to Excel" ExportMode="Excel" />
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                    <PagerSettings Mode="NumericFirstLast" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#EFF3FB" HorizontalAlign="Center" Wrap="True" />
                    <Columns>
                        <asp:TemplateField HeaderText="CIF" SortExpression="CIF">
                            <ItemTemplate>
                                <asp:Label ID="CIFLabel" runat="server" Text='<%# Bind("CIF") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Label ID="CIFLabel" runat="server" Text='<%# Eval("CIF") %>'></asp:Label>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="CUSTOMER" SortExpression="CUSTOMER_NAME">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("CUSTOMER_NAME") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CUSTOMER_NAME") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="BRANCH" SortExpression="BRANCH_NAME">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("BRANCH_NAME") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("BRANCH_NAME") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemStyle HorizontalAlign="Left" Wrap="False" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="GROUP_SIZE" SortExpression="GROUP_SIZE_DETAIL">
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("GROUP_SIZE_DETAIL") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("GROUP_SIZE_DETAIL") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemStyle HorizontalAlign="Left" Wrap="False" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="CM_CODE" SortExpression="CM_CODE">
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("CM_CODE") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("CM_CODE") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="JUDGEMENT_DETAIL" HeaderText="JUDGEMENT_DETAIL" SortExpression="JUDGEMENT_DETAIL" />
                        <asp:BoundField DataField="BUSI_RISK1_DETAIL" HeaderText="MAIN_BUSINESS" SortExpression="BUSI_RISK1_DETAIL" />
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="SelectLinkButton" runat="server" CausesValidation="False" CommandName="Select"
                                    Text="Select" OnClick="SelectLinkButton_Click"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                    SelectCommand="SP_CUSTOMER_SME_SELECT_BY_CM" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Hidd_TreeSelectedEmpIds" Name="CM_CODE" 
                            PropertyName="Value" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource1_Export" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                    SelectCommand="SP_CUSTOMER_SME_SELECT_BY_CM_EXPORT" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Hidd_TreeSelectedEmpIds" Name="CM_CODE" PropertyName="Value"
                            Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
