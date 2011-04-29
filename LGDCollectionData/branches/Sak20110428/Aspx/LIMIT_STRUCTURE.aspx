<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LIMIT_STRUCTURE.aspx.cs" Inherits="LGDCollectionData.Aspx.LIMIT_STRUCTURE" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" 
        AutoGenerateRows="False" DataKeyNames="CIF,Default_Date,LIMITNO" 
        DataSourceID="SqlDataSourceLIMIT_STRUCTURE" EnableModelValidation="True" 
        Height="50px" Width="125px">
        <Fields>
            <asp:BoundField DataField="CIF" HeaderText="CIF" ReadOnly="True" 
                SortExpression="CIF" />
            <asp:BoundField DataField="Default_Date" HeaderText="Default_Date" 
                ReadOnly="True" SortExpression="Default_Date" />
            <asp:TemplateField HeaderText="APP_ID" SortExpression="APP_ID">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownListAPP" runat="server" 
                        DataSourceID="SqlDataSourceAPP" DataTextField="APP_ID" DataValueField="APP_ID"
                        SelectedValue='<%# Bind("APP_ID")%>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("APP_ID") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("APP_ID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="LIMITTYP_A" SortExpression="LIMITTYP_A">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownListLIMITTYPE" runat="server" 
                        DataSourceID="SqlDataSourceLIMIT_TYPE" DataTextField="LIMITTYP_A" 
                        DataValueField="LIMITTYP_A"
                        SelectedValue='<%# Bind("LIMITTYP_A")%>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("LIMITTYP_A") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("LIMITTYP_A") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="LIMITNO" HeaderText="LIMITNO" ReadOnly="True" 
                SortExpression="LIMITNO" />
            <asp:BoundField DataField="Limit_D1" HeaderText="Limit_D1" 
                SortExpression="Limit_D1" />
            <asp:BoundField DataField="One_Level_Up_Limit_ID_D1" 
                HeaderText="One_Level_Up_Limit_ID_D1" 
                SortExpression="One_Level_Up_Limit_ID_D1" />
            <asp:TemplateField HeaderText="One_Level_Up_Limit_Currency_D1" 
                SortExpression="One_Level_Up_Limit_Currency_D1">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownListCurrency1" runat="server" 
                        DataSourceID="SqlDataSourceCurrentcy" DataTextField="Description" 
                        DataValueField="Code"
                        SelectedValue='<%# Bind("One_Level_Up_Limit_Currency_D1")%>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" 
                        Text='<%# Bind("One_Level_Up_Limit_Currency_D1") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" 
                        Text='<%# Bind("One_Level_Up_Limit_Currency_D1") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="One_Level_Up_Limit_Amount_D1" 
                HeaderText="One_Level_Up_Limit_Amount_D1" 
                SortExpression="One_Level_Up_Limit_Amount_D1" />
            <asp:BoundField DataField="Two_Level_Up_Limit_ID_D1" 
                HeaderText="Two_Level_Up_Limit_ID_D1" 
                SortExpression="Two_Level_Up_Limit_ID_D1" />
            <asp:TemplateField HeaderText="Two_Level_Up_Limit_Currency_D1" 
                SortExpression="Two_Level_Up_Limit_Currency_D1">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownListCurrency2" runat="server"
                    DataSourceID="SqlDataSourceCurrentcy" DataTextField="Description" 
                    DataValueField="Code"
                    SelectedValue='<%# Bind("Two_Level_Up_Limit_Currency_D1")%>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" 
                        Text='<%# Bind("Two_Level_Up_Limit_Currency_D1") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" 
                        Text='<%# Bind("Two_Level_Up_Limit_Currency_D1") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Two_Level_Up_Limit_Amount_D1" 
                HeaderText="Two_Level_Up_Limit_Amount_D1" 
                SortExpression="Two_Level_Up_Limit_Amount_D1" />
            <asp:BoundField DataField="Three_Level_Up_Limit_ID_D1" 
                HeaderText="Three_Level_Up_Limit_ID_D1" 
                SortExpression="Three_Level_Up_Limit_ID_D1" />
            <asp:TemplateField HeaderText="Three_Level_Up_Limit_Currency_D1" 
                SortExpression="Three_Level_Up_Limit_Currency_D1">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownListCurrency3" runat="server"
                    DataSourceID="SqlDataSourceCurrentcy" DataTextField="Description" 
                    DataValueField="Code"
                    SelectedValue='<%# Bind("Three_Level_Up_Limit_Currency_D1")%>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" 
                        Text='<%# Bind("Three_Level_Up_Limit_Currency_D1") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" 
                        Text='<%# Bind("Three_Level_Up_Limit_Currency_D1") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Three_Level_Up_Limit_Amount_D1" 
                HeaderText="Three_Level_Up_Limit_Amount_D1" 
                SortExpression="Three_Level_Up_Limit_Amount_D1" />
            <asp:BoundField DataField="Four_Level_Up_Limit_ID_D1" 
                HeaderText="Four_Level_Up_Limit_ID_D1" 
                SortExpression="Four_Level_Up_Limit_ID_D1" />
            <asp:TemplateField HeaderText="Four_Level_Up_Limit_Currency_D1" 
                SortExpression="Four_Level_Up_Limit_Currency_D1">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownListCurrency4" runat="server"
                    DataSourceID="SqlDataSourceCurrentcy" DataTextField="Description" 
                    DataValueField="Code"
                    SelectedValue='<%# Bind("Four_Level_Up_Limit_Currency_D1")%>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" 
                        Text='<%# Bind("Four_Level_Up_Limit_Currency_D1") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" 
                        Text='<%# Bind("Four_Level_Up_Limit_Currency_D1") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Four_Level_Up_Limit_Amount_D1" 
                HeaderText="Four_Level_Up_Limit_Amount_D1" 
                SortExpression="Four_Level_Up_Limit_Amount_D1" />
            <asp:CommandField ShowEditButton="True" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSourceLIMIT_STRUCTURE" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>" 
        InsertCommand="LIMIT_STRUCTURE_INSERT" InsertCommandType="StoredProcedure" 
        SelectCommand="LIMIT_STRUCTURE_SELECT" SelectCommandType="StoredProcedure" 
        UpdateCommand="LIMIT_STRUCTURE_UPDATE" UpdateCommandType="StoredProcedure">
        <InsertParameters>
            <asp:Parameter Name="CIF" Type="String" />
            <asp:Parameter Name="Default_Date" Type="DateTime" />
            <asp:Parameter Name="APP_ID" Type="String" />
            <asp:Parameter Name="LIMITTYP_A" Type="String" />
            <asp:Parameter Name="LIMITNO" Type="String" />
            <asp:Parameter Name="Limit_D1" Type="Double" />
            <asp:Parameter Name="One_Level_Up_Limit_ID_D1" Type="String" />
            <asp:Parameter Name="One_Level_Up_Limit_Currency_D1" Type="String" />
            <asp:Parameter Name="One_Level_Up_Limit_Amount_D1" Type="Double" />
            <asp:Parameter Name="Two_Level_Up_Limit_ID_D1" Type="String" />
            <asp:Parameter Name="Two_Level_Up_Limit_Currency_D1" Type="String" />
            <asp:Parameter Name="Two_Level_Up_Limit_Amount_D1" Type="Double" />
            <asp:Parameter Name="Three_Level_Up_Limit_ID_D1" Type="String" />
            <asp:Parameter Name="Three_Level_Up_Limit_Currency_D1" Type="String" />
            <asp:Parameter Name="Three_Level_Up_Limit_Amount_D1" Type="Double" />
            <asp:Parameter Name="Four_Level_Up_Limit_ID_D1" Type="String" />
            <asp:Parameter Name="Four_Level_Up_Limit_Currency_D1" Type="String" />
            <asp:Parameter Name="Four_Level_Up_Limit_Amount_D1" Type="Double" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="CIF" QueryStringField="CIF" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="CIF" Type="String" />
            <asp:Parameter Name="Default_Date" Type="DateTime" />
            <asp:Parameter Name="APP_ID" Type="String" />
            <asp:Parameter Name="LIMITTYP_A" Type="String" />
            <asp:Parameter Name="LIMITNO" Type="String" />
            <asp:Parameter Name="Limit_D1" Type="Double" />
            <asp:Parameter Name="One_Level_Up_Limit_ID_D1" Type="String" />
            <asp:Parameter Name="One_Level_Up_Limit_Currency_D1" Type="String" />
            <asp:Parameter Name="One_Level_Up_Limit_Amount_D1" Type="Double" />
            <asp:Parameter Name="Two_Level_Up_Limit_ID_D1" Type="String" />
            <asp:Parameter Name="Two_Level_Up_Limit_Currency_D1" Type="String" />
            <asp:Parameter Name="Two_Level_Up_Limit_Amount_D1" Type="Double" />
            <asp:Parameter Name="Three_Level_Up_Limit_ID_D1" Type="String" />
            <asp:Parameter Name="Three_Level_Up_Limit_Currency_D1" Type="String" />
            <asp:Parameter Name="Three_Level_Up_Limit_Amount_D1" Type="Double" />
            <asp:Parameter Name="Four_Level_Up_Limit_ID_D1" Type="String" />
            <asp:Parameter Name="Four_Level_Up_Limit_Currency_D1" Type="String" />
            <asp:Parameter Name="Four_Level_Up_Limit_Amount_D1" Type="Double" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceAPP" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>" 
        SelectCommand="L_APP_ID_SELECT" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceLIMIT_TYPE" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>" 
        SelectCommand="LIMIT_TYPE_SELECT" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>

      <asp:SqlDataSource ID="SqlDataSourceCurrentcy" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>" 
                        SelectCommand="L_CURRENCY_CODE_SELECT" 
        EnableCaching="True" SelectCommandType="StoredProcedure">
                    </asp:SqlDataSource>
    
</asp:Content>
