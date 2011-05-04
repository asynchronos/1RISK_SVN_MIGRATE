<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="OBLIGOR_INFORMATION.aspx.cs" Inherits="LGDCollectionData.Aspx.OBLIGOR_INFORMATION"
    Culture="en-US" UICulture="en-US" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <asp:DetailsView ID="OBLIGOR_INFORMATION_DetailsView" runat="server" AllowPaging="True"
        AutoGenerateRows="False" CellPadding="4" DataKeyNames="CIF,Default_Date" DataSourceID="OBLIGOR_INFORMATION_SqlDataSource"
        DefaultMode="Edit" EnableModelValidation="True" ForeColor="#333333" OnPreRender="OBLIGOR_INFORMATION_DetailsView_PreRender"
        OnPageIndexChanging="DetailsView_PageIndexChanging" OnItemUpdating="DetailsView_ItemUpdating">
        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
        <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="CIF" HeaderText="CIF" ReadOnly="True" SortExpression="CIF" />
            <asp:BoundField DataField="Account_Officer" HeaderText="Account_Officer" SortExpression="Account_Officer" />
            <asp:TemplateField HeaderText="Data_Inputter" SortExpression="Data_Inputter">
                <EditItemTemplate>
                    <asp:TextBox ID="Data_Inputter_TextBox" runat="server" Text='<%# Bind("Data_Inputter") %>'
                        onfocus="this.blur();" BackColor="#CCCCCC"></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="Data_Inputter_TextBox" runat="server" Text='<%# Bind("Data_Inputter") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Data_Inputter_Label" runat="server" Text='<%# Bind("Data_Inputter") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Date_of_Input" SortExpression="Date_of_Input">
                <EditItemTemplate>
                    <asp:TextBox ID="Date_of_Input_TextBox" runat="server" Text='<%# Bind("Date_of_Input", "{0:dd/MM/yyyy}") %>'
                        onfocus="this.blur();" BackColor="#CCCCCC"></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="Date_of_Input_TextBox" runat="server" Text='<%# Bind("Date_of_Input", "{0:dd/MM/yyyy}") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Date_of_Input_Label" runat="server" Text='<%# Bind("Date_of_Input", "{0:dd/MM/yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Portfolio" SortExpression="Portfolio">
                <EditItemTemplate>
                    <asp:DropDownList ID="Portfolio_DropDownList" runat="server" SelectedValue='<%# Bind("Portfolio") %>'>
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>CORPORATE</asp:ListItem>
                        <asp:ListItem>SME_M</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="Portfolio_TextBox" runat="server" Text='<%# Bind("Portfolio") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Portfolio_Label" runat="server" Text='<%# Bind("Portfolio") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Business_Unit" HeaderText="Business_Unit" SortExpression="Business_Unit" />
            <asp:BoundField DataField="Default_Date" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Default_Date"
                ReadOnly="True" SortExpression="Default_Date" />
            <asp:BoundField DataField="One_Year_Before_Default_Date" DataFormatString="{0:dd/MM/yyyy}"
                HeaderText="One_Year_Before_Default_Date" SortExpression="One_Year_Before_Default_Date" />
            <asp:BoundField DataField="Industry_Code" HeaderText="Industry_Code" SortExpression="Industry_Code" />
            <asp:BoundField DataField="Bank_Group_Key" HeaderText="Bank_Group_Key" SortExpression="Bank_Group_Key" />
            <asp:TemplateField HeaderText="Last_Review_Date (*Please enter &quot;1/1/9999&quot; if not applicable)"
                SortExpression="Last_Review_Date">
                <EditItemTemplate>
                    <asp:TextBox ID="Last_Review_Date_TextBox" runat="server" Text='<%# Bind("Last_Review_Date", "{0:dd/MM/yyyy}") %>'></asp:TextBox>
                    <asp:CalendarExtender ID="Last_Review_Date_TextBox_CalendarExtender" runat="server"
                        Enabled="True" TargetControlID="Last_Review_Date_TextBox">
                    </asp:CalendarExtender>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="Last_Review_Date_TextBox" runat="server" Text='<%# Bind("Last_Review_Date", "{0:dd/MM/yyyy}") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Last_Review_Date_Label" runat="server" Text='<%# Bind("Last_Review_Date", "{0:dd/MM/yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CheckBoxField DataField="Previous_Default_Flag" HeaderText="Previous_Default_Flag"
                SortExpression="Previous_Default_Flag" />
            <asp:TemplateField HeaderText="Previous_Default_Date" SortExpression="Previous_Default_Date">
                <EditItemTemplate>
                    <asp:TextBox ID="Previous_Default_Date_TextBox" runat="server" Text='<%# Bind("Previous_Default_Date", "{0:dd/MM/yyyy}") %>'></asp:TextBox>
                    <asp:CalendarExtender ID="Previous_Default_Date_TextBox_CalendarExtender" runat="server"
                        Enabled="True" TargetControlID="Previous_Default_Date_TextBox">
                    </asp:CalendarExtender>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="Previous_Default_Date_TextBox" runat="server" Text='<%# Bind("Previous_Default_Date") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Previous_Default_Date_Label" runat="server" Text='<%# Bind("Previous_Default_Date") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Default_Type" SortExpression="Default_Type">
                <EditItemTemplate>
                    <asp:DropDownList ID="Default_Type_DropDownList" runat="server" SelectedValue='<%# Bind("Default_Type") %>'>
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>Subjective Default</asp:ListItem>
                        <asp:ListItem>Technical Default</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="Default_Type_TextBox" runat="server" Text='<%# Bind("Default_Type") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Default_Type_Label" runat="server" Text='<%# Bind("Default_Type") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Business_Reason_for_Default" SortExpression="Business_Reason_for_Default">
                <EditItemTemplate>
                    <asp:ComboBox ID="Business_Reason_for_ComboBox" runat="server" AppendDataBoundItems="True"
                        MaxLength="0" SelectedValue='<%# Bind("Business_Reason_for_Default") %>'
                        Style="display: inline;"
                        DataSourceID="Business_Reason_for_Default_SqlDataSource"
                        DataTextField="Business Reason for Default"
                        DataValueField="Business Reason for Default">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>Cease of business</asp:ListItem>
                        <asp:ListItem>Ligitation</asp:ListItem>
                        <asp:ListItem>Changing economic conditions</asp:ListItem>
                        <asp:ListItem>Changing government regulation</asp:ListItem>
                        <asp:ListItem>Over-expanding in business</asp:ListItem>
                        <asp:ListItem>Default/late payments of buyers</asp:ListItem>
                        <asp:ListItem>Decease or illness of key person</asp:ListItem>
                        <asp:ListItem>Cross default due to related company</asp:ListItem>
                        <asp:ListItem>Others: (please add)</asp:ListItem>
                    </asp:ComboBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="Business_Reason_for_Default_TextBox" runat="server" Text='<%# Bind("Business_Reason_for_Default") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Business_Reason_for_Default_Label" runat="server" Text='<%# Bind("Business_Reason_for_Default") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Banking_Relationship_Start_Date" DataFormatString="{0:dd/MM/yyyy}"
                HeaderText="Banking_Relationship_Start_Date" SortExpression="Banking_Relationship_Start_Date" />
            <asp:BoundField DataField="Legal_Enity_Type" HeaderText="Legal_Enity_Type" SortExpression="Legal_Enity_Type" />
            <asp:TemplateField HeaderText="Province_of_Incorporation" SortExpression="Province_of_Incorporation">
                <EditItemTemplate>
                    <asp:DropDownList ID="Province_of_Incorporation_DropDownList" runat="server" AppendDataBoundItems="True"
                        DataSourceID="L_PROVINCE_SqlDataSource" DataTextField="Prov_Thai" DataValueField="Code"
                        SelectedValue='<%# Bind("Province_of_Incorporation") %>'>
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="Province_of_Incorporation_TextBox" runat="server" Text='<%# Bind("Province_of_Incorporation") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Province_of_Incorporation_Label" runat="server" Text='<%# Bind("Province_of_Incorporation") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Date_of_Incorporation" SortExpression="Date_of_Incorporation">
                <EditItemTemplate>
                    <asp:TextBox ID="Date_of_Incorporation_TextBox" runat="server" Text='<%# Bind("Date_of_Incorporation") %>'></asp:TextBox>
                    <asp:CalendarExtender ID="Date_of_Incorporation_TextBox_CalendarExtender" runat="server"
                        Enabled="True" TargetControlID="Date_of_Incorporation_TextBox">
                    </asp:CalendarExtender>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="Date_of_Incorporation_TextBox" runat="server" Text='<%# Bind("Date_of_Incorporation", "{0:dd/MM/yyyy}") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Date_of_Incorporation_Label" runat="server" Text='<%# Bind("Date_of_Incorporation", "{0:dd/MM/yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CheckBoxField DataField="Listed_Status" HeaderText="Listed_Status" SortExpression="Listed_Status" />
            <asp:BoundField DataField="Internal_Rating_At_D_MINUS_1" HeaderText="Internal_Rating_At_D_MINUS_1"
                SortExpression="Internal_Rating_At_D_MINUS_1" />
            <asp:TemplateField HeaderText="Rating_Date (*Please enter &quot;1/1/9999&quot; if not applicable)"
                SortExpression="Rating_Date">
                <EditItemTemplate>
                    <asp:TextBox ID="Rating_Date_TextBox" runat="server" Text='<%# Bind("Rating_Date") %>'></asp:TextBox>
                    <asp:CalendarExtender ID="Rating_Date_TextBox_CalendarExtender" runat="server" Enabled="True"
                        TargetControlID="Rating_Date_TextBox">
                    </asp:CalendarExtender>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="Rating_Date_TextBox" runat="server" Text='<%# Bind("Rating_Date", "{0:dd/MM/yyyy}") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Rating_Date_Label" runat="server" Text='<%# Bind("Rating_Date", "{0:dd/MM/yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CheckBoxField DataField="Emergence_from_Default" HeaderText="Emergence_from_Default"
                SortExpression="Emergence_from_Default" />
            <asp:TemplateField HeaderText="Nature_of_Emergence" SortExpression="Nature_of_Emergence">
                <EditItemTemplate>
                    <asp:ComboBox ID="Emergence_from_Default_ComboBox" runat="server" AppendDataBoundItems="True"
                        MaxLength="0" SelectedValue='<%# Bind("Nature_of_Emergence") %>'
                        Style="display: inline;" DataSourceID="Nature_of_Emergence_SqlDataSource"
                        DataTextField="Nature of Emergence" DataValueField="Nature of Emergence">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>Arrears (Past Due) Repaid</asp:ListItem>
                        <asp:ListItem>Full Redemption - File Closed</asp:ListItem>
                        <asp:ListItem>Restructuring: Partial repayment / haircut the remaining balance and close the account (within 1 year)</asp:ListItem>
                        <asp:ListItem>Restructuring: Installment payment - Continuing Obligation&quot;;&quot;Written off (No more recovery expected)</asp:ListItem>
                        <asp:ListItem>Sell loan to AAMC</asp:ListItem>
                        <asp:ListItem>Sell loan to the 3rd party</asp:ListItem>
                        <asp:ListItem>Others: (please add)</asp:ListItem>
                    </asp:ComboBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="Emergence_from_Default_TextBox" runat="server" Text='<%# Bind("Nature_of_Emergence") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Emergence_from_Default_Label" runat="server" Text='<%# Bind("Nature_of_Emergence") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Emergence_Date" SortExpression="Emergence_Date">
                <EditItemTemplate>
                    <asp:TextBox ID="Emergence_Date_TextBox" runat="server" Text='<%# Bind("Emergence_Date") %>'></asp:TextBox>
                    <asp:CalendarExtender ID="Emergence_Date_TextBox_CalendarExtender" runat="server"
                        Enabled="True" TargetControlID="Emergence_Date_TextBox">
                    </asp:CalendarExtender>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="Emergence_Date_TextBox" runat="server" Text='<%# Bind("Emergence_Date") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Emergence_Date_Label" runat="server" Text='<%# Bind("Emergence_Date") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CheckBoxField DataField="Negative_Pledge" HeaderText="Negative_Pledge" SortExpression="Negative_Pledge" />
        </Fields>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerSettings Mode="NumericFirstLast" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="OBLIGOR_INFORMATION_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>"
        SelectCommand="P_OBLIGOR_INFORMATION_SELECT" SelectCommandType="StoredProcedure"
        UpdateCommand="P_OBLIGOR_INFORMATION_UPDATE" UpdateCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter Name="CIF" QueryStringField="cif" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="CIF" Type="String" />
            <asp:Parameter Name="Account_Officer" Type="String" />
            <asp:Parameter Name="Data_Inputter" Type="String" />
            <asp:Parameter Name="Date_of_Input" Type="DateTime" />
            <asp:Parameter Name="Portfolio" Type="String" />
            <asp:Parameter Name="Business_Unit" Type="String" />
            <asp:Parameter Name="Default_Date" Type="DateTime" />
            <asp:Parameter Name="One_Year_Before_Default_Date" Type="DateTime" />
            <asp:Parameter Name="Industry_Code" Type="String" />
            <asp:Parameter Name="Bank_Group_Key" Type="String" />
            <asp:Parameter Name="Last_Review_Date" Type="DateTime" />
            <asp:Parameter Name="Previous_Default_Flag" Type="Boolean" />
            <asp:Parameter Name="Previous_Default_Date" Type="DateTime" />
            <asp:Parameter Name="Default_Type" Type="String" />
            <asp:Parameter Name="Business_Reason_for_Default" Type="String" />
            <asp:Parameter Name="Banking_Relationship_Start_Date" Type="DateTime" />
            <asp:Parameter Name="Legal_Enity_Type" Type="String" />
            <asp:Parameter Name="Province_of_Incorporation" Type="String" />
            <asp:Parameter Name="Date_of_Incorporation" Type="DateTime" />
            <asp:Parameter Name="Listed_Status" Type="Boolean" />
            <asp:Parameter Name="Internal_Rating_At_D_MINUS_1" Type="String" />
            <asp:Parameter Name="Rating_Date" Type="DateTime" />
            <asp:Parameter Name="Emergence_from_Default" Type="Boolean" />
            <asp:Parameter Name="Nature_of_Emergence" Type="String" />
            <asp:Parameter Name="Emergence_Date" Type="DateTime" />
            <asp:Parameter Name="Negative_Pledge" Type="Boolean" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="L_PROVINCE_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>"
        SelectCommand="L_PROVINCE_SELECT" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource ID="Business_Reason_for_Default_SqlDataSource"
        runat="server" ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>"
        SelectCommand="P_Business_Reason_for_Default_DISTINCT"
        SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="Nature_of_Emergence_SqlDataSource" runat="server"
        ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>"
        SelectCommand="P_Nature_of_Emergence_DISTINCT"
        SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>