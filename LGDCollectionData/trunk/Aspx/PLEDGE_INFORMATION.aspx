<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="PLEDGE_INFORMATION.aspx.cs" Inherits="LGDCollectionData.Aspx.PLEDGE_INFORMATION"
    Culture="en-US" UICulture="en-US" MaintainScrollPositionOnPostback="true" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="../UserControls/SelectFormWebUserControl.ascx" TagName="SelectFormWebUserControl"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <!-- Ext includes -->
    <link rel="stylesheet" type="text/css" href="../ExtJS/resources/css/ext-all.css" />
    <script type="text/javascript" src="../ExtJS/adapter/ext/ext-base.js"></script>
    <script type="text/javascript" src="../ExtJS/ext-all.js"></script>
    <script type="text/javascript" src="../Scripts/CommonExt.js"></script>
    <script type="text/javascript" src="../Scripts/common.js"></script>
    <script type="text/javascript">
        Ext.onReady(function () {
            //Ext.select("input[type=text]").setWidth("200px");
            //Ext.select("input[type=text]").set({ "maxlength": "255" });

            //format IsNumeric Element onblur event
            var numericElements = Ext.select("input[type=text][IsNumeric=Yes]");
            numericElements.on({
                "keyup": {
                    fn: function (e, t, o) {
                        try {
                            var keyNum = eventKeyCode(e);

                            if (keyNum == 109) return;
                            if (t.value.length == 0) return;
                            if (keyNum <= 40 && keyNum != 8) return;

                            var valueArray = t.value.split(".");
                            var intValueStrArray = valueArray[0].split(",");
                            var intValueStr = "";

                            for (var i = 0; i < intValueStrArray.length; i++) {
                                intValueStr += intValueStrArray[i];
                            }

                            intValueStr = String(Number(intValueStr));

                            var result = "";
                            var splitCount = 0;
                            var isMinus = (Number(intValueStr) < 0) ? true : false;
                            var absoluteValue = intValueStr.replace("-", "");

                            for (var i = (absoluteValue.length - 1); i >= 0; i--) {
                                if (splitCount == 3) {
                                    result = "," + result
                                    splitCount = 0;
                                    i++;
                                    continue;
                                }

                                result = absoluteValue.charAt(i) + result;
                                splitCount++;
                            }

                            if (valueArray.length > 1) {
                                result = result + "." + valueArray[1];
                            }

                            if (isMinus) {
                                result = "-" + result;
                            }

                            t.value = result;

                        } catch (err) {
                            alert("error : " + err);
                        }
                    }
                },
                "blur": {
                    fn: function (e, t, o) {
                        t.value = (new MyNumber(t.value)).toCurrency(2);
                    }
                }
            });
            //end format IsNumeric Element onblur event
            numericElements.applyStyles({ "text-align": "right" });

            //format IsNumber Element onblur event
            var numberElements = Ext.select("input[type=text][IsNumber=Yes]");
            numberElements.on({
                "keyup": {
                    fn: function (e, t, o) {
                        try {
                            var keyNum = eventKeyCode(e);

                            if (keyNum == 109) return;
                            if (t.value.length == 0) return;
                            if (keyNum <= 40 && keyNum != 8) return;

                            var valueArray = t.value.split(".");
                            var intValueStrArray = valueArray[0].split(",");
                            var intValueStr = "";

                            for (var i = 0; i < intValueStrArray.length; i++) {
                                intValueStr += intValueStrArray[i];
                            }

                            intValueStr = String(Number(intValueStr));

                            var result = "";
                            var splitCount = 0;
                            var isMinus = (Number(intValueStr) < 0) ? true : false;
                            var absoluteValue = intValueStr.replace("-", "");

                            for (var i = (absoluteValue.length - 1); i >= 0; i--) {
                                result = absoluteValue.charAt(i) + result;
                                splitCount++;
                            }

                            if (valueArray.length > 1) {
                                result = result + "." + valueArray[1];
                            }

                            if (isMinus) {
                                result = "-" + result;
                            }

                            t.value = result;

                        } catch (err) {
                            alert("error : " + err);
                        }
                    }
                },
                "blur": {
                    fn: function (e, t, o) {
                        t.value = (new MyNumber(t.value)).getValue();
                    }
                }
            });
            //end format IsNumber Element onblur event
            numberElements.applyStyles({ "text-align": "right" });

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

            var textBoxCOLL_ID = Ext.DotNetControl.Element.mapElement("input", "domId", "TextBoxCOLL_ID");
            var dropDownListCollateral_Type = Ext.DotNetControl.Element.mapElement("select", "domId", "DropDownListCollateral_Type");
            var dropDownListProperty_Type = Ext.DotNetControl.Element.mapElement("select", "domId", "DropDownListProperty_Type");
            var textBoxDistrict_of_Property = Ext.DotNetControl.Element.mapElement("input", "domId", "TextBoxDistrict_of_Property");
            var textBoxAmphur_of_Property = Ext.DotNetControl.Element.mapElement("input", "domId", "TextBoxAmphur_of_Property");
            var dropDownListProvince = Ext.DotNetControl.Element.mapElement("select", "domId", "DropDownListProvince");
            var textBoxLocated_Country_of_Property = Ext.DotNetControl.Element.mapElement("input", "domId", "TextBoxLocated_Country_of_Property");
            var checkBoxProperty_Under_Construction = Ext.DotNetControl.CheckBox.mapElement("domId", "CheckBoxProperty_Under_Construction");
            var textBoxLeasehold_Period = Ext.DotNetControl.Element.mapElement("input", "domId", "TextBoxLeasehold_Period");
            var textBoxLeasehold_Start_Date = Ext.DotNetControl.Element.mapElement("input", "domId", "TextBoxLeasehold_Start_Date");

            textBoxCOLL_ID.element.on({
                "blur": function (e, t, o) {
                    var collType = ("000000000" + t.value).substr(("000000000" + t.value).length - 9).substring(0, 2);

                    var ind = 0;
                    for (var i = 0; i < o.targetElement.DropDownListCollateral_Type.element.dom.options.length; i++) {
                        if (o.targetElement.DropDownListCollateral_Type.element.dom.options[i].value == collType) {
                            ind = o.targetElement.DropDownListCollateral_Type.element.dom.options[i].index;
                        }
                    }

                    o.targetElement.DropDownListCollateral_Type.element.dom.selectedIndex = ind;
                    alert(o.targetElement.DropDownListProperty_Type.element.dom.disabled);
                    switch (collType) {
                        case '05':
                            o.targetElement.DropDownListProperty_Type.disabled(false);
                            o.targetElement.TextBoxDistrict_of_Property.disabled(false);
                            o.targetElement.TextBoxAmphur_of_Property.disabled(false);
                            o.targetElement.DropDownListProvince.disabled(false);
                            o.targetElement.TextBoxLocated_Country_of_Property.disabled(false);
                            o.targetElement.CheckBoxProperty_Under_Construction.disabled(true);
                            o.targetElement.TextBoxLeasehold_Period.disabled(true);
                            o.targetElement.TextBoxLeasehold_Start_Date.disabled(true);
                            break;
                        case '06':
                            o.targetElement.DropDownListProperty_Type.disabled(false);
                            o.targetElement.TextBoxDistrict_of_Property.disabled(false);
                            o.targetElement.TextBoxAmphur_of_Property.disabled(false);
                            o.targetElement.DropDownListProvince.disabled(false);
                            o.targetElement.TextBoxLocated_Country_of_Property.disabled(false);
                            o.targetElement.CheckBoxProperty_Under_Construction.disabled(true);
                            o.targetElement.TextBoxLeasehold_Period.disabled(true);
                            o.targetElement.TextBoxLeasehold_Start_Date.disabled(true);
                            break;
                        case '07':
                            o.targetElement.DropDownListProperty_Type.disabled(true);
                            o.targetElement.TextBoxDistrict_of_Property.disabled(false);
                            o.targetElement.TextBoxAmphur_of_Property.disabled(false);
                            o.targetElement.DropDownListProvince.disabled(false);
                            o.targetElement.TextBoxLocated_Country_of_Property.disabled(false);
                            o.targetElement.CheckBoxProperty_Under_Construction.disabled(true);
                            o.targetElement.TextBoxLeasehold_Period.disabled(true);
                            o.targetElement.TextBoxLeasehold_Start_Date.disabled(true);
                            break;
                        case '08':
                            o.targetElement.DropDownListProperty_Type.disabled(true);
                            o.targetElement.TextBoxDistrict_of_Property.disabled(false);
                            o.targetElement.TextBoxAmphur_of_Property.disabled(false);
                            o.targetElement.DropDownListProvince.disabled(false);
                            o.targetElement.TextBoxLocated_Country_of_Property.disabled(false);
                            o.targetElement.CheckBoxProperty_Under_Construction.disabled(true);
                            o.targetElement.TextBoxLeasehold_Period.disabled(false);
                            o.targetElement.TextBoxLeasehold_Start_Date.disabled(false);
                            break;
                        default:
                            o.targetElement.DropDownListProperty_Type.disabled(true);
                            o.targetElement.TextBoxDistrict_of_Property.disabled(true);
                            o.targetElement.TextBoxAmphur_of_Property.disabled(true);
                            o.targetElement.DropDownListProvince.disabled(true);
                            o.targetElement.TextBoxLocated_Country_of_Property.disabled(true);
                            o.targetElement.CheckBoxProperty_Under_Construction.disabled(true);
                            o.targetElement.TextBoxLeasehold_Period.disabled(true);
                            o.targetElement.TextBoxLeasehold_Start_Date.disabled(true);
                    }
                    alert(o.targetElement.DropDownListProperty_Type.element.dom.disabled);
                },
                scope: this,
                targetElement: { "DropDownListCollateral_Type": dropDownListCollateral_Type
                    , "DropDownListProperty_Type": dropDownListProperty_Type
                    , "TextBoxDistrict_of_Property": textBoxDistrict_of_Property
                    , "TextBoxAmphur_of_Property": textBoxAmphur_of_Property
                    , "DropDownListProvince": dropDownListProvince
                    , "TextBoxLocated_Country_of_Property": textBoxLocated_Country_of_Property
                    , "CheckBoxProperty_Under_Construction": checkBoxProperty_Under_Construction
                    , "TextBoxLeasehold_Period": textBoxLeasehold_Period
                    , "TextBoxLeasehold_Start_Date": textBoxLeasehold_Start_Date
                }
            });
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
    <h2>
        <asp:Label ID="FormName_Label" runat="server" Text="PLEDGE INFORMATION"></asp:Label>
    </h2>
    <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False"
        DataKeyNames="CIF,Default_Date,APPS_ID,PLED_ID,PLED_SEQ" DataSourceID="SqlDataSourcePLEDGE_INFO"
        EnableModelValidation="True" OnDataBound="DetailsView_Databound"
        OnPageIndexChanged="DetailsView_PageIndexChanged" OnPreRender="DetailsView_Prerender"
        DefaultMode="Edit" CellPadding="4" ForeColor="#333333" GridLines="Both" Width="550px" PagerSettings-Mode="NumericFirstLast">
        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
        <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" Width="35%" />
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
                    <asp:Label ID="Default_Date_Label" runat="server" Text='<%# Eval("Default_Date", "{0:d MMMM yyyy}") %>'></asp:Label>
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
                    <asp:Label ID="Default_Date_Label" runat="server" Text='<%# Bind("Default_Date", "{0:d MMMM yyyy}") %>'></asp:Label>
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
                    <asp:CheckBox ID="Pledge_to_All_Facilities_CheckBox" runat="server" Checked='<%# Bind("Pledge_to_All_Facilities") %>' domId="Pledge_to_All_Facilities_CheckBox" />
                    <span style="color: Red">*</span>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:CheckBox ID="Pledge_to_All_Facilities_CheckBox" runat="server" Checked='<%# Bind("Pledge_to_All_Facilities") %>' domId="Pledge_to_All_Facilities_CheckBox"/>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="Pledge_to_All_Facilities_CheckBox" runat="server" Checked='<%# Bind("Pledge_to_All_Facilities") %>' Enabled="false" domId="Pledge_to_All_Facilities_CheckBox"/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Facility Pledged" SortExpression="Facility_Pledged">
                <EditItemTemplate>
                    <asp:TextBox ID="Facility_Pledged_TextBox" runat="server" Text='<%# Bind("Facility_Pledged") %>' domId="Facility_Pledged_TextBox"></asp:TextBox>
                    <span style="color: Red">*</span>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="Facility_Pledged_TextBox" runat="server" Text='<%# Bind("Facility_Pledged") %>' domId="Facility_Pledged_TextBox"></asp:TextBox>
                    <span style="color: Red">*</span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Facility_Pledged_Label" runat="server" Text='<%# Bind("Facility_Pledged") %>'></asp:Label>
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
                    <asp:DropDownList ID="DropDownListCurrency" runat="server" DataSourceID="SqlDataSourceCurrentcy"
                        DataTextField="Description" DataValueField="Code" SelectedValue='<%# Bind("Collateral_Currency_Code")%>'>
                    </asp:DropDownList>
                    <span style="color: Red">*</span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownListCurrency" runat="server" DataSourceID="SqlDataSourceCurrentcy"
                        DataTextField="Description" DataValueField="Code" SelectedValue='<%# Bind("Collateral_Currency_Code")%>' Enabled="false">
                    </asp:DropDownList>
                    <span style="color: Red">*</span>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Valuation Amount @ D" SortExpression="Valuation_Amount_D">
                <EditItemTemplate>
                    <asp:TextBox ID="Valuation_Amount_D_TextBox" runat="server" Text='<%# Bind("Valuation_Amount_D","{0:#,##0.##}") %>' IsNumeric="Yes" Width="150px" Style="text-align: right"></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="Valuation_Amount_D_TextBox" runat="server" Text='<%# Bind("Valuation_Amount_D","{0:#,##0.##}") %>' IsNumeric="Yes" Width="150px" Style="text-align: right"></asp:TextBox>
                    <span style="color: Red">*</span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Valuation_Amount_D_Label" runat="server" Text='<%# Bind("Valuation_Amount_D","{0:#,##0.##}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Valuation Date @ D" SortExpression="Valuation_Date_D">
                <EditItemTemplate>
                    <asp:TextBox ID="Valuation_Date_D_TextBox" runat="server" Text='<%# Bind("Valuation_Date_D","{0:d MMMM yyyy}") %>'></asp:TextBox>
                    <asp:CalendarExtender ID="Valuation_Date_D_CalendarExtender" runat="server" TargetControlID="Valuation_Date_D_TextBox"
                        Format="d MMMM yyyy" DaysModeTitleFormat="MMMM yyyy" TodaysDateFormat="d MMMM yyyy">
                    </asp:CalendarExtender>
                    <asp:CustomValidator ID="Valuation_Date_D_Validator" runat="server" ErrorMessage="Must earlier than default date." ControlToValidate="Valuation_Date_D_TextBox" ValidationGroup="detailviewValidation" SetFocusOnError="true" OnServerValidate="Valuation_Date_D_ServerValidate"></asp:CustomValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="Valuation_Date_D_TextBox" runat="server" Text='<%# Bind("Valuation_Date_D","{0:d MMMM yyyy}") %>'></asp:TextBox>
                    <span style="color: Red">*</span>
                    <asp:CalendarExtender ID="Valuation_Date_D_CalendarExtender" runat="server" TargetControlID="Valuation_Date_D_TextBox"
                        Format="d MMMM yyyy" DaysModeTitleFormat="MMMM yyyy" TodaysDateFormat="d MMMM yyyy">
                    </asp:CalendarExtender>
                    <asp:CustomValidator ID="Valuation_Date_D_Validator" runat="server" ErrorMessage="Must earlier than default date." ControlToValidate="Valuation_Date_D_TextBox" ValidationGroup="detailviewValidation" SetFocusOnError="true" OnServerValidate="Valuation_Date_D_ServerValidate"></asp:CustomValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Valuation_Date_D_Label" runat="server" Text='<%# Bind("Valuation_Date_D","{0:d MMMM yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Valuation Amount @ D-1" SortExpression="Valuation_Amount_D1">
                <EditItemTemplate>
                    <asp:TextBox ID="Valuation_Amount_D1_TextBox" runat="server" Text='<%# Bind("Valuation_Amount_D1","{0:#,##0.##}") %>' IsNumeric="Yes" Width="150px" Style="text-align: right"></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="Valuation_Amount_D1_TextBox" runat="server" Text='<%# Bind("Valuation_Amount_D1","{0:#,##0.##}") %>' IsNumeric="Yes" Width="150px" Style="text-align: right"></asp:TextBox>
                    <span style="color: Red">*</span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Valuation_Amount_D1_Label" runat="server" Text='<%# Bind("Valuation_Amount_D1","{0:#,##0.##}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Valuation Date @ D-1" SortExpression="Valuation_Date_D1">
                <EditItemTemplate>
                    <asp:TextBox ID="Valuation_Date_D1_TextBox" runat="server" Text='<%# Bind("Valuation_Date_D1","{0:d MMMM yyyy}") %>'></asp:TextBox>
                    <asp:CalendarExtender ID="Valuation_Date_D1_TextBox_CalendarExtender" runat="server" TargetControlID="Valuation_Date_D1_TextBox"
                        Format="d MMMM yyyy" DaysModeTitleFormat="MMMM yyyy" TodaysDateFormat="d MMMM yyyy">
                    </asp:CalendarExtender>
                    <asp:CustomValidator ID="Valuation_Date_D1_TextBox_Validator" runat="server" ErrorMessage="Must earlier than Valuation Date @ D." ControlToValidate="Valuation_Date_D1_TextBox" ValidationGroup="detailviewValidation" SetFocusOnError="true" OnServerValidate="Valuation_Date_D1_TextBox_ServerValidate"></asp:CustomValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                        <asp:TextBox ID="Valuation_Date_D1_TextBox" runat="server" Text='<%# Bind("Valuation_Date_D1","{0:d MMMM yyyy}") %>'></asp:TextBox>
                        <span style="color: Red">*</span>
                    <asp:CalendarExtender ID="Valuation_Date_D1_TextBox_CalendarExtender" runat="server" TargetControlID="Valuation_Date_D1_TextBox"
                        Format="d MMMM yyyy" DaysModeTitleFormat="MMMM yyyy" TodaysDateFormat="d MMMM yyyy">
                    </asp:CalendarExtender>
                    <asp:CustomValidator ID="Valuation_Date_D1_TextBox_Validator" runat="server" ErrorMessage="Must earlier than default date." ControlToValidate="Valuation_Date_D1_TextBox" ValidationGroup="detailviewValidation" SetFocusOnError="true" OnServerValidate="Valuation_Date_D1_TextBox_ServerValidate"></asp:CustomValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Valuation_Date_D1_Label" runat="server" Text='<%# Bind("Valuation_Date_D1","{0:d MMMM yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Prior Claim by Other Bank" SortExpression="Prior_Claim_by_Other_Bank">
                <EditItemTemplate>
                    <asp:CheckBox ID="Prior_Claim_by_Other_Bank_CheckBox" runat="server" Checked='<%# Bind("Prior_Claim_by_Other_Bank") %>'
                        domId="Prior_Claim_by_Other_Bank_CheckBox" />
                    <span style="color: Red">*</span>
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
                    <asp:TextBox ID="Prior_Claim_Amount_TextBox" runat="server" Text='<%# Bind("Prior_Claim_Amount","{0:#,##0.##}") %>' IsNumeric="Yes" Width="150px" Style="text-align: right" domId="Prior_Claim_Amount_TextBox"></asp:TextBox>
                    <span style="color: Red">*</span>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="Prior_Claim_Amount_TextBox" runat="server" Text='<%# Bind("Prior_Claim_Amount","{0:#,##0.##}") %>' IsNumeric="Yes" Width="150px" Style="text-align: right" domId="Prior_Claim_Amount_TextBox"></asp:TextBox>
                    <span style="color: Red">*</span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Prior_Claim_Amount_Label" runat="server" Text='<%# Bind("Prior_Claim_Amount","{0:#,##0.##}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Pledge Amount @ D" SortExpression="Pledge_Amount_D">
                <EditItemTemplate>
                    <asp:TextBox ID="Pledge_Amount_D_TextBox" runat="server" Text='<%# Bind("Pledge_Amount_D","{0:#,##0.##}") %>' IsNumeric="Yes" Width="150px" Style="text-align: right"></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="Pledge_Amount_D_TextBox" runat="server" Text='<%# Bind("Pledge_Amount_D","{0:#,##0.##}") %>' IsNumeric="Yes" Width="150px" Style="text-align: right"></asp:TextBox>
                    <span style="color: Red">*</span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Pledge_Amount_D_Label" runat="server" Text='<%# Bind("Pledge_Amount_D","{0:#,##0.##}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Limitation Amount @ D" SortExpression="Limitation_Amount_D">
                <EditItemTemplate>
                    <asp:TextBox ID="Limitation_Amount_D_TextBox" runat="server" Text='<%# Bind("Limitation_Amount_D","{0:#,##0.##}") %>' IsNumeric="Yes" Width="150px" Style="text-align: right"></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="Limitation_Amount_D_TextBox" runat="server" Text='<%# Bind("Limitation_Amount_D","{0:#,##0.##}") %>' IsNumeric="Yes" Width="150px" Style="text-align: right"></asp:TextBox>
                    <span style="color: Red">*</span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Limitation_Amount_D_Label" runat="server" Text='<%# Bind("Limitation_Amount_D","{0:#,##0.##}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Pledge Amount @ D-1" SortExpression="Pledge_Amount_D1">
                <EditItemTemplate>
                    <asp:TextBox ID="Pledge_Amount_D1_TextBox" runat="server" Text='<%# Bind("Pledge_Amount_D1","{0:#,##0.##}") %>' IsNumeric="Yes" Width="150px" Style="text-align: right"></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="Pledge_Amount_D1_TextBox" runat="server" Text='<%# Bind("Pledge_Amount_D1","{0:#,##0.##}") %>' IsNumeric="Yes" Width="150px" Style="text-align: right"></asp:TextBox>
                    <span style="color: Red">*</span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Pledge_Amount_D1_Label" runat="server" Text='<%# Bind("Pledge_Amount_D1","{0:#,##0.##}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Limitation Amount @ D-1" SortExpression="Limitation_Amount_D1">
                <EditItemTemplate>
                    <asp:TextBox ID="Limitation_Amount_D1_TextBox" runat="server" Text='<%# Bind("Limitation_Amount_D1","{0:#,##0.##}") %>' IsNumeric="Yes" Width="150px" Style="text-align: right"></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="Limitation_Amount_D1_TextBox" runat="server" Text='<%# Bind("Limitation_Amount_D1","{0:#,##0.##}") %>' IsNumeric="Yes" Width="150px" Style="text-align: right"></asp:TextBox>
                </EditItemTemplate>
                    <span style="color: Red">*</span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Limitation_Amount_D1_Label" runat="server" Text='<%# Bind("Limitation_Amount_D1","{0:#,##0.##}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Update User" SortExpression="UPDATE_USER">
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
            <asp:TemplateField HeaderText="Update Date" SortExpression="UPDATE_DATE">
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
                        Text="Update" ValidationGroup="detailviewValidation"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                        Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"
                        Text="Edit"></asp:LinkButton>
                </ItemTemplate>
                <InsertItemTemplate>
                    <asp:LinkButton ID="LinkButtonSave" runat="server" CausesValidation="true" CommandName="Insert"
                        Text="Insert" ValidationGroup="detailviewValidation"></asp:LinkButton>
                </InsertItemTemplate>
            </asp:TemplateField>
        </Fields>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
    </asp:DetailsView>
    <h2>
        <asp:Label ID="FormCollateral_Label" runat="server" Text="COLLATERAL INFORMATION"></asp:Label>
    </h2>
    <asp:Panel ID="Wrapper_Panel" runat="server" Width="800px" ScrollBars="Horizontal">
    <asp:GridView ID="GridView_COLL_INFO" runat="server" AutoGenerateColumns="False"
        DataSourceID="SqlDataSourceCOLL_INFO" EnableModelValidation="True" CellPadding="4"
        DataKeyNames="COLL_ID,PLED_ID,PLED_SEQ,APPS_ID" ForeColor="#333333" OnRowUpdating="GridView_RowUpdating"
        ShowFooter="True" OnRowCommand="GridView_COLL_INFO_RowCommand" AllowPaging="True" PagerSettings-Mode="NumericFirstLast">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField ShowHeader="False" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
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
                <HeaderStyle Wrap="False" />
                <ItemStyle Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButtonDelete" runat="server" CausesValidation="False" 
                        CommandName="Delete" Text="Delete"></asp:LinkButton>
                </ItemTemplate>
                <HeaderStyle Wrap="False" />
                <ItemStyle Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="COLL ID" SortExpression="COLL_ID" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                <EditItemTemplate>
                    <asp:Label ID="LabelCOLL_ID" runat="server" Text='<%# Bind("COLL_ID") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="LabelCOLL_ID" runat="server" Text='<%# Bind("COLL_ID") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="LabelCOLL_ID_Footer" runat="server" Width="10ex" MaxLength="9" domId="TextBoxCOLL_ID"></asp:TextBox>
                </FooterTemplate>
                <HeaderStyle Wrap="False" />
                <ItemStyle Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="PLED ID" SortExpression="PLED_ID" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                <EditItemTemplate>
                    <asp:Label ID="LabelPLED_ID" runat="server" Text='<%# Bind("PLED_ID") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="LabelPLED_ID" runat="server" Text='<%# Bind("PLED_ID") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:Label ID="LabelPLED_ID_Footer" runat="server" OnPreRender="LabelPLED_ID_PreRender"></asp:Label>
                </FooterTemplate>
                <HeaderStyle Wrap="False" />
                <ItemStyle Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="PLED SEQ" SortExpression="PLED_SEQ" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                <EditItemTemplate>
                    <asp:Label ID="LabelPLED_SEQ" runat="server" Text='<%# Bind("PLED_SEQ") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="LabelPLED_SEQ" runat="server" Text='<%# Bind("PLED_SEQ") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:Label ID="LabelPLED_SEQ_Footer" runat="server" OnPreRender="LabelPLED_SEQ_PreRender"
                        Style="text-align: center"></asp:Label>
                </FooterTemplate>
                <HeaderStyle Wrap="False" />
                <ItemStyle Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="APPS ID" SortExpression="APPS_ID" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                <EditItemTemplate>
                    <asp:Label ID="LabelAPPS_ID" runat="server" Text='<%# Bind("APPS_ID") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="LabelAPPS_ID" runat="server" Text='<%# Bind("APPS_ID") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:Label ID="LabelAPPS_ID_Footer" runat="server" OnPreRender="LabelAPPS_ID_PreRender"></asp:Label>
                </FooterTemplate>
                <HeaderStyle Wrap="False" />
                <ItemStyle Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="APPS DATE" SortExpression="APPS_DATE" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxAPPS_DATE" runat="server" Text='<%# Bind("APPS_DATE","{0:d MMMM yyyy}") %>' Width="17ex"></asp:TextBox>
                    <asp:CalendarExtender ID="TextBoxAPPS_DATE_CalendarExtender" runat="server" Enabled="True"
                        TargetControlID="TextBoxAPPS_DATE" Format="d MMMM yyyy" DaysModeTitleFormat="MMMM yyyy"
                        TodaysDateFormat="d MMMM yyyy">
                    </asp:CalendarExtender>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="LabelAPPS_DATE" runat="server" Text='<%# Bind("APPS_DATE","{0:d MMMM yyyy}") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="TextBoxAPPS_DATE_Footer" runat="server" Text='<%# Bind("APPS_DATE","{0:d MMMM yyyy}") %>' Width="17ex"></asp:TextBox>
                    <asp:CalendarExtender ID="TextBoxAPPS_DATE_CalendarExtender" runat="server" Enabled="True"
                        TargetControlID="TextBoxAPPS_DATE_Footer" Format="d MMMM yyyy" DaysModeTitleFormat="MMMM yyyy"
                        TodaysDateFormat="d MMMM yyyy">
                    </asp:CalendarExtender>
                </FooterTemplate>
                <HeaderStyle Wrap="False" />
                <ItemStyle Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Collateral Type" SortExpression="Collateral_Type" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownListCollateral_Type" runat="server" 
                        AppendDataBoundItems="True" DataSourceID="SqlDataSourceCollType" 
                        DataTextField="Thai Description" DataValueField="Code" 
                        SelectedValue='<%# Bind("Collateral_Type") %>'>
                        <asp:ListItem Value="">N/A</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownListCollateral_Type" runat="server" 
                        AppendDataBoundItems="True" DataSourceID="SqlDataSourceCollType" 
                        DataTextField="Thai Description" DataValueField="Code" 
                        SelectedValue='<%# Bind("Collateral_Type") %>' Enabled="false">
                        <asp:ListItem Value="">N/A</asp:ListItem>
                    </asp:DropDownList>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:DropDownList ID="DropDownListCollateral_Type" runat="server" 
                        AppendDataBoundItems="True" DataSourceID="SqlDataSourceCollType" 
                        DataTextField="Thai Description" DataValueField="Code" 
                        SelectedValue='<%# Bind("Collateral_Type") %>'
                        domId="DropDownListCollateral_Type" Enabled="false">
                        <asp:ListItem Value="">N/A</asp:ListItem>
                    </asp:DropDownList>
                </FooterTemplate>
                <HeaderStyle Wrap="False" />
                <ItemStyle Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Property Type" SortExpression="Property_Type" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownListProperty_Type" runat="server" 
                        AppendDataBoundItems="True" DataSourceID="SqlDataSourceBuildingType" 
                        DataTextField="Description (Thai)" DataValueField="Code" 
                        SelectedValue='<%# Bind("Property_Type") %>'
                        domId="DropDownListProperty_Type">
                        <asp:ListItem Value="">N/A</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownListProperty_Type" runat="server" 
                        AppendDataBoundItems="True" DataSourceID="SqlDataSourceBuildingType" 
                        DataTextField="Description (Thai)" DataValueField="Code" 
                        SelectedValue='<%# Bind("Property_Type") %>' Enabled="false">
                        <asp:ListItem Value="">N/A</asp:ListItem>
                    </asp:DropDownList>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:DropDownList ID="DropDownListProperty_Type" runat="server" 
                        AppendDataBoundItems="True" DataSourceID="SqlDataSourceBuildingType" 
                        DataTextField="Description (Thai)" DataValueField="Code" 
                        SelectedValue='<%# Bind("Property_Type") %>' domId="DropDownListProperty_Type">
                        <asp:ListItem Value="">N/A</asp:ListItem>
                    </asp:DropDownList>
                </FooterTemplate>
                <HeaderStyle Wrap="False" />
                <ItemStyle Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Collateral Description" SortExpression="Collateral_Description" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxCollateral_Description" runat="server" Text='<%# Bind("Collateral_Description") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="LabelCollateral_Description" runat="server" Text='<%# Bind("Collateral_Description") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="TextBoxCollateral_Description_Footer" runat="server" Text='<%# Bind("Collateral_Description") %>'></asp:TextBox>
                </FooterTemplate>
                <HeaderStyle Wrap="False" />
                <ItemStyle Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="District of Property" SortExpression="District_of_Property" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxDistrict_of_Property" runat="server" Text='<%# Bind("District_of_Property") %>' domId="TextBoxDistrict_of_Property"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="LabelDistrict_of_Property" runat="server" Text='<%# Bind("District_of_Property") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="TextBoxDistrict_of_Property_Footer" runat="server" Text='<%# Bind("District_of_Property") %>' domId="TextBoxDistrict_of_Property"></asp:TextBox>
                </FooterTemplate>
                <HeaderStyle Wrap="False" />
                <ItemStyle Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Amphur of Property" SortExpression="Amphur_of_Property" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxAmphur_of_Property" runat="server" Text='<%# Bind("Amphur_of_Property") %>' domId="TextBoxAmphur_of_Property"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="LabelAmphur_of_Property" runat="server" Text='<%# Bind("Amphur_of_Property") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="TextBoxAmphur_of_Property_Footer" runat="server" Text='<%# Bind("Amphur_of_Property") %>' domId="TextBoxAmphur_of_Property"></asp:TextBox>
                </FooterTemplate>
                <HeaderStyle Wrap="False" />
                <ItemStyle Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Province of Property" SortExpression="Province_of_Property" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownListProvince" runat="server" DataSourceID="SqlDataSourcePROVINCE"
                        DataTextField="Prov_Thai" DataValueField="Code" SelectedValue='<%# Bind("Province_of_Property") %>' domId="DropDownListProvince">
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
                        DataTextField="Prov_Thai" DataValueField="Code" SelectedValue='<%# Bind("Province_of_Property") %>' domId="DropDownListProvince">
                    </asp:DropDownList>
                </FooterTemplate>
                <HeaderStyle Wrap="False" />
                <ItemStyle Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Located Country of Property" SortExpression="Located_Country_of_Property" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxLocated_Country_of_Property" runat="server" Text='<%# Bind("Located_Country_of_Property") %>' domId="TextBoxLocated_Country_of_Property"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="LabelLocated_Country_of_Property" runat="server" Text='<%# Bind("Located_Country_of_Property") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="TextBoxLocated_Country_of_Property_Footer" runat="server" Text='<%# Bind("Located_Country_of_Property") %>' domId="TextBoxLocated_Country_of_Property"></asp:TextBox>
                </FooterTemplate>
                <HeaderStyle Wrap="False" />
                <ItemStyle Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Collateral Provider" SortExpression="Collateral_Provider" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxCollateral_Provider" runat="server" Text='<%# Bind("Collateral_Provider") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="LabelCollateral_Provider" runat="server" Text='<%# Bind("Collateral_Provider") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="TextBoxCollateral_Provider_Footer" runat="server" Text='<%# Bind("Collateral_Provider") %>'></asp:TextBox>
                </FooterTemplate>
                <HeaderStyle Wrap="False" />
                <ItemStyle Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Property Under Construction" SortExpression="Property_Under_Construction" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                <EditItemTemplate>
                    <asp:CheckBox ID="CheckBoxProperty_Under_Construction" runat="server" Checked='<%# Bind("Property_Under_Construction") %>' domId="CheckBoxProperty_Under_Construction"/>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBoxProperty_Under_Construction" runat="server" Checked='<%# Bind("Property_Under_Construction") %>'
                        Enabled="false" />
                </ItemTemplate>
                <FooterTemplate>
                    <asp:CheckBox ID="CheckBoxProperty_Under_Construction_Footer" runat="server" Checked='<%# Bind("Property_Under_Construction") %>' domId="CheckBoxProperty_Under_Construction"/>
                </FooterTemplate>
                <HeaderStyle Wrap="False" />
                <ItemStyle Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Leasehold Period" SortExpression="Leasehold_Period" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxLeasehold_Period" runat="server" Text='<%# Bind("Leasehold_Period") %>' IsNumber="Yes" domId="TextBoxLeasehold_Period"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="LabelLeasehold_Period" runat="server" Text='<%# Bind("Leasehold_Period") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="TextBoxLeasehold_Period_Footer" runat="server" Text='<%# Bind("Leasehold_Period") %>' IsNumber="Yes" domId="TextBoxLeasehold_Period"></asp:TextBox>
                </FooterTemplate>
                <HeaderStyle Wrap="False" />
                <ItemStyle Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Leasehold Start Date" SortExpression="Leasehold_Start_Date" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxLeasehold_Start_Date" runat="server" Text='<%# Bind("Leasehold_Start_Date","{0:d MMMM yyyy}") %>' Width="17ex" domId="TextBoxLeasehold_Start_Date"></asp:TextBox>
                    <asp:CalendarExtender ID="TextBoxLeasehold_Start_Date_CalendarExtender" runat="server"
                        Enabled="True" TargetControlID="TextBoxLeasehold_Start_Date" Format="d MMMM yyyy"
                        DaysModeTitleFormat="MMMM yyyy" TodaysDateFormat="d MMMM yyyy">
                    </asp:CalendarExtender>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="LabelLeasehold_Start_Date" runat="server" Text='<%# Bind("Leasehold_Start_Date","{0:d MMMM yyyy}") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="TextBoxLeasehold_Start_Date_Footer" runat="server" Text='<%# Bind("Leasehold_Start_Date","{0:d MMMM yyyy}") %>' Width="17ex" domId="TextBoxLeasehold_Start_Date"></asp:TextBox>
                    <asp:CalendarExtender ID="TextBoxLeasehold_Start_Date_CalendarExtender" runat="server"
                        Enabled="True" TargetControlID="TextBoxLeasehold_Start_Date_Footer" Format="d MMMM yyyy"
                        DaysModeTitleFormat="MMMM yyyy" TodaysDateFormat="d MMMM yyyy">
                    </asp:CalendarExtender>
                </FooterTemplate>
                <HeaderStyle Wrap="False" />
                <ItemStyle Wrap="False" />
            </asp:TemplateField>
        </Columns>
        <EmptyDataTemplate>
            <table>
                <thead style="background-color: #990000; font-weight: bold; color: White;">
                    <tr>
                        <td style="white-space:nowrap;">
                            &nbsp;
                        </td>
                        <td style="white-space:nowrap;">
                            COLL_ID
                        </td>
                        <td style="white-space:nowrap;">
                            PLED_ID
                        </td>
                        <td style="white-space:nowrap;">
                            PLED_SEQ
                        </td>
                        <td style="white-space:nowrap;">
                            APPS_ID
                        </td>
                        <td style="white-space:nowrap;">
                            APPS_DATE
                        </td>
                        <td style="white-space:nowrap;">
                            Collateral_Type
                        </td>
                        <td style="white-space:nowrap;">
                            Property_Type
                        </td>
                        <td style="white-space:nowrap;">
                            Collateral_Description
                        </td>
                        <td style="white-space:nowrap;">
                            District_of_Property
                        </td>
                        <td style="white-space:nowrap;">
                            Amphur_of_Property
                        </td>
                        <td style="white-space:nowrap;">
                            Province_of_Property
                        </td>
                        <td style="white-space:nowrap;">
                            Located_Country_of_Property
                        </td>
                        <td style="white-space:nowrap;">
                            Collateral_Provider
                        </td>
                        <td style="white-space:nowrap;">
                            Property_Under_Construction
                        </td>
                        <td style="white-space:nowrap;">
                            Leasehold_Period
                        </td>
                        <td style="white-space:nowrap;">
                            Leasehold_Start_Date
                        </td>
                    </tr>
                </thead>
                <tr style="background-color: #FFFBD6; color: #333333;">
                    <td style="white-space:nowrap;">
                        <asp:LinkButton ID="Insert_LinkButton" runat="server" CausesValidation="True" CommandName="EmptyDataTemplateInsert"
                            Text="Insert"></asp:LinkButton>
                    </td>
                    <td style="white-space:nowrap;">
                        <asp:TextBox ID="TextBoxCOLL_ID" runat="server" Width="10ex" MaxLength="9" domId="TextBoxCOLL_ID"></asp:TextBox>
                    </td>
                    <td style="white-space:nowrap;">
                        <asp:Label ID="LabelPLED_ID" runat="server" OnPreRender="LabelPLED_ID_PreRender"></asp:Label>
                    </td>
                    <td style="white-space:nowrap;">
                        <asp:Label ID="LabelPLED_SEQ" runat="server" OnPreRender="LabelPLED_SEQ_PreRender"></asp:Label>
                    </td>
                    <td style="white-space:nowrap;">
                        <asp:Label ID="LabelAPPS_ID" runat="server" OnPreRender="LabelAPPS_ID_PreRender"></asp:Label>
                    </td>
                    <td style="white-space:nowrap;">
                        <asp:TextBox ID="TextBoxAPPS_DATE" runat="server" Format="d MMMM yyyy" Width="17ex"></asp:TextBox>
                        <asp:CalendarExtender ID="TextBoxAPPS_DATE_CalendarExtender" runat="server" Enabled="True"
                            TargetControlID="TextBoxAPPS_DATE" Format="d MMMM yyyy" DaysModeTitleFormat="MMMM yyyy"
                            TodaysDateFormat="d MMMM yyyy">
                        </asp:CalendarExtender>
                    </td>
                    <td style="white-space:nowrap;">
                        <asp:DropDownList ID="DropDownListCollateral_Type" runat="server" 
                            AppendDataBoundItems="True" DataSourceID="SqlDataSourceCollType" 
                            DataTextField="Thai Description" DataValueField="Code"
                            domId="DropDownListCollateral_Type" Enabled="false">
                            <asp:ListItem Value="">N/A</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td style="white-space:nowrap;">
                        <asp:DropDownList ID="DropDownListProperty_Type" runat="server" 
                            AppendDataBoundItems="True" DataSourceID="SqlDataSourceBuildingType" 
                            DataTextField="Description (Thai)" DataValueField="Code"
                            domId="DropDownListProperty_Type">
                            <asp:ListItem Value="">N/A</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td style="white-space:nowrap;">
                        <asp:TextBox ID="TextBoxCollateral_Description" runat="server"></asp:TextBox>
                    </td>
                    <td style="white-space:nowrap;">
                        <asp:TextBox ID="TextBoxDistrict_of_Property" runat="server" domId="TextBoxDistrict_of_Property"></asp:TextBox>
                    </td>
                    <td style="white-space:nowrap;">
                        <asp:TextBox ID="TextBoxAmphur_of_Property" runat="server" domId="TextBoxAmphur_of_Property"></asp:TextBox>
                    </td>
                    <td style="white-space:nowrap;">
                        <asp:DropDownList ID="DropDownListProvince" runat="server" DataSourceID="SqlDataSourcePROVINCE"
                            DataTextField="Prov_Thai" DataValueField="Code" domId="DropDownListProvince">
                        </asp:DropDownList>
                    </td>
                    <td style="white-space:nowrap;">
                        <asp:TextBox ID="TextBoxLocated_Country_of_Property" runat="server" domId="TextBoxLocated_Country_of_Property"></asp:TextBox>
                    </td>
                    <td style="white-space:nowrap;">
                        <asp:TextBox ID="TextBoxCollateral_Provider" runat="server"></asp:TextBox>
                    </td>
                    <td style="white-space:nowrap;">
                        <asp:CheckBox ID="Property_Under_Construction_CheckBox" runat="server" Checked="false" domId="CheckBoxProperty_Under_Construction"/>
                    </td>
                    <td style="white-space:nowrap;">
                        <asp:TextBox ID="TextBoxLeasehold_Period" runat="server" IsNumber="Yes" domId="TextBoxLeasehold_Period"></asp:TextBox>
                    </td>
                    <td style="white-space:nowrap;">
                        <asp:TextBox ID="TextBoxLeasehold_Start_Date" runat="server" Format="d MMMM yyyy" Width="17ex" domId="TextBoxLeasehold_Start_Date"></asp:TextBox>
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
        <PagerSettings Mode="NumericFirstLast" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Left" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
    </asp:GridView>
    </asp:Panel>
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
        UpdateCommand="COLLATERAL_INFORMATION_UPDATE" UpdateCommandType="StoredProcedure"
        DeleteCommand="COLLATERAL_INFORMATION_DELETE" DeleteCommandType="StoredProcedure">
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
        <DeleteParameters>
            <asp:Parameter Name="COLL_ID" Type="String" />
            <asp:Parameter Name="PLED_ID" Type="String" />
            <asp:Parameter Name="PLED_SEQ" Type="Int16" />
            <asp:Parameter Name="APPS_ID" Type="String" />
        </DeleteParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceCollType" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>" 
        EnableCaching="True" SelectCommand="P_L_COLLATERAL_TYPE_SELECT" 
        SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceBuildingType" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>" 
        EnableCaching="True" SelectCommand="P_L_BUILDING_TYPE_SELECT" 
        SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>
