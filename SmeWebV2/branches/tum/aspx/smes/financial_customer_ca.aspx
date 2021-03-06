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
    <%--    <link href="js/jquery-ui-1.8.18/css/redmond/jquery-ui-1.8.18.custom.css" rel="stylesheet"    type="text/css" />--%><%--    <link href="js/jquery-ui-1.8.18/css/sunny/jquery-ui-1.8.18.custom.css" rel="stylesheet"    type="text/css" />--%>
    <link href="js/jquery-ui-1.8.18/css/ui-lightness/jquery-ui-1.8.18.custom.css" rel="stylesheet"
        type="text/css" />
    <script src="js/autoNumeric.js" type="text/javascript"></script>
    <script type="text/javascript">
        //  ฟังชั่นซ่อนแสดง ข้อมูล
        var strCIF;
        var templateID;
        var msgTop;
        $(document).ready(function () {


            var userName;
            if (window.parent.document.getElementById("spanUserName")) {
                userName = window.parent.document.getElementById("spanUserName").innerText;
            } else {
                userName = 'test';
            }
            $("#USERTextBox").val(userName);

            templateID = $("#TemplateTextBox").val();
            if (templateID == '') {
                if (window.parent.document.getElementById("spanTemplateID")) {
                    templateID = window.parent.document.getElementById("spanTemplateID").innerText;
                }
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

            $('[template]').hide();
            $('[template*=' + templateID + ']').show();   // แสดง template
         
            if ($("#CustomerTypeDropDownList  option:selected").val() == 'CU01') {

       
                $('[custype=person]').show();
                $('[custype=person]').not('[template*=' + templateID + ']').hide();  // บุคคลที่ไม่ใช่ template ซ่อน
                $('[custype=business]').hide();

            } else if ($("#CustomerTypeDropDownList  option:selected").val() == 'CU02') {
                //$('[custype=business]').add('[template*=' + templateID + ']').show();
               // $('[template]').hide();
                //  $('[custype=business][template*=' + templateID + ']').show();

                $('[custype=business]').show();
               $('[custype=business]').not('[template*=' + templateID + ']').hide();  // บุคคลที่ไม่ใช่ template ซ่อน
               $('[custype=person]').hide();
            }

        }
        $(document).ready(function () {
            $("#tabs").tabs({ cookie: { expires: 30} });
            if (templateID == '1' || templateID == '5') {  // ไม่มีบสย
                $("#tabs").tabs("option", "disabled", [1]); // or setting after init
            }
            if (templateID == '2' || templateID == '3' || templateID == '4') {

            }
            if ( templateID == '6') {
           
            }

            checkPerson();  // เช็คว่าเป็นโชวนิติ หรือบุคล
      

            $("#CustomerTypeDropDownList").change(function () {
                checkPerson();
            });


            var dateBefore = null;
              
            $("input[type=submit]").button();

            // หาความสูงของปุ่ม อัพเดท หรือ insert เพื่อสร้าง dialog

            var obj = $("#UpdateButton");
            var obj2 = $("#InsertButton");
            var msgP = obj.position();
            var msgP2 = obj2.position();
            if (msgP) {
                msgTop = msgP.top;
            } else if (msgP2) {
                msgTop = msgP2.top;
            } else {
                msgTop = 200;
            }

          

        });



        function showErrorDialog(msg) {
            $("#dialog").dialog({
                autoOpen: true,
                position: [300, msgTop],
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
                position: [300, msgTop],
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
            padding: 2px;
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
            font-size: 12px;
        }
        .style1
        {
            width: 270px;
        }
        .style2
        {
            border: 1px solid #e78f08;
            background: #f6a828 url('js/jquery-ui-1.8.18/css/ui-lightness/images/ui-bg_gloss-wave_35_f6a828_500x100.png') repeat-x 50% 50%;
            color: #ffffff;
            font-weight: bold;
            width: 41px;
        }
        .style3
        {
            width: 41px;
        }
        .style4
        {
            border: 1px solid #e78f08;
            background: #f6a828 url('js/jquery-ui-1.8.18/css/ui-lightness/images/ui-bg_gloss-wave_35_f6a828_500x100.png') repeat-x 50% 50%;
            color: #ffffff;
            font-weight: bold;
            width: 52px;
        }
        .style5
        {
            width: 52px;
        }
        
        .ui-tabs .ui-state-disabled { 
            display: none; /* disabled tabs don't show up */ 
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
        &nbsp;User:<asp:TextBox ID="USERTextBox" ToolTip="ref_id" runat="server" Width="50" />
        &nbsp;Template:<asp:TextBox ID="TemplateTextBox" ToolTip="TEMPLATE_ID" runat="server" Width="20" />
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
        <div id="tabs"  runat="server">
            <ul>
                <li runat="server"><a id="aTab1" href="#tabs1">ข้อมูลลูกค้า</a></li>
                <li runat="server"><a id="aTab2" href="#tabs2" >ข้อมูลสินเชื่อ(บสย)</a></li>
                <li runat="server"><a id="aTab3" href="#tabs3">ข้อมูลประวัติ Credit Checking</a></li>
            </ul>
            <div id="tabs1" runat="server">
                <table id="tableForm">
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="ActionLabel" runat="server" Style="font-weight: 700; font-size: medium"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            CIF
                        </td>
                        <td>
                            <asp:TextBox ID="CIFTextBox" runat="server" Width="100"></asp:TextBox>
                            <asp:ImageButton ID="CustomerSearchImageButton" runat="server" BorderColor="#CCCCCC"
                                ImageUrl="~/aspx/smes/images/Magnifying Glass.gif" />
                            <asp:TextBox ID="CIFNameTextBox" runat="server" Width="300"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ลูกค้าใหม่ / เดิม</td>
                        <td>
                            <asp:DropDownList ID="CustomerNewDropDownList" runat="server">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ประเภทลูกค้า</td>
                        <td>
                            <asp:DropDownList ID="CustomerTypeDropDownList" runat="server">
                            </asp:DropDownList>
                        </td>
                  
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="BirthDateLabel" runat="server" Text="วันเกิดผู้กู้ (dd/mm/yyyy) พ.ศ." custype="person" template="123456"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="BirthDateTextBox" runat="server" ViewStateMode="Enabled" Width="100" custype="person" template="123456"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="cal1" runat="server" TargetControlID="BirthDateTextBox"
                                PopupPosition="Right" />
                            <img id="imgClearAnnalsDate" runat="server" alt="clear date" onclick="clearDate('BirthDateTextBox')" custype="person" template="123456"
                                src="images/close_button.gif" />
                        </td>

                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Nationality" runat="server" Text="สัญชาติ" custype="person" template="1234"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="NationalityDropDownList" runat="server" template="1234" custype="person" >
                            </asp:DropDownList>
                        </td>

                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LegalLabel" runat="server" Text="สถานะทางกฏหมายผู้กู้"  template="1234" custype="person"></asp:Label>  </td>
                        <td>
                            <asp:DropDownList ID="LegalDropDownList" runat="server" custype="person" template="1234">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="CO_BirthDateLabel" runat="server" Text="วันเกิดผู้กู้ร่วมผู้ค้ำ (dd/mm/yyyy) พ.ศ." template="56"></asp:Label> 
                        </td>
                        <td>
                            <asp:TextBox ID="CO_BirthDateTextBox" runat="server" ViewStateMode="Enabled" Width="100" template="56"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="CO_BirthDateTextBox"
                                PopupPosition="Right" />
                            <img id="img4" runat="server" alt="clear date" onclick="clearDate('CO_BirthDateTextBox')" template="56"
                                src="images/close_button.gif" />
                        </td>

                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="CO_LegalLabel" runat="server" Text="สถานะทางกฎหมายผู้กู้ร่วมผู้ค้ำ" template=""></asp:Label>
                     </td>
                        <td>
                            <asp:DropDownList ID="CO_LegalDropDownList" runat="server" template=""></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LabelRegisterDate" runat="server" Text="วันที่จดทะเบียน (dd/mm/yyyy) พ.ศ." custype="business" template="123456"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="RegisterDateTextBox" runat="server" Width="100" custype="business" template="123456"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="RegisterDateTextBox" 
                                PopupPosition="Right" />
                            <img id="img2" runat="server" alt="clear date" onclick="clearDate('RegisterDateTextBox')" custype="business" template="123456"
                                src="images/close_button.gif" />
                        </td>

                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="JuristicLabel" runat="server" Text="ประเภทธุรกิจ" custype="business" template="123456"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="JuristicDropDownList" runat="server" custype="business" template="123456">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="CEOAgeLabel" runat="server" Text="อายุผู้บริหาร (ปี)" custype="business" template="123456"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="CEOAgeTextBox" runat="server" Width="50" MaxLength="2" custype="business" template="123456"></asp:TextBox>
                        </td>

                    </tr>
                    <tr>
                        <td>
                                <asp:Label ID="BNationalityLabel" runat="server" Text="สัญชาติ" template="1234"  custype="business" ></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="BNationalityDropDownList" runat="server" template="1234"  custype="business" >
                            </asp:DropDownList>
                        </td>

                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="OperateDateLabel" runat="server" Text="วันที่ดำเนินกิจการ (dd/mm/yyyy) พ.ศ." custype="business" template="123456"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="OperateDateTextBox" runat="server" Width="100" custype="business" template="123456"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="OperateDateTextBox"
                                PopupPosition="Right" />
                            <img id="img1" runat="server" alt="clear date" onclick="clearDate('OperateDateTextBox')" custype="business" template="123456"
                                src="images/close_button.gif" />
                        </td>

                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="BlackListLabel" runat="server" Text="BlackList" template="1234"></asp:Label>
                            
                        </td>
                        <td>
                            <asp:DropDownList ID="BlackListDropDownList" runat="server" template="1234"></asp:DropDownList>
                        </td>

                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="RatingLabel" runat="server" Text="RATING" template="1234"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="RatingDropDownList" runat="server" template="1234">
                            </asp:DropDownList>
                        </td>

                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="labeldoc"  Text="เอกสารการจดทะเบียน" custype="business" template="1234">
                            </asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="RegisDocDropDownList" runat="server" custype="business" template="1234">
                            </asp:DropDownList>
                        </td>

                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="labelShareHol" Text="ผู้ถือหุ้น" custype="business" template="1234"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ShareHolderDropDownList" runat="server" custype="business" template="1234">
                            </asp:DropDownList>
                        </td>

                    </tr>
                    <tr>
                        <td>
                           <asp:Label ID="TDRLabel" runat="server" Text="TDR" template="1234"></asp:Label>
                            </td>
                        <td>
                            <asp:DropDownList ID="TDRDropDownList" runat="server" template="1234">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="ExperienceLabel" runat="server" Text="ประสบการณ์ในธุรกิจ (ปี)" ></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="ExperienceTextBox" runat="server" Width="50" ></asp:TextBox>
                          
                        </td>

                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="POSITIVE_EQUITYLabel"  Text="ส่วนของผู้ถือหุ้นไม่ติดลบ" template="1234"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="POSITIVE_EQUITYDropDownList" runat="server" template="1234">
                            </asp:DropDownList>
                        </td>

                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="DSS_OPERATE_STATUSlabel" Text="สถานะการดำเนินงาน DSS" template="1234"> </asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="DSS_OPERATE_STATUSDropDownList" runat="server" template="1234"> </asp:DropDownList>
                        </td>

                    </tr>

                    <tr class="trTemplate3">
                        <td>
                            <asp:Label ID="CHEQUE_RETURN_6MONTHLabel" runat="server" Text="เช็คคืนในรอบ 6 เดือน (ฉบับ)" template="56"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="CHEQUE_RETURN_6MONTHTextBox" runat="server" Width="50px" MaxLength="2" template="56"
                                Height="22px"></asp:TextBox>
                        </td>

                    </tr>
                    <tr class="trTemplate3">
                        <td>
                            <asp:Label ID="TRADING_CHEQUELabel" runat="server"  template="56"  Text="เช็คการค้าคืน (%ของเงินเข้ารายเดือน)" ></asp:Label>  
                        </td>
                        <td>
                            <asp:TextBox ID="TRADING_CHEQUE_RETURN_VAL_6MONTHTextBox" runat="server" Width="50"  MaxLength="12" template="56"></asp:TextBox>
                        </td>

                    </tr>
                    <tr class="trTemplate3">
                        <td>
                            <asp:Label ID="OD_SWINGLabel" runat="server" Text="OD SWING (%)" template="56"></asp:Label>
                           
                        </td>
                        <td>
                            <asp:TextBox ID="OD_SWING_PERCENTTextBox" runat="server" Width="50" MaxLength="3" template="56"></asp:TextBox>
                            </td>

                    </tr>
                    <tr class="trTemplate3">
                        <td>
                            <asp:Label ID="OD_UTILIZATION_PERCENTLabel" runat="server" Text=" OD Utilization %" template="56"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="OD_UTILIZATION_PERCENTTextBox" runat="server" Width="50" MaxLength="3" template="56"></asp:TextBox>
                            </td>

                    </tr>
                    <tr class="trTemplate3">
                        <td><asp:Label ID="OD_OVERLabel" runat="server" Text="จำนวนครั้งที่เกินวงเงิน OD (ครั้ง)" template="56"></asp:Label>
                         
                        </td>
                        <td>
                            <asp:TextBox ID="OD_OVER_NUMBERTextBox" runat="server" Width="50" MaxLength="2" template="56"></asp:TextBox>
                            </td>

                    </tr>
                    <tr class="trTemplate3">
                        <td>
                            <asp:Label runat="server" ID="FIXED_ASSETlabel"  Text="มูลค่าทรัพย์สินถาวรไม่รวมที่ดิน (บาท)" template=""></asp:Label>
                         
                        </td>
                        <td>
                            <asp:TextBox ID="FIXED_ASSET_NO_LANDTextBox" runat="server" Width="100px" MaxLength="12" template=""
                                Height="22px" ></asp:TextBox>
                        </td>

                    </tr>
                </table>
            </div>
            <div id="tabs2" runat="server">
                <table>
                    <tr>
                        <td>
                            <%--    <strong><span class="style6">ข้อมูลวงเงิน 3X และ วงเงินที่มี บสย ค้ำประกั้น </span>
                            </strong>
                            <br />

                            1) ระบุสินเชื่อวงเงินจากนั้น เลือกเพิ่มสินเชื่อ<br />
                            2) กรณีต้องการลบเลือกเครื่องหมายกากบาท<br />
                            &nbsp;&nbsp;&nbsp; หน้าข้อมูล ** ลบทันที **--%>
                        </td>
                        <td colspan="4">
                            <table>
                                <tr>
                                    <td class="style5">
                                        &nbsp;
                                    </td>
                                    <td class="style7">
                                        <asp:Label runat="server" ID="label5" Text="สินเชื่อ"></asp:Label>
                                    </td>
                                    <td class="style7">
                                        <asp:Label runat="server" ID="label6" Text=" วงเงิน(บาท)"></asp:Label>
                                    </td>
                                    <td class="style7">
                                        <asp:Label runat="server" ID="label7" Text=" บสย ค้ำ(บาท)"></asp:Label>
                                    </td>
                                    <td class="style7">
                                        <asp:Label runat="server" ID="label8"  Text=" วันที่ใช้วงเงิน"></asp:Label>
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
                                        <asp:DropDownList ID="DebtDropDownList" runat="server" >
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="ValueTextBox" runat="server" MaxLength="10" Width="100" ></asp:TextBox>
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
                                GridLines="Vertical" >
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
            <div id="tabs3" runat="server">
                <table>
                    <tr class="trTemplate3">
                        <td class="style1">
                            <asp:Label runat="server" ID="label9" Visible="false" Text=" ขาดทุนในงบการเงินส่งสรรพากร"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="PROFIT_LAST_2YEARSDropDownList" runat="server" Visible="false">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:Label runat="server" ID="label10" Visible="false" Text="  งบการเิงินปีล่าสุดไม่ขาดทุนอย่างมีนัยสำคัญ"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="INSIGNIFICANT_LOSTDropDownList" runat="server" Visible="false">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr class="trTemplate3">
                        <td class="style1">
                            <asp:Label runat="server" ID="label11" Visible="false" Text=" NET Profit (งบราชการปีล่าสุด)"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="NET_PROFITDropDownList" Visible="false" runat="server">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:Label runat="server" ID="label12" Visible="false" Text="    NET Worth (งบราชการปีล่าสุด)"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="NET_WORTHDropDownList" Visible="false" runat="server">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr class="trTemplate3">
                        <td class="style1">
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr class="trTemplate3">
                        <td class="style1">
                            วันที่ตรวจสอบ Credit Checking(dd/mm/yyyy) พ.ศ.
                        </td>
                        <td>
                            <asp:TextBox ID="CHECK_NCB_DATETextBox" runat="server" ViewStateMode="Enabled" Width="100"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="CalendarExtenderCHECK_NCB_DATE" runat="server"
                                TargetControlID="CHECK_NCB_DATETextBox" PopupPosition="Right" />
                            <img id="img3" runat="server" alt="clear date" onclick="clearDate('CHECK_NCB_DATETextBox')"
                                src="images/close_button.gif" />
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr class="trTemplate3">
                        <td class="style1">
                            วันที่เิิริ่มมีข้อมูลใน Credit Checking(dd/mm/yyyy) พ.ศ.
                        </td>
                        <td>
                            <asp:TextBox ID="BEGIN_NCB_DATETextBox" runat="server" ViewStateMode="Enabled" Width="100"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender4" runat="server" TargetControlID="BEGIN_NCB_DATETextBox"
                                PopupPosition="Right" />
                            <img id="img5" runat="server" alt="clear date" onclick="clearDate('BEGIN_NCB_DATETextBox')"
                                src="images/close_button.gif" />
                        </td>
                        <td>
                            จำนวนครั้งในการตรวจสอบ Credit Checking ผู้กู้ในรอบ 6 เดือน
                        </td>
                        <td>
                            <asp:TextBox ID="CHECK_NCB_6MONTHTextBox" runat="server" Width="50px" MaxLength="2"
                                Height="22px"></asp:TextBox>
                            ครั้ง
                        </td>
                    </tr>
                    <tr class="trTemplate3">
                        <td class="style1">
                            <asp:Label runat="server" ID="label13" Visible="false" Text=" Credit Checking"></asp:Label>
                        </td>
                        <td colspan="3">
                            <asp:DropDownList ID="NCBDropDownList" runat="server" Visible="false">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr class="trTemplate3">
                        <td class="style1">
                            <asp:Label runat="server" ID="label14" Visible="false" Text="  Credit Checking Code"></asp:Label>
                        </td>
                        <td colspan="3">
                            <asp:DropDownList ID="NCBCodeDropDownList" runat="server" Visible="false">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr class="trTemplate3">
                        <td class="style1">
                            &nbsp;
                        </td>
                        <td colspan="3">
                                 <asp:Panel ID="DPDT3Panel" runat="server">
                                Credit Checking Record
                                <table id="DPDTable">
                                    <tr>
                                        <td>
                                        </td>
                                        <th colspan="4" class="ui-widget-header">
                                            ประวัตการค้างชำระ
                                        </th>
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
                                        <td class="style2">
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
                                        <td class="style3">
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
                                        <td class="style3">
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
                                        <td class="style3">
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
                            </asp:Panel>
                                 <asp:Panel ID="DPDT1Panel" runat="server">
                                    <table id="Table1">
                                    <tr>
                                        <td>
                                        </td>
                                        <caption>
                                            .
                                            <th class="ui-widget-header" colspan="5">
                                                ประวัตการค้างชำระ
                                            </th>
                                        </caption>
                                    </tr>
                                    <tr>
                                        <td class="ui-widget-header">
                                            เดือนที่
                                        </td>
                                        <td class="ui-widget-header">
                                            0 - 30 วัน
                                        </td>
                                        <td class="ui-widget-header">
                                            31 - 60 วัน
                                        </td>
                                        <td class="ui-widget-header">
                                            61-90 วัน
                                        </td>
                                        <td class="ui-widget-header">
                                            91-120 วัน
                                        </td>
                                        <td class="style4">
                                            &gt;=121 วัน
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="ui-widget-header">
                                            1-12
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DPD_MORE_0_30_MONTH_1_12DropDownList" runat="server">
                                                <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                                <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                                <asp:ListItem Text=">4" Value="5"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DPD_MORE_31_60_MONTH_1_12DropDownList" runat="server">
                                                <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                                   <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                                <asp:ListItem Text=">4" Value="5"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DPD_MORE_61_90_MONTH_1_12DropDownList" runat="server">
                                                <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                                  <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                                <asp:ListItem Text=">4" Value="5"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DPD_MORE_91_120_MONTH_1_12DropDownList" runat="server">
                                                <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                                   <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                                <asp:ListItem Text=">4" Value="5"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td class="style5">
                                            <asp:DropDownList ID="DPD_MORE_120_MONTH_1_12DropDownList" runat="server">
                                                <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                                  <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                                <asp:ListItem Text=">4" Value="5"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="ui-widget-header">
                                            &gt;12-24
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DPD_MORE_0_30_MONTH_12_24DropDownList" runat="server">
                                                <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                                   <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                                <asp:ListItem Text=">4" Value="5"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DPD_MORE_31_60_MONTH_12_24DropDownList" runat="server">
                                                <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                                 <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                                <asp:ListItem Text=">4" Value="5"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DPD_MORE_61_90_MONTH_12_24DropDownList" runat="server">
                                                <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                                  <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                                <asp:ListItem Text=">4" Value="5"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DPD_MORE_91_120_MONTH_12_24DropDownList" runat="server">
                                                <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                                <asp:ListItem Text=">4" Value="5"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td class="style5">
                                            <asp:DropDownList ID="DPD_MORE_120_MONTH_12_24DropDownList" runat="server">
                                                <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                                  <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                                <asp:ListItem Text=">4" Value="5"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                                </asp:Panel>
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
                Width="200px" Enabled="false" />
        </div>
    </div>
    </form>
</body>
</html>
