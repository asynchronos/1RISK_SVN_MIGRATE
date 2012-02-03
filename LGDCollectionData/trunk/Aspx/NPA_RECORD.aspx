<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="NPA_RECORD.aspx.cs" Inherits="LGDCollectionData.Aspx.NPA_RECORD_NEW"
    Culture="en-US" UICulture="en-US" %>

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
    <!-- Ext includes -->
    <link rel="stylesheet" type="text/css" href="../ExtJS/resources/css/ext-all.css" />
    <script type="text/javascript" src="../ExtJS/adapter/ext/ext-base.js"></script>
    <script type="text/javascript" src="../ExtJS/ext-all.js"></script>
    <script type="text/javascript" src="../Scripts/CommonExt.js"></script>
    <script type="text/javascript" src="../Scripts/common.js"></script>
    <script type="text/javascript">
        Ext.onReady(function () {
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
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" EnableScriptGlobalization="true">
    </asp:ToolkitScriptManager>
    <uc1:SelectFormWebUserControl ID="SelectFormWebUserControl1" runat="server" />
    <h2>
        <asp:Label ID="FormName_Label" runat="server" Text="NPA RECORD"></asp:Label>
    </h2>
    <asp:SqlDataSource ID="SqlDataSourceNPA_RECORD" runat="server" ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>"
        InsertCommand="NPA_RECORD_INSERT" InsertCommandType="StoredProcedure" SelectCommand="NPA_RECORD_SELECT"
        SelectCommandType="StoredProcedure" UpdateCommand="NPA_RECORD_UPDATE" UpdateCommandType="StoredProcedure">
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
            <asp:Parameter Name="UpdateUser" Type="String" />
            <asp:Parameter Name="UpdateDate" Type="DateTime" />
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
            <asp:Parameter Name="UpdateUser" Type="String" />
            <asp:Parameter Name="UpdateDate" Type="DateTime" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:DropDownList ID="DDLValidate" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DDLValidate_SelectedIndexChanged">
        <asp:ListItem Value="-1">All</asp:ListItem>
        <asp:ListItem Value="1">Validate</asp:ListItem>
    </asp:DropDownList>
    <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False"
        DataKeyNames="CIF,Default_Date,NPA_Collateral_ID" DataSourceID="SqlDataSourceNPA_RECORD"
        EnableModelValidation="True" DefaultMode="Edit" CellPadding="4" ForeColor="#333333"
        GridLines="Both" OnPreRender="DetailsView_OnPreRender" OnPageIndexChanging="DetailsView_PageIndexChanging"
        OnItemUpdating="DetailsView_ItemUpdating" OnItemUpdated="DetailsView_ItemUpdated"
        Width="600px">
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
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("CIF") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Default Date" SortExpression="Default_Date">
                <EditItemTemplate>
                    <asp:Label ID="Default_Date_Label" runat="server" Text='<%# Eval("Default_Date", "{0:d MMMM yyyy}") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBoxDefault_Date_Insert" runat="server" Text='<%# Bind("Default_Date", "{0:d MMMM yyyy}") %>'></asp:TextBox>
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
                    <span style="color: Red">*</span>
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
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Collateral_Sale_Price","{0:#,##0.00}") %>'
                        IsNumeric="Yes" Style="text-align: right;"></asp:TextBox>
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Collateral Sale Price"
                        Text="*" ValidationGroup="detailviewValidation" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>--%>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Collateral_Sale_Price","{0:#,##0.00}") %>'
                        IsNumeric="Yes"></asp:TextBox>
                    <span style="color: Red">*</span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Collateral_Sale_Price","{0:#,##0.00}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Collateral Sale Date" SortExpression="Collateral_Sale_Date">
                <EditItemTemplate>
                    <asp:TextBox ID="Collateral_Sale_Date_TextBox" runat="server" Text='<%# Bind("Collateral_Sale_Date","{0:d MMMM yyyy}") %>'></asp:TextBox>
                    <asp:CalendarExtender ID="Collateral_Sale_Date_TextBox_CalendarExtender" runat="server"
                        Enabled="True" TargetControlID="Collateral_Sale_Date_TextBox" Format="d MMMM yyyy"
                        DaysModeTitleFormat="MMMM yyyy" TodaysDateFormat="d MMMM yyyy">
                    </asp:CalendarExtender>
                    <asp:CustomValidator ID="Collateral_Sale_Date_TextBox_Validator" runat="server" ErrorMessage="Must later than default date."
                        ControlToValidate="Collateral_Sale_Date_TextBox" ValidationGroup="detailviewValidation"
                        SetFocusOnError="true" OnServerValidate="Collateral_Sale_Date_TextBox_ServerValidate"></asp:CustomValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="Collateral_Sale_Date_TextBox" runat="server" Text='<%# Bind("Collateral_Sale_Date","{0:d MMMM yyyy}") %>'></asp:TextBox>
                    <asp:CalendarExtender ID="Collateral_Sale_Date_TextBox_CalendarExtender" runat="server"
                        Enabled="True" TargetControlID="Collateral_Sale_Date_TextBox" Format="d MMMM yyyy"
                        DaysModeTitleFormat="MMMM yyyy" TodaysDateFormat="d MMMM yyyy">
                    </asp:CalendarExtender>
                    <asp:CustomValidator ID="Collateral_Sale_Date_TextBox_Validator" runat="server" ErrorMessage="Must later than default date."
                        ControlToValidate="Collateral_Sale_Date_TextBox" ValidationGroup="detailviewValidation"
                        SetFocusOnError="true" OnServerValidate="Collateral_Sale_Date_TextBox_ServerValidate"></asp:CustomValidator>
                    <span style="color: Red">*</span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Collateral_Sale_Date","{0:d MMMM yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Collateral Description" SortExpression="Collateral_Description">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Collateral_Description") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Collateral_Description") %>'></asp:TextBox>
                    <span style="color: Red">*</span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label15" runat="server" Text='<%# Bind("Collateral_Description") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="District of Property" SortExpression="District_of_Property">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("District_of_Property") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please input District of Property"
                        Text="*" ValidationGroup="detailviewValidation" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
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
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please input Amphur of Property"
                        Text="*" ValidationGroup="detailviewValidation" ControlToValidate="TextBox3"></asp:RequiredFieldValidator>
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
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Title_Deed_Number") %>'
                        Width="300px" MaxLength="255"></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("Title_Deed_Number") %>'
                        Width="300px" MaxLength="255"></asp:TextBox>
                    <span style="color: Red">*</span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label14" runat="server" Text='<%# Bind("Title_Deed_Number") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Update User" SortExpression="UpdateUser">
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
            <asp:TemplateField HeaderText="Update Date" SortExpression="UpdateDate">
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
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="true" CommandName="Update"
                        Text="Update" ValidationGroup="detailviewValidation"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="true" CommandName="Cancel"
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
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="true"
        ValidationGroup="detailviewValidation" ShowSummary="False" />
    <asp:SqlDataSource ID="SqlDataSourceCurrentcy" runat="server" ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>"
        SelectCommand="L_CURRENCY_CODE_SELECT" EnableCaching="True" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourcePROVINCE" runat="server" ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>"
        SelectCommand="L_PROVINCE_SELECT" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>