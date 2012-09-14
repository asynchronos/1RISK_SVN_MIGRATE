<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AnnalsCreditFloodBot.aspx.vb"
    Inherits="aspx_annals_AnnalsCreditFloodBot" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body
        {
            font-size: 12px;
            color: black;
        }
        #tableForm
        {
            background-color: #EEEEEE;
            width: 800px;
        }
        #tableForm0
        {
            background-color: #EEEEEE;
            width: 800px;
        }
        .style1
        {
            font-size: medium;
        }
    </style>
    <script src="../../js/jquery1.6.1.js" type="text/javascript"></script>
    <script src="../../js/autoNumeric.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("[autonumeric='true']").autoNumeric({ aPad: false, vMin: '0', vMax: '10000000000' });
            $("[dscr = 'true']").autoNumeric({ aPad: true, vMin: '0.00', vMax: '999.99' });
            $("[autonumeric='true']").css("margin-right", "true");

            $("input[myid='TextBoxSUB_DISTRICT_ID']").focus(function () {
                $(this).blur();
            });
        });


        function confirm_delete() {
            if (confirm(" กรุณายืนยันการลบข้อมูล ") == true)
                return true;
            else
                return false;
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True"
        EnableScriptLocalization="True" />
    <%-- <asp:UpdatePanel runat="server">
        <ContentTemplate>--%>
    <asp:Button ID="btnClose" runat="server" Text="ปิดหน้านี้  " BackColor="#FF3355"
        BorderStyle="Outset" Font-Bold="True" OnClientClick="window.close();" />
    &nbsp;&nbsp;
    <br />
    <asp:Button ID="btnAddNewInfo" runat="server" Text="เพิ่มรายชื่อลูกค้า" BackColor="#FFFFF"
        Enabled="false" BorderStyle="Outset" Font-Bold="True" />
    <br />
    <asp:Label ID="Label2" runat="server" Text="รายชื่อ customer น้ำท่วม ส่ง BOT" ForeColor="Maroon"
        Font-Bold="True" Font-Size="Medium" Style="color: #0033CC"></asp:Label>
    &nbsp;(ข้อมูลจากรายชื่อลูกค้าใน Ca / account )<asp:GridView ID="CustomersInfoGridView"
        runat="server" AutoGenerateColumns="False" OnRowEditing="CustomerInfoGridEditCommand"
        OnRowCancelingEdit="CustomerInfoGridCancelCommand" OnRowCommand="CustomerInfoGridRowCommand"
        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"
        CellPadding="4" EnableModelValidation="True" ForeColor="Black" GridLines="Vertical"
        Style="margin-bottom: 0px">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:ImageButton ID="BtnEdit0" runat="server" CommandName="Edit" ImageUrl="~/images/qmv_bb_preview.gif"
                        ToolTip="Edit item" />
                </ItemTemplate>
                <EditItemTemplate>
                    <table style="width: 50">
                        <tr>
                            <td>
                                <asp:ImageButton ID="BtnUpdate0" runat="server" CommandName="Update" ImageUrl="~/images/qmv_bb_save.gif"
                                    ToolTip="Save item" />
                            </td>
                            <td>
                                <asp:ImageButton ID="BtnCancel0" runat="server" CommandName="Cancel" ImageUrl="~/images/qmv_r_button_undo_hover.gif"
                                    ToolTip="Cancel item" />
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:Label ID="LblMsgEdit0" runat="server" Text="" ForeColor="Red"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Customer" HeaderStyle-Width="200" ItemStyle-Wrap="false"
                HeaderStyle-Wrap="false">
                <EditItemTemplate>
                    <div id="divFormCustomer" runat="server">
                        กรุณากรอกข้อมูลให้ครบถ้วน
                        <table>
                            <tr>
                                <td>
                                    &nbsp;ชื่อลูกค้า&nbsp;
                                </td>
                                <td>
                                    <strong><span class="style1">
                                        <asp:Label ID="LabelCIF" runat="server" Text='<%# Bind("CIF") %>'></asp:Label>
                                        :<asp:Label ID="LabelCIFName1" runat="server" Text='<%# Bind("CUSTOMER_NAME") %>'
                                            Width="200"></asp:Label>
                                    </span></strong>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    วัตถุประสงค์
                                </td>
                                <td>
                                    <asp:DropDownList ID="RepriceDropDownList" runat="server" OnSelectedIndexChanged="CheckReprice"
                                        AutoPostBack="true" SelectedValue='<%# Bind("REPRICE_STATUS") %>' AppendDataBoundItems="true">
                                        <asp:ListItem Text="...โปรดเลือก..." Value=""></asp:ListItem>
                                        <asp:ListItem Text="Reprice" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="ขอเพิ่มโดยมี บสย ค้ำ (มีส่วน Clean)" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="ขอเพิ่มโดยไม่มี บสยค้ำประกัน" Value="2"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                        <asp:Panel runat="server" ID="InputPanel">
                            <table>
                                <tr>
                                    <td>
                                        1.มูลล่าหลักประกัน (Fixed Asset) ครั้งนี้
                                    </td>
                                    <td>
                                        <asp:TextBox ID="FixedAssetTextBox" runat="server" autonumeric='true' Text='<%# EVAL("FIXED_ASSET","{0:N0}") %>'></asp:TextBox>
                                        บาท
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        2.หลักประกัน(เงินฝาก) จำนวนเงิน
                                    </td>
                                    <td>
                                        <asp:TextBox ID="DepositTextBox" runat="server" autonumeric='true' Text='<%# EVAL("DEPOSIT","{0:N0}") %>'></asp:TextBox>
                                        บาท
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        3.ครั้งนี้วงเงินสินเชื่อมีเงินฝาก 30% บสย 70%
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DepositDropDownList" runat="server" autonumeric='true' SelectedValue='<%# Bind("DEPOSIT_STATUS") %>'
                                            AppendDataBoundItems="true">
                                            <asp:ListItem Text="...โปรดเลือก..." Value=""></asp:ListItem>
                                            <asp:ListItem Text="YES" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="NO" Value="0"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        4.DSCR(x เท่า)
                                    </td>
                                    <td>
                                        <asp:TextBox ID="DSCRTextBox" dscr="true" runat="server" Text='<%# EVAL("DSCR","{0:N2}") %>'></asp:TextBox>
                                        เท่า
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        5.วงเงินที่ SME R ปกติ อนุมัติ 3x จำนวนวงเงินเท่าไร
                                    </td>
                                    <td>
                                        <asp:TextBox ID="SMERLimitTextBox" runat="server" autonumeric='true' Text='<%# EVAL("SMER_NORMAL_LIMIT","{0:N0}") %>'></asp:TextBox>
                                        บาท
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1">
                                        6.วงเงินที่ SME R Flood อนุมัติ 3x จำนวนวงเงินเท่าไร
                                    </td>
                                    <td class="style1">
                                        <asp:TextBox ID="SMERFloodTextBox" runat="server" autonumeric='true' Text='<%# EVAL("SMER_FLOOD_LIMIT","{0:N0}") %>'></asp:TextBox>
                                        บาท
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        7.มี 3x ของ SME R ในนามชื่อคนอื่น รวมจำนวนวงเงินเท่าไร
                                    </td>
                                    <td>
                                        <asp:TextBox ID="SMEROtherTextBox" runat="server" autonumeric='true' Text='<%# EVAL("SMER_OTHER_LIMIT","{0:N0}") %>'></asp:TextBox>
                                        บาท
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        ธนาคาร
                                    </td>
                                    <td>
                                        <asp:GridView ID="BankGridView" runat="server" OnRowCommand="CustomerBankGridRowCommand"
                                            DataSourceID="BankSqlDataSource" AutoGenerateColumns="false">
                                            <Columns>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="BtnEdit0" runat="server" CommandName="Edit" ImageUrl="~/images/qmv_bb_preview.gif"
                                                            ToolTip="Edit item" />
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <table style="width: 50">
                                                            <tr>
                                                                <td>
                                                                    <asp:ImageButton ID="BtnCancel0" runat="server" CommandName="Cancel" ImageUrl="~/images/qmv_r_button_undo_hover.gif"
                                                                        ToolTip="Cancel item" />
                                                                </td>
                                                                <td>
                                                                    <asp:ImageButton ID="BtnDelete0" runat="server" CommandName="DeleteBank" ImageUrl="~/images/qmv_bb_delete.gif"
                                                                        ToolTip="Delete item" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="3">
                                                                    <asp:Label ID="LblMsgEdit0" runat="server" Text="" ForeColor="Red"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </EditItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Bank Code">
                                                    <ItemTemplate>
                                                        <asp:Label ID="BankIDLabel" runat="server" Text='<%# EVAL("BANK_ID") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Bank Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="BankNameLabel" runat="server" Text='<%# EVAL("BANK_NAME") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="ภาระหนี้ (บาท)">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label4" runat="server" Text='<%# EVAL("VALUE","{0:N0}") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <FooterStyle BackColor="#CCCC99" />
                                            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                            <RowStyle BackColor="#F7F7DE" />
                                            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                        </asp:GridView>
                                        ธนาคาร
                                        <asp:DropDownList ID="BankDropDownList" DataSourceID="BankListSqlDataSource" DataTextField="BANK_NAME"
                                            DataValueField="BANK_ID" runat="server">
                                        </asp:DropDownList>
                                        ภาระ
                                        <asp:TextBox ID="BankValueTextBox" runat="server" autonumeric='true'></asp:TextBox>
                                        บาท
                                        <asp:Button ID="AddBankButton" runat="server" Text="เพิ่มรายชื่อ Bank" CommandName="AddBank" />
                                        <asp:Label ID="CIFLabel" runat="server" Text='<%# EVAL("CIF") %>' Visible="false"></asp:Label>
                                        <asp:SqlDataSource ID="BankSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                                            SelectCommand="ANNALS_FLOOD_CUSTOMER_BANK_SELECT" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:QueryStringParameter Name="ID" QueryStringField="ID" Type="String" />
                                                <asp:ControlParameter ControlID="CIFLabel" Name="CIF" PropertyName="Text" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </div>
                </EditItemTemplate>
                <ItemTemplate>
                    <strong><span class="style1">
                        <asp:Label ID="LabelCIF" runat="server" Text='<%# Bind("CIF") %>'></asp:Label>
                        <asp:Label ID="LabelCIFName1" runat="server" Text='<%# Bind("CUSTOMER_NAME") %>'
                            Width="200"></asp:Label>
                    </span></strong>
                </ItemTemplate>
                <HeaderStyle Wrap="False" Width="200px"></HeaderStyle>
                <ItemStyle Wrap="False"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="วัตถุประสงค์ ( Reprice)">
                <ItemTemplate>
                    <asp:Label ID="REPRICELabel" runat="server" Text='<%# EVAL("REPRICE_STATUS_NAME") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="มูลค่าหลักประกัน">
                <ItemTemplate>
                    <asp:Label ID="FIXED_ASSETLabel" runat="server" Text='<%# EVAL("FIXED_ASSET","{0:N0}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="หลักประกันเงินฝาก">
                <ItemTemplate>
                    <asp:Label ID="DEPOSITLabel" runat="server" Text='<%# EVAL("DEPOSIT","{0:N0}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
    <br />
    <asp:Button ID="btnAddNew" runat="server" Text="เพิ่มรายการบัญชี" BackColor="#FFFFF"
        Enabled="false" BorderStyle="Outset" Font-Bold="True" />
    &nbsp;&nbsp;<asp:Label ID="msg" runat="server" Text=""></asp:Label>
    &nbsp;<br />
    <asp:Label ID="Label1" runat="server" Text="รายการบัญชี" ForeColor="Maroon" Font-Bold="True"
        Font-Size="Medium" Style="color: #0033CC"></asp:Label>
    <asp:GridView ID="CustomersGridView" runat="server" AutoGenerateColumns="False" OnRowEditing="CustomerGridEditCommand"
        OnRowCancelingEdit="CustomerGridCancelCommand" OnRowCommand="CustomerGridRowCommand"
        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"
        CellPadding="4" EnableModelValidation="True" ForeColor="Black" GridLines="Vertical"
        Style="margin-bottom: 0px">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:ImageButton ID="BtnEdit" runat="server" CommandName="Edit" ImageUrl="~/images/qmv_bb_preview.gif"
                        ToolTip="Edit item" />
                </ItemTemplate>
                <EditItemTemplate>
                    <table style="width: 50">
                        <tr>
                            <td>
                                <asp:ImageButton ID="BtnUpdate" runat="server" CommandName="Update" ImageUrl="~/images/qmv_bb_save.gif"
                                    ToolTip="Save item" />
                            </td>
                            <td>
                                <asp:ImageButton ID="BtnCancel" runat="server" CommandName="Cancel" ImageUrl="~/images/qmv_r_button_undo_hover.gif"
                                    ToolTip="Cancel item" />
                            </td>
                            <td>
                                <asp:ImageButton ID="BtnDelete" runat="server" CommandName="Delete" ImageUrl="~/images/qmv_bb_delete.gif"
                                    Visible="false" ToolTip="Delete item" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:Label ID="LblMsgEdit" runat="server" Text="" ForeColor="Red"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="CIF" HeaderStyle-Width="200" ItemStyle-Wrap="false"
                HeaderStyle-Wrap="false">
                <EditItemTemplate>
                    <h3>
                        กรุณากรอกข้อมูลให่้ครบถ้วน</h3>
                    <asp:HiddenField ID="IDEN" runat="server" Value='<%# EVAL("IDEN") %>' />
                    <asp:HiddenField ID="PROJECT_CODE" runat="server" Value='<%# EVAL("PROJECT_CODE") %>' />
                    <table id="tableForm">
                        <tr>
                            <td>
                                CIF
                            </td>
                            <td colspan="3">
                                <asp:Label ID="LabelCIF" runat="server" Text='<%# Bind("CIF") %>'></asp:Label>
                                <asp:Label ID="LabelCIFName" runat="server" Text='<%# Bind("CIFNAME") %>' Width="200"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                ลูกค้าใหม่ / เก่า
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownListCUSTOMER_NEW_OLD" runat="server" DataSourceID='SqlDataSourceOLD_NEW'
                                    DataTextField='name' DataValueField='id' SelectedValue='<%# Bind("CUSTOMER_NEW_OLD") %>'
                                    AppendDataBoundItems="true">
                                    <asp:ListItem Text="...โปรดเลือก..." Value=""></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                วงเงินใหม่ / เก่า
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownListLIMIT_NEW_OLD" runat="server" SelectedValue='<%# Eval("LIMIT_NEW_OLD") %>'
                                    DataSourceID='SqlDataSourceLIMIT_NEW_OLD' DataTextField='name' DataValueField='id'
                                    AppendDataBoundItems="true">
                                    <asp:ListItem Text="...โปรดเลือก..." Value=""></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                วงเงิน
                            </td>
                            <td>
                                (<asp:Label ID="LabelProductCode" runat="server" Text='<%# Bind("DECB_RD_ID") %>'></asp:Label>)
                                <b>
                                    <asp:Label ID="LabelProduct" runat="server" Text='<%# Bind("DECB_RD") %>'></asp:Label>
                                </b>
                            </td>
                            <td>
                                จำนวนเงิน(วงเงิน)
                            </td>
                            <td>
                                <asp:TextBox ID="TextBoxVALUE" runat="server" autonumeric="true" Text='<%# EVAL("VALUE","{0:#,###0}") %>'
                                    Width="120" MaxLength="10"></asp:TextBox>
                                บาท
                            </td>
                        </tr>
                        <tr>
                            <td>
                                บสย ค้ำประกันหรือไม่
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownListIS_GUARANTEE" runat="server" SelectedValue='<%# Eval("IS_GUARANTEE") %>'
                                    DataSourceID='SqlDataSourceIS_GUARANTEE' DataTextField='name' DataValueField='id'
                                    AppendDataBoundItems="true">
                                    <asp:ListItem Text="...โปรดเลือก..." Value=""></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                จำนวนเงินค้ำประกัน
                            </td>
                            <td>
                                <asp:TextBox ID="TextBoxGUARANTEE_VALUE" runat="server" autonumeric="true" Text='<%# EVAL("GUARANTEE_VALUE","{0:#,###0}") %>'
                                    Width="120" MaxLength="10"></asp:TextBox>บาท
                            </td>
                        </tr>
                        <tr>
                            <tr>
                                <td>
                                    ประเภทความเสียหาย
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownListDAMAGE_TYPE_ID" runat="server" SelectedValue='<%# Eval("DAMAGE_TYPE_ID") %>'
                                        DataSourceID='SqlDataSourceDAMAGE_TYPE_ID' DataTextField='name' DataValueField='id'
                                        AppendDataBoundItems="true">
                                        <asp:ListItem Text="...โปรดเลือก..." Value=""></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    รหัสพื้นที่ความเสียหาย
                                </td>
                                <td>
                                    <asp:TextBox myid="TextBoxSUB_DISTRICT_ID" ID="TextBoxSUB_DISTRICT_ID" runat="server"
                                        Text='<%# EVAL("SUB_DISTRICT_ID") %>' Width="70" MaxLength="8"></asp:TextBox>
                                    <asp:ImageButton ID="ImageButtonSearchSubDistrict" runat="server" ImageUrl="~/images/Magnifying Glass.gif" />
                                    <asp:TextBox myid="TextBoxLOCATION_NAME" ID="TextBoxLOCATION_NAME" runat="server"
                                        Text='<%# EVAL("LOCATION_NAME") %>' Width="200" MaxLength="8"></asp:TextBox>
                                </td>
                                <td>
                                    หมายเหตุ
                                </td>
                                <td colspan="4">
                                    <asp:TextBox ID="TextBoxREMARK" runat="server" Text='<%# EVAL("REMARK") %>' TextMode="MultiLine"
                                        Columns="20" Rows="4" MaxLength="255"></asp:TextBox>
                                </td>
                            </tr>
                    </table>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="LabelCIF" runat="server" Text='<%# Bind("CIF") %>'></asp:Label>
                    <asp:Label ID="LabelCIFName" runat="server" Text='<%# Bind("CIFNAME") %>' Width="200"></asp:Label>
                </ItemTemplate>
                <HeaderStyle Wrap="False" Width="200px"></HeaderStyle>
                <ItemStyle Wrap="False"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Project Code">
                <ItemTemplate>
                    <asp:Label ID="LabelProject_Code" runat="server" Text='<%# Bind("PROJECT_CODE") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ลูกค้าใหม่เก่า" HeaderStyle-Width="50" ItemStyle-Wrap="false"
                HeaderStyle-Wrap="false">
                <ItemTemplate>
                    <asp:Label ID="LabelCUSTOMER_NEW_OLD" runat="server" Text='<%# Bind("CUSTOMER_NEW_OLD_NAME") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle Wrap="False" Width="50px"></HeaderStyle>
                <ItemStyle Wrap="False"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="วงเงินใหม่เก่า" HeaderStyle-Width="50" ItemStyle-Wrap="false"
                HeaderStyle-Wrap="false">
                <ItemTemplate>
                    <asp:Label ID="LabelLIMIT_NEW_OLD" runat="server" Text='<%# Bind("LIMIT_NEW_OLD_NAME") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle Wrap="False" Width="50px"></HeaderStyle>
                <ItemStyle Wrap="False"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="วงเงิน" HeaderStyle-Width="50" ItemStyle-Wrap="false"
                HeaderStyle-Wrap="false">
                <ItemTemplate>
                    <asp:Label ID="LabelDECB_RD_ID" runat="server" Text='<%# Bind("DECB_RD") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle Wrap="False" Width="50px"></HeaderStyle>
                <ItemStyle Wrap="False"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="จำนวนเงิน" HeaderStyle-Width="50" ItemStyle-Wrap="false"
                ItemStyle-HorizontalAlign="Right" HeaderStyle-Wrap="false">
                <ItemTemplate>
                    <asp:Label ID="LabelVALUE" runat="server" Text='<%# Bind("VALUE","{0:N0}") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle Wrap="False" Width="50px"></HeaderStyle>
                <ItemStyle Wrap="False"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="บสย.ค้ำประกัน" HeaderStyle-Width="50" ItemStyle-Wrap="false"
                HeaderStyle-Wrap="false">
                <ItemTemplate>
                    <asp:Label ID="LabelIS_GUARANTEE" runat="server" Text='<%# Bind("IS_GUARANTEE_NAME") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle Wrap="False" Width="50px"></HeaderStyle>
                <ItemStyle Wrap="False"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="วงเงินค้ำประกัน" HeaderStyle-Width="50" ItemStyle-Wrap="false"
                ItemStyle-HorizontalAlign="Right" HeaderStyle-Wrap="false">
                <ItemTemplate>
                    <asp:Label ID="LabelGUARANTEE_VALUE" runat="server" Text='<%# Bind("GUARANTEE_VALUE","{0:#,###0}") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle Wrap="False" Width="50px"></HeaderStyle>
                <ItemStyle Wrap="False"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ประเภทความเสียหาย" HeaderStyle-Width="50" ItemStyle-Wrap="false"
                HeaderStyle-Wrap="false">
                <ItemTemplate>
                    <asp:Label ID="LabelDAMAGE_TYPE_NAME" runat="server" Text='<%# Bind("DAMAGE_TYPE_NAME") %>'
                        Width="50"></asp:Label>
                </ItemTemplate>
                <HeaderStyle Wrap="False" Width="50px"></HeaderStyle>
                <ItemStyle Wrap="False"></ItemStyle>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
    <%--        </ContentTemplate>
    </asp:UpdatePanel>--%>
    <asp:SqlDataSource ID="SqlDataSourceDAMAGE_TYPE_ID" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
        SelectCommand="ANNALS_CREDIT_FLOOD_BOT_TABLE_SELECT" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter DefaultValue="DAMAGE_TYPE_ID" Name="RECORD_TYPE" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceIS_GUARANTEE" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
        SelectCommand="ANNALS_CREDIT_FLOOD_BOT_TABLE_SELECT" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter DefaultValue="IS_GUARANTEE" Name="RECORD_TYPE" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceOLD_NEW" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
        SelectCommand="ANNALS_CREDIT_FLOOD_BOT_TABLE_SELECT" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter DefaultValue="OLD_NEW" Name="RECORD_TYPE" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceGL" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
        SelectCommand="ANNALS_CREDIT_FLOOD_BOT_TABLE_SELECT_GL" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceLIMIT_NEW_OLD" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
        SelectCommand="ANNALS_CREDIT_FLOOD_BOT_TABLE_SELECT" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter DefaultValue="LIMIT_NEW_OLD" Name="RECORD_TYPE" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="CustomerSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
        SelectCommand="ANNALS_FLOOD_CUSTOMER_SELECT_CA" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter Name="ID" QueryStringField="ID" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="BankListSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
        SelectCommand="ANNALS_FLOOD_BANK_SELECT" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
    </form>
</body>
</html>
