<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="LIMIT_STRUCTURE.aspx.cs" MaintainScrollPositionOnPostback="true"
    Inherits="LGDCollectionData.Aspx.LIMIT_STRUCTURE" Culture="en-US" UICulture="en-US" %>

<%@ Register Src="../UserControls/SelectFormWebUserControl.ascx" TagName="SelectFormWebUserControl"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript">
        function popupAlert(msg) {
            alert(msg);
        }
    </script>
    <style type="text/css">
        .gvFixedHeader
        {
            white-space:nowrap;
        }
    </style>
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
    <asp:Button ID="BtnLinktoFacility" Text="Link To Facility Information" runat="server"
        OnClick="BtnLinktoFacility_Click" />
    <uc1:SelectFormWebUserControl ID="SelectFormWebUserControl1" runat="server" />
    <h2>
        <asp:Label ID="FormName_Label" runat="server" Text="LIMIT STRUCTURE"></asp:Label>
    </h2>
    <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False"
        DataKeyNames="CIF,Default_Date,LIMITNO" 
        DataSourceID="SqlDataSourceLIMIT_STRUCTURE"
        ForeColor="#333333" 
        OnPreRender="DetailsView_OnPreRender"
        OnPageIndexChanging="DetailsView_PageIndexChanging"
        OnItemUpdating="DetailsView_ItemUpdating"
        OnItemUpdated="DetailsView_ItemUpdated"
        Width="800px" CellPadding="4" GridLines="Both">
        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
        <EmptyDataTemplate>
            <asp:TextBox ID="Empty_TextBox" runat="server"></asp:TextBox>
        </EmptyDataTemplate>
        <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" Width="35%" />
        <Fields>
            <asp:TemplateField HeaderText="CIF" SortExpression="CIF">
                <EditItemTemplate>
                    <asp:Label ID="LabelCIF" runat="server" Text='<%# Eval("CIF") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBoxCIF" runat="server" OnPreRender="CIF_TextBox_PreRender" Text='<%# Bind("CIF") %>'
                        BackColor="#C0C0C0" onfocus="this.blur();"></asp:TextBox>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Default Date" SortExpression="Default_Date">
                <EditItemTemplate>
                    <asp:Label ID="LabelDefault_Date" runat="server" Text='<%# Eval("Default_Date", "{0:d MMMM yyyy}") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox17" runat="server" OnPreRender="DEFAULT_DATE_TextBox_PreRender"
                        Text='<%# Bind("Default_Date", "{0:d MMMM yyyy}") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="LabelDefault_Date" runat="server" Text='<%# Bind("Default_Date", "{0:d MMMM yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="APP ID" SortExpression="APP_ID">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownListAPP" runat="server" DataSourceID="SqlDataSourceAPP"
                        DataTextField="APP_ID" DataValueField="APP_ID" SelectedValue='<%# Bind("APP_ID")%>'
                        AppendDataBoundItems="true">
                        <asp:ListItem Value="">...Please Select...</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownListAPP" runat="server" DataSourceID="SqlDataSourceAPP"
                        DataTextField="APP_ID" DataValueField="APP_ID" SelectedValue='<%# Bind("APP_ID")%>'
                        AppendDataBoundItems="true">
                        <asp:ListItem Value="">...Please Select...</asp:ListItem>
                    </asp:DropDownList>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("APP_ID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="LIMITTYPE A" SortExpression="LIMITTYP_A">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownListLIMITTYPE" runat="server" DataSourceID="SqlDataSourceLIMIT_TYPE"
                        DataTextField="LIMITTYP_A" DataValueField="LIMITTYP_A" AppendDataBoundItems="true"
                        SelectedValue='<%# Bind("LIMITTYP_A")%>'>
                        <asp:ListItem Value="">...Please Select...</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownListLIMITTYPE" runat="server" DataSourceID="SqlDataSourceLIMIT_TYPE"
                        DataTextField="LIMITTYP_A" DataValueField="LIMITTYP_A" AppendDataBoundItems="true"
                        SelectedValue='<%# Bind("LIMITTYP_A")%>'>
                        <asp:ListItem Value="">...Please Select...</asp:ListItem>
                    </asp:DropDownList>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("LIMITTYP_A") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="LIMIT NO" SortExpression="LIMITNO">
                <EditItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("LIMITNO") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBoxLimitNo" runat="server" Text='<%# Bind("LIMITNO") %>'></asp:TextBox>
                    <asp:Label ID="LabelStarLimitNo" runat="server" Text="*" ForeColor="Red"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldLimitNo" runat="server" ControlToValidate="TextBoxLimitNo"
                        ErrorMessage="Limit No is a required field." ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Limit @ D-1" SortExpression="Limit_D1">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Limit_D1","{0:#,##0.00}") %>' IsNumeric="Yes"
                        Style="text-align: right;"></asp:TextBox>
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Input Limit_D1" ControlToValidate="TextBox1" ValidationGroup="UpdateValidation" Text="*" ></asp:RequiredFieldValidator>--%>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Limit_D1","{0:#,##0.00}") %>' IsNumeric="Yes"></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("Limit_D1","{0:#,##0.00}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="One Level Up Limit ID @ D-1" SortExpression="One_Level_Up_Limit_ID_D1">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxOne_Level_Up_Limit_ID_D1" runat="server" Text='<%# Bind("One_Level_Up_Limit_ID_D1") %>'></asp:TextBox>
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Input One_Level_Up_Limit_ID_D1" ControlToValidate="TextBox2" ValidationGroup="UpdateValidation" Text="*" ></asp:RequiredFieldValidator>--%>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBoxOne_Level_Up_Limit_ID_D1" runat="server" Text='<%# Bind("One_Level_Up_Limit_ID_D1") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="LabelOne_Level_Up_Limit_ID_D1" runat="server" Text='<%# Bind("One_Level_Up_Limit_ID_D1") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="One Level Up Limit Currency @ D-1" SortExpression="One_Level_Up_Limit_Currency_D1">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownListCurrency1" runat="server" DataSourceID="SqlDataSourceCurrentcy"
                        DataTextField="Description" DataValueField="Code" SelectedValue='<%# Bind("One_Level_Up_Limit_Currency_D1")%>'
                        AppendDataBoundItems="true">
                        <asp:ListItem Value="">...Please Select...</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownListCurrency1" runat="server" DataSourceID="SqlDataSourceCurrentcy"
                        DataTextField="Description" DataValueField="Code" SelectedValue='<%# Bind("One_Level_Up_Limit_Currency_D1")%>'
                        AppendDataBoundItems="true">
                        <asp:ListItem Value="">...Please Select...</asp:ListItem>
                    </asp:DropDownList>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("One_Level_Up_Limit_Currency_D1") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="One Level Up Limit Amount @ D-1" SortExpression="One_Level_Up_Limit_Amount_D1">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxOne_Level_Up_Limit_Amount_D1" runat="server" Text='<%# Bind("One_Level_Up_Limit_Amount_D1","{0:#,##0.00}") %>' IsNumeric="Yes">
                    </asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBoxOne_Level_Up_Limit_Amount_D1" runat="server" Text='<%# Bind("One_Level_Up_Limit_Amount_D1","{0:#,##0.00}") %>' IsNumeric="Yes"></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("One_Level_Up_Limit_Amount_D1","{0:#,##0.00}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Two Level Up Limit ID @ D-1" SortExpression="Two_Level_Up_Limit_ID_D1">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxTwo_Level_Up_Limit_ID_D1" runat="server" Text='<%# Bind("Two_Level_Up_Limit_ID_D1") %>'></asp:TextBox>
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Input One_Level_Up_Limit_ID_D1" ControlToValidate="TextBox2" ValidationGroup="UpdateValidation" Text="*" ></asp:RequiredFieldValidator>--%>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBoxTwo_Level_Up_Limit_ID_D1" runat="server" Text='<%# Bind("Two_Level_Up_Limit_ID_D1") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="LabelTwo_Level_Up_Limit_ID_D1" runat="server" Text='<%# Bind("Two_Level_Up_Limit_ID_D1") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Two Level Up Limit Currency @ D-1" SortExpression="Two_Level_Up_Limit_Currency_D1">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownListCurrency2" runat="server" DataSourceID="SqlDataSourceCurrentcy"
                        DataTextField="Description" DataValueField="Code" SelectedValue='<%# Bind("Two_Level_Up_Limit_Currency_D1")%>'
                        AppendDataBoundItems="true">
                        <asp:ListItem Value="">...Please Select...</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownListCurrency2" runat="server" DataSourceID="SqlDataSourceCurrentcy"
                        DataTextField="Description" DataValueField="Code" SelectedValue='<%# Bind("Two_Level_Up_Limit_Currency_D1")%>'
                        AppendDataBoundItems="true">
                        <asp:ListItem Value="">...Please Select...</asp:ListItem>
                    </asp:DropDownList>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Two_Level_Up_Limit_Currency_D1") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Two Level Up Limit Amount @ D-1" SortExpression="Two_Level_Up_Limit_Amount_D1">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxTwo_Level_Up_Limit_Amount_D1" runat="server" Text='<%# Bind("Two_Level_Up_Limit_Amount_D1","{0:#,##0.00}") %>' IsNumeric="Yes"></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBoxTwo_Level_Up_Limit_Amount_D1" runat="server" Text='<%# Bind("Two_Level_Up_Limit_Amount_D1","{0:#,##0.00}") %>' IsNumeric="Yes"></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label11" runat="server" Text='<%# Bind("Two_Level_Up_Limit_Amount_D1","{0:#,##0.00}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Three Level Up Limit ID @ D-1" SortExpression="Three_Level_Up_Limit_ID_D1">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxThree_Level_Up_Limit_ID_D1" runat="server" Text='<%# Bind("Three_Level_Up_Limit_ID_D1") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBoxThree_Level_Up_Limit_ID_D1" runat="server" Text='<%# Bind("Three_Level_Up_Limit_ID_D1") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label12" runat="server" Text='<%# Bind("Three_Level_Up_Limit_ID_D1") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Three Level Up Limit Currency @ D-1" SortExpression="Three_Level_Up_Limit_Currency_D1">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownListCurrency3" runat="server" DataSourceID="SqlDataSourceCurrentcy"
                        DataTextField="Description" DataValueField="Code" SelectedValue='<%# Bind("Three_Level_Up_Limit_Currency_D1")%>'
                        AppendDataBoundItems="true">
                        <asp:ListItem Value="">...Please Select...</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownListCurrency3" runat="server" DataSourceID="SqlDataSourceCurrentcy"
                        DataTextField="Description" DataValueField="Code" SelectedValue='<%# Bind("Three_Level_Up_Limit_Currency_D1")%>'
                        AppendDataBoundItems="true">
                        <asp:ListItem Value="">...Please Select...</asp:ListItem>
                    </asp:DropDownList>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Three_Level_Up_Limit_Currency_D1") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Three Level Up Limit Amount @ D-1" SortExpression="Three_Level_Up_Limit_Amount_D1">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxThree_Level_Up_Limit_Amount_D1" runat="server" Text='<%# Bind("Three_Level_Up_Limit_Amount_D1","{0:#,##0.00}") %>' IsNumeric="Yes"></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBoxThree_Level_Up_Limit_Amount_D1" runat="server" Text='<%# Bind("Three_Level_Up_Limit_Amount_D1","{0:#,##0.00}") %>' IsNumeric="Yes"></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label13" runat="server" Text='<%# Bind("Three_Level_Up_Limit_Amount_D1","{0:#,##0.00}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Four Level Up Limit ID @ D-1" SortExpression="Four_Level_Up_Limit_ID_D1">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxFour_Level_Up_Limit_ID_D1" runat="server" Text='<%# Bind("Four_Level_Up_Limit_ID_D1") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBoxFour_Level_Up_Limit_ID_D1" runat="server" Text='<%# Bind("Four_Level_Up_Limit_ID_D1") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label14" runat="server" Text='<%# Bind("Four_Level_Up_Limit_ID_D1") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Four Level Up Limit Currency @ D-1" SortExpression="Four_Level_Up_Limit_Currency_D1">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownListCurrency4" runat="server" DataSourceID="SqlDataSourceCurrentcy"
                        DataTextField="Description" DataValueField="Code" SelectedValue='<%# Bind("Four_Level_Up_Limit_Currency_D1")%>'
                        AppendDataBoundItems="true">
                        <asp:ListItem Value="">...Please Select...</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownListCurrency4" runat="server" DataSourceID="SqlDataSourceCurrentcy"
                        DataTextField="Description" DataValueField="Code" SelectedValue='<%# Bind("Four_Level_Up_Limit_Currency_D1")%>'
                        AppendDataBoundItems="true">
                        <asp:ListItem Value="">...Please Select...</asp:ListItem>
                    </asp:DropDownList>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Four_Level_Up_Limit_Currency_D1") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Four Level Up Limit Amount @ D-1" SortExpression="Four_Level_Up_Limit_Amount_D1">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxFour_Level_Up_Limit_Amount_D1" runat="server" Text='<%# Bind("Four_Level_Up_Limit_Amount_D1","{0:#,##0.00}") %>' IsNumeric="Yes"></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBoxFour_Level_Up_Limit_Amount_D1" runat="server" Text='<%# Bind("Four_Level_Up_Limit_Amount_D1","{0:#,##0.00}") %>' IsNumeric="Yes"></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label15" runat="server" Text='<%# Bind("Four_Level_Up_Limit_Amount_D1","{0:#,##0.00}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Update User" SortExpression="UpdateUser">
                <EditItemTemplate>
                    <asp:Label ID="LabelUserId" runat="server" Text='<%# Bind("UpdateUser") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBoxUpdateUser" runat="server" Text='<%# Bind("UpdateUser") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="LabelUpdateUser" runat="server" Text='<%# Bind("UpdateUser") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Update Date" SortExpression="UpdateDate">
                <EditItemTemplate>
                    <asp:Label ID="LabelDate" runat="server" Text='<%# Bind("UpdateDate","{0:d MMMM yyyy HH:mm:ss}") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBoxUpdateDate" runat="server" Text='<%# Bind("UpdateDate","{0:d MMMM yyyy HH:mm:ss}") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="LabelUpdateDate" runat="server" Text='<%# Bind("UpdateDate","{0:d MMMM yyyy HH:mm:ss}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="New_LinkButton" runat="server" CausesValidation="False" visible="false" CommandName="New"
                        Text="New"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="Update_LinkButton" runat="server" CausesValidation="True"
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
                    &nbsp;<asp:LinkButton ID="New_LinkButton" runat="server" CausesValidation="False" Visible="false"
                        CommandName="New" Text="New"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Left" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
    </asp:DetailsView>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="true"
        ValidationGroup="UpdateValidation" ShowSummary="False" />
    <asp:SqlDataSource ID="SqlDataSourceLIMIT_STRUCTURE" runat="server" ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>"
        InsertCommand="LIMIT_STRUCTURE_INSERT" InsertCommandType="StoredProcedure" SelectCommand="LIMIT_STRUCTURE_SELECT"
        SelectCommandType="StoredProcedure" UpdateCommand="LIMIT_STRUCTURE_UPDATE" UpdateCommandType="StoredProcedure"
        DeleteCommand="LIMIT_STRUCTURE_DELETE" DeleteCommandType="StoredProcedure"
        OnUpdated="SqlDataSourceLIMIT_STRUCTURE_Updated"
        OnInserted="SqlDataSourceLIMIT_STRUCTURE_Inserted"
        OnDeleted="SqlDataSourceLIMIT_STRUCTURE_Deleted">
        <InsertParameters>
            <asp:Parameter Name="CIF" Type="String" />
            <asp:Parameter Name="Default_Date" Type="DateTime" />
            <asp:Parameter Name="APP_ID" Type="String" />
            <asp:Parameter Name="LIMITTYP_A" Type="String" />
            <asp:Parameter Name="LIMITNO" Type="String" />
            <asp:Parameter Name="Limit_D1" Type="Double" />
            <asp:Parameter Name="One_Level_Up_Limit_ID_D1" Type="String" />
            <asp:Parameter Name="One_Level_Up_Limit_Currency_D1" Type="String" />
            <asp:Parameter Name="One_Level_Up_Limit_Amount_D1" Type="Double" />
            <asp:Parameter Name="Two_Level_Up_Limit_ID_D1" Type="String" />
            <asp:Parameter Name="Two_Level_Up_Limit_Currency_D1" Type="String" />
            <asp:Parameter Name="Two_Level_Up_Limit_Amount_D1" Type="Double" />
            <asp:Parameter Name="Three_Level_Up_Limit_ID_D1" Type="String" />
            <asp:Parameter Name="Three_Level_Up_Limit_Currency_D1" Type="String" />
            <asp:Parameter Name="Three_Level_Up_Limit_Amount_D1" Type="Double" />
            <asp:Parameter Name="Four_Level_Up_Limit_ID_D1" Type="String" />
            <asp:Parameter Name="Four_Level_Up_Limit_Currency_D1" Type="String" />
            <asp:Parameter Name="Four_Level_Up_Limit_Amount_D1" Type="Double" />
            <asp:Parameter Name="UpdateUser" Type="String" />
            <asp:Parameter Name="UpdateDate" Type="DateTime" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="CIF" QueryStringField="CIF" Type="String" />
            <asp:QueryStringParameter Name="Default_Date" QueryStringField="Default_Date" Type="DateTime" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="CIF" Type="String" />
            <asp:Parameter Name="Default_Date" Type="DateTime" />
            <asp:Parameter Name="APP_ID" Type="String" />
            <asp:Parameter Name="LIMITTYP_A" Type="String" />
            <asp:Parameter Name="LIMITNO" Type="String" />
            <asp:Parameter Name="Limit_D1" Type="Double" />
            <asp:Parameter Name="One_Level_Up_Limit_ID_D1" Type="String" />
            <asp:Parameter Name="One_Level_Up_Limit_Currency_D1" Type="String" />
            <asp:Parameter Name="One_Level_Up_Limit_Amount_D1" Type="Double" />
            <asp:Parameter Name="Two_Level_Up_Limit_ID_D1" Type="String" />
            <asp:Parameter Name="Two_Level_Up_Limit_Currency_D1" Type="String" />
            <asp:Parameter Name="Two_Level_Up_Limit_Amount_D1" Type="Double" />
            <asp:Parameter Name="Three_Level_Up_Limit_ID_D1" Type="String" />
            <asp:Parameter Name="Three_Level_Up_Limit_Currency_D1" Type="String" />
            <asp:Parameter Name="Three_Level_Up_Limit_Amount_D1" Type="Double" />
            <asp:Parameter Name="Four_Level_Up_Limit_ID_D1" Type="String" />
            <asp:Parameter Name="Four_Level_Up_Limit_Currency_D1" Type="String" />
            <asp:Parameter Name="Four_Level_Up_Limit_Amount_D1" Type="Double" />
            <asp:Parameter Name="UpdateUser" Type="String" />
            <asp:Parameter Name="UpdateDate" Type="DateTime" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="CIF" Type="String" />
            <asp:Parameter Name="Default_Date" Type="DateTime" />
            <asp:Parameter Name="LIMITNO" Type="String" />
        </DeleteParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceAPP" runat="server" ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>"
        SelectCommand="L_APP_ID_SELECT" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceLIMIT_TYPE" runat="server" ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>"
        SelectCommand="LIMIT_TYPE_SELECT" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceCurrentcy" runat="server" ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>"
        SelectCommand="L_CURRENCY_CODE_SELECT" EnableCaching="True" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
    <asp:Panel ID="Wrapper_Panel" runat="server" Width="800px" ScrollBars="Horizontal">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
            DataSourceID="SqlDataSourceLIMIT_STRUCTURE" EnableModelValidation="True" BackColor="White"
            BorderColor="#DEDFDE" ForeColor="Black" GridLines="Both" AutoGenerateColumns="false"
            DataKeyNames="CIF,Default_Date,LIMITNO" 
            OnRowUpdating="GridView_RowUpdating" CellPadding="4"
            OnRowDataBound="GridView_RowDataBound"
            OnRowCommand="LIMIT_STRUCTURE_GridView_RowCommand"
            HeaderStyle-Wrap="false" PagerSettings-Mode="NumericFirstLast" 
            ShowFooter="True">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField ItemStyle-Wrap="false" ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="Update_LinkButton" runat="server" CausesValidation="True" CommandName="Update"
                            Text="Update"></asp:LinkButton>
                        &nbsp<asp:LinkButton ID="Cancel_LinkButton" runat="server" CausesValidation="False"
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
                <asp:TemplateField ItemStyle-Wrap="false" ShowHeader="False" Visible="true">
                    <ItemTemplate>
                        <asp:LinkButton ID="Delete_LinkButton" runat="server" OnClientClick="return confirm('คุณต้องการลบข้อมูล Record นี้?');"
                            CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ItemStyle-Wrap="false" HeaderText="CIF" SortExpression="CIF" HeaderStyle-Wrap="false">
                    <EditItemTemplate>
                        <asp:Label ID="LabelCIF" runat="server" Text='<%# Bind("CIF") %>'></asp:Label>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="CIF_TextBox" runat="server"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LabelCIF" runat="server" Text='<%# Bind("CIF") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ItemStyle-Wrap="false" HeaderText="Default Date" SortExpression="Default_Date" HeaderStyle-Wrap="false">
                    <EditItemTemplate>
                        <asp:Label ID="LabelDefault_Date" runat="server" Text='<%# Eval("Default_Date", "{0:d MMMM yyyy}") %>'></asp:Label>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:Label ID="Default_Date_Label" runat="server" OnPreRender="Default_Date_Label_PreRender"></asp:Label>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LabelDefault_Date" runat="server" Text='<%# Bind("Default_Date", "{0:d MMMM yyyy}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ItemStyle-Wrap="false" HeaderText="APP ID" SortExpression="APP_ID" HeaderStyle-Wrap="false">
                    <EditItemTemplate>
                       <asp:DropDownList ID="DropDownListAPP" runat="server" DataSourceID="SqlDataSourceAPP" 
                            DataTextField="APP_ID" DataValueField="APP_ID" SelectedValue='<%# Bind("APP_ID")%>'
                            AppendDataBoundItems="true">
                            <asp:ListItem Value="">...Please Select...</asp:ListItem>
                        </asp:DropDownList>
              
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList ID="APP_ID_DropDownList" runat="server" DataSourceID="SqlDataSourceAPP"
                            DataTextField="APP_ID" DataValueField="APP_ID" 
                            AppendDataBoundItems="true">
                            <asp:ListItem Value="">...Please Select...</asp:ListItem>
                        </asp:DropDownList>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownListAPP" runat="server" DataSourceID="SqlDataSourceAPP"
                            DataTextField="APP_ID" DataValueField="APP_ID" SelectedValue='<%# Bind("APP_ID")%>'
                            AppendDataBoundItems="true" Enabled="false">
                            <asp:ListItem Value="">...Please Select...</asp:ListItem>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ItemStyle-Wrap="false" HeaderText="LIMITTYPE A" SortExpression="LIMITTYP_A" HeaderStyle-Wrap="false">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownListLIMITTYPE" runat="server" DataSourceID="SqlDataSourceLIMIT_TYPE"
                            DataTextField="LIMITTYP_A" DataValueField="LIMITTYP_A" AppendDataBoundItems="true"
                            SelectedValue='<%# Bind("LIMITTYP_A")%>'>
                            <asp:ListItem Value="">...Please Select...</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList ID="LIMITTYP_A_DropDownList" runat="server" DataSourceID="SqlDataSourceLIMIT_TYPE"
                            DataTextField="LIMITTYP_A" DataValueField="LIMITTYP_A" AppendDataBoundItems="true">
                            <asp:ListItem Value="">...Please Select...</asp:ListItem>
                        </asp:DropDownList>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownListLIMITTYPE" runat="server" DataSourceID="SqlDataSourceLIMIT_TYPE"
                            DataTextField="LIMITTYP_A" DataValueField="LIMITTYP_A" AppendDataBoundItems="true"
                            SelectedValue='<%# Bind("LIMITTYP_A")%>' Enabled="false">
                            <asp:ListItem Value="">...Please Select...</asp:ListItem>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ItemStyle-Wrap="false" HeaderText="LIMIT NO" SortExpression="LIMITNO" HeaderStyle-Wrap="false">
                    <EditItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("LIMITNO") %>'></asp:Label>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="LIMITNO_TextBox" runat="server"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("LIMITNO") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ItemStyle-Wrap="false" HeaderText="Limit @ D-1" SortExpression="Limit_D1" HeaderStyle-Wrap="false">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Limit_D1","{0:#,##0.00}") %>' IsNumeric="Yes" Style="text-align: right;"></asp:TextBox>
                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Input Limit_D1" ControlToValidate="TextBox1" ValidationGroup="UpdateValidation" Text="*" ></asp:RequiredFieldValidator>--%>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="Limit_D1_TextBox" runat="server" IsNumeric="Yes"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("Limit_D1","{0:#,##0.00}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ItemStyle-Wrap="false" HeaderText="One Level Up Limit ID @ D-1" SortExpression="One_Level_Up_Limit_ID_D1" HeaderStyle-Wrap="false">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxOne_Level_Up_Limit_ID_D1" runat="server" Text='<%# Bind("One_Level_Up_Limit_ID_D1") %>'></asp:TextBox>
                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Input One_Level_Up_Limit_ID_D1" ControlToValidate="TextBox2" ValidationGroup="UpdateValidation" Text="*" ></asp:RequiredFieldValidator>--%>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="One_Level_Up_Limit_ID_D1_TextBox" runat="server"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LabelOne_Level_Up_Limit_ID_D1" runat="server" Text='<%# Bind("One_Level_Up_Limit_ID_D1") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ItemStyle-Wrap="false" HeaderText="One Level Up Limit Currency @ D-1" SortExpression="One_Level_Up_Limit_Currency_D1" HeaderStyle-Wrap="false">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownListCurrency1" runat="server" DataSourceID="SqlDataSourceCurrentcy"
                            DataTextField="Description" DataValueField="Code" SelectedValue='<%# Bind("One_Level_Up_Limit_Currency_D1")%>'
                            AppendDataBoundItems="true">
                            <asp:ListItem Value="">...Please Select...</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList ID="One_Level_Up_Limit_Currency_D1_DropDownList" runat="server" DataSourceID="SqlDataSourceCurrentcy"
                            DataTextField="Description" DataValueField="Code" 
                            AppendDataBoundItems="true">
                            <asp:ListItem Value="">...Please Select...</asp:ListItem>
                        </asp:DropDownList>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownListCurrency1" runat="server" DataSourceID="SqlDataSourceCurrentcy"
                            DataTextField="Description" DataValueField="Code" SelectedValue='<%# Bind("One_Level_Up_Limit_Currency_D1")%>'
                            AppendDataBoundItems="true" Enabled="false">
                            <asp:ListItem Value="">...Please Select...</asp:ListItem>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ItemStyle-Wrap="false" HeaderText="One Level Up Limit Amount @ D-1" SortExpression="One_Level_Up_Limit_Amount_D1" HeaderStyle-Wrap="false">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxOne_Level_Up_Limit_Amount_D1" runat="server" Text='<%# Bind("One_Level_Up_Limit_Amount_D1","{0:#,##0.00}") %>' IsNumeric="Yes">
                        </asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="One_Level_Up_Limit_Amount_D1_TextBox" runat="server"  IsNumeric="Yes"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("One_Level_Up_Limit_Amount_D1","{0:#,##0.00}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

              <asp:TemplateField  ItemStyle-Wrap="false"   HeaderStyle-Wrap="false" HeaderText="Two Level Up Limit ID @ D-1" SortExpression="Two_Level_Up_Limit_ID_D1">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxTwo_Level_Up_Limit_ID_D1" runat="server" Text='<%# Bind("Two_Level_Up_Limit_ID_D1") %>'></asp:TextBox>
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Input One_Level_Up_Limit_ID_D1" ControlToValidate="TextBox2" ValidationGroup="UpdateValidation" Text="*" ></asp:RequiredFieldValidator>--%>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="Two_Level_Up_Limit_ID_D1_TextBox" runat="server"></asp:TextBox>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="LabelTwo_Level_Up_Limit_ID_D1" runat="server" Text='<%# Bind("Two_Level_Up_Limit_ID_D1") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

                <asp:TemplateField ItemStyle-Wrap="false" HeaderText="Two Level Up Limit Currency @ D-1" SortExpression="Two_Level_Up_Limit_Currency_D1" HeaderStyle-Wrap="false">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownListCurrency2" runat="server" DataSourceID="SqlDataSourceCurrentcy"
                            DataTextField="Description" DataValueField="Code" SelectedValue='<%# Bind("Two_Level_Up_Limit_Currency_D1")%>'
                            AppendDataBoundItems="true">
                            <asp:ListItem Value="">...Please Select...</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList ID="Two_Level_Up_Limit_Currency_D1_DropDownList" runat="server" DataSourceID="SqlDataSourceCurrentcy"
                            DataTextField="Description" DataValueField="Code" 
                            AppendDataBoundItems="true">
                            <asp:ListItem Value="">...Please Select...</asp:ListItem>
                        </asp:DropDownList>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownListCurrency2" runat="server" DataSourceID="SqlDataSourceCurrentcy"
                            DataTextField="Description" DataValueField="Code" SelectedValue='<%# Bind("Two_Level_Up_Limit_Currency_D1")%>'
                            AppendDataBoundItems="true" Enabled="false">
                            <asp:ListItem Value="">...Please Select...</asp:ListItem>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ItemStyle-Wrap="false" HeaderText="Two Level Up Limit Amount @ D-1" SortExpression="Two_Level_Up_Limit_Amount_D1" HeaderStyle-Wrap="false">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxTwo_Level_Up_Limit_Amount_D1" runat="server" Text='<%# Bind("Two_Level_Up_Limit_Amount_D1","{0:#,##0.00}") %>' IsNumeric="Yes"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="Two_Level_Up_Limit_Amount_D1_TextBox" runat="server"  IsNumeric="Yes"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label11" runat="server" Text='<%# Bind("Two_Level_Up_Limit_Amount_D1","{0:#,##0.00}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ItemStyle-Wrap="false" HeaderText="Three Level Up Limit ID @ D-1" SortExpression="Three_Level_Up_Limit_ID_D1" HeaderStyle-Wrap="false">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxThree_Level_Up_Limit_ID_D1" runat="server" Text='<%# Bind("Three_Level_Up_Limit_ID_D1") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="Three_Level_Up_Limit_ID_D1_TextBox" runat="server"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label12" runat="server" Text='<%# Bind("Three_Level_Up_Limit_ID_D1") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ItemStyle-Wrap="false" HeaderText="Three Level Up Limit Currency @ D-1" SortExpression="Three_Level_Up_Limit_Currency_D1" HeaderStyle-Wrap="false">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownListCurrency3" runat="server" DataSourceID="SqlDataSourceCurrentcy"
                            DataTextField="Description" DataValueField="Code" SelectedValue='<%# Bind("Three_Level_Up_Limit_Currency_D1")%>'
                            AppendDataBoundItems="true">
                            <asp:ListItem Value="">...Please Select...</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList ID="Three_Level_Up_Limit_Currency_D1_DropDownList" runat="server" DataSourceID="SqlDataSourceCurrentcy"
                            DataTextField="Description" DataValueField="Code" 
                            AppendDataBoundItems="true">
                            <asp:ListItem Value="">...Please Select...</asp:ListItem>
                        </asp:DropDownList>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownListCurrency3" runat="server" DataSourceID="SqlDataSourceCurrentcy"
                            DataTextField="Description" DataValueField="Code" SelectedValue='<%# Bind("Three_Level_Up_Limit_Currency_D1")%>'
                            AppendDataBoundItems="true" Enabled="false">
                            <asp:ListItem Value="">...Please Select...</asp:ListItem>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ItemStyle-Wrap="false" HeaderText="Three Level Up Limit Amount @ D-1" SortExpression="Three_Level_Up_Limit_Amount_D1" HeaderStyle-Wrap="false">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxThree_Level_Up_Limit_Amount_D1" runat="server" Text='<%# Bind("Three_Level_Up_Limit_Amount_D1","{0:#,##0.00}") %>' IsNumeric="Yes"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="Three_Level_Up_Limit_Amount_D1_TextBox" runat="server" IsNumeric="Yes"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label13" runat="server" Text='<%# Bind("Three_Level_Up_Limit_Amount_D1","{0:#,##0.00}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ItemStyle-Wrap="false" HeaderText="Four Level Up Limit ID @ D-1" SortExpression="Four_Level_Up_Limit_ID_D1" HeaderStyle-Wrap="false">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxFour_Level_Up_Limit_ID_D1" runat="server" Text='<%# Bind("Four_Level_Up_Limit_ID_D1") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="Four_Level_Up_Limit_ID_D1_TextBox" runat="server"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label14" runat="server" Text='<%# Bind("Four_Level_Up_Limit_ID_D1") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ItemStyle-Wrap="false" HeaderText="Four Level Up Limit Currency @ D-1" SortExpression="Four_Level_Up_Limit_Currency_D1" HeaderStyle-Wrap="false">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownListCurrency4" runat="server" DataSourceID="SqlDataSourceCurrentcy"
                            DataTextField="Description" DataValueField="Code" SelectedValue='<%# Bind("Four_Level_Up_Limit_Currency_D1")%>'
                            AppendDataBoundItems="true">
                            <asp:ListItem Value="">...Please Select...</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList ID="Four_Level_Up_Limit_Currency_D1_DropDownList" runat="server" DataSourceID="SqlDataSourceCurrentcy"
                            DataTextField="Description" DataValueField="Code"
                            AppendDataBoundItems="true">
                            <asp:ListItem Value="">...Please Select...</asp:ListItem>
                        </asp:DropDownList>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownListCurrency4" runat="server" DataSourceID="SqlDataSourceCurrentcy"
                            DataTextField="Description" DataValueField="Code" SelectedValue='<%# Bind("Four_Level_Up_Limit_Currency_D1")%>'
                            AppendDataBoundItems="true" Enabled="false">
                            <asp:ListItem Value="">...Please Select...</asp:ListItem>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ItemStyle-Wrap="false" HeaderText="Four Level Up Limit Amount @ D-1" SortExpression="Four_Level_Up_Limit_Amount_D1" HeaderStyle-Wrap="false">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxFour_Level_Up_Limit_Amount_D1" runat="server" Text='<%# Bind("Four_Level_Up_Limit_Amount_D1","{0:#,##0.00}") %>' IsNumeric="Yes"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="Four_Level_Up_Limit_Amount_D1_TextBox" runat="server"  IsNumeric="Yes"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label15" runat="server" Text='<%# Bind("Four_Level_Up_Limit_Amount_D1","{0:#,##0.00}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ItemStyle-Wrap="false" HeaderText="Update User" SortExpression="UpdateUser" HeaderStyle-Wrap="false">
                    <EditItemTemplate>
                        <asp:Label ID="LabelUserId" runat="server" Text='<%# Bind("UpdateUser") %>'></asp:Label>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:Label ID="UpdateUser_Label" runat="server"></asp:Label>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LabelUpdateUser" runat="server" Text='<%# Bind("UpdateUser") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ItemStyle-Wrap="false" HeaderText="Update Date" SortExpression="UpdateDate" HeaderStyle-Wrap="false">
                    <EditItemTemplate>
                        <asp:Label ID="LabelDate" runat="server" Text='<%# Bind("UpdateDate","{0:d MMMM yyyy HH:mm:ss}") %>'></asp:Label>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="UpdateDate_TextBox" runat="server"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LabelUpdateDate" runat="server" Text='<%# Bind("UpdateDate","{0:d MMMM yyyy HH:mm:ss}") %>'></asp:Label>
                    </ItemTemplate>
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
                                    APP_ID
                                </td>
                                <td>
                                    LIMITTYPE A
                                </td>
                                <td>
                                    LIMIT NO
                                </td>
                                <td>
                                    Limit @ D-1
                                </td>
                                <td>
                                    One Level Up Limit ID @ D-1
                                </td>
                                <td>
                                    One Level Up Limit Currency @ D-1
                                </td>
                                <td>
                                    One Level Up Limit Amount @ D-1
                                </td>
                                <td>
                                    Two Level Up Limit ID @ D-1
                                </td>
                                <td>
                                    Two Level Up Limit Currency @ D-1
                                </td>
                                <td>
                                    Two Level Up Limit Amount @ D-1
                                </td>
                                <td>
                                    Three Level Up Limit ID @ D-1
                                </td>
                                <td>
                                    Three Level Up Limit Currency @ D-1
                                </td>
                                <td>
                                    Three Level Up Limit Amount @ D-1
                                </td>
                                <td>
                                    Four Level Up Limit ID @ D-1
                                </td>
                                <td>
                                    Four Level Up Limit Currency @ D-1
                                </td>
                                <td>
                                    Four Level Up Limit Amount @ D-1
                                </td>
                                <td>
                                    Update User
                                </td>
                                <td>
                                    Update Date
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
                                <asp:TextBox ID="CIF_TextBox" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Label ID="Default_Date_Label" runat="server" OnPreRender="Default_Date_Label_PreRender"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="APP_ID_DropDownList" runat="server" DataSourceID="SqlDataSourceAPP" DataTextField="APP_ID" DataValueField="APP_ID" AppendDataBoundItems="true">
                                <asp:ListItem Value="">...Please Select...</asp:ListItem>
                            </asp:DropDownList>
                            </td>
                            <td>
                                <asp:DropDownList ID="LIMITTYP_A_DropDownList" runat="server" DataSourceID="SqlDataSourceLIMIT_TYPE" DataTextField="LIMITTYP_A" DataValueField="LIMITTYP_A" AppendDataBoundItems="true">
                                    <asp:ListItem Value="">...Please Select...</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:TextBox ID="LIMITNO_TextBox" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="Limit_D1_TextBox" runat="server" IsNumeric="Yes"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="One_Level_Up_Limit_ID_D1_TextBox" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:DropDownList ID="One_Level_Up_Limit_Currency_D1_DropDownList" runat="server" DataSourceID="SqlDataSourceCurrentcy"
                            DataTextField="Description" DataValueField="Code" 
                            AppendDataBoundItems="true">
                                <asp:ListItem Value="">...Please Select...</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:TextBox ID="One_Level_Up_Limit_Amount_D1_TextBox" runat="server"  IsNumeric="Yes"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="Two_Level_Up_Limit_ID_D1_TextBox" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:DropDownList ID="Two_Level_Up_Limit_Currency_D1_DropDownList" runat="server" DataSourceID="SqlDataSourceCurrentcy"
                            DataTextField="Description" DataValueField="Code" 
                            AppendDataBoundItems="true">
                            <asp:ListItem Value="">...Please Select...</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:TextBox ID="Two_Level_Up_Limit_Amount_D1_TextBox" runat="server"  IsNumeric="Yes"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="Three_Level_Up_Limit_ID_D1_TextBox" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:DropDownList ID="Three_Level_Up_Limit_Currency_D1_DropDownList" runat="server" DataSourceID="SqlDataSourceCurrentcy"
                            DataTextField="Description" DataValueField="Code" 
                            AppendDataBoundItems="true">
                            <asp:ListItem Value="">...Please Select...</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:TextBox ID="Three_Level_Up_Limit_Amount_D1_TextBox" runat="server"  IsNumeric="Yes"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="Four_Level_Up_Limit_ID_D1_TextBox" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:DropDownList ID="Four_Level_Up_Limit_Currency_D1_DropDownList" runat="server" DataSourceID="SqlDataSourceCurrentcy"
                            DataTextField="Description" DataValueField="Code" 
                            AppendDataBoundItems="true">
                            <asp:ListItem Value="">...Please Select...</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:TextBox ID="Four_Level_Up_Limit_Amount_D1_TextBox" runat="server"  IsNumeric="Yes"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Label ID="UpdateUser_Label" runat="server"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="UpdateDate_Label" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White"/>
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Left" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
    </asp:Panel>
</asp:Content>
