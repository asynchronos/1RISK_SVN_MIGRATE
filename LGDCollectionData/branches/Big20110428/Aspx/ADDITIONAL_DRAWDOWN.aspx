<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" 
 CodeBehind="ADDITIONAL_DRAWDOWN.aspx.cs" Inherits="LGDCollectionData.Aspx.ADDITIONAL_DRAWDOWN" %>


<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h1>
<asp:Label ID="Label1" runat="server" Text="ADDITIONAL DRAWDOWN" 
            style="font-weight: 700"></asp:Label>
    </h1>
&nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>" 
            SelectCommand="ADDITIONAL_DRAWDOWN_SELECT" 
            SelectCommandType="StoredProcedure" InsertCommand="ADDITIONAL_DRAWDOWN_INSERT" 
            InsertCommandType="StoredProcedure" UpdateCommand="ADDITIONAL_DRAWDOWN_UPDATE" 
            UpdateCommandType="StoredProcedure"
             OnUpdating="updateRecord"
            >
            <InsertParameters>
                <asp:Parameter Name="CIF" Type="String" />
                <asp:Parameter Name="Default_Date" Type="DateTime" />
                <asp:Parameter Name="BRAN" Type="String" />
                <asp:Parameter Name="ACCGL" Type="String" />
                <asp:Parameter Name="ACCNO" Type="String" />
                <asp:Parameter Name="CONTNO" Type="String" />
                <asp:Parameter Name="SEQNO" Type="String" />
                <asp:Parameter Name="APP_ID" Type="String" />
                <asp:Parameter Name="PRINCIPAL" Type="Double" />
                <asp:Parameter Name="ACCRU" Type="Double" />
                <asp:Parameter Name="SUSP" Type="Double" />
                <asp:Parameter Name="PRINCIPAL_AT_Last_Month" Type="Double" />
                <asp:Parameter Name="ACCRU_AT_Last_Month" Type="Double" />
                <asp:Parameter Name="SUSP_AT_Last_Month" Type="Double" />
                <asp:Parameter Name="Additional_Drawdown_Date" Type="DateTime" />
                <asp:Parameter Name="Additional_Drawdown_Currency" Type="String" />
                <asp:Parameter Name="LIMITNO" Type="String" />
                <asp:Parameter Name="LIMITNO_Changed" Type="Boolean" />
                <asp:Parameter Name="Previous_LIMITNO" Type="String" />
                <asp:Parameter Name="Is_This_an_Additional_Drawdown" Type="Boolean" />
                <asp:Parameter Name="Type_of_Additional_Drawdown" Type="String" />
                <asp:Parameter Name="Other_Reason_of_Principal_Increase" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="CIF" QueryStringField="CIF" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="CIF" Type="String" />
                <asp:Parameter Name="Default_Date" Type="DateTime" />
                <asp:Parameter Name="BRAN" Type="String" />
                <asp:Parameter Name="ACCGL" Type="String" />
                <asp:Parameter Name="ACCNO" Type="String" />
                <asp:Parameter Name="CONTNO" Type="String" DefaultValue="" />
                <asp:Parameter Name="SEQNO" Type="String" />
                <asp:Parameter Name="APP_ID" Type="String" />
                <asp:Parameter Name="PRINCIPAL" Type="Double" />
                <asp:Parameter Name="ACCRU" Type="Double" />
                <asp:Parameter Name="SUSP" Type="Double" />
                <asp:Parameter Name="PRINCIPAL_AT_Last_Month" Type="Double" />
                <asp:Parameter Name="ACCRU_AT_Last_Month" Type="Double" />
                <asp:Parameter Name="SUSP_AT_Last_Month" Type="Double" />
                <asp:Parameter Name="Additional_Drawdown_Date" Type="DateTime" />
                <asp:Parameter Name="Additional_Drawdown_Currency" Type="String" />
                <asp:Parameter Name="LIMITNO" Type="String" />
                <asp:Parameter Name="LIMITNO_Changed" Type="Boolean" />
                <asp:Parameter Name="Previous_LIMITNO" Type="String" />
                <asp:Parameter Name="Is_This_an_Additional_Drawdown" Type="Boolean" />
                <asp:Parameter Name="Type_of_Additional_Drawdown" Type="String" />
                <asp:Parameter Name="Other_Reason_of_Principal_Increase" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceAppID" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>" 
        SelectCommand="L_APP_ID_SELECT" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceAddCurrency" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>" 
        ProviderName="<%$ ConnectionStrings:LGDConnectionString1.ProviderName %>" 
        SelectCommand="L_CURRENCY_CODE_SELECT" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceLimitNo" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>" SelectCommand="FACILITY_INFORMATION_SELECT" 
        SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    </div>
    <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" 
        AutoGenerateRows="False" 
        DataKeyNames="CIF,Default_Date,BRAN,ACCGL,ACCNO,CONTNO,SEQNO,Additional_Drawdown_Date" 
        DataSourceID="SqlDataSource1" EnableModelValidation="True" Height="50px" 
        Width="442px" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" 
        BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" 
        style="font-size: small; font-family: Tahoma">
        <AlternatingRowStyle BackColor="White" />
        <EditRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <Fields>
            <asp:BoundField DataField="CIF" HeaderText="CIF" ReadOnly="True" 
                SortExpression="CIF" />
            <asp:BoundField DataField="Default_Date" HeaderText="Default_Date" 
                ReadOnly="True" SortExpression="Default_Date" />
            <asp:BoundField DataField="BRAN" HeaderText="BRAN" ReadOnly="True" 
                SortExpression="BRAN" />
            <asp:BoundField DataField="ACCGL" HeaderText="ACCGL" ReadOnly="True" 
                SortExpression="ACCGL" />
            <asp:BoundField DataField="ACCNO" HeaderText="ACCNO" ReadOnly="True" 
                SortExpression="ACCNO" />
            <asp:BoundField DataField="CONTNO" HeaderText="CONTNO" ReadOnly="True" 
                SortExpression="CONTNO" />
            <asp:BoundField DataField="SEQNO" HeaderText="SEQNO" ReadOnly="True" 
                SortExpression="SEQNO" />
            <asp:TemplateField HeaderText="APP_ID" SortExpression="APP_ID">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" 
                        DataSourceID="SqlDataSourceAppID" 
                        DataTextField="APP_ID" DataValueField="APP_ID" 
                        SelectedValue='<%# Bind("APP_ID") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" 
                        DataSourceID="SqlDataSourceAppID" DataTextField="APP_ID" 
                        DataValueField="APP_ID" SelectedValue='<%# Bind("APP_ID") %>'>
                    </asp:DropDownList>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("APP_ID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="PRINCIPAL" HeaderText="PRINCIPAL" 
                SortExpression="PRINCIPAL" />
            <asp:BoundField DataField="ACCRU" HeaderText="ACCRU" SortExpression="ACCRU" />
            <asp:BoundField DataField="SUSP" HeaderText="SUSP" SortExpression="SUSP" />
            <asp:BoundField DataField="PRINCIPAL_AT_Last_Month" 
                HeaderText="PRINCIPAL_AT_Last_Month" SortExpression="PRINCIPAL_AT_Last_Month" />
            <asp:BoundField DataField="ACCRU_AT_Last_Month" 
                HeaderText="ACCRU_AT_Last_Month" SortExpression="ACCRU_AT_Last_Month" />
            <asp:BoundField DataField="SUSP_AT_Last_Month" HeaderText="SUSP_AT_Last_Month" 
                SortExpression="SUSP_AT_Last_Month" />
            <asp:BoundField DataField="Additional_Drawdown_Date" 
                HeaderText="Additional_Drawdown_Date" ReadOnly="True" 
                SortExpression="Additional_Drawdown_Date" />
            <asp:TemplateField HeaderText="Additional_Drawdown_Currency" 
                SortExpression="Additional_Drawdown_Currency">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList4" runat="server" 
                        DataSourceID="SqlDataSourceAddCurrency" DataTextField="Description" 
                        DataValueField="Code"  AppendDataBoundItems="true"
                        SelectedValue='<%# Bind("Additional_Drawdown_Currency") %>'>
                       <asp:ListItem Value="">Please Select</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList3" runat="server" 
                        DataSourceID="SqlDataSourceAddCurrency" DataTextField="Description" 
                        DataValueField="Code" 
                        SelectedValue='<%# Bind("Additional_Drawdown_Currency") %>'>
                    </asp:DropDownList>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" 
                        Text='<%# Bind("Additional_Drawdown_Currency") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="LIMITNO" HeaderText="LIMITNO" 
                SortExpression="LIMITNO" />
            <asp:CheckBoxField DataField="LIMITNO_Changed" HeaderText="LIMITNO_Changed" 
                SortExpression="LIMITNO_Changed" />
            <asp:TemplateField HeaderText="Previous_LIMITNO" 
                SortExpression="Previous_LIMITNO">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList5" runat="server" AppendDataBoundItems="true" 
                        DataSourceID="SqlDataSourceLimitNo" DataTextField="LIMITNO" 
                        DataValueField="LIMITNO" SelectedValue='<%# Bind("Previous_LIMITNO") %>'>
                      <asp:ListItem Value="">Please Select</asp:ListItem>
                     </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList6" runat="server"  AppendDataBoundItems="true" 
                        DataSourceID="SqlDataSourceLimitNo" DataTextField="LIMITNO" 
                        DataValueField="LIMITNO" SelectedValue='<%# Bind("Previous_LIMITNO") %>'>
                    <asp:ListItem Value="">Please Select</asp:ListItem>
                    </asp:DropDownList>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Previous_LIMITNO") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CheckBoxField DataField="Is_This_an_Additional_Drawdown" 
                HeaderText="Is_This_an_Additional_Drawdown" 
                SortExpression="Is_This_an_Additional_Drawdown" />
            <asp:BoundField DataField="Type_of_Additional_Drawdown" HeaderText="Type_of_Additional_Drawdown" 
                SortExpression="Type_of_Additional_Drawdown" />
            <asp:BoundField DataField="Other_Reason_of_Principal_Increase" 
                HeaderText="Other_Reason_of_Principal_Increase" 
                SortExpression="Other_Reason_of_Principal_Increase" />
            <asp:CommandField ShowEditButton="True" ShowInsertButton="True" />
        </Fields>
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />
    </asp:DetailsView>
</asp:Content>