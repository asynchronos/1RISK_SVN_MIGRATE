<%@ Page Language="VB" AutoEventWireup="false" CodeFile="sm_import.aspx.vb" 
 MaintainScrollPositionOnPostback="true"
Inherits="aspx_stop_sm_import" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<script type="text/javascript">
    var counter = 0;

    var pattern = '^GridView1';

    function IsCheckBox(chk) {
        if (chk.type == 'checkbox') return true;
        else return false;
    }

    function IsMatch(id) {
        var regularExpresssion = new RegExp(pattern);

        if (id.match(regularExpresssion)) return true;
        else return false;
    }


    // Get the checkboxes inside the Gridview which is part of the template column
    function GetChildCheckBoxCount() {
        var checkBoxCount = 0;

        var elements = document.getElementsByTagName("INPUT");

        for (i = 0; i < elements.length; i++) {
            if (IsCheckBox(elements[i]) && IsMatch(elements[i].id)) checkBoxCount++;
        }

        return parseInt(checkBoxCount);
    }

    function Check(parentChk) {
        var elements = document.getElementsByTagName("INPUT");
        for (i = 0; i < elements.length; i++) {
            if (parentChk.checked == true) {
                if (IsCheckBox(elements[i]) && IsMatch(elements[i].id)) {
                    elements[i].checked = true;
                }
            }
            else {
                if (IsCheckBox(elements[i]) && IsMatch(elements[i].id)) {
                    elements[i].checked = false;
                }
//                elements[i].checked = false;
//                // reset the counter 
//                counter = 0;
            }
        }

        if (parentChk.checked == true) {
            counter = GetChildCheckBoxCount();
        }
    }
</script>
</head>
<body style="width:300;height:400">
    <form id="form1" runat="server">
    <div>
    <asp:Label ID="Label1" runat="server" Text="1. download template สำหรับ import ข้อมูล "></asp:Label>
        <asp:HyperLink ID="HyperLink1" runat="server" Target="_blank" NavigateUrl="~/aspx/stop/file/template/templateSM.xls"> Download Template</asp:HyperLink>
        <br />
    <asp:Label ID="Label2" runat="server" 
            Text="2.บันทึกข้อมูลตาม column ที่กำหนด"></asp:Label>
        <br />
        <asp:Label ID="BrowseLabel" runat="server" Text="3. เลือกไฟล์ที่บันทึกข้อมูลแล้ว "></asp:Label>
        &nbsp;<asp:FileUpload ID="UpFile1" runat="server" />
        <br />
        <asp:Label ID="BrowseLabel0" runat="server" 
            Text="4. Upload data "></asp:Label>
        &nbsp;<asp:Button runat="server" Text="Upload data" ID="UploadBtn"/>
        <br />
    </div>
    <asp:Label ID="DataLabel" runat="server" Text="5.แสดงข้อมูลที่นำเข้า (เลือกข้อมูลที่ต้องการนำเข้า)"></asp:Label>
    <br />
    <asp:Label ID="RowLabel" runat="server" Text=""></asp:Label>
    <asp:GridView ID="GridView1" runat="server" BackColor="White" 
        BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
        EnableModelValidation="True" ForeColor="Black" GridLines="Vertical" 
        style="font-size: small">
        <AlternatingRowStyle BackColor="White" />
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <Columns>
            <asp:TemplateField>
                  <HeaderTemplate>
                      <input type="checkbox" id="chkAll" name="chkAll" onclick="Check(this)" />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="RowCheckBox" runat="server" Checked="true"/>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:Label runat="server"  ID="ImportLabel" Text="6.ยืนยันบันทึกข้อมูล" />&nbsp;
    <asp:Button runat="server" Text="Import Data" ID="ImportBtn"/>
    <br />
    <asp:Label runat="server"  ID="Label3" Text="7.สถานะการบันทึกข้อมูล " />&nbsp;<asp:Label runat="server"  ID="StatusLabel" Text="" 
        style="font-weight: 700; color: #0000CC" />
    <br />
    </form>
</body>
</html>
