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
            var location;
            var param;

            if (page == 'MAIN') {
                location = "financial_information.aspx";
                param ="?TEMPLATE_ID=" + template_id + "&SMES_ID=" + smes_id;
            } else if (page == 'CKL') {
                location = "check_list.aspx";
                param = "?SMES_TYPE=1&TEMPLATE_ID=" + template_id + "&SMES_ID=" + smes_id;
            } else if (page == 'CKLCM') {
                location = "check_list.aspx";
                param ="?SMES_TYPE=2&TEMPLATE_ID=" + template_id + "&SMES_ID=" + smes_id;
            } else if (page == 'CIF') {
                location = "financial_customer_ca.aspx";
                param = "?TEMPLATE_ID=" + template_id + "&SMES_ID=" + smes_id;
            }   else if (page == 'CK') {
                location = "financial_checklist.aspx";
                param = "?TEMPLATE_ID=" + template_id + "&SMES_ID=" + smes_id;
            } else if (page == 'RM') {
                  switch (template_id) {
                      case 1: location = "financial_data.aspx"; break;
                      case 2: location = "financial_data.aspx"; break;
                      case 3: location = "financial_data_input.aspx"; break;
                      case 4: location = "financial_data_input.aspx"; break;
                      case 5: location = "financial_data.aspx"; break;
                      case 6: location = "financial_data.aspx"; break;
                      default: location = "financial_data.aspx"; break;
                }
                  param = "?TEMPLATE_ID=" + template_id + "&SMES_TYPE=1&SMES_ID=" + smes_id;
            } else if (page == 'CM') {
                  switch (template_id) {
                      case 1: location = "financial_data.aspx"; break;
                      case 2: location = "financial_data.aspx"; break;
                      case 3: location = "financial_data_input.aspx"; break;
                      case 4: location = "financial_data_input.aspx"; break;
                      case 5: location = "financial_data.aspx"; break;
                      case 6: location = "financial_data.aspx"; break;
                      default: location = "financial_data.aspx"; break;
                  }
                  param = "?TEMPLATE_ID=" + template_id + "&SMES_TYPE=2&SMES_ID=" + smes_id;
            } else if (page=='CP') {
                  location = "financial_compare.aspx" 
                  param="?SMES_ID=" + smes_id;
            }
            
            top.frames['mainFrame'].location = location + param;


        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="selectable">
        <ul id="navigation">
            <li><a id="aMain" href="#" runat="server">INFORMATION</a></li>
            <li><a id="aCKL" href="#" runat="server">RM CHECK LIST</a></li>
            <li><a id="aCKLCM" href="#" runat="server">CM CHECK LIST</a></li>
            <li><a id="aCIF" href="#" runat="server">CUSTOMER</a></li>
            <li><a id="aCK" href="#" runat="server">RESULT</a></li>
            <li><a id="aRM" href="#" runat="server">RM FINANCIAL</a></li>
            <li><a id="aCM" href="#" runat="server">CM FINANCIAL</a></li>
            <li><a id="aCP" href="#" runat="server">COMPARE</a></li>
            <li><a id="aBack" href="financial_ca_list.aspx"><< BACK </a></li>
        </ul>
    </div>
    </form>
</body>
</html>
