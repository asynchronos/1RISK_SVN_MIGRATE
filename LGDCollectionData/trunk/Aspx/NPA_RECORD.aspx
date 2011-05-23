<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="NPA_RECORD.aspx.cs" Inherits="LGDCollectionData.Aspx.NPA_RECORD_NEW" Culture="en-US" UICulture="en-US" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="../UserControls/SelectFormWebUserControl.ascx" TagName="SelectFormWebUserControl"
    TagPrefix="uc1" %>
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
    <uc1:SelectFormWebUserControl ID="SelectFormWebUserControl1" runat="server" />
    <h2>
        <asp:Label ID="FormName_Label" runat="server" Text="NPA RECORD"></asp:Label>
    </h2>
    <asp:SqlDataSource ID="SqlDataSourceNPA_RECORD" runat="server" ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>"
        InsertCommand="NPA_RECORD_INSERT" InsertCommandType="StoredProcedure" SelectCommand="NPA_RECORD_SELECT"
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
        EnableModelValidation="True" Height="50px" Width="389px" DefaultMode="Edit" OnDataBound="DetailsView_Databound"
        CellPadding="4" ForeColor="#333333" GridLines="None" OnPreRender="DetailsView_OnPreRender">
        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
        <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
        <Fields>
            <asp:TemplateField HeaderText="CIF" SortExpression="CIF">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("CIF") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:Label ID="LabelCif_Insert" runat="server" Text='<%# Bind("CIF") %>'></asp:Label>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("CIF") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Default Date" SortExpression="Default_Date">
                <EditItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Default_Date", "{0:d}") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
