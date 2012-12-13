<%@ Page Language="VB" AutoEventWireup="false" CodeFile="financial_customer_main.aspx.vb"
    Inherits="smes_financial_customer_main" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="js/jquery-ui-1.8.18/js/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui-1.8.18/js/jquery-ui-1.8.18.custom.min.js" type="text/javascript"></script>
    <link href="js/jquery-ui-1.8.18/css/ui-lightness/jquery-ui-1.8.18.custom.css" rel="stylesheet"
        type="text/css" />
        <style type="text/css">
            body 
            {
                font-size:12px;   
             }
        </style>
    <script>
        $(function () {
            $("#tabs").tabs({
                ajaxOptions: {
                    error: function (xhr, status, index, anchor) {
                        $(anchor.hash).html(
						"Couldn't load this tab. We'll try to fix this as soon as possible. " +
						"If this wouldn't be a demo.");
                    }
                }
            });
        });
    </script>
</head>
<body>
    <form>
    <div class="demo">
        <div id="tabs">
            <ul>
                <li><a href="#tabs-1">customer</a></li>
                <li><a href="#tabs-2">Tab 2</a></li>
              </ul>
            <div id="tabs-1">
               <iframe id="frameCustomer" width="100%" frameborder="0" scrolling="no"></iframe>
            </div>  
            <div id="tabs-2">
               <iframe id="frameCustomer" width="100%" frameborder="0" scrolling="no"></iframe>
            </div>
        </div>
    </div>
    <!-- End demo -->
    </form>
</body>
</html>
<!-- End demo-description -->
