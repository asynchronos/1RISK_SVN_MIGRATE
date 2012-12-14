<%@ Page Language="VB" AutoEventWireup="false" CodeFile="testCopyFile.aspx.vb" Inherits="aspx_uploadfile_testCopyFile" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">   
     <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptLocalization="true"
        EnableScriptGlobalization="true" EnablePageMethods="true">
        <Services>
            <asp:ServiceReference Path="~/webservice/CAWCFService.svc" />
        </Services>
    </asp:ScriptManager>
    <div>
           <b>Find and copy document ca from leader1 </b>
           <br />
           Please&nbsp;&nbsp; insert&nbsp; employee id&nbsp; and&nbsp;&nbsp; date.<br />
           <br />
           Employee ID : <asp:TextBox ID="tbEmpID" runat="server" MaxLength="20"     Width="124px"></asp:TextBox>
           <br />
           Process&nbsp;&nbsp; date:<asp:TextBox ID="tbDate1" runat="server" MaxLength="20"     Width="124px"></asp:TextBox>
                    <asp:ImageButton ID="imgCalendar" runat="server" ImageUrl="~/images/Calendar-Logo-16x16-32.ico" />
                    <cc2:CalendarExtender ID="cal1" runat="server" PopupButtonID="imgCalendar" TargetControlID="tbDate1"
                        PopupPosition="Right">
                    </cc2:CalendarExtender>
           &nbsp;To
         <asp:TextBox ID="tbDate2" runat="server" MaxLength="20"   Width="124px"></asp:TextBox>
                    <asp:ImageButton ID="imgCalendar2" runat="server" ImageUrl="~/images/Calendar-Logo-16x16-32.ico" />
                    <cc2:CalendarExtender ID="cal2" runat="server" PopupButtonID="imgCalendar2" TargetControlID="tbDate2"
                        PopupPosition="Right">
                    </cc2:CalendarExtender>
                    
    &nbsp;<br />
           <br />
           <asp:Button ID="btnQuery" runat="server" Text="Search file" />
                    
    &nbsp;
           <asp:Label ID="lblQuery" runat="server" Text=""></asp:Label>
                    
    &nbsp;&nbsp;
           <br />
           <asp:Button ID="BtnCopy" runat="server" Text="Copy file" Visible="False" />
                    
           &nbsp;
           <asp:HyperLink ID="HyperlinkFile" runat="server"></asp:HyperLink>
           <br />
                    
           <br />
           <asp:Label ID="lblMessage" runat="server" Visible="False"></asp:Label>
                    
    </div>
    </form>
</body>
</html>
