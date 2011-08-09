<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GUARANTOR_INFORMATION.aspx.cs" Inherits="LGDCollectionData.Aspx.GUARANTOR_INFORMATION" Culture="en-US" UICulture="en-US" %>
<%@ Register src="../UserControls/SelectFormWebUserControl.ascx" tagname="SelectFormWebUserControl" tagprefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
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

            var Pledge_to_All_Facilities_CheckBox = Ext.DotNetControl.CheckBox.mapElement("domId", "Pledge_to_All_Facilities_CheckBox");
            var TextBoxFacility_Pledged = Ext.DotNetControl.Element.mapElement("input", "domId", "TextBoxFacility_Pledged");


            Pledge_to_All_Facilities_CheckBox.element.on({
                "click": function (e, t, o) {
                    if (t.checked) {
                        o.targetElement.TextBoxFacility_Pledged.element.dom.value ='';
                        o.targetElement.TextBoxFacility_Pledged.disabled(true);

                    } else {
                        o.targetElement.TextBoxFacility_Pledged.disabled(false);

                    }
                },
                scope: this,
                targetElement: { "TextBoxFacility_Pledged": TextBoxFacility_Pledged }
            });

            //init Pledge_to_All_Facilities_CheckBox
            if (Pledge_to_All_Facilities_CheckBox.element.dom.checked) {
                TextBoxFacility_Pledged.disabled(true);
            } else {
                TextBoxFacility_Pledged.disabled(false);
            }
            //end init Pledge_to_All_Facilities_CheckBox

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
        });
    </script>
