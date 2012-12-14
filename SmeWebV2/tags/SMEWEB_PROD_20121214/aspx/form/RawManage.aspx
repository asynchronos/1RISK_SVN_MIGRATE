<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RawManage.aspx.vb" Inherits="aspx_form_RawManage" %>

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
        <strong>แสดงข้อมูลเริ่มต้น<br />
        </strong>
        <asp:Button ID="ButtonDelete" runat="server" Text="ลบข้อมูลทั้งหมด" />
        <br />
        <asp:Panel runat="server" ID="PanelGrid">
            <asp:GridView ID="GridViewForm" runat="server" BackColor="White" BorderColor="#DEDFDE"
                BorderStyle="None" BorderWidth="1px" CellPadding="4" EnableModelValidation="True"
                AllowPaging="true" PageSize="10" ForeColor="Black" GridLines="Vertical" AutoGenerateColumns="true"
                 OnRowDeleting ="GridViewDeletetCommand"
                 HeaderStyle-CssClass=" ui-widget-header">
                <AlternatingRowStyle BackColor="White" />
                <FooterStyle BackColor="#CCCC99" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#F7F7DE" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ID="BtnDelete" runat="server" CommandName="Delete" ImageUrl="images/close.gif" toolTip="Delete" />
                        </ItemTemplate>
                    </asp:TemplateField>
           
                </Columns>
            </asp:GridView>
        </asp:Panel>
    </div>
    <asp:Panel ID="PanelEdit" runat="server">
        
    </asp:Panel>
    </form>
</body>
</html>
