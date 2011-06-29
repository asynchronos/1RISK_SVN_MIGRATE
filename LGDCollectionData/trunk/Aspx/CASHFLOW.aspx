<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="CASHFLOW.aspx.cs" Inherits="LGDCollectionData.Aspx.CASHFLOW" UICulture="Auto"
    Culture="Auto" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register src="../UserControls/SelectFormWebUserControl.ascx" tagname="SelectFormWebUserControl" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <!-- Ext includes -->
    <link rel="stylesheet" type="text/css" href="../ExtJS/resources/css/ext-all.css" />
    <script type="text/javascript" src="../ExtJS/adapter/ext/ext-base.js"></script>
    <script type="text/javascript" src="../ExtJS/ext-all.js"></script>
    <script type="text/javascript" src="../Scripts/CommonExt.js"></script>
    <script type="text/javascript" src="../Scripts/common.js"></script>

    <script type="text/javascript">
        Ext.onReady(function () {
            Ext.select("input[type=text]").setWidth("200px");
            Ext.select("input[type=text]").set({ "maxlength": "255" });

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

            var cashFlowSourceDescription1DDL = Ext.DotNetControl.Element.mapElement("select", "domId", "CashFlowSourceDescription1_DropDownList");
            var cashFlowSourceDescription2DDL = Ext.DotNetControl.Element.mapElement("select", "domId", "CashFlowSourceDescription2_DropDownList");
            var cashFlowSourceDescription3DDL = Ext.DotNetControl.Element.mapElement("select", "domId", "CashFlowSourceDescription3_DropDownList");

            var writtenoffOrHaircutAmountTextBox = Ext.DotNetControl.Element.mapElement("input", "domId", "WrittenoffOrHaircutAmount_TextBox");
            var collateralIDTextBox = Ext.DotNetControl.Element.mapElement("input", "domId", "CollateralID_TextBox");

            var limitNoChangedCheckBox = Ext.DotNetControl.CheckBox.mapElement("domId", "LIMITNOChanged_CheckBox");
            var previousLimitNoComboBox = Ext.DotNetControl.ComboBox.mapElement("domId", "PreviousLIMITNO_ComboBox");

            //Element list
            var cashFlowSourceDDLList = new Ext.CompositeElement().add([
                cashFlowSourceDescription1DDL.element,
                cashFlowSourceDescription2DDL.element,
                cashFlowSourceDescription3DDL.element
            ]);

            cashFlowSourceDDLList.on({
                "change": function (e, t, o) {
                    //find next index of this element
                    var nextIndex = 0;
                    for (var i = 0; i < o.srcElement.getCount(); i++) {
                        if (t.id == o.srcElement.item(i).dom.id) {
                            nextIndex = i + 1;
                            break;
                        }
                    }

                    //disable next dropdown if this dropdown index = 0
                    if (nextIndex < o.srcElement.getCount()) {
                        if (t.selectedIndex == 0) {
                            for (var i = nextIndex; i < o.srcElement.getCount(); i++) {
                                o.srcElement.item(i).dom.selectedIndex = 0;
                                o.srcElement.item(i).dom.disabled = true;
                            }
                        } else {
                            o.srcElement.item(nextIndex).dom.disabled = false;
                        }
                    }

                    var notIndex0Count = 0;
                    var writeenOffDisable = true;
                    var collateralDisable = true;

                    for (var i = 0; i < o.srcElement.getCount(); i++) {
                        if (o.srcElement.item(i).dom.selectedIndex != 0) {
                            notIndex0Count = notIndex0Count + 1;

                            if (o.srcElement.item(i).dom.selectedIndex == 10
                            || o.srcElement.item(i).dom.selectedIndex == 11) {
                                writeenOffDisable = false;
                            }

                            if (o.srcElement.item(i).dom.selectedIndex == 2
                            || o.srcElement.item(i).dom.selectedIndex == 3
                            || o.srcElement.item(i).dom.selectedIndex == 4) {
                                collateralDisable = false;
                            }
                        }
                    }

                    if (notIndex0Count > 1)
                        o.targetElement.WrittenoffOrHaircutAmountTextBox.disabled(writeenOffDisable);
                    else
                        o.targetElement.WrittenoffOrHaircutAmountTextBox.disabled(true);
                    o.targetElement.CollateralIDTextBox.disabled(collateralDisable);
                },
                scope: this,
                srcElement: cashFlowSourceDDLList,
                targetElement: { "WrittenoffOrHaircutAmountTextBox": writtenoffOrHaircutAmountTextBox, "CollateralIDTextBox": collateralIDTextBox }
            });

            //limit no checkbox
            limitNoChangedCheckBox.element.on({
                "click": function (e, t, o) {
                    if (t.checked) {
                        o.targetElement.PreviousLimitNoComboBox.disabled(false);
                    } else {
                        o.targetElement.PreviousLimitNoComboBox.disabled(true);
                    }
                },
                scope: this,
                targetElement: { "PreviousLimitNoComboBox": previousLimitNoComboBox }
            });

            //init section

            ////cascade dropdown
            if (cashFlowSourceDescription1DDL) {
                var notIndex0Count = 0;
                var writeenOffDisable = true;
                var collateralDisable = true;

                for (var i = 0; i < cashFlowSourceDDLList.getCount() - 1; i++) {
                    if (cashFlowSourceDDLList.item(i).dom.selectedIndex == 0) {
                        cashFlowSourceDDLList.item(i + 1).dom.disabled = true;
                    }
                }

                for (var i = 0; i < cashFlowSourceDDLList.getCount(); i++) {
                    if (cashFlowSourceDDLList.item(i).dom.selectedIndex != 0) {
                        notIndex0Count = notIndex0Count + 1;

                        if (cashFlowSourceDDLList.item(i).dom.selectedIndex == 10
                            || cashFlowSourceDDLList.item(i).dom.selectedIndex == 11) {
                            writeenOffDisable = false;
                        }

                        if (cashFlowSourceDDLList.item(i).dom.selectedIndex == 2
                            || cashFlowSourceDDLList.item(i).dom.selectedIndex == 3
                            || cashFlowSourceDDLList.item(i).dom.selectedIndex == 4) {
                            collateralDisable = false;
                        }
                    }
                }

                if (notIndex0Count > 1)
                    writtenoffOrHaircutAmountTextBox.disabled(writeenOffDisable);
                else
                    writtenoffOrHaircutAmountTextBox.disabled(true);
                collateralIDTextBox.disabled(collateralDisable);
            }

            ////limit no checkbox
            if (limitNoChangedCheckBox.element.dom.checked) {
                previousLimitNoComboBox.disabled(false);
            } else {
                previousLimitNoComboBox.disabled(true);
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
        <asp:Label ID="FormName_Label" runat="server" Text="CASHFLOW"></asp:Label>
    </h2>
    <asp:DetailsView ID="CASHFLOW_DetailsView" runat="server" AllowPaging="True" AutoGenerateRows="False"
        CellPadding="4" DataKeyNames="CIF,DefaultDate,LIMITNO,DateofCashflow" DataSourceID="CASHFLOW_DATASOURCE"
        DefaultMode="Edit" EnableModelValidation="True" ForeColor="#333333" OnPageIndexChanging="DetailsView_PageIndexChanging"
        OnItemUpdating="DetailsView_ItemUpdating">
        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
        <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
        <Fields>
            <asp:TemplateField HeaderText="CIF" SortExpression="CIF" HeaderStyle-Width="35%">
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
            <asp:TemplateField HeaderText="Default Date" SortExpression="DefaultDate">
                <EditItemTemplate>
                    <asp:Label ID="DefaultDate_Label" runat="server" 
                        Text='<%# Eval("DefaultDate", "{0:d MMMM yyyy}") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="DefaultDate_TextBox" runat="server" 
                        Text='<%# Bind("DefaultDate", "{0:d MMMM yyyy}") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="DefaultDate_Label" runat="server" 
                        Text='<%# Bind("DefaultDate", "{0:d MMMM yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="LIMITNO" SortExpression="LIMITNO">
                <EditItemTemplate>
                    <asp:Label ID="LIMITNO_Label" runat="server" Text='<%# Eval("LIMITNO") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="LIMITNO_TextBox" runat="server" Text='<%# Bind("LIMITNO") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="LIMITNO_Label" runat="server" Text='<%# Bind("LIMITNO") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="APP_ID" SortExpression="APP_ID">
                <EditItemTemplate>
                    <asp:DropDownList ID="APP_ID_DropDownList" runat="server" DataSourceID="APP_ID_DataSource"
                        DataTextField="APP_ID" DataValueField="APP_ID" SelectedValue='<%# Bind("APP_ID") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="APP_ID_TextBox" runat="server" Text='<%# Bind("APP_ID") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="APP_ID_Label" runat="server" Text='<%# Bind("APP_ID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Cashflow Currency" SortExpression="CashflowCurrencyCode">
                <EditItemTemplate>
                    <asp:DropDownList ID="Currency_DropDownList" runat="server" DataSourceID="Currency_DataSource"
                        DataTextField="Description" DataValueField="Code" SelectedValue='<%# Bind("CashflowCurrencyCode") %>'>
                    </asp:DropDownList>
                    <span style="color:Red">*</span>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="CashflowCurrencyCode_TextBox" runat="server" Text='<%# Bind("CashflowCurrencyCode") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="CashflowCurrencyCode_Label" runat="server" Text='<%# Bind("CashflowCurrencyCode") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Date of Cashflow" 
                SortExpression="DateofCashflow">
                <EditItemTemplate>
                    <asp:Label ID="DateofCashflow_Label" runat="server" 
                        Text='<%# Eval("DateofCashflow", "{0:d MMMM yyyy}") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="DateofCashflow_TextBox" runat="server" 
                        Text='<%# Bind("DateofCashflow", "{0:d MMMM yyyy}") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="DateofCashflow_Label" runat="server" 
                        Text='<%# Bind("DateofCashflow", "{0:d MMMM yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Cashflow Amount: PAY_PRIN" SortExpression="CashflowAmountPAY_PRIN">
                <EditItemTemplate>
                    <asp:TextBox ID="DateofCashflow_TextBox" runat="server" Text='<%# Bind("CashflowAmountPAY_PRIN","{0:#,##0.00}") %>' IsNumeric="Yes"></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="DateofCashflow_TextBox" runat="server" Text='<%# Bind("CashflowAmountPAY_PRIN","{0:#,##0.00}") %>' IsNumeric="Yes"></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="DateofCashflow_Label" runat="server" Text='<%# Bind("CashflowAmountPAY_PRIN","{0:#,##0.00}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Cashflow Amount: PAY_INT" SortExpression="CashflowAmountPAY_INT">
                <EditItemTemplate>
                    <asp:TextBox ID="CashflowAmountPAY_INT_TextBox" runat="server" Text='<%# Bind("CashflowAmountPAY_INT","{0:#,##0.00}") %>' IsNumeric="Yes"></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="CashflowAmountPAY_INT_TextBox" runat="server" Text='<%# Bind("CashflowAmountPAY_INT","{0:#,##0.00}") %>' IsNumeric="Yes"></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="CashflowAmountPAY_INT_Label" runat="server" Text='<%# Bind("CashflowAmountPAY_INT","{0:#,##0.00}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Cashflow Amount: PAY_SUSP" SortExpression="CashflowAmountPAY_SUSP">
                <EditItemTemplate>
                    <asp:TextBox ID="CashflowAmountPAY_SUSP_TextBox" runat="server" Text='<%# Bind("CashflowAmountPAY_SUSP","{0:#,##0.00}") %>' IsNumeric="Yes"></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="CashflowAmountPAY_SUSP_TextBox" runat="server" Text='<%# Bind("CashflowAmountPAY_SUSP","{0:#,##0.00}") %>' IsNumeric="Yes"></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="CashflowAmountPAY_SUSP_Label" runat="server" Text='<%# Bind("CashflowAmountPAY_SUSP","{0:#,##0.00}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Cash Flow Source Description 1" SortExpression="CashFlowSourceDescription1">
                <EditItemTemplate>
                    <asp:DropDownList ID="CashFlowSourceDescription1_DropDownList" runat="server" SelectedValue='<%# Bind("CashFlowSourceDescription1") %>' domId="CashFlowSourceDescription1_DropDownList">
                        <asp:ListItem Value="">Please Select</asp:ListItem>
                        <asp:ListItem>Repayment from borrower</asp:ListItem>
                        <asp:ListItem>Repayment from guarantor</asp:ListItem>
                        <asp:ListItem>Voluntary transfer collaterals to the bank</asp:ListItem>
                        <asp:ListItem>Property foreclosure through court</asp:ListItem>
                        <asp:ListItem>Debt / equity swap</asp:ListItem>
                        <asp:ListItem>Loan sale</asp:ListItem>
                        <asp:ListItem>Refinance from other financial institution</asp:ListItem>
                        <asp:ListItem>Compensated from deposit account</asp:ListItem>
                        <asp:ListItem>Adjusting entry</asp:ListItem>
                        <asp:ListItem>Written-off</asp:ListItem>
                        <asp:ListItem>Haircut</asp:ListItem>
                        <asp:ListItem>selling out the collateral / assets of borrower or guarantor by publish auction with Third party or Debtor</asp:ListItem>
                    </asp:DropDownList>
                    <span style="color:Red">*</span>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="CashFlowSourceDescription1_TextBox" runat="server" Text='<%# Bind("CashFlowSourceDescription1") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="CashFlowSourceDescription1_Label" runat="server" Text='<%# Bind("CashFlowSourceDescription1") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Cash Flow Source Description 2" SortExpression="CashFlowSourceDescription2">
                <EditItemTemplate>
                    <asp:DropDownList ID="CashFlowSourceDescription2_DropDownList" runat="server" SelectedValue='<%# Bind("CashFlowSourceDescription2") %>' domId="CashFlowSourceDescription2_DropDownList">
                        <asp:ListItem Value="">Please Select</asp:ListItem>
                        <asp:ListItem>Repayment from borrower</asp:ListItem>
                        <asp:ListItem>Repayment from guarantor</asp:ListItem>
                        <asp:ListItem>Voluntary transfer collaterals to the bank</asp:ListItem>
                        <asp:ListItem>Property foreclosure through court</asp:ListItem>
                        <asp:ListItem>Debt / equity swap</asp:ListItem>
                        <asp:ListItem>Loan sale</asp:ListItem>
                        <asp:ListItem>Refinance from other financial institution</asp:ListItem>
                        <asp:ListItem>Compensated from deposit account</asp:ListItem>
                        <asp:ListItem>Adjusting entry</asp:ListItem>
                        <asp:ListItem>Written-off</asp:ListItem>
                        <asp:ListItem>Haircut</asp:ListItem>
                        <asp:ListItem>selling out the collateral / assets of borrower or guarantor by publish auction with Third party or Debtor</asp:ListItem>
                    </asp:DropDownList>
                    <span style="color:Red">*</span>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="CashFlowSourceDescription2_TextBox" runat="server" Text='<%# Bind("CashFlowSourceDescription2") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="CashFlowSourceDescription2_Label" runat="server" Text='<%# Bind("CashFlowSourceDescription2") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Cash Flow Source Description 3" SortExpression="CashFlowSourceDescription3">
                <EditItemTemplate>
                    <asp:DropDownList ID="CashFlowSourceDescription3_DropDownList" runat="server" SelectedValue='<%# Bind("CashFlowSourceDescription3") %>' domId="CashFlowSourceDescription3_DropDownList">
                        <asp:ListItem Value="">Please Select</asp:ListItem>
                        <asp:ListItem>Repayment from borrower</asp:ListItem>
                        <asp:ListItem>Repayment from guarantor</asp:ListItem>
                        <asp:ListItem>Voluntary transfer collaterals to the bank</asp:ListItem>
                        <asp:ListItem>Property foreclosure through court</asp:ListItem>
                        <asp:ListItem>Debt / equity swap</asp:ListItem>
                        <asp:ListItem>Loan sale</asp:ListItem>
                        <asp:ListItem>Refinance from other financial institution</asp:ListItem>
                        <asp:ListItem>Compensated from deposit account</asp:ListItem>
                        <asp:ListItem>Adjusting entry</asp:ListItem>
                        <asp:ListItem>Written-off</asp:ListItem>
                        <asp:ListItem>Haircut</asp:ListItem>
                        <asp:ListItem>selling out the collateral / assets of borrower or guarantor by publish auction with Third party or Debtor</asp:ListItem>
                    </asp:DropDownList>
                    <span style="color:Red">*</span>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="CashFlowSourceDescription3_TextBox" runat="server" Text='<%# Bind("CashFlowSourceDescription3") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="CashFlowSourceDescription3_Label" runat="server" Text='<%# Bind("CashFlowSourceDescription3") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Written-off / Haircut Amount" SortExpression="WrittenoffOrHaircutAmount">
                <EditItemTemplate>
                    <asp:TextBox ID="WrittenoffOrHaircutAmount_TextBox" runat="server" Text='<%# Bind("WrittenoffOrHaircutAmount","{0:#,##0.00}") %>' domId="WrittenoffOrHaircutAmount_TextBox" IsNumeric="Yes"></asp:TextBox>
                    <span style="color:Red">*</span>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="WrittenoffOrHaircutAmount_TextBox" runat="server" Text='<%# Bind("WrittenoffOrHaircutAmount","{0:#,##0.00}") %>' IsNumeric="Yes"></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="WrittenoffOrHaircutAmount_Label" runat="server" Text='<%# Bind("WrittenoffOrHaircutAmount","{0:#,##0.00}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Collateral ID/Pledge ID" 
                SortExpression="CollateralID">
                <EditItemTemplate>
                    <asp:TextBox ID="CollateralID_TextBox" runat="server" Text='<%# Bind("CollateralID","{0:#,##0.00}") %>' domId="CollateralID_TextBox"></asp:TextBox>
                    <span style="color:Red">*</span>
                    (*Please enter &quot;N/A&quot; if not applicable)
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="CollateralID_TextBox" runat="server" Text='<%# Bind("CollateralID","{0:#,##0.00}") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="CollateralID_Label" runat="server" Text='<%# Bind("CollateralID","{0:#,##0.00}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="LIMITNO Changed" SortExpression="LIMITNOChanged">
                <EditItemTemplate>
                    <asp:CheckBox ID="LIMITNOChanged_CheckBox" runat="server" Checked='<%# Bind("LIMITNOChanged") %>' domId="LIMITNOChanged_CheckBox" Enabled="false"/>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:CheckBox ID="LIMITNOChanged_CheckBox" runat="server" Checked='<%# Bind("LIMITNOChanged") %>' />
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="LIMITNOChanged_CheckBox" runat="server" Checked='<%# Bind("LIMITNOChanged") %>'
                        Enabled="false" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Previous LIMITNO" SortExpression="PreviousLIMITNO">
                <EditItemTemplate>
                    <asp:ComboBox ID="PreviousLIMITNO_ComboBox" runat="server" AutoCompleteMode="SuggestAppend"
                        DataSourceID="PreviousLimitNo_DataSource" DataTextField="LIMITNO" DataValueField="LIMITNO"
                        DropDownStyle="DropDownList" MaxLength="0" Style="display: inline;" AppendDataBoundItems="true"
                        SelectedValue='<%# Bind("PreviousLIMITNO") %>' domId="PreviousLIMITNO_ComboBox">
                        <asp:ListItem Value="">Please Select</asp:ListItem>
                        <asp:ListItem Value="N/A">N/A</asp:ListItem>
                    </asp:ComboBox>
                    <span style="color:Red">*</span>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="PreviousLIMITNO_TextBox" runat="server" Text='<%# Bind("PreviousLIMITNO") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="PreviousLIMITNO_Label" runat="server" Text='<%# Bind("PreviousLIMITNO") %>'></asp:Label>
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
    <asp:SqlDataSource ID="CASHFLOW_DataSource" runat="server" ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>"
        SelectCommand="P_CASHFLOW_SELECT" SelectCommandType="StoredProcedure" UpdateCommand="P_CASHFLOW_UPDATE"
        UpdateCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter Name="CIF" QueryStringField="cif" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="CIF" Type="String" />
            <asp:Parameter Name="DefaultDate" Type="DateTime" />
            <asp:Parameter Name="LIMITNO" Type="String" />
            <asp:Parameter Name="APP_ID" Type="String" />
            <asp:Parameter Name="CashflowCurrencyCode" Type="String" />
            <asp:Parameter Name="DateofCashflow" Type="DateTime" />
            <asp:Parameter Name="CashflowAmountPAY_PRIN" Type="Double" />
            <asp:Parameter Name="CashflowAmountPAY_INT" Type="Double" />
            <asp:Parameter Name="CashflowAmountPAY_SUSP" Type="Double" />
            <asp:Parameter Name="CashFlowSourceDescription1" Type="String" />
            <asp:Parameter Name="CashFlowSourceDescription2" Type="String" />
            <asp:Parameter Name="CashFlowSourceDescription3" Type="String" />
            <asp:Parameter Name="WrittenoffOrHaircutAmount" Type="Double" />
            <asp:Parameter Name="CollateralID" Type="String" />
            <asp:Parameter Name="LIMITNOChanged" Type="Boolean" />
            <asp:Parameter Name="PreviousLIMITNO" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="APP_ID_DataSource" runat="server" EnableCaching="True" ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>"
        SelectCommand="L_APP_ID_SELECT" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource ID="Currency_DataSource" runat="server" EnableCaching="True" ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>"
        SelectCommand="L_CURRENCY_CODE_SELECT" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource ID="PreviousLimitNo_DataSource" runat="server" ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>"
        SelectCommand="P_LIMITNO_IN_FACILITY_INFORMATION_BY_CIF" SelectCommandType="StoredProcedure"
        EnableCaching="false">
        <SelectParameters>
            <asp:QueryStringParameter Name="CIF" QueryStringField="cif" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>