<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="TRANSACTION_INFORMATION.aspx.cs" Inherits="LGDCollectionData.Aspx.TRANSACTION_INFORMATION" %>

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

            //check percentage digit
            //var percentageElements = Ext.select("input[IsPercentage=Yes]");
            //percentageElements.set({ maxLength: 3 });
            //end check percentage digit


            //format IsNumeric Element onblur event
            var numericElements = Ext.select("input[IsNumeric=Yes]");
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
                        t.value = (new MyNumber(t.value)).toCurrency();
                    }
                }
            });
            //end format IsNumeric Element onblur event
            numericElements.applyStyles({ "text-align": "right" });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <uc1:SelectFormWebUserControl ID="SelectFormWebUserControl1" runat="server" />
    <h2>
        <asp:Label ID="FormName_Label" runat="server" Text="TRANSACTION INFORMATION"></asp:Label>
    </h2>
    <asp:DetailsView ID="TRANSACTION_INFORMATION_DetailsView" runat="server" AutoGenerateRows="False"
        CellPadding="4" DataKeyNames="CIF,Default_Date,BRAN,ACCGL,ACCNO,CONTNO,SEQNO"
        DataSourceID="TRANSACTION_INFORMATION_SqlDataSource" EnableModelValidation="True"
        ForeColor="#333333" AllowPaging="True" DefaultMode="Edit" OnPageIndexChanging="DetailsView_PageIndexChanging"
        OnItemUpdating="DetailsView_ItemUpdating" Width="800px">
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
            <asp:TemplateField HeaderText="Default Date" SortExpression="Default_Date">
                <EditItemTemplate>
                    <asp:Label ID="Default_Date_Label" runat="server" 
                        Text='<%# Eval("Default_Date", "{0:d MMMM yyyy}") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="Default_Date_TextBox" runat="server" 
                        Text='<%# Bind("Default_Date", "{0:d MMMM yyyy}") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Default_Date_Label" runat="server" 
                        Text='<%# Bind("Default_Date", "{0:d MMMM yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="BRAN" SortExpression="BRAN">
                <EditItemTemplate>
                    <asp:Label ID="BRAN_Label" runat="server" Text='<%# Eval("BRAN") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="BRAN_TextBox" runat="server" Text='<%# Bind("BRAN") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="BRAN_Label" runat="server" Text='<%# Bind("BRAN") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ACCGL" SortExpression="ACCGL">
                <EditItemTemplate>
                    <asp:Label ID="ACCGL_Label" runat="server" Text='<%# Eval("ACCGL") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="ACCGL_TextBox" runat="server" Text='<%# Bind("ACCGL") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="ACCGL_Label" runat="server" Text='<%# Bind("ACCGL") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ACCNO" SortExpression="ACCNO">
                <EditItemTemplate>
                    <asp:Label ID="ACCNO_Label" runat="server" Text='<%# Eval("ACCNO") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="ACCNO_TextBox" runat="server" Text='<%# Bind("ACCNO") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="ACCNO_Label" runat="server" Text='<%# Bind("ACCNO") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="CONTNO" SortExpression="CONTNO">
                <EditItemTemplate>
                    <asp:Label ID="CONTNO_Label" runat="server" Text='<%# Eval("CONTNO") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="CONTNO_TextBox" runat="server" Text='<%# Bind("CONTNO") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="CONTNO_Label" runat="server" Text='<%# Bind("CONTNO") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="SEQNO" SortExpression="SEQNO">
                <EditItemTemplate>
                    <asp:Label ID="SEQNO_Label" runat="server" Text='<%# Eval("SEQNO") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="SEQNO_TextBox" runat="server" Text='<%# Bind("SEQNO") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="SEQNO_Label" runat="server" Text='<%# Bind("SEQNO") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="LIMITNO" SortExpression="LIMITNO">
                <EditItemTemplate>
                    <asp:Label ID="LIMITNO_Label" runat="server" Text='<%# Bind("LIMITNO") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="LIMITNO_TextBox" runat="server" Text='<%# Bind("LIMITNO") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="LIMITNO_Label" runat="server" Text='<%# Bind("LIMITNO") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="FCY_TYPE: Original Currency Code" 
                SortExpression="FCY_TYPE_Original_Currency_Code">
                <EditItemTemplate>
                    <asp:DropDownList ID="FCY_TYPE_Original_Currency_Code_DropDownList" runat="server"
                        DataSourceID="Currency_DataSource" DataTextField="Description" DataValueField="Code"
                        SelectedValue='<%# Bind("FCY_TYPE_Original_Currency_Code") %>' AppendDataBoundItems="true">
                        <asp:ListItem Value="">Please Select</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="FCY_TYPE_Original_Currency_Code_DropDownList" runat="server"
                        DataSourceID="Currency_DataSource" DataTextField="Description" DataValueField="Code"
                        SelectedValue='<%# Bind("FCY_TYPE_Original_Currency_Code") %>' AppendDataBoundItems="true">
                        <asp:ListItem Value="">Please Select</asp:ListItem>
                    </asp:DropDownList>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="FCY_TYPE_Original_Currency_Code_Label" runat="server" Text='<%# Bind("FCY_TYPE_Original_Currency_Code") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Currency Code" SortExpression="Currency_Code">
                <EditItemTemplate>
                    <asp:DropDownList ID="Currency_Code_DropDownList" runat="server" DataSourceID="Currency_DataSource"
                        DataTextField="Description" DataValueField="Code" SelectedValue='<%# Bind("Currency_Code") %>'
                        AppendDataBoundItems="true">
                        <asp:ListItem Value="">Please Select</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="Currency_Code_TextBox" runat="server" Text='<%# Bind("Currency_Code") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Currency_Code_Label" runat="server" Text='<%# Bind("Currency_Code") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="LNSTYPE" SortExpression="LNSTYPE">
                <EditItemTemplate>
                    <asp:TextBox ID="LNSTYPE_TextBox" runat="server" Text='<%# Bind("LNSTYPE") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="LNSTYPE_TextBox" runat="server" Text='<%# Bind("LNSTYPE") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="LNSTYPE_Label" runat="server" Text='<%# Bind("LNSTYPE") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Total Interest Rate Prior to Default(%)" 
                SortExpression="Total_Interest_Rate_Prior_to_Default">
                <EditItemTemplate>
                    <asp:TextBox ID="Total_Interest_Rate_Prior_to_Default_TextBox" runat="server" 
                        Text='<%# Bind("Total_Interest_Rate_Prior_to_Default", "{0:#,##0.##}") %>'
                        IsPercentage="Yes" IsNumeric="Yes"></asp:TextBox>%
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="Total_Interest_Rate_Prior_to_Default_TextBox" runat="server" 
                        Text='<%# Bind("Total_Interest_Rate_Prior_to_Default", "{0:#,##0.##}") %>'
                        IsPercentage="Yes" IsNumeric="Yes"></asp:TextBox>%
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Total_Interest_Rate_Prior_to_Default_Label" runat="server" 
                        Text='<%# Bind("Total_Interest_Rate_Prior_to_Default", "{0:#,##0.##}") %>'></asp:Label>%
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Interest Rate Index Prior to Default" 
                SortExpression="Interest_Rate_Index_Prior_to_Default">
                <EditItemTemplate>
                    <asp:DropDownList ID="Interest_Rate_Index_Prior_to_Default_DropDownList" runat="server"
                        DataSourceID="Rate_Type_SqlDataSource" DataTextField="DESCRIPTION" DataValueField="CODE"
                        SelectedValue='<%# Bind("Interest_Rate_Index_Prior_to_Default") %>' AppendDataBoundItems="true">
                        <asp:ListItem Value="">Please Select</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="Interest_Rate_Index_Prior_to_Default_TextBox" runat="server" Text='<%# Bind("Interest_Rate_Index_Prior_to_Default") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Interest_Rate_Index_Prior_to_Default_Label" runat="server" Text='<%# Bind("Interest_Rate_Index_Prior_to_Default") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Interest Rate Spread Prior to Default(%)" 
                SortExpression="Interest_Rate_Spread_Prior_to_Default_Percentage">
                <EditItemTemplate>
                    <asp:TextBox ID="Interest_Rate_Spread_Prior_to_Default_Percentage_TextBox" runat="server" 
                        Text='<%# Bind("Interest_Rate_Spread_Prior_to_Default_Percentage","{0:#,##0.##}") %>'
                        IsPercentage="Yes" IsNumeric="Yes"></asp:TextBox>%
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="Interest_Rate_Spread_Prior_to_Default_Percentage_TextBox" runat="server" 
                        Text='<%# Bind("Interest_Rate_Spread_Prior_to_Default_Percentage","{0:#,##0.##}") %>'
                        IsPercentage="Yes" IsNumeric="Yes"></asp:TextBox>%
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Interest_Rate_Spread_Prior_to_Default_Percentage_Label" runat="server" 
                        Text='<%# Bind("Interest_Rate_Spread_Prior_to_Default_Percentage","{0:#,##0.##}") %>'></asp:Label>%
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Rate Sign" SortExpression="Rate_Sign">
                <EditItemTemplate>
                    <asp:DropDownList ID="Rate_Sign_DropDownList" runat="server" SelectedValue='<%# Bind("Rate_Sign") %>'>
                        <asp:ListItem Value="+">+</asp:ListItem>
                        <asp:ListItem Value="-">-</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="Rate_Sign_TextBox" runat="server" Text='<%# Bind("Rate_Sign") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Rate_Sign_Label" runat="server" Text='<%# Bind("Rate_Sign") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="OS @ D: Principal" 
                SortExpression="OS_AT_D_Principal">
                <EditItemTemplate>
                    <asp:TextBox ID="OS_AT_D_Principal_TextBox" runat="server" 
                        Text='<%# Bind("OS_AT_D_Principal","{0:#,##0.##}") %>'
                        IsNumeric="Yes"></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="OS_AT_D_Principal_TextBox" runat="server" 
                        Text='<%# Bind("OS_AT_D_Principal","{0:#,##0.##}") %>'
                        IsNumeric="Yes"></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="OS_AT_D_Principal_Label" runat="server"
                        Text='<%# Bind("OS_AT_D_Principal","{0:#,##0.##}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="OS @ D: Accrued" 
                SortExpression="OS_AT_D_Accrued">
                <EditItemTemplate>
                    <asp:TextBox ID="OS_AT_D_Accrued_TextBox" runat="server"
                        Text='<%# Bind("OS_AT_D_Accrued","{0:#,##0.##}") %>'
                        IsNumeric="Yes"></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="OS_AT_D_Accrued_TextBox" runat="server" 
                        Text='<%# Bind("OS_AT_D_Accrued","{0:#,##0.##}") %>'
                        IsNumeric="Yes"></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="OS_AT_D_Accrued_Label" runat="server"
                        Text='<%# Bind("OS_AT_D_Accrued","{0:#,##0.##}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="OS @ D: Suspense" 
                SortExpression="OS_AT_D_Suspense">
                <EditItemTemplate>
                    <asp:TextBox ID="OS_AT_D_Suspense_TextBox" runat="server" 
                        Text='<%# Bind("OS_AT_D_Suspense","{0:#,##0.##}") %>'
                        IsNumeric="Yes"></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="OS_AT_D_Suspense_TextBox" runat="server" 
                        Text='<%# Bind("OS_AT_D_Suspense","{0:#,##0.##}") %>'
                        IsNumeric="Yes"></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="OS_AT_D_Suspense_Label" runat="server" Text='<%# Bind("OS_AT_D_Suspense","{0:#,##0.##}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="OS @ D-1: Principal" 
                SortExpression="OS_AT_D_MINUS_1_Principal">
                <EditItemTemplate>
                    <asp:TextBox ID="OS_AT_D_MINUS_1_Principal_TextBox" runat="server" 
                        Text='<%# Bind("OS_AT_D_MINUS_1_Principal","{0:#,##0.##}") %>'
                        IsNumeric="Yes"></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="OS_AT_D_MINUS_1_Principal_TextBox" runat="server" 
                        Text='<%# Bind("OS_AT_D_MINUS_1_Principal","{0:#,##0.##}") %>'
                        IsNumeric="Yes"></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="OS_AT_D_MINUS_1_Principal_Label" runat="server" 
                        Text='<%# Bind("OS_AT_D_MINUS_1_Principal","{0:#,##0.##}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="OS @ D-1: Accrued" 
                SortExpression="OS_AT_D_MINUS_1_Accrued">
                <EditItemTemplate>
                    <asp:TextBox ID="OS_AT_D_MINUS_1_Accrued_TextBox" runat="server" 
                        Text='<%# Bind("OS_AT_D_MINUS_1_Accrued","{0:#,##0.##}") %>'
                        IsNumeric="Yes"></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="OS_AT_D_MINUS_1_Accrued_TextBox" runat="server" 
                        Text='<%# Bind("OS_AT_D_MINUS_1_Accrued","{0:#,##0.##}") %>'
                        IsNumeric="Yes"></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="OS_AT_D_MINUS_1_Accrued_Label" runat="server" 
                        Text='<%# Bind("OS_AT_D_MINUS_1_Accrued","{0:#,##0.##}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="OS @ D-1: Suspense" 
                SortExpression="OS_AT_D_MINUS_1_Suspense">
                <EditItemTemplate>
                    <asp:TextBox ID="OS_AT_D_MINUS_1_Suspense_TextBox" runat="server" 
                        Text='<%# Bind("OS_AT_D_MINUS_1_Suspense","{0:#,##0.##}") %>'
                        IsNumeric="Yes"></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="OS_AT_D_MINUS_1_Suspense_TextBox" runat="server" 
                        Text='<%# Bind("OS_AT_D_MINUS_1_Suspense","{0:#,##0.##}") %>'
                        IsNumeric="Yes"></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="OS_AT_D_MINUS_1_Suspense_Label" runat="server" 
                        Text='<%# Bind("OS_AT_D_MINUS_1_Suspense","{0:#,##0.##}") %>'></asp:Label>
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
    <asp:SqlDataSource ID="TRANSACTION_INFORMATION_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>"
        SelectCommand="P_TRANSACTION_INFORMATION_SELECT" SelectCommandType="StoredProcedure"
        UpdateCommand="P_TRANSACTION_INFORMATION_UPDATE" UpdateCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter Name="CIF" QueryStringField="cif" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="CIF" Type="String" />
            <asp:Parameter Name="Default_Date" Type="DateTime" />
            <asp:Parameter Name="BRAN" Type="String" />
            <asp:Parameter Name="ACCGL" Type="String" />
            <asp:Parameter Name="ACCNO" Type="String" />
            <asp:Parameter Name="CONTNO" Type="String" />
            <asp:Parameter Name="SEQNO" Type="String" />
            <asp:Parameter Name="LIMITNO" Type="String" />
            <asp:Parameter Name="FCY_TYPE_Original_Currency_Code" Type="String" />
            <asp:Parameter Name="Currency_Code" Type="String" />
            <asp:Parameter Name="LNSTYPE" Type="String" />
            <asp:Parameter Name="Total_Interest_Rate_Prior_to_Default" Type="Double" />
            <asp:Parameter Name="Interest_Rate_Index_Prior_to_Default" Type="String" />
            <asp:Parameter Name="Interest_Rate_Spread_Prior_to_Default_Percentage" Type="Double" />
            <asp:Parameter Name="Rate_Sign" Type="String" />
            <asp:Parameter Name="OS_AT_D_Principal" Type="Double" />
            <asp:Parameter Name="OS_AT_D_Accrued" Type="Double" />
            <asp:Parameter Name="OS_AT_D_Suspense" Type="Double" />
            <asp:Parameter Name="OS_AT_D_MINUS_1_Principal" Type="Double" />
            <asp:Parameter Name="OS_AT_D_MINUS_1_Accrued" Type="Double" />
            <asp:Parameter Name="OS_AT_D_MINUS_1_Suspense" Type="Double" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="Currency_DataSource" runat="server" EnableCaching="True" ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>"
        SelectCommand="L_CURRENCY_CODE_SELECT" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource ID="Rate_Type_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>"
        SelectCommand="P_L_RATE TYPE_SELECT" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>