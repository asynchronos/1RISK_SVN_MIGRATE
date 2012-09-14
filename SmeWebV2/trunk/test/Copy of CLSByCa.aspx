<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false"
    CodeFile="CLSByCa.aspx.vb" Inherits="CLSByCa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:GridView ID="GridViewCLSByCa" runat="server" AutoGenerateColumns="False" CellPadding="4"
        ForeColor="#333333" Width="100%">
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:BoundField DataField="ID_KEY" HeaderText="ID_KEY" SortExpression="ID_KEY" Visible="False" />
            <asp:BoundField DataField="CA_KEY" HeaderText="CA_KEY" SortExpression="CA_KEY" Visible="False" />
            <asp:TemplateField HeaderText="OLD_CA_ID" SortExpression="OLD_CA_ID">
                <EditItemTemplate>
                    <asp:TextBox ID="txtBoxOLD_CA_ID" runat="server" Text='<%# Bind("OLD_CA_ID") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="labelOLD_CA_ID" runat="server" Text='<%# Bind("OLD_CA_ID") %>' Visible="false"></asp:Label>
                    <asp:Label ID="labelOLD_CA_IDShow" runat="server"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="CIF" SortExpression="CIF">
                <EditItemTemplate>
                    <asp:TextBox ID="txtBoxCif" runat="server" Text='<%# Bind("CIF") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="labelCif" runat="server" Text='<%# Bind("CIF") %>' Visible="false"></asp:Label>
                    <asp:Label ID="labelCifShow" runat="server"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="LIMIT_NO_ROOT" HeaderText="LIMIT_NO_ROOT" SortExpression="LIMIT_NO_ROOT" />
            <asp:BoundField DataField="LIMIT_NO_L1" HeaderText="LIMIT_NO_L1" SortExpression="LIMIT_NO_L1" />
            <asp:BoundField DataField="LIMIT_NO_L2" HeaderText="LIMIT_NO_L2" SortExpression="LIMIT_NO_L2" />
            <asp:BoundField DataField="LIMIT_NO_L3" HeaderText="LIMIT_NO_L3" SortExpression="LIMIT_NO_L3" />
            <asp:BoundField DataField="LIMIT_NO_L4" HeaderText="LIMIT_NO_L4" SortExpression="LIMIT_NO_L4" />
            <asp:BoundField DataField="LIMIT_NO_L5" HeaderText="LIMIT_NO_L5" SortExpression="LIMIT_NO_L5" />
            <asp:BoundField DataField="LIMIT_NO_L6" HeaderText="LIMIT_NO_L6" SortExpression="LIMIT_NO_L6" />
            <asp:BoundField DataField="LIMIT_NO_L7" HeaderText="LIMIT_NO_L7" SortExpression="LIMIT_NO_L7" />
            <asp:BoundField DataField="LIMIT_NO_L8" HeaderText="LIMIT_NO_L8" SortExpression="LIMIT_NO_L8" />
            <asp:BoundField DataField="LIMIT_NO_PRODUCT" HeaderText="LIMIT_NO_PRODUCT" SortExpression="LIMIT_NO_PRODUCT" />
            <asp:BoundField DataField="LIMIT_PRODUCT_STATUS" HeaderText="LIMIT_PRODUCT_STATUS"
                SortExpression="LIMIT_PRODUCT_STATUS" />
            <asp:BoundField DataField="LIMIT_REVOLVING_TYPE" HeaderText="LIMIT_REVOLVING_TYPE"
                SortExpression="LIMIT_REVOLVING_TYPE" />
            <asp:BoundField DataField="APPL_KEY" HeaderText="APPL_KEY" SortExpression="APPL_KEY" />
            <asp:BoundField DataField="APPL_ID" HeaderText="APPL_ID" SortExpression="APPL_ID" />
            <asp:BoundField DataField="PRODUCT_CODE" HeaderText="PRODUCT_CODE" SortExpression="PRODUCT_CODE" />
            <asp:BoundField DataField="PRODUCT_NAME" HeaderText="PRODUCT_NAME" SortExpression="PRODUCT_NAME" />
            <asp:BoundField DataField="ACCOUNT_NO" HeaderText="ACCOUNT_NO" SortExpression="ACCOUNT_NO" />
            <asp:BoundField DataField="CIF_LIST_CA_NO" HeaderText="CIF_LIST_CA_NO" SortExpression="CIF_LIST_CA_NO" />
            <asp:BoundField DataField="CIF_LIST_ROOT" HeaderText="CIF_LIST_ROOT" SortExpression="CIF_LIST_ROOT" />
            <asp:BoundField DataField="CIF_LIST_PRODUCT" HeaderText="CIF_LIST_PRODUCT" SortExpression="CIF_LIST_PRODUCT" />
            <asp:BoundField DataField="NO_OF_CIF_CANO" HeaderText="NO_OF_CIF_CANO" SortExpression="NO_OF_CIF_CANO" />
            <asp:BoundField DataField="LIMIT_AMOUNT_PRODUCT_THB" HeaderText="LIMIT_AMOUNT_PRODUCT_THB"
                SortExpression="LIMIT_AMOUNT_PRODUCT_THB" />
            <asp:BoundField DataField="LIMIT_AMOUNT_CA_THB" HeaderText="LIMIT_AMOUNT_CA_THB"
                SortExpression="LIMIT_AMOUNT_CA_THB" />
            <asp:BoundField DataField="LIMIT_USED_CA_THB" HeaderText="LIMIT_USED_CA_THB" SortExpression="LIMIT_USED_CA_THB" />
            <asp:BoundField DataField="LIMIT_AVAILABLE_CA_THB" HeaderText="LIMIT_AVAILABLE_CA_THB"
                SortExpression="LIMIT_AVAILABLE_CA_THB" />
            <asp:BoundField DataField="GECID" HeaderText="GECID" SortExpression="GECID" />
            <asp:BoundField DataField="CREATED_DATE" HeaderText="CREATED_DATE" SortExpression="CREATED_DATE" />
            <asp:BoundField DataField="UPDATE_DATE" HeaderText="UPDATE_DATE" SortExpression="UPDATE_DATE" />
            <asp:BoundField DataField="UPDATE_STATUS_DATE" HeaderText="UPDATE_STATUS_DATE" SortExpression="UPDATE_STATUS_DATE" />
            <asp:BoundField DataField="ASOFDATE" HeaderText="ASOFDATE" SortExpression="ASOFDATE" />
            <asp:BoundField DataField="ETL_DT" HeaderText="ETL_DT" SortExpression="ETL_DT" />
            <asp:TemplateField>
                <ItemTemplate>
                    <tr>
                        <td colspan="100%">
                            <asp:GridView ID="GridViewLimitByCA" runat="server" CellPadding="4" 
                                DataSourceID="SqlDataSourceLimitByCA" ForeColor="#333333" GridLines="None">
                                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                <AlternatingRowStyle BackColor="White" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSourceLimitByCA" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
                                SelectCommand="P_LIMIT_SELECT_BY_CA" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="GridViewCLSByCa" Name="oldCAId" 
                                        PropertyName="SelectedValue" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:ObjectDataSource ID="ODS_CLSByCa" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="getCAByApproveDate" TypeName="CheckDrawn.business.CheckDrawnBO">
        <SelectParameters>
            <asp:QueryStringParameter Name="approveDateNoTimeStr" Type="String" 
                DefaultValue="01/01/2010" />
        </SelectParameters>
    </asp:ObjectDataSource>
<br />
TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST
TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST
TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST
TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST
TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST
TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST
TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST
TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST
TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST
TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST
TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST
TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST
TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST
TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST
TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST
TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST
TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST
TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST
TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST
TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST
TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST
TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST
TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST
TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST
</asp:Content>