<asp:TextBox ID="TextBoxDefault_Date_Insert" runat="server" Text='<%# Bind("Default_Date") %>'></asp:TextBox>
                            <span>*</span>
                    <asp:CalendarExtender ID="TextBoxDefault_Date_Insert_CalendarExtender" 
                        runat="server" TargetControlID="TextBoxDefault_Date_Insert" Format="d MMMM yyyy" DaysModeTitleFormat="MMMM yyyy" TodaysDateFormat="d MMMM yyyy">
                    </asp:CalendarExtender>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("Default_Date", "{0:d}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="NPA Collateral ID" SortExpression="NPA_Collateral_ID">
                <EditItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("NPA_Collateral_ID") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("NPA_Collateral_ID") %>'></asp:TextBox>
                    <span style="color: Red">*</span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label11" runat="server" Text='<%# Bind("NPA_Collateral_ID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Collateral Type" SortExpression="Collateral_Type">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Collateral_Type") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("Collateral_Type") %>'></asp:TextBox>
                    <span style="color: Red">*</span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label12" runat="server" Text='<%# Bind("Collateral_Type") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="COS Collateral ID" SortExpression="COS_Collateral_ID">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("COS_Collateral_ID") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("COS_Collateral_ID") %>'></asp:TextBox>
                    <span style="color: Red">*</span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label13" runat="server" Text='<%# Bind("COS_Collateral_ID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Collateral Sale Price Currency" SortExpression="Collateral_Sale_Price_Currency">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownListCurrency" runat="server" DataSourceID="SqlDataSourceCurrentcy"
                        DataTextField="Description" DataValueField="Code" SelectedValue='<%# Bind("Collateral_Sale_Price_Currency")%>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownListCurrency_Insert" runat="server" DataSourceID="SqlDataSourceCurrentcy"
                        DataTextField="Description" DataValueField="Code" SelectedValue='<%# Bind("Collateral_Sale_Price_Currency")%>'>
                    </asp:DropDownList>
                    <span style="color: Red">*</span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Collateral_Sale_Price_Currency") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Collateral Sale Price" SortExpression="Collateral_Sale_Price">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Collateral_Sale_Price","{0:n2}") %>'
                        Style="text-align: right;"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Collateral Sale Price"
                        Text="*" ValidationGroup="UpdateValidation" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Collateral_Sale_Price") %>'></asp:TextBox>
                    <span style="color: Red">*</span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Collateral_Sale_Price") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Collateral Sale Date" SortExpression="Collateral_Sale_Date">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Collateral_Sale_Date","{0:d}") %>'></asp:TextBox>
                    <asp:CalendarExtender ID="TextBox4_CalendarExtender" runat="server" Enabled="True"
                        TargetControlID="TextBox4">
                    </asp:CalendarExtender>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Collateral_Sale_Date") %>'></asp:TextBox>
                                        <asp:CalendarExtender ID="TextBox4_CalendarExtender" runat="server" Enabled="True"
                        TargetControlID="TextBox6">
                    </asp:CalendarExtender>
                    <span style="color: Red">*</span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Collateral_Sale_Date") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Collateral Description" 
                SortExpression="Collateral_Description">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" 
                        Text='<%# Bind("Collateral_Description") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" 
                        Text='<%# Bind("Collateral_Description") %>'></asp:TextBox>
                        <span style="color: Red">*</span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label15" runat="server" 
                        Text='<%# Bind("Collateral_Description") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="District of Property" SortExpression="District_of_Property">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("District_of_Property") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please input District of Property"
                        Text="*" ValidationGroup="UpdateValidation" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("District_of_Property") %>'></asp:TextBox>
                    <span style="color: Red">*</span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("District_of_Property") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Amphur of Property" SortExpression="Amphur_of_Property">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Amphur_of_Property") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please input District of Property"
                        Text="*" ValidationGroup="UpdateValidation" ControlToValidate="TextBox3"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Amphur_of_Property") %>'></asp:TextBox>
                    <span style="color: Red">*</span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Amphur_of_Property") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Province of Property" SortExpression="Province_of_Property">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownListProvince" runat="server" DataSourceID="SqlDataSourcePROVINCE"
                        DataTextField="Prov_Thai" DataValueField="Prov_Thai" SelectedValue='<%# Bind("Province_of_Property") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownListProvince" runat="server" DataSourceID="SqlDataSourcePROVINCE"
                        DataTextField="Prov_Thai" DataValueField="Prov_Thai" SelectedValue='<%# Bind("Province_of_Property") %>'>
                    </asp:DropDownList>
                    <span style="color: Red">*</span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Province_of_Property") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Title Deed Number" SortExpression="Title_Deed_Number">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Title_Deed_Number") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("Title_Deed_Number") %>'></asp:TextBox>
                    <span style="color: Red">*</span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label14" runat="server" Text='<%# Bind("Title_Deed_Number") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="UPDATE USER" SortExpression="UPDATE_USER">
                <EditItemTemplate>
                    <asp:Label ID="LabelUserId" runat="server" Text='<%# Bind("UPDATE_USER") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:Label ID="LabelUserId_Insert" runat="server" Text='<%# Bind("UPDATE_USER") %>'></asp:Label>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("UPDATE_USER") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="UPDATE DATE" SortExpression="UPDATE_DATE">
                <EditItemTemplate>
                    <asp:Label ID="LabelDate" runat="server" Text='<%# Bind("UPDATE_DATE") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:Label ID="LabelDate_Insert" runat="server" Text='<%# Bind("UPDATE_DATE") %>'></asp:Label>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("UPDATE_DATE") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="true" CommandName="Update"
                        Text="Update" ValidationGroup="UpdateValidation"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="true" CommandName="Cancel"
                        Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"
                        Text="Edit"></asp:LinkButton>
                </ItemTemplate>
                <InsertItemTemplate>
                    <asp:LinkButton ID="LinkButtonSave" runat="server" CausesValidation="true" CommandName="Insert"
                        Text="Insert" ValidationGroup="InsertValidation"></asp:LinkButton>
                </InsertItemTemplate>
            </asp:TemplateField>
        </Fields>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
    </asp:DetailsView>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="true"
        ValidationGroup="UpdateValidation" ShowSummary="False" />
    <asp:SqlDataSource ID="SqlDataSourceCurrentcy" runat="server" ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>"
        SelectCommand="L_CURRENCY_CODE_SELECT" EnableCaching="True" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourcePROVINCE" runat="server" ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>"
        SelectCommand="L_PROVINCE_SELECT" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>
