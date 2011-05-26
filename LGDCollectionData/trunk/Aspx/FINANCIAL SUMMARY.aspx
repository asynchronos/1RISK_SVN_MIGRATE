<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="FINANCIAL SUMMARY.aspx.cs" Inherits="LGDCollectionData.Aspx.FINANCIAL_SUMMARY"
    Culture="en-US" UICulture="en-US" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="../UserControls/SelectFormWebUserControl.ascx" TagName="SelectFormWebUserControl"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript">
        function popupAlert(msg) {
            alert(msg);
        }
    </script>
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

            var dataNotAvailableCheckBox = Ext.DotNetControl.CheckBox.mapElement("domId", "DATA_NOT_AVAILABLE_CheckBox");
            var financialCurrencyCodeDDL = Ext.DotNetControl.Element.mapElement("select", "domId", "Financial_Currency_Code_DropDownList");
            var totalAssetsTextBox = Ext.DotNetControl.Element.mapElement("input", "domId", "Total_Assets_TextBox");
            var totalLiabilitiesTextBox = Ext.DotNetControl.Element.mapElement("input", "domId", "Total_Liabilities_TextBox");
            var totalRevenueTextBox = Ext.DotNetControl.Element.mapElement("input", "domId", "Total_Revenue_TextBox");

            //dataNotAvailableCheckBox
            dataNotAvailableCheckBox.element.on({
                "click": function (e, t, o) {
                    if (t.checked) {
                        o.targetElement.FinancialCurrencyCodeDDL.disabled(true);
                        o.targetElement.TotalAssetsTextBox.disabled(true);
                        o.targetElement.TotalLiabilitiesTextBox.disabled(true);
                        o.targetElement.TotalRevenueTextBox.disabled(true);
                    } else {
                        o.targetElement.FinancialCurrencyCodeDDL.disabled(false);
                        o.targetElement.TotalAssetsTextBox.disabled(false);
                        o.targetElement.TotalLiabilitiesTextBox.disabled(false);
                        o.targetElement.TotalRevenueTextBox.disabled(false);
                    }
                },
                scope: this,
                targetElement: { "FinancialCurrencyCodeDDL": financialCurrencyCodeDDL,
                    "TotalAssetsTextBox": totalAssetsTextBox,
                    "TotalLiabilitiesTextBox": totalLiabilitiesTextBox,
                    "TotalRevenueTextBox": totalRevenueTextBox }
            });

            //init section
            ////dataNotAvailableCheckBox
            if (dataNotAvailableCheckBox.element.dom.checked) {
                financialCurrencyCodeDDL.disabled(true);
                totalAssetsTextBox.disabled(true);
                totalLiabilitiesTextBox.disabled(true);
                totalRevenueTextBox.disabled(true);
            } else {
                financialCurrencyCodeDDL.disabled(false);
                totalAssetsTextBox.disabled(false);
                totalLiabilitiesTextBox.disabled(false);
                totalRevenueTextBox.disabled(false);
            }
            //end init section
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" EnableScriptGlobalization="true">
    </asp:ToolkitScriptManager>
    <uc1:SelectFormWebUserControl ID="SelectFormWebUserControl1" runat="server" />
    <h2>
        <asp:Label ID="FormName_Label" runat="server" Text="FINANCIAL SUMMARY"></asp:Label>
    </h2>
    <asp:SqlDataSource ID="Financial_Summary_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>"
        SelectCommand="FINANCIAL_SUMMARY_SELECT" 
        SelectCommandType="StoredProcedure" UpdateCommand="FINANCIAL_SUMMARY_UPDATE" 
        UpdateCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter Name="CIF" QueryStringField="CIF" Type="String" />
        </SelectParameters>
        
        <UpdateParameters>
            <asp:Parameter Name="CIF" Type="String" />
            <asp:Parameter Name="Default_Date" Type="DateTime" />
            <asp:Parameter Name="Financial_Data_Date" Type="DateTime" />
            <asp:Parameter Name="Total_Assets" Type="Decimal" />
            <asp:Parameter Name="Total_Liabilities" Type="Decimal" />
            <asp:Parameter Name="Total_Revenue" Type="Decimal" />
            <asp:Parameter Name="Financial_Currency_Code" Type="String" />
            <asp:Parameter Name="DATA_NOT_AVAILABLE" Type="Boolean" />
            <asp:Parameter Name="UpdateUser" Type="String" />
            <asp:Parameter Name="updateDate" Type="DateTime" />
        </UpdateParameters>
        
    </asp:SqlDataSource>
    <asp:DetailsView ID="Financial_Summary_DetailsView" runat="server" AllowPaging="True"
        AutoGenerateRows="False" DataKeyNames="CIF,Default_Date" DataSourceID="Financial_Summary_SqlDataSource"
        EnableModelValidation="True" DefaultMode="Edit" CellPadding="4" ForeColor="#333333"    
        OnPageIndexChanging="DetailsView_PageIndexChanging" OnItemUpdating="DetailsView_ItemUpdating" >
        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
        <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="CIF" HeaderText="CIF" ReadOnly="True" SortExpression="CIF" />
            <asp:BoundField DataField="Default_Date" HeaderText="Default Date" DataFormatString="{0:d MMMM yyyy}"
                ReadOnly="True" SortExpression="Default_Date" />
            <asp:TemplateField HeaderText="Financial Data Date" SortExpression="Financial_Data_Date">
                <EditItemTemplate>
                    <asp:Label ID="Financial_Data_Date_Label" runat="server" Text='<%# Bind("Financial_Data_Date","{0:d MMMM yyyy}") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="Financial_Data_Date_TextBox" runat="server" Text='<%# Bind("Financial_Data_Date") %>'></asp:TextBox>
                    <asp:CalendarExtender ID="Financial_Data_Date_TextBox_CalendarExtender" runat="server"
                        TargetControlID="TextBoxFinancial_Data_Date" Format="d MMMM yyyy" DaysModeTitleFormat="MMMM yyyy"
                        TodaysDateFormat="d MMMM yyyy">
                    </asp:CalendarExtender>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Financial_Data_Date_Label" runat="server" Text='<%# Bind("Financial_Data_Date","{0:d MMMM yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Data Not Available" SortExpression="DATA_NOT_AVAILABLE">
                <EditItemTemplate>
                    <asp:CheckBox ID="DATA_NOT_AVAILABLE_CheckBox" runat="server" Checked='<%# Bind("DATA_NOT_AVAILABLE") %>' domId="DATA_NOT_AVAILABLE_CheckBox"/>
                    <span style="color: Red">*</span>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:CheckBox ID="DATA_NOT_AVAILABLE_CheckBox" runat="server" Checked='<%# Bind("DATA_NOT_AVAILABLE") %>' domId="DATA_NOT_AVAILABLE_CheckBox"/>
                    <span style="color: Red">*</span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="DATA_NOT_AVAILABLE_CheckBox" runat="server" Checked='<%# Bind("DATA_NOT_AVAILABLE") %>' Enabled="false" domId="DATA_NOT_AVAILABLE_CheckBox"/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Financial Currency Code" SortExpression="Financial_Currency_Code">
                <EditItemTemplate>
                    <asp:DropDownList ID="Financial_Currency_Code_DropDownList" runat="server" DataSourceID="SqlDataSourceCurrentcy"
                        DataTextField="Description" DataValueField="Code" SelectedValue='<%# Bind("Financial_Currency_Code")%>' domId="Financial_Currency_Code_DropDownList">
                    </asp:DropDownList>
                    <span style="color: Red">*</span>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="Financial_Currency_Code_DropDownList" runat="server" DataSourceID="SqlDataSourceCurrentcy"
                        DataTextField="Description" DataValueField="Code" SelectedValue='<%# Bind("Financial_Currency_Code")%>' domId="Financial_Currency_Code_DropDownList">
                    </asp:DropDownList>
                    <span style="color: Red">*</span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Financial_Currency_Code_Label" runat="server" Text='<%# Bind("Financial_Currency_Code") %>' domId="Financial_Currency_Code_Label"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Total Assets(in thousand)" SortExpression="Total_Assets">
                <EditItemTemplate>
                    <asp:TextBox ID="Total_Assets_TextBox" runat="server" Text='<%# Bind("Total_Assets","{0:#,##0.##}") %>'
                        Style="text-align: right;" IsNumeric="Yes" domId="Total_Assets_TextBox"></asp:TextBox>
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please input Total Assets" Text="*" ControlToValidate="TextBox2" ValidationGroup="UpdateValidation"></asp:RequiredFieldValidator>--%>
                    <span style="color: Red">*</span>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="Total_Assets_TextBox" runat="server" Text='<%# Bind("Total_Assets","{0:#,##0.##}") %>'
                        Style="text-align: right;" IsNumeric="Yes" domId="Total_Assets_TextBox"></asp:TextBox>
                    <span style="color: Red">*</span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Total_Assets_Label" runat="server" Text='<%# Bind("Total_Assets","{0:#,##0.##}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Total Liabilities(in thousand)" SortExpression="Total_Liabilities">
                <EditItemTemplate>
                    <asp:TextBox ID="Total_Liabilities_TextBox" runat="server" Text='<%# Bind("Total_Liabilities","{0:#,##0.##}") %>'
                        Style="text-align: right;" IsNumeric="Yes" domId="Total_Liabilities_TextBox"></asp:TextBox>
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please input Total Liabilities" Text="*" ControlToValidate="TextBox3" ValidationGroup="UpdateValidation"></asp:RequiredFieldValidator>--%>
                    <span style="color: Red">*</span>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="Total_Liabilities_TextBox" runat="server" Text='<%# Bind("Total_Liabilities","{0:#,##0.##}") %>'
                        Style="text-align: right;" IsNumeric="Yes" domId="Total_Liabilities_TextBox"></asp:TextBox>
                    <span style="color: Red">*</span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Total_Liabilities_Label" runat="server" Text='<%# Bind("Total_Liabilities","{0:#,##0.##}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Total Revenue(in thousand)" SortExpression="Total_Revenue">
                <EditItemTemplate>
                    <asp:TextBox ID="Total_Revenue_TextBox" runat="server" Text='<%# Bind("Total_Revenue","{0:#,##0.##}") %>'
                        Style="text-align: right;" IsNumeric="Yes" domId="Total_Revenue_TextBox"></asp:TextBox>
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please input Total Revenue" Text="*" ControlToValidate="TextBox4" ValidationGroup="UpdateValidation"></asp:RequiredFieldValidator>--%>
                    <span style="color: Red">*</span>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="Total_Revenue_TextBox" runat="server" Text='<%# Bind("Total_Revenue","{0:#,##0.##}") %>'
                        Style="text-align: right;" IsNumeric="Yes" domId="Total_Revenue_TextBox"></asp:TextBox>
                    <span style="color: Red">*</span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="LabelTotal_Revenue" runat="server" Text='<%# Bind("Total_Revenue","{0:#,##0.##}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Update User" SortExpression="UpdateUser">
                <EditItemTemplate>
                    <asp:Label ID="UpdateUser_Label" runat="server" Text='<%# Bind("UpdateUser") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="UpdateUser_TextBox" runat="server" Text='<%# Bind("UpdateUser") %>'></asp:TextBox>
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
                    <asp:TextBox ID="UpdateDate_TextBox" runat="server" Text='<%# Bind("UpdateDate","{0:d MMMM yyyy}") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="UpdateDate_Label" runat="server" Text='<%# Bind("UpdateDate","{0:d MMMM yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <%--                    <asp:LinkButton ID="LinkButton1" runat="server" OnClientClick="if(confirm('Are you sure to update this item?') == false){return false;}"
CausesValidation="False" CommandName="Update" Text="Update"></asp:LinkButton>--%>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="true" CommandName="Update"
                        Text="Update" ValidationGroup="UpdateValidation"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                        Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Insert"
                        Text="Insert"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                        Text="Cancel"></asp:LinkButton>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"
                        Text="Edit"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="New"
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
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="true"
        ValidationGroup="UpdateValidation" ShowSummary="False" />
    <asp:SqlDataSource ID="SqlDataSourceCurrentcy" runat="server" ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>"
        SelectCommand="L_CURRENCY_CODE_SELECT" EnableCaching="True" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
</asp:Content>
