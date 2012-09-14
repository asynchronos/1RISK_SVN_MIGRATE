<%@ Page Language="VB" AutoEventWireup="false" CodeFile="testAjax.aspx.vb" Inherits="test_testAjax" %>

<%@ Register Src="../HeaderControl/HeaderControl.ascx" TagName="HeaderControl" TagPrefix="uc1" %>
<%@ Register Src="../HeaderControl/HeadTagControl.ascx" TagName="HeadTagControl"
    TagPrefix="uc2" %>

<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31BF3856AD364E35"
    Namespace="System.Web.UI" TagPrefix="asp" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        .CalendarPosition{
            position:absolute;
        }
    </style>
    <uc2:HeadTagControl ID="HeadTagControl1" runat="server" />
</head>
<body>
    <form id="form1" runat="server">
        <uc1:HeaderControl ID="HeaderControl1" runat="server" />
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
        </asp:ScriptManager>
        
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox><cc1:CalendarExtender ID="CalendarExtender1"
            runat="server" TargetControlID="TextBox2" Format="d MMMM yyyy hh:mm:ss">
        </cc1:CalendarExtender>
       
        <%=System.Globalization.CultureInfo.CurrentCulture.NativeName%>
    </form>
</body>
</html>
