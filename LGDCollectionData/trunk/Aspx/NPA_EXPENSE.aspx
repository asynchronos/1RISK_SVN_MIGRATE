<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NPA_EXPENSE.aspx.cs" Inherits="LGDCollectionData.Aspx.NPA_EXPENSE" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<script type="text/javascript">
    function popupAlert(msg) {
        alert(msg);
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" 
        AutoGenerateRows="False" DataKeyNames="Expense_Year" 
        DataSourceID="SqlDataSourceNPA_EXPENSE" EnableModelValidation="True" 
        Height="50px" Width="420px" DefaultMode="Edit"
        OnDataBound="DetailsView_Databound">
        <Fields>
            <asp:BoundField DataField="Expense_Year" HeaderText="Expense_Year" 
                ReadOnly="True" SortExpression="Expense_Year" />
            <asp:TemplateField HeaderText="Appraised_Value_Beginning_of_Year" 
                SortExpression="Appraised_Value_Beginning_of_Year">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" 
                        Text='<%# Bind("Appraised_Value_Beginning_of_Year","{0:n2}") %>' style="text-align:right"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Appraised Value Beginning of Year" Text="*" ValidationGroup="UpdateValidation" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
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
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Cost Value Beginning of Year" Text="*" ValidationGroup="UpdateValidation" ControlToValidate="TextBox3"></asp:RequiredFieldValidator>
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
            <asp:TemplateField HeaderText="UPDATE_USER" SortExpression="UPDATE_USER">
                <EditItemTemplate>
                    <asp:Label ID="LabelUserId" runat="server" Text='<%# Bind("UPDATE_USER") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("UPDATE_USER") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("UPDATE_USER") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="UPDATE_DATE" SortExpression="UPDATE_DATE">
                <EditItemTemplate>
                    <asp:Label ID="LabelDate" runat="server" Text='<%# Bind("UPDATE_DATE") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("UPDATE_DATE") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("UPDATE_DATE") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="true" CommandName="Update" Text="Update"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                        CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                        CommandName="Edit" Text="Edit"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="true" ValidationGroup="UpdateValidation" ShowSummary="False"/>
    <asp:SqlDataSource ID="SqlDataSourceNPA_EXPENSE" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>" 
        InsertCommand="NPA_EXPENSE_INSERT" InsertCommandType="StoredProcedure" 
        SelectCommand="NPA_EXPENSE_SELECT" SelectCommandType="StoredProcedure" 
        UpdateCommand="NPA_EXPENSE_UPDATE" UpdateCommandType="StoredProcedure"
        OnUpdated="SqlDataSource1_Updated">
        <InsertParameters>
            <asp:Parameter Name="Expense_Year" Type="Int16" />
            <asp:Parameter Name="Appraised_Value_Beginning_of_Year" Type="Double" />
            <asp:Parameter Name="Cost_Value_Beginning_of_Year" Type="Double" />
            <asp:Parameter Name="Total_Expense" Type="Double" />
            <asp:Parameter Name="UPDATE_USER" Type="String" />
            <asp:Parameter Name="UPDATE_DATE" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Expense_Year" Type="Int16" />
            <asp:Parameter Name="Appraised_Value_Beginning_of_Year" Type="Double" />
            <asp:Parameter Name="Cost_Value_Beginning_of_Year" Type="Double" />
            <asp:Parameter Name="Total_Expense" Type="Double" />
            <asp:Parameter Name="UPDATE_USER" Type="String" />
            <asp:Parameter Name="UPDATE_DATE" Type="DateTime" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
