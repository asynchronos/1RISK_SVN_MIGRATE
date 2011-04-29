<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FINANCIAL SUMMARY.aspx.cs" Inherits="LGDCollectionData.Aspx.FINANCIAL_SUMMARY" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>" 
        SelectCommand="FINANCIAL_SUMMARY_SELECT" 
        SelectCommandType="StoredProcedure" onselecting="SqlDataSource1_Selecting" 
        InsertCommand="ADDITIONAL_DRAWDOWN_SELECT" InsertCommandType="StoredProcedure" 
        UpdateCommand="FINANCIAL_SUMMARY_UPDATE" UpdateCommandType="StoredProcedure">
        <InsertParameters>
            <asp:Parameter Name="CIF" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="CIF" QueryStringField="CIF" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="CIF" Type="String" />
            <asp:Parameter Name="Default_Date" Type="DateTime" />
            <asp:Parameter Name="Financial_Data_Date" Type="DateTime" />
            <asp:Parameter Name="Total_Assets" Type="Int32" />
            <asp:Parameter Name="Total_Liabilities" Type="Int32" />
            <asp:Parameter Name="Total_Revenue" Type="Int32" />
            <asp:Parameter Name="Financial_Currency_Code" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" 
        AutoGenerateRows="False" DataKeyNames="CIF,Default_Date" 
        DataSourceID="SqlDataSource1" EnableModelValidation="True" Height="50px" 
        Width="340px" DefaultMode="Edit">
        <Fields>
            <asp:BoundField DataField="CIF" HeaderText="CIF" ReadOnly="True" 
                SortExpression="CIF" />
            <asp:BoundField DataField="Default_Date" HeaderText="Default_Date" 
                ReadOnly="True" SortExpression="Default_Date" />
            <asp:TemplateField HeaderText="Financial_Data_Date" 
                SortExpression="Financial_Data_Date">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxFinancial_Data_Date" runat="server" Text='<%# Bind("Financial_Data_Date") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" 
                        Text='<%# Bind("Financial_Data_Date") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Financial_Data_Date") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Total_Assets" SortExpression="Total_Assets">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Total_Assets") %>' style="text-align:right;"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Total_Assets") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Total_Assets","{0:n2}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Total_Liabilities" 
                SortExpression="Total_Liabilities">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Total_Liabilities") %>' style="text-align:right;"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="TextBox3"></asp:RequiredFieldValidator>

                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" 
                        Text='<%# Bind("Total_Liabilities") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Total_Liabilities") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Total_Revenue" SortExpression="Total_Revenue">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Total_Revenue") %>' style="text-align:right;"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="TextBox4"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Total_Revenue") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Total_Revenue") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Financial_Currency_Code" 
                SortExpression="Financial_Currency_Code">
                <EditItemTemplate>
<%--                    <asp:TextBox ID="TextBox1" runat="server" 
                        Text='<%# Bind("Financial_Currency_Code") %>'></asp:TextBox>--%>
                    <asp:DropDownList ID="DropDownList1" runat="server" 
                        DataSourceID="SqlDataSourceCurrentcy" DataTextField="Description" 
                        DataValueField="Code"
                        SelectedValue='<%# Bind("Financial_Currency_Code")%>'>
                    </asp:DropDownList>

                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" 
                        Text='<%# Bind("Financial_Currency_Code") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" 
                        Text='<%# Bind("Financial_Currency_Code") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="True" ShowInsertButton="True" />
        </Fields>
    </asp:DetailsView>                  
      <asp:SqlDataSource ID="SqlDataSourceCurrentcy" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>" 
                        SelectCommand="L_CURRENCY_CODE_SELECT" 
        EnableCaching="True" SelectCommandType="StoredProcedure">
                    </asp:SqlDataSource>
    </asp:Content>
