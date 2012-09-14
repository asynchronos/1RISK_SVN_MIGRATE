<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CAMainFrame.aspx.vb" Inherits="test_CAMainFrame" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
        <table width="100%">
            <tr>
                <td rowspan="2" valign="top" align="left" style="width:40%">   
                    <fieldset style="height:500px;">
                        <legend>สายงาน</legend>
                        <iframe id="ControllingIframe" src="./CAControlling.aspx" width="100%" scrolling="auto" frameborder="0" marginwidth="0" marginheight="0" style="height:95%"></iframe>
                    </fieldset>
                </td>

                <td valign="top" align="center">
                    <fieldset>
                        <legend>Summary</legend>
                        <iframe id="SummaryIframe" src="./CASummary.aspx" width="100%" scrolling="auto" frameborder="0" marginwidth="0" marginheight="0"></iframe>
                    </fieldset>
                </td>
            </tr>
            
            <tr>
                <td valign="top" align="center">
                    <fieldset>
                        <legend>CA LIST</legend>
                        <iframe id="CAListIframe" src="./CAList.aspx" width="100%" scrolling="auto" frameborder="0" marginwidth="0" marginheight="0"></iframe>
                    </fieldset>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
