<%@ Page Language="VB" AutoEventWireup="false" CodeFile="check_list.aspx.vb" Inherits="smes_check_list" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="js/jquery-ui-1.8.18/js/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui-1.8.18/js/jquery-ui-1.8.18.custom.min.js" type="text/javascript"></script>
    <link href="js/jquery-ui-1.8.18/css/ui-lightness/jquery-ui-1.8.18.custom.css" rel="stylesheet"
        type="text/css" />
    <style>
        body 
        {
            font-size:14px;  
          }
        .qg
        {
            background-color:#0088FF;
        }
        .qt 
        {
            background-color:#FF88FF;
         }
         h4 
         { font-size:16px;
            margin:1px 0px   
          }
    </style>

    <script>
        $(function () {
            $("#accordion").accordion({ autoHeight: false, collapsible: true });
        });
	</script>
</head>
<body>
    <form id="form1" runat="server">
     <div class="ui-widget-header">
        <h2>SME SS Project Checklist</h2> 
     </div>
    </form>
</body>
</html>
