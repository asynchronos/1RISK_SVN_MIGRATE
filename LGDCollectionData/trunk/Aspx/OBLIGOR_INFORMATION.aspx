<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="OBLIGOR_INFORMATION.aspx.cs" Inherits="LGDCollectionData.Aspx.OBLIGOR_INFORMATION" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="../UserControls/SelectFormWebUserControl.ascx" TagName="SelectFormWebUserControl"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <!-- Ext includes -->
    <link rel="stylesheet" type="text/css" href="../ExtJS/resources/css/ext-all.css" />
    <script type="text/javascript" src="../ExtJS/adapter/ext/ext-base.js"></script>
    <script type="text/javascript" src="../ExtJS/ext-all.js"></script>
    <script type="text/javascript" src="../Scripts/CommonExt.js"></script>

    <script type="text/javascript">
        Ext.onReady(function () {
            Ext.select("input[type=text]").setWidth("200px");
            Ext.select("input[type=text]").set({ "maxlength": "255" });

            var emergenceFromDefaultCheckBox = Ext.DotNetControl.CheckBox.mapElement("domId", "Emergence_from_Default_CheckBox");
            var natureOfEmergenceComboBox = Ext.DotNetControl.ComboBox.mapElement("domId", "Nature_of_Emergence_ComboBox");
            var emergenceDateTextBox = Ext.DotNetControl.Element.mapElement("input", "domId", "Emergence_Date_TextBox");
            
            emergenceFromDefaultCheckBox.element.on({
                "click": function (e, t, o) {
                    if (t.checked) {
                        o.targetElement.NatureOfEmergenceComboBox.disabled(false);
                        o.targetElement.EmergenceDateTextBox.disabled(false);
                    } else {
                        o.targetElement.NatureOfEmergenceComboBox.disabled(true);
                        o.targetElement.EmergenceDateTextBox.disabled(true);
                    }
                },
                scope: this,
                targetElement: { "NatureOfEmergenceComboBox": natureOfEmergenceComboBox, "EmergenceDateTextBox": emergenceDateTextBox }
            });

            //init Emergence_from_Default_CheckBox
            if (emergenceFromDefaultCheckBox.element.dom.checked) {
                natureOfEmergenceComboBox.disabled(false);
                emergenceDateTextBox.disabled(false);
            } else {
                natureOfEmergenceComboBox.disabled(true);
                emergenceDateTextBox.disabled(true);
            }
            //end init Emergence_from_Default_CheckBox


        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" EnableScriptGlobalization="true">
    </asp:ToolkitScriptManager>
    <uc1:SelectFormWebUserControl ID="SelectFormWebUserControl1" runat="server" />
    <h2>
        <asp:Label ID="FormName_Label" runat="server" Text="OBLIGOR INFORMATION"></asp:Label>
    </h2>
    <asp:DetailsView ID="OBLIGOR_INFORMATION_DetailsView" runat="server" AllowPaging="True"
        AutoGenerateRows="False" CellPadding="4" DataKeyNames="CIF,Default_Date" DataSourceID="OBLIGOR_INFORMATION_SqlDataSource" DefaultMode="Edit" EnableModelValidation="True" ForeColor="#333333" OnPageIndexChanging="DetailsView_PageIndexChanging" OnItemUpdating="DetailsView_ItemUpdating">
        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
        <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
        <Fields>
            <asp:TemplateField HeaderText="CIF" SortExpression="CIF" HeaderStyle-Width="30%">
                <EditItemTemplate>
                    <asp:Label ID="CIF_Label" runat="server" Text='<%# Eval("CIF") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="CIF_TextBox" runat="server" Text='<%# Bind("CIF") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="CIF_Label" runat="server" Text='<%# Bind("CIF") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Account Officer" SortExpression="Account_Officer">
                <EditItemTemplate>
                    <asp:TextBox ID="Account_Officer_TextBox" runat="server" Text='<%# Bind("Account_Officer") %>'></asp:TextBox>
                    <span style="color:Red">*</span>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="Account_Officer_TextBox" runat="server" Text='<%# Bind("Account_Officer") %>'></asp:TextBox>
                    <span style="color:Red">*</span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Account_Officer_Label" runat="server" Text='<%# Bind("Account_Officer") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Data Inputter" SortExpression="Data_Inputter">
                <EditItemTemplate>
                    <asp:TextBox ID="Data_Inputter_TextBox" runat="server" Text='<%# Bind("Data_Inputter") %>'></asp:TextBox>
                    <span style="color:Red">*</span>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="Data_Inputter_TextBox" runat="server" Text='<%# Bind("Data_Inputter") %>'></asp:TextBox>
                    <span style="color:Red">*</span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Data_Inputter_Label" runat="server" Text='<%# Bind("Data_Inputter") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Date of Input" SortExpression="Date_of_Input">
                <EditItemTemplate>
                    <asp:TextBox ID="Date_of_Input_TextBox" runat="server" Text='<%# Bind("Date_of_Input", "{0:d MMMM yyyy}") %>'></asp:TextBox>
                    <span style="color:Red">*</span>
                    <asp:CalendarExtender ID="Date_of_Input_TextBox_CalendarExtender" runat="server"
                        Enabled="True" TargetControlID="Date_of_Input_TextBox" Format="d MMMM yyyy" DaysModeTitleFormat="MMMM yyyy" TodaysDateFormat="d MMMM yyyy">
                    </asp:CalendarExtender>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="Date_of_Input_TextBox" runat="server" Text='<%# Bind("Date_of_Input", "{0:d MMMM yyyy}") %>'></asp:TextBox>
                    <span style="color:Red">*</span>
                    <asp:CalendarExtender ID="Date_of_Input_TextBox_CalendarExtender" runat="server"
                        Enabled="True" TargetControlID="Date_of_Input_TextBox" Format="d MMMM yyyy" DaysModeTitleFormat="MMMM yyyy" TodaysDateFormat="d MMMM yyyy">
                    </asp:CalendarExtender>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Date_of_Input_Label" runat="server" Text='<%# Bind("Date_of_Input", "{0:d MMMM yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Portfolio" SortExpression="Portfolio">
                <EditItemTemplate>
                    <asp:DropDownList ID="Portfolio_DropDownList" runat="server" SelectedValue='<%# Bind("Portfolio") %>'
                        DataSourceID="Portfolio_SqlDataSource" AppendDataBoundItems="True" 
                        DataTextField="Portfolio" DataValueField="Portfolio">
                        <asp:ListItem Value="">Please Select</asp:ListItem>
                    </asp:DropDownList>
                    <span style="color:Red">*</span>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="Portfolio_DropDownList" runat="server" SelectedValue='<%# Bind("Portfolio") %>'
                        DataSourceID="Portfolio_SqlDataSource" AppendDataBoundItems="True" 
                        DataTextField="Portfolio" DataValueField="Portfolio" style="text-align:center;">
                        <asp:ListItem Value="">Please Select</asp:ListItem>
                    </asp:DropDownList>
                    <span style="color:Red">*</span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Portfolio_Label" runat="server" Text='<%# Bind("Portfolio") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Business Unit" SortExpression="Business_Unit">
                <EditItemTemplate>
                    <asp:TextBox ID="Business_Unit_TextBox" runat="server" Text='<%# Bind("Business_Unit") %>'></asp:TextBox>
                    <span style="color:Red">*</span>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="Business_Unit_TextBox" runat="server" Text='<%# Bind("Business_Unit") %>'></asp:TextBox>
                    <span style="color:Red">*</span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Business_Unit_Label" runat="server" Text='<%# Bind("Business_Unit") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Default Date" SortExpression="Default_Date">
                <EditItemTemplate>
                    <asp:Label ID="Default_Date_Label" runat="server" Text='<%# Eval("Default_Date", "{0:d MMMM yyyy}") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="Default_Date_TextBox" runat="server" Text='<%# Bind("Default_Date", "{0:d MMMM yyyy}") %>'></asp:TextBox>
                    <span style="color:Red">*</span>
                    <asp:CalendarExtender ID="Default_Date_TextBox_CalendarExtender" runat="server"
                        Enabled="True" TargetControlID="Default_Date_TextBox" Format="d MMMM yyyy" DaysModeTitleFormat="MMMM yyyy" TodaysDateFormat="d MMMM yyyy">
                    </asp:CalendarExtender>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Default_Date_Label" runat="server" Text='<%# Bind("Default_Date", "{0:d MMMM yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Upgrade Date" SortExpression="Upgrade_Date">
                <EditItemTemplate>
                    <asp:TextBox ID="Upgrade_Date_TextBox" runat="server" Text='<%# Bind("Upgrade_Date", "{0:d MMMM yyyy}") %>'></asp:TextBox>
                    <span style="color:Red">*</span>
                    <asp:CalendarExtender ID="Upgrade_Date_TextBox_CalendarExtender" runat="server"
                        Enabled="True" TargetControlID="Upgrade_Date_TextBox" Format="d MMMM yyyy" DaysModeTitleFormat="MMMM yyyy" TodaysDateFormat="d MMMM yyyy">
                    </asp:CalendarExtender>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="Upgrade_Date_TextBox" runat="server" Text='<%# Bind("Upgrade_Date", "{0:d MMMM yyyy}") %>'></asp:TextBox>
                    <span style="color:Red">*</span>
                    <asp:CalendarExtender ID="Upgrade_Date_TextBox_CalendarExtender" runat="server"
                        Enabled="True" TargetControlID="Upgrade_Date_TextBox" Format="d MMMM yyyy" DaysModeTitleFormat="MMMM yyyy" TodaysDateFormat="d MMMM yyyy">
                    </asp:CalendarExtender>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Upgrade_Date_Label" runat="server" Text='<%# Bind("Upgrade_Date", "{0:d MMMM yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="1 Year Before Default Date" SortExpression="One_Year_Before_Default_Date">
                <EditItemTemplate>
                    <asp:Label ID="One_Year_Before_Default_Date_Label" runat="server" Text='<%# Bind("One_Year_Before_Default_Date", "{0:d MMMM yyyy}") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:Label ID="One_Year_Before_Default_Date_Label" runat="server" Text='<%# Bind("One_Year_Before_Default_Date", "{0:d MMMM yyyy}") %>'></asp:Label>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="One_Year_Before_Default_Date_Label" runat="server" Text='<%# Bind("One_Year_Before_Default_Date", "{0:d MMMM yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Industry Code" SortExpression="Industry_Code">
                <EditItemTemplate>
                    <asp:TextBox ID="Industry_Code_TextBox" runat="server" Text='<%# Bind("Industry_Code") %>'></asp:TextBox>
                    <span style="color:Red">*</span>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="Industry_Code_TextBox" runat="server" Text='<%# Bind("Industry_Code") %>'></asp:TextBox>
                    <span style="color:Red">*</span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Industry_Code_Label" runat="server" Text='<%# Bind("Industry_Code") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Bank Group Key" SortExpression="Bank_Group_Key">
                <EditItemTemplate>
                    <asp:TextBox ID="Bank_Group_Key_TextBox" runat="server" Text='<%# Bind("Bank_Group_Key") %>'></asp:TextBox>
                    <span style="color:Red">*</span>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="Bank_Group_Key_TextBox" runat="server" Text='<%# Bind("Bank_Group_Key") %>'></asp:TextBox>
                    <span style="color:Red">*</span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Bank_Group_Key_Label" runat="server" Text='<%# Bind("Bank_Group_Key") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Last Review Date"
                SortExpression="Last_Review_Date">
                <EditItemTemplate>
                    <asp:TextBox ID="Last_Review_Date_TextBox" runat="server" Text='<%# Bind("Last_Review_Date", "{0:d MMMM yyyy}") %>'></asp:TextBox>
                    <span style="color:Red">*</span>
                    (Please enter &quot;1 January 9999&quot; if not applicable)
                    <asp:CalendarExtender ID="Last_Review_Date_TextBox_CalendarExtender" runat="server"
                        Enabled="True" TargetControlID="Last_Review_Date_TextBox" Format="d MMMM yyyy" DaysModeTitleFormat="MMMM yyyy" TodaysDateFormat="d MMMM yyyy">
                    </asp:CalendarExtender>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="Last_Review_Date_TextBox" runat="server" Text='<%# Bind("Last_Review_Date", "{0:d MMMM yyyy}") %>'></asp:TextBox>
                    <span style="color:Red">*</span>
                    (Please enter &quot;1 January 9999&quot; if not applicable)
                    <asp:CalendarExtender ID="Last_Review_Date_TextBox_CalendarExtender" runat="server"
                        Enabled="True" TargetControlID="Last_Review_Date_TextBox" Format="d MMMM yyyy" DaysModeTitleFormat="MMMM yyyy" TodaysDateFormat="d MMMM yyyy">
                    </asp:CalendarExtender>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Last_Review_Date_Label" runat="server" Text='<%# Bind("Last_Review_Date", "{0:d MMMM yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Previous Default Flag" SortExpression="Previous_Default_Flag">
                <EditItemTemplate>
                    <asp:CheckBox ID="Previous_Default_Flag_CheckBox" runat="server" Checked='<%# Bind("Previous_Default_Flag") %>' Enabled="false" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:CheckBox ID="Previous_Default_Flag_CheckBox" runat="server" Checked='<%# Bind("Previous_Default_Flag") %>' />
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="Previous_Default_Flag_CheckBox" runat="server" Checked='<%# Bind("Previous_Default_Flag") %>'
                        Enabled="false" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Previous Default Date" SortExpression="Previous_Default_Date">
                <EditItemTemplate>
                    <asp:Label ID="Previous_Default_Date_Label" runat="server" Text='<%# Bind("Previous_Default_Date", "{0:d MMMM yyyy}") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="Previous_Default_Date_TextBox" runat="server" Text='<%# Bind("Previous_Default_Date", "{0:d MMMM yyyy}") %>'></asp:TextBox>
                    <span style="color:Red">*</span>
                    <asp:CalendarExtender ID="Previous_Default_Date_TextBox_CalendarExtender" runat="server"
                        Enabled="True" TargetControlID="Previous_Default_Date_TextBox" Format="d MMMM yyyy" DaysModeTitleFormat="MMMM yyyy" TodaysDateFormat="d MMMM yyyy">
                    </asp:CalendarExtender>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Previous_Default_Date_Label" runat="server" Text='<%# Bind("Previous_Default_Date", "{0:d MMMM yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Default Type" SortExpression="Default_Type">
                <EditItemTemplate>
                    <asp:DropDownList ID="Default_Type_DropDownList" runat="server" 
                        SelectedValue='<%# Bind("Default_Type") %>' 
                        DataSourceID="Default_Type_SqlDataSource" AppendDataBoundItems="True" 
                        DataTextField="Default_Type" DataValueField="Default_Type">
                        <asp:ListItem Value="">Please Select</asp:ListItem>
                    </asp:DropDownList>
                    <span style="color:Red">*</span>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="Default_Type_DropDownList" runat="server" 
                        SelectedValue='<%# Bind("Default_Type") %>' 
                        DataSourceID="Default_Type_SqlDataSource" AppendDataBoundItems="True" 
                        DataTextField="Portfolio" DataValueField="Portfolio" 
                        style="text-align:center;">
                        <asp:ListItem Value="">Please Select</asp:ListItem>
                    </asp:DropDownList>
                    <span style="color:Red">*</span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Default_Type_Label" runat="server" Text='<%# Bind("Default_Type") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Business Reason for Default" SortExpression="Business_Reason_for_Default">
                <EditItemTemplate>
                    <asp:ComboBox ID="Business_Reason_for_ComboBox" runat="server" AppendDataBoundItems="True" MaxLength="0" SelectedValue='<%# Bind("Business_Reason_for_Default") %>' Style="display: inline;" DataSourceID="Business_Reason_for_Default_SqlDataSource" DataTextField="Business_Reason_for_Default" DataValueField="Business_Reason_for_Default">
                        <asp:ListItem Value="">Please Select</asp:ListItem>
                        <asp:ListItem>Cease of business</asp:ListItem>
                        <asp:ListItem>Ligitation</asp:ListItem>
                        <asp:ListItem>Changing economic conditions</asp:ListItem>
                        <asp:ListItem>Changing government regulation</asp:ListItem>
                        <asp:ListItem>Over-expanding in business</asp:ListItem>
                        <asp:ListItem>Default/late payments of buyers</asp:ListItem>
                        <asp:ListItem>Decease or illness of key person</asp:ListItem>
                        <asp:ListItem>Cross default due to related company</asp:ListItem>
                        <%--<asp:ListItem>Others: (please add)</asp:ListItem>--%>
                    </asp:ComboBox>
                    <span style="color:Red">*</span>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:ComboBox ID="Business_Reason_for_ComboBox" runat="server" AppendDataBoundItems="True" MaxLength="0" SelectedValue='<%# Bind("Business_Reason_for_Default") %>' Style="display: inline;" DataSourceID="Business_Reason_for_Default_SqlDataSource" DataTextField="Business_Reason_for_Default" DataValueField="Business_Reason_for_Default" >
                        <asp:ListItem Value="">Please Select</asp:ListItem>
                        <asp:ListItem>Cease of business</asp:ListItem>
                        <asp:ListItem>Ligitation</asp:ListItem>
                        <asp:ListItem>Changing economic conditions</asp:ListItem>
                        <asp:ListItem>Changing government regulation</asp:ListItem>
                        <asp:ListItem>Over-expanding in business</asp:ListItem>
                        <asp:ListItem>Default/late payments of buyers</asp:ListItem>
                        <asp:ListItem>Decease or illness of key person</asp:ListItem>
                        <asp:ListItem>Cross default due to related company</asp:ListItem>
                        <%--<asp:ListItem>Others: (please add)</asp:ListItem>--%>
                    </asp:ComboBox>
                    <span style="color:Red">*</span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Business_Reason_for_Default_Label" runat="server" Text='<%# Bind("Business_Reason_for_Default") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Banking Relationship Start Date" SortExpression="Banking_Relationship_Start_Date">
                <EditItemTemplate>
                    <asp:TextBox ID="Banking_Relationship_Start_Date_TextBox" runat="server" Text='<%# Bind("Banking_Relationship_Start_Date", "{0:d MMMM yyyy}") %>'></asp:TextBox>
                    <span style="color:Red">*</span>
                    <asp:CalendarExtender ID="Banking_Relationship_Start_Date_TextBox_CalendarExtender" runat="server"
                        Enabled="True" TargetControlID="Banking_Relationship_Start_Date_TextBox" Format="d MMMM yyyy" DaysModeTitleFormat="MMMM yyyy" TodaysDateFormat="d MMMM yyyy">
                    </asp:CalendarExtender>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="Banking_Relationship_Start_Date_TextBox" runat="server" Text='<%# Bind("Banking_Relationship_Start_Date", "{0:d MMMM yyyy}") %>'></asp:TextBox>
                    <span style="color:Red">*</span>
                    <asp:CalendarExtender ID="Banking_Relationship_Start_Date_TextBox_CalendarExtender" runat="server"
                        Enabled="True" TargetControlID="Banking_Relationship_Start_Date_TextBox" Format="d MMMM yyyy" DaysModeTitleFormat="MMMM yyyy" TodaysDateFormat="d MMMM yyyy">
                    </asp:CalendarExtender>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Banking_Relationship_Start_Date_Label" runat="server" Text='<%# Bind("Banking_Relationship_Start_Date", "{0:d MMMM yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Title Name" SortExpression="Legal_Enity_Type">
                <EditItemTemplate>
                    <asp:TextBox ID="Legal_Enity_Type_TextBox" runat="server" Text='<%# Bind("Legal_Enity_Type") %>'></asp:TextBox>
                    <span style="color:Red">*</span>
                    (Example &quot;บจก.&quot;,&quot;หจก.&quot; )
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="Legal_Enity_Type_TextBox" runat="server" Text='<%# Bind("Legal_Enity_Type") %>'></asp:TextBox>
                    <span style="color:Red">*</span>
                    (Example &quot;บจก.&quot;,&quot;หจก.&quot; )
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Legal_Enity_Type_Label" runat="server" Text='<%# Bind("Legal_Enity_Type") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Province of Incorporation" SortExpression="Province_of_Incorporation">
                <EditItemTemplate>
                    <asp:DropDownList ID="Province_of_Incorporation_DropDownList" runat="server" AppendDataBoundItems="True"
                        DataSourceID="L_PROVINCE_SqlDataSource" DataTextField="Prov_Thai" DataValueField="Code"
                        SelectedValue='<%# Bind("Province_of_Incorporation") %>'>
                        <asp:ListItem Value="">Please Select</asp:ListItem>
                    </asp:DropDownList>
                    <span style="color:Red">*</span>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="Province_of_Incorporation_DropDownList" runat="server" AppendDataBoundItems="True"
                        DataSourceID="L_PROVINCE_SqlDataSource" DataTextField="Prov_Thai" DataValueField="Code"
                        SelectedValue='<%# Bind("Province_of_Incorporation") %>' style="text-align:center;">
                        <asp:ListItem Value="">Please Select</asp:ListItem>
                    </asp:DropDownList>
                    <span style="color:Red">*</span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="Province_of_Incorporation_DropDownList" runat="server" AppendDataBoundItems="True" DataSourceID="L_PROVINCE_SqlDataSource" DataTextField="Prov_Thai" DataValueField="Code" SelectedValue='<%# Bind("Province_of_Incorporation") %>' Enabled="false">
                        <asp:ListItem Value="">Please Select</asp:ListItem>
                    </asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Date of Incorporation" SortExpression="Date_of_Incorporation">
                <EditItemTemplate>
                    <asp:TextBox ID="Date_of_Incorporation_TextBox" runat="server" Text='<%# Bind("Date_of_Incorporation", "{0:d MMMM yyyy}") %>'></asp:TextBox>
                    <span style="color:Red">*</span>
                    <asp:CalendarExtender ID="Date_of_Incorporation_TextBox_CalendarExtender" runat="server"
                        Enabled="True" TargetControlID="Date_of_Incorporation_TextBox" Format="d MMMM yyyy" DaysModeTitleFormat="MMMM yyyy" TodaysDateFormat="d MMMM yyyy">
                    </asp:CalendarExtender>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="Date_of_Incorporation_TextBox" runat="server" Text='<%# Bind("Date_of_Incorporation", "{0:d MMMM yyyy}") %>'></asp:TextBox>
                    <span style="color:Red">*</span>
                    <asp:CalendarExtender ID="Date_of_Incorporation_TextBox_CalendarExtender" runat="server"
                        Enabled="True" TargetControlID="Date_of_Incorporation_TextBox" Format="d MMMM yyyy" DaysModeTitleFormat="MMMM yyyy" TodaysDateFormat="d MMMM yyyy">
                    </asp:CalendarExtender>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Date_of_Incorporation_Label" runat="server" Text='<%# Bind("Date_of_Incorporation", "{0:d MMMM yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Listed Status" SortExpression="Listed_Status">
                <EditItemTemplate>
                    <asp:CheckBox ID="Listed_Status_CheckBox" runat="server" Checked='<%# Bind("Listed_Status") %>' />
                    <span style="color:Red">*</span>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:CheckBox ID="Listed_Status_CheckBox" runat="server" Checked='<%# Bind("Listed_Status") %>' />
                    <span style="color:Red">*</span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="Listed_Status_CheckBox" runat="server" Checked='<%# Bind("Listed_Status") %>'
                        Enabled="false" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Internal Rating @ D-1" SortExpression="Internal_Rating_At_D_MINUS_1">
                <EditItemTemplate>
                    <asp:TextBox ID="Internal_Rating_At_D_MINUS_1_TextBox" runat="server" Text='<%# Bind("Internal_Rating_At_D_MINUS_1") %>'></asp:TextBox>
                    <span style="color:Red">*</span>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="Internal_Rating_At_D_MINUS_1_TextBox" runat="server" Text='<%# Bind("Internal_Rating_At_D_MINUS_1") %>'></asp:TextBox>
                    <span style="color:Red">*</span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Internal_Rating_At_D_MINUS_1_Label" runat="server" Text='<%# Bind("Internal_Rating_At_D_MINUS_1") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Rating Date"
                SortExpression="Rating_Date">
                <EditItemTemplate>
                    <asp:TextBox ID="Rating_Date_TextBox" runat="server" Text='<%# Bind("Rating_Date", "{0:d MMMM yyyy}") %>'></asp:TextBox>
                    <span style="color:Red">*</span>
                    (Please enter &quot;1 January 9999&quot; if not applicable)
                    <asp:CalendarExtender ID="Rating_Date_TextBox_CalendarExtender" runat="server" Enabled="True" TargetControlID="Rating_Date_TextBox" Format="d MMMM yyyy" DaysModeTitleFormat="MMMM yyyy" TodaysDateFormat="d MMMM yyyy">
                    </asp:CalendarExtender>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="Rating_Date_TextBox" runat="server" Text='<%# Bind("Rating_Date", "{0:d MMMM yyyy}") %>'></asp:TextBox>
                    <span style="color:Red">*</span>
                    (Please enter &quot;1 January 9999&quot; if not applicable)
                    <asp:CalendarExtender ID="Rating_Date_TextBox_CalendarExtender" runat="server" Enabled="True" TargetControlID="Rating_Date_TextBox" Format="d MMMM yyyy" DaysModeTitleFormat="MMMM yyyy" TodaysDateFormat="d MMMM yyyy">
                    </asp:CalendarExtender>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Rating_Date_Label" runat="server" Text='<%# Bind("Rating_Date", "{0:d MMMM yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Emergence from Default" SortExpression="Emergence_from_Default">
                <EditItemTemplate>
                    <asp:CheckBox ID="Emergence_from_Default_CheckBox" runat="server" Checked='<%# Bind("Emergence_from_Default") %>' domId="Emergence_from_Default_CheckBox" />
                    <span style="color:Red">*</span>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:CheckBox ID="Emergence_from_Default_CheckBox" runat="server" Checked='<%# Bind("Emergence_from_Default") %>' domId="Emergence_from_Default_CheckBox" />
                    <span style="color:Red">*</span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="Emergence_from_Default_CheckBox" runat="server" Checked='<%# Bind("Emergence_from_Default") %>' domId="Emergence_from_Default_CheckBox" Enabled="false" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nature of Emergence" SortExpression="Nature_of_Emergence">
                <EditItemTemplate>
                    <asp:ComboBox ID="Nature_of_Emergence_ComboBox" runat="server" AppendDataBoundItems="True" MaxLength="0" SelectedValue='<%# Bind("Nature_of_Emergence") %>' Style="display: inline;" DataSourceID="Nature_of_Emergence_SqlDataSource" DataTextField="Nature of Emergence" DataValueField="Nature of Emergence" domId="Nature_of_Emergence_ComboBox">
                        <asp:ListItem Value="">Please Select</asp:ListItem>
                        <asp:ListItem>Arrears (Past Due) Repaid</asp:ListItem>
                        <asp:ListItem>Full Redemption - File Closed</asp:ListItem>
                        <asp:ListItem>Restructuring: Partial repayment / haircut the remaining balance and close the account (within 1 year)</asp:ListItem>
                        <asp:ListItem>Restructuring: Installment payment - Continuing Obligation</asp:ListItem>
                        <asp:ListItem>Sell loan to AAMC and written off</asp:ListItem>
                        <asp:ListItem>Sell loan to the 3rd party and written off</asp:ListItem>
                        <asp:ListItem>Written off(No more recovery expected)</asp:ListItem>
                    </asp:ComboBox>
                    <span style="color:Red">*</span>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:ComboBox ID="Nature_of_Emergence_ComboBox" runat="server" AppendDataBoundItems="True" MaxLength="0" SelectedValue='<%# Bind("Nature_of_Emergence") %>' Style="display: inline;" DataSourceID="Nature_of_Emergence_SqlDataSource" DataTextField="Nature of Emergence" DataValueField="Nature of Emergence" domId="Nature_of_Emergence_ComboBox">
                        <asp:ListItem Value="">Please Select</asp:ListItem>
                        <asp:ListItem>Arrears (Past Due) Repaid</asp:ListItem>
                        <asp:ListItem>Full Redemption - File Closed</asp:ListItem>
                        <asp:ListItem>Restructuring: Partial repayment / haircut the remaining balance and close the account (within 1 year)</asp:ListItem>
                        <asp:ListItem>Restructuring: Installment payment - Continuing Obligation&quot;;&quot;Written off (No more recovery expected)</asp:ListItem>
                        <asp:ListItem>Sell loan to AAMC</asp:ListItem>
                        <asp:ListItem>Sell loan to the 3rd party</asp:ListItem>
                        <%--<asp:ListItem>Others: (please add)</asp:ListItem>--%>
                    </asp:ComboBox>
                    <span style="color:Red">*</span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Nature_of_Emergence_Label" runat="server" Text='<%# Bind("Nature_of_Emergence") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Emergence Date" SortExpression="Emergence_Date">
                <EditItemTemplate>
                    <asp:TextBox ID="Emergence_Date_TextBox" runat="server" Text='<%# Bind("Emergence_Date","{0:d MMMM yyyy}") %>' domId="Emergence_Date_TextBox"></asp:TextBox>
                    <span style="color:Red">*</span>
                    <asp:CalendarExtender ID="Emergence_Date_TextBox_CalendarExtender" runat="server" Enabled="True" TargetControlID="Emergence_Date_TextBox" Format="d MMMM yyyy" DaysModeTitleFormat="MMMM yyyy" TodaysDateFormat="d MMMM yyyy">
                    </asp:CalendarExtender>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="Emergence_Date_TextBox" runat="server" Text='<%# Bind("Emergence_Date","{0:d MMMM yyyy}") %>' domId="Emergence_Date_TextBox"></asp:TextBox>
                    <span style="color:Red">*</span>
                    <asp:CalendarExtender ID="Emergence_Date_TextBox_CalendarExtender" runat="server" Enabled="True" TargetControlID="Emergence_Date_TextBox" Format="d MMMM yyyy" DaysModeTitleFormat="MMMM yyyy" TodaysDateFormat="d MMMM yyyy">
                    </asp:CalendarExtender>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Emergence_Date_Label" runat="server" Text='<%# Bind("Emergence_Date","{0:d MMMM yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Negative Pledge" SortExpression="Negative_Pledge">
                <EditItemTemplate>
                    <asp:CheckBox ID="Negative_Pledge_CheckBox" runat="server" Checked='<%# Bind("Negative_Pledge") %>' />
                    <span style="color:Red">*</span>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:CheckBox ID="Negative_Pledge_CheckBox" runat="server" Checked='<%# Bind("Negative_Pledge") %>' />
                    <span style="color:Red">*</span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="Negative_Pledge_CheckBox" runat="server" Checked='<%# Bind("Negative_Pledge") %>'
                        Enabled="false" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Update User" SortExpression="UpdateUser">
                <EditItemTemplate>
                    <asp:Label ID="UpdateUser_Label" runat="server" Text='<%# Bind("UpdateUser") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:Label ID="UpdateUser_Label" runat="server" Text='<%# Bind("UpdateUser") %>'></asp:Label>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="UpdateUser_Label" runat="server" Text='<%# Bind("UpdateUser") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Update Date" SortExpression="UpdateDate">
                <EditItemTemplate>
                    <asp:Label ID="UpdateDate_Label" runat="server" Text='<%# Bind("UpdateDate","{0:d MMMM yyyy}") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:Label ID="UpdateDate_Label" runat="server" Text='<%# Bind("UpdateDate","{0:d MMMM yyyy}") %>'></asp:Label>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="UpdateDate_Label" runat="server" Text='<%# Bind("UpdateDate","{0:d MMMM yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="True" />
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
            <asp:Parameter Name="Upgrade_Date" Type="DateTime" />
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
            <asp:Parameter Name="UpdateUser" Type="String" />
            <asp:Parameter Name="UpdateDate" Type="DateTime" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="L_PROVINCE_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>"
        SelectCommand="L_PROVINCE_SELECT" SelectCommandType="StoredProcedure" EnableCaching="True">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="Business_Reason_for_Default_SqlDataSource" runat="server"
        ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>" SelectCommand="P_Business_Reason_for_Default_DISTINCT"
        SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource ID="Nature_of_Emergence_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>"
        SelectCommand="P_Nature_of_Emergence_DISTINCT" 
        SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource ID="Portfolio_SqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>" 
        SelectCommand="P_OBLIGOR_INFORMATION_PORTFOLIO_SELECT" 
        SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource ID="Default_Type_SqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>" 
        SelectCommand="P_OBLIGOR_INFORMATION_DEFAULT_TYPE_SELECT" 
        SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>
