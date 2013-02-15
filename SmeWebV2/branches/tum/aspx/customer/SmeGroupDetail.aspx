<%@ Page Title="ลูกค้าในกลุ่ม" Language="VB" MasterPageFile="~/Iframe.master" AutoEventWireup="false"
    CodeFile="SmeGroupDetail.aspx.vb" Inherits="aspx.customer.SmeGroupDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div style="background-color: #C0C0C0">
        <asp:Label ID="Header_Label" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
            AllowPaging="True" PageSize="10" CellPadding="4" DataKeyNames="CIF" ForeColor="#333333"
            GridLines="None" Width="100%">
            <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
            <RowStyle BackColor="#EFF3FB" Font-Size="Smaller" Wrap="False" />
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete"
                            OnLoad="LinkButton1_Load" Text="เอาออกจากกลุ่ม"></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:BoundField DataField="CIF" HeaderText="CIF" SortExpression="CIF">
                    <ItemStyle Wrap="False" HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="CUSTOMER_NAME" HeaderText="CUSTOMER_NAME" ReadOnly="True"
                    SortExpression="CUSTOMER_NAME">
                    <ItemStyle Wrap="False" HorizontalAlign="Left" />
                </asp:BoundField>
            </Columns>
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
            SelectCommand="SP_CUSTOMER_SME_GET_CIF_IN_GROUP" SelectCommandType="StoredProcedure"
            DeleteCommand="SP_CUSTOMER_SME_SET_NEW_GROUPID" DeleteCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter Name="GROUP_ID" QueryStringField="groupId" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="CIF" Type="Int32" />
                <asp:Parameter Name="GROUP_ID" Type="Int32" Direction="InputOutput" />
                <asp:Parameter Name="UPDATE_BY" Type="String" />
                <asp:Parameter Name="UPDATE_DATE" Type="DateTime" />
            </DeleteParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
