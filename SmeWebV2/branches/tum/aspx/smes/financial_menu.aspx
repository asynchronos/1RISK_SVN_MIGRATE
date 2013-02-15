<%@ Page Language="VB" AutoEventWireup="false" CodeFile="financial_menu.aspx.vb"
    Inherits="smes_financial_menu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body
        {
            margin: 0px;
            font-size: 12px;
        }
        .ui-menu
        {
            width: 95%;
        }
    </style>
    <script src="js/jquery-1.7.min.js" type="text/javascript"></script>
    <%--    <script src="js/jquery-ui-1.8.18/js/jquery-ui-1.8.18.custom.min.js" type="text/javascript"></script>--%>
    <%--   <link href="js/jquery-ui-1.9m2/themes/base/jquery.ui.all.css" rel="stylesheet" type="text/css" />
   <script src="js/jquery-ui-1.9m2/ui/jquery.ui.core.js" type="text/javascript"></script>--%>
    <script src="js/jquery-ui-1.9m2/ui/jquery.ui.widget.js" type="text/javascript"></script>
    <script src="js/jquery-ui-1.9m2/ui/jquery.ui.menu.js" type="text/javascript"></script>
    <%--    <link href="js/jquery-ui-1.8.18/css/sunny/jquery-ui-1.8.18.custom.css" rel="stylesheet"    type="text/css" />--%>
    <link href="js/jquery-ui-1.8.18/css/ui-lightness/jquery-ui-1.8.18.custom.css" rel="stylesheet"
        type="text/css" />
    <script type="text/javascript">
        $(document).ready(function () {
            $("#navigation").menu();
            $("#aBack").click(function () {
                top.location = "financial_ca_list.aspx";
            });
            var heightDiv = $(document).height();
            $("#menuFrame", parent.document).height(heightDiv);
        });

        function changeFrame(page, template_id, smes_id) {
            // กำหนดให้ main frame เปลี่ยนเป็นหน้าที่ต้องการ
            // smes_id ส่งมาจาก code behind
           // alert(page);
            //alert(template_id);
            //alert(smes_id);

           if (page == 'MAIN') {
                top.frames['mainFrame'].location = "financial_information.aspx" + "?TEMPLATE_ID=" + template_id + "&SMES_ID=" + smes_id;
            }
          
           if (page == 'CKL') {
                top.frames['mainFrame'].location = "check_list.aspx" + "?TEMPLATE_ID=" + template_id + "&SMES_ID=" + smes_id;
            }
     
            else if (page == 'CIF') {
                top.frames['mainFrame'].location = "financial_customer_ca.aspx" + "?TEMPLATE_ID=" + template_id + "&SMES_ID=" + smes_id;
            }
            else if (page == 'CK') {
                top.frames['mainFrame'].location = "financial_checklist.aspx" + "?SMES_ID=" + smes_id;
            }
            else if (page == 'RM') {
                var page
                if (template_id >= 3) {
                    page = "financial_data_input.aspx";
                } else {
                    page = "financial_data.aspx";
                }
                top.frames['mainFrame'].location = page + "?TEMPLATE_ID=" + template_id + "&SMES_TYPE=1&SMES_ID=" + smes_id;
            }
            else if (page == 'CM') {
                var page
                if (template_id >= 3) {
                    page = "financial_data_input.aspx";
                } else {
                    page = "financial_data.aspx";
                }
                top.frames['mainFrame'].location = page + "?TEMPLATE_ID=" + template_id + "&SMES_TYPE=2&SMES_ID=" + smes_id;
            }
            else if (page == 'CP') {
                top.frames['mainFrame'].location = "financial_compare.aspx" + "?SMES_ID=" + smes_id;
            }

        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="selectable">
        <ul id="navigation">
            <li><a id="aMain" href="#" runat="server">INFORMATION</a></li>
            <li><a id="aCKL" href="#" runat="server">CHECK LIST</a></li>
            <li><a id="aCIF" href="#" runat="server">CUSTOMER</a></li>
            <li><a id="aCK" href="#" runat="server">BASIC RESULT</a></li>
            <li><a id="aRM" href="#" runat="server">RM FINANCIAL</a></li>
            <li><a id="aCM" href="#" runat="server">CM FINANCIAL</a></li>
            <li><a id="aCP" href="#" runat="server">COMPARE</a></li>
            <li><a id="aBack" href="financial_ca_list.aspx"><< BACK </a></li>
        </ul>
    </div>
    </form>
</body>
</html>
