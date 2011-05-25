<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="PLEDGE_INFORMATION.aspx.cs" Inherits="LGDCollectionData.Aspx.PLEDGE_INFORMATION"
    Culture="en-US" UICulture="en-US" %>

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

            var Pledge_to_All_Facilities_CheckBox = Ext.DotNetControl.CheckBox.mapElement("domId", "Pledge_to_All_Facilities_CheckBox");
            var Facility_Pledged_TextBox = Ext.DotNetControl.Element.mapElement("input", "domId", "Facility_Pledged_TextBox");
            var Prior_Claim_by_Other_Bank_CheckBox = Ext.DotNetControl.CheckBox.mapElement("domId", "Prior_Claim_by_Other_Bank_CheckBox");
            var Prior_Claim_Amount_TextBox = Ext.DotNetControl.Element.mapElement("input", "domId", "Prior_Claim_Amount_TextBox");

            Pledge_to_All_Facilities_CheckBox.element.on({
                "click": function (e, t, o) {
                    if (t.checked) {
                        o.targetElement.Facility_Pledged_TextBox.element.dom.value = '';
                        o.targetElement.Facility_Pledged_TextBox.disabled(true);
                    } else {
                        o.targetElement.Facility_Pledged_TextBox.disabled(false);
                    }
                },
                scope: this,
                targetElement: { "Facility_Pledged_TextBox": Facility_Pledged_TextBox }
            });

            //init Pledge_to_All_Facilities_CheckBox
            if (Pledge_to_All_Facilities_CheckBox.element.dom.checked) {
                Facility_Pledged_TextBox.disabled(true);
            } else {
                Facility_Pledged_TextBox.disabled(false);
            }
            //end init Pledge_to_All_Facilities_CheckBox


            Prior_Claim_by_Other_Bank_CheckBox.element.on({
                "click": function (e, t, o) {
                    if (t.checked) {
                        o.targetElement.Prior_Claim_Amount_TextBox.disabled(false);
                    } else {
                        o.targetElement.Prior_Claim_Amount_TextBox.disabled(true);
                    }
                },
                scope: this,
                targetElement: { "Prior_Claim_Amount_TextBox": Prior_Claim_Amount_TextBox }
            });

            //init Prior_Claim_by_Other_Bank_CheckBox
            if (Prior_Claim_by_Other_Bank_CheckBox.element.dom.checked) {
                Prior_Claim_Amount_TextBox.disabled(false);
            } else {
                Prior_Claim_Amount_TextBox.disabled(true);
            }
            //end init Prior_Claim_by_Other_Bank_CheckBox
        });
    </script>
    <script type="text/javascript">
        function popupAlert(msg) {
            alert(msg);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" EnableScriptGlobalization="true">
    </asp:ToolkitScriptManager>
    <uc1:SelectFormWebUserControl ID="SelectFormWebUserControl1" runat="server" />
    <table>
        <tr>
            <td valign="top">
                <h2>
                    <asp:Label ID="FormName_Label" runat="server" Text="PLEDGE INFORMATION"></asp:Label>
                </h2>
            </td>
            <td valign="top">
                <h2>
                    &nbsp;</h2>
            </td>
        </tr>
        <tr>
            <td valign="top">
                <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False"
                    DataKeyNames="CIF,Default_Date,APPS_ID,PLED_ID,PLED_SEQ" DataSourceID="SqlDataSourcePLEDGE_INFO"
                    EnableModelValidation="True" Height="50px" Width="377px" OnDataBound="DetailsView_Databound"
                    OnPageIndexChanged="DetailsView_PageIndexChanged" OnPreRender="DetailsView_Prerender"
                    DefaultMode="Edit" CellPadding="4" ForeColor="#333333" GridLines="None">
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
                                <asp:Label ID="Label14" runat="server" Text='<%# Bind("CIF") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Default Date" SortExpression="Default_Date">
                            <EditItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("Default_Date", "{0:d MMMM yyyy}") %>'></asp:Label>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBoxDefault_Date_Insert" runat="server" Text='<%# Bind("Default_Date") %>'></asp:TextBox>
                                <span style="color: Red">*</span>
                                <asp:CalendarExtender ID="TextBoxDefault_Date_Insert_CalendarExtender" runat="server"
                                    TargetControlID="TextBoxDefault_Date_Insert" Format="d MMMM yyyy" DaysModeTitleFormat="MMMM yyyy"
                                    TodaysDateFormat="d MMMM yyyy">
                                </asp:CalendarExtender>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label15" runat="server" Text='<%# Bind("Default_Date", "{0:d MMMM yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="APPS ID" SortExpression="APPS_ID">
                            <EditItemTemplate>
                                <asp:Label ID="LabelAPPS_ID" runat="server" Text='<%# Eval("APPS_ID") %>'></asp:Label>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox16" runat="server" Text='<%# Bind("APPS_ID") %>'></asp:TextBox>
                                <span style="color: Red">*</span>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label16" runat="server" Text='<%# Bind("APPS_ID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="PLED ID" SortExpression="PLED_ID">
                            <EditItemTemplate>
                                <asp:Label ID="LabelPLED_ID" runat="server" Text='<%# Eval("PLED_ID") %>'></asp:Label>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox17" runat="server" Text='<%# Bind("PLED_ID") %>'></asp:TextBox>
                                <span style="color: Red">*</span>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label17" runat="server" Text='<%# Bind("PLED_ID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="PLED SEQ" SortExpression="PLED_SEQ">
                            <EditItemTemplate>
                                <asp:Label ID="LabelPLED_SEQ" runat="server" Text='<%# Eval("PLED_SEQ") %>'></asp:Label>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox18" runat="server" Text='<%# Bind("PLED_SEQ") %>'></asp:TextBox>
                                <span style="color: Red">*</span>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label18" runat="server" Text='<%# Bind("PLED_SEQ") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Pledge to All Facilities" SortExpression="Pledge_to_All_Facilities">
                            <EditItemTemplate>
                                <asp:CheckBox ID="Pledge_to_All_Facilities_CheckBox" runat="server" Checked='<%# Bind("Pledge_to_All_Facilities") %>'
                                    domId="Pledge_to_All_Facilities_CheckBox" />
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Pledge_to_All_Facilities") %>' />
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Pledge_to_All_Facilities") %>'
                                    Enabled="false" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Facility Pledged" SortExpression="Facility_Pledged">
                            <EditItemTemplate>
                                <asp:TextBox ID="Facility_Pledged_TextBox" runat="server" Text='<%# Bind("Facility_Pledged") %>'
                                    domId="Facility_Pledged_TextBox"></asp:TextBox>
                                <span style="color: Red">*</span>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("Facility_Pledged") %>'></asp:TextBox>
                                <span style="color: Red">*</span>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label13" runat="server" Text='<%# Bind("Facility_Pledged") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Collateral Currency Code" SortExpression="Collateral_Currency_Code">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownListCurrency" runat="server" DataSourceID="SqlDataSourceCurrentcy"
                                    DataTextField="Description" DataValueField="Code" SelectedValue='<%# Bind("Collateral_Currency_Code")%>'>
                                </asp:DropDownList>
                                <span style="color: Red">*</span>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Collateral_Currency_Code") %>'></asp:TextBox>
                                <span style="color: Red">*</span>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Collateral_Currency_Code") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Valuation Amount @ D" SortExpression="Valuation_Amount_D">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Valuation_Amount_D","{0:n2}") %>'
                                    Width="150px" Style="text-align: right"></asp:TextBox>
                                <span style="color: Red">*</span>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("Valuation_Amount_D") %>'></asp:TextBox>
                                <span style="color: Red">*</span>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label10" runat="server" Text='<%# Bind("Valuation_Amount_D") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Valuation Date @ D" SortExpression="Valuation_Date_D">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Valuation_Date_D","{0:d MMMM yyyy}") %>'></asp:TextBox>
                                <span style="color: Red">*</span>
                                <asp:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" TargetControlID="TextBox1"
                                    Format="d MMMM yyyy" DaysModeTitleFormat="MMMM yyyy" TodaysDateFormat="d MMMM yyyy">
                                </asp:CalendarExtender>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Valuation_Date_D") %>'></asp:TextBox>
                                <span style="color: Red">*</span>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Valuation_Date_D","{0:d MMMM yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Valuation Amount @ D-1" SortExpression="Valuation_Amount_D1">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("Valuation_Amount_D1","{0:n2}") %>'
                                    Width="150px" Style="text-align: right"></asp:TextBox>
                                <span style="color: Red">*</span>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("Valuation_Amount_D1") %>'></asp:TextBox>
                                <span style="color: Red">*</span>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label11" runat="server" Text='<%# Bind("Valuation_Amount_D1") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Valuation Date @ D-1" SortExpression="Valuation_Date_D1">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Valuation_Date_D1","{0:d MMMM yyyy}") %>'></asp:TextBox>
                                <span style="color: Red">*</span>
                                <asp:CalendarExtender ID="TextBox2_CalendarExtender" runat="server" TargetControlID="TextBox2"
                                    Format="d MMMM yyyy" DaysModeTitleFormat="MMMM yyyy" TodaysDateFormat="d MMMM yyyy">
                                </asp:CalendarExtender>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Valuation_Date_D1","{0:d MMMM yyyy}") %>'></asp:TextBox>
                                <span style="color: Red">*</span>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Valuation_Date_D1","{0:d MMMM yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Prior Claim by Other Bank" SortExpression="Prior_Claim_by_Other_Bank">
                            <EditItemTemplate>
                                <asp:CheckBox ID="Prior_Claim_by_Other_Bank_CheckBox" runat="server" Checked='<%# Bind("Prior_Claim_by_Other_Bank") %>'
                                    domId="Prior_Claim_by_Other_Bank_CheckBox" />
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("Prior_Claim_by_Other_Bank") %>' />
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("Prior_Claim_by_Other_Bank") %>'
                                    Enabled="false" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Prior Claim Amount" SortExpression="Prior_Claim_Amount">
                            <EditItemTemplate>
                                <asp:TextBox ID="Prior_Claim_Amount_TextBox" runat="server" Text='<%# Bind("Prior_Claim_Amount","{0:n2}") %>'
                                    Width="150px" Style="text-align: right" domId="Prior_Claim_Amount_TextBox"></asp:TextBox>
                                <span style="color: Red">*</span>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("Prior_Claim_Amount") %>'></asp:TextBox>
                                <span style="color: Red">*</span>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label12" runat="server" Text='<%# Bind("Prior_Claim_Amount") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Pledge Amount @ D" SortExpression="Pledge_Amount_D">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Pledge_Amount_D","{0:n2}") %>'
                                    Width="150px" Style="text-align: right"></asp:TextBox>
                                <span style="color: Red">*</span>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Pledge_Amount_D") %>'></asp:TextBox>
                                <span style="color: Red">*</span>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Pledge_Amount_D") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Limitation Amount @ D" SortExpression="Limitation_Amount_D">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Limitation_Amount_D","{0:n2}") %>'
                                    Width="150px" Style="text-align: right"></asp:TextBox>
                                <span style="color: Red">*</span>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Limitation_Amount_D") %>'></asp:TextBox>
                                <span style="color: Red">*</span>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Limitation_Amount_D") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Pledge Amount @ D-1" SortExpression="Pledge_Amount_D1">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Pledge_Amount_D1","{0:n2}") %>'
                                    Width="150px" Style="text-align: right"></asp:TextBox>
                                <span style="color: Red">*</span>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Pledge_Amount_D1") %>'></asp:TextBox>
                                <span style="color: Red">*</span>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("Pledge_Amount_D1") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Limitation Amount @ D-1" SortExpression="Limitation_Amount_D1">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Limitation_Amount_D1","{0:n2}") %>'
                                    Width="150px" Style="text-align: right"></asp:TextBox>
                                <span style="color: Red">*</span>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Limitation_Amount_D1") %>'></asp:TextBox>
                                <span style="color: Red">*</span>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("Limitation_Amount_D1") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="UPDATE USER" SortExpression="UPDATE_USER">
                            <EditItemTemplate>
                                <%--<asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("UPDATE_USER") %>'></asp:TextBox>--%>
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
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update"
                                    Text="Update"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
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
                <asp:Label ID="FormCollateral_Label" runat="server" Text="COLLATERAL INFORMATION"></asp:Label>
                <asp:GridView ID="GridView_COLL_INFO" runat="server" AutoGenerateColumns="False"
                    DataSourceID="SqlDataSourceCOLL_INFO" EnableModelValidation="True" CellPadding="4"
                    ForeColor="#333333" OnRowUpdating="GridView_RowUpdating" ShowFooter="True" OnRowCommand="GridView_COLL_INFO_RowCommand"
                    AllowPaging="True">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButtonUpdate" runat="server" CausesValidation="True" CommandName="Update"
                                    Text="Update"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButtonCancel" runat="server" CausesValidation="False"
                                    CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButtonEdit" runat="server" CausesValidation="False" CommandName="Edit"
                                    Text="Edit"></asp:LinkButton>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:LinkButton ID="LinkButtonFooterInsert" runat="server" CausesValidation="False"
                                    CommandName="FooterInsert" Text="Insert"></asp:LinkButton>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="COLL_ID" SortExpression="COLL_ID">
                            <ItemStyle Width="100px" />
                            <EditItemTemplate>
                                <asp:Label ID="LabelCOLL_ID" runat="server" Text='<%# Bind("COLL_ID") %>' Width="100px"></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label19" runat="server" Text='<%# Bind("COLL_ID") %>' Width="100px"></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="LabelCOLL_ID_Footer" runat="server" Width="100px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="LabelCOLL_ID_Insert_RequiredFieldValidator" runat="server"
                                    ErrorMessage="*" Text="*" ControlToValidate="LabelCOLL_ID_Insert" ValidationGroup="InsertGroup"
                                    ForeColor="Yellow"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="PLED_ID" SortExpression="PLED_ID">
                            <EditItemTemplate>
                                <asp:Label ID="LabelPLED_ID" runat="server" Text='<%# Bind("PLED_ID") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label20" runat="server" Text='<%# Bind("PLED_ID") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:Label ID="LabelPLED_ID_Footer" runat="server" OnPreRender="LabelPLED_ID_PreRender"></asp:Label>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="PLED_SEQ" SortExpression="PLED_SEQ">
                            <ItemStyle HorizontalAlign="Center" />
                            <EditItemTemplate>
                                <asp:Label ID="LabelPLED_SEQ" runat="server" Text='<%# Bind("PLED_SEQ") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label21" runat="server" Text='<%# Bind("PLED_SEQ") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:Label ID="LabelPLED_SEQ_Footer" runat="server" OnPreRender="LabelPLED_SEQ_PreRender"
                                    Style="text-align: center"></asp:Label>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="APPS_ID" SortExpression="APPS_ID">
                            <EditItemTemplate>
                                <asp:Label ID="LabelAPPS_ID" runat="server" Text='<%# Bind("APPS_ID") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="LabelAPPS_ID_Footer" runat="server" Text='<%# Bind("APPS_ID") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:Label ID="Label22" runat="server" OnPreRender="LabelAPPS_ID_PreRender"></asp:Label>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="APPS_DATE" SortExpression="APPS_DATE">
                            <ItemStyle Width="80px" />
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBoxAPPS_DATE" runat="server" Text='<%# Bind("APPS_DATE","{0:d MMMM yyyy}") %>'></asp:TextBox>
                                <asp:CalendarExtender ID="TextBoxAPPS_DATE_CalendarExtender" runat="server" Enabled="True"
                                    TargetControlID="TextBoxAPPS_DATE" Format="d MMMM yyyy" DaysModeTitleFormat="MMMM yyyy"
                                    TodaysDateFormat="d MMMM yyyy">
                                </asp:CalendarExtender>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label23" runat="server" Text='<%# Bind("APPS_DATE","{0:d MMMM yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="TextBoxAPPS_DATE_Footer" runat="server" Text='<%# Bind("APPS_DATE","{0:d MMMM yyyy}") %>'></asp:TextBox>
                                <asp:CalendarExtender ID="TextBoxAPPS_DATE_CalendarExtender" runat="server" Enabled="True"
                                    TargetControlID="TextBoxAPPS_DATE_Footer" Format="d MMMM yyyy" DaysModeTitleFormat="MMMM yyyy"
                                    TodaysDateFormat="d MMMM yyyy">
                                </asp:CalendarExtender>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Collateral_Type" SortExpression="Collateral_Type">
                            <ItemStyle Width="120px" />
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox19" runat="server" Text='<%# Bind("Collateral_Type") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label24" runat="server" Text='<%# Bind("Collateral_Type") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="TextBoxCollateral_Type_Footer" runat="server" Text='<%# Bind("Collateral_Type") %>'></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Property_Type" SortExpression="Property_Type">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox20" runat="server" Text='<%# Bind("Property_Type") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label25" runat="server" Text='<%# Bind("Property_Type") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="TextBoxProperty_Type_Footer" runat="server" Text='<%# Bind("Property_Type") %>'></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Collateral_Description" SortExpression="Collateral_Description">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Collateral_Description") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label26" runat="server" Text='<%# Bind("Collateral_Description") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="TextBoxCollateral_Description_Footer" runat="server" Text='<%# Bind("Collateral_Description") %>'></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="District_of_Property" SortExpression="District_of_Property">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox21" runat="server" Text='<%# Bind("District_of_Property") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label27" runat="server" Text='<%# Bind("District_of_Property") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="TextBoxDistrict_of_Property_Footer" runat="server" Text='<%# Bind("District_of_Property") %>'></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Amphur_of_Property" SortExpression="Amphur_of_Property">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox22" runat="server" Text='<%# Bind("Amphur_of_Property") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label28" runat="server" Text='<%# Bind("Amphur_of_Property") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="TextBoxAmphur_of_Property_Footer" runat="server" Text='<%# Bind("Amphur_of_Property") %>'></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Province_of_Property" SortExpression="Province_of_Property">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownListProvince" runat="server" DataSourceID="SqlDataSourcePROVINCE"
                                    DataTextField="Prov_Thai" DataValueField="Code" SelectedValue='<%# Bind("Province_of_Property") %>'>
                                </asp:DropDownList>
                                <span style="color: Red">*</span>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownListProvince" runat="server" DataSourceID="SqlDataSourcePROVINCE"
                                    DataTextField="Prov_Thai" DataValueField="Code" SelectedValue='<%# Bind("Province_of_Property") %>'
                                    Enabled="false">
                                </asp:DropDownList>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="DropDownListProvince_Footer" runat="server" DataSourceID="SqlDataSourcePROVINCE"
                                    DataTextField="Prov_Thai" DataValueField="Code" SelectedValue='<%# Bind("Province_of_Property") %>'>
                                </asp:DropDownList>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Located_Country_of_Property" SortExpression="Located_Country_of_Property">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox23" runat="server" Text='<%# Bind("Located_Country_of_Property") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label30" runat="server" Text='<%# Bind("Located_Country_of_Property") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="TextBoxLocated_Country_of_Property_Footer" runat="server" Text='<%# Bind("Located_Country_of_Property") %>'></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Collateral_Provider" SortExpression="Collateral_Provider">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox24" runat="server" Text='<%# Bind("Collateral_Provider") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label31" runat="server" Text='<%# Bind("Collateral_Provider") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="TextBoxCollateral_Provider_Footer" runat="server" Text='<%# Bind("Collateral_Provider") %>'></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Property_Under_Construction" SortExpression="Property_Under_Construction">
                            <ItemStyle HorizontalAlign="Center" />
                            <EditItemTemplate>
                                <asp:CheckBox ID="CheckBox3" runat="server" Checked='<%# Bind("Property_Under_Construction") %>' />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox4" runat="server" Checked='<%# Bind("Property_Under_Construction") %>'
                                    Enabled="false" />
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:CheckBox ID="CheckBoxProperty_Under_Construction_Footer" runat="server" Checked='<%# Bind("Property_Under_Construction") %>' />
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Leasehold_Period" SortExpression="Leasehold_Period">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("Leasehold_Period") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label32" runat="server" Text='<%# Bind("Leasehold_Period") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="TextBoxLeasehold_Period_Footer" runat="server" Text='<%# Bind("Leasehold_Period") %>'></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Leasehold_Start_Date" SortExpression="Leasehold_Start_Date">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBoxLeasehold_Start_Date" runat="server" Text='<%# Bind("Leasehold_Start_Date","{0:d MMMM yyyy}") %>'></asp:TextBox>
                                <asp:CalendarExtender ID="TextBoxLeasehold_Start_Date_CalendarExtender" runat="server"
                                    Enabled="True" TargetControlID="TextBoxLeasehold_Start_Date" Format="d MMMM yyyy"
                                    DaysModeTitleFormat="MMMM yyyy" TodaysDateFormat="d MMMM yyyy">
                                </asp:CalendarExtender>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label33" runat="server" Text='<%# Bind("Leasehold_Start_Date","{0:d MMMM yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="TextBoxLeasehold_Start_Date_Footer" runat="server" Text='<%# Bind("Leasehold_Start_Date","{0:d MMMM yyyy}") %>'></asp:TextBox>
                                <asp:CalendarExtender ID="TextBoxLeasehold_Start_Date_CalendarExtender" runat="server"
                                    Enabled="True" TargetControlID="TextBoxLeasehold_Start_Date_Footer" Format="d MMMM yyyy"
                                    DaysModeTitleFormat="MMMM yyyy" TodaysDateFormat="d MMMM yyyy">
                                </asp:CalendarExtender>
                            </FooterTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <table>
                            <thead style="background-color: #990000; font-weight: bold; color: White;">
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        COLL_ID
                                    </td>
                                    <td>
                                        PLED_ID
                                    </td>
                                    <td>
                                        PLED_SEQ
                                    </td>
                                    <td>
                                        APPS_ID
                                    </td>
                                    <td>
                                        APPS_DATE
                                    </td>
                                    <td>
                                        Collateral_Type
                                    </td>
                                    <td>
                                        Property_Type
                                    </td>
                                    <td>
                                        Collateral_Description
                                    </td>
                                    <td>
                                        District_of_Property
                                    </td>
                                    <td>
                                        Amphur_of_Property
                                    </td>
                                    <td>
                                        Province_of_Property
                                    </td>
                                    <td>
                                        Located_Country_of_Property
                                    </td>
                                    <td>
                                        Collateral_Provider
                                    </td>
                                    <td>
                                        Property_Under_Construction
                                    </td>
                                    <td>
                                        Leasehold_Period
                                    </td>
                                    <td>
                                        Leasehold_Start_Date
                                    </td>
                                </tr>
                            </thead>
                            <tr style="background-color: #FFFBD6; color: #333333;">
                                <td>
                                    <asp:LinkButton ID="Insert_LinkButton" runat="server" CausesValidation="True" CommandName="EmptyDataTemplateInsert"
                                        Text="Insert"></asp:LinkButton>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxCOLL_ID" runat="server" Width="100px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="LabelCOLL_ID_Insert_RequiredFieldValidator" runat="server"
                                        ErrorMessage="*" Text="*" ControlToValidate="LabelCOLL_ID_Insert" ValidationGroup="InsertGroup"
                                        ForeColor="Yellow">
                                    </asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:Label ID="LabelPLED_ID" runat="server" OnPreRender="LabelPLED_ID_PreRender"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="LabelPLED_SEQ" runat="server" OnPreRender="LabelPLED_SEQ_PreRender"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="LabelAPPS_ID" runat="server" OnPreRender="LabelAPPS_ID_PreRender"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxAPPS_DATE" runat="server" Format="d MMMM yyyy"></asp:TextBox>
                                    <asp:CalendarExtender ID="TextBoxAPPS_DATE_CalendarExtender" runat="server" Enabled="True"
                                        TargetControlID="TextBoxAPPS_DATE" Format="d MMMM yyyy" DaysModeTitleFormat="MMMM yyyy"
                                        TodaysDateFormat="d MMMM yyyy">
                                    </asp:CalendarExtender>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxCollateral_Type" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxProperty_Type" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxCollateral_Description" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxDistrict_of_Property" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxAmphur_of_Property" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownListProvince" runat="server" DataSourceID="SqlDataSourcePROVINCE"
                                        DataTextField="Prov_Thai" DataValueField="Code">
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxLocated_Country_of_Property" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxCollateral_Provider" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:CheckBox ID="Property_Under_Construction_CheckBox" runat="server" />
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxLeasehold_Period" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxLeasehold_Start_Date" runat="server" Format="d MMMM yyyy"></asp:TextBox>
                                    <asp:CalendarExtender ID="TextBoxLeasehold_Start_Date_CalendarExtender" runat="server"
                                        Enabled="True" TargetControlID="TextBoxLeasehold_Start_Date" Format="d MMMM yyyy"
                                        DaysModeTitleFormat="MMMM yyyy" TodaysDateFormat="d MMMM yyyy">
                                    </asp:CalendarExtender>
                                </td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourcePLEDGE_INFO" runat="server" ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>"
                    InsertCommand="PLEDGE_INFORMATION_INSERT" InsertCommandType="StoredProcedure"
                    SelectCommand="PLEDGE_INFORMATION_SELECT" SelectCommandType="StoredProcedure"
                    UpdateCommand="PLEDGE_INFORMATION_UPDATE" UpdateCommandType="StoredProcedure"
                    OnUpdated="SqlDataSource1_Updated">
                    <InsertParameters>
                        <asp:Parameter Name="CIF" Type="String" />
                        <asp:Parameter Name="Default_Date" Type="DateTime" />
                        <asp:Parameter Name="APPS_ID" Type="String" />
                        <asp:Parameter Name="PLED_ID" Type="String" />
                        <asp:Parameter Name="PLED_SEQ" Type="Int16" />
                        <asp:Parameter Name="Pledge_to_All_Facilities" Type="Boolean" />
                        <asp:Parameter Name="Facility_Pledged" Type="String" />
                        <asp:Parameter Name="Collateral_Currency_Code" Type="String" />
                        <asp:Parameter Name="Valuation_Amount_D" Type="Double" />
                        <asp:Parameter Name="Valuation_Date_D" Type="DateTime" />
                        <asp:Parameter Name="Valuation_Amount_D1" Type="Double" />
                        <asp:Parameter Name="Valuation_Date_D1" Type="DateTime" />
                        <asp:Parameter Name="Prior_Claim_by_Other_Bank" Type="Boolean" />
                        <asp:Parameter Name="Prior_Claim_Amount" Type="Double" />
                        <asp:Parameter Name="Pledge_Amount_D" Type="Double" />
                        <asp:Parameter Name="Limitation_Amount_D" Type="Double" />
                        <asp:Parameter Name="Pledge_Amount_D1" Type="Double" />
                        <asp:Parameter Name="Limitation_Amount_D1" Type="Double" />
                        <asp:Parameter Name="UPDATE_USER" Type="String" />
                        <asp:Parameter Name="UPDATE_DATE" Type="DateTime" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:QueryStringParameter Name="CIF" QueryStringField="CIF" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="CIF" Type="String" />
                        <asp:Parameter Name="Default_Date" Type="DateTime" />
                        <asp:Parameter Name="APPS_ID" Type="String" />
                        <asp:Parameter Name="PLED_ID" Type="String" />
                        <asp:Parameter Name="PLED_SEQ" Type="Int16" />
                        <asp:Parameter Name="Pledge_to_All_Facilities" Type="Boolean" />
                        <asp:Parameter Name="Facility_Pledged" Type="String" />
                        <asp:Parameter Name="Collateral_Currency_Code" Type="String" />
                        <asp:Parameter Name="Valuation_Amount_D" Type="Double" />
                        <asp:Parameter Name="Valuation_Date_D" Type="DateTime" />
                        <asp:Parameter Name="Valuation_Amount_D1" Type="Double" />
                        <asp:Parameter Name="Valuation_Date_D1" Type="DateTime" />
                        <asp:Parameter Name="Prior_Claim_by_Other_Bank" Type="Boolean" />
                        <asp:Parameter Name="Prior_Claim_Amount" Type="Double" />
                        <asp:Parameter Name="Pledge_Amount_D" Type="Double" />
                        <asp:Parameter Name="Limitation_Amount_D" Type="Double" />
                        <asp:Parameter Name="Pledge_Amount_D1" Type="Double" />
                        <asp:Parameter Name="Limitation_Amount_D1" Type="Double" />
                        <asp:Parameter Name="UPDATE_USER" Type="String" />
                        <asp:Parameter Name="UPDATE_DATE" Type="DateTime" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceCurrentcy" runat="server" ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>"
                    SelectCommand="L_CURRENCY_CODE_SELECT" EnableCaching="True" SelectCommandType="StoredProcedure">
                </asp:SqlDataSource>
                <asp:HiddenField ID="HiddenFieldAPPS_ID" runat="server" />
                <asp:HiddenField ID="HiddenFieldPLED_ID" runat="server" />
                <asp:HiddenField ID="HiddenFieldPLED_SEQ" runat="server" />
                <asp:HiddenField ID="HiddenFieldCOLL_ID" runat="server" />
                <asp:SqlDataSource ID="SqlDataSourcePROVINCE" runat="server" ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>"
                    SelectCommand="L_PROVINCE_SELECT" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceCOLL_INFO" runat="server" ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>"
                    SelectCommand="COLLATERAL_INFORMATION_SELECT" SelectCommandType="StoredProcedure"
                    InsertCommand="COLLATERAL_INFORMATION_INSERT" InsertCommandType="StoredProcedure"
                    UpdateCommand="COLLATERAL_INFORMATION_UPDATE" UpdateCommandType="StoredProcedure">
                    <InsertParameters>
                        <asp:Parameter Name="COLL_ID" Type="String" />
                        <asp:Parameter Name="PLED_ID" Type="String" />
                        <asp:Parameter Name="PLED_SEQ" Type="Int16" />
                        <asp:Parameter Name="APPS_ID" Type="String" />
                        <asp:Parameter Name="APPS_DATE" Type="DateTime" />
                        <asp:Parameter Name="Collateral_Type" Type="String" />
                        <asp:Parameter Name="Property_Type" Type="String" />
                        <asp:Parameter Name="Collateral_Description" Type="String" />
                        <asp:Parameter Name="District_of_Property" Type="String" />
                        <asp:Parameter Name="Amphur_of_Property" Type="String" />
                        <asp:Parameter Name="Province_of_Property" Type="String" />
                        <asp:Parameter Name="Located_Country_of_Property" Type="String" />
                        <asp:Parameter Name="Collateral_Provider" Type="String" />
                        <asp:Parameter Name="Property_Under_Construction" Type="Boolean" />
                        <asp:Parameter Name="Leasehold_Period" Type="Int16" />
                        <asp:Parameter Name="Leasehold_Start_Date" Type="DateTime" />
                        <asp:Parameter Name="UPDATE_USER" Type="String" />
                        <asp:Parameter Name="UPDATE_DATE" Type="DateTime" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:Parameter Name="PLED_ID" Type="String" />
                        <asp:Parameter Name="PLED_SEQ" Type="Int16" />
                        <asp:Parameter Name="APPS_ID" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="COLL_ID" Type="String" />
                        <asp:Parameter Name="PLED_ID" Type="String" />
                        <asp:Parameter Name="PLED_SEQ" Type="Int16" />
                        <asp:Parameter Name="APPS_ID" Type="String" />
                        <asp:Parameter Name="APPS_DATE" Type="DateTime" />
                        <asp:Parameter Name="Collateral_Type" Type="String" />
                        <asp:Parameter Name="Property_Type" Type="String" />
                        <asp:Parameter Name="Collateral_Description" Type="String" />
                        <asp:Parameter Name="District_of_Property" Type="String" />
                        <asp:Parameter Name="Amphur_of_Property" Type="String" />
                        <asp:Parameter Name="Province_of_Property" Type="String" />
                        <asp:Parameter Name="Located_Country_of_Property" Type="String" />
                        <asp:Parameter Name="Collateral_Provider" Type="String" />
                        <asp:Parameter Name="Property_Under_Construction" Type="Boolean" />
                        <asp:Parameter Name="Leasehold_Period" Type="Int16" />
                        <asp:Parameter Name="Leasehold_Start_Date" Type="DateTime" />
                        <asp:Parameter Name="UPDATE_USER" Type="String" />
                        <asp:Parameter Name="UPDATE_DATE" Type="DateTime" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
