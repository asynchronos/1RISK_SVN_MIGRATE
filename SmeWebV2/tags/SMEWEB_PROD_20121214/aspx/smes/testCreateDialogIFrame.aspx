<%@ Page Language="VB" AutoEventWireup="false" CodeFile="testCreateDialogIFrame.aspx.vb"
    Inherits="smes_testCreateDialogIFrame" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body
        {
            font-size: 10px;
        }
    </style>
    <script src="js/jquery-ui-1.8.18/js/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui-1.8.18/js/jquery-ui-1.8.18.custom.min.js" type="text/javascript"></script>
    <link href="js/jquery-ui-1.8.18/css/sunny/jquery-ui-1.8.18.custom.css" rel="stylesheet"
        type="text/css" />
    <script type="text/javascript">
        $(document).ready(function () {
            $("#dialog:ui-dialog").dialog("destroy");
            //            createIFrameModal();
            $("#button1").click(function () {
                // createIFrameModal('testCreateDialogIFrameValue.aspx');
                createIFrameModal('Business_Type.aspx');
            });
        });
        function createIFrameModal(url) {
            var selectEL;
            if ($("#modalDiv").length == 0) {
                src = url;
                $('<div id="modalDiv"></div>').appendTo('body');
                $('<div id="returnValue"></>').appendTo('body');
                $('<iframe id="myFrame" name="myFrame" width="100%" height="100%">').appendTo('#modalDiv');
                $('#myFrame').attr('src', src);
                $('#myFrame').load(function () {
                    $(this).contents().find("#Button1").click(function () {
                        alert('x');
                    });
                });
                $("#modalDiv").dialog({
                    title: 'show'
                    , width: 800
                    , hight: 600
                    //, modal: true// กำหนด src ทีหลังเพราะถ้าหน้าที่ load มีข้อมุลมากจะไม่เปิดช้า
                });

            } else {
                //$(".ui-dialog").show("fast");
                $("#modalDiv").dialog("open");
                return false;
            }
        }   // end function createIFrameModal() {


    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <input id="button1" type="button" value="show" />
    </div>
    </form>
</body>
</html>
