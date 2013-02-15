<%@ Page Language="VB" AutoEventWireup="false" CodeFile="InsertTempCustomer.aspx.vb" Inherits="aspx_annals_InsertTempCustomer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        .style1
        {
        }
        .style2
        {
            width: 171px;
        }
        .style3
        {
            width: 171px;
            height: 18px;
        }
        .style4
        {
            height: 18px;
        }
    </style>
<script language="javascript" type="text/javascript">
// <!CDATA[

function BtnClose_onclick() {
 window.close() 
}

// ]]>
</script>
</head>
<body style="margin-left:0; margin-top:0; font-size:10;">
    <form id="form1" runat="server">
    <table bgcolor="#E6FFFF" style="width: 73%;">
        <tr>
            <td class="style1" colspan="2">
                <asp:Label ID="Label5" runat="server" Font-Bold="True" ForeColor="Blue" 
                    Text="Insert tempolary customer data  (เพิ่มข้อมูลลูกค้าชั่วคราว)"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Label ID="Label1" runat="server" Text="CIF(รหัสลูกค้า):"></asp:Label>
            </td>
            <td class="style4">
                <asp:TextBox ID="TbCIF" runat="server" MaxLength="8" Width="123px"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" BackColor="#99CCFF" Font-Bold="True" 
                    Text="Search ( ค้นหา)" Width="110px" />
                <asp:Label ID="lblmsg" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label2" runat="server" Text="Title(คำนำหน้า):"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TbTitle" runat="server" MaxLength="10" Width="126px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label3" runat="server" Text="Name(ชื่อ):"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TbName" runat="server" Height="21px" MaxLength="30" 
                    Width="274px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label4" runat="server" Text="LastName(นามสกุล):"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TbLastName" runat="server" MaxLength="30" Width="276px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                <asp:Button ID="BtnAdd" runat="server" BackColor="#99FFCC" 
                    Text="Add (เพิ่มข้อมูล)" Width="137px" Font-Bold="True" Height="26px" />
    <asp:Button ID="btnCancel" runat="server" Text="Cancel ( ยกเลิก )" BackColor="#FFC0C0" 
                    Font-Bold="True" Width="125px" />
                <br />
    <input id="BtnClose" style="font-weight: bold; width: 137px; text-indent: 10pt; background-color: #ffcc66"
        type="button" value="Close ( ปิดหน้าจอ)" runat="server"  onclick="return BtnClose_onclick()" /><br />
                <asp:Label ID="Label6" runat="server" Font-Size="Small" ForeColor="#FF0066" 
                    Text="* If you want to edit customer data. Please insert cif and click search button."></asp:Label>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
