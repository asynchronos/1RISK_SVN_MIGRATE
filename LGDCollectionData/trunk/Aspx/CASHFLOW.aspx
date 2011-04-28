<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="CASHFLOW.aspx.cs" Inherits="LGDCollectionData.Aspx.CASHFLOW" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:DetailsView ID="CASHFLOW_DetailsView" runat="server" Height="50px" Width="125px"
        AllowPaging="True" AutoGenerateRows="False" CellPadding="4" DataKeyNames="CIF,DefaultDate,LIMITNO,DateofCashflow"
        DataSourceID="CASHFLOW_DATASOURCE" DefaultMode="Edit" EnableModelValidation="True"
        ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
        <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="CIF" HeaderText="CIF" ReadOnly="True" SortExpression="CIF" />
            <asp:BoundField DataField="DefaultDate" DataFormatString="{0:dd/MM/yyyy}" HeaderText="DefaultDate"
                ReadOnly="True" SortExpression="DefaultDate" />
            <asp:BoundField DataField="LIMITNO" HeaderText="LIMITNO" ReadOnly="True" SortExpression="LIMITNO" />
            <asp:TemplateField HeaderText="APP_ID" SortExpression="APP_ID">
                <EditItemTemplate>
                    <asp:DropDownList ID="APP_ID_DropDownList" runat="server" DataSourceID="APP_ID_DataSource"
                        DataTextField="APP_ID" DataValueField="APP_ID" SelectedValue='<%# Bind("APP_ID") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("APP_ID") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("APP_ID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="CashflowCurrencyCode" SortExpression="CashflowCurrencyCode">
                <EditItemTemplate>
                    <asp:DropDownList ID="Currency_DropDownList" runat="server" DataSourceID="Currency_DataSource"
                        DataTextField="Description" DataValueField="Code" SelectedValue='<%# Bind("CashflowCurrencyCode") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("CashflowCurrencyCode") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("CashflowCurrencyCode") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="DateofCashflow" HeaderText="DateofCashflow" SortExpression="DateofCashflow"
                DataFormatString="{0:dd/MM/yyyy}" ReadOnly="True" />
            <asp:TemplateField HeaderText="CashflowAmountPAY_PRIN"
                SortExpression="CashflowAmountPAY_PRIN">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server"
                        Text='<%# Bind("CashflowAmountPAY_PRIN") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server"
                        Text='<%# Bind("CashflowAmountPAY_PRIN") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server"
                        Text='<%# Bind("CashflowAmountPAY_PRIN") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="CashflowAmountPAY_INT"
                SortExpression="CashflowAmountPAY_INT">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server"
                        Text='<%# Bind("CashflowAmountPAY_INT") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server"
                        Text='<%# Bind("CashflowAmountPAY_INT") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server"
                        Text='<%# Bind("CashflowAmountPAY_INT") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="CashflowAmountPAY_SUSP"
                SortExpression="CashflowAmountPAY_SUSP">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server"
                        Text='<%# Bind("CashflowAmountPAY_SUSP") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server"
                        Text='<%# Bind("CashflowAmountPAY_SUSP") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server"
                        Text='<%# Bind("CashflowAmountPAY_SUSP") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="CashFlowSourceDescription1" HeaderText="CashFlowSourceDescription1"
                SortExpression="CashFlowSourceDescription1" />
            <asp:BoundField DataField="CashFlowSourceDescription2" HeaderText="CashFlowSourceDescription2"
                SortExpression="CashFlowSourceDescription2" />
            <asp:BoundField DataField="CashFlowSourceDescription3" HeaderText="CashFlowSourceDescription3"
                SortExpression="CashFlowSourceDescription3" />
            <asp:BoundField DataField="WrittenoffOrHaircutAmount" HeaderText="WrittenoffOrHaircutAmount"
                SortExpression="WrittenoffOrHaircutAmount" />
            <asp:BoundField DataField="CollateralID" HeaderText="CollateralID" SortExpression="CollateralID" />
            <asp:CheckBoxField DataField="LIMITNOChanged" HeaderText="LIMITNOChanged" SortExpression="LIMITNOChanged" />
            <asp:BoundField DataField="PreviousLIMITNO" HeaderText="PreviousLIMITNO" SortExpression="PreviousLIMITNO" />
            <asp:CommandField ShowEditButton="True" />
        </Fields>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerSettings Mode="NextPrevious" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="CASHFLOW_DataSource" runat="server" ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>"
        SelectCommand="P_CASHFLOW_SELECT" SelectCommandType="StoredProcedure" UpdateCommand="P_CASHFLOW_UPDATE"
        UpdateCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter Name="CIF" QueryStringField="cif" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="CIF" Type="String" />
            <asp:Parameter Name="DefaultDate" Type="DateTime" />
            <asp:Parameter Name="LIMITNO" Type="String" />
            <asp:Parameter Name="APP_ID" Type="String" />
            <asp:Parameter Name="CashflowCurrencyCode" Type="String" />
            <asp:Parameter Name="DateofCashflow" Type="DateTime" />
            <asp:Parameter Name="CashflowAmountPAY_PRIN" Type="Double" />
            <asp:Parameter Name="CashflowAmountPAY_INT" Type="Double" />
            <asp:Parameter Name="CashflowAmountPAY_SUSP" Type="Double" />
            <asp:Parameter Name="CashFlowSourceDescription1" Type="String" />
            <asp:Parameter Name="CashFlowSourceDescription2" Type="String" />
            <asp:Parameter Name="CashFlowSourceDescription3" Type="String" />
            <asp:Parameter Name="WrittenoffOrHaircutAmount" Type="Double" />
            <asp:Parameter Name="CollateralID" Type="String" />
            <asp:Parameter Name="LIMITNOChanged" Type="Boolean" />
            <asp:Parameter Name="PreviousLIMITNO" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="APP_ID_DataSource" runat="server" EnableCaching="True" ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>"
        SelectCommand="L_APP_ID_SELECT" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource ID="Currency_DataSource" runat="server" EnableCaching="True" ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>"
        SelectCommand="L_CURRENCY_CODE_SELECT" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>