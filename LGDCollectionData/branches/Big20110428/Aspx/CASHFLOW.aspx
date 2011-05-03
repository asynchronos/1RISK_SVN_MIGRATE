<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="CASHFLOW.aspx.cs" Inherits="LGDCollectionData.Aspx.CASHFLOW" UICulture="Auto"
    Culture="Auto" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <asp:DetailsView ID="CASHFLOW_DetailsView" runat="server" AllowPaging="True" AutoGenerateRows="False"
        CellPadding="4" DataKeyNames="CIF,DefaultDate,LIMITNO,DateofCashflow" DataSourceID="CASHFLOW_DATASOURCE"
        DefaultMode="Edit" EnableModelValidation="True" ForeColor="#333333" GridLines="None"
        OnPageIndexChanging="CASHFLOW_DetailsView_PageIndexChanging" OnItemUpdating="CASHFLOW_DetailsView_ItemUpdating">
        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
        <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="CIF" HeaderText="CIF" ReadOnly="True" SortExpression="CIF" />
            <asp:BoundField DataField="DefaultDate" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Default Date:"
                ReadOnly="True" SortExpression="DefaultDate" />
            <asp:BoundField DataField="LIMITNO" HeaderText="LIMITNO:" ReadOnly="True" SortExpression="LIMITNO" />
            <asp:TemplateField HeaderText="APP_ID:" SortExpression="APP_ID">
                <EditItemTemplate>
                    <asp:DropDownList ID="APP_ID_DropDownList" runat="server" DataSourceID="APP_ID_DataSource"
                        DataTextField="APP_ID" DataValueField="APP_ID" SelectedValue='<%# Bind("APP_ID") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="APP_ID_TextBox" runat="server" Text='<%# Bind("APP_ID") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="APP_ID_Label" runat="server" Text='<%# Bind("APP_ID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Cashflow Currency Code:" SortExpression="CashflowCurrencyCode">
                <EditItemTemplate>
                    <asp:DropDownList ID="Currency_DropDownList" runat="server" DataSourceID="Currency_DataSource"
                        DataTextField="Description" DataValueField="Code" SelectedValue='<%# Bind("CashflowCurrencyCode") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="CashflowCurrencyCode_TextBox" runat="server" Text='<%# Bind("CashflowCurrencyCode") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="CashflowCurrencyCode_Label" runat="server" Text='<%# Bind("CashflowCurrencyCode") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="DateofCashflow" HeaderText="Date of Cashflow:" SortExpression="DateofCashflow"
                DataFormatString="{0:dd/MM/yyyy}" ReadOnly="True" />
            <asp:TemplateField HeaderText="Cashflow Amount: PAY_PRIN:" SortExpression="CashflowAmountPAY_PRIN">
                <EditItemTemplate>
                    <asp:TextBox ID="DateofCashflow_TextBox" runat="server" Text='<%# Bind("CashflowAmountPAY_PRIN") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="DateofCashflow_TextBox" runat="server" Text='<%# Bind("CashflowAmountPAY_PRIN") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="DateofCashflow_Label" runat="server" Text='<%# Bind("CashflowAmountPAY_PRIN") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Cashflow Amount: PAY_INT:" SortExpression="CashflowAmountPAY_INT">
                <EditItemTemplate>
                    <asp:TextBox ID="CashflowAmountPAY_INT_TextBox" runat="server" Text='<%# Bind("CashflowAmountPAY_INT") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="CashflowAmountPAY_INT_TextBox" runat="server" Text='<%# Bind("CashflowAmountPAY_INT") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="CashflowAmountPAY_INT_Label" runat="server" Text='<%# Bind("CashflowAmountPAY_INT") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Cashflow Amount: PAY_SUSP:" SortExpression="CashflowAmountPAY_SUSP">
                <EditItemTemplate>
                    <asp:TextBox ID="CashflowAmountPAY_SUSP_TextBox" runat="server" Text='<%# Bind("CashflowAmountPAY_SUSP") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="CashflowAmountPAY_SUSP_TextBox" runat="server" Text='<%# Bind("CashflowAmountPAY_SUSP") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="CashflowAmountPAY_SUSP_Label" runat="server" Text='<%# Bind("CashflowAmountPAY_SUSP") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Cash Flow Source Description 1:" SortExpression="CashFlowSourceDescription1">
                <EditItemTemplate>
                    <asp:DropDownList ID="CashFlowSourceDescription1_DropDownList" runat="server" SelectedValue='<%# Bind("CashFlowSourceDescription1") %>'>
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>Repayment from borrower</asp:ListItem>
                        <asp:ListItem>Repayment from guarantor</asp:ListItem>
                        <asp:ListItem>Voluntary transfer collaterals to the bank</asp:ListItem>
                        <asp:ListItem>Property foreclosure through court</asp:ListItem>
                        <asp:ListItem>Debt / equity swap</asp:ListItem>
                        <asp:ListItem>Loan sale</asp:ListItem>
                        <asp:ListItem>Refinance from other financial institution</asp:ListItem>
                        <asp:ListItem>Compensated from deposit account</asp:ListItem>
                        <asp:ListItem>Adjusting entry</asp:ListItem>
                        <asp:ListItem>Written-off</asp:ListItem>
                        <asp:ListItem>Haircut</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="CashFlowSourceDescription1_TextBox" runat="server" Text='<%# Bind("CashFlowSourceDescription1") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="CashFlowSourceDescription1_Label" runat="server" Text='<%# Bind("CashFlowSourceDescription1") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Cash Flow Source Description 2:" SortExpression="CashFlowSourceDescription2">
                <EditItemTemplate>
                    <asp:DropDownList ID="CashFlowSourceDescription2_DropDownList" runat="server" SelectedValue='<%# Bind("CashFlowSourceDescription2") %>'>
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>Repayment from borrower</asp:ListItem>
                        <asp:ListItem>Repayment from guarantor</asp:ListItem>
                        <asp:ListItem>Voluntary transfer collaterals to the bank</asp:ListItem>
                        <asp:ListItem>Property foreclosure through court</asp:ListItem>
                        <asp:ListItem>Debt / equity swap</asp:ListItem>
                        <asp:ListItem>Loan sale</asp:ListItem>
                        <asp:ListItem>Refinance from other financial institution</asp:ListItem>
                        <asp:ListItem>Compensated from deposit account</asp:ListItem>
                        <asp:ListItem>Adjusting entry</asp:ListItem>
                        <asp:ListItem>Written-off</asp:ListItem>
                        <asp:ListItem>Haircut</asp:ListItem>
                    </asp:DropDownList>
                    <asp:CascadingDropDown ID="CashFlowSourceDescription2_DropDownList_CascadingDropDown"
                        runat="server" Enabled="True" Category="CashFlowSourceDescription2" ParentControlID="CashFlowSourceDescription1_DropDownList"
                        TargetControlID="CashFlowSourceDescription2_DropDownList">
                    </asp:CascadingDropDown>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="CashFlowSourceDescription2_TextBox" runat="server" Text='<%# Bind("CashFlowSourceDescription2") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="CashFlowSourceDescription2_Label" runat="server" Text='<%# Bind("CashFlowSourceDescription2") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Cash Flow Source Description 3:" SortExpression="CashFlowSourceDescription3">
                <EditItemTemplate>
                    <asp:DropDownList ID="CashFlowSourceDescription3_DropDownList" runat="server" SelectedValue='<%# Bind("CashFlowSourceDescription3") %>'>
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>Repayment from borrower</asp:ListItem>
                        <asp:ListItem>Repayment from guarantor</asp:ListItem>
                        <asp:ListItem>Voluntary transfer collaterals to the bank</asp:ListItem>
                        <asp:ListItem>Property foreclosure through court</asp:ListItem>
                        <asp:ListItem>Debt / equity swap</asp:ListItem>
                        <asp:ListItem>Loan sale</asp:ListItem>
                        <asp:ListItem>Refinance from other financial institution</asp:ListItem>
                        <asp:ListItem>Compensated from deposit account</asp:ListItem>
                        <asp:ListItem>Adjusting entry</asp:ListItem>
                        <asp:ListItem>Written-off</asp:ListItem>
                        <asp:ListItem>Haircut</asp:ListItem>
                    </asp:DropDownList>
                    <asp:CascadingDropDown ID="CashFlowSourceDescription3_DropDownList_CascadingDropDown"
                        runat="server" Enabled="True" Category="CashFlowSourceDescription3" ParentControlID="CashFlowSourceDescription2_DropDownList"
                        TargetControlID="CashFlowSourceDescription3_DropDownList">
                    </asp:CascadingDropDown>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="CashFlowSourceDescription3_TextBox" runat="server" Text='<%# Bind("CashFlowSourceDescription3") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="CashFlowSourceDescription3_Label" runat="server" Text='<%# Bind("CashFlowSourceDescription3") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Written-off / Haircut Amount:" SortExpression="WrittenoffOrHaircutAmount">
                <EditItemTemplate>
                    <asp:TextBox ID="WrittenoffOrHaircutAmount_TextBox" runat="server" Text='<%# Bind("WrittenoffOrHaircutAmount") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="WrittenoffOrHaircutAmount_TextBox" runat="server" Text='<%# Bind("WrittenoffOrHaircutAmount") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="WrittenoffOrHaircutAmount_Label" runat="server" Text='<%# Bind("WrittenoffOrHaircutAmount") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="CollateralID" HeaderText="Collateral ID:" SortExpression="CollateralID" />
            <asp:TemplateField HeaderText="LIMITNO Changed:" SortExpression="LIMITNOChanged">
                <EditItemTemplate>
                    <asp:CheckBox ID="LIMITNOChanged_CheckBox" runat="server" Checked='<%# Bind("LIMITNOChanged") %>' />
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:CheckBox ID="LIMITNOChanged_CheckBox" runat="server" Checked='<%# Bind("LIMITNOChanged") %>' />
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="LIMITNOChanged_CheckBox" runat="server" Checked='<%# Bind("LIMITNOChanged") %>'
                        Enabled="false" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Previous LIMITNO:" SortExpression="PreviousLIMITNO">
                <EditItemTemplate>
                    <asp:ComboBox ID="PreviousLIMITNO_ComboBox" runat="server" AutoCompleteMode="SuggestAppend"
                        DataSourceID="PreviousLimitNo_DataSource" DataTextField="LIMITNO" DataValueField="LIMITNO"
                        DropDownStyle="DropDownList" MaxLength="0" Style="display: inline;" AppendDataBoundItems="true"
                        SelectedValue='<%# Bind("PreviousLIMITNO") %>'>
                        <asp:ListItem Value=""></asp:ListItem>
                        <asp:ListItem Value="N/A">N/A</asp:ListItem>
                    </asp:ComboBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="PreviousLIMITNO_TextBox" runat="server" Text='<%# Bind("PreviousLIMITNO") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="PreviousLIMITNO_Label" runat="server" Text='<%# Bind("PreviousLIMITNO") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="false" />
        </Fields>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerSettings Mode="NumericFirstLast" />
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
    <asp:SqlDataSource ID="PreviousLimitNo_DataSource" runat="server" ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>"
        SelectCommand="P_LIMITNO_IN_FACILITY_INFORMATION_BY_CIF" SelectCommandType="StoredProcedure"
        EnableCaching="True">
        <SelectParameters>
            <asp:QueryStringParameter Name="CIF" QueryStringField="cif" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>