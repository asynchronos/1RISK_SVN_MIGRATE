<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="PV_LOSS.aspx.cs" Inherits="LGDCollectionData.Aspx.PV_LOSS" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register src="../UserControls/SelectFormWebUserControl.ascx" tagname="SelectFormWebUserControl" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <uc1:SelectFormWebUserControl ID="SelectFormWebUserControl1" runat="server" />
    <h2>
        <asp:Label ID="FormName_Label" runat="server" Text="PV LOSS"></asp:Label>
    </h2>
    <asp:DetailsView ID="PV_LOSS_DetailsView" runat="server" AllowPaging="True" AutoGenerateRows="False"
        CellPadding="4" DataKeyNames="CIF,Default_Date,Date_of_Restructure" DataSourceID="PV_LOSS_SqlDataSource"
        EnableModelValidation="True" ForeColor="#333333" OnPageIndexChanging="DetailsView_PageIndexChanging"
        OnItemUpdating="DetailsView_ItemUpdating" OnPreRender="DetailsView_PreRender">
        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
        <EmptyDataTemplate>
            <asp:TextBox ID="Empty_TextBox" runat="server"></asp:TextBox>
        </EmptyDataTemplate>
        <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
        <Fields>
            <asp:TemplateField HeaderText="CIF" SortExpression="CIF">
                <EditItemTemplate>
                    <asp:Label ID="CIF_Label" runat="server" Text='<%# Bind("CIF") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="CIF_TextBox" runat="server" Text='<%# Bind("CIF") %>' OnPreRender="CIF_TextBox_PreRender"
                        BackColor="#C0C0C0" onfocus="this.blur();"></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="CIF_Label" runat="server" Text='<%# Eval("CIF") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Default_Date" SortExpression="Default_Date">
                <EditItemTemplate>
                    <asp:Label ID="Default_Date_Label" runat="server" Text='<%# Eval("Default_Date", "{0:d MMMM yyyy}") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="Default_Date_TextBox" runat="server" Text='<%# Bind("Default_Date", "{0:d MMMM yyyy}") %>'></asp:TextBox>
                    <asp:CalendarExtender ID="Default_Date_TextBox_CalendarExtender" runat="server" Enabled="True"
                        TargetControlID="Default_Date_TextBox" Format="d MMMM yyyy">
                    </asp:CalendarExtender>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Default_Date_Label" runat="server" Text='<%# Bind("Default_Date", "{0:d MMMM yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Date_of_Restructure" SortExpression="Date_of_Restructure">
                <EditItemTemplate>
                    <asp:Label ID="Date_of_Restructure_Label" runat="server" Text='<%# Eval("Date_of_Restructure", "{0:d MMMM yyyy}") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="Date_of_Restructure_TextBox" runat="server" Text='<%# Bind("Date_of_Restructure", "{0:d MMMM yyyy}") %>'></asp:TextBox>
                    <asp:CalendarExtender ID="Date_of_Restructure_TextBox_CalendarExtender" runat="server"
                        Enabled="True" TargetControlID="Date_of_Restructure_TextBox" Format="d MMMM yyyy">
                    </asp:CalendarExtender>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Date_of_Restructure_Label" runat="server" Text='<%# Bind("Date_of_Restructure", "{0:d MMMM yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Date_of_Upgrade" SortExpression="Date_of_Upgrade">
                <EditItemTemplate>
                    <asp:TextBox ID="Date_of_Upgrade_TextBox" runat="server" Text='<%# Bind("Date_of_Upgrade", "{0:d MMMM yyyy}") %>'></asp:TextBox>
                    <asp:CalendarExtender ID="Date_of_Upgrade_TextBox_CalendarExtender" runat="server"
                        Enabled="True" TargetControlID="Date_of_Upgrade_TextBox" Format="d MMMM yyyy">
                    </asp:CalendarExtender>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="Date_of_Upgrade_TextBox" runat="server" Text='<%# Bind("Date_of_Upgrade", "{0:d MMMM yyyy}") %>'></asp:TextBox>
                    <asp:CalendarExtender ID="Date_of_Upgrade_TextBox_CalendarExtender" runat="server"
                        Enabled="True" TargetControlID="Date_of_Upgrade_TextBox" Format="d MMMM yyyy">
                    </asp:CalendarExtender>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Date_of_Upgrade_Label" runat="server" Text='<%# Bind("Date_of_Upgrade", "{0:d MMMM yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Pv_Loss" HeaderText="Pv_Loss" SortExpression="Pv_Loss" />
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="New_LinkButton" runat="server" CausesValidation="False" CommandName="New"
                        Text="New"></asp:LinkButton>
                    <%--&nbsp;<asp:LinkButton ID="Update_LinkButton" runat="server" CausesValidation="True" CommandName="Update"
                        Text="Update"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="Cancel_LinkButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>--%>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:LinkButton ID="Insert_LinkButton" runat="server" CausesValidation="True" CommandName="Insert"
                        Text="Insert"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="Cancel_LinkButton" runat="server" CausesValidation="False" CommandName="Cancel"
                        Text="Cancel"></asp:LinkButton>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="Edit_LinkButton" runat="server" CausesValidation="False" CommandName="Edit"
                        Text="Edit"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="New_LinkButton" runat="server" CausesValidation="False" CommandName="New"
                        Text="New"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerSettings Mode="NumericFirstLast" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="PV_LOSS_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>"
        InsertCommand="P_PV_LOSS_INSERT" InsertCommandType="StoredProcedure" SelectCommand="P_PV_LOSS_SELECT"
        SelectCommandType="StoredProcedure" UpdateCommand="P_PV_LOSS_UPDATE" UpdateCommandType="StoredProcedure">
        <InsertParameters>
            <asp:Parameter Name="CIF" Type="String" />
            <asp:Parameter Name="Default_Date" Type="DateTime" />
            <asp:Parameter Name="Date_of_Restructure" Type="DateTime" />
            <asp:Parameter Name="Date_of_Upgrade" Type="DateTime" />
            <asp:Parameter Name="Pv_Loss" Type="Double" />
            <asp:Parameter Name="UpdateUser" Type="String" />
            <asp:Parameter Name="updateDate" Type="DateTime" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="CIF" QueryStringField="cif" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="CIF" Type="String" />
            <asp:Parameter Name="Default_Date" Type="DateTime" />
            <asp:Parameter Name="Date_of_Restructure" Type="DateTime" />
            <asp:Parameter Name="Date_of_Upgrade" Type="DateTime" />
            <asp:Parameter Name="Pv_Loss" Type="Double" />
            <asp:Parameter Name="UpdateUser" Type="String" />
            <asp:Parameter Name="updateDate" Type="DateTime" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="RESTRUCTURE_INFORMATION_GridView" runat="server" AllowPaging="True"
        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="CIF,Default_Date,Date_of_Repayment"
        DataSourceID="RESTRUCTURE_INFORMATION_SqlDataSource" EnableModelValidation="True"
        ForeColor="#333333" ShowFooter="True" OnRowCommand="RESTRUCTURE_INFORMATION_GridView_RowCommand" OnRowUpdating="GridView_RowUpdating">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="Update_LinkButton" runat="server" CausesValidation="True" CommandName="Update"
                        Text="Update"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="Cancel_LinkButton" runat="server" CausesValidation="False"
                        CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="Edit_LinkButton" runat="server" CausesValidation="False" CommandName="Edit"
                        Text="Edit"></asp:LinkButton>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:LinkButton ID="Insert_LinkButton" runat="server" CausesValidation="True" CommandName="FooterInsert"
                        Text="Insert"></asp:LinkButton>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="Delete_LinkButton" runat="server" CausesValidation="False" CommandName="Delete"
                        Text="Delete"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="CIF" SortExpression="CIF">
                <EditItemTemplate>
                    <asp:Label ID="CIF_Label" runat="server" Text='<%# Eval("CIF") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="CIF_Label" runat="server" Text='<%# Bind("CIF") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:Label ID="CIF_Label" runat="server" OnPreRender="CIF_Label_PreRender"></asp:Label>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Default_Date" SortExpression="Default_Date">
                <EditItemTemplate>
                    <asp:Label ID="Default_Date_Label" runat="server" Text='<%# Eval("Default_Date", "{0:d MMMM yyyy}") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Default_Date_Label" runat="server" Text='<%# Bind("Default_Date", "{0:d MMMM yyyy}") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:Label ID="Default_Date_Label" runat="server" OnPreRender="Default_Date_Label_PreRender"></asp:Label>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Date_of_Restructure" SortExpression="Date_of_Restructure">
                <EditItemTemplate>
                    <asp:Label ID="Date_of_Restructure_Label" runat="server" Text='<%# Bind("Date_of_Restructure", "{0:d MMMM yyyy}") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Date_of_Restructure_Label" runat="server" Text='<%# Bind("Date_of_Restructure", "{0:d MMMM yyyy}") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:Label ID="Date_of_Restructure_Label" runat="server" OnPreRender="Date_of_Restructure_Label_PreRender"></asp:Label>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Date_of_Repayment" SortExpression="Date_of_Repayment">
                <EditItemTemplate>
                    <asp:Label ID="Date_of_Repayment_Label" runat="server" Text='<%# Eval("Date_of_Repayment", "{0:d MMMM yyyy}") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Date_of_Repayment_Label" runat="server" Text='<%# Bind("Date_of_Repayment", "{0:d MMMM yyyy}") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="Date_of_Repayment_TextBox" runat="server" Width="17ex"></asp:TextBox>
                    <asp:CalendarExtender ID="Date_of_Repayment_TextBox_CalendarExtender" 
                        runat="server" Enabled="True" TargetControlID="Date_of_Repayment_TextBox" Format="d MMMM yyyy">
                    </asp:CalendarExtender>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Discount_Rate" SortExpression="Discount_Rate">
                <EditItemTemplate>
                    <asp:TextBox ID="Discount_Rate_TextBox" runat="server" Text='<%# Bind("Discount_Rate") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Discount_Rate_Label" runat="server" Text='<%# Bind("Discount_Rate") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="Discount_Rate_TextBox" runat="server"></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="TDR_Cash_Flow" SortExpression="TDR_Cash_Flow">
                <EditItemTemplate>
                    <asp:TextBox ID="TDR_Cash_Flow_TextBox" runat="server" Text='<%# Bind("TDR_Cash_Flow") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="TDR_Cash_Flow_Label" runat="server" Text='<%# Bind("TDR_Cash_Flow") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="TDR_Cash_Flow_TextBox" runat="server"></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Present_Value_of_Repayment" SortExpression="Present_Value_of_Repayment">
                <EditItemTemplate>
                    <asp:TextBox ID="Present_Value_of_Repayment_TextBox" runat="server" Text='<%# Bind("Present_Value_of_Repayment") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Present_Value_of_Repayment_Label" runat="server" Text='<%# Bind("Present_Value_of_Repayment") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="Present_Value_of_Repayment_TextBox" runat="server"></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Cash_Flow_Currency" SortExpression="Cash_Flow_Currency">
                <EditItemTemplate>
                    <asp:DropDownList ID="Cash_Flow_Currency_DropDownList" runat="server" 
                        DataSourceID="Currency_DataSource" DataTextField="Description" 
                        DataValueField="Code" SelectedValue='<%# Bind("Cash_Flow_Currency") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="Cash_Flow_Currency_DropDownList" runat="server" 
                        DataSourceID="Currency_DataSource" DataTextField="Description" 
                        DataValueField="Code" SelectedValue='<%# Bind("Cash_Flow_Currency") %>'>
                    </asp:DropDownList>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:DropDownList ID="Cash_Flow_Currency_DropDownList" runat="server" 
                        DataSourceID="Currency_DataSource" DataTextField="Description" 
                        DataValueField="Code">
                    </asp:DropDownList>
                </FooterTemplate>
            </asp:TemplateField>
        </Columns>
        <EmptyDataTemplate>
            <table border="0">
                <thead style="background-color: #990000; font-weight: bold; color: White;">
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            CIF
                        </td>
                        <td>
                            Default_Date
                        </td>
                        <td>
                            Date_of_Restructure
                        </td>
                        <td>
                            Date_of_Repayment
                        </td>
                        <td>
                            Discount_Rate
                        </td>
                        <td>
                            TDR_Cash_Flow
                        </td>
                        <td>
                            Present_Value_of_Repayment
                        </td>
                        <td>
                            Cash_Flow_Currency
                        </td>
                    </tr>
                </thead>
                <tr style="background-color: #FFFBD6; color: #333333;">
                    <td>
                        <asp:LinkButton ID="Insert_LinkButton" runat="server" CausesValidation="True" CommandName="EmptyDataTemplateInsert"
                            Text="Insert"></asp:LinkButton>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        <asp:Label ID="CIF_Label" runat="server" OnPreRender="CIF_Label_PreRender"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Default_Date_Label" runat="server" OnPreRender="Default_Date_Label_PreRender"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Date_of_Restructure_Label" runat="server" OnPreRender="Date_of_Restructure_Label_PreRender"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Date_of_Repayment_TextBox" runat="server" Width="17ex"></asp:TextBox>
                        <asp:CalendarExtender ID="Date_of_Repayment_TextBox_CalendarExtender" 
                            runat="server" Enabled="True" TargetControlID="Date_of_Repayment_TextBox" Format="d MMMM yyyy">
                        </asp:CalendarExtender>
                    </td>
                    <td>
                        <asp:TextBox ID="Discount_Rate_TextBox" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="TDR_Cash_Flow_TextBox" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="Present_Value_of_Repayment_TextBox" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:DropDownList ID="Cash_Flow_Currency_DropDownList" runat="server" 
                            DataSourceID="Currency_DataSource" DataTextField="Description" 
                            DataValueField="Code">
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerSettings Mode="NumericFirstLast" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
    </asp:GridView>
    <asp:SqlDataSource ID="RESTRUCTURE_INFORMATION_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>"
        SelectCommand="P_RESTRUCTURE_INFORMATION_SELECT" SelectCommandType="StoredProcedure"
        InsertCommand="P_RESTRUCTURE_INFORMATION_INSERT" InsertCommandType="StoredProcedure"
        UpdateCommand="P_RESTRUCTURE_INFORMATION_UPDATE" UpdateCommandType="StoredProcedure">
        <InsertParameters>
            <asp:Parameter Name="CIF" Type="String" />
            <asp:Parameter Name="Default_Date" Type="DateTime" />
            <asp:Parameter Name="Date_of_Restructure" Type="DateTime" />
            <asp:Parameter Name="Date_of_Repayment" Type="DateTime" />
            <asp:Parameter Name="Discount_Rate" Type="Double" />
            <asp:Parameter Name="TDR_Cash_Flow" Type="Double" />
            <asp:Parameter Name="Present_Value_of_Repayment" Type="Double" />
            <asp:Parameter Name="Cash_Flow_Currency" Type="String" />
            <asp:Parameter Name="UpdateUser" Type="String" />
            <asp:Parameter Name="UpdateDate" Type="DateTime" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter Name="CIF" Type="String" />
            <asp:Parameter Name="Default_Date" Type="DateTime" />
            <asp:Parameter Name="Date_of_Restructure" Type="DateTime" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="CIF" Type="String" />
            <asp:Parameter Name="Default_Date" Type="DateTime" />
            <asp:Parameter Name="Date_of_Restructure" Type="DateTime" />
            <asp:Parameter Name="Date_of_Repayment" Type="DateTime" />
            <asp:Parameter Name="Discount_Rate" Type="Double" />
            <asp:Parameter Name="TDR_Cash_Flow" Type="Double" />
            <asp:Parameter Name="Present_Value_of_Repayment" Type="Double" />
            <asp:Parameter Name="Cash_Flow_Currency" Type="String" />
            <asp:Parameter Name="UpdateUser" Type="String" />
            <asp:Parameter Name="UpdateDate" Type="DateTime" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="Currency_DataSource" runat="server" EnableCaching="True" ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>"
        SelectCommand="L_CURRENCY_CODE_SELECT" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <%--<asp:HiddenField ID="CIF_HiddenField" runat="server" OnPreRender="CIF_HiddenField_PreRender" />
    <asp:HiddenField ID="Default_Date_HiddenField" runat="server" OnPreRender="Default_Date_HiddenField_PreRender" />
    <asp:HiddenField ID="Date_of_Restructure_HiddenField" runat="server" OnPreRender="Date_of_Restructure_HiddenField_PreRender" />--%>
</asp:Content>
