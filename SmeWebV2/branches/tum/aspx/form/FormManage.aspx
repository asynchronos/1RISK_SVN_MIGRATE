<%@ Page Language="VB" AutoEventWireup="false" CodeFile="FormManage.aspx.vb" Inherits="aspx_form_FormManage" %>

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
            $("#TextBoxStatus").autoNumeric({ aPad: false, vMin: '0', vMax: '2' });
            $("#TextBoxFormType").autoNumeric({ aPad: false, vMin: '1', vMax: '2' });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <strong>แสดงข้อมูลฟอรมทั้งหมด</strong>&nbsp;
        <br />
        <asp:Button ID="ButtonAdd" runat="server" Text="New Form" />
        <asp:Panel runat="server" ID="PanelGrid">
            <asp:GridView ID="GridViewForm" runat="server" BackColor="White" BorderColor="#DEDFDE"
                BorderStyle="None" BorderWidth="1px" CellPadding="4" EnableModelValidation="True"
                AllowPaging="true" PageSize="10" ForeColor="Black" GridLines="Vertical" AutoGenerateColumns="false"
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
                    <asp:TemplateField HeaderText="Form ID" ItemStyle-Wrap="false" ItemStyle-Width="100"
                        HeaderStyle-Width="100" HeaderStyle-Wrap="false">
                        <ItemTemplate>
                            <asp:HiddenField ID="Form_ID" runat="server" Value='<%# Bind("Form_ID") %>' />
                            <asp:Label ID="lblForm_ID" runat="server" Text='<%# Bind("Form_ID") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Width="250px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Form name" HeaderStyle-Width="250" ItemStyle-Wrap="false"
                        HeaderStyle-Wrap="false">
                        <ItemTemplate>
                            <asp:Label ID="lblForm_Name" runat="server" Text='<%# Bind("Form_Name") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Width="250px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Form description" HeaderStyle-Width="250" ItemStyle-Wrap="false"
                        HeaderStyle-Wrap="false">
                        <ItemTemplate>
                            <asp:Label ID="lblForm_Desc" runat="server" Text='<%# Bind("Form_Desc") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Width="250px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Menu" HeaderStyle-Width="250" ItemStyle-Wrap="false"
                        HeaderStyle-Wrap="false">
                        <ItemTemplate>
                            <asp:ImageButton ID="imgExcel" runat="server" ImageUrl="images/upload.jpg" Height="16px"
                                Width="16px" ToolTip="เพิ่มข้อมูลเริ่มต้น" OnClientClick='<%# "var FieldPop = window.open(""UploadExcel.aspx?FormID=" + Eval("Form_ID").tostring() + """,""FieldPop"",""toolbar=No,resizable=yes,scrollbars=yes"");FieldPop.focus();return false" %>' />
                            <asp:ImageButton ID="imgRaw" runat="server" ImageUrl="images/field_icon.jpg" Height="16px"
                                Width="16px" ToolTip="แสดงข้อมูลเริ่มต้น" OnClientClick='<%# "var FieldPop = window.open(""RawManage.aspx?FormID=" + Eval("Form_ID").tostring() + """,""FieldPop"",""toolbar=No,resizable=yes,scrollbars=yes"");FieldPop.focus();return false" %>' />
                            <asp:ImageButton ID="imgField" runat="server" ImageUrl="images/field_icon.jpg" Height="16px"
                                Width="16px" ToolTip="แสดง Field" OnClientClick='<%# "var FieldPop = window.open(""FieldManage.aspx?FormID=" + Eval("Form_ID").tostring() + """,""FieldPop"",""toolbar=No,resizable=yes,scrollbars=yes"");FieldPop.focus();return false" %>' />
                            <asp:ImageButton ID="imgShow" runat="server" ImageUrl="images/table.jpg" Height="16px"
                                Width="16px" ToolTip="แสดง Template" OnClientClick='<%# "var showPop = window.open(""formData.aspx?FormID=" + Eval("Form_ID").tostring() + """,""showPop"",""toolbar=No,resizable=yes,scrollbars=yes"");showPop.focus();return false" %>' />
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
                    <asp:TextBox ID="TextBoxFormID" runat="server" Width="44px" ReadOnly="true"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    name:
                </td>
                <td>
                    <asp:TextBox ID="TextBoxFormName" runat="server" Width="400px" MaxLength="50"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    desc
                    <br />
                </td>
                <td>
                    <asp:TextBox ID="TextBoxFormDesc" runat="server" Width="400px" MaxLength="50"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    name key
                </td>
                <td>
                    <asp:TextBox ID="TextBoxNameKey" runat="server" Width="400px" MaxLength="50"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    SQL:
                </td>
                <td>
                    <asp:TextBox ID="TextBoxSQL" runat="server" TextMode="MultiLine" Rows="7" Width="400"
                        MaxLength="1000"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Query key:
                </td>
                <td>
                    <asp:TextBox ID="TextBoxQueryKey" runat="server" Width="400px" MaxLength="50"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Query Key Value:
                </td>
                <td>
                    <asp:TextBox ID="TextBoxQueryKeyValue" runat="server" Width="400px" MaxLength="50"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Key Order:
                </td>
                <td>
                    <asp:TextBox ID="TextBoxKeyOrder" runat="server" Width="400px" MaxLength="20"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Status:
                </td>
                <td>
                    <asp:TextBox ID="TextBoxStatus" runat="server" Width="100px" MaxLength="1"></asp:TextBox>(0:
                    not show,1:show)
                </td>
            </tr>
            <tr>
                <td>
                    Form Type
                </td>
                <td>
                    <asp:TextBox ID="TextBoxFormType" runat="server" Width="100px" MaxLength="1"></asp:TextBox>
                    (1:with template,2 :insert form)
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
