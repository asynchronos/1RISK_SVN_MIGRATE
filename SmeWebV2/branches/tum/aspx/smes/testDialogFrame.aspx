<%@ Page Language="VB" AutoEventWireup="false" CodeFile="testDialogFrame.aspx.vb"
    Inherits="smes_testDialogFrame" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="js/jquery-1.7.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui-1.8.18/js/jquery-ui-1.8.18.custom.min.js" type="text/javascript"></script>
    <link href="js/jquery-ui-1.8.18/css/ui-lightness/jquery-ui-1.8.18.custom.css" rel="stylesheet"
        type="text/css" />
     <style >
        body 
        {
             font-size:x-small   
         }
     </style>
    <script type="text/javascript">
        $(function () {
            $("#create-user")
			.button()
			.click(function () {
			    $("#modalFrame").dialog("open");
			});
            $("#modalFrame").dialog({
                height: 400,
                width: 800,
                title: 'กรุณาเลือก Business',
                position:[100,100] ,
                modal: true,
                autoOpen: false
            });
        });
    </script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <button id="create-user">
            Create new user</button>
    </div>
    </form>
    <div id="modalFrame">
        <iframe src="Business_Type.aspx" width="100%" height="100%"></iframe>
    </div>
</body>
</html>
