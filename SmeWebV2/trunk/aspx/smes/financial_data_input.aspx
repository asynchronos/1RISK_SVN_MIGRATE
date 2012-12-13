<%@ Page Language="VB" AutoEventWireup="false" CodeFile="financial_data_input.aspx.vb"
    MaintainScrollPositionOnPostback="true" EnableEventValidation="true" Inherits="aspx_smes_FINANCIAL_DATA" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<head runat="server">
    <title></title>
    <style type="text/css">
        body
        {
            font-size: 12px;
            font-family: arial;
            background-image: url("images/gradient2.png");
            background-repeat: repeat-x;
            padding-left: 5px;
        }
        table
        {
            font-size: 12px;
        }
        .yellowBG
        {
            background: #ffffa0;
        }
        .redBG
        {
            background: #ff2020;
        }
        .greenBG
        {
            background: #6EEEC3;
        }
        
        .purpleBG
        {
            background: #C2B6EC;
        }
        #tableBusinessType
        {
            width: 600px;
        }
        #tabs
        {
            width: 100%;
        }
        #tabs input
        {
            text-align: right;
        }
        
        #tab1, #tab2, #tab3, #tab4, #tab5, #tab6
        {
            width: 800px;
            float: left;
        }
        
        #tab1 > input
        {
        }
        
        .orangeHead
        {
            background-color: Orange;
        }
        .ui-state-error
        {
            padding: .3em;
        }
        .msg
        {
            padding: .3em;
        }
        .inputStyle
        {
            border-style: solid;
            border-width: 1px 1px 1px 1px;
            border-color: #FF4422;
        }
        #divRef
        {
            position: absolute;
            top: 0;
            right: 0;
        }
        input[type=submit]
        {
            font-size: 12px;
        }
        .style5
        {
            text-decoration: underline;
        }
    </style>
    <script src="js/jquery-1.7.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui-1.8.18/js/jquery-ui-1.8.18.custom.min.js" type="text/javascript"></script>
    <script src="js/jquery.cookie.js" type="text/javascript"></script>
    <%--    <link href="js/jquery-ui-1.8.18/css/redmond/jquery-ui-1.8.18.custom.css" rel="stylesheet"    type="text/css" />--%>
    <%--    <link href="js/jquery-ui-1.8.18/css/sunny/jquery-ui-1.8.18.custom.css" rel="stylesheet"    type="text/css" />--%>
    <link href="js/jquery-ui-1.8.18/css/ui-lightness/jquery-ui-1.8.18.custom.css" rel="stylesheet"
        type="text/css" />
    <script src="js/autoNumeric.js" type="text/javascript"></script>
    <script src="js/3xCalfunction.js?n=1" type="text/javascript"></script>
    <script type="text/javascript">
        function sizeFrame() {
            var heightDiv = $(document).height();
            $("#mainFrame", parent.document).height(1400);
        }

        $(document).ready(function () {


            changeUser();

            // end ซ่อน business
            sizeFrame()  // resize เว็บที่เปิดให้มีขนาดเท่ากับหน้านี้



        });           // end document ready

     
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
        function changeMenu(SMES_ID) {
            top.frames['menuFrame'].location = "financial_menu.aspx?SMES_ID=" + SMES_ID;
        }
        function changePage(SMES_ID, SMES_TYPE) {
            //  top.frames['mainFrame'].location = "financial_data.aspx?insertComplete=true&SMES_ID=" + SMES_ID + "&SMES_TYPE=" + SMES_TYPE;
        }
        function changeUser() {
            var userName = window.parent.document.getElementById("spanUserName").innerText;
            $("#USERTextBox").val(userName);
        }

    </script>
    <script type="text/javascript">
        var changeValue = false; // ตัวแปรสำหรับเช็คว่ามีการเปลี่ยนแปลงค่าใน input หรือไม่ ถ้ามีการเปลี่ยนแปลงให้ แสดง message ด้วย

        $(document).ready(function () {
            //alert('ready');
            $("input[type=submit]").button();

            $("#modalFrame").dialog({
                height: 600,
                width: 800,
                title: 'กรุณาเลือก Business',
                position: [100, 50],
                modal: true,
                autoOpen: false
            });

            $(window).bind('beforeunload', function () {

                if (changeValue == true) {
                    // setTimeout(userDidNotLeave, 10);
                    return "คุณได้เปลี่ยนแปลงข้อมูลในหน้านี้  \n ต้องการออกจากหน้านี้หรือไม่";
                }
            });

            var BusinessTypeID2TextBox = $("#BusinessTypeID2TextBox");
            var BusinessTypeID3TextBox = $("#BusinessTypeID3TextBox");
            var SALESTextBox = $("#SALESTextBox");
            var SALES2TextBox = $("#SALES2TextBox");
            var SALES3TextBox = $("#SALES3TextBox");
            var CREDIT_SALETextBox = $("#CREDIT_SALETextBox");
            var CREDIT_SALE2TextBox = $("#CREDIT_SALE2TextBox");
            var CREDIT_SALE3TextBox = $("#CREDIT_SALE3TextBox");
            var CREDIT_TERMTextBox = $("#CREDIT_TERMTextBox");
            var CREDIT_TERM2TextBox = $("#CREDIT_TERM2TextBox");
            var CREDIT_TERM3TextBox = $("#CREDIT_TERM3TextBox");
            var PURCHASETextBox = $("#PURCHASETextBox");
            var PURCHASE2TextBox = $("#PURCHASE2TextBox");
            var PURCHASE3TextBox = $("#PURCHASE3TextBox");
            var CREDIT_PURCHASETextBox = $("#CREDIT_PURCHASETextBox");
            var CREDIT_PURCHASE2TextBox = $("#CREDIT_PURCHASE2TextBox");
            var CREDIT_PURCHASE3TextBox = $("#CREDIT_PURCHASE3TextBox");
            var TERM_PURCHASETextBox = $("#TERM_PURCHASETextBox");
            var TERM_PURCHASE2TextBox = $("#TERM_PURCHASE2TextBox");
            var TERM_PURCHASE3TextBox = $("#TERM_PURCHASE3TextBox");
            var DefaultMarginTextBox = $("#DefaultMarginTextBox");
            var DefaultMargin2TextBox = $("#DefaultMargin2TextBox");
            var DefaultMargin3TextBox = $("#DefaultMargin3TextBox");
            var GROSS_PROFITTextBox = $("#GROSS_PROFITTextBox");
            var GROSS_PROFIT2TextBox = $("#GROSS_PROFIT2TextBox");
            var GROSS_PROFIT3TextBox = $("#GROSS_PROFIT3TextBox");

            var INVENTORY_INTERVIEWTextBox = $("#INVENTORY_INTERVIEWTextBox");
            var INVENTORY_VISITTextBox = $("#INVENTORY_VISITTextBox");
            var ACCOUNT_RECEIVABLETextBox = $("#ACCOUNT_RECEIVABLETextBox");
            var CURRENT_ASSET_OTHERTextBox = $("#CURRENT_ASSET_OTHERTextBox");
            var MACHINERY_EQUIPMENTTextBox = $("#MACHINERY_EQUIPMENTTextBox");
            var CORE_ASSETSTextBox = $("#CORE_ASSETSTextBox");
            var OTHER_FIXED_ASSETS_OTHER_BANKTextBox = $("#OTHER_FIXED_ASSETS_OTHER_BANKTextBox");
            var OTHER_FIXED_ASSETSTextBox = $("#OTHER_FIXED_ASSETSTextBox");
            var CASH_BONDTextBox = $("#CASH_BONDTextBox");
            var CALCULATE_RATETextBox = $("#CALCULATE_RATETextBox");
            var ACCOUNT_PAYABLETextBox = $("#ACCOUNT_PAYABLETextBox");
            var CURRENT_LIABILITY_BAYTextBox = $("#CURRENT_LIABILITY_BAYTextBox");
            var CURRENT_LIABILITY_OTHER_BANKTextBox = $("#CURRENT_LIABILITY_OTHER_BANKTextBox");
            var OTHER_CURRENT_LIABILITYTextBox = $("#OTHER_CURRENT_LIABILITYTextBox");
            var LONG_TERM_LIABILITY_BAYTextBox = $("#LONG_TERM_LIABILITY_BAYTextBox");
            var LONG_TERM_LIABILITY_BAY_REPAYMENTTextBox = $("#LONG_TERM_LIABILITY_BAY_REPAYMENTTextBox");
            var LONG_TERM_LIABILITY_OTHER_BANKTextBox = $("#LONG_TERM_LIABILITY_OTHER_BANKTextBox");
            var LONG_TERM_LIABILITY_OTHER_REPAYMENTTextBox = $("#LONG_TERM_LIABILITY_OTHER_REPAYMENTTextBox");
            var LONG_TERM_OTHER_LIABILITYTextBox = $("#LONG_TERM_OTHER_LIABILITYTextBox");
            var LONG_TERM_OTHER_REPAYMENTTextBox = $("#LONG_TERM_OTHER_REPAYMENTTextBox");
            var LOANS_REL_CO_DIRECTORSTextBox = $("#LOANS_REL_CO_DIRECTORSTextBox");
            var FEE_CREDIT_CART_REPAYMENTTextBox = $("#FEE_CREDIT_CART_REPAYMENTTextBox");
            var LG_AVAL_BAYTextBox = $("#LG_AVAL_BAYTextBox");
            var REFINANCE_WORKING_CAPITAL_OTHERTextBox = $("#REFINANCE_WORKING_CAPITAL_OTHERTextBox");
            var REFINANCE_WORKING_LOAN_OTHERTextBox = $("#REFINANCE_WORKING_LOAN_OTHERTextBox");
            var REFINANCE_REPAYMENTTextBox = $("#REFINANCE_REPAYMENTTextBox");
            var CREDIT_LIMIT_BAYTextBox = $("#CREDIT_LIMIT_BAYTextBox");
            var CREDIT_LIMIT_OTHERTextBox = $("#CREDIT_LIMIT_OTHERTextBox");
            var CREDIT_LIMIT_TCGTextBox = $("#CREDIT_LIMIT_TCGTextBox");
            var APPRAISAL_VALUE_ZONE_ATextBox = $("#APPRAISAL_VALUE_ZONE_ATextBox");
            var APPRAISAL_VALUE_ZONE_BTextBox = $("#APPRAISAL_VALUE_ZONE_BTextBox");
            var APPRAISAL_VALUE_ZONE_CTextBox = $("#APPRAISAL_VALUE_ZONE_CTextBox");
            var APPRAISAL_VALUE_ZONE_DTextBox = $("#APPRAISAL_VALUE_ZONE_DTextBox");
            var APPRAISAL_VALUE_ZONE_ETextBox = $("#APPRAISAL_VALUE_ZONE_ETextBox");
            var BOND_DEPOSIT_PLEDGETextBox = $("#BOND_DEPOSIT_PLEDGETextBox");
            var WORKING_CAPITALTextBox = $("#WORKING_CAPITALTextBox ");
            var INTEREST_RATE_PERCENTTextBox = $("#INTEREST_RATE_PERCENTTextBox");
            var INTEREST_RATE_PERCENT_USEDTextBox = $("#INTEREST_RATE_PERCENT_USEDTextBox");
            var LOANTextBox = $("#LOANTextBox");
            var CONTRACT_YEARTextBox = $("#CONTRACT_YEARTextBox");
            var LG_AVALTextBox = $("#LG_AVALTextBox");
            var ASSETS_INCREASE_LOANTextBox = $("#ASSETS_INCREASE_LOANTextBox");
            var BOND_DEPOSIT_PLEDGE_PERSONTextBox = $("#BOND_DEPOSIT_PLEDGE_PERSONTextBox");
            var LTVTextBox = $("#LTVTextBox");
            var TCG_LOANTextBox = $("#TCG_LOANTextBox");
            var TCG_INTEREST_RATE_PERCENT_USEDTextBox = $("#TCG_INTEREST_RATE_PERCENT_USEDTextBox");
            var TCG_CONTRACT_YEARTextBox = $("#TCG_CONTRACT_YEARTextBox");
            var TCG_GUARANTEE_OLDTextBox = $("#TCG_GUARANTEE_OLDTextBox");


            var CASH_BOND_CALTextBox = $("#CASH_BOND_CALTextBox");
            var ACCOUNT_RECEIVABLE_CALTextBox = $("#ACCOUNT_RECEIVABLE_CALTextBox");
            var INVENTORY_CALTextBox = $("#INVENTORY_CALTextBox");
            var TOTAL_CURRENT_ASSETS_CALTextBox = $("#TOTAL_CURRENT_ASSETS_CALTextBox");
            var MACHINERY_EQUIPMENT_CALTextBox = $("#MACHINERY_EQUIPMENT_CALTextBox");
            var PROPERTY_PLANT_BUILDING_CALTextBox = $("#PROPERTY_PLANT_BUILDING_CALTextBox");
            var OTHER_FIXED_ASSETS_OTHER_BANK_CALTextBox = $("#OTHER_FIXED_ASSETS_OTHER_BANK_CALTextBox");
            var OTHER_FIXED_ASSETS_CALTextBox = $("#OTHER_FIXED_ASSETS_CALTextBox");
            var ASSETS_FROM_CREDIT_CALTextBox = $("#ASSETS_FROM_CREDIT_CALTextBox");
            var TOTAL_FIXED_ASSETS_CALTextBox = $("#TOTAL_FIXED_ASSETS_CALTextBox");
            var TOTAL_ASSETS_CALTextBox = $("#TOTAL_ASSETS_CALTextBox");
            var ACCOUNT_PAYABLE_CALTextBox = $("#ACCOUNT_PAYABLE_CALTextBox");
            var CURRENT_LIABILITY_BAY_CALTextBox = $("#CURRENT_LIABILITY_BAY_CALTextBox");
            var OTHER_CURRENT_LIABILITY_CALTextBox = $("#OTHER_CURRENT_LIABILITY_CALTextBox");
            var TOTAL_CURRENT_LIABILITY_CALTextBox = $("#TOTAL_CURRENT_LIABILITY_CALTextBox");
            var LONG_TERM_LIABILITY_BAY_CALTextBox = $("#LONG_TERM_LIABILITY_BAY_CALTextBox");
            var OTHER_LONG_TERM_LIABILITY_CALTextBox = $("#OTHER_LONG_TERM_LIABILITY_CALTextBox");
            var TOTAL_LIABILITY_CALTextBox = $("#TOTAL_LIABILITY_CALTextBox");
            var LOANS_REL_CO_DIRECTORS_CALTextBox = $("#LOANS_REL_CO_DIRECTORS_CALTextBox");
            var EQUITY_CALTextBox = $("#EQUITY_CALTextBox");
            var LIABILITY_EQUITY_CALTextBox = $("#LIABILITY_EQUITY_CALTextBox");


            SALESTextBox.autoNumeric({ aPad: false });
            SALES2TextBox.autoNumeric({ aPad: false });
            SALES3TextBox.autoNumeric({ aPad: false });
            CREDIT_SALETextBox.autoNumeric({ aPad: false });
            CREDIT_SALE2TextBox.autoNumeric({ aPad: false });
            CREDIT_SALE3TextBox.autoNumeric({ aPad: false });
            CREDIT_TERMTextBox.autoNumeric({ aPad: false });
            CREDIT_TERM2TextBox.autoNumeric({ aPad: false });
            CREDIT_TERM3TextBox.autoNumeric({ aPad: false });
            PURCHASETextBox.autoNumeric({ aPad: false });
            PURCHASE2TextBox.autoNumeric({ aPad: false });
            PURCHASE3TextBox.autoNumeric({ aPad: false });
            CREDIT_PURCHASETextBox.autoNumeric({ aPad: false });
            CREDIT_PURCHASE2TextBox.autoNumeric({ aPad: false });
            CREDIT_PURCHASE3TextBox.autoNumeric({ aPad: false });
            TERM_PURCHASETextBox.autoNumeric({ aPad: false });
            TERM_PURCHASE2TextBox.autoNumeric({ aPad: false });
            TERM_PURCHASE3TextBox.autoNumeric({ aPad: false });
            DefaultMarginTextBox.autoNumeric({ aPad: true, vMin: '0.00', vMax: '100.00' });
            DefaultMargin2TextBox.autoNumeric({ aPad: true, vMin: '0.00', vMax: '100.00' });
            DefaultMargin3TextBox.autoNumeric({ aPad: true, vMin: '0.00', vMax: '100.00' });
            GROSS_PROFITTextBox.autoNumeric({ aPad: false });
            GROSS_PROFIT2TextBox.autoNumeric({ aPad: false });
            GROSS_PROFIT3TextBox.autoNumeric({ aPad: false });

            INVENTORY_INTERVIEWTextBox.autoNumeric({ aPad: false });
            INVENTORY_VISITTextBox.autoNumeric({ aPad: false });
            ACCOUNT_RECEIVABLETextBox.autoNumeric({ aPad: false });
            CURRENT_ASSET_OTHERTextBox.autoNumeric({ aPad: false });
            MACHINERY_EQUIPMENTTextBox.autoNumeric({ aPad: false });
            CORE_ASSETSTextBox.autoNumeric({ aPad: false });
            OTHER_FIXED_ASSETS_OTHER_BANKTextBox.autoNumeric({ aPad: false });
            OTHER_FIXED_ASSETSTextBox.autoNumeric({ aPad: false });
            CASH_BONDTextBox.autoNumeric({ aPad: false });
            CALCULATE_RATETextBox.autoNumeric({ aPad: true, vMin: '0.00', vMax: '100.00' });
            ACCOUNT_PAYABLETextBox.autoNumeric({ aPad: false });
            CURRENT_LIABILITY_BAYTextBox.autoNumeric({ aPad: false });
            CURRENT_LIABILITY_OTHER_BANKTextBox.autoNumeric({ aPad: false });
            OTHER_CURRENT_LIABILITYTextBox.autoNumeric({ aPad: false });
            LONG_TERM_LIABILITY_BAYTextBox.autoNumeric({ aPad: false });
            LONG_TERM_LIABILITY_BAY_REPAYMENTTextBox.autoNumeric({ aPad: false });
            LONG_TERM_LIABILITY_OTHER_BANKTextBox.autoNumeric({ aPad: false });
            LONG_TERM_LIABILITY_OTHER_REPAYMENTTextBox.autoNumeric({ aPad: false });
            LONG_TERM_OTHER_LIABILITYTextBox.autoNumeric({ aPad: false });
            LONG_TERM_OTHER_REPAYMENTTextBox.autoNumeric({ aPad: false });
            LOANS_REL_CO_DIRECTORSTextBox.autoNumeric({ aPad: false });
            FEE_CREDIT_CART_REPAYMENTTextBox.autoNumeric({ aPad: false });
            LG_AVAL_BAYTextBox.autoNumeric({ aPad: false });
            REFINANCE_WORKING_CAPITAL_OTHERTextBox.autoNumeric({ aPad: false });
            REFINANCE_WORKING_LOAN_OTHERTextBox.autoNumeric({ aPad: false });
            REFINANCE_REPAYMENTTextBox.autoNumeric({ aPad: false });
            CREDIT_LIMIT_BAYTextBox.autoNumeric({ aPad: false });
            CREDIT_LIMIT_OTHERTextBox.autoNumeric({ aPad: false });
            CREDIT_LIMIT_TCGTextBox.autoNumeric({ aPad: false });
            APPRAISAL_VALUE_ZONE_ATextBox.autoNumeric({ aPad: false });
            APPRAISAL_VALUE_ZONE_BTextBox.autoNumeric({ aPad: false });
            APPRAISAL_VALUE_ZONE_CTextBox.autoNumeric({ aPad: false });
            APPRAISAL_VALUE_ZONE_DTextBox.autoNumeric({ aPad: false });
            APPRAISAL_VALUE_ZONE_ETextBox.autoNumeric({ aPad: false });
            BOND_DEPOSIT_PLEDGETextBox.autoNumeric({ aPad: false });
            WORKING_CAPITALTextBox.autoNumeric({ aPad: false });
            INTEREST_RATE_PERCENTTextBox.autoNumeric({ aPad: true, vMin: '0.00', vMax: '100.00' });
            INTEREST_RATE_PERCENT_USEDTextBox.autoNumeric({ aPad: true, vMin: '0.00', vMax: '100.00' });
            LOANTextBox.autoNumeric({ aPad: false });
            CONTRACT_YEARTextBox.autoNumeric({ aPad: false });
            LG_AVALTextBox.autoNumeric({ aPad: false });
            ASSETS_INCREASE_LOANTextBox.autoNumeric({ aPad: false });
            BOND_DEPOSIT_PLEDGE_PERSONTextBox.autoNumeric({ aPad: false });
            LTVTextBox.autoNumeric({ aPad: true, vMin: '0.00', vMax: '100.00' });
            TCG_LOANTextBox.autoNumeric({ aPad: false });
            TCG_INTEREST_RATE_PERCENT_USEDTextBox.autoNumeric({ aPad: true, vMin: '0.00', vMax: '100.00' });
            TCG_CONTRACT_YEARTextBox.autoNumeric({ aPad: true, vMin: '0.00', vMax: '100.00' });
            TCG_GUARANTEE_OLDTextBox.autoNumeric({ aPad: false });

            CASH_BOND_CALTextBox.autoNumeric({ aPad: false });
            ACCOUNT_RECEIVABLE_CALTextBox.autoNumeric({ aPad: false });
            TOTAL_CURRENT_ASSETS_CALTextBox.autoNumeric({ aPad: false });
            MACHINERY_EQUIPMENT_CALTextBox.autoNumeric({ aPad: false });
            PROPERTY_PLANT_BUILDING_CALTextBox.autoNumeric({ aPad: false });
            OTHER_FIXED_ASSETS_OTHER_BANK_CALTextBox.autoNumeric({ aPad: false });
            OTHER_FIXED_ASSETS_CALTextBox.autoNumeric({ aPad: false });
            ASSETS_FROM_CREDIT_CALTextBox.autoNumeric({ aPad: false });
            TOTAL_FIXED_ASSETS_CALTextBox.autoNumeric({ aPad: false });
            TOTAL_ASSETS_CALTextBox.autoNumeric({ aPad: false });
            ACCOUNT_PAYABLE_CALTextBox.autoNumeric({ aPad: false });
            CURRENT_LIABILITY_BAY_CALTextBox.autoNumeric({ aPad: false });
            OTHER_CURRENT_LIABILITY_CALTextBox.autoNumeric({ aPad: false });
            TOTAL_CURRENT_LIABILITY_CALTextBox.autoNumeric({ aPad: false });
            LONG_TERM_LIABILITY_BAY_CALTextBox.autoNumeric({ aPad: false });
            OTHER_LONG_TERM_LIABILITY_CALTextBox.autoNumeric({ aPad: false });
            TOTAL_LIABILITY_CALTextBox.autoNumeric({ aPad: false });
            LOANS_REL_CO_DIRECTORS_CALTextBox.autoNumeric({ aPad: false });
            EQUITY_CALTextBox.autoNumeric({ aPad: false, vMin: '-9999999999', vMax: '9999999999' });
            LIABILITY_EQUITY_CALTextBox.autoNumeric({ aPad: false });



            $("#tab5 input").focus(function () {
                $(this).blur();
            });

            $("#ClearInputTextBox").hide();

            $("#tabs").tabs({ cookie: { expires: 30} });

            $("#BusinessImageButton2").click(function () {

                var myId = "PopUpIFrame";
                var url = "Industry.aspx";

                // Control ที่ส่งไปให้กับ Page ลูก เพื่อนำข้อมูลกลับมายังหน้าหลัก

                var param = "PopupModal=mpeBehaviorEditProject";
                // Parameter ที่ส่งไปให้กับ Page ลูก เพื่อนำข้อมูลกลับมายังหน้าหลัก 
                //***********************************************************************************************
                param = param + "&ShowAll=" + "False";
                param = param + "&BUSINESS_ID_TABLETextBox=" + "BusinessTypeID2TextBox";
                param = param + "&BUSINESS_NAME_TABLETextBox=" + "BusinessType2TextBox";

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
            $("#BusinessImageButton3").click(function () {

                var myId = "PopUpIFrame";
                var url = "Industry.aspx";

                // Control ที่ส่งไปให้กับ Page ลูก เพื่อนำข้อมูลกลับมายังหน้าหลัก

                var param = "PopupModal=mpeBehaviorEditProject";
                // Parameter ที่ส่งไปให้กับ Page ลูก เพื่อนำข้อมูลกลับมายังหน้าหลัก 
                //***********************************************************************************************
                param = param + "&ShowAll=" + "False";
                param = param + "&BUSINESS_ID_TABLETextBox=" + "BusinessTypeID3TextBox";
                param = param + "&BUSINESS_NAME_TABLETextBox=" + "BusinessType3TextBox";

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

            // set ค่าเริ่มต้น

            obj.setCASH_BOND(parseFloat(CASH_BONDTextBox.autoNumericGet()));
            obj.setBOND_DEPOSIT_PLEDGE_PERSON(parseFloat(BOND_DEPOSIT_PLEDGE_PERSONTextBox.autoNumericGet()));
            obj.setINVENTORY_INTERVIEW(0);
            obj.setINVENTORY_VISIT(0);


            var STMT_EL;
            STMT_EL = $(STMT_EL).add(CASH_BONDTextBox).add(BOND_DEPOSIT_PLEDGE_PERSONTextBox);
            STMT_EL = $(STMT_EL).add(ACCOUNT_RECEIVABLETextBox);
            STMT_EL = $(STMT_EL).add(INVENTORY_INTERVIEWTextBox).add(INVENTORY_VISITTextBox);
            STMT_EL = $(STMT_EL).add(MACHINERY_EQUIPMENTTextBox);
            STMT_EL = $(STMT_EL).add(CORE_ASSETSTextBox);
            STMT_EL = $(STMT_EL).add(OTHER_FIXED_ASSETS_OTHER_BANKTextBox).add(OTHER_FIXED_ASSETSTextBox);
            STMT_EL = $(STMT_EL).add(ASSETS_INCREASE_LOANTextBox);
            STMT_EL = $(STMT_EL).add(ACCOUNT_PAYABLETextBox);
            STMT_EL = $(STMT_EL).add(CURRENT_LIABILITY_BAYTextBox).add(WORKING_CAPITALTextBox);
            STMT_EL = $(STMT_EL).add(TCG_LOANTextBox).add(CURRENT_LIABILITY_OTHER_BANKTextBox).add(OTHER_CURRENT_LIABILITYTextBox).add(REFINANCE_WORKING_CAPITAL_OTHERTextBox)
            STMT_EL = $(STMT_EL).add(LONG_TERM_LIABILITY_BAYTextBox).add(LOANTextBox);
            STMT_EL = $(STMT_EL).add(LONG_TERM_LIABILITY_OTHER_BANKTextBox).add(LONG_TERM_OTHER_LIABILITYTextBox).add(REFINANCE_WORKING_LOAN_OTHERTextBox);
            STMT_EL = $(STMT_EL).add(LOANS_REL_CO_DIRECTORSTextBox);


            // เงินสด พันธบัตร
            STMT_EL.change(function () {
                obj.setCASH_BOND(parseFloat(CASH_BONDTextBox.autoNumericGet()));
                obj.setBOND_DEPOSIT_PLEDGE_PERSON(parseFloat(BOND_DEPOSIT_PLEDGE_PERSONTextBox.autoNumericGet()));
                obj.setACCOUNT_RECEIVABLE(parseFloat(ACCOUNT_RECEIVABLETextBox.autoNumericGet()));
                obj.setINVENTORY_INTERVIEW(parseFloat(INVENTORY_INTERVIEWTextBox.autoNumericGet()));
                obj.setINVENTORY_VISIT(parseFloat(INVENTORY_VISITTextBox.autoNumericGet()));
                obj.setMACHINERY_EQUIPMENT(parseFloat(MACHINERY_EQUIPMENTTextBox.autoNumericGet()));
                obj.setCORE_ASSETS(parseFloat(CORE_ASSETSTextBox.autoNumericGet()));
                obj.setOTHER_FIXED_ASSETS_OTHER_BANK(parseFloat(OTHER_FIXED_ASSETS_OTHER_BANKTextBox.autoNumericGet()));
                obj.setOTHER_FIXED_ASSETS(parseFloat(OTHER_FIXED_ASSETSTextBox.autoNumericGet()));
                obj.setASSETS_INCREASE_LOAN(parseFloat(ASSETS_INCREASE_LOANTextBox.autoNumericGet()));
                obj.setACCOUNT_PAYABLE(parseFloat(ACCOUNT_PAYABLETextBox.autoNumericGet()));
                obj.setCURRENT_LIABILITY_BAY(parseFloat(CURRENT_LIABILITY_BAYTextBox.autoNumericGet()));
                obj.setWORKING_CAPITAL(parseFloat(WORKING_CAPITALTextBox.autoNumericGet()));

                obj.setTCG_LOAN(parseFloat(TCG_LOANTextBox.autoNumericGet()));
                obj.setCURRENT_LIABILITY_OTHER_BANK(parseFloat(CURRENT_LIABILITY_OTHER_BANKTextBox.autoNumericGet()));
                obj.setOTHER_CURRENT_LIABILITY(parseFloat(OTHER_CURRENT_LIABILITYTextBox.autoNumericGet()));
                obj.setREFINANCE_WORKING_CAPITAL_OTHER(parseFloat(REFINANCE_WORKING_CAPITAL_OTHERTextBox.autoNumericGet()));

                obj.setLONG_TERM_LIABILITY_BAY(parseFloat(LONG_TERM_LIABILITY_BAYTextBox.autoNumericGet()));
                obj.setLOAN(parseFloat(LOANTextBox.autoNumericGet()));

                obj.setLONG_TERM_LIABILITY_OTHER_BANK(parseFloat(LONG_TERM_LIABILITY_OTHER_BANKTextBox.autoNumericGet()));
                obj.setLONG_TERM_OTHER_LIABILITY(parseFloat(LONG_TERM_OTHER_LIABILITYTextBox.autoNumericGet()));
                obj.setREFINANCE_WORKING_LOAN_OTHER(parseFloat(REFINANCE_WORKING_LOAN_OTHERTextBox.autoNumericGet()));
                obj.setLOANS_REL_CO_DIRECTORSTextBox(parseFloat(LOANS_REL_CO_DIRECTORSTextBox.autoNumericGet()));


                //                obj.setOTHER_LONG_TERM_LIABILITY(parseFloat(OTHER_LONG_TERM_LIABILITYTextBox.autoNumericGet()));
                //                obj.setTOTAL_LIABILITY(parseFloat(TOTAL_LIABILITYTextBox.autoNumericGet()));
                //                obj.setLOANS_REL_CO_DIRECTORS(parseFloat(LOANS_REL_CO_DIRECTORSTextBox.autoNumericGet()));
                //                obj.setEQUITY(parseFloat(EQUITYTextBox.autoNumericGet()));
                //                obj.setLIABILITY_EQUITY(parseFloat(LIABILITY_EQUITYTextBox.autoNumericGet()));


                CASH_BOND_CALTextBox.autoNumericSet(obj.getCASH_BOND());
                ACCOUNT_RECEIVABLE_CALTextBox.autoNumericSet(obj.getACCOUNT_RECEIVABLE());
                INVENTORY_CALTextBox.autoNumericSet(obj.getINVENTORY());
                TOTAL_CURRENT_ASSETS_CALTextBox.autoNumericSet(obj.getTOTAL_CURRENT_ASSETS());
                MACHINERY_EQUIPMENT_CALTextBox.autoNumericSet(obj.getMACHINERY_EQUIPMENT());
                PROPERTY_PLANT_BUILDING_CALTextBox.autoNumericSet(obj.getPROPERTY_PLANT_BUILDING());
                OTHER_FIXED_ASSETS_CALTextBox.autoNumericSet(obj.getOTHER_FIXED_ASSETS());
                ASSETS_FROM_CREDIT_CALTextBox.autoNumericSet(obj.getASSETS_FROM_CREDIT());
                TOTAL_FIXED_ASSETS_CALTextBox.autoNumericSet(obj.getTOTAL_FIXED_ASSETS());
                TOTAL_ASSETS_CALTextBox.autoNumericSet(obj.getTOTAL_ASSETS());
                ACCOUNT_PAYABLE_CALTextBox.autoNumericSet(obj.getACCOUNT_PAYABLE());
                CURRENT_LIABILITY_BAY_CALTextBox.autoNumericSet(obj.getCURRENT_LIABILITY_BAY());
                OTHER_CURRENT_LIABILITY_CALTextBox.autoNumericSet(obj.getOTHER_CURRENT_LIABILITY());
                TOTAL_CURRENT_LIABILITY_CALTextBox.autoNumericSet(obj.getTOTAL_CURRENT_LIABILITY());
                LONG_TERM_LIABILITY_BAY_CALTextBox.autoNumericSet(obj.getLONG_TERM_LIABILITY_BAY());
                OTHER_LONG_TERM_LIABILITY_CALTextBox.autoNumericSet(obj.getOTHER_LONG_TERM_LIABILITY());
                TOTAL_LIABILITY_CALTextBox.autoNumericSet(obj.getTOTAL_LIABILITY());
                LOANS_REL_CO_DIRECTORS_CALTextBox.autoNumericSet(obj.getLOANS_REL_CO_DIRECTORS());
                EQUITY_CALTextBox.autoNumericSet(obj.getEQUITY());
                LIABILITY_EQUITY_CALTextBox.autoNumericSet(obj.getLIABILITY_EQUITY());

            });


            var read_el;
            read_el = $("#DefaultMarginTextBox").add("#DefaultMargin2TextBox").add("#DefaultMargin3TextBox");
            $(read_el).focus(function () {
                $(this).blur();

            }).css("background-color", "#cccccc"); ;




        });                                       // document.ready

        var obj = new FNSTMT();


        function updateTips(t) {
            tips.text(t)
			  .addClass("ui-state-error");

            //        setTimeout(function () {
            //            tips.removeClass("ui-state-highlight", 1500);
            //        }, 500);
        }
        function showErrorDialog(t) {
            $("#dialog").dialog({
                autoOpen: true,
                position: [350, 940],
                modal: "true",
                buttons: {
                    Ok: function () {
                        $(this).dialog("close");
                    }
                }
            });
            $("#dialog .msg").text(t).addClass("ui-state-error");
            $("#dialog").dialog("option", "title", 'Please input complete data.');

        }
        function showDialog(t) {
            // ddd
            $("#dialog .msg").text(t).addClass("ui-state-highlight");
            $("#dialog").dialog({
                autoOpen: true,
                position: [350, 440],
                modal: "true",
                title: "Complete",
                buttons: {
                    Ok: function () {
                        $(this).dialog("close");
                    }
                }
            });
        }

        function checkLength(o, n, min, max) {
            if (o.val().length > max || o.val().length < min) {
                o.addClass("ui-state-error");
                updateTips("Length of " + n + " must be between " +
					min + " and " + max + ".");
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


            if (bValid) {
                return true;
            } else {
                return false;
            }

        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="dialog" title="">
        <p class="msg">
        </p>
    </div>
    <div id="header">
        <h3>
            <asp:Label Text="" ID="labelHead" runat="server" Style="font-weight: 700; color: #0000FF"></asp:Label>
            &nbsp;<asp:Button ID="ImportRMButton" runat="server" Text="นำเข้าข้อมูล RM Financial" />
            <asp:TextBox ID="ClearInputTextBox" runat="server"></asp:TextBox>
        </h3>
    </div>
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptLocalization="true"
        EnableScriptGlobalization="true" EnablePageMethods="true">
    </asp:ScriptManager>
    <div id="divRef">
        SMES_DATA_ID:<asp:TextBox ID="SMES_DATA_IDTextBox" runat="server" MaxLength="10"
            Width="30" />
        &nbsp;SMES_ID:<asp:TextBox ID="SMES_IDTextBox" runat="server" MaxLength="10" Width="30" />
        &nbsp;SMES_TYPE:
        <asp:TextBox ID="SMES_TYPETextBox" runat="server" MaxLength="10" Width="30" />
        &nbsp; user:<asp:TextBox ID="USERTextBox" runat="server" MaxLength="10" Width="30"></asp:TextBox>
    </div>
    <div id="divTable">
    </div>
    <div id="main">
        <div id="tabs">
            <ul>
                <li><a href="#tab1">ข้อมูลธุรกิจ</a></li>
                <li><a href="#tab2">ข้อมูลงบทดลอง</a></li>
                <li><a href="#tab3">วงเงินเดิมและหลักประกัน</a></li>
                <li><a href="#tab4">วงเงินสินเชื่ออนุมัติครั้งนี้</a></li>
                <li><a href="#tab5">งบการเงิน (คำนวณจากระบบ)</a></li>
                <li><a href="#tab6">Ratio (คำนวณจากระบบ)</a></li>
            </ul>
            <div id="tab1">
                <table id="tableBusinessType">
                    <tr>
                        <td style="width: 25%">
                            <span class="ui-state-highlight"><strong>ข้อมูลธุรกิจ</strong></span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ธุรกิจหลัก
                        </td>
                        <td>
                            <asp:TextBox ID="BusinessTypeID1TextBox" runat="server" Width="60" />
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="BusinessType1TextBox" runat="server" Width="300" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ธุรกิจรอง1
                        </td>
                        <td>
                            <asp:TextBox ID="BusinessTypeID2TextBox" runat="server" Width="60" />
                            <asp:Image ID="BusinessImageButton2" runat="server" ImageUrl="~/aspx/smes/images/Update.gif"
                                Style="height: 16px" />
                            <asp:TextBox ID="BusinessType2TextBox" runat="server" Width="300" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ธุรกิจรอง2
                        </td>
                        <td>
                            <asp:TextBox ID="BusinessTypeID3TextBox" runat="server" Width="60" />
                            <asp:Image ID="BusinessImageButton3" runat="server" ImageUrl="~/aspx/smes/images/Update.gif"
                                Style="height: 16px" />
                            <asp:TextBox ID="BusinessType3TextBox" runat="server" Width="300" />
                        </td>
                    </tr>
                </table>
                <table id="tableSale">
                    <tr>
                        <td>
                            <span class="style5">ยอดขายเฉลี่ยต่อเดือน</span>
                        </td>
                        <td>
                            ธุรกิจหลัก
                        </td>
                        <td>
                            ธุรกิจรอง1
                        </td>
                        <td>
                            ธุรกิจรอง2
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            -ยอดขาย
                        </td>
                        <td>
                            <asp:TextBox ID="SALESTextBox" ToolTip="D8: ยอดขาย" CELL="D8" runat="server" Width="85px" />
                        </td>
                        <td>
                            <asp:TextBox ID="SALES2TextBox" runat="server" Width="85px" />
                        </td>
                        <td>
                            <asp:TextBox ID="SALES3TextBox" runat="server" Width="85px" />
                        </td>
                        <td>
                            บาท/เดือน
                        </td>
                    </tr>
                    <tr>
                        <td>
                            -ขายเชื่อ
                        </td>
                        <td>
                            <asp:TextBox ID="CREDIT_SALETextBox" ToolTip="D9: ขายเชื่อ" CELL="D9" runat="server"
                                Width="85px" Text='<%# Bind("CREDIT_SALE") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="CREDIT_SALE2TextBox" runat="server" Width="85px" Text='<%# Bind("CREDIT_SALE") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="CREDIT_SALE3TextBox" runat="server" Width="85px" Text='<%# Bind("CREDIT_SALE") %>' />
                        </td>
                        <td>
                            ของยอดขาย
                        </td>
                    </tr>
                    <tr>
                        <td>
                            -ระยะเวลาให้เครดิต
                        </td>
                        <td>
                            <asp:TextBox ID="CREDIT_TERMTextBox" runat="server" class="auto" ToolTip="D10: ระยะเวลาให้เครดิต"
                                Width="85px" CELL="D10" Text='<%# Bind("CREDIT_TERM") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="CREDIT_TERM2TextBox" runat="server" Width="85px" Text='<%# Bind("CREDIT_TERM") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="CREDIT_TERM3TextBox" runat="server" Width="85px" Text='<%# Bind("CREDIT_TERM") %>' />
                        </td>
                        <td>
                            วัน
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td class="style5">
                            ยอดซื้อเฉลี่ยต่อเดือนน
                        </td>
                        <td>
                            ธุรกิจหลัก
                        </td>
                        <td>
                            ธุรกิจรอง1
                        </td>
                        <td>
                            ธุรกิจรอง2
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            -ยอดซื้อ
                        </td>
                        <td>
                            <asp:TextBox ID="PURCHASETextBox" ToolTip="D13: ยอดซื้อ" CELL="D13" runat="server"
                                Width="85px" />
                        </td>
                        <td>
                            <asp:TextBox ID="PURCHASE2TextBox" runat="server" Width="85px" />
                        </td>
                        <td>
                            <asp:TextBox ID="PURCHASE3TextBox" runat="server" Width="85px" />
                        </td>
                        <td>
                            บาท/เดือน
                        </td>
                    </tr>
                    <tr>
                        <td>
                            -ซื้อเชื่อ
                        </td>
                        <td>
                            <asp:TextBox ID="CREDIT_PURCHASETextBox" ToolTip="D14: ซื้อเชื่อ" CELL="D14" runat="server"
                                Width="85px" />
                        </td>
                        <td>
                            <asp:TextBox ID="CREDIT_PURCHASE2TextBox" runat="server" Width="85px" />
                        </td>
                        <td>
                            <asp:TextBox ID="CREDIT_PURCHASE3TextBox" runat="server" Width="85px" />
                        </td>
                        <td>
                            ของยอดขาย
                        </td>
                    </tr>
                    <tr>
                        <td>
                            -ระยะเวลาได้เครดิต
                        </td>
                        <td>
                            <asp:TextBox ID="TERM_PURCHASETextBox" ToolTip="D15: ระยะเวลาได้เครดิต" CELL="D15"
                                Width="85px" runat="server" />
                        </td>
                        <td>
                            <asp:TextBox ID="TERM_PURCHASE2TextBox" Width="85px" runat="server" />
                        </td>
                        <td>
                            <asp:TextBox ID="TERM_PURCHASE3TextBox" Width="85px" runat="server" />
                        </td>
                        <td>
                            วัน
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Default Margin
                        </td>
                        <td>
                            <asp:TextBox ID="DefaultMarginTextBox" Width="85px" runat="server" />
                        </td>
                        <td>
                            <asp:TextBox ID="DefaultMargin2TextBox" Width="85px" runat="server" />
                        </td>
                        <td>
                            <asp:TextBox ID="DefaultMargin3TextBox" Width="85px" runat="server" />
                        </td>
                        <td>
                            %
                        </td>
                    </tr>
                    <tr>
                        <td>
                            กำไรจากการดำเนินงาน
                            <br />
                            ตามที่ลูกค้าแจ้ง
                        </td>
                        <td>
                            <asp:TextBox ID="GROSS_PROFITTextBox" ToolTip="D17: กำไรจากการดำเนินงาน" CELL="D17"
                                Width="85px" runat="server" Text='<%# Bind("GROSS_PROFIT") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="GROSS_PROFIT2TextBox" Width="85px" runat="server" />
                        </td>
                        <td>
                            <asp:TextBox ID="GROSS_PROFIT3TextBox" Width="85px" runat="server" />
                        </td>
                        <td>
                            %ของยอดขาย
                        </td>
                    </tr>
                </table>
            </div>
            <div id="tab2">
                <div style="float: left">
                    <table>
                        <tr>
                            <td class="style6">
                                ประเภทงบการเงิน
                            </td>
                            <td class="style9">
                                <asp:DropDownList runat="server" ID="STMT_TYPEDropDownList">
                                    <asp:ListItem Value="1" Text="PERFORMA"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="AUDIT"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="style37">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="style6">
                                <strong>สินทรัพย์ ของกิจการ </strong>
                            </td>
                            <td class="style9">
                                &nbsp;
                            </td>
                            <td class="style37">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                สต๊อกสินค้าจาการถามลูกค้า
                            </td>
                            <td>
                                <asp:TextBox ID="INVENTORY_INTERVIEWTextBox" ToolTip="D20: สต๊อกสินค้าจาการถามลูกค้า"
                                    Width="85px" CELL="D20" runat="server" Text='<%# Bind("INVENTORY_INTERVIEW") %>' />
                            </td>
                            <td>
                                บาท
                            </td>
                        </tr>
                        <tr>
                            <td class="style6">
                                สต๊อกสินค้าจากการมองเห็น
                            </td>
                            <td class="style9">
                                <asp:TextBox ID="INVENTORY_VISITTextBox" ToolTip="D21: สต๊อกสินค้าจากการมองเห็น"
                                    Width="85px" CELL="D21" runat="server" Text='<%# Bind("INVENTORY_VISIT") %>' />
                            </td>
                            <td class="style37">
                                บาท
                            </td>
                        </tr>
                        <tr>
                            <td class="style6">
                                ลูกหนี้การค้า
                            </td>
                            <td class="style9">
                                <asp:TextBox ID="ACCOUNT_RECEIVABLETextBox" ToolTip="D24: ลูกหนี้การค้า" CELL="D24"
                                    Width="85px" runat="server" Text='<%# Bind("ACCOUNT_RECEIVABLE") %>' />
                            </td>
                            <td class="style37">
                                บาท
                            </td>
                        </tr>
                        <tr>
                            <td>
                                สินทรัพย์หมุนเวียน อื่น ๆ
                            </td>
                            <td>
                                <asp:TextBox ID="CURRENT_ASSET_OTHERTextBox" Width="85px" runat="server" Text='<%# Bind("CURRENT_ASSET_OTHER") %>' />
                            </td>
                            <td>
                                บาท
                            </td>
                        </tr>
                        <tr>
                            <td class="style6">
                                เครื่องจักร / อุปกรณ์สำนักงาน
                            </td>
                            <td class="style9">
                                <asp:TextBox ID="MACHINERY_EQUIPMENTTextBox" ToolTip="D25: เครื่องจักร / อุปกรณ์สำนักงาน"
                                    Width="85px" CELL="D25" runat="server" Text='<%# Bind("MACHINERY_EQUIPMENT") %>' />
                            </td>
                            <td class="style37">
                                บาท
                            </td>
                        </tr>
                        <tr>
                            <td class="style6">
                                อาคาร / ที่ดิน ที่ใช้ประกอบการ
                                <br />
                                รวมทรัพย์จำนองครั้งนี้
                            </td>
                            <td class="style9">
                                <asp:TextBox ID="CORE_ASSETSTextBox" ToolTip="D26: อาคาร / ที่ดิน ที่ใช้ประกอบการ"
                                    Width="85px" CELL="D26" runat="server" />
                            </td>
                            <td class="style37">
                                บา่ท
                            </td>
                        </tr>
                        <tr>
                            <td class="style6">
                                สินทรัพย์ถาวรที่จำนองสถาบันการเงินอื่นๆ
                            </td>
                            <td class="style9">
                                <asp:TextBox ID="OTHER_FIXED_ASSETS_OTHER_BANKTextBox" ToolTip="DX06: สินทรัพย์ถาวรที่จำนองสถาบันการเงินอื่นๆ "
                                    Width="85px" runat="server" />
                            </td>
                            <td class="style37">
                                บาท
                            </td>
                        </tr>
                        <tr>
                            <td class="style6">
                                สินทรัพย์ถาวรอื่น ๆ&nbsp;(ปลอดภาระ)
                            </td>
                            <td class="style9">
                                <asp:TextBox ID="OTHER_FIXED_ASSETSTextBox" ToolTip="D27: สินทรัพย์ถาวรอื่น ๆ" CELL="D27"
                                    Width="85px" runat="server" Text='<%# Bind("OTHER_FIXED_ASSETS") %>' />
                            </td>
                            <td class="style37">
                                บาท
                            </td>
                        </tr>
                        <tr>
                            <td class="style6">
                                เงินสด / ฝาก / พันธบัตร
                            </td>
                            <td class="style9">
                                <asp:TextBox ID="CASH_BONDTextBox" ToolTip="D28: เงินสด / ฝาก / พันธบัตร" CELL="D28"
                                    Width="85px" runat="server" Text='<%# Bind("CASH_BOND") %>' />
                            </td>
                            <td class="style37">
                                บาท
                            </td>
                        </tr>
                    </table>
                </div>
                <div>
                    <table>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="style36">
                                <strong>หนี้สิน ของกิจการ (คำนวณที่เรท)</strong>
                            </td>
                            <td class="style9">
                                <asp:TextBox ID="CALCULATE_RATETextBox" ToolTip="D29: คำนวณที่เรท" CELL="D29" runat="server"
                                    Width="85px" Text='<%# Bind("CALCULATE_RATE") %>' />
                            </td>
                            <td class="style37">
                                %
                            </td>
                        </tr>
                        <tr>
                            <td class="style38">
                                เจ้าหนี้การค้า
                            </td>
                            <td class="style9">
                                <asp:TextBox ID="ACCOUNT_PAYABLETextBox" ToolTip="D30: เจ้าหนี้การค้า" CELL="D30"
                                    Width="85px" runat="server" Text='<%# Bind("ACCOUNT_PAYABLE") %>' />
                            </td>
                            <td class="style37">
                                บาท
                            </td>
                        </tr>
                        <tr>
                            <td class="style38">
                                หนี้สินหมุนเวียนกับ Bay
                            </td>
                            <td class="style9">
                                <asp:TextBox ID="CURRENT_LIABILITY_BAYTextBox" ToolTip="D31: หนี้สินหมุนเวียนกับ Bay"
                                    Width="85px" CELL="D31" runat="server" Text='<%# Bind("CURRENT_LIABILITY_BAY") %>' />
                            </td>
                            <td class="style37">
                                บาท
                            </td>
                        </tr>
                        <tr>
                            <td class="style38">
                                หนี้สินหมุนเวีัยนกับสถาบันการเงินอื่น
                            </td>
                            <td class="style9">
                                <asp:TextBox ID="CURRENT_LIABILITY_OTHER_BANKTextBox" runat="server" ToolTip="D32: หนี้สินหมุนเวีัยนกับสถาบันการเงินอื่น"
                                    Width="85px" CELL="D32" Text='<%# Bind("CURRENT_LIABILITY_OTHER_BANK") %>' />
                            </td>
                            <td class="style37">
                                บาท
                            </td>
                        </tr>
                        <tr>
                            <td class="style38">
                                หนี้สินหมุนเวียนอื่น ๆ
                            </td>
                            <td class="style9">
                                <asp:TextBox ID="OTHER_CURRENT_LIABILITYTextBox" ToolTip="D33: หนี้สินหมุนเวียนอื่น ๆ"
                                    Width="85px" CELL="D33" runat="server" Text='<%# Bind("OTHER_CURRENT_LIABILITY") %>' />
                            </td>
                            <td class="style37">
                                บาท
                            </td>
                        </tr>
                        <tr>
                            <td class="style38">
                                หนี้สินระยะยาวกับ Bay&nbsp;(อายุหนี้เกิน 1 ปี)
                            </td>
                            <td class="style9">
                                <asp:TextBox ID="LONG_TERM_LIABILITY_BAYTextBox" ToolTip="D34: หนี้สินระยะยาวกับ Bay"
                                    Width="85px" CELL="D34" runat="server" Text='<%# Bind("LONG_TERM_LIABILITY_BAY") %>' />
                            </td>
                            <td class="style37">
                                บาท
                            </td>
                        </tr>
                        <tr>
                            <td class="style38">
                                ภาระผ่อนชำระต่อเดือน
                            </td>
                            <td class="style9">
                                <asp:TextBox ID="LONG_TERM_LIABILITY_BAY_REPAYMENTTextBox" runat="server" ToolTip="D35: ภาระผ่อนชำระต่อเดือน"
                                    Width="85px" CELL="D35" Text='<%# Bind("LONG_TERM_LIABILITY_BAY_REPAYMENT") %>' />
                            </td>
                            <td class="style37">
                                บาท/เดือน
                            </td>
                        </tr>
                        <tr>
                            <td class="style38">
                                หนี้สินระยะยาวกับสถาบันการเงินอื่น (เกิน 1 ปี)
                            </td>
                            <td class="style9">
                                <asp:TextBox ID="LONG_TERM_LIABILITY_OTHER_BANKTextBox" runat="server" ToolTip="D36: หนี้สินระยะยาวกับสถาบันการเงินอื่น (เกิน 1 ปี)"
                                    Width="85px" CELL="D36" Text='<%# Bind("LONG_TERM_LIABILITY_OTHER_BANK") %>' />
                            </td>
                            <td class="style37">
                                บาท
                            </td>
                        </tr>
                        <tr>
                            <td class="style38">
                                ภาระผ่อนชำระต่อเดือน
                            </td>
                            <td class="style9">
                                <asp:TextBox ID="LONG_TERM_LIABILITY_OTHER_REPAYMENTTextBox" runat="server" ToolTip="D37: ภาระผ่อนชำระต่อเดือน"
                                    Width="85px" CELL="D37" Text='<%# Bind("LONG_TERM_LIABILITY_OTHER_REPAYMENT") %>' />
                            </td>
                            <td class="style37">
                                บาท/เดือน
                            </td>
                        </tr>
                        <tr>
                            <td class="style38">
                                หนี้สินระยะยาวอื่น ๆ (อายุเกิน 1 ปี)
                            </td>
                            <td class="style9">
                                <asp:TextBox ID="LONG_TERM_OTHER_LIABILITYTextBox" runat="server" ToolTip="D38: หนี้สินระยะยาวอื่น ๆ (อายุเกิน 1 ปี)"
                                    Width="85px" CELL="D38" Text='<%# Bind("LONG_TERM_OTHER_LIABILITY") %>' />
                            </td>
                            <td class="style37">
                                บาท
                            </td>
                        </tr>
                        <tr>
                            <td class="style38">
                                ภาระผ่อนชำระต่อเดือน
                            </td>
                            <td class="style9">
                                <asp:TextBox ID="LONG_TERM_OTHER_REPAYMENTTextBox" runat="server" ToolTip="D39: ภาระผ่อนชำระต่อเดือน"
                                    Width="85px" CELL="D39" Text='<%# Bind("LONG_TERM_OTHER_REPAYMENT") %>' />
                            </td>
                            <td class="style37">
                                บาท/เดือน
                            </td>
                        </tr>
                        <tr>
                            <td class="style38">
                                เงินกู้ยืมกรรมการ
                            </td>
                            <td class="style9">
                                <asp:TextBox ID="LOANS_REL_CO_DIRECTORSTextBox" ToolTip="D40: เงินกู้ยืมกรรมการ"
                                    Width="85px" CELL="D40" runat="server" Text='<%# Bind("LOANS_REL_CO_DIRECTORS") %>' />
                            </td>
                            <td class="style37">
                                บาท
                            </td>
                        </tr>
                        <tr>
                            <td>
                                ภาระผ่อนชำระ ค่าธรรมเนียม ค่าบัตรเครดิต
                            </td>
                            <td>
                                <asp:TextBox ID="FEE_CREDIT_CART_REPAYMENTTextBox" Width="85px" runat="server" />
                            </td>
                            <td>
                                บาท&nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="style38">
                                วงเงิน L/G &amp; Aval Bay (Non Cash)
                            </td>
                            <td class="style9">
                                <asp:TextBox ID="LG_AVAL_BAYTextBox" ToolTip="D41: วงเงิน L/G" CELL="D41" runat="server"
                                    Width="85px" Text='<%# Bind("LG_AVAL_BAY") %>' />
                            </td>
                            <td class="style37">
                                บาท
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div id="tab3">
                <div style="float: left">
                    <table>
                        <tr>
                            <td class="style6">
                                <strong>เฉพาะการขออนุัมัติครั้งนี้มีการ Refinance </strong>
                            </td>
                            <td class="style9">
                                &nbsp;
                            </td>
                            <td class="style37">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="style6">
                                Refinance Working Capital จากสถาบันอื่น
                            </td>
                            <td class="style9">
                                <asp:TextBox ID="REFINANCE_WORKING_CAPITAL_OTHERTextBox" runat="server" Width="85px"
                                    ToolTip="D43: Refinance Working Capital จากสถาบันอื่น" CELL="D43" Text='<%# Bind("REFINANCE_WORKING_CAPITAL_OTHER") %>' />
                            </td>
                            <td class="style37">
                                บาท
                            </td>
                        </tr>
                        <tr>
                            <td class="style6">
                                Refinance Loan จากสถาบันอื่น
                            </td>
                            <td class="style9">
                                <asp:TextBox ID="REFINANCE_WORKING_LOAN_OTHERTextBox" runat="server" Width="85px"
                                    ToolTip="D44: Refinance Loan จากสถาบันอื่น" CELL="D44" Text='<%# Bind("REFINANCE_WORKING_LOAN_OTHER") %>' />
                            </td>
                            <td class="style37">
                                บาท
                            </td>
                        </tr>
                        <tr>
                            <td class="style6">
                                ภาระการผ่อนหนี้ Loan ที่ Refinance
                            </td>
                            <td class="style9">
                                <asp:TextBox ID="REFINANCE_REPAYMENTTextBox" ToolTip="D45: ภาระการผ่อนหนี้ Loan ที่ Refinance"
                                    Width="85px" CELL="D45" runat="server" Text='<%# Bind("REFINANCE_REPAYMENT") %>' />
                            </td>
                            <td class="style37">
                                บาท/เดือน
                            </td>
                        </tr>
                        <tr>
                            <td class="style6">
                                <strong>สรุปวงเงินสินเชื่อ (ปัจจุบัน)</strong>
                            </td>
                            <td class="style9">
                                &nbsp;
                            </td>
                            <td class="style37">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="style6">
                                วงเงินสินเชื่อหมุนเวียนที่ Bay
                            </td>
                            <td class="style9">
                                <asp:TextBox ID="CREDIT_LIMIT_BAYTextBox" Width="85px" runat="server" />
                            </td>
                            <td class="style37">
                                บาท
                            </td>
                        </tr>
                        <tr>
                            <td class="style6">
                                วงเวินสินเชื่อหมุนเวียนที่สถาบันการเงินอื่น ๆ
                            </td>
                            <td class="style9">
                                <asp:TextBox ID="CREDIT_LIMIT_OTHERTextBox" Width="85px" runat="server" />
                            </td>
                            <td class="style37">
                                บาท
                            </td>
                        </tr>
                        <tr>
                            <td class="style6">
                                วงเงินสินเชื่อ บสยค้ำประกันรวม
                            </td>
                            <td class="style9">
                                <asp:TextBox ID="CREDIT_LIMIT_TCGTextBox" Width="85px" runat="server" />
                            </td>
                            <td class="style37">
                                บาท
                            </td>
                        </tr>
                    </table>
                </div>
                <div>
                    <table>
                        <tr>
                            <td class="style35">
                                <strong>หลักประกันรวมทั้งหมด </strong>
                            </td>
                            <td class="style9">
                                &nbsp; <strong>( คำนวณ LTV )</strong>
                            </td>
                            <td class="style37">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="style35">
                                ราคาประเมินหลักทรัพย์ Zone A
                            </td>
                            <td class="style9">
                                <asp:TextBox ID="APPRAISAL_VALUE_ZONE_ATextBox" ToolTip="I39: ราคาประเมินหลักทรัพย์ Zone A"
                                    Width="85px" CELL="I39" runat="server" Text='<%# Bind("APPRAISAL_VALUE_ZONE_A") %>' />
                            </td>
                            <td class="style37">
                                บาท
                            </td>
                        </tr>
                        <tr>
                            <td class="style35">
                                ราคาประเมินหลักทรัพย์ Zone B
                            </td>
                            <td class="style9">
                                <asp:TextBox ID="APPRAISAL_VALUE_ZONE_BTextBox" ToolTip="I40: ราคาประเมินหลักทรัพย์ Zone B"
                                    Width="85px" CELL="I40" runat="server" Text='<%# Bind("APPRAISAL_VALUE_ZONE_B") %>' />
                            </td>
                            <td class="style37">
                                บาท
                            </td>
                        </tr>
                        <tr>
                            <td class="style35">
                                ราคาประเมินหลักทรัพย์ Zone C
                            </td>
                            <td class="style9">
                                <asp:TextBox ID="APPRAISAL_VALUE_ZONE_CTextBox" ToolTip="I41: ราคาประเมินหลักทรัพย์ Zone C"
                                    Width="85px" CELL="I41" runat="server" Text='<%# Bind("APPRAISAL_VALUE_ZONE_C") %>' />
                            </td>
                            <td class="style37">
                                บาท
                            </td>
                        </tr>
                        <tr>
                            <td class="style35">
                                ราคาประเมินหลักทรัพย์ Zone D
                            </td>
                            <td class="style9">
                                <asp:TextBox ID="APPRAISAL_VALUE_ZONE_DTextBox" ToolTip="I42: ราคาประเมินหลักทรัพย์ Zone D"
                                    Width="85px" CELL="I42" runat="server" Text='<%# Bind("APPRAISAL_VALUE_ZONE_D") %>' />
                            </td>
                            <td class="style37">
                                บาท
                            </td>
                        </tr>
                        <tr>
                            <td class="style35">
                                ราคาประเมินหลักทรัพย์ Zone E
                            </td>
                            <td class="style9">
                                <asp:TextBox ID="APPRAISAL_VALUE_ZONE_ETextBox" ToolTip="I43: ราคาประเมินหลักทรัพย์ Zone E"
                                    Width="85px" CELL="I43" runat="server" Text='<%# Bind("APPRAISAL_VALUE_ZONE_E") %>' />
                            </td>
                            <td class="style37">
                                บาท
                            </td>
                        </tr>
                        <tr>
                            <td class="style35">
                                จำนำเงินฝาก &amp; พันธบัตร 100%
                            </td>
                            <td class="style9">
                                <asp:TextBox ID="BOND_DEPOSIT_PLEDGETextBox" ToolTip="I44: จำนำเงินฝาก" CELL="I44"
                                    Width="85px" runat="server" Text='<%# Bind("BOND_DEPOSIT_PLEDGE") %>' />
                            </td>
                            <td class="style37">
                                บาท
                            </td>
                        </tr>
                        <tr>
                            <td class="style35">
                                วงเงิน บสย.ค้ำปรกันครั้งนี้
                            </td>
                            <td class="style9">
                                <asp:TextBox ID="TCG_GUARANTEE_OLDTextBox" Width="85px" runat="server" />
                            </td>
                            <td class="style37">
                                บาท
                            </td>
                        </tr>
                        <tr>
                            <td class="style35">
                                &nbsp;
                            </td>
                            <td class="style9">
                                <asp:TextBox ID="TOTAL_AMOUNT_OF_COLLATERALTextBox" ToolTip="T17 : ราคารวมประเมินหลักทรัพย์"
                                    Width="85px" CELL="T17" runat="server" />
                            </td>
                            <td class="style37">
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div id="tab4">
                <table>
                    <tr>
                        <td colspan="4">
                            <span class="ui-state-highlight"><strong>วงเงินสินเชื่อที่ขออนุมัติครั้งนี้ (RM)</strong>
                            </span>&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp
                        </td>
                    </tr>
                    <tr>
                        <td>
                            WORKING CAPITAL
                        </td>
                        <td class="style27">
                            <asp:TextBox ID="WORKING_CAPITALTextBox" ToolTip="I33: WORKING CAPITAL" CELL="I33"
                                Width="85px" runat="server" Text='<%# Bind("WORKING_CAPITAL") %>' />
                        </td>
                        <td>
                            อัตราดอกเบี้ย
                            <asp:TextBox ID="INTEREST_RATE_PERCENTTextBox" ToolTip="M33: อัตราดอกเบี้ย" CELL="M33"
                                runat="server" Text='<%# Bind("INTEREST_RATE_PERCENT") %>' Width="45px" />
                            %
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            LOAN
                        </td>
                        <td class="style27">
                            <asp:TextBox ID="LOANTextBox" runat="server" ToolTip="I34: LOAN" CELL="I34" Width="85px" />
                        </td>
                        <td>
                            อัตราดอกเบี้ย
                            <asp:TextBox ID="INTEREST_RATE_PERCENT_USEDTextBox" ToolTip="M34: อัตราดอกเบี้ย"
                                CELL="M34" runat="server" Text='<%# Bind("INTEREST_RATE_PERCENT_USED") %>' Width="45px" />
                            %
                        </td>
                        <td class="style29">
                            อายุสัญญา<asp:TextBox ID="CONTRACT_YEARTextBox" runat="server" ToolTip="O34: อายุสัญญา"
                                Width="30" CELL="O34" Text='<%# Bind("CONTRACT_YEAR") %>' />
                            ปี
                        </td>
                    </tr>
                    <tr>
                        <td>
                            LOAN บสย
                        </td>
                        <td>
                            <asp:TextBox ID="TCG_LOANTextBox" runat="server" Width="85px" />
                        </td>
                        <td>
                            อัตราดอกเบี้ย
                            <asp:TextBox ID="TCG_INTEREST_RATE_PERCENT_USEDTextBox" ToolTip="M34: อัตราดอกเบี้ย"
                                CELL="M34" runat="server" Text='<%# Bind("INTEREST_RATE_PERCENT_USED") %>' Width="45px" />
                            %
                        </td>
                        <td>
                            อายุสัญญา<asp:TextBox ID="TCG_CONTRACT_YEARTextBox" runat="server" Width="30" />
                            &nbsp;ปี
                        </td>
                    </tr>
                    <tr>
                        <td>
                            วงเงินL/G&amp;AVAL(Non-cash)
                        </td>
                        <td>
                            <asp:TextBox ID="LG_AVALTextBox" runat="server" ToolTip="I35: วงเงิน" CELL="I35"
                                Width="85px" Text='<%# Bind("LG_AVAL") %>' />
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
                            สินทรัพย์เพิ่มจากการให้สินเชื่อ
                        </td>
                        <td class="style27">
                            <asp:TextBox ID="ASSETS_INCREASE_LOANTextBox" ToolTip="I36:สินทรัพย์เพิ่มจากการให้สินเชื่อ"
                                Width="85px" CELL="I36" runat="server" Text='' />
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
                            เงินฝาก/พันธบัตร บุคคลอื่นจำนำ
                        </td>
                        <td>
                            <asp:TextBox ID="BOND_DEPOSIT_PLEDGE_PERSONTextBox" ToolTip="I37: เงินฝาก / พันธบัตร บุคคลอื่นจำนำ (นำไปคำนวณในงบการเงิน)"
                                Width="85px" CELL="I37" runat="server" Text='<%# Bind("BOND_DEPOSIT_PLEDGE_PERSON") %>'
                                Height="22px" />
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
                            LTV (key in)
                        </td>
                        <td>
                            <asp:TextBox ID="LTVTextBox" Width="85px" runat="server" />%
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
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td class="style31">
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </div>
            <div id="tab5">
                <table style="bgcolor: #FFFFCC">
                    <tr>
                        <td class="style13">
                            <strong class="ui-state-highlight">สมมุติฐานงบการเงิน</strong>
                        </td>
                        <td class="style28">
                            &nbsp;
                        </td>
                        <td class="style33">
                            &nbsp;
                        </td>
                        <td class="style18" colspan="2">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style30">
                            <strong>สินทรัพย์</strong>
                        </td>
                        <td class="style28">
                            &nbsp;
                        </td>
                        <td class="style33">
                            &nbsp;
                        </td>
                        <td class="style18">
                            <strong>หนี้สิน</strong>
                        </td>
                        <td class="style34">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style30">
                            <strong>สินทรัุพย์หมุนเวียน</strong>
                        </td>
                        <td class="style28">
                            &nbsp;
                        </td>
                        <td class="style33">
                            &nbsp;
                        </td>
                        <td class="style29">
                            <strong>หนี้สินหมุนเวียน</strong>
                        </td>
                        <td class="style34">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style30">
                            เงินสด/ฝาก/พันธบัตร
                        </td>
                        <td class="style28">
                            <asp:TextBox ID="CASH_BOND_CALTextBox" ToolTip=" I9:เงินสด/ฝาก/พันธบัตร" CELL="I9"
                                Width="85px" runat="server" Text='<%# Bind("CASH_BOND_CAL") %>' />
                        </td>
                        <td class="style33">
                            &nbsp;
                        </td>
                        <td class="style29">
                            เจ้าหนี้การค้า
                        </td>
                        <td class="style34">
                            <asp:TextBox ID="ACCOUNT_PAYABLE_CALTextBox" ToolTip="N9:เจ้าหนี้การค้า" CELL="N9"
                                Width="85px" runat="server" Text='<%# Bind("ACCOUNT_PAYABLE_CAL") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="style30">
                            ลูกหนี้การค้า
                        </td>
                        <td class="style28">
                            <asp:TextBox ID="ACCOUNT_RECEIVABLE_CALTextBox" ToolTip="I10: ลูกหนี้การค้า" CELL="I10"
                                Width="85px" runat="server" Text='<%# Bind("ACCOUNT_RECEIVABLE_CAL") %>' />
                        </td>
                        <td class="style33">
                            &nbsp;
                        </td>
                        <td class="style29">
                            หนี้สินหมุนเวียน Bay
                        </td>
                        <td class="style34">
                            <asp:TextBox ID="CURRENT_LIABILITY_BAY_CALTextBox" ToolTip="N10:หนี้สินหมุนเวียน Bay"
                                Width="85px" CELL="N10" runat="server" Text='' />
                        </td>
                    </tr>
                    <tr>
                        <td class="style30">
                            สต๊อกสินค้า&nbsp;&nbsp;
                        </td>
                        <td class="style28">
                            <asp:TextBox ID="INVENTORY_CALTextBox" ToolTip="I11: สต๊อกสินค้า" CELL="I11" runat="server"
                                Width="85px" />
                        </td>
                        <td class="style33">
                            &nbsp;
                        </td>
                        <td class="style29">
                            หนี้สินหมุนเวียนอื่น
                        </td>
                        <td class="style34">
                            <asp:TextBox ID="OTHER_CURRENT_LIABILITY_CALTextBox" ToolTip="N11:หนี้สินหมุนเวียนอื่น"
                                Width="85px" CELL="N11" runat="server" Text='<%# Bind("OTHER_CURRENT_LIABILITY_CAL") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="style30">
                            <strong>รวมสินทรัพย์หมุนเวียน</strong>
                        </td>
                        <td class="style28">
                            <asp:TextBox ID="TOTAL_CURRENT_ASSETS_CALTextBox" ToolTip="I13:รวมสินทรัพย์หมุนเวียน"
                                Width="85px" CELL="I13" runat="server" Text='<%# Bind("TOTAL_CURRENT_ASSETS") %>' />
                        </td>
                        <td class="style33">
                            &nbsp;
                        </td>
                        <td class="style29">
                            <strong>รวมหนี้สินหมุนเวียน</strong>
                        </td>
                        <td class="style34">
                            <asp:TextBox ID="TOTAL_CURRENT_LIABILITY_CALTextBox" ToolTip="N13:รวมหนี้สินหมุนเวียน"
                                Width="85px" CELL="N13" runat="server" Text='<%# Bind("TOTAL_CURRENT_LIABILITY") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="style30">
                            <strong>สินทรัพย์ถาวร</strong>
                        </td>
                        <td class="style28">
                            &nbsp;
                        </td>
                        <td class="style33">
                            &nbsp;
                        </td>
                        <td class="style29">
                            <strong>หนี้สินระยะยาว</strong>
                        </td>
                        <td class="style34">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style30">
                            เครื่องจักร/อุปกรณ์
                        </td>
                        <td class="style28">
                            <asp:TextBox ID="MACHINERY_EQUIPMENT_CALTextBox" runat="server" ToolTip="I15:เครื่องจักร/อุปกรณ์"
                                Width="85px" CELL="I15" Text='<%# Bind("MACHINERY_EQUIPMENT_CAL") %>' />
                        </td>
                        <td class="style33">
                            &nbsp;
                        </td>
                        <td class="style29">
                            หนี้สินระยะยาว Bay
                        </td>
                        <td class="style34">
                            <asp:TextBox ID="LONG_TERM_LIABILITY_BAY_CALTextBox" runat="server" CELL="N15" ToolTip="N15:หนี้สินระยะยาว Bay"
                                Width="85px" Text='<%# Bind("LONG_TERM_LIABILITY_BAY_CAL") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="style30">
                            ที่ดิน/อาคาร
                        </td>
                        <td class="style28">
                            <asp:TextBox ID="PROPERTY_PLANT_BUILDING_CALTextBox" ToolTip="I16:ที่ดิน/อาคาร" CELL="I16"
                                Width="85px" runat="server" Text='<%# Bind("PROPERTY_PLANT_BUILDING") %>' />
                        </td>
                        <td class="style33">
                            &nbsp;
                        </td>
                        <td class="style29">
                            หนี้สินระยะยาวอืน ๆ
                        </td>
                        <td class="style34">
                            <asp:TextBox ID="OTHER_LONG_TERM_LIABILITY_CALTextBox" ToolTip=" N16:หนี้สินระยะยาวอืน ๆ"
                                Width="85px" CELL="N16" runat="server" Text='<%# Bind("OTHER_LONG_TERM_LIABILITY") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="style30">
                            สินทรัพย์ถาวรอื่น ๆ
                        </td>
                        <td class="style28">
                            <asp:TextBox ID="OTHER_FIXED_ASSETS_CALTextBox" ToolTip="I17:สินทรัพย์ถาวรอื่น ๆ"
                                Width="85px" CELL="I17" runat="server" Text='<%# Bind("OTHER_FIXED_ASSETS_CAL") %>' />
                        </td>
                        <td class="style33">
                            &nbsp;
                        </td>
                        <td class="style29">
                            <strong>รวมหนี้สิน</strong>
                        </td>
                        <td class="style34">
                            <asp:TextBox ID="TOTAL_LIABILITY_CALTextBox" runat="server" ToolTip="N18:รวมหนี้สิน"
                                Width="85px" CELL="N18" Text='<%# Bind("TOTAL_LIABILITY") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="style30">
                            สินทรัพย์เพิ่มจากสินเชื่อ
                        </td>
                        <td class="style28">
                            <asp:TextBox ID="ASSETS_FROM_CREDIT_CALTextBox" ToolTip="I18:สินทรัพย์เพิ่มจากสินเชื่อ"
                                Width="85px" CELL="I18" runat="server" Text='<%# Bind("ASSETS_FROM_CREDIT") %>' />
                        </td>
                        <td class="style33">
                            &nbsp;
                        </td>
                        <td class="style29">
                            <strong>เงินกู้ยืมกรรมการ (ทุน)</strong>
                        </td>
                        <td class="style34">
                            <asp:TextBox ID="LOANS_REL_CO_DIRECTORS_CALTextBox" runat="server" ToolTip="N20:เงินกู้ยืมกรรมการ"
                                Width="85px" CELL="N20" Text='<%# Bind("LOANS_REL_CO_DIRECTORS_CAL") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="style30">
                            รวมสินทรัพย์ถาวร &nbsp;
                        </td>
                        <td class="style28">
                            <asp:TextBox ID="TOTAL_FIXED_ASSETS_CALTextBox" runat="server" ToolTip="I20:รวมสินทรัพย์ถาวร"
                                Width="85px" CELL="I20" Text='<%# Bind("TOTAL_FIXED_ASSETS") %>' />
                        </td>
                        <td class="style33">
                            &nbsp;
                        </td>
                        <td class="style29">
                            <strong>ทุน</strong>
                        </td>
                        <td class="style34">
                            <asp:TextBox ID="EQUITY_CALTextBox" runat="server" ToolTip="N21:ทุน" CELL="N21" Text=''
                                Width="85px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style30">
                            <strong>รวมสินทรัพย์</strong>
                        </td>
                        <td class="style28">
                            <asp:TextBox ID="TOTAL_ASSETS_CALTextBox" runat="server" ToolTip="I22:รวมสินทรัพย์"
                                Width="85px" CELL="I22" Text='<%# Bind("TOTAL_ASSETS") %>' />
                        </td>
                        <td class="style33">
                            &nbsp;
                        </td>
                        <td class="style29">
                            <strong>รวมหนี้สิน + ทุน</strong>
                        </td>
                        <td class="style34">
                            <asp:TextBox ID="LIABILITY_EQUITY_CALTextBox" runat="server" ToolTip="N22:รวมหนี้สิน + ทุน"
                                Width="85px" CELL="N22" Text='<%# Bind("LIABILITY_EQUITY") %>' />
                        </td>
                    </tr>
                </table>
            </div>
            <div id="tab6">
                ratio อยู่ระหว่างดำเนินการ
            </div>
        </div>
        <div id="divSave">
            <asp:Button ID="BtnInsert" runat="server" Text="Insert/Save Data" OnClientClick="return checkValidAll()"
                class="saveButton" Height="30px" Width="200px" />&nbsp
            <asp:Button ID="BtnUpdate" runat="server" Text="Update Data" OnClientClick="return checkValidAll()"
                class="saveButton" Height="30px" Width="200px" />&nbsp ** บันทึกข้อมูลที่นี่
            **
        </div>
    </div>
    <div id="modalFrame">
        <iframe id="PopUpIFrame" width="100%" height="100%" frameborder="0"></iframe>
    </div>
    </form>
</body>
</html> 