<script type="text/javascript">
    function popupAlert(msg) {
        alert(msg);
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <uc1:SelectFormWebUserControl ID="SelectFormWebUserControl1" runat="server" EnableScriptGlobalization="true" />
    <h2>
        <asp:Label ID="FormName_Label" runat="server" Text="GUARANTOR INFORMATION"></asp:Label>
    </h2>
<table>
    <tr>
        <td>
            <asp:DetailsView ID="DetailsView2" runat="server" AllowPaging="True" 
                AutoGenerateRows="False" DataSourceID="SqlDataSourceGur_Info" 
                EnableModelValidation="True"
                DefaultMode="Edit"
                CellPadding="4" ForeColor="#333333" 
                GridLines="Both"
                OnPageIndexChanging="DetailsView_PageIndexChanging"
                OnItemUpdating="DetailsView_ItemUpdating"
                OnItemUpdated="DetailsView_ItemUpdated"
                OnPreRender="DetailsView2_OnPreRender"
                DataKeyNames="CIF,Default_Date,PLED_ID">
                <AlternatingRowStyle BackColor="White" />
                <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
                <Fields>
                    <asp:TemplateField HeaderText="CIF" SortExpression="CIF">
                        <EditItemTemplate>
                            <%--<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CIF") %>'></asp:TextBox>--%>
                            <asp:Label ID="CIFLabel1" runat="server" Text='<%# Bind("CIF") %>'></asp:Label>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:Label ID="LabelCif_Insert" runat="server" Text='<%# Bind("CIF") %>'></asp:Label>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LabelCif" runat="server" Text='<%# Bind("CIF") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Default Date" SortExpression="Default_Date">
                        <EditItemTemplate>
                            <asp:Label ID="Default_DateLabel2" runat="server" Text='<%# Bind("Default_Date","{0:d MMMM yyyy}") %>'> %>'></asp:Label>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBoxDefault_Date_Insert" runat="server" Text='<%# Bind("Default_Date") %>'></asp:TextBox>
                            <span style="color:Red">*</span>
                    <asp:CalendarExtender ID="TextBoxDefault_Date_Insert_CalendarExtender" 
                        runat="server" TargetControlID="TextBoxDefault_Date_Insert" Format="d MMMM yyyy" DaysModeTitleFormat="MMMM yyyy" TodaysDateFormat="d MMMM yyyy">
                    </asp:CalendarExtender>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LabelDefault_Date" runat="server" Text='<%# Bind("Default_Date") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="PLED ID" SortExpression="PLED_ID">
                        <EditItemTemplate>
                            <asp:Label ID="PLED_IDLabel3" runat="server" Text='<%# Bind("PLED_ID") %>'></asp:Label>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("PLED_ID") %>'></asp:TextBox>
                            <span style="color:Red">*</span>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("PLED_ID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Guarantee Title" 
                        SortExpression="Guarantee_Title">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Guarantee_Title") %>'></asp:TextBox>
                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please input Guarantee Title" Text ="*" ValidationGroup="UpdateValidation" ControlToValidate="TextBox8"></asp:RequiredFieldValidator>--%>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBoxGuarantee_Title_Insert" runat="server" Text='<%# Bind("Guarantee_Title") %>'></asp:TextBox>
                            <span style="color:Red">*</span>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("Guarantee_Title") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Pledge to All Facilities" 
                        SortExpression="Pledge_to_All_Facilities">
                        <EditItemTemplate>
                            <asp:CheckBox ID="Pledge_to_All_Facilities_CheckBox" runat="server" 
                                Checked='<%# Bind("Pledge_to_All_Facilities") %>' domId="Pledge_to_All_Facilities_CheckBox" />
                            <span style="color:Red">*</span>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:CheckBox ID="Pledge_to_All_Facilities_CheckBox" runat="server" 
                                Checked='<%# Bind("Pledge_to_All_Facilities") %>' domId="Pledge_to_All_Facilities_CheckBox"/>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="Pledge_to_All_Facilities_CheckBox" runat="server" 
                                Checked='<%# Bind("Pledge_to_All_Facilities") %>' Enabled="false" domId="Pledge_to_All_Facilities_CheckBox"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Facility Pledged" 
                        SortExpression="Facility_Pledged">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBoxFacility_Pledged" runat="server" Text='<%# Bind("Facility_Pledged") %>' domId="TextBoxFacility_Pledged"></asp:TextBox>
                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please input Facility Pledged" Text ="*" ValidationGroup="UpdateValidation" ControlToValidate="TextBox9"></asp:RequiredFieldValidator>--%>
                            <span style="color:Red">*</span>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBoxFacility_Pledged" runat="server" 
                                Text='<%# Bind("Facility_Pledged") %>' domId="TextBoxFacility_Pledged"></asp:TextBox>
                                <span style="color:Red">*</span>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LabelFacility_Pledged" runat="server" Text='<%# Bind("Facility_Pledged") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Guarantee Amount @ D" 
                        SortExpression="Guarantee_Amount_D">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Guarantee_Amount_D","{0:#,##0.00}") %>' IsNumeric="Yes" Style="text-align:right;"></asp:TextBox>
                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please input Guarantee Amount D" Text ="*" ValidationGroup="UpdateValidation" ControlToValidate="TextBox6"></asp:RequiredFieldValidator>--%>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox7" runat="server" 
                                Text='<%# Bind("Guarantee_Amount_D","{0:#,##0.00}") %>' IsNumeric="Yes" Style="text-align:right;">
                            </asp:TextBox>
                            <span style="color:Red">*</span>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("Guarantee_Amount_D","{0:#,##0.00}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Guarantee Amount @ D-1" 
                        SortExpression="Guarantee_Amount_D1">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Guarantee_Amount_D1","{0:#,##0.00}") %>' IsNumeric="Yes" Style="text-align:right;"></asp:TextBox>
                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please input Guarantee Amount D1" Text ="*" ValidationGroup="UpdateValidation" ControlToValidate="TextBox7"></asp:RequiredFieldValidator>--%>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBoxGuarantee_Amount_D1_Insert" runat="server" 
                                Text='<%# Bind("Guarantee_Amount_D1","{0:#,##0.00}") %>' IsNumeric="Yes" Style="text-align:right;">
                            </asp:TextBox>
                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidatorTextBoxGuarantee_Amount_D1" runat="server" ErrorMessage="Please input Guarantee Amount @ D-1" Text ="*" ValidationGroup="InsertValidation" ControlToValidate="TextBoxGuarantee_Amount_D1_Insert"></asp:RequiredFieldValidator>--%>
                            <span style="color:Red">*</span>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("Guarantee_Amount_D1","{0:#,##0.00}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Guarantee Amount Currency Code" 
                        SortExpression="Guarantee_Amount_Currency_Code">
                        <EditItemTemplate>
                            <%--<asp:TextBox ID="TextBox4" runat="server" 
                                Text='<%# Bind("Guarantee_Amount_Currency_Code") %>'></asp:TextBox>--%>
                            <asp:DropDownList ID="DropDownList1" runat="server" 
                                DataSourceID="SqlDataSourceCurrentcy" 
                                DataTextField="Description" 
                                DataValueField="Code"
                                SelectedValue='<%# Bind("Guarantee_Amount_Currency_Code")%>'>
                            </asp:DropDownList>
                            <span style="color:Red">*</span>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList1_Insert" runat="server" 
                                DataSourceID="SqlDataSourceCurrentcy" 
                                DataTextField="Description" 
                                DataValueField="Code"
                                SelectedValue='<%# Bind("Guarantee_Amount_Currency_Code")%>'>
                            </asp:DropDownList>
                            <span style="color:Red">*</span>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" 
                                Text='<%# Bind("Guarantee_Amount_Currency_Code") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Guarantee Indemnity Source ID" 
                        SortExpression="Guarantee_Indemnity_Source_ID">
                        <EditItemTemplate>
<%--                            <asp:DropDownList ID="DropDownListGuarantee_Indemnity" runat="server" 
                                DataSourceID="SqlDataSourceGar_Ind" DataTextField="Column1" 
                                DataValueField="    Column1"
                                SelectedValue='<%# Bind("Guarantee_Indemnity_Source_ID") %>'>
                            </asp:DropDownList>--%>
                            <asp:ComboBox ID="Guarantee_Indemnity_Source_ID_for_ComboBox" runat="server" AppendDataBoundItems="True"
                                MaxLength="0" SelectedValue='<%# Bind("Guarantee_Indemnity_Source_ID") %>' Style="display: inline;text-align:center;"
                                DataSourceID="SqlDataSourceGar_Ind" DataTextField="Guarantee_Indemnity_Source_ID"
                                DataValueField="Guarantee_Indemnity_Source_ID" >
                                    <asp:ListItem Value="">Please Select</asp:ListItem>
                                    <asp:ListItem>Director / Proprietor</asp:ListItem>
                                    <asp:ListItem>Family Member</asp:ListItem>
                                    <asp:ListItem>Related Company</asp:ListItem>
                                    <asp:ListItem>Bank / Insurance Company</asp:ListItem>
                            </asp:ComboBox>
                            <span style="color:Red">*</span>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:ComboBox ID="Guarantee_Indemnity_Source_ID_for_ComboBox" runat="server" AppendDataBoundItems="True" SelectedValue='<%# Bind("Guarantee_Indemnity_Source_ID") %>' 
                                DataSourceID="SqlDataSourceGar_Ind" DataTextField="Guarantee_Indemnity_Source_ID"
                                DataValueField="Guarantee_Indemnity_Source_ID" >
                                    <asp:ListItem Value="">Please Select</asp:ListItem>
                            </asp:ComboBox>
                            <span style="color:Red">*</span>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" 
                                Text='<%# Bind("Guarantee_Indemnity_Source_ID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Internal Rating @ D-1" 
                        SortExpression="Internal_Rating_D">
                        <EditItemTemplate>
                            <asp:TextBox ID="Internal_Rating_DTextBox" runat="server" 
                                Text='<%# Bind("Internal_Rating_D") %>'>
                            </asp:TextBox>
                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidatorInternal_Rating" runat="server" ErrorMessage="Please input Internal Rating D" Text="*" ValidationGroup="UpdateValidation" ControlToValidate="Internal_Rating_DTextBox"></asp:RequiredFieldValidator>--%>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" 
                                Text='<%# Bind("Internal_Rating_D") %>'></asp:TextBox>
                                <span style="color:Red">*</span>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("Internal_Rating_D") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
            <asp:TemplateField HeaderText="Do you want to delete this page?" SortExpression="DEL_FLAG">
                <EditItemTemplate>
                    <asp:CheckBox ID="DEL_FLAG_CheckBox" runat="server" 
                        Checked='<%# Bind("DEL_FLAG") %>' domId="DEL_FLAG_CheckBox"/>
                    <span style="color: Red">*</span>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:CheckBox ID="DEL_FLAG_CheckBox" runat="server" 
                        Checked='<%# Bind("DEL_FLAG") %>' domId="DEL_FLAG_CheckBox"/>
                    <span style="color: Red">*</span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="DEL_FLAG_CheckBox" runat="server" 
                                Checked='<%# Bind("DEL_FLAG") %>' Enabled="false" domId="DEL_FLAG_CheckBox"/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="UPDATE USER" SortExpression="UPDATE_USER">
                <EditItemTemplate>
                    <asp:Label ID="LabelUserId" runat="server" Text='<%# Bind("UpdateUser") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:Label ID="LabelUserId_Insert" runat="server" Text='<%# Bind("UpdateUser") %>'></asp:Label>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("UpdateUser") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="UPDATE DATE" SortExpression="UPDATE_DATE">
                <EditItemTemplate>
                    <asp:Label ID="LabelDate" runat="server" Text='<%# Bind("UpdateDate","{0:d MMMM yyyy HH:mm:ss}") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:Label ID="LabelDate_Insert" runat="server" Text='<%# Bind("UpdateDate","{0:d MMMM yyyy HH:mm:ss}") %>'></asp:Label>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("UpdateDate","{0:d MMMM yyyy HH:mm:ss}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="true" CommandName="Update" Text="Update" ValidationGroup="UpdateValidation"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                CommandName="Edit" Text="Edit"></asp:LinkButton>
                        </ItemTemplate>
                        <InsertItemTemplate>
                            <asp:LinkButton ID="LinkButtonSave" runat="server" CausesValidation="true" CommandName="Insert" Text="Insert" ValidationGroup="InsertValidation" ></asp:LinkButton>
                        </InsertItemTemplate>
                    </asp:TemplateField>
                </Fields>
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <PagerSettings Mode="NumericFirstLast" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            </asp:DetailsView>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="true" ValidationGroup="UpdateValidation" ShowSummary="False"/>
            <asp:ValidationSummary ID="ValidationSummaryInsert" runat="server" ShowMessageBox="true" ValidationGroup="InsertValidation" ShowSummary="False"/>

      <asp:SqlDataSource ID="SqlDataSourceCurrentcy" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>" 
                        SelectCommand="L_CURRENCY_CODE_SELECT" 
        EnableCaching="True" SelectCommandType="StoredProcedure">
                    </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceGur_Info" runat="server" 
                ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>" 
                InsertCommand="GUARANTOR_INFORMATION_INSERT" 
                InsertCommandType="StoredProcedure" 
                SelectCommand="GUARANTOR_INFORMATION_SELECT" 
                SelectCommandType="StoredProcedure" 
                UpdateCommand="GUARANTOR_INFORMATION_UPDATE" 
                UpdateCommandType="StoredProcedure"
                OnSelected="SqlDataSourceGur_Info_Selected" >
                <InsertParameters>
                    <asp:Parameter Name="CIF" Type="String" />
                    <asp:Parameter Name="Default_Date" Type="DateTime" />
                    <asp:Parameter Name="PLED_ID" Type="String" />
                    <asp:Parameter Name="Guarantee_Title" Type="String" />
                    <asp:Parameter Name="Pledge_to_All_Facilities" Type="Boolean" />
                    <asp:Parameter Name="Facility_Pledged" Type="String" />
                    <asp:Parameter Name="Guarantee_Amount_D" Type="Double" />
                    <asp:Parameter Name="Guarantee_Amount_D1" Type="Double" />
                    <asp:Parameter Name="Guarantee_Amount_Currency_Code" Type="String" />
                    <asp:Parameter Name="Guarantee_Indemnity_Source_ID" Type="String" />
                    <asp:Parameter Name="Internal_Rating_D" Type="String" />
                    <asp:Parameter Name="UpdateUser" Type="String" />
                    <asp:Parameter Name="UpdateDate" Type="DateTime" />
                    <asp:Parameter Name="DEL_FLAG" Type="Boolean" />
                </InsertParameters>
                <SelectParameters>
                    <asp:QueryStringParameter Name="CIF" QueryStringField="CIF" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="CIF" Type="String" />
                    <asp:Parameter Name="Default_Date" Type="DateTime" />
                    <asp:Parameter Name="PLED_ID" Type="String" />
                    <asp:Parameter Name="Guarantee_Title" Type="String" />
                    <asp:Parameter Name="Pledge_to_All_Facilities" Type="Boolean" />
                    <asp:Parameter Name="Facility_Pledged" Type="String" />
                    <asp:Parameter Name="Guarantee_Amount_D" Type="Double" />
                    <asp:Parameter Name="Guarantee_Amount_D1" Type="Double" />
                    <asp:Parameter Name="Guarantee_Amount_Currency_Code" Type="String" />
                    <asp:Parameter Name="Guarantee_Indemnity_Source_ID" Type="String" />
                    <asp:Parameter Name="Internal_Rating_D" Type="String" />
                    <asp:Parameter Name="UpdateUser" Type="String" />
                    <asp:Parameter Name="UpdateDate" Type="DateTime" />
                    <asp:Parameter Name="DEL_FLAG" Type="Boolean" />
                </UpdateParameters>
            </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceGar_Ind" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>" 
        SelectCommand="GUARANTOR_INFORMATION_INDEMNITY_SELECT" 
        SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        </td>
    </tr>
</table>

    </asp:Content>
