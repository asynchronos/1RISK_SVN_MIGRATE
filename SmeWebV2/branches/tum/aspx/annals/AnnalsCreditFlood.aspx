<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AnnalsCreditFlood.aspx.vb"
    Inherits="aspx_annals_AnnalsCreditFlood" Culture="th-TH" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-color: #FFFFCC">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptLocalization="true"
        EnableScriptGlobalization="true" EnablePageMethods="true" />
    <table id="tableMain" style="width: 100%;">
        <tr>
            <td>
                ประเภทผลกระทบ:
            </td>
            <td>
                <asp:DropDownList ID="DropDownListIMPACT_TYPE" runat="server" AppendDataBoundItems="True">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                การดำเนินการ:
            </td>
            <td>
                  <asp:DropDownList ID="DropDownListOPERATION" runat="server" AppendDataBoundItems="True">
                  </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                โปรแกรม:
            </td>
            <td>
                <asp:DropDownList ID="DropDownListPROGRAM" runat="server" AppendDataBoundItems="True">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                ผลกระทบ:
            </td>
            <td>
                <asp:DropDownList ID="DropDownListIMPACT" runat="server" >
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                วันที่ได้รับผลกระทบ:
            </td>
            <td>
                <asp:TextBox ID="IMPACT_DATETextBox" runat="server" Text='<%# Bind("IMPACT_DATE") %>' />
                <cc2:CalendarExtender ID="cal1" runat="server" TargetControlID="IMPACT_DATETextBox"
                    PopupPosition="TopRight">
                </cc2:CalendarExtender>
            </td>
        </tr>
        </table>
    <asp:Button ID="AddButton" runat="server" Text="เพิ่มข้อมูล" 
       BackColor="#003355" BorderStyle="Outset" Font-Bold="True" 
        style="background-color: #99FFCC" />
    &nbsp;<asp:Button ID="UpdateButton" runat="server" Text="บันทึกข้อมูล"  
        BackColor="#003355" BorderStyle="Outset" Font-Bold="True" 
        style="background-color: #99FFCC"  />
    &nbsp;<asp:Button ID="btnClose" runat="server" Text="ปิดหน้านี้  "  
     BackColor="#FF3355" BorderStyle="Outset" Font-Bold="True"  OnClientClick="window.close();"/>
    </form>
</body>
</html>
