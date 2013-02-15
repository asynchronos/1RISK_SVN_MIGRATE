<%@ Page Language="VB" AutoEventWireup="false" CodeFile="login.aspx.vb" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="js/jquery-1.7.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui-1.8.18/js/jquery-ui-1.8.18.custom.min.js" type="text/javascript"></script>
    <link href="js/jquery-ui-1.8.18/css/ui-lightness/jquery-ui-1.8.18.custom.css" rel="stylesheet"
        type="text/css" />
    <style>
        body
        {
            font-size: 12px;
            font-family: arial;
            background-image: url("images/gradient2.png");
            background-repeat: repeat-x;
            padding-left: 5px;
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
        .style1
        {
            font-size: medium;
            font-weight: bold;
        }
    </style>
    <script>
        $(function () {
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

            $(".column").disableSelection();
            $("input[type=submit]").button();
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="demo">
        <div class="column">
        </div>
        <div class="column">
            <div class="portlet">
                <div class="portlet-header">
                    Login to SS Web<br />
                </div>
                <div class="portlet-content">
                    <div id="divLogin">
                        <table>
                            <tr>
                                <td colspan="2">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td class="style1">
                                    Username
                                </td>
                                <td>
                                    <asp:TextBox ID="UsernameTextBox" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1">
                                    Password
                                </td>
                                <td>
                                    <asp:TextBox ID="PasswordTextBox" runat="server" TextMode="Password"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    ใช้ Username และ Password เดียวกันกับ Leader1 (SME Web)
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Button ID="LoginButton" runat="server" Text="Login" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="column">
        </div>
    </div>
    <!-- End demo -->
    </form>
</body>
</html>
