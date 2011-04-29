<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NPA_RECORD_NEW.aspx.cs" Inherits="LGDCollectionData.Aspx.NPA_RECORD_NEW" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="SqlDataSourceNPA_RECORD" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>" 
        InsertCommand="NPA_EXPENSE_INSERT" InsertCommandType="StoredProcedure" 
        SelectCommand="NPA_RECORD_SELECT" SelectCommandType="StoredProcedure" 
        UpdateCommand="NPA_RECORD_UPDATE" UpdateCommandType="StoredProcedure">
        <InsertParameters>
            <asp:Parameter Name="Expense_Year" Type="Int16" />
            <asp:Parameter Name="Appraised_Value_Beginning_of_Year" Type="Double" />
            <asp:Parameter Name="Cost_Value_Beginning_of_Year" Type="Double" />
            <asp:Parameter Name="Total_Expense" Type="Double" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="CIF" QueryStringField="CIF" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="CIF" Type="String" />
            <asp:Parameter Name="Default_Date" Type="DateTime" />
            <asp:Parameter Name="NPA_Collateral_ID" Type="String" />
            <asp:Parameter Name="Collateral_Type" Type="String" />
            <asp:Parameter Name="COS_Collateral_ID" Type="String" />
            <asp:Parameter Name="Collateral_Sale_Price_Currency" Type="String" />
            <asp:Parameter Name="Collateral_Sale_Price" Type="Double" />
            <asp:Parameter Name="Collateral_Sale_Date" Type="DateTime" />
            <asp:Parameter Name="Collateral_Description" Type="String" />
            <asp:Parameter Name="District_of_Property" Type="String" />
            <asp:Parameter Name="Amphur_of_Property" Type="String" />
            <asp:Parameter Name="Province_of_Property" Type="String" />
            <asp:Parameter Name="Title_Deed_Number" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" 
        AutoGenerateRows="False" DataKeyNames="CIF,Default_Date,NPA_Collateral_ID" 
        DataSourceID="SqlDataSourceNPA_RECORD" EnableModelValidation="True" 
        Height="50px" Width="125px">
        <Fields>
            <asp:BoundField DataField="CIF" HeaderText="CIF" ReadOnly="True" 
                SortExpression="CIF" />
            <asp:BoundField DataField="Default_Date" HeaderText="Default_Date" 
                ReadOnly="True" SortExpression="Default_Date" />
            <asp:BoundField DataField="NPA_Collateral_ID" HeaderText="NPA_Collateral_ID" 
                ReadOnly="True" SortExpression="NPA_Collateral_ID" />
            <asp:BoundField DataField="Collateral_Type" HeaderText="Collateral_Type" 
                SortExpression="Collateral_Type" />
            <asp:BoundField DataField="COS_Collateral_ID" HeaderText="COS_Collateral_ID" 
                SortExpression="COS_Collateral_ID" />
            <asp:TemplateField HeaderText="Collateral_Sale_Price_Currency" 
                SortExpression="Collateral_Sale_Price_Currency">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownListCurrency" runat="server"
                        DataSourceID="SqlDataSourceCurrentcy" DataTextField="Description" 
                        DataValueField="Code"
                        SelectedValue='<%# Bind("Collateral_Sale_Price_Currency")%>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" 
                        Text='<%# Bind("Collateral_Sale_Price_Currency") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" 
                        Text='<%# Bind("Collateral_Sale_Price_Currency") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Collateral_Sale_Price" 
                HeaderText="Collateral_Sale_Price" SortExpression="Collateral_Sale_Price" />
            <asp:BoundField DataField="Collateral_Sale_Date" 
                HeaderText="Collateral_Sale_Date" SortExpression="Collateral_Sale_Date" />
            <asp:BoundField DataField="Collateral_Description" 
                HeaderText="Collateral_Description" SortExpression="Collateral_Description" />
            <asp:BoundField DataField="District_of_Property" 
                HeaderText="District_of_Property" SortExpression="District_of_Property" />
            <asp:BoundField DataField="Amphur_of_Property" HeaderText="Amphur_of_Property" 
                SortExpression="Amphur_of_Property" />
            <asp:TemplateField HeaderText="Province_of_Property" 
                SortExpression="Province_of_Property">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownListProvince" runat="server" 
                        DataSourceID="SqlDataSourcePROVINCE" DataTextField="Prov_Thai" 
                        DataValueField="Prov_Thai"
                        SelectedValue='<%# Bind("Province_of_Property") %>'>
                    </asp:DropDownList>
<%--<asp:TextBox ID="ProvinceTextBox" runat="server" 
                        Text='<%# Bind("Province_of_Property") %>'></asp:TextBox>--%>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" 
                        Text='<%# Bind("Province_of_Property") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" 
                        Text='<%# Bind("Province_of_Property") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Title_Deed_Number" HeaderText="Title_Deed_Number" 
                SortExpression="Title_Deed_Number" />
            <asp:CommandField ShowEditButton="True" />
        </Fields>
    </asp:DetailsView>

      <asp:SqlDataSource ID="SqlDataSourceCurrentcy" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>" 
                        SelectCommand="L_CURRENCY_CODE_SELECT" 
        EnableCaching="True" SelectCommandType="StoredProcedure">
                    </asp:SqlDataSource>
    
    <asp:SqlDataSource ID="SqlDataSourcePROVINCE" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>" 
        SelectCommand="L_PROVINCE_SELECT" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
    
</asp:Content>
