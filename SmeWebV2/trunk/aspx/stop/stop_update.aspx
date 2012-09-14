<%@ Page Language="VB" AutoEventWireup="false" CodeFile="stop_update.aspx.vb" Inherits="aspx_stop_stop_update" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:HyperLink ID="HyperLink1" runat="server" 
        style="font-weight: 700; background-color: #CCFFFF">บันทึกแก้ไข  STOP CUSTOMER  ( *  คลิกที่นี่เพื่อกลับไปหน้า STOP )</asp:HyperLink>
    &nbsp;<div>
    <iframe width="760" height="550" id="frmupdate" name="frmupdate" src="<% response.write("stop_update_detail.aspx?cif=" & request("cif") & "&type=" & request("type")) %>"  >
    </iframe>
    </div>
    </form>
</body>
</html>
