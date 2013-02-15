<%@ Page Language="VB" AutoEventWireup="false" CodeFile="financial_main_new.aspx.vb"
    Inherits="smes_financial_main_new" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>XXXX</title>
    <script src="js/jquery-1.7.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui-1.8.18/js/jquery-ui-1.8.18.custom.min.js" type="text/javascript"></script>
    <link href="js/jquery-ui-1.8.18/css/ui-lightness/jquery-ui-1.8.18.custom.css" rel="stylesheet"
        type="text/css" />
    <style type="text/css">
        body
        {
            margin: 0px 0px;
            overflow: hidden;
        }
        #leftDiv
        {
            width: 150px;
            float: left;
        }
        #rightDiv
        {
            width: 900px;
            float: right;
        }
        #mainFrame
        {
            width: 98%;
        }
        #menuFrame
        {
            width: 99%;
            border-style: none;
        }
        .ui-widget-header
        {
            height: 93%;
        }
        .column
        {
            width: 350px;
            float: left;
            padding-bottom: 100px;
        }
        .portlet
        {
            margin: 0 1em 1em 0;
        }
        .portlet-header
        {
            margin: 0.3em;
            padding-bottom: 4px;
            padding-left: 0.2em;
        }
        .portlet-header .ui-icon
        {
            float: right;
        }
        .portlet-content
        {  
            padding: 0.4em;
        }
        .ui-sortable-placeholder
        {
            border: 1px dotted black;
            visibility: visible !important;
            height: 50px !important;
        }
        .ui-sortable-placeholder *
        {
            visibility: hidden;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".column").sortable({
                connectWith: ".column"
            });

            $(".portlet").addClass("ui-widget ui-widget-content ui-helper-clearfix ui-corner-all")
			.find(".portlet-header")
				.addClass("ui-widget-header ui-corner-all")
				.prepend("<span class='ui-icon ui-icon-minusthick'></span>")
				.end()
			.find(".portlet-content");

            $(".portlet-header .ui-icon").click(function () {
                $(this).toggleClass("ui-icon-minusthick").toggleClass("ui-icon-plusthick");
                $(this).parents(".portlet:first").find(".portlet-content").toggle();
            });

        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="ui-layout-north">
        <div class="ui-widget-header">
            <label>
                <span class="header">โปรแกรมคำนวณความสามารถในการก่อหนี้ (V 0.1 Close Beta)</span>&nbsp;
            </label>
            &nbsp;&nbsp User: <span id="spanUserName" runat="server">&nbsp; </span>Name:<span
                id="spanName" runat="server"></span>
            <br />
        </div>
    </div>
    <div class="column" style="width:10%">
        <div class="portlet">
            <div class="portlet-header">
                Login to SS Web<br />
            </div>
            <div class="portlet-content" >
                <iframe id="menuFrame" runat="server" marginheight="0" marginwidth="0" frameborder="0"
                    scrolling="no"></iframe>
            </div>
        </div>
    </div>
    <div class="column" style="width:90%">
        <div class="portlet">
            <div class="portlet-header">
                Login to SS Web<br />
            </div>
            <div class="portlet-content">
                <div id="rightDiv" class="ui-layout-center">
                    <iframe id="mainFrame" runat="server" marginheight="0" marginwidth="0" frameborder="0">
                    </iframe>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
