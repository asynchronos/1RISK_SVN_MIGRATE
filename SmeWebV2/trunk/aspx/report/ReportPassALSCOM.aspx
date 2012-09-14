<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ReportPassALSCOM.aspx.vb" Inherits="aspx_report_ReportPassALSCOM" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <style >
        body {
         background-color :#FFFFCC;
        }
        .subject {
         font-weight:bold;
        }
           .alscom
        {
          width:700px; font-size: small; background-color: #FFFFCC;
        }
 </style>
</head>
<body style=" margin-left:0; margin-top:0>
    <form id="form1" runat="server">
          <asp:Table id="tableALSCOM" runat="server" class="alscom">
         <asp:TableRow>
            <asp:TableCell >
                         <asp:Label ID="Label2" runat="server" Text="เลขที่ใบสมัคร :" class="subject"> </asp:Label> 
                          <asp:Label ID="LabelAPPNUMBER" runat="server"/>
            </asp:TableCell><asp:TableCell >
                         <asp:Label ID="Label7" runat="server" Text="ชื่อลูกค้า:" class="subject"> </asp:Label> 
                          <asp:Label ID="LabelALSCustomer" runat="server"  />
            </asp:TableCell></asp:TableRow><asp:TableRow>
         <asp:TableCell>
                           <asp:Label ID="Label6" runat="server" Text="สถานะใบสมัคร :" class="subject"> </asp:Label> 
                          <asp:Label ID="LabelAPPSTATUSTEXT" runat="server"  />
         </asp:TableCell><asp:TableCell>
                          <asp:Label ID="Label8" runat="server" Text="วันที่ตัดสินใจสถานะใบสมัคร:" class="subject"> </asp:Label> 
                          <asp:Label ID="LabelDECISION_DATE" runat="server" />
         </asp:TableCell></asp:TableRow><asp:TableRow>
         <asp:TableCell>
                           <asp:Label ID="Label5" runat="server" Text="รหัสสถานะ :" class="subject"> </asp:Label> 
                          <asp:Label ID="LabelStatusCode" runat="server"  />
         </asp:TableCell><asp:TableCell>
                          <asp:Label ID="Label9" runat="server" Text="รายละเอียดสถานะ:" class="subject"> </asp:Label> 
                          <asp:Label ID="LabelStatusDesc" runat="server" />
         </asp:TableCell></asp:TableRow></asp:Table>
    </form>
</body>
</html>
