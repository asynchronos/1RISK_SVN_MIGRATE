<%@ Page Language="VB" AutoEventWireup="false" CodeFile="FieldManage.aspx.vb" Inherits="aspx_form_FieldManage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="js/jquery-1.8.0.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui-1.8.23.custom.min.js" type="text/javascript"></script>
    <link href="css/ui-lightness/jquery-ui-1.8.23.custom.css" rel="stylesheet" type="text/css" />
    <script src="js/autoNumeric.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#TextBoxWidth").autoNumeric({ aPad: false });
            $("#TextBoxGroup").autoNumeric({ aPad: false });
            $("#TextBoxMaxLength").autoNumeric({ aPad: false });
            $("#TextBoxMinValue").autoNumeric({ aPad: false });
            $("#TextBoxMaxValue").autoNumeric({ aPad: false });
            $("#TextBoxListID").autoNumeric({ aPad: false });

        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <strong>แสดงข้อมูล Field</strong>&nbsp;
        <br />
        <asp:Panel runat="server" ID="PanelGrid">
            <asp:Button ID="ButtonAdd" runat="server" Text="New Field" />
            <asp:GridView ID="GridViewForm" runat="server" BackColor="White" BorderColor="#DEDFDE"
                BorderStyle="None" BorderWidth="1px" CellPadding="4" EnableModelValidation="True"
                AllowPaging="false" PageSize="10" ForeColor="Black" GridLines="Vertical" AutoGenerateColumns="false"
                OnRowEditing="GridViewEditCommand" HeaderStyle-CssClass=" ui-widget-header">
                <AlternatingRowStyle BackColor="White" />
                <FooterStyle BackColor="#CCCC99" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#F7F7DE" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ID="BtnEdit" runat="server" CommandName="Edit" ImageUrl="~/images/qmv_bb_preview.gif"
                                ToolTip="Edit item" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="FIELD ID" HeaderStyle-Width="50" ItemStyle-Wrap="false"
                        ItemStyle-Width="50" HeaderStyle-Wrap="false">
                        <ItemTemplate>
                            <asp:HiddenField ID="FIELD_ID" runat="server" Value='<%# Bind("FIELD_ID") %>' />
                            <asp:Label ID="lblFIELD_ID" runat="server" Text='<%# Bind("FIELD_ID") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Width="250px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="FIELD NAME" HeaderStyle-Width="250" ItemStyle-Wrap="false"
                        HeaderStyle-Wrap="false">
                        <ItemTemplate>
                            <asp:Label ID="lblFIELD_NAME" runat="server" Text='<%# Bind("FIELD_NAME") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Width="250px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="FIELD TEXT" HeaderStyle-Width="250" ItemStyle-Wrap="false"
                        HeaderStyle-Wrap="false">
                        <ItemTemplate>
                            <asp:Label ID="lblFIELD_TEXT" runat="server" Text='<%# Bind("FIELD_TEXT") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Width="250px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="FIELD TYPE" HeaderStyle-Width="250" ItemStyle-Wrap="false"
                        HeaderStyle-Wrap="false">
                        <ItemTemplate>
                            <asp:Label ID="lblFIELD_TYPE" runat="server" Text='<%# Bind("FIELD_TYPE") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Width="250px" />
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </asp:Panel>
    </div>
    <asp:Panel ID="PanelEdit" runat="server">
        <table>
            <tr>
                <td>
                    id:
                </td>
                <td>
                    <asp:TextBox ID="TextBoxFieldID" runat="server" Width="44px" ReadOnly="true"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    ชื่อฟิว (eng)
                </td>
                <td>
                    <asp:TextBox ID="TextBoxFieldName" runat="server" Width="400px" MaxLength="50"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    คำอธิบาย<br />
                </td>
                <td>
                    <asp:TextBox ID="TextBoxFieldText" runat="server" Width="400px" MaxLength="50"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    ประเภทฟิว
                </td>
                <td>
                    <asp:DropDownList ID="SelectFieldType" runat="server">
                        <asp:ListItem Value="TextBox" Text="TextBox"></asp:ListItem>
                        <asp:ListItem Value="Calendar" Text="Calendar"></asp:ListItem>
                        <asp:ListItem Value="DropDownList" Text="DropDownList"></asp:ListItem>
                        <asp:ListItem Value="TextArea" Text="TextArea"></asp:ListItem>
                       <asp:ListItem Value="TimeStamp" Text="TimeStamp"></asp:ListItem>
                        <asp:ListItem Value="Label" Text="Label"></asp:ListItem>
                        <asp:ListItem Value="Line" Text="Line"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    ความก้วาง
                </td>
                <td>
                    <asp:TextBox ID="TextBoxWidth" runat="server" Width="100px" MaxLength="3"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    คำอธิบายต่อท้ายฟิว
                </td>
                <td>
                    <asp:TextBox ID="TextBoxTextFoot" runat="server" Width="100" MaxLength="2"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    เลขกลุ่มฟิว
                </td>
                <td>
                    <asp:TextBox ID="TextBoxGroup" runat="server" Width="100px" MaxLength="2"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    ประเภทข้อมูล
                </td>
                <td>
                    <asp:DropDownList ID="SelectDBType" runat="server">
                        <asp:ListItem Value="" Text="ไม่ระบุ"></asp:ListItem>
                        <asp:ListItem Value="String" Text="String"></asp:ListItem>
                        <asp:ListItem Value="Number" Text="Number"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    ความกว้างอักษร
                </td>
                <td>
                    <asp:TextBox ID="TextBoxMaxLength" runat="server" Width="100px" MaxLength="20"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    จำนวนน้อยสุด
                </td>
                <td>
                    <asp:TextBox ID="TextBoxMinValue" runat="server" MaxLength="20" Width="100px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    จำนวนมากที่สุด
                </td>
                <td>
                    <asp:TextBox ID="TextBoxMaxValue" runat="server" MaxLength="20" Width="100px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    กำหนดให้บังคับกรอก
                </td>
                <td>
                    <asp:DropDownList runat="server" ID="selectRequired">
                        <asp:ListItem Value="" Text="No"></asp:ListItem>
                        <asp:ListItem Value="Yes" Text="Yes"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    รหัสตัวเลือก dropdown
                </td>
                <td>
                    <asp:TextBox ID="TextBoxListID" runat="server" Width="100px" MaxLength="4"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    ตัวเลือก dropdown
                </td>
                <td>
                    <asp:TextBox ID="TextBoxListValue" runat="server" MaxLength="255" Width="400px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
        </table>
        <asp:Button ID="ButtonSave" runat="server" Text="Save" />
        &nbsp;<asp:Button ID="ButtonCancel" runat="server" Text="Cancel" />
    </asp:Panel>
    </form>
</body>
</html>
