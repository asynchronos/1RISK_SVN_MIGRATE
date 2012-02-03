<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="PV_LOSS.aspx.cs" Inherits="LGDCollectionData.Aspx.PV_LOSS" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="../UserControls/SelectFormWebUserControl.ascx" TagName="SelectFormWebUserControl"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript">
        function fillCell(row, cellNumber, text) {
            var cell = row.insertCell(cellNumber);
            cell.innerHTML = text;
            cell.style.borderBottom = cell.style.borderRight = "solid 1px #aaaaff";
        }
        function addToClientTable(name, text) {
            var table = document.getElementById("<%= resultTable.ClientID %>");
            var row = table.insertRow(0);
            fillCell(row, 0, name);
            fillCell(row, 1, text);
        }

        function uploadError(sender, args) {
            addToClientTable(args.get_fileName(), "<span style='color:red;'>" + args.get_errorMessage() + "</span>");
        }
        function uploadComplete(sender, args) {
            var contentType = args.get_contentType();
            var text = args.get_length() + " bytes";
            if (contentType.length > 0) {
                //text += ", '" + contentType + "'";
                text = "'" + contentType + "'";
            }
            addToClientTable(args.get_fileName(), text);
        }
    </script>
    <!-- Ext includes -->
    <link rel="stylesheet" type="text/css" href="../ExtJS/resources/css/ext-all.css" />
    <script type="text/javascript" src="../ExtJS/adapter/ext/ext-base.js"></script>
    <script type="text/javascript" src="../ExtJS/ext-all.js"></script>
    <script type="text/javascript" src="../Scripts/CommonExt.js"></script>
    <script type="text/javascript" src="../Scripts/common.js"></script>
    <script type="text/javascript">
        function returnNum(event, sender) {
            sender.value = (new MyNumber(sender.value)).toCurrency(2);
        }

        function onUpdating() {
            // get the update progress div
            var updateProgressDiv = $get('updateProgressDiv');
            // make it visible
            updateProgressDiv.style.display = '';

            //  get the gridview element
            var gridView = $get('<%= this.RESTRUCTURE_INFORMATION_GridView.ClientID %>');

            // get the bounds of both the gridview and the progress div
            var gridViewBounds = Sys.UI.DomElement.getBounds(gridView);
            var updateProgressDivBounds = Sys.UI.DomElement.getBounds(updateProgressDiv);

            //    do the math to figure out where to position the element (the center of the gridview)
            var x = gridViewBounds.x + Math.round(gridViewBounds.width / 2) - Math.round(updateProgressDivBounds.width / 2);
            var y = gridViewBounds.y + Math.round(gridViewBounds.height / 2) - Math.round(updateProgressDivBounds.height / 2);

            //    set the progress element to this position
            Sys.UI.DomElement.setLocation(updateProgressDiv, x, y);
        }

        function onUpdated() {
            // get the update progress div
            var updateProgressDiv = $get('updateProgressDiv');
            // make it invisible
            updateProgressDiv.style.display = 'none';
        }
    </script>
    <style type="text/css">
        .NumTextBox
        {
            text-align: right;
        }
        .loadingStyle
        {
            position: absolute;
            left: 47%;
            top: 10%;
            background-image: url(../images/progress/cicle/indicator_verybig.gif);
            background-repeat: no-repeat;
            text-align: center;
            vertical-align: middle;
            z-index: 99999;
            width: 128px;
            height: 128px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" EnableScriptGlobalization="true">
    </asp:ToolkitScriptManager>
    <uc1:SelectFormWebUserControl ID="SelectFormWebUserControl1" runat="server" />
    <table>
        <tr>
            <td>
                <h2>
                    <asp:Label ID="FormName_Label" runat="server" Text="PV GAIN(LOSS)"></asp:Label>
                </h2>
            </td>
            <td>
                <h2>
                    UPLOAD RESTRUCTURE INFORMATION
                    <asp:HyperLink ID="Download_HyperLink" runat="server" ImageUrl="~/Images/downloadExcel32.png"
                        Width="32px" Text="Download Excel Template" Height="32px" NavigateUrl="~/Excel/RestructureTemplate.xls"></asp:HyperLink>
                </h2>
            </td>
        </tr>
        <tr>
            <td>
                <asp:DropDownList ID="DDLValidate" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DDLValidate_SelectedIndexChanged">
                    <asp:ListItem Value="-1">All</asp:ListItem>
                    <asp:ListItem Value="1">Validate</asp:ListItem>
                </asp:DropDownList>
                <asp:DetailsView ID="PV_LOSS_DetailsView" runat="server" AllowPaging="True" AutoGenerateRows="False"
                    CellPadding="4" DataKeyNames="CIF,Default_Date,Date_of_Restructure" DataSourceID="PV_LOSS_SqlDataSource"
                    EnableModelValidation="True" ForeColor="#333333" OnPageIndexChanging="DetailsView_PageIndexChanging"
                    OnItemUpdating="DetailsView_ItemUpdating" OnItemUpdated="DetailsView_ItemUpdated"
                    OnPreRender="DetailsView_PreRender" Width="350px">
                    <AlternatingRowStyle BackColor="White" />
                    <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                    <EmptyDataTemplate>
                        <asp:TextBox ID="Empty_TextBox" runat="server"></asp:TextBox>
                    </EmptyDataTemplate>
                    <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
                    <Fields>
                        <asp:TemplateField HeaderText="CIF" SortExpression="CIF">
                            <EditItemTemplate>
                                <asp:Label ID="CIF_Label" runat="server" Text='<%# Bind("CIF") %>'></asp:Label>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="CIF_TextBox" runat="server" Text='<%# Bind("CIF") %>' OnPreRender="CIF_TextBox_PreRender"
                                    BackColor="#C0C0C0" onfocus="this.blur();"></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="CIF_Label" runat="server" Text='<%# Eval("CIF") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Default Date" SortExpression="Default_Date">
                            <EditItemTemplate>
                                <asp:Label ID="Default_Date_Label" runat="server" Text='<%# Eval("Default_Date", "{0:d MMMM yyyy}") %>'></asp:Label>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="Default_Date_TextBox" runat="server" Text='<%# Bind("Default_Date", "{0:d MMMM yyyy}") %>'></asp:TextBox>
                                <asp:CalendarExtender ID="Default_Date_TextBox_CalendarExtender" runat="server" Enabled="True"
                                    TargetControlID="Default_Date_TextBox" Format="d MMMM yyyy" DaysModeTitleFormat="MMMM yyyy"
                                    TodaysDateFormat="d MMMM yyyy">
                                </asp:CalendarExtender>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Default_Date_Label" runat="server" Text='<%# Bind("Default_Date", "{0:d MMMM yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Date of Restructure" SortExpression="Date_of_Restructure">
                            <EditItemTemplate>
                                <asp:Label ID="Date_of_Restructure_Label" runat="server" Text='<%# Eval("Date_of_Restructure", "{0:d MMMM yyyy}") %>'></asp:Label>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="Date_of_Restructure_TextBox" runat="server" Text='<%# Bind("Date_of_Restructure", "{0:d MMMM yyyy}") %>'></asp:TextBox>
                                <asp:CalendarExtender ID="Date_of_Restructure_TextBox_CalendarExtender" runat="server"
                                    Enabled="True" TargetControlID="Date_of_Restructure_TextBox" Format="d MMMM yyyy"
                                    DaysModeTitleFormat="MMMM yyyy" TodaysDateFormat="d MMMM yyyy">
                                </asp:CalendarExtender>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Date_of_Restructure_Label" runat="server" Text='<%# Bind("Date_of_Restructure", "{0:d MMMM yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Date of Upgrade" SortExpression="Date_of_Upgrade">
                            <EditItemTemplate>
                                <asp:Label ID="Date_of_Upgrade_Label" runat="server" Text='<%# Bind("Date_of_Upgrade", "{0:d MMMM yyyy}") %>'></asp:Label>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="Date_of_Upgrade_TextBox" runat="server" Text='<%# Bind("Date_of_Upgrade", "{0:d MMMM yyyy}") %>'></asp:TextBox>
                                <asp:CalendarExtender ID="Date_of_Upgrade_TextBox_CalendarExtender" runat="server"
                                    Enabled="True" TargetControlID="Date_of_Upgrade_TextBox" Format="d MMMM yyyy"
                                    DaysModeTitleFormat="MMMM yyyy" TodaysDateFormat="d MMMM yyyy">
                                </asp:CalendarExtender>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Date_of_Upgrade_Label" runat="server" Text='<%# Bind("Date_of_Upgrade", "{0:d MMMM yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Pv Gain(Loss)" SortExpression="Pv_Loss">
                            <EditItemTemplate>
                                <asp:TextBox ID="Pv_Loss_TextBox" runat="server" Text='<%# Bind("Pv_Loss","{0:#,##0.00}") %>'
                                    onkeyup="formatCurrencyOnkeyup(this,event);" onblur="returnNum(event,this);"
                                    CssClass="NumTextBox"></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="Pv_Loss_TextBox" runat="server" Text='<%# Bind("Pv_Loss","{0:#,##0.00}") %>'
                                    onkeyup="formatCurrencyOnkeyup(this,event);" onblur="returnNum(event,this);"
                                    CssClass="NumTextBox"></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Pv_Loss_Label" runat="server" Text='<%# Bind("Pv_Loss","{0:#,##0.00}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <%--<asp:LinkButton ID="New_LinkButton" runat="server" CausesValidation="False" CommandName="New"
                                    Text="New"></asp:LinkButton>
                                &nbsp;--%><asp:LinkButton ID="Update_LinkButton" runat="server" CausesValidation="True"
                                    CommandName="Update" Text="Update"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="Cancel_LinkButton" runat="server" CausesValidation="False"
                                    CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:LinkButton ID="Insert_LinkButton" runat="server" CausesValidation="True" CommandName="Insert"
                                    Text="Insert"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="Cancel_LinkButton" runat="server" CausesValidation="False"
                                    CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="Edit_LinkButton" runat="server" CausesValidation="False" CommandName="Edit"
                                    Text="Edit"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="New_LinkButton" runat="server" CausesValidation="False"
                                    CommandName="New" Text="New"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Fields>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerSettings Mode="NumericFirstLast" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                </asp:DetailsView>
                <asp:SqlDataSource ID="PV_LOSS_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>"
                    InsertCommand="P_PV_LOSS_INSERT" InsertCommandType="StoredProcedure" SelectCommand="P_PV_LOSS_SELECT"
                    SelectCommandType="StoredProcedure" UpdateCommand="P_PV_LOSS_UPDATE" UpdateCommandType="StoredProcedure">
                    <InsertParameters>
                        <asp:Parameter Name="CIF" Type="String" />
                        <asp:Parameter Name="Default_Date" Type="DateTime" />
                        <asp:Parameter Name="Date_of_Restructure" Type="DateTime" />
                        <asp:Parameter Name="Date_of_Upgrade" Type="DateTime" />
                        <asp:Parameter Name="Pv_Loss" Type="Double" />
                        <asp:Parameter Name="UpdateUser" Type="String" />
                        <asp:Parameter Name="updateDate" Type="DateTime" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:QueryStringParameter Name="CIF" QueryStringField="cif" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="CIF" Type="String" />
                        <asp:Parameter Name="Default_Date" Type="DateTime" />
                        <asp:Parameter Name="Date_of_Restructure" Type="DateTime" />
                        <asp:Parameter Name="Date_of_Upgrade" Type="DateTime" />
                        <asp:Parameter Name="Pv_Loss" Type="Double" />
                        <asp:Parameter Name="UpdateUser" Type="String" />
                        <asp:Parameter Name="updateDate" Type="DateTime" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
            <td valign="top">
                <asp:Panel ID="Upload_Panel" runat="server">
                    <asp:AsyncFileUpload ID="RESTRUCTURE_INFORMATION_FileUpload" runat="server" UploaderStyle="Modern"
                        UploadingBackColor="#66FF66" ThrobberID="myThrobber" OnClientUploadError="uploadError"
                        OnClientUploadComplete="uploadComplete" OnUploadedComplete="RESTRUCTURE_INFORMATION_FileUpload_UploadedComplete"
                        OnUploadedFileError="RESTRUCTURE_INFORMATION_FileUpload_UploadedFileError" ClientIDMode="AutoID" />
                    <asp:Label runat="server" ID="myThrobber" Style="display: none;">
            <img id="uploading_Img" alt="uploading..." src="../Images/uploading.gif" />
                    </asp:Label>
                    <div>
                        <strong>The latest upload event:</strong></div>
                    <asp:Label runat="server" Text="&nbsp;" ID="uploadResult" />
                    <br />
                    <br />
                    <div>
                        <strong>Upload List:</strong></div>
                    <table style="border-collapse: collapse; border-left: solid 1px #aaaaff; border-top: solid 1px #aaaaff;"
                        runat="server" cellpadding="3" id="resultTable" />
                </asp:Panel>
            </td>
        </tr>
    </table>
    <h2>
        <asp:Label ID="FromName_Label2" runat="server" Text="RESTRUCTURE INFORMATION"></asp:Label>
    </h2>
    <asp:DropDownList ID="DDLValidate2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DDLValidate2_SelectedIndexChanged">
        <asp:ListItem Value="-1">All</asp:ListItem>
        <asp:ListItem Value="1">Validate</asp:ListItem>
    </asp:DropDownList>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:ImageButton ID="Refresh_Button" runat="server" ImageUrl="~/Images/refresh2.png"
                Width="32px" AlternateText="Refresh Data" />&nbsp;
            <asp:ImageButton ID="Delete_All_Button" runat="server" ImageUrl="~/Images/delete.png"
                Width="32px" OnClick="Delete_All_Button_Click" AlternateText="Delete All" OnClientClick="return confirm('คุณต้องการลบข้อมูลที่แสดงด้านล่างนี้ทั้งหมด?');" />
            <asp:GridView ID="RESTRUCTURE_INFORMATION_GridView" runat="server" AllowPaging="True"
                AutoGenerateColumns="False" CellPadding="4" DataKeyNames="CIF,Default_Date,Date_of_Restructure,Date_of_Repayment"
                DataSourceID="RESTRUCTURE_INFORMATION_SqlDataSource" EnableModelValidation="True"
                ForeColor="#333333" ShowFooter="True" OnRowCommand="RESTRUCTURE_INFORMATION_GridView_RowCommand"
                OnRowUpdating="GridView_RowUpdating">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="Update_LinkButton" runat="server" CausesValidation="True" CommandName="Update"
                                Text="Update"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="Cancel_LinkButton" runat="server" CausesValidation="False"
                                CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="Edit_LinkButton" runat="server" CausesValidation="False" CommandName="Edit"
                                Text="Edit"></asp:LinkButton>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:LinkButton ID="Insert_LinkButton" runat="server" CausesValidation="True" CommandName="FooterInsert"
                                Text="Insert" ValidationGroup="BeforeInsert"></asp:LinkButton>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="Delete_LinkButton" runat="server" CausesValidation="False" CommandName="Delete"
                                Text="Delete" OnClientClick="return confirm('คุณต้องการลบข้อมูล Record นี้?');"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="CIF" SortExpression="CIF">
                        <EditItemTemplate>
                            <asp:Label ID="CIF_Label" runat="server" Text='<%# Eval("CIF") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="CIF_Label" runat="server" Text='<%# Bind("CIF") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:Label ID="CIF_Label" runat="server" OnPreRender="CIF_Label_PreRender"></asp:Label>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Default Date" SortExpression="Default_Date">
                        <EditItemTemplate>
                            <asp:Label ID="Default_Date_Label" runat="server" Text='<%# Eval("Default_Date", "{0:d MMMM yyyy}") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Default_Date_Label" runat="server" Text='<%# Bind("Default_Date", "{0:d MMMM yyyy}") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:Label ID="Default_Date_Label" runat="server" OnPreRender="Default_Date_Label_PreRender"></asp:Label>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Date of Restructure" SortExpression="Date_of_Restructure">
                        <EditItemTemplate>
                            <asp:Label ID="Date_of_Restructure_Label" runat="server" Text='<%# Bind("Date_of_Restructure", "{0:d MMMM yyyy}") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Date_of_Restructure_Label" runat="server" Text='<%# Bind("Date_of_Restructure", "{0:d MMMM yyyy}") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:Label ID="Date_of_Restructure_Label" runat="server" OnPreRender="Date_of_Restructure_Label_PreRender"></asp:Label>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Date of Repayment" SortExpression="Date_of_Repayment">
                        <EditItemTemplate>
                            <asp:Label ID="Date_of_Repayment_Label" runat="server" Text='<%# Eval("Date_of_Repayment", "{0:d MMMM yyyy}") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Date_of_Repayment_Label" runat="server" Text='<%# Bind("Date_of_Repayment", "{0:d MMMM yyyy}") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="Date_of_Repayment_TextBox" runat="server" Width="17ex"></asp:TextBox>
                            <asp:CalendarExtender ID="Date_of_Repayment_TextBox_CalendarExtender" runat="server"
                                Enabled="True" TargetControlID="Date_of_Repayment_TextBox" Format="d MMMM yyyy">
                            </asp:CalendarExtender>
                            <asp:RequiredFieldValidator ID="Date_of_Repayment_TextBox_RequiredFieldValidator"
                                runat="server" ErrorMessage="*" ControlToValidate="Date_of_Repayment_TextBox"
                                ValidationGroup="BeforeInsert"></asp:RequiredFieldValidator>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Discount_Rate(%)" SortExpression="Discount_Rate">
                        <EditItemTemplate>
                            <asp:TextBox ID="Discount_Rate_TextBox" runat="server" Text='<%# Bind("Discount_Rate","{0:#,##0.00}") %>'
                                onkeyup="formatCurrencyOnkeyup(this,event);" onblur="returnNum(event,this)" CssClass="NumTextBox"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Discount_Rate_Label" runat="server" Text='<%# Bind("Discount_Rate","{0:#,##0.00}") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="Discount_Rate_TextBox" runat="server" onkeyup="formatCurrencyOnkeyup(this,event);"
                                onblur="returnNum(event,this);" CssClass="NumTextBox"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="Discount_Rate_TextBox_RequiredFieldValidator" runat="server"
                                ErrorMessage="*" ControlToValidate="Discount_Rate_TextBox" ValidationGroup="BeforeInsert"></asp:RequiredFieldValidator>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="TDR_Cash_Flow" SortExpression="TDR_Cash_Flow">
                        <EditItemTemplate>
                            <asp:TextBox ID="TDR_Cash_Flow_TextBox" runat="server" Text='<%# Bind("TDR_Cash_Flow","{0:#,##0.00}") %>'
                                onkeyup="formatCurrencyOnkeyup(this,event);" onblur="returnNum(event,this);"
                                CssClass="NumTextBox"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="TDR_Cash_Flow_Label" runat="server" Text='<%# Bind("TDR_Cash_Flow","{0:#,##0.00}") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="TDR_Cash_Flow_TextBox" runat="server" onkeyup="formatCurrencyOnkeyup(this,event);"
                                onblur="returnNum(event,this);" CssClass="NumTextBox"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="TDR_Cash_Flow_TextBox_RequiredFieldValidator" runat="server"
                                ErrorMessage="*" ControlToValidate="TDR_Cash_Flow_TextBox" ValidationGroup="BeforeInsert"></asp:RequiredFieldValidator>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Present_Value_of_Repayment" SortExpression="Present_Value_of_Repayment">
                        <EditItemTemplate>
                            <asp:TextBox ID="Present_Value_of_Repayment_TextBox" runat="server" Text='<%# Bind("Present_Value_of_Repayment","{0:#,##0.00}") %>'
                                onkeyup="formatCurrencyOnkeyup(this,event);" onblur="returnNum(event,this);"
                                CssClass="NumTextBox"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Present_Value_of_Repayment_Label" runat="server" Text='<%# Bind("Present_Value_of_Repayment","{0:#,##0.00}") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="Present_Value_of_Repayment_TextBox" runat="server" onkeyup="formatCurrencyOnkeyup(this,event);"
                                onblur="returnNum(event,this);" CssClass="NumTextBox"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="Present_Value_of_Repayment_TextBox_RequiredFieldValidator"
                                runat="server" ErrorMessage="*" ControlToValidate="Present_Value_of_Repayment_TextBox"
                                ValidationGroup="BeforeInsert"></asp:RequiredFieldValidator>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Cash_Flow_Currency" SortExpression="Cash_Flow_Currency">
                        <EditItemTemplate>
                            <asp:DropDownList ID="Cash_Flow_Currency_DropDownList" runat="server" DataSourceID="Currency_DataSource"
                                DataTextField="Description" DataValueField="Code" SelectedValue='<%# Bind("Cash_Flow_Currency") %>'>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:DropDownList ID="Cash_Flow_Currency_DropDownList" runat="server" DataSourceID="Currency_DataSource"
                                DataTextField="Description" DataValueField="Code" SelectedValue='<%# Bind("Cash_Flow_Currency") %>'>
                            </asp:DropDownList>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList ID="Cash_Flow_Currency_DropDownList" runat="server" DataSourceID="Currency_DataSource"
                                DataTextField="Description" DataValueField="Code">
                            </asp:DropDownList>
                        </FooterTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <table border="0">
                        <thead style="background-color: #990000; font-weight: bold; color: White;">
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    CIF
                                </td>
                                <td>
                                    Default_Date
                                </td>
                                <td>
                                    Date_of_Restructure
                                </td>
                                <td>
                                    Date_of_Repayment
                                </td>
                                <td>
                                    Discount_Rate
                                </td>
                                <td>
                                    TDR_Cash_Flow
                                </td>
                                <td>
                                    Present_Value_of_Repayment
                                </td>
                                <td>
                                    Cash_Flow_Currency
                                </td>
                            </tr>
                        </thead>
                        <tr style="background-color: #FFFBD6; color: #333333;">
                            <td>
                                <asp:LinkButton ID="Insert_LinkButton" runat="server" CausesValidation="True" CommandName="EmptyDataTemplateInsert"
                                    Text="Insert"></asp:LinkButton>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <asp:Label ID="CIF_Label" runat="server" OnPreRender="CIF_Label_PreRender"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Default_Date_Label" runat="server" OnPreRender="Default_Date_Label_PreRender"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Date_of_Restructure_Label" runat="server" OnPreRender="Date_of_Restructure_Label_PreRender"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Date_of_Repayment_TextBox" runat="server" Width="17ex"></asp:TextBox>
                                <asp:CalendarExtender ID="Date_of_Repayment_TextBox_CalendarExtender" runat="server"
                                    Enabled="True" TargetControlID="Date_of_Repayment_TextBox" Format="d MMMM yyyy">
                                </asp:CalendarExtender>
                                <asp:RequiredFieldValidator ID="Date_of_Repayment_TextBox_RequiredFieldValidator"
                                    runat="server" ErrorMessage="*" ControlToValidate="Date_of_Repayment_TextBox"
                                    ValidationGroup="BeforeInsert"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:TextBox ID="Discount_Rate_TextBox" runat="server" onkeyup="formatCurrencyOnkeyup(this,event);"
                                    onblur="returnNum(event,this);"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="Discount_Rate_TextBox_RequiredFieldValidator" runat="server"
                                    ErrorMessage="*" ControlToValidate="Discount_Rate_TextBox" ValidationGroup="BeforeInsert"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:TextBox ID="TDR_Cash_Flow_TextBox" runat="server" onkeyup="formatCurrencyOnkeyup(this,event);"
                                    onblur="returnNum(event,this);"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="TDR_Cash_Flow_TextBox_RequiredFieldValidator" runat="server"
                                    ErrorMessage="*" ControlToValidate="TDR_Cash_Flow_TextBox" ValidationGroup="BeforeInsert"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:TextBox ID="Present_Value_of_Repayment_TextBox" runat="server" onkeyup="formatCurrencyOnkeyup(this,event);"
                                    onblur="returnNum(event,this);"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="Present_Value_of_Repayment_TextBox_RequiredFieldValidator"
                                    runat="server" ErrorMessage="*" ControlToValidate="Present_Value_of_Repayment_TextBox"
                                    ValidationGroup="BeforeInsert"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:DropDownList ID="Cash_Flow_Currency_DropDownList" runat="server" DataSourceID="Currency_DataSource"
                                    DataTextField="Description" DataValueField="Code">
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <PagerSettings Mode="NumericFirstLast" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            </asp:GridView>
            <asp:SqlDataSource ID="RESTRUCTURE_INFORMATION_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>"
                SelectCommand="P_RESTRUCTURE_INFORMATION_SELECT" SelectCommandType="StoredProcedure"
                InsertCommand="P_RESTRUCTURE_INFORMATION_INSERT" InsertCommandType="StoredProcedure"
                UpdateCommand="P_RESTRUCTURE_INFORMATION_UPDATE" UpdateCommandType="StoredProcedure"
                DeleteCommand="P_RESTRUCTURE_INFORMATION_DELETE" DeleteCommandType="StoredProcedure">
                <DeleteParameters>
                    <asp:Parameter Name="CIF" Type="String" />
                    <asp:Parameter Name="Default_Date" Type="DateTime" />
                    <asp:Parameter Name="Date_of_Restructure" Type="DateTime" />
                    <asp:Parameter Name="Date_of_Repayment" Type="DateTime" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="CIF" Type="String" />
                    <asp:Parameter Name="Default_Date" Type="DateTime" />
                    <asp:Parameter Name="Date_of_Restructure" Type="DateTime" />
                    <asp:Parameter Name="Date_of_Repayment" Type="DateTime" />
                    <asp:Parameter Name="Discount_Rate" Type="Double" />
                    <asp:Parameter Name="TDR_Cash_Flow" Type="Double" />
                    <asp:Parameter Name="Present_Value_of_Repayment" Type="Double" />
                    <asp:Parameter Name="Cash_Flow_Currency" Type="String" />
                    <asp:Parameter Name="UpdateUser" Type="String" />
                    <asp:Parameter Name="UpdateDate" Type="DateTime" />
                </InsertParameters>
                <SelectParameters>
                    <asp:Parameter Name="CIF" Type="String" />
                    <asp:Parameter Name="Default_Date" Type="DateTime" />
                    <asp:Parameter Name="Date_of_Restructure" Type="DateTime" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="CIF" Type="String" />
                    <asp:Parameter Name="Default_Date" Type="DateTime" />
                    <asp:Parameter Name="Date_of_Restructure" Type="DateTime" />
                    <asp:Parameter Name="Date_of_Repayment" Type="DateTime" />
                    <asp:Parameter Name="Discount_Rate" Type="Double" />
                    <asp:Parameter Name="TDR_Cash_Flow" Type="Double" />
                    <asp:Parameter Name="Present_Value_of_Repayment" Type="Double" />
                    <asp:Parameter Name="Cash_Flow_Currency" Type="String" />
                    <asp:Parameter Name="UpdateUser" Type="String" />
                    <asp:Parameter Name="UpdateDate" Type="DateTime" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="Currency_DataSource" runat="server" EnableCaching="True" ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>"
                SelectCommand="L_CURRENCY_CODE_SELECT" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
    <%--<asp:LinkButton ID="New_LinkButton" runat="server" CausesValidation="False" CommandName="New"
                                    Text="New"></asp:LinkButton>
                                &nbsp;--%>
    <asp:UpdatePanelAnimationExtender ID="UpdatePanel1_UpdatePanelAnimationExtender"
        runat="server" Enabled="True" TargetControlID="UpdatePanel1">
        <Animations>
        <OnUpdating>
            <Parallel duration="0">
                <%-- place the update progress div over the gridview control --%>
                <ScriptAction Script="onUpdating();" />
                <%-- disable the search button --%>
                <EnableAction AnimationTarget="RESTRUCTURE_INFORMATION_FileUpload" Enabled="false" />
                <EnableAction AnimationTarget="Update_LinkButton" Enabled="false" />
                <%-- fade-out the GridView --%>
                <FadeOut minimumOpacity=".5" />
             </Parallel>
        </OnUpdating>
        <OnUpdated>
            <Parallel duration="0">
                <%-- fade back in the GridView --%>
                <FadeIn minimumOpacity=".5" />
                <%-- re-enable the search button --%>
                <EnableAction AnimationTarget="RESTRUCTURE_INFORMATION_FileUpload" Enabled="true" />
                <EnableAction AnimationTarget="Update_LinkButton" Enabled="true" />
                <%--find the update progress div and place it over the gridview control--%>
                <ScriptAction Script="onUpdated();" />
            </Parallel>
        </OnUpdated>
        </Animations>
    </asp:UpdatePanelAnimationExtender>
    <div id="updateProgressDiv" style="display: none; width: 199px; height: 64px;">
        <img alt="Loading" src="../Images/3MA_loadingcontent.gif" />
    </div>
    <%--&nbsp;<asp:LinkButton ID="New_LinkButton" runat="server" CausesValidation="False"
                                    CommandName="New" Text="New"></asp:LinkButton>--%>
</asp:Content>