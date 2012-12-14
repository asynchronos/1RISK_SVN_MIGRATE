<%@ Page Language="VB" AutoEventWireup="false" CodeFile="FormCreate.aspx.vb" Inherits="aspx_form_FormCreate" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <style type="text/css">
        body
        {
            font-size: medium;
        }
        
        .modalBackground
        {
            background-color: Gray;
            filter: alpha(opacity=50);
            opacity: 0.50;
        }
        
        .updateProgress
        {
            border-width: 1px;
            border-style: solid;
            background-color: #FFFFFF;
            position: absolute;
            width: 180px;
            height: 65px;
        }

    </style>
    <script type="text/javascript">

        if (window.screen) {
            self.moveTo(0, 0);
            self.focus();
            self.resizeTo(screen.availWidth, screen.availHeight);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    </form>
</body>
</html>
