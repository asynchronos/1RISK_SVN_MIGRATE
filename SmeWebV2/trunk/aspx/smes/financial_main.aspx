<%@ Page Language="VB" AutoEventWireup="false" CodeFile="financial_main.aspx.vb"
    Inherits="smes_financial_main" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SS project ( Financial data template )</title>
    <script src="js/jquery-1.7.min.js" type="text/javascript"></script>
    <script src="js/jquery.layout.all-1.2.0/jquery.layout.js" type="text/javascript"></script>
    <%-- <link href="js/jquery-ui-1.8.18/css/sunny/jquery-ui-1.8.18.custom.css" rel="stylesheet"  type="text/css" />--%>
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
            width: 98%;
            border-style: none;
        }
        .header
        {
            font-size: large;
            width: 100%;
        }
        .ui-widget-header
        {
            height: 93%;
        }
        #divUser
        {
            position: absolute;
            top: 0;
            right: 200px;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            $('body').layout({
                applyDefaultStyles: true
         	  , west__size: 140
               , north__size: 28
              , spacing_open: 4
              , spacing_closed: 4
            });

            //            // เปลี่ยน style หลังจากประกาศ layout เพราะหา option ที่ทำให้ชิดของใน layout ไม่เจอ
            //            $(".ui-layout-north").css({ "padding": "0px", "height": "100%", "backgroundColor" : "#ffeedd" });
            //             $(".ui-layout-north").css({ "padding": "0px", "height": "26px" ,"border":"0px" });
            //             $(".ui-layout-west").css({ "padding": "1px", "width": "108px", "border": "0px" });
            //             $(".ui-layout-center").css({ "padding": "1px","height":"100%" });

        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="ui-layout-north">
        <div class="ui-widget-header">
            <label>
                <span class="header">โปรแกรมคำนวณความสามารถในการก่อหนี้ </span>&nbsp;
            </label>
        </div>
        <div id="divUser">
            <table>
                <tr>
                    <td>
                        <span class="ui-state-error-text"><strong>User</strong></span>:
                    </td>
                    <td>
                        <span id="spanUserName" runat="server" />
                    </td>
                    <td>
                        <span class="ui-state-error-text"><strong>Name</strong></span>:
                    </td>
                    <td>
                        <span id="spanName" runat="server" />
                    </td>
                    <td>
                        <span class="ui-state-error-text"><strong>CA</strong></span>:
                    </td>
                    <td>
                        <span id="spanRefID" runat="server" />
                    </td>
                    <td>
                        <span class="ui-state-error-text"><strong>Template</strong></span>:
                    </td>
                    <td>
                        <span id="spanTemplateID" runat="server" />:<span id="spanTemplateName" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div id="leftDiv" class="ui-layout-west">
        <iframe id="menuFrame" runat="server" marginheight="0" marginwidth="0" frameborder="0"
            scrolling="no"></iframe>
    </div>
    <div id="rightDiv" class="ui-layout-center">
        <iframe id="mainFrame" runat="server" marginheight="0" marginwidth="0" frameborder="0">
        </iframe>
    </div>
    </form>
</body>
</html>
