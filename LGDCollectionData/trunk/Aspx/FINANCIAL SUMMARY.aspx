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
        Width="125px" DefaultMode="Edit">
        <Fields>
            <asp:BoundField DataField="CIF" HeaderText="CIF" ReadOnly="True" 
                SortExpression="CIF" />
            <asp:BoundField DataField="Default_Date" HeaderText="Default_Date" 
                ReadOnly="True" SortExpression="Default_Date" />
            <asp:BoundField DataField="Financial_Data_Date" 
                HeaderText="Financial_Data_Date" SortExpression="Financial_Data_Date" />
            <asp:BoundField DataField="Total_Assets" HeaderText="Total_Assets" 
                SortExpression="Total_Assets" />
            <asp:BoundField DataField="Total_Liabilities" HeaderText="Total_Liabilities" 
                SortExpression="Total_Liabilities" />
            <asp:BoundField DataField="Total_Revenue" HeaderText="Total_Revenue" 
                SortExpression="Total_Revenue" />
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
