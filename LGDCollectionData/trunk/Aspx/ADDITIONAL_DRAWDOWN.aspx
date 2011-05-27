<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeBehind="ADDITIONAL_DRAWDOWN.aspx.cs"
    Inherits="LGDCollectionData.Aspx.ADDITIONAL_DRAWDOWN" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register src="../UserControls/SelectFormWebUserControl.ascx" tagname="SelectFormWebUserControl" tagprefix="uc1" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
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

            var CheckBoxLIMITNO_Changed = Ext.DotNetControl.CheckBox.mapElement("domId", "CheckBoxLIMITNO_Changed");
            var DropDownListPrevious_LIMITNO = Ext.DotNetControl.ComboBox.mapElement("domId", "DropDownListPrevious_LIMITNO");

            var CheckBoxIs_This_an_Additional_Drawdown = Ext.DotNetControl.CheckBox.mapElement("domId", "CheckBoxIs_This_an_Additional_Drawdown");
            var ComboBoxAdditional = Ext.DotNetControl.ComboBox.mapElement("domId", "ComboBoxAdditional");
            var ComboBoxOtherReason = Ext.DotNetControl.ComboBox.mapElement("domId", "ComboBoxOtherReason");


            CheckBoxLIMITNO_Changed.element.on({
                "click": function (e, t, o) {
                    if (t.checked) {
                        o.targetElement.DropDownListPrevious_LIMITNO.disabled(false);
                    } else {
                        o.targetElement.DropDownListPrevious_LIMITNO.disabled(true);
                    }
                },
                scope: this,
                targetElement: { "DropDownListPrevious_LIMITNO": DropDownListPrevious_LIMITNO }
            });

            //init CheckBoxLIMITNO_Changed
            if (CheckBoxLIMITNO_Changed.element.dom.checked) {
                DropDownListPrevious_LIMITNO.disabled(false);
            } else {
                DropDownListPrevious_LIMITNO.disabled(true);
            }
            //end init CheckBoxLIMITNO_Changed


            CheckBoxIs_This_an_Additional_Drawdown.element.on({
                "click": function (e, t, o) {
                    if (t.checked) {
                        o.targetElement.ComboBoxAdditional.disabled(false);
                        o.targetElement.ComboBoxOtherReason.disabled(true);
                    } else {
                        o.targetElement.ComboBoxAdditional.disabled(true);
                        o.targetElement.ComboBoxOtherReason.disabled(false);
                    }
                },
                scope: this,
                targetElement: { "ComboBoxAdditional": ComboBoxAdditional, "ComboBoxOtherReason": ComboBoxOtherReason }
            });

            //init CheckBoxIs_This_an_Additional_Drawdown
            if (CheckBoxIs_This_an_Additional_Drawdown.element.dom.checked) {
                ComboBoxAdditional.disabled(false);
                ComboBoxOtherReason.disabled(true);
            } else {
                ComboBoxAdditional.disabled(true);
                ComboBoxOtherReason.disabled(false);
            }
            //end init CheckBoxIs_This_an_Additional_Drawdown

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
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" EnableScriptGlobalization="true">
</asp:ToolkitScriptManager>
  
