<%@ Page Language="VB" AutoEventWireup="false" CodeFile="financial_information.aspx.vb"
    Inherits="smes_financial_information" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<head runat="server">
    <title></title>
    <script src="js/jquery-1.7.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui-1.8.18/js/jquery-ui-1.8.18.custom.min.js" type="text/javascript"></script>
    <%--    <link href="js/jquery-ui-1.8.18/css/redmond/jquery-ui-1.8.18.custom.css" rel="stylesheet"    type="text/css" />--%>
    <%--    <link href="js/jquery-ui-1.8.18/css/sunny/jquery-ui-1.8.18.custom.css" rel="stylesheet"    type="text/css" />--%>
    <link href="js/jquery-ui-1.8.18/css/ui-lightness/jquery-ui-1.8.18.custom.css" rel="stylesheet"
        type="text/css" />
    <script src="js/autoNumeric.js" type="text/javascript"></script>
    <script type="text/javascript">
        //  ฟังชั่นซ่อนแสดง ข้อมูล
        var templateID;

        $(document).ready(function () {
            var userName;
            if (window.parent.document.getElementById("spanUserName")) {
                userName = window.parent.document.getElementById("spanUserName").innerText;
            } else {
                userName = 'test';
            }
            if (window.parent.document.getElementById("spanRefID")) {
                RefID = window.parent.document.getElementById("spanRefID").innerText;
            }
            if (window.parent.document.getElementById("spanTemplateID")) {
                TemplateID = window.parent.document.getElementById("spanTemplateID").innerText;
            }


            $("#USERTextBox").val(userName);
            $("#REF_IDTextBox").val(RefID);
            $("#TemplateTextBox").val(TemplateID);

            $('#tableBusiness').hide();

            $('#InvestInTextBox').autoNumeric({ aPad: true, vMin: '0', vMax: '99' });
            $('#LimitDebtTextBox').autoNumeric({ aPad: true, vMin: '0', vMax: '99999999999' });
            $('#TenorTextBox').autoNumeric({ aPad: true, vMin: '0', vMax: '99' });
           

            var tempPid = $("#TemplateTextBox").val();
            templateID = parseInt(tempPid);

            //  ส่วนนี้เป็น การเลือก ว่าจะแสดงข้อมูล business จากที่ได
            // กรณีที่ template 1 ให้เลือก business จาก ss ,2  business จาก leader ,3 ( 3x  business จาก leader 

            if (templateID == 1 ||templateID==5 || templateID==6) {
                // กรณี่ที่เป็น template 1 ss project
                $("#BusinessImageButton").click(function () {
                    //var popup = $find('mpeBehaviorEditProject');
                    var myId = "PopUpIFrame";
                    var url = "Business_Type.aspx";

                    // Control ที่ส่งไปให้กับ Page ลูก เพื่อนำข้อมูลกลับมายังหน้าหลัก

                    var param = "PopupModal=mpeBehaviorEditProject";
                    // Parameter ที่ส่งไปให้กับ Page ลูก เพื่อนำข้อมูลกลับมายังหน้าหลัก 
                    //***********************************************************************************************
                    param = param + "&BUSINESS_ID_TABLETextBox=" + "BUSINESS_ID_TABLETextBox";
                    param = param + "&BUSINESS_CODE_TABLETextBox=" + "BUSINESS_CODE_TABLETextBox";
                    param = param + "&BUSINESS_NAME_TABLETextBox=" + "BUSINESS_NAME_TABLETextBox";
                    param = param + "&BUSINESS_GROUP_ID_TABLETextBox=" + "BUSINESS_GROUP_ID_TABLETextBox";
                    param = param + "&BUSINESS_GROUP_TABLETextBox=" + "BUSINESS_GROUP_TABLETextBox";
                    param = param + "&MARGIN_TABLETextBox=" + "MARGIN_TABLETextBox";
                    param = param + "&DSCR_TABLETextBox=" + "DSCR_TABLETextBox";
                    param = param + "&AP_TABLETextBox=" + "AP_TABLETextBox";
                    param = param + "&AR_TABLETextBox=" + "AR_TABLETextBox";
                    param = param + "&STOCK_TABLETextBox=" + "STOCK_TABLETextBox";
                    param = param + "&LTV_TABLETextBox=" + "LTV_TABLETextBox";
                    param = param + "&WORKING_CAPITAL_TABLETextBox=" + "WORKING_CAPITAL_TABLETextBox";
                    param = param + "&RATE_TABLETextBox=" + "RATE_TABLETextBox";
                    param = param + "&CONTRACT_TABLETextBox=" + "CONTRACT_TABLETextBox";

                    changeIframeSrcById(myId
                , url
                , param
            );

                    $("#modalFrame").dialog({
                        autoOpen: true,
                        height: 500,
                        width: 800,
                        modal: true
                    });
                });

            } else if (templateID == 2) {
                // กรณ๊ที่ เป็น template 2  flood program

                $("#BusinessImageButton").click(function () {
                    var url = "BusinessType.aspx";
                    var param = "PopupModal=mpeBehaviorEditProject";
                    // Parameter ที่ส่งไปให้กับ Page ลูก เพื่อนำข้อมูลกลับมายังหน้าหลัก 
                    //***********************************************************************************************
                    param = param + "&returnIdTarget=" + "BUSINESS_ID_TABLETextBox";
                    param = param + "&returnDetailTarget=" + "BUSINESS_NAME_TABLETextBox";
                    window.open(url + '?' + param, '', 'width=600,height=500')
                });

                // $("[hide=2]").hide();

            } else if (templateID ==3 || templateID==4) {

               // template จุใจ  buyer
                $("#BusinessImageButton").click(function () {
                    //var popup = $find('mpeBehaviorEditProject');
                    var myId = "PopUpIFrame";
                    var url = "Industry.aspx";

                    // Control ที่ส่งไปให้กับ Page ลูก เพื่อนำข้อมูลกลับมายังหน้าหลัก

                    var param = "PopupModal=mpeBehaviorEditProject";
                    // Parameter ที่ส่งไปให้กับ Page ลูก เพื่อนำข้อมูลกลับมายังหน้าหลัก 
                    //***********************************************************************************************
                    param = param + "&ShowAll=" + "True";
                    param = param + "&BUSINESS_ID_TABLETextBox=" + "BUSINESS_ID_TABLETextBox";
                    param = param + "&BUSINESS_CODE_TABLETextBox=" + "BUSINESS_CODE_TABLETextBox";
                    param = param + "&BUSINESS_NAME_TABLETextBox=" + "BUSINESS_NAME_TABLETextBox";
                    param = param + "&BUSINESS_GROUP_ID_TABLETextBox=" + "BUSINESS_GROUP_ID_TABLETextBox";
                    param = param + "&BUSINESS_GROUP_TABLETextBox=" + "BUSINESS_GROUP_TABLETextBox";
                    param = param + "&MARGIN_TABLETextBox=" + "MARGIN_TABLETextBox";
                    param = param + "&DSCR_TABLETextBox=" + "DSCR_TABLETextBox";
                    param = param + "&AP_TABLETextBox=" + "AP_TABLETextBox";
                    param = param + "&AR_TABLETextBox=" + "AR_TABLETextBox";
                    param = param + "&STOCK_TABLETextBox=" + "STOCK_TABLETextBox";
                    param = param + "&LTV_TABLETextBox=" + "LTV_TABLETextBox";
                    param = param + "&WORKING_CAPITAL_TABLETextBox=" + "WORKING_CAPITAL_TABLETextBox";
                    param = param + "&RATE_TABLETextBox=" + "RATE_TABLETextBox";
                    param = param + "&CONTRACT_TABLETextBox=" + "CONTRACT_TABLETextBox";

                    changeIframeSrcById(myId
                , url
                , param
            );
                    $("#modalFrame").dialog({
                        autoOpen: true,
                        height: 500,
                        width: 800,
                        modal: true
                    });
                });

            }

            // ส่วนนี้เป็นส่วนกำหนดให้แสดงหรือ ซ่อนฟิวที่ต้อง กรอก ตาม template id

            $('[template]').hide();
            $('[template*=' + templateID + ']').show();

            //$("tr[template] :not(:contains('2'))").hide();
            //$("[template]:not('1')").hide();
            //$("tr[template]:not(:contains('1'))").addClass("show");
            //$("tr").attr('template').(:contains('1'))
            //            $("tr[template]").not(":contains('1')").hide();
            //            if (templateID == '1' || templateID == '3') {
            //               
            //            } else {

            //            }


            $("#BUSINESS_GROUP_ID_TABLETextBox").change(function () {
                $("#BUSINESS_GROUP_IDTextBox").val($(this).val());
                $("#BUSINESS_GROUPTextBox").val($("#BUSINESS_GROUP_TABLETextBox").val());

            });
            sizeFrame();

            $("#SMES_IDTextBox,#numCustomer,#REF_IDTextBox,#USERTextBox").focus(function () {
                $(this).blur();
            });
            $("#BUSINESS_CODE_TABLETextBox,#BUSINESS_ID_TABLETextBox,#BUSINESS_NAME_TABLETextBox,#BUSINESS_GROUP_ID_TABLETextBox,#BUSINESS_GROUP_TABLETextBox,#MARGIN_TABLETextBox,#BUSINESS_GROUP_IDTextBox,#BUSINESS_GROUPTextBox").focus(function () {
                $(this).blur();
            });
            $("#DSCR_TABLETextBox,#AP_TABLETextBox,#AR_TABLETextBox,#STOCK_TABLETextBox").focus(function () {
                $(this).blur();
            });
            $("#LTV_TABLETextBox,#WORKING_CAPITAL_TABLETextBox,#RATE_TABLETextBox,#CONTRACT_TABLETextBox").focus(function () {
                $(this).blur();
            });

        });


    </script>
    <script type="text/javascript">
        function sizeFrame() {
            //   $("#iframeBlackList", top.document).css({ height: 0 });   
            // กำหนดความสูงของ iframe ให้เท่ากับ 0
            var heightDiv = $(document).height();
            //        alert(heightDiv);
            //        alert($("#mainFrame", parent.document).height());
            ////        $("#mainFrame", parent.document).height(heightDiv - 100);
            //        alert($("#mainFrame", parent.document).height());

            $("#mainFrame", parent.document).height(600);  // กำหนด

            //        var mHight = $("#iframeReportDetail", parent.parent.document).height();
            //        var bHight = $("#iframeBlackList", parent.document).height();
            //        $("#iframeReportDetail", parent.parent.document).height(mHight + bHight);
            //        // กำหนดความสูงของ iframe ให้เท่ากับความสูงของ pagecontent.html   
        }
    </script>
    <script type="text/javascript">
        // เปลี่ยน url ของ iframe ที่เป็นตัวเลือกโยนค่ากลับมา
        function changeIframeSrcById(iframeID, url, param) {
            var urlFull = "";
            var iframe = document.getElementById(iframeID);
            if (param) {
                urlFull = url + "?" + param;
            } else {
                urlFull = url;
            }
            iframe.src = encodeURI(urlFull);
        }

    </script>
    <script type="text/javascript">
        function changeMenu(SMES_ID, TEMPLATE_ID) {
            top.frames['menuFrame'].location = "financial_menu.aspx?SMES_ID=" + SMES_ID + "&TEMPLATE_ID=" + TEMPLATE_ID;
        }
        function changeMain(MSG, SMES_ID) {
            top.frames['mainFrame'].location = "financial_checklist.aspx?SMES_ID=" + SMES_ID + "&msg=" + MSG;
        }

    </script>
    <script type="text/javascript">
        $(function () {
            $("#modalFrame").dialog({
                height: 600,
                width: 800,
                title: 'กรุณาเลือก Business',
                position: [100, 50],
                modal: true,
                autoOpen: false
            });

            $("input[type=submit]").button();


        });
    </script>
    <script type="text/javascript">

        function showErrorDialog(t) {
            $("#dialog").dialog({
                autoOpen: true,
                title: "Please complete input data.",
                position: [300, 100],
                modal: "true",
                buttons: {
                    Ok: function () {
                        $(this).dialog("close");
                    }
                }
            });
            $("#dialog .msg").text(t).addClass("ui-state-error");


        }
        function showDialog(t) {

            $("#dialog").dialog({
                autoOpen: true,
                position: [300, 100],
                modal: "true",
                title: "Complete",
                buttons: {
                    Ok: function () {
                        $(this).dialog("close");
                    }
                }
            });
            $("#dialog .msg").text(t).addClass("ui-state-highlight");
        }

        function checkNull(o, n) {
            if (o.val() == "") {
                o.addClass("ui-state-error");
                showErrorDialog("กรุณาระบุ" + n);
                return false;
            } else {
                return true;
            }
        }
        function checkZero(o, n) {
            if (o.val() <= 0) {
                o.addClass("ui-state-error");
                showErrorDialog("กรุณาระบุข้อมูล " + n);
                return false;
            } else {
                return true;
            }
        }

        function checkValidAll() {
            var bValid = true;
            bValid = bValid && checkNull($("#BUSINESS_ID_TABLETextBox"), "ประเภทธุรกิจ");
            if ($("#numCustomer").val() < 1) {
                bValid = false;
                showErrorDialog("กรุณาระบุข้อมูล Customer ");
            }

            if (templateID == 1) {  // กรณีเป็น ss ต้องบังคับกรอก
                if ($("#TenorTextBox").val() == '') {
                    bValid = false;
                    showErrorDialog("กรุณาระบุข้อมูล ระยะเวลากู้ ");
                }
            }

            if (bValid) {
                return true;
            } else {
                return false;
            }

        }
    </script>
    <style type="text/css">
        body
        {
            font-size: smaller;
            font-family: arial;
            background-image: url("images/gradient2.png");
            background-repeat: repeat-x;
            margin: 5px5px;
        }
        #divRef
        {
            position: absolute;
            top: 0;
            right: 0;
        }
        .style1
        {
            width: 313px;
        }
        .style2
        {
            width: 313px;
            height: 26px;
        }
        .style3
        {
            height: 26px;
        }
        .show
        {
            background-color: Red;
        }
        .style4
        {
            height: 25px;
        }
    </style>
    <link href="css/AjaxControlStyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="dialog" title="">
        <p class="msg">
        </p>
    </div>
    <div id="header">
        <h4>
            <asp:Label ID="labelHead" runat="server" Text="Project Information (ข้อมูลพื้นฐาน)"
                Style="font-weight: 700; color: #0000FF"></asp:Label>
        </h4>
    </div>
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptLocalization="true"
        EnableScriptGlobalization="true" EnablePageMethods="true">
    </asp:ScriptManager>
    <div id="divRef">
        SMES_ID:<asp:TextBox ID="SMES_IDTextBox" runat="server" MaxLength="10" Width="30"></asp:TextBox>
        &nbsp;REF:&nbsp;<asp:TextBox ID="REF_IDTextBox" ToolTip="ref_id" runat="server" Width="100" />
        &nbsp;User:<asp:TextBox ID="USERTextBox" ToolTip="ref_id" runat="server" Width="100" />
        &nbsp;Template:<asp:TextBox ID="TemplateTextBox" ToolTip="TEMPLATE_ID" runat="server"
            Width="20" />
    </div>
    <div id="divTable">
        <br />
        <strong>กรุณากรอกข้อมูลให้ครบถ้วน </strong>
        <table id="tableBusiness" style="width: 100%;">
            <tr>
                <td>
                    Margin Table
                </td>
                <td>
                    <asp:TextBox ID="MARGIN_TABLETextBox" runat="server" ToolTip="Default margin" CELL='MARGIN_TABLE' />
                </td>
                <td>
                    DSCR Table
                </td>
                <td>
                    <asp:TextBox ID="DSCR_TABLETextBox" runat="server" ToolTip="DSCR" CELL="DSCR_TABLE" />
                </td>
            </tr>
            <tr>
                <td class="style4">
                    AP Table
                </td>
                <td class="style4">
                    <asp:TextBox ID="AP_TABLETextBox" runat="server" ToolTip="AP" CELL="AP_TABLE" />
                </td>
                <td class="style4">
                    AR Table
                </td>
                <td class="style4">
                    <asp:TextBox ID="AR_TABLETextBox" runat="server" ToolTip="Credit Term" CELL="AR_TABLE" />
                </td>
            </tr>
            <tr>
                <td>
                    Inventory Visit Table
                </td>
                <td>
                    <asp:TextBox ID="STOCK_TABLETextBox" runat="server" ToolTip="ยอดขาย" CELL="STOCK_TABLE" />
                </td>
                <td>
                    &nbsp;LTV Table
                </td>
                <td>
                    <asp:TextBox ID="LTV_TABLETextBox" runat="server" ToolTip="LTV" CELL="LTV_TABLE" />
                </td>
            </tr>
            <tr>
                <td>
                    Working Capital Table
                </td>
                <td>
                    <asp:TextBox ID="WORKING_CAPITAL_TABLETextBox" runat="server" ToolTip="Working Capital"
                        CELL="WORKING_CAPITAL_TABLE" />
                </td>
                <td>
                    Rate Table
                </td>
                <td>
                    <asp:TextBox ID="RATE_TABLETextBox" runat="server" ToolTip="Rate" CELL="RATE_TABLE" />
                </td>
            </tr>
            <tr>
                <td>
                    Contract Table
                </td>
                <td>
                    <asp:TextBox ID="CONTRACT_TABLETextBox" runat="server" ToolTip="Contract" CELL="CONTRACT_TABLE" />
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    Industry&nbsp; id&nbsp; from table
                </td>
                <td>
                    <asp:TextBox ID="BUSINESS_GROUP_ID_TABLETextBox" runat="server" Width="100" />
                </td>
                <td>
                    Industry&nbsp; from table
                </td>
                <td>
                    <asp:TextBox ID="BUSINESS_GROUP_TABLETextBox" ToolTip="กลุ่มธุรกิจ" runat="server"
                        Width="250" />
                </td>
            </tr>
        </table>
    </div>
    <table style="width: 100%">
        <tr template="123456">
            <td class="style2">
                ประเภทธุรกิจ
            </td>
            <td class="style3">
                <asp:TextBox ID="BUSINESS_CODE_TABLETextBox" ToolTip="รหัสธุรกิจ" runat="server"
                    template="1" hide="2" Width="100" />
                <asp:Image ID="BusinessImageButton" runat="server" ImageUrl="~/aspx/smes/images/Update.gif"
                    Style="height: 16px" />
                <asp:TextBox ID="BUSINESS_ID_TABLETextBox" ToolTip="รหัสธุรกิจ" runat="server" Width="100" />
                <asp:TextBox ID="BUSINESS_NAME_TABLETextBox" ToolTip="ประเภทธุรกิจ" runat="server"
                    Width="250" />
            </td>
        </tr>
        <tr template="1456">
            <td class="style1">
                กลุ่มธุรกิจ&nbsp; (เลือกประเภทธุรกิจ)
            </td>
            <td>
                <asp:TextBox ID="BUSINESS_GROUP_IDTextBox" ToolTip="รหัสธุรกิจ" runat="server" Width="100" />
                &nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="BUSINESS_GROUPTextBox" ToolTip="ธุรกิจ" runat="server" Width="248px" />
            </td>
        </tr>
        <tr template="1234">
            <td class="style1">
                วัตถุประสงค์
            </td>
            <td>
                <asp:DropDownList ID="PurposeDropDownList" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr template="134">
            <td class="style1">
                จะลงทุนในธุรกิจภายใน
            </td>
            <td>
                <asp:TextBox ID="InvestInTextBox" runat="server" MaxLength="2" Width="40"></asp:TextBox>
                &nbsp; ปี
            </td>
        </tr>
        <tr template="13456">
            <td class="style1">
                ระยะเวลากู้
            </td>
            <td>
                <asp:DropDownList ID="TenorDropDownList" runat="server" visible="false" >
                </asp:DropDownList>
                <asp:TextBox ID="TenorTextBox" runat="server" MaxLength="2" Width="40"></asp:TextBox>
                &nbsp; ปี
            </td>
        </tr>
        <tr template="134">
            <td class="style1">
                ประเภทหลักประกัน
            </td>
            <td>
                <asp:DropDownList ID="CollateralDropDownList" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr template="134">
            <td class="style1">
                ธุรกิจ wathch list
            </td>
            <td>
                <asp:DropDownList ID="WatchListDropDownList" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr template="134">
            <td class="style1">
                Net Profit &amp; Equity (Audited)
            </td>
            <td>
                <asp:DropDownList ID="NetProfitDropDownList" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr template="134">
            <td class="style1">
                หนี้ที่สามารถก่อได้ (Tricker point)
            </td>
            <td>
                <asp:TextBox ID="LimitDebtTextBox" runat="server" MaxLength="10" Width="100"></asp:TextBox>
                &nbsp;บาท
            </td>
        </tr>
        <tr template="134">
            <td class="style1">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
    <asp:Button ID="InsertButton" runat="server" Text="Insert New Data" OnClientClick="return checkValidAll()"
        Height="30px" Width="200px" />&nbsp
    <asp:Button ID="UpdateButton" runat="server" Text="Update Data" OnClientClick="return checkValidAll()"
        Height="30px" Width="200px" />
    <div id="modalFrame">
        <iframe id="PopUpIFrame" width="100%" height="100%" frameborder="0"></iframe>
    </div>
    </form>
</body>
</html> 