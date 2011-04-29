<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NPA_EXPENSE.aspx.cs" Inherits="LGDCollectionData.Aspx.NPA_EXPENSE" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" 
        AutoGenerateRows="False" DataKeyNames="Expense_Year" 
        DataSourceID="SqlDataSourceNPA_EXPENSE" EnableModelValidation="True" 
        Height="50px" Width="420px" DefaultMode="Edit">
        <Fields>
            <asp:BoundField DataField="Expense_Year" HeaderText="Expense_Year" 
                ReadOnly="True" SortExpression="Expense_Year" />
            <asp:TemplateField HeaderText="Appraised_Value_Beginning_of_Year" 
                SortExpression="Appraised_Value_Beginning_of_Year">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" 
                        Text='<%# Bind("Appraised_Value_Beginning_of_Year","{0:n2}") %>' style="text-align:right"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" 
                        Text='<%# Bind("Appraised_Value_Beginning_of_Year") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" 
                        Text='<%# Bind("Appraised_Value_Beginning_of_Year","{0:n2}") %>' style="text-align:right"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Cost_Value_Beginning_of_Year" 
                SortExpression="Cost_Value_Beginning_of_Year">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" 
                        Text='<%# Bind("Cost_Value_Beginning_of_Year","{0:n2}") %>' style="text-align:right"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="TextBox3"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" 
                        Text='<%# Bind("Cost_Value_Beginning_of_Year") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" 
                        Text='<%# Bind("Cost_Value_Beginning_of_Year","{0:n2}") %>' style="text-align:right"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Total_Expense" SortExpression="Total_Expense">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Total_Expense","{0:n2}") %>' style="text-align:right"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Total_Expense") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Total_Expense","{0:n2}") %>' style="text-align:right"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="True" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSourceNPA_EXPENSE" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>" 
        InsertCommand="NPA_EXPENSE_INSERT" InsertCommandType="StoredProcedure" 
        SelectCommand="NPA_EXPENSE_SELECT" SelectCommandType="StoredProcedure" 
        UpdateCommand="NPA_EXPENSE_UPDATE" UpdateCommandType="StoredProcedure">
        <InsertParameters>
            <asp:Parameter Name="Expense_Year" Type="Int16" />
            <asp:Parameter Name="Appraised_Value_Beginning_of_Year" Type="Double" />
            <asp:Parameter Name="Cost_Value_Beginning_of_Year" Type="Double" />
            <asp:Parameter Name="Total_Expense" Type="Double" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Expense_Year" Type="Int16" />
            <asp:Parameter Name="Appraised_Value_Beginning_of_Year" Type="Double" />
            <asp:Parameter Name="Cost_Value_Beginning_of_Year" Type="Double" />
            <asp:Parameter Name="Total_Expense" Type="Double" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
