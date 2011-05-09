<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="NPA_RECORD.aspx.cs" Inherits="LGDCollectionData.Aspx.NPA_RECORD_NEW" UICulture="th-TH" Culture="th-TH" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<script type="text/javascript">
    function updateMessage() {
        //alert('aaa');
        var ms = confirm('Are you sure to update this item?');
        if (ms) {
            alert('Update successed');
        }

    }
    function popupAlert(msg) {
        alert(msg);
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" EnableScriptGlobalization="true">
    </asp:ToolkitScriptManager>
    <asp:SqlDataSource ID="SqlDataSourceNPA_RECORD" runat="server" ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>"
        InsertCommand="NPA_EXPENSE_INSERT" InsertCommandType="StoredProcedure" SelectCommand="NPA_RECORD_SELECT"
        SelectCommandType="StoredProcedure" UpdateCommand="NPA_RECORD_UPDATE" UpdateCommandType="StoredProcedure"
         OnUpdated="SqlDataSource1_Updated">
        <InsertParameters>
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
            <asp:Parameter Name="UPDATE_USER" Type="String" />
            <asp:Parameter Name="UPDATE_DATE" Type="DateTime" />
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
            <asp:Parameter Name="UPDATE_USER" Type="String" />
            <asp:Parameter Name="UPDATE_DATE" Type="DateTime" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False"
        DataKeyNames="CIF,Default_Date,NPA_Collateral_ID" DataSourceID="SqlDataSourceNPA_RECORD"
        EnableModelValidation="True" Height="50px" Width="389px" DefaultMode="Edit"
        OnDataBound="DetailsView_Databound">
        <Fields>
            <asp:BoundField DataField="CIF" HeaderText="CIF" ReadOnly="True" SortExpression="CIF" />
            <asp:BoundField DataField="Default_Date" HeaderText="Default_Date" ReadOnly="True" DataFormatString="{0:d}"
                SortExpression="Default_Date" />
            <asp:BoundField DataField="NPA_Collateral_ID" HeaderText="NPA_Collateral_ID" ReadOnly="True"
                SortExpression="NPA_Collateral_ID" />
            <asp:BoundField DataField="Collateral_Type" HeaderText="Collateral_Type" SortExpression="Collateral_Type" />
            <asp:BoundField DataField="COS_Collateral_ID" HeaderText="COS_Collateral_ID" SortExpression="COS_Collateral_ID" />
            <asp:TemplateField HeaderText="Collateral_Sale_Price_Currency" SortExpression="Collateral_Sale_Price_Currency">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownListCurrency" runat="server" DataSourceID="SqlDataSourceCurrentcy"
                        DataTextField="Description" DataValueField="Code" SelectedValue='<%# Bind("Collateral_Sale_Price_Currency")%>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Collateral_Sale_Price_Currency") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Collateral_Sale_Price_Currency") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Collateral_Sale_Price" SortExpression="Collateral_Sale_Price">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Collateral_Sale_Price","{0:n2}") %>'
                        Style="text-align: right;"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Collateral Sale Price" Text="*" ValidationGroup="UpdateValidation"
                        ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Collateral_Sale_Price") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Collateral_Sale_Price") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Collateral_Sale_Date" SortExpression="Collateral_Sale_Date">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Collateral_Sale_Date","{0:d}") %>'></asp:TextBox>
                    <asp:CalendarExtender ID="TextBox4_CalendarExtender" runat="server" Enabled="True"
                        TargetControlID="TextBox4">
                    </asp:CalendarExtender>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Collateral_Sale_Date") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Collateral_Sale_Date") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Collateral_Description" HeaderText="Collateral_Description"
                SortExpression="Collateral_Description" />
            <asp:TemplateField HeaderText="District_of_Property" SortExpression="District_of_Property">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("District_of_Property") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please input District of Property" Text="*" ValidationGroup="UpdateValidation"
                        ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("District_of_Property") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("District_of_Property") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Amphur_of_Property" SortExpression="Amphur_of_Property">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Amphur_of_Property") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please input District of Property" Text="*" ValidationGroup="UpdateValidation"
                        ControlToValidate="TextBox3"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Amphur_of_Property") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Amphur_of_Property") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Province_of_Property" SortExpression="Province_of_Property">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownListProvince" runat="server" DataSourceID="SqlDataSourcePROVINCE"
                        DataTextField="Prov_Thai" DataValueField="Prov_Thai" SelectedValue='<%# Bind("Province_of_Property") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Province_of_Property") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Province_of_Property") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Title_Deed_Number" HeaderText="Title_Deed_Number" SortExpression="Title_Deed_Number" />
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
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="true" CommandName="Update" Text="Update" ValidationGroup="UpdateValidation"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="true" 
                        CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                        CommandName="Edit" Text="Edit"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="true" ValidationGroup="UpdateValidation" ShowSummary="False" />
    <asp:SqlDataSource ID="SqlDataSourceCurrentcy" runat="server" ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>"
        SelectCommand="L_CURRENCY_CODE_SELECT" EnableCaching="True" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourcePROVINCE" runat="server" ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>"
        SelectCommand="L_PROVINCE_SELECT" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>
