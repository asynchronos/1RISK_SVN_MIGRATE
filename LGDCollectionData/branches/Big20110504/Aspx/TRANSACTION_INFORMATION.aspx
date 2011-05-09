<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="TRANSACTION_INFORMATION.aspx.cs" Inherits="LGDCollectionData.Aspx.TRANSACTION_INFORMATION" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:DetailsView ID="TRANSACTION_INFORMATION_DetailsView" runat="server" AutoGenerateRows="False"
        CellPadding="4" DataKeyNames="CIF,Default_Date,BRAN,ACCGL,ACCNO,CONTNO,SEQNO"
        DataSourceID="TRANSACTION_INFORMATION_SqlDataSource" EnableModelValidation="True"
        ForeColor="#333333" AllowPaging="True" DefaultMode="Edit" OnPageIndexChanging="DetailsView_PageIndexChanging"
        OnItemUpdating="DetailsView_ItemUpdating">
        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
        <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="CIF" HeaderText="CIF" ReadOnly="True" SortExpression="CIF" />
            <asp:BoundField DataField="Default_Date" HeaderText="Default_Date" ReadOnly="True"
                SortExpression="Default_Date" DataFormatString="{0:d/M/yyyy}" />
            <asp:BoundField DataField="BRAN" HeaderText="BRAN" ReadOnly="True" SortExpression="BRAN" />
            <asp:BoundField DataField="ACCGL" HeaderText="ACCGL" ReadOnly="True" SortExpression="ACCGL" />
            <asp:BoundField DataField="ACCNO" HeaderText="ACCNO" ReadOnly="True" SortExpression="ACCNO" />
            <asp:BoundField DataField="CONTNO" HeaderText="CONTNO" ReadOnly="True" SortExpression="CONTNO" />
            <asp:BoundField DataField="SEQNO" HeaderText="SEQNO" ReadOnly="True" SortExpression="SEQNO" />
            <asp:BoundField DataField="LIMITNO" HeaderText="LIMITNO" SortExpression="LIMITNO" />
            <asp:TemplateField HeaderText="FCY_TYPE_Original_Currency_Code" SortExpression="FCY_TYPE_Original_Currency_Code">
                <EditItemTemplate>
                    <asp:DropDownList ID="FCY_TYPE_Original_Currency_Code_DropDownList" runat="server"
                        DataSourceID="Currency_DataSource" DataTextField="Description" DataValueField="Code"
                        SelectedValue='<%# Bind("FCY_TYPE_Original_Currency_Code") %>' AppendDataBoundItems="true">
                        <asp:ListItem Value=""></asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("FCY_TYPE_Original_Currency_Code") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("FCY_TYPE_Original_Currency_Code") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Currency_Code" SortExpression="Currency_Code">
                <EditItemTemplate>
                    <asp:DropDownList ID="Currency_Code_DropDownList" runat="server" DataSourceID="Currency_DataSource"
                        DataTextField="Description" DataValueField="Code" SelectedValue='<%# Bind("Currency_Code") %>'
                        AppendDataBoundItems="true">
                        <asp:ListItem Value=""></asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Currency_Code") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Currency_Code") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="LNSTYPE" HeaderText="LNSTYPE" SortExpression="LNSTYPE" />
            <asp:BoundField DataField="Total_Interest_Rate_Prior_to_Default" HeaderText="Total_Interest_Rate_Prior_to_Default"
                SortExpression="Total_Interest_Rate_Prior_to_Default" />
            <asp:TemplateField HeaderText="Interest_Rate_Index_Prior_to_Default" SortExpression="Interest_Rate_Index_Prior_to_Default">
                <EditItemTemplate>
                    <asp:DropDownList ID="Interest_Rate_Index_Prior_to_Default_DropDownList" runat="server"
                        DataSourceID="Rate_Type_SqlDataSource" DataTextField="DESCRIPTION" DataValueField="CODE"
                        SelectedValue='<%# Bind("Interest_Rate_Index_Prior_to_Default") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Interest_Rate_Index_Prior_to_Default") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Interest_Rate_Index_Prior_to_Default") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Interest_Rate_Spread_Prior_to_Default_Percentage" HeaderText="Interest_Rate_Spread_Prior_to_Default_Percentage"
                SortExpression="Interest_Rate_Spread_Prior_to_Default_Percentage" />
            <asp:TemplateField HeaderText="Rate_Sign" SortExpression="Rate_Sign">
                <EditItemTemplate>
                    <asp:DropDownList ID="Rate_Sign_DropDownList" runat="server" SelectedValue='<%# Bind("Rate_Sign") %>'>
                        <asp:ListItem Value="+">+</asp:ListItem>
                        <asp:ListItem Value="-">-</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Rate_Sign") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Rate_Sign") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="OS_AT_D_Principal" HeaderText="OS_AT_D_Principal" SortExpression="OS_AT_D_Principal" />
            <asp:BoundField DataField="OS_AT_D_Accrued" HeaderText="OS_AT_D_Accrued" SortExpression="OS_AT_D_Accrued" />
            <asp:BoundField DataField="OS_AT_D_Suspense" HeaderText="OS_AT_D_Suspense" SortExpression="OS_AT_D_Suspense" />
            <asp:BoundField DataField="OS_AT_D_MINUS_1_Principal" HeaderText="OS_AT_D_MINUS_1_Principal"
                SortExpression="OS_AT_D_MINUS_1_Principal" />
            <asp:BoundField DataField="OS_AT_D_MINUS_1_Accrued" HeaderText="OS_AT_D_MINUS_1_Accrued"
                SortExpression="OS_AT_D_MINUS_1_Accrued" />
            <asp:BoundField DataField="OS_AT_D_MINUS_1_Suspense" HeaderText="OS_AT_D_MINUS_1_Suspense"
                SortExpression="OS_AT_D_MINUS_1_Suspense" />
        </Fields>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerSettings Mode="NumericFirstLast" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="TRANSACTION_INFORMATION_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>"
        SelectCommand="P_TRANSACTION_INFORMATION_SELECT" SelectCommandType="StoredProcedure"
        UpdateCommand="P_TRANSACTION_INFORMATION_UPDATE" UpdateCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter Name="CIF" QueryStringField="cif" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="CIF" Type="String" />
            <asp:Parameter Name="Default_Date" Type="DateTime" />
            <asp:Parameter Name="BRAN" Type="String" />
            <asp:Parameter Name="ACCGL" Type="String" />
            <asp:Parameter Name="ACCNO" Type="String" />
            <asp:Parameter Name="CONTNO" Type="String" />
            <asp:Parameter Name="SEQNO" Type="String" />
            <asp:Parameter Name="LIMITNO" Type="String" />
            <asp:Parameter Name="FCY_TYPE_Original_Currency_Code" Type="String" />
            <asp:Parameter Name="Currency_Code" Type="String" />
            <asp:Parameter Name="LNSTYPE" Type="String" />
            <asp:Parameter Name="Total_Interest_Rate_Prior_to_Default" Type="Double" />
            <asp:Parameter Name="Interest_Rate_Index_Prior_to_Default" Type="String" />
            <asp:Parameter Name="Interest_Rate_Spread_Prior_to_Default_Percentage" Type="Double" />
            <asp:Parameter Name="Rate_Sign" Type="String" />
            <asp:Parameter Name="OS_AT_D_Principal" Type="Double" />
            <asp:Parameter Name="OS_AT_D_Accrued" Type="Double" />
            <asp:Parameter Name="OS_AT_D_Suspense" Type="Double" />
            <asp:Parameter Name="OS_AT_D_MINUS_1_Principal" Type="Double" />
            <asp:Parameter Name="OS_AT_D_MINUS_1_Accrued" Type="Double" />
            <asp:Parameter Name="OS_AT_D_MINUS_1_Suspense" Type="Double" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="Currency_DataSource" runat="server" EnableCaching="True" ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>"
        SelectCommand="L_CURRENCY_CODE_SELECT" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource ID="Rate_Type_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>"
        SelectCommand="P_L_RATE TYPE_SELECT" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>