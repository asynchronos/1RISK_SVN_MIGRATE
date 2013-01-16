<%@ Page Language="VB" AutoEventWireup="false" CodeFile="financial_customer_ca.aspx.vb"
    EnableEventValidation="true" Inherits="smes_financial_customer" Culture="th-TH"
    UICulture="th" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<html>
<head runat="server">
    <title></title>
    <script src="js/jquery-1.7.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui-1.8.18/js/jquery-ui-1.8.18.custom.min.js" type="text/javascript"></script>
    <script src="js/jquery.cookie.js" type="text/javascript"></script>
    <%--    <link href="js/jquery-ui-1.8.18/css/redmond/jquery-ui-1.8.18.custom.css" rel="stylesheet"    type="text/css" />--%>
    <%--    <link href="js/jquery-ui-1.8.18/css/sunny/jquery-ui-1.8.18.custom.css" rel="stylesheet"    type="text/css" />--%>
    <link href="js/jquery-ui-1.8.18/css/ui-lightness/jquery-ui-1.8.18.custom.css" rel="stylesheet"
        type="text/css" />
    <script src="js/autoNumeric.js" type="text/javascript"></script>
    <script type="text/javascript">
        //  ฟังชั่นซ่อนแสดง ข้อมูล
        var strCIF;
        var templateID;
        $(document).ready(function () {
            var userName;
            if (window.parent.document.getElementById("spanUserName")) {
                userName = window.parent.document.getElementById("spanUserName").innerText;
            } else {
                userName = 'test';
            }
            $("#USERTextBox").val(userName);

            if (window.parent.document.getElementById("spanTemplateID")) {
                templateID = window.parent.document.getElementById("spanTemplateID").innerText;
            }
            
            sizeFrame();

            $("#ExperienceTextBox").autoNumeric({ aPad: true, vMin: '0', vMax: '200' });

            $("#DeleteButton").click(function () {
                $("#dialog").dialog({
                    resizable: false,
                    height: 140,
                    title: ' ต้องการลบข้อมูล financial ลูกค้ารายนี้ ?',
                    modal: true,
                    buttons: {
                        "Confirm": function () {
                            window.location = "financial_customer_ca.aspx?action=delete&CIF=" + $("#CIFTextBox").val() + "&SMES_ID=" + $("#SMES_IDTextBox").val();
                        },
                        Cancel: function () {
                            $("#dialog").dialog("close");
                        }
                    }
                });
                $("#dialog .msg").text('Confirm delete this data.')
                return false;
            });
            $("#DeleteButton").addClass("ui-state-hover");

            $("#CIFTextBox").blur(function () {
                if (strCIF != $(this).val()) {
                    if ($(this).val().length > 0) {
                        search_CIF($(this).val());
                    } else {
                        $("#CIFNameTextBox").val('');
                    }
                }
            }).focus(function () {
                strCIF = $(this).val();  // เก็บค่าเก่าไว้เพื่อดูว่ามีการเปลี่ยนหรือไม่ ถ้าเปลี่ยนค่อยหาใหม่
            });
            $("#CustomerSearchImageButton").click(function () {
                return false;
                search_CIF($("#CIFTextBox").val());
            });


            $('#GUARANTEE_VALUETextBox').autoNumeric({ aPad: true, vMin: '0', vMax: '99999999999' });
            $('#ValueTextBox').autoNumeric({ aPad: true, vMin: '0', vMax: '99999999999' });

            $('#CHEQUE_RETURN_6MONTHTextBox').autoNumeric({ aPad: true, vMin: '0', vMax: '9999' });
            $('#OD_UTILIZATION_PERCENTTextBox').autoNumeric({ aPad: true, vMin: '0', vMax: '100' });
            $('#OD_OVER_NUMBERTextBox').autoNumeric({ aPad: true, vMin: '0', vMax: '999' });
            $('#TRADING_CHEQUE_RETURN_VAL_6MONTHTextBox').autoNumeric({ aPad: true, vMin: '0', vMax: '99999999999' });
            $('#OD_SWING_PERCENTTextBox').autoNumeric({ aPad: true, vMin: '0', vMax: '100' });
            $('#FIXED_ASSET_NO_LANDTextBox').autoNumeric({ aPad: true, vMin: '0', vMax: '99999999999' });
            $('#CHECK_NCB_6MONTHTextBox').autoNumeric({ aPad: true, vMin: '0', vMax: '100' });




        });

        function search_CIF(CIF) {
            PageMethods.CIFSearch(CIF,
               OnSucceededSearchCIF, OnFailedSearchCIF);
        }
        function OnSucceededSearchCIF(result) {
            if (result.length > 0) {
                var obj = eval('(' + result + ')');
                //alert(obj.cif);
                if (obj.cif != undefined) {
                    $("#CIFNameTextBox").val(obj.cif);
                } else {
                    $("#CIFNameTextBox").val('');
                    $("#CIFTextBox").val('');
                    alert(' ไม่พบข้อมูล ');
                }
            } else {
                $("#CIFTextBox").val('');
                $("#CIFNameTextBox").val('');
                alert(' ไม่พบข้อมูล ');
            }
        }
        function OnFailedSearchCIF(result) {
            $("#CIFTextBox").val('');
            $("#CIFNameTextBox").val('');
            alert(' ไม่สามารถค้นหาข้อมูล ');
        }
        
    </script>
    <script type="text/javascript">
        function clearDate(id) {
            $('#' + id).val('');

        }
        function sizeFrame() {
            //   $("#iframeBlackList", top.document).css({ height: 0 });   
            // กำหนดความสูงของ iframe ให้เท่ากับ 0
            var heightDiv = $(document).height();
            //        alert(heightDiv);
            //        alert($("#mainFrame", parent.document).height());
            ////        $("#mainFrame", parent.document).height(heightDiv - 100);
            //        alert($("#mainFrame", parent.document).height());

            $("#mainFrame", parent.document).height(800);  // กำหนด
            //        var mHight = $("#iframeReportDetail", parent.parent.document).height();
            //        var bHight = $("#iframeBlackList", parent.document).height();
            //        $("#iframeReportDetail", parent.parent.document).height(mHight + bHight);
            //        // กำหนดความสูงของ iframe ให้เท่ากับความสูงของ pagecontent.html   
        }
    </script>
    <script type="text/javascript">
        function changeMenu(SMES_ID) {
            //alert(SMES_ID);
            top.frames['menuFrame'].location = "financial_menu.aspx?SMES_ID=" + SMES_ID;
        }
        function changeCustomer(SMES_ID) {
            top.frames['mainFrame'].location = "financial_customer.aspx?SMES_ID=" + SMES_ID;
        }
        function changeURLtoRM(SMES_ID) {
            top.frames['mainFrame'].location = "financial_data.aspx?insertCustomerComplete=true&SMES_TYPE=1&SMES_ID=" + SMES_ID;
        }
    </script>
    <script type="text/javascript">
        function checkPerson() {
            if ($("#CustomerTypeDropDownList  option:selected").val() == 'CU01') {
                $(".clsPerson").show();
                $(".clsBusiness").hide();
            } else if ($("#CustomerTypeDropDownList  option:selected").val() == 'CU02') {
                $(".clsPerson").hide();
                $(".clsBusiness").show();
            } else {
                $(".clsPerson").hide();
                $(".clsBusiness").hide();
            }
        }
        $(document).ready(function () {

            $("#tabs").tabs({ cookie: { expires: 30} });
            if (templateID == 3) {

            } else {
//                $("#aTab3").hide();
//                $("#tabs-3").hide();
                $(".trTemplate3").hide();
            }

            checkPerson();
            $("#CustomerTypeDropDownList").change(function () {
                checkPerson();
            });


            var dateBefore = null;
            //$("#BirthDateTextBox").datepicker();

            // $(selector).datepicker($.datepicker.regional['th']);
            //  calendar  นี้ต้องมี extension พุธศักราช ด้วย jquery.ui.datepicker.ext.be.js
            // เวลารับค่า text จาก code behind จะรับเป็น คศ ให้ระวังด้วย
            //$("#BirthDateTextBox,#RegisterDateTextBox,#OperateDateTextBox").datepicker({
            //            $("#BirthDateTextBox").datepicker({
            //                isBE: true, //  option นี้ต้องมี extension พุธศักราช ด้วย                 
            //                monthNames: ['ม.ค.', 'ก.พ.', 'มี.ค.', 'เม.ย.', 'พ.ค.', 'มิ.ย.'],
            //                dayNames: ['อา.', 'จ.', 'อ.', 'พ.', 'พฤ.', 'ศ.', 'ส.'],
            //                dayNamesMin: ['อา', 'จ', 'อ', 'พ', 'พฤ', 'ศ', 'ส'],
            //                dateFormat: 'dd/mm/yy'
            //            });
            //            alert($("#BirthDateTextBox").val());
            //            $("#BirthDateTextBox").datepicker("setDate", $("#BirthDateTextBox").val());

            // $("#BirthDateTextBox").datepicker("setDate", this.val())

            //            $("#BirthDateTextBox,#RegisterDateTextBox,#OperateDateTextBox").datepicker({
            //                isBE: true,   //  option นี้ต้องมี extension พุธศักราช ด้วย
            //                autoConversionField: true,   //  option นี้ต้องมี extension พุธศักราช ด้วย
            //                dateFormat: 'dd/mm/yy',
            //                showOn: 'button',
            //                buttonImage: 'images/calendar.gif',
            //                buttonImageOnly: true,
            //                dayNamesMin: ['อา', 'จ', 'อ', 'พ', 'พฤ', 'ศ', 'ส'],
            //                monthNamesShort: ['ม.ค.', 'ก.พ.', 'มี.ค.', 'เม.ย.', 'พค.', 'มิย.', 'กค.', 'สค.', 'กย.', 'ตค.', 'พย.', 'ธค.'],
            //                changeMonth: true,
            //                changeYear: true,
            //                beforeShow: function () {
            //                    if ($(this).val() != "") {
            //                        var arrayDate = $(this).val().split("/");
            //                        if (parseInt(arrayDate[2]) > 2500);
            //                        {
            //                             arrayDate[2] = parseInt(arrayDate[2]) - 543;
            //                        }
            //                        $(this).val(arrayDate[0] + "/" + arrayDate[1] + "/" + arrayDate[2]);
            //                    }
            //                    setTimeout(function () {
            //                        $.each($(".ui-datepicker-year option"), function (j, k) {
            //                            var textYear = parseInt($(".ui-datepicker-year option").eq(j).val()) + 543;
            //                            $(".ui-datepicker-year option").eq(j).text(textYear);
            //                        });
            //                    }, 50);

            //                },
            //                onChangeMonthYear: function () {
            //                    alert('change');
            //                    setTimeout(function () {
            //                        $.each($(".ui-datepicker-year option"), function (j, k) {
            //                            var textYear = parseInt($(".ui-datepicker-year option").eq(j).val()) + 543;
            //                            $(".ui-datepicker-year option").eq(j).text(textYear);
            //                        });
            //                    }, 50);
            //                },
            //                onClose: function () {
            //                    if ($(this).val() != "" && $(this).val() == dateBefore) {
            //                        var arrayDate = dateBefore.split("/");
            //                        arrayDate[2] = parseInt(arrayDate[2]) + 543;
            //                        $(this).val(arrayDate[0] + "/" + arrayDate[1] + "/" + arrayDate[2]);
            //                    }
            //                },
            //                onSelect: function (dateText, inst) {
            //                    alert('select');
            //                    dateBefore = $(this).val();
            //                    var arrayDate = dateText.split("/");
            //                    arrayDate[2] = parseInt(arrayDate[2]) + 543;
            //                    $(this).val(arrayDate[0] + "/" + arrayDate[1] + "/" + arrayDate[2]);
            //                }

            //            });
            $("input[type=submit]").button();

        });
        function showErrorDialog(msg) {
            $("#dialog").dialog({
                autoOpen: true,
                position: [300, 100],
                title: "ไม่สามารถบันทึกข้อมูล",
                modal: "true",
                buttons: {
                    Ok: function () {
                        $(this).dialog("close");
                    }
                }
            });
            $("#dialog .msg").text(msg).addClass("ui-state-error");

        }
        function showDialog(msg) {

            $("#dialog").dialog({
                autoOpen: true,
                position: [300, 100],
                title: msg,
                modal: "true",
                buttons: {
                    Ok: function () {
                        $(this).dialog("close");
                    }
                }
            });
            $("#dialog .msg").text(msg).addClass("ui-state-highlight");

        }

        function checkValidAll() {
            //return false;
        }
    </script>
    <style type="text/css">
        body
        {
            font-family: arial;
            background-image: url("images/gradient2.png");
            background-repeat: repeat-x;
            font-size: 12px;
            margin: 5px5px;
        }
        #divRef
        {
            position: absolute;
            top: 0;
            right: 0;
        }
        #tableForm
        {
            width: 950px;
            font-size: 12px;
            padding:2px;
        }
        input[type=submit]
        {
            font-size: 12px;
        }
        #AddDebtButton
        {
            width: 100px;
            font-size: 12px;
        }
        #divSave
        {
            padding: 10px;
        }
        table
        {
            font-size: 12px;
        }
        td 
        {
            font-size:12px;   
         }
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="dialog" title="">
        <p class="msg">
        </p>
    </div>
    <div id="header">
        <h4>
            <asp:Label ID="labelHead" runat="server" Text="Customer data (ข้อมูลรายลูกค้า)" Style="font-weight: 700;
                color: #0000FF"></asp:Label>
        </h4>
    </div>
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptLocalization="true"
        EnableScriptGlobalization="true" EnablePageMethods="true">
    </asp:ScriptManager>
    <asp:Button ID="AddCustomerButton" runat="server" Text="Add Customer" Enabled="false" />
    <div id="divRef">
        SMES_ID:<asp:TextBox ID="SMES_IDTextBox" runat="server" MaxLength="10" Width="30"></asp:TextBox>
        &nbsp;User:<asp:TextBox ID="USERTextBox" ToolTip="ref_id" runat="server" Width="100" />
    </div>
    <div id="divTable" runat="server">
        <table>
            <tr>
                <td>
                    &nbsp;<asp:GridView ID="CustomersGridView" runat="server" AutoGenerateColumns="False"
                        DataKeyNames="CIF" ShowFooter="False" BackColor="White" BorderColor="#DEDFDE"
                        OnRowEditing="CustomerGridEditCommand" BorderStyle="None" BorderWidth="1px" CellPadding="4"
                        ForeColor="Black" GridLines="Vertical" HeaderStyle-CssClass=" ui-widget-header"
                        EnableModelValidation="True">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField HeaderText="Select">
                                <ItemTemplate>
                                    <asp:ImageButton ID="BtnEdit" runat="server" CommandName="Edit" ToolTip="Edit item"
                                        ImageUrl="~/aspx/smes/images/qmv_bb_preview.gif" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="CIF" HeaderText="CIF" ReadOnly="true" />
                            <asp:BoundField DataField="Name" HeaderText="Customer Name" ReadOnly="true" />
                            <asp:BoundField DataField="CREATE_DATE" HeaderText="วันที่เพิ่มข้อมูล" ReadOnly="true" />
                            <asp:BoundField DataField="UPDATE_DATE" HeaderText="วันที่แก้ไขข้อมูล" ReadOnly="true" />
                            <asp:BoundField DataField="CUSTOMER_TYPE_NAME" HeaderText="Customer Type" ReadOnly="true" />
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" />
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle BackColor="#F7F7DE" />
                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </div>
    <div id="divForm" runat="server">
        <div id="tabs">
            <ul>
                <li><a id="aTab1" href="#tabs-1">ข้อมูลลูกค้า</a></li>
                <li><a id="aTab2" href="#tabs-2">ข้อมูลสินเชื่อ(บสย)</a></li>
                <li><a id="aTab3" href="#tabs-3">ข้อมูลประวัติ NCB</a></li>
            </ul>
            <div id="tabs-1">
                <table id="tableForm">
                    <tr>
                        <td colspan="4">
                            <asp:Label ID="ActionLabel" runat="server" Style="font-weight: 700; font-size: medium"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            CIF
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="CIFTextBox" runat="server" Width="100" ></asp:TextBox>
                            <asp:ImageButton ID="CustomerSearchImageButton" runat="server" BorderColor="#CCCCCC"
                                ImageUrl="~/aspx/smes/images/Magnifying Glass.gif" />
                            &nbsp;<asp:TextBox ID="CIFNameTextBox" runat="server" Width="300"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ประเภทลูกค้า
                        </td>
                        <td>
                            <asp:DropDownList ID="CustomerTypeDropDownList" runat="server">
                            </asp:DropDownList>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr class="clsPerson">
                        <td>
                            วันเกิด
                        </td>
                        <td>
                            <asp:TextBox ID="BirthDateTextBox" runat="server" ViewStateMode="Enabled" Width="100"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="cal1" runat="server" TargetControlID="BirthDateTextBox"
                                PopupPosition="Right" />
                            <img id="imgClearAnnalsDate" runat="server" alt="clear date" onclick="clearDate('BirthDateTextBox')"
                                src="images/close_button.gif" />&nbsp; (dd/mm/yyyy) พ.ศ.
                        </td>
                        <td>
                            สัญชาติ
                        </td>
                        <td>
                            <asp:DropDownList ID="NationalityDropDownList" runat="server">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr class="clsBusiness">
                        <td>
                            วันที่จดทะเบียน
                        </td>
                        <td>
                            <asp:TextBox ID="RegisterDateTextBox" runat="server" Width="100"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="RegisterDateTextBox"
                                PopupPosition="Right" />
                            <img id="img2" runat="server" alt="clear date" onclick="clearDate('RegisterDateTextBox')"
                                src="images/close_button.gif" />
                            (dd/mm/yyyy) พ.ศ.
                        </td>
                        <td>
                            สัญชาติ
                        </td>
                        <td>
                            <asp:DropDownList ID="BNationalityDropDownList" runat="server">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr class="clsBusiness">
                        <td>
                            ประเภทธุรกิจ
                        </td>
                        <td>
                            <asp:DropDownList ID="JuristicDropDownList" runat="server">
                            </asp:DropDownList>
                        </td>
                        <td>
                            ผู้ถือหุ้น
                        </td>
                        <td>
                            <asp:DropDownList ID="ShareHolderDropDownList" runat="server">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr class="clsBusiness">
                        <td>
                            อายุผู้บริหาร
                        </td>
                        <td>
                            <asp:TextBox ID="CEOAgeTextBox" runat="server" Width="50" MaxLength="2"></asp:TextBox>&nbsp;ปี
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr class="clsBusiness">
                        <td>
                            วันที่ดำเนินกิจการ
                        </td>
                        <td>
                            <asp:TextBox ID="OperateDateTextBox" runat="server" Width="100"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="OperateDateTextBox"
                                PopupPosition="Right" />
                            <img id="img1" runat="server" alt="clear date" onclick="clearDate('OperateDateTextBox')"
                                src="images/close_button.gif" />
                            (dd/mm/yyyy) พ.ศ.
                        </td>
                        <td>
                            เอกสารการจดทะเบียน
                        </td>
                        <td>
                            <asp:DropDownList ID="RegisDocDropDownList" runat="server">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            BlackList
                        </td>
                        <td>
                            <asp:DropDownList ID="BlackListDropDownList" runat="server">
                            </asp:DropDownList>
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
                            TDR
                        </td>
                        <td>
                            <asp:DropDownList ID="TDRDropDownList" runat="server">
                            </asp:DropDownList>
                        </td>
                        <td>
                            ประสบการณ์
                        </td>
                        <td>
                            <asp:TextBox ID="ExperienceTextBox" runat="server" Width="50"></asp:TextBox>
                            &nbsp;ปี
                        </td>
                    </tr>
                
                    <tr>
                        <td>
                            Rating
                        </td>
                        <td>
                            <asp:DropDownList ID="RatingDropDownList" runat="server">
                            </asp:DropDownList>
                        </td>
                        <td>
                            สถานะทางกฎหมาย
                        </td>
                        <td>
                            <asp:DropDownList ID="LegalDropDownList" runat="server">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            สถานะการดำเนินงาน DSS
                        </td>
                        <td>
                            <asp:DropDownList ID="DSS_OPERATE_STATUSDropDownList" runat="server">
                            </asp:DropDownList>
                        </td>
                        <td>
                            ส่วนของผู้ถือหุ้นไม่ติดลบ
                        </td>
                        <td>
                            <asp:DropDownList ID="POSITIVE_EQUITYDropDownList" runat="server">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    
                    <tr class="trTemplate3">
                        <td>
                            เช็คคืนในรอบ 6 เดือน
                        </td>
                        <td>
                            <asp:TextBox ID="CHEQUE_RETURN_6MONTHTextBox" runat="server" Width="50px" MaxLength="2"
                                Height="22px"></asp:TextBox>
                            &nbsp;ฉบับ
                        </td>
                        <td>
                            มูลค่าเช็คการค้าคืน
                        </td>
                        <td>
                            <asp:TextBox ID="TRADING_CHEQUE_RETURN_VAL_6MONTHTextBox" runat="server" Width="100"
                                MaxLength="12"></asp:TextBox>
                            &nbsp;บาท
                        </td>
                    </tr>
                    <tr class="trTemplate3">
                        <td>
                            OD Utilization
                        </td>
                        <td>
                            <asp:TextBox ID="OD_UTILIZATION_PERCENTTextBox" runat="server" Width="50" MaxLength="3"></asp:TextBox>
                            &nbsp;%
                        </td>
                        <td>
                            OD Swing
                        </td>
                        <td>
                            <asp:TextBox ID="OD_SWING_PERCENTTextBox" runat="server" Width="50" MaxLength="3"></asp:TextBox>
                            &nbsp;%
                        </td>
                    </tr>
                    <tr class="trTemplate3">
                        <td>
                            จำนวนครั้งที่เกินวงเงิน OD
                        </td>
                        <td>
                            <asp:TextBox ID="OD_OVER_NUMBERTextBox" runat="server" Width="50" MaxLength="2"></asp:TextBox>
                            &nbsp;ครั้ง
                        </td>
                        <td>
                            มูลค่าทรัพย์สินถาวรไม่รวมที่ดิน
                            &nbsp;
                        </td>
                        <td>
                            <asp:TextBox ID="FIXED_ASSET_NO_LANDTextBox" runat="server" Width="100px" MaxLength="12"
                                Height="22px"></asp:TextBox>
                            &nbsp;บาท
                        </td>
                    </tr>
                  
                </table>
            </div>
            <div id="tabs-2">
                <table>
                    <tr>
                        <td>
                            <strong><span class="style6">ข้อมูลวงเงิน 3X และ วงเงินที่มี บสย ค้ำประกั้น </span>
                            </strong>
                            <br />
                            1) ระบุสินเชื่อวงเงินจากนั้น เลือกเพิ่มสินเชื่อ<br />
                            2) กรณีต้องการลบเลือกเครื่องหมายกากบาท<br />
                            &nbsp;&nbsp;&nbsp; หน้าข้อมูล ** ลบทันที **
                        </td>
                        <td colspan="4">
                            <table>
                                <tr>
                                    <td class="style5">
                                        &nbsp;
                                    </td>
                                    <td class="style7">
                                        สินเชื่อ
                                    </td>
                                    <td class="style7">
                                        วงเงิน(บาท)
                                    </td>
                                    <td class="style7">
                                        บสย ค้ำ(บาท)
                                    </td>
                                    <td class="style7">
                                        วันที่ใช้วงเงิน
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DebtDropDownList" runat="server">
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="ValueTextBox" runat="server" MaxLength="10" Width="100"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="GUARANTEE_VALUETextBox" runat="server" MaxLength="10" Width="100"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="UseValueDateTextBox" runat="server" MaxLength="10" Width="100"></asp:TextBox>
                                        <ajaxToolkit:CalendarExtender ID="UseVAlueDateCalendarExtender" runat="server" TargetControlID="UseValueDateTextBox"
                                            PopupPosition="TopRight" />
                                    </td>
                                    <td>
                                        <asp:Button ID="AddDebtButton" runat="server" Text="เพิ่มสินเชื่อ" />
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                            <asp:GridView ID="DebtGridView" runat="server" AutoGenerateColumns="False" BackColor="White"
                                BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" EnableModelValidation="True"
                                OnRowDeleting="DebtGridDeleteCommand" ForeColor="Black" HeaderStyle-CssClass=" ui-widget-header"
                                GridLines="Vertical">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:ImageButton ID="BtnDelete" runat="server" OnClientClick="return confirm('ต้องการลบข้อมูลสินเชื่อรายนี้');"
                                                CommandName="Delete" ToolTip="Delete item" ImageUrl="~/aspx/smes/images/qmv_bb_delete.gif" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="สินเชื่อ">
                                        <ItemTemplate>
                                            <asp:HiddenField ID="HdCustomerDebtID" runat="server" Value='<%# Eval("CUSTOMER_DEBT_ID")%>' />
                                            <asp:Label ID="LabelDEBT_NAME" runat="server" Text='<%# Eval("DEBT_NAME")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="วงเงิน" ItemStyle-HorizontalAlign="Right">
                                        <ItemTemplate>
                                            <asp:Label ID="LabelVALUE" runat="server" Text='<%# Eval("VALUE", "{0:n0}")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="บสย ค้ำ" ItemStyle-HorizontalAlign="Right">
                                        <ItemTemplate>
                                            <asp:Label ID="LabelGUARANTEE_VALUE" runat="server" Text='<%# Eval("GUARANTEE_VALUE", "{0:n0}")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="วันที่ใช้วงเงิน">
                                        <ItemTemplate>
                                            <asp:Label ID="LabelUSE_VALUE_DATE" runat="server" Text='<%# Eval("USE_VALUE_DATE", "{0:d}")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <FooterStyle BackColor="#CCCC99" />
                                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                <RowStyle BackColor="#F7F7DE" />
                                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
            </div>
            <div id="tabs-3">
                <table>
                    <tr>
                        <td>
                            NCB</td>
                        <td>
                            <asp:DropDownList ID="NCBDropDownList" runat="server">
                            </asp:DropDownList>
                        </td>
                        <td>
                            NCB Code
                        </td>
                        <td>
                            <asp:DropDownList ID="NCBCodeDropDownList" runat="server">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr class="trTemplate3">
                        <td>
                            ขาดทุนในงบการเงินส่งสรรพากร
                        </td>
                        <td>
                            <asp:DropDownList ID="PROFIT_LAST_2YEARSDropDownList" runat="server">
                            </asp:DropDownList>
                        </td>
                        <td>
                            งบการเิงินปีล่าสุดไม่ขาดทุนอย่างมีนัยสำคัญ&nbsp;
                        </td>
                        <td>
                            <asp:DropDownList ID="INSIGNIFICANT_LOSTDropDownList" runat="server">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr class="trTemplate3">
                        <td>
                            จำนวนครั้งในการตรวจสอบ NCB ของผู้กู้ในรอบ 6 เดือน
                        </td>
                        <td>
                            <asp:TextBox ID="CHECK_NCB_6MONTHTextBox" runat="server" Width="50px" MaxLength="2"
                                Height="22px"></asp:TextBox>
                            &nbsp;ครั้ง
                        </td>
                        <td>&nbsp</td>
                        <td>&nbsp</td>
                    </tr>
                    <tr class="trTemplate3">
                        <td>
                            NCB Record
                        </td>
                        <td colspan="3">
                            <table id="DPDTable">
                                <tr>
                                    <td>
                                    </td>
                                    .
                                    <th colspan="4" class="ui-widget-header">
                                        ประวัตการค้างชำระ
                                    </td>
                                </tr>
                                <tr>
                                    <td class="ui-widget-header">
                                        เดือนที่
                                    </td>
                                    <td class="ui-widget-header">
                                        10 - 30 วัน
                                    </td>
                                    <td class="ui-widget-header">
                                        30 - 60 วัน
                                    </td>
                                    <td class="ui-widget-header">
                                        > 60-90 วัน
                                    </td>
                                    <td class="ui-widget-header">
                                        > 90 วัน
                                    </td>
                                </tr>
                                <tr>
                                    <td class="ui-widget-header">
                                        1-3
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DPD_MORE_10_30_MONTH_1_3DropDownList" runat="server">
                                            <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                            <asp:ListItem Text=">3" Value="4"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DPD_MORE_30_60_MONTH_1_3DropDownList" runat="server">
                                            <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                            <asp:ListItem Text=">3" Value="4"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DPD_MORE_60_90_MONTH_1_3DropDownList" runat="server">
                                            <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                            <asp:ListItem Text=">3" Value="4"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DPD_MORE_90_MONTH_1_3DropDownList" runat="server">
                                            <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                            <asp:ListItem Text=">3" Value="4"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="ui-widget-header">
                                        4-12
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DPD_MORE_10_30_MONTH_4_12DropDownList" runat="server">
                                            <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                            <asp:ListItem Text=">3" Value="4"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DPD_MORE_30_60_MONTH_4_12DropDownList" runat="server">
                                            <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                            <asp:ListItem Text=">3" Value="4"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DPD_MORE_60_90_MONTH_4_12DropDownList" runat="server">
                                            <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                            <asp:ListItem Text=">3" Value="4"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DPD_MORE_90_MONTH_4_12DropDownList" runat="server">
                                            <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                            <asp:ListItem Text=">3" Value="4"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="ui-widget-header">
                                        12-24
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DPD_MORE_10_30_MONTH_12_24DropDownList" runat="server">
                                            <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                            <asp:ListItem Text=">3" Value="4"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DPD_MORE_30_60_MONTH_12_24DropDownList" runat="server">
                                            <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                            <asp:ListItem Text=">3" Value="4"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DPD_MORE_60_90_MONTH_12_24DropDownList" runat="server">
                                            <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                            <asp:ListItem Text=">3" Value="4"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DPD_MORE_90_MONTH_12_24DropDownList" runat="server">
                                            <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                            <asp:ListItem Text=">3" Value="4"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div id="divSave">
            <asp:Button ID="InsertButton" runat="server" Text="Insert New Data" OnClientClick="return checkValidAll()"
                Height="30px" Width="200px" />
            <asp:Button ID="UpdateButton" runat="server" Text="Update Data" OnClientClick="return checkValidAll()"
                Height="30px" Width="200px" />
            <asp:Button ID="CancelButton" runat="server" Text="Cancel" Height="30px" Width="200px" />
            &nbsp;
            <asp:Button ID="DeleteButton" runat="server" Text="Delete this customer" Height="30px"
                Width="200px"  Enabled="false"/>
        </div>
    </div>
    </form>
</body>
</html>
