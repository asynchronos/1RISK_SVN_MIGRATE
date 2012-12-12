<%@ Page Language="VB" AutoEventWireup="false" CodeFile="UploadExcel.aspx.vb" Inherits="aspx_form_UploadExcel" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="js/jquery-1.8.0.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui-1.8.23.custom.min.js" type="text/javascript"></script>
    <script src="js/jquery.cookie.js" type="text/javascript"></script>
    <link href="css/ui-lightness/jquery-ui-1.8.23.custom.css" rel="stylesheet" type="text/css" />
    <style>
        body
        {
            font-size: 12px;
        }
        #divGridData
        {
            overflow: scroll;
            height: 500px;
        }
        td
        {
        }
        .style1
        {
            height: 18px;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            $("#tabs").tabs({ cookie: { expires: 30} });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="tabs">
        <ul>
            <li><a href="#tabs-1">1.เลือกไฟล์</a></li>
            <li><a href="#tabs-2">2.ข้อมูล</a></li>
            <li><a href="#tabs-3">3.กำหนดหัวตาราง</a></li>
            <li><a href="#tabs-4">4.กำหนด key</a></li>
            <li><a href="#tabs-save">บันทึกข้อมูล</a></li>
        </ul>
        <div id="tabs-1">
            <table>
                <tr>
                    <td>
                       เลือกแหล่งข้อมูลที่นำเข้า (1) จาก excell ไฟล์ หรือ (2) จาก sql
                        1 นำเข้าข้อมูลจาก excell (easy style)
                        <br />
                        1.1 เลือกไฟล์ excell ที่ต้องการทำ Template
                        <br />
                        <asp:FileUpload ID="FileUploadControl" runat="server" />
                        <br />
                        <br />
                        1.2 กำหนดชื่อ sheet ใน excel ที่ต้องการ<br />
                        <asp:TextBox ID="TextBoxSheet" runat="server"></asp:TextBox>
                        <br />
                        <br />
                        1.3 ทำการ upload
                        <asp:Button runat="server" ID="UploadButton" Text="Upload File" OnClick="UploadButton_Click" />
                        <asp:Label runat="server" ID="StatusLabel" Text="Upload status: " />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style1">
                    </td>
                    <td class="style1">
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                          &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        2. นำเข้าข้อมูลจาก SQL <br />
                       <asp:TextBox ID="TextBoxSQLSelect" runat="server" TextMode="MultiLine" Rows="10" Width="400" ></asp:TextBox>
                            <br />
                            <asp:Button runat="server" ID="ButtonRunSQL" Text="Select Data" />
                          <asp:Label runat="server" ID="RunSQLLabel" Text="Upload status: " />
                    </td>
                    <td>
                          &nbsp;</td>
                </tr>
            </table>
        </div>
        <div id="tabs-2">
            <div id="divGridData">
                2. แสดงข้อมูลที่นำเข้า
                <asp:GridView ID="GridViewData" runat="server" AllowPaging="True" PageSize="50" BackColor="White"
                    BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" EnableModelValidation="True"
                    ForeColor="Black" OnPageIndexChanging="ChangeIndex" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="White" />
                    <FooterStyle BackColor="#CCCC99" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#F7F7DE" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
            </div>
        </div>
        <div id="tabs-3">
            3. กำหนดหัวตาราง (โดยหัวข้อจะอยู่ใน list นี้ สามารถเปลี่ยนแปลงได้ )<br />
            3.1 แถวที่นำมาทำหัวตารางคือ แถวที่
            <asp:TextBox ID="TextBoxRow" runat="server" Width="34px"></asp:TextBox>
            &nbsp;<asp:Button ID="ButtonUpdateHead" runat="server" Text="เปลี่ยนเลขหัวตาราง" />
            <br />
            3.2 แสดง ชื่อ column ตารางท่านสามารถคลิกเพื่อแก้ไขได้<br />
            <table>
                <tr>
                    <td>
                        <asp:ListBox ID="ListBoxHead" runat="server" AutoPostBack="True"></asp:ListBox>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxUpdateHead" runat="server" Width="200px"></asp:TextBox>
                        <asp:Button ID="ButtonUpdateHeadValue" runat="server" Text="เปลี่ยนชื่อ column" />
                    </td>
                </tr>
            </table>
        </div>
        <div id="tabs-4">
            4.เลือก column ที่เป็น key โดยเลือกจาก column ที่ไม่ซ้ำเช่น (cif)
            <br />
            <table>
                <tr>
                    <td>
                        <asp:ListBox ID="ListBoxKey" runat="server" AutoPostBack="true"></asp:ListBox>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxKey" runat="server" Width="200px"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>
        <div id="tabs-save">
            <asp:Button runat="server" ID="ButtonSave" Text="บันทึกข้อมูล" />
            <br />
            <asp:Label runat="server" ID="LabelSaveMsg"></asp:Label>
        </div>
    </div>
    </div>
    <br />
    </form>
</body>
</html>
