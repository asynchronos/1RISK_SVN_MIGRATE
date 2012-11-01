<%@ Page Language="VB" AutoEventWireup="true" Trace="false" MaintainScrollPositionOnPostback="true"
    CodeFile="ShowTable.aspx.vb" Inherits="aspx_form_ShowTable" EnableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="js/jquery-1.8.0.min.js" type="text/javascript"></script>
    <style type="text/css">
        body
        {
            font-size: 12px;
        }
        #divMain
        {
            width: 100%;
            height: 100%;
            background: #666666;
        }
        #divLeft
        {
            width: 15%;
            background: #FFCC00;
            float: left;
        }
        #divRight
        {
            width: 84%;
            background: #99CC00;
            float: right;
        }
        #GridViewTable
        {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="divMain">
        <div id="divLeft">
            <div id="divTree">
                <ul>
                    Select Table
                    <li><a href="?TABLE=ANNALS_JOB_TYPE">ANNALS_JOB_TYPE</a></li>
                    <li><a href="?TABLE=ANNALS_PROCESS">ANNALS_PROCESS</a></li>
                    <li><a href="?TABLE=ANNALS_GL_TYPE">ANNALS_GL_TYPE</a></li>
                    <li><a href="?TABLE=ANNALS_PROGRAM">ANNALS_PROGRAM</a></li>
                    <li><a href="?TABLE=ANNALS_PROJECT">ANNALS_PROJECT</a></li>
                    <li><a href="?TABLE=ANNALS_PRODUCT">ANNALS_PRODUCT</a></li>
                    <li><a href="?TABLE=ANNALS_SUB_COMMITTEE">ANNALS_SUB_COMMITTEE</a></li>
                    <li><a href="?TABLE=ANNALS_AUTHORITY">ANNALS_AUTHORITY</a></li>
                    <li><a href="?TABLE=ID_BRANCH">ID_BRANCH</a></li>
                    <li><a href="?TABLE=ID_REGION">ID_REGION</a></li>

                </ul>
            </div>
        </div>
        <div id="divRight">
            <asp:SqlDataSource ID="SqlDataSourceTable" runat="server"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceKey" runat="server"></asp:SqlDataSource>
            <asp:GridView ID="GridViewTable" runat="server" EnableModelValidation="True" OnRowEditing="EditData"
                OnPageIndexChanging="ChangeIndex" OnRowCancelingEdit="CancelData" OnRowUpdating="UpdateData"
                OnRowDeleting="DeleteData" OnRowDataBound="BoundRow" AllowPaging="True" BackColor="White"
                BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="2" ForeColor="Black"
                GridLines="Vertical">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ID="BtnEdit" runat="server" CommandName="Edit" ToolTip="Edit item"
                                ImageUrl="~/images/qmv_bb_preview.gif" />
                            <asp:ImageButton ID="BtnAdd" runat="server" CommandName="Edit" ToolTip="Add item"
                                ImageUrl="~/images/qmv_bb_add.gif" Visible="false" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <table style="width: 41px; border-color: Black; padding-left: 100px; border: 0px;
                                background-color: #AABBAA">
                                <tr>
                                    <td>
                                        <asp:ImageButton ID="BtnUpdate" runat="server" CommandName="Update" ImageUrl="~/images/qmv_bb_add.gif"
                                            ToolTip="Save item" />
                                    </td>
                                    <td>
                                        <asp:ImageButton ID="BtnCancel" runat="server" CommandName="Cancel" ImageUrl="~/images/qmv_r_button_undo_hover.gif"
                                            ToolTip="Cancel item" />
                                    </td>
                                    <td style="width: 35px">
                                        <asp:ImageButton ID="BtnDelete" runat="server" CommandName="Delete" ImageUrl="~/images/qmv_bb_delete.gif"
                                            ToolTip="Delete item" />
                                    </td>
                                </tr>
                            </table>
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#CCCC99" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#F7F7DE" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
            <asp:TextBox ID="TextBoxSQL" runat="server" TextMode="MultiLine" Columns="2" Rows="10"
                Width="100%" Height="72px"></asp:TextBox>
            <asp:Button ID="BtnRun" runat="server" Text="Run" />
        </div>
    </div>
    </form>
</body>
</html>