<uc1:SelectFormWebUserControl ID="SelectFormWebUserControl1" runat="server" />

    <h2>
        <asp:Label ID="Label1" runat="server" Text="ADDITIONAL DRAWDOWN"></asp:Label>
    </h2>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>"
        SelectCommand="ADDITIONAL_DRAWDOWN_SELECT" SelectCommandType="StoredProcedure"
        UpdateCommand="ADDITIONAL_DRAWDOWN_UPDATE" UpdateCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter Name="CIF" QueryStringField="CIF" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="CIF" Type="String" />
            <asp:Parameter Name="Default_Date" Type="DateTime" />
            <asp:Parameter Name="BRAN" Type="String" />
            <asp:Parameter Name="ACCGL" Type="String" />
            <asp:Parameter Name="ACCNO" Type="String" />
            <asp:Parameter Name="CONTNO" Type="String" DefaultValue="" />
            <asp:Parameter Name="SEQNO" Type="String" />
            <asp:Parameter Name="APP_ID" Type="String" />
            <asp:Parameter Name="PRINCIPAL" Type="Double" />
            <asp:Parameter Name="ACCRU" Type="Double" />
            <asp:Parameter Name="SUSP" Type="Double" />
            <asp:Parameter Name="PRINCIPAL_AT_Last_Month" Type="Double" />
            <asp:Parameter Name="ACCRU_AT_Last_Month" Type="Double" />
            <asp:Parameter Name="SUSP_AT_Last_Month" Type="Double" />
            <asp:Parameter Name="Additional_Drawdown_Date" Type="DateTime" />
            <asp:Parameter Name="Additional_Drawdown_Currency" Type="String" />
            <asp:Parameter Name="LIMITNO" Type="String" />
            <asp:Parameter Name="LIMITNO_Changed" Type="Boolean" />
            <asp:Parameter Name="Previous_LIMITNO" Type="String" />
            <asp:Parameter Name="Is_This_an_Additional_Drawdown" Type="Boolean" />
            <asp:Parameter Name="Type_of_Additional_Drawdown" Type="String" />
            <asp:Parameter Name="Other_Reason_of_Principal_Increase" Type="String" />
            <asp:Parameter Name="UpdateUser" Type="String" />
            <asp:Parameter Name="UpdateDate" Type="DateTime" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceAppID" runat="server" ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>"
        SelectCommand="L_APP_ID_SELECT" SelectCommandType="StoredProcedure" EnableCaching="True">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceAddCurrency" runat="server" ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>"
        ProviderName="<%$ ConnectionStrings:LGDConnectionString1.ProviderName %>" SelectCommand="L_CURRENCY_CODE_SELECT"
        SelectCommandType="StoredProcedure" EnableCaching="True"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceLimitNo" runat="server" ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>"
        SelectCommand="P_LIMITNO_IN_FACILITY_INFORMATION_BY_CIF" SelectCommandType="StoredProcedure"
        EnableCaching="False">
        <SelectParameters>
            <asp:QueryStringParameter Name="CIF" QueryStringField="cif" Type="String" />
        </SelectParameters>
        </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceDrawDownType" runat="server" ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>"
        SelectCommand="ADDITIONAL_DRAWDOWN_TYPE_SELECT" SelectCommandType="StoredProcedure"
        EnableCaching="False"></asp:SqlDataSource>
    
    <asp:SqlDataSource ID="SqlDataSourceReason" runat="server" ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>"
        SelectCommand="ADDITIONAL_DRAWDOWN_REASON_SELECT" SelectCommandType="StoredProcedure"
        EnableCaching="False"></asp:SqlDataSource>
    <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False"
        DataKeyNames="CIF,Default_Date,BRAN,ACCGL,ACCNO,CONTNO,SEQNO,Additional_Drawdown_Date"
        DataSourceID="SqlDataSource1" EnableModelValidation="True" Width="800px"
        DefaultMode="Edit" CellPadding="4" 
        OnPageIndexChanging="DetailsView_PageIndexChanging"
        OnItemUpdating="DetailsView_ItemUpdating"
        OnDataBound="DetailsView_Databound" ForeColor="#333333" GridLines="Both" 
      PagerSettings-Mode="NumericFirstLast">
        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
        <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" Width="35%"/>
        <Fields>
            <asp:BoundField DataField="CIF" HeaderText="CIF" ReadOnly="True" SortExpression="CIF" />
            <asp:TemplateField HeaderText="Default_Date" SortExpression="Default_Date">
                <EditItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Default_Date","{0:d MMMM yyyy}") %>'></asp:Label>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="BRAN" HeaderText="BRAN" ReadOnly="True" SortExpression="BRAN" />
            <asp:BoundField DataField="ACCGL" HeaderText="ACCGL" ReadOnly="True" SortExpression="ACCGL" />
            <asp:BoundField DataField="ACCNO" HeaderText="ACCNO" ReadOnly="True" SortExpression="ACCNO" />
            <asp:BoundField DataField="CONTNO" HeaderText="CONTNO" ReadOnly="True" SortExpression="CONTNO" />
            <asp:BoundField DataField="SEQNO" HeaderText="SEQNO" ReadOnly="True" SortExpression="SEQNO" />
            <asp:TemplateField HeaderText="APP_ID" SortExpression="APP_ID">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSourceAppID"
                        DataTextField="APP_ID" DataValueField="APP_ID" SelectedValue='<%# Bind("APP_ID") %>'>
                    </asp:DropDownList><asp:Label  runat="server" Text="" ForeColor="Red"></asp:Label>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="PRINCIPAL" SortExpression="PRINCIPAL">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("PRINCIPAL","{0:#,##0.##}") %>' IsNumeric="Yes"></asp:TextBox>
                    <asp:Label  runat="server" Text="" ForeColor="Red"></asp:Label>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ACCRU" SortExpression="ACCRU">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ACCRU","{0:#,##0.##}") %>' IsNumeric="Yes"></asp:TextBox>
                    <asp:Label  runat="server" Text="" ForeColor="Red"></asp:Label>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="SUSP" SortExpression="SUSP">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("SUSP","{0:#,##0.##}") %>' IsNumeric="Yes"></asp:TextBox>
                    <asp:Label  runat="server" Text="" ForeColor="Red"></asp:Label>
                </EditItemTemplate>
               </asp:TemplateField>
            <asp:TemplateField HeaderText="PRINCIPAL AT Last Month" 
                SortExpression="PRINCIPAL_AT_Last_Month">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" 
                        Text='<%# Bind("PRINCIPAL_AT_Last_Month","{0:#,##0.##}") %>' IsNumeric="Yes"></asp:TextBox>
                        <asp:Label  runat="server" Text="" ForeColor="Red"></asp:Label>
               
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ACCRU AT Last Month" 
                SortExpression="ACCRU_AT_Last_Month">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" 
                        Text='<%# Bind("ACCRU_AT_Last_Month","{0:#,##0.##}") %>' IsNumeric="Yes"></asp:TextBox>
                        <asp:Label  runat="server" Text="" ForeColor="Red"></asp:Label>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="SUSP AT Last Month" 
                SortExpression="SUSP_AT_Last_Month">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" 
                        Text='<%# Bind("SUSP_AT_Last_Month","{0:#,##0.##}") %>' IsNumeric="Yes"></asp:TextBox>
                        <asp:Label  runat="server" Text="" ForeColor="Red"></asp:Label>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Additional Drawdown Date" 
                SortExpression="Additional_Drawdown_Date">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" 
                        Text='<%# Eval("Additional_Drawdown_Date","{0:d MMMM yyyy}") %>'></asp:Label>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Additional Drawdown Currency" SortExpression="Additional_Drawdown_Currency">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSourceAddCurrency"
                        DataTextField="Description" DataValueField="Code" AppendDataBoundItems="true"
                        SelectedValue='<%# Bind("Additional_Drawdown_Currency","{0:N}") %>'>
                        <asp:ListItem Value="">...Please Select...</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Label  runat="server" Text="*" ForeColor="Red"></asp:Label>
                </EditItemTemplate>
          </asp:TemplateField>
            <asp:BoundField DataField="LIMITNO" HeaderText="LIMIT NO" 
                SortExpression="LIMITNO" ReadOnly="true" />
            <asp:TemplateField HeaderText="LIMITNO Changed" 
                SortExpression="LIMITNO_Changed">
                <EditItemTemplate>
                    <asp:CheckBox ID="CheckBoxLIMITNO_Changed" runat="server" 
                        Checked='<%# Bind("LIMITNO_Changed") %>'  domId = "CheckBoxLIMITNO_Changed" Enabled="false"/>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Previous LIMITNO" SortExpression="Previous_LIMITNO">
                <EditItemTemplate>
                    <asp:ComboBox ID="DropDownListPrevious_LIMITNO" runat="server" AutoCompleteMode="SuggestAppend"
                        DataSourceID="SqlDataSourceLimitNo" DataTextField="LIMITNO" DataValueField="LIMITNO"
                        DropDownStyle="DropDownList" MaxLength="0" Style="display: inline;" AppendDataBoundItems="true"
                        SelectedValue='<%# Bind("Previous_LIMITNO") %>' domId="DropDownListPrevious_LIMITNO">
                        <asp:ListItem Value="">Please Select</asp:ListItem>
                        <asp:ListItem Value="N/A">N/A</asp:ListItem>
                    </asp:ComboBox>
                    <asp:Label  runat="server" Text="*" ForeColor="Red"></asp:Label>
                </EditItemTemplate>
              </asp:TemplateField>
            <asp:TemplateField HeaderText="Is This an Additional Drawdown" 
                SortExpression="Is_This_an_Additional_Drawdown">
                <EditItemTemplate>
                    <asp:CheckBox ID="CheckBoxIs_This_an_Additional_Drawdown" runat="server"  domId="CheckBoxIs_This_an_Additional_Drawdown"
                        Checked='<%# Bind("Is_This_an_Additional_Drawdown") %>' />
                        <asp:Label ID="Label3"  runat="server" Text="*" ForeColor="Red"></asp:Label>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Type of Additional Drawdown" SortExpression="Type_of_Additional_Drawdown">
                <EditItemTemplate>
                  
                    <asp:ComboBox ID="ComboBoxAdditional" domId="ComboBoxAdditional" runat="server" AppendDataBoundItems="true" DataSourceID="SqlDataSourceDrawDownType"
                        DataTextField="ADDITIONAL_DRAWDOWN_TYPE" DataValueField="ADDITIONAL_DRAWDOWN_TYPE"
                        SelectedValue='<%# Bind("Type_of_Additional_Drawdown") %>'>
                        <asp:ListItem Value="">...Please Select...</asp:ListItem>
                    </asp:ComboBox>
                    <asp:Label  runat="server" Text="*" ForeColor="Red"></asp:Label>
                </EditItemTemplate>
             </asp:TemplateField>
            <asp:TemplateField HeaderText="Other Reason of Principal Increase " SortExpression="Other_Reason_of_Principal_Increase">
                <EditItemTemplate>
                    <asp:ComboBox ID="ComboBoxOtherReason" domId="ComboBoxOtherReason" runat="server" AppendDataBoundItems="true" DataSourceID="SqlDataSourceReason"
                        DataTextField="ADDITIONAL_DRAWDOWN_REASON" DataValueField="ADDITIONAL_DRAWDOWN_REASON"
                        SelectedValue='<%# Bind("Other_Reason_of_Principal_Increase") %>'>
                        <asp:ListItem Value="">...Please Select...</asp:ListItem>
                    </asp:ComboBox>
                    <asp:Label  runat="server" Text="*" ForeColor="Red"></asp:Label>
                </EditItemTemplate>
          
            </asp:TemplateField>
          <asp:TemplateField HeaderText="Update User" SortExpression="UpdateUser">
                <EditItemTemplate>
                    <asp:Label ID="LabelUserId" runat="server" Text='<%# Bind("UpdateUser") %>'></asp:Label>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Update Date" SortExpression="UpdateDate">
                <EditItemTemplate>
                    <asp:Label ID="LabelDate" runat="server" Text='<%# Bind("UpdateDate","{0:d MMMM yyyy}") %>'></asp:Label>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="True" ShowInsertButton="True" />
        </Fields>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White"/>
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
    </asp:DetailsView>
</asp:Content>
