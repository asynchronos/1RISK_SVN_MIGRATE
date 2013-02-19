<%@ Page Language="VB" AutoEventWireup="false" CodeFile="FINANCIAL_DATA.aspx.vb"
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
        
        #divTable
        {
            width: 900px;
        }
        #tab1
        {
            float: left;
            width: 420px;
            background-image: url("images/gradient2.png");
            background-repeat: repeat-x;
        }
        #tab4
        {
            float: left;
            width: 500px;
            background-image: url('images/gradient2.png');
            background-repeat: repeat-x;
        }
        #tab2, #tab3, #tab5, #tab6
        {
            float: left;
            width: 500px;
            background-image: url("images/gradient1.png");
            background-repeat: repeat-x;
        }
        #tab1 > input
        {
            width: 80px;
        }
        #accordion
        {
            float: left;
            width: 600px;
            font-size: small;
            font-family: Arial;
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
        .style3
        {
            width: 107px;
        }
        .style4
        {
            width: 239px;
        }
    </style>
    <script src="js/jquery-1.7.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui-1.8.18/js/jquery-ui-1.8.18.custom.min.js" type="text/javascript"></script>
    <%--    <link href="js/jquery-ui-1.8.18/css/redmond/jquery-ui-1.8.18.custom.css" rel="stylesheet"    type="text/css" />--%>    <%--    <link href="js/jquery-ui-1.8.18/css/sunny/jquery-ui-1.8.18.custom.css" rel="stylesheet"    type="text/css" />--%>
    <link href="js/jquery-ui-1.8.18/css/ui-lightness/jquery-ui-1.8.18.custom.css" rel="stylesheet"
        type="text/css" />
    <script src="js/autoNumeric.js" type="text/javascript"></script>
    <script src="js/SSCalFunction01.js?n=1" type="text/javascript"></script>
    <script type="text/javascript">

        function sizeFrame() {

            var heightDiv = $(document).height();
            $("#mainFrame", parent.document).height(1400);


        }
    </script>
    <script type="text/javascript">
        var obj = new SSProject();

        var C5, C6, D8, D9, D10
        , D13, D14, D15, D16, D17
        , D20, D21, D24, D25, D26, D27, D28, D29, D30, D31, D32, D33, D34, D35, D36, D37, D38, D39, D40, D41
        , D43, D44, D45
        , F10, F15, F21
        , H25
        , I9, I10, I11, I13, I15, I16, I17, I18, I20, I22
        , I25, I26, I27, I28
        , I30, I31, I33, I34, I35, I36, I37
        , I39, I40, I41, I42, I43, I44, T17 ,I45, I46, I47 // หลักประกันรวม
        , J28, J29
        , M25, M27, M33, M34, M35, M36, M37
        , N9, N10, N11, N13, N15, N16, N18, N20, N21, N22
        , N30, N31, N40, N41, N43, N44
        , O27, O28, O34, O35, O37
        , R44 // Temp cal loan max
         , MARGIN_TABLE, DSCR_TABLE, AP_TABLE, AR_TABLE, STOCK_TABLE // ตัวแปรจาก table ที่ไม่มีใน excell
        , LTV_TABLE, WORKING_CAPITAL_TABLE, RATE_TABLE, CONTRACT_TABLE
        , DX06, DX07;
        ;

        var COST_OF_SALESTextBox, COST_OF_SALES_PERCENTTextBox, OPERATING_EXPENSESTextBox, OPERATING_EXPENSES_PERCENTTextBox, TAXTextBox, OTHER_FIXED_ASSETS_OTHER_BANKTextBox, OTHER_FIXED_ASSETS_OTHER_BANK_CALTextBox;


        var CASH_BOND_CAL_EL;  //I9
        var ACCOUNT_RECEIVABLE_CAL_EL;   // I10
        var INVENTORY_EL; //I11
        var TOTAL_CURRENT_ASSETS_EL; // I13
        var MACHINERY_EQUIPMENT_CAL_EL; // I15
        var PROPERTY_PLANT_CAL_BUILDING_EL; //I16
        var OTHER_FIXED_ASSETS_CAL_EL; // I17
        var ASSETS_FROM_CREDIT_CAL_EL; // I18
        var TOTAL_FIXED_ASSETS_CAL_EL; // I20
        var TOTAL_ASSETS_CAL_EL; // I22

        var EBIDA_CAL_EL; // I25
        var EBIDA_PERCENT_CAL_EL; // H25
        var OWNERS_EQUITY_CAL_EL; // N25

        var DE_BEFORE_LOAN_CAL_EL; // I26
        var DSCR_BEFORE_LOAN_CAL_EL; // I27

        var AR_DAY_CAL_EL; // J28
        var INVENTORY_DAY_CAL_EL; // J29

        var WORKING_CAPITAL_NEED_CAL_EL; // I30
        var LOAN_NEED_CAL_EL; // I31

        var ACCOUNT_PAYABLE_CAL_EL;          //     	N9
        var CURRENT_LIABILITY_BAY_CAL_EL; //   	 N10
        var OTHER_CURRENT_LIABILITY_CAL_EL; //     	N11
        var TOTAL_CURRENT_LIABILITY_CAL_EL; //      	N13
        var LONG_TERM_LIABILITY_BAY_CAL_EL; //           	N15

        var OTHER_LONG_TERM_LIABILITY_CAL_EL; //     	N16
        var TOTAL_LIABILITY_CAL; //  		N18
        var LOANS_REL_CO_DIRECTORS_CAL; // N20  
        var EQUITY_CAL; // N21
        var LIABILITY_EQUITY_CAL; // N22

        var WORKING_CAPITAL_APPROVE_CAL_EL; // N30
        var LOAN_APPROVE_CAL_EL; // N31

        var FIXED_INTEREST_PERCENT_CAL_EL;  // M27


        var DSCR_THIS_TIME_EL;  // M35
        var DE_THIS_TIME_EL;  // M37

        var WORKING_CAPITAL_DEFAULT_EL;  //   N40   วงเงินที่เห็นควรอนุมัติ
        var WORKING_CAPITAL_DEFAULT_APPROVE_EL;  //   N43  วงเงินที่สามารถอนุมัติ
        var LOAN_DEFAULT_EL;  //    N41   วงเงินที่เห้นควรอนุมัติ
        var LOAN_DEFAULT_APPROVE_EL;  //   N44  วงเงินที่สามารถอนุมัติ

        var TOTAL_AMOUNT_OF_COLLATERAL_EL // T17  รวมหลักประกัน
        var TEMP_CAL_LOAN_MAX_CAN_APPROVE_EL  //  R44

        var OTHER_FIXED_ASSETS_OTHER_BANK_CAL_EL // DX07

        var INPUT_EL;
        var CALCULATE_EL;

        var CURRENT_ASSET_OTHERTextBox ;
        var CURRENT_ASSET_OTHER_CALTextBox;

        $(document).ready(function () {

            $("#SMES_DATA_IDTextBox,#SMES_IDTextBox,#SMES_TYPETextBox,#USERTextBox").focus(function () {
                $(this).blur();
            });

            changeUser();

            // ซ่อนส่วน ตัวแปร business 
            $('#toggle-view #tableBusiness').hide();
            $('#toggle-view #buslabel').click(function () {
                //var text = $(this).parent().children('#tableBusiness');
                var text = $('#tableBusiness');
                if (text.is(':hidden')) {
                    text.slideDown('200');
                    $(this).children('span').html('-');
                } else {
                    text.slideUp('200');
                    $(this).children('span').html('+');

                }
            });
            // end ซ่อน business
            sizeFrame()  // resize เว็บที่เปิดให้มีขนาดเท่ากับหน้านี้

            // ประกาศตัวแปร object 

            C5 = '1';
            C6 = '1';
            D8 = $("#SALESTextBox");
            D9 = $("#CREDIT_SALETextBox");
            D10 = $("#CREDIT_TERMTextBox");
            D13 = $("#PURCHASETextBox");
            D14 = $("#CREDIT_PURCHASETextBox");
            D15 = $("#TERM_PURCHASETextBox");
            D16 = $("#DEFAULT_MARGINTextBox");
            D17 = $("#GROSS_PROFITTextBox");
            D20 = $("#INVENTORY_INTERVIEWTextBox");
            D21 = $("#INVENTORY_VISITTextBox");
            D24 = $("#ACCOUNT_RECEIVABLETextBox");
            D25 = $("#MACHINERY_EQUIPMENTTextBox");
            D26 = $("#CORE_ASSETSTextBox");
            D27 = $("#OTHER_FIXED_ASSETSTextBox");
            D28 = $("#CASH_BONDTextBox");
            D29 = $("#CALCULATE_RATETextBox");
            D30 = $("#ACCOUNT_PAYABLETextBox");
            D31 = $("#CURRENT_LIABILITY_BAYTextBox");
            D32 = $("#CURRENT_LIABILITY_OTHER_BANKTextBox");
            D33 = $("#OTHER_CURRENT_LIABILITYTextBox");
            D34 = $("#LONG_TERM_LIABILITY_BAYTextBox");
            D35 = $("#LONG_TERM_LIABILITY_BAY_REPAYMENTTextBox");
            D36 = $("#LONG_TERM_LIABILITY_OTHER_BANKTextBox");
            D37 = $("#LONG_TERM_LIABILITY_OTHER_REPAYMENTTextBox");
            D38 = $("#LONG_TERM_OTHER_LIABILITYTextBox");
            D39 = $("#LONG_TERM_OTHER_REPAYMENTTextBox");
            D40 = $("#LOANS_REL_CO_DIRECTORSTextBox");
            D41 = $("#LG_AVAL_BAYTextBox");
            D43 = $("#REFINANCE_WORKING_CAPITAL_OTHERTextBox");
            D44 = $("#REFINANCE_WORKING_LOAN_OTHERTextBox");
            D45 = $("#REFINANCE_REPAYMENTTextBox");

            F10 = $("[CELL='AR_TABLE']");
            F15 = $("[CELL='AP_TABLE']");
            F21 = $("[CELL='STOCK_TABLE']");

            RATE_TABLE = $("[CELL='RATE_TABLE']");  // ไม่มีใน cell pnop
            WORKING_CAPITAL_TABLE = $("[CELL='WORKING_CAPITAL_TABLE']");
            CONTRACT_TABLE = $("#CONTRACT_TABLETextBox");

            MARGIN_TABLE = $("#MARGIN_TABLETextBox");
            DSCR_TABLE = $("#DSCR_TABLETextBox");
            AP_TABLE = $("#AP_TABLETextBox");
            AR_TABLE = $("#AR_TABLETextBox");
            STOCK_TABLE = $("#STOCK_TABLETextBox");
            LTV_TABLE = $("#LTV_TABLETextBox");
            WORKING_CAPITAL_TABLE = $("#WORKING_CAPITAL_TABLETextBox");
            RATE_TABLE = $("#RATE_TABLETextBox");
            CONTRACT_TABLE = $("#CONTRACT_TABLETextBox");


            H25 = $("[CELL='H25']");

            I9 = $("#CASH_BOND_CALTextBox");
            I10 = $("#ACCOUNT_RECEIVABLE_CALTextBox");
            I11 = $("#INVENTORY_CALTextBox");
            I13 = $("#TOTAL_CURRENT_ASSETS_CALTextBox");
            I15 = $("#MACHINERY_EQUIPMENT_CALTextBox");
            I16 = $("#PROPERTY_PLANT_BUILDING_CALTextBox");
            I17 = $("#OTHER_FIXED_ASSETS_CALTextBox");
            I18 = $("#ASSETS_FROM_CREDIT_CALTextBox");
            I20 = $("#TOTAL_FIXED_ASSETS_CALTextBox");
            I22 = $("#TOTAL_ASSETS_CALTextBox");

            I25 = $("#EBIDA_CALTextBox");
            I26 = $("#DE_BEFORE_LOAN_CALTextBox");
            I27 = $("#DSCR_BEFORE_LOAN_CALTextBox");

            I30 = $("#WORKING_CAPITAL_NEED_CALTextBox");
            I31 = $("#LOAN_NEED_CALTextBox");

            I33 = $("#WORKING_CAPITALTextBox");
            I34 = $("#LOANTextBox");
            I35 = $("#LG_AVALTextBox");
            I36 = $("#ASSETS_INCREASE_LOANTextBox");
            I37 = $("#BOND_DEPOSIT_PLEDGE_PERSONTextBox");
            I39 = $("#APPRAISAL_VALUE_ZONE_ATextBox");
            I40 = $("#APPRAISAL_VALUE_ZONE_BTextBox");
            I41 = $("#APPRAISAL_VALUE_ZONE_CTextBox");
            I42 = $("#APPRAISAL_VALUE_ZONE_DTextBox");
            I43 = $("#APPRAISAL_VALUE_ZONE_ETextBox");
            I44 = $("#BOND_DEPOSIT_PLEDGETextBox");
            T17 = $("#TOTAL_AMOUNT_OF_COLLATERALTextBox");

            I45 = $("#APPRAISAL_VALUE_ZONE_FTextBox");
            I46 = $("#APPRAISAL_VALUE_ZONE_GTextBox");

            I46.hide(); // ไม่มี zone g  นี้แล้ว hide ไว้ก่อน

            I47 = $("#TCG_GUARANTEETextBox");


            J28 = $("#AR_DAY_CALTextBox");
            J29 = $("#INVENTORY_DAY_CALTextBox");

            M25 = $("#OWNERS_EQUITY_PERCENT_CALTextBox");
            M27 = $("#FIXED_INTEREST_PERCENT_CALTextBox");
            M33 = $("#INTEREST_RATE_PERCENTTextBox");
            M34 = $("#INTEREST_RATE_PERCENT_USEDTextBox");

            M35 = $("#DSCR_THIS_TIMETextBox");
            M36 = $("#DE_THIS_TIMETextBox");  // M36-N36 ฟิวในเว็บกับใน excell ไม่ตรงกัน
            M37 = $("#LTV_THIS_TIMETextBox");

            N9 = $("#ACCOUNT_PAYABLE_CALTextBox");
            N10 = $("#CURRENT_LIABILITY_BAY_CALTextBox");
            N11 = $("#OTHER_CURRENT_LIABILITY_CALTextBox");
            N13 = $("#TOTAL_CURRENT_LIABILITY_CALTextBox");
            N15 = $("#LONG_TERM_LIABILITY_BAY_CALTextBox");
            N16 = $("#OTHER_LONG_TERM_LIABILITY_CALTextBox");
            N18 = $("#TOTAL_LIABILITY_CALTextBox");
            N20 = $("#LOANS_REL_CO_DIRECTORS_CALTextBox");
            N21 = $("#EQUITY_CALTextBox");
            N22 = $("#LIABILITY_EQUITY_CALTextBox");
            N25 = $("#OWNERS_EQUITY_CALTextBox");

            N30 = $("#WORKING_CAPITAL_APPROVE_CALTextBox");
            N31 = $("#LOAN_APPROVE_CALTextBox");

            N40 = $("#WORKING_CAPITAL_DEFAULTTextBox");
            N41 = $("#LOAN_DEFAULTTextBox");
            N43 = $("#WORKING_CAPITAL_DEFAULT_APPROVETextBox");
            N44 = $("#LOAN_DEFAULT_APPROVETextBox");

            O27 = $("#PAYMENT_PERIOD_CALTextBox");
            O28 = $("#AVERAGE_PAYMENT_PERIOD_CALTextBox");
            O34 = $("#CONTRACT_YEARTextBox");
            O35 = $("#DSCR_THIS_TIME_PERCENTTextBox");
            O37 = $("#LTV_THIS_TIME_PERCENTTextBox");


            COST_OF_SALESTextBox = $("#COST_OF_SALESTextBox");
            COST_OF_SALES_PERCENTTextBox = $("#COST_OF_SALES_PERCENTTextBox");
            OPERATING_EXPENSESTextBox = $("#OPERATING_EXPENSESTextBox");
            OPERATING_EXPENSES_PERCENTTextBox = $("#OPERATING_EXPENSES_PERCENTTextBox");
            TAXTextBox = $("#TAXTextBox");
            OTHER_FIXED_ASSETS_OTHER_BANKTextBox = $("#OTHER_FIXED_ASSETS_OTHER_BANKTextBox");
            OTHER_FIXED_ASSETS_OTHER_BANK_CALTextBox = $("#OTHER_FIXED_ASSETS_OTHER_BANK_CALTextBox");

            DX06 = $("#OTHER_FIXED_ASSETS_OTHER_BANKTextBox");
            DX07 = $("#OTHER_FIXED_ASSETS_OTHER_BANK_CALTextBox");

            CURRENT_ASSET_OTHERTextBox = $("#CURRENT_ASSET_OTHERTextBox");
            CURRENT_ASSET_OTHER_CALTextBox = $("#CURRENT_ASSET_OTHER_CALTextBox");

            CURRENT_ASSET_OTHERTextBox.autoNumeric({ aPad: false });
            CURRENT_ASSET_OTHER_CALTextBox.autoNumeric({ aPad: false });

            // ประกาศตัวแปรกลุ่มของ element ที่เกี่ยวข้องกัน

            //CASH_BOND_CAL_EL = $("[CELL = 'D28'],[CELL = 'D37']");
            CASH_BOND_CAL_EL = $(D28).add(I37);
            //ACCOUNT_RECEIVABLE_CAL_EL = $("[CELL='D8'],[CELL='D9'],[CELL='D10'],[CELL='D24'],[CELL='AR_TABLE']");
            ACCOUNT_RECEIVABLE_CAL_EL = $(D8).add(D9).add(D10).add(D24).add("[CELL='AR_TABLE']");
            //INVENTORY_CAL_EL = $("[CELL='D21'],[CELL='D20'],[CELL='D13'],[CELL='STOCK_TABLE']");
            INVENTORY_CAL_EL = $(D21).add(D20).add(D13).add("[CELL='STOCK_TABLE']");
            //TOTAL_CURRENT_ASSETS_CAL_EL = $("[CELL='I9'],[CELL='I10'],[CELL='I11']");
            TOTAL_CURRENT_ASSETS_CAL_EL = $(I9).add(I10).add(I11).add(CURRENT_ASSET_OTHERTextBox);
            // MACHINERY_EQUIPMENT_CAL_EL = $("[CELL='D25']");
            MACHINERY_EQUIPMENT_CAL_EL = $(D25);
            //PROPERTY_PLANT_CAL_BUILDING_EL = $("[CELL='D26']");
            PROPERTY_PLANT_CAL_BUILDING_EL = $(D26);
            //OTHER_FIXED_ASSETS_CAL_EL = $("[CELL='D27']");
            OTHER_FIXED_ASSETS_CAL_EL = $(D27);
            //ASSETS_FROM_CREDIT_CAL_EL = $("[CELL='I36']")
            ASSETS_FROM_CREDIT_CAL_EL = $(I36);
            //TOTAL_FIXED_ASSETS_CAL_EL = $("[CELL='I15'],[CELL='I16'],[CELL='I17'],[CELL='I18']");
            TOTAL_FIXED_ASSETS_CAL_EL = $(I15).add(I16).add(I17).add(I18).add(DX07);
            //TOTAL_ASSETS_CAL_EL = $("[CELL='I13'],[CELL='I20']");
            TOTAL_ASSETS_CAL_EL = $(I13).add(I20);

            //EBIDA_PERCENT_CAL_EL = $("[CELL='M25']");
            EBIDA_PERCENT_CAL_EL = $(M25);
            //EBIDA_CAL_EL = $("[CELL='D17'],[CELL='D16'],[CELL='D8'],[CELL='H25'],[CELL='M25']");
            EBIDA_CAL_EL = $(D17).add(D16).add(D8).add(H25).add(M25);
            //OWNERS_EQUITY_CAL_EL = $("[CELL='I25'],[CELL='M25'],[CELL='H25']");
            OWNERS_EQUITY_CAL_EL = $(I25).add(M25).add(H25);
            //DE_BEFORE_LOAN_CAL_EL = $("[CELL='I22'],[CELL='I35'],[CELL='I36'],[CELL='N18'],[CELL='I33'],[CELL='I34']");
            DE_BEFORE_LOAN_CAL_EL = $(I22).add(I35).add(I36).add(N18).add(I33).add(I34);
            //DSCR_BEFORE_LOAN_CAL_EL = $("[CELL='D31'],[CELL='D32'],[CELL='D33'],[CELL='D35'],[CELL='D37'],[CELL='D39'],[CELL='N25'],[CELL='M27']");
            DSCR_BEFORE_LOAN_CAL_EL = $(D31).add(D32).add(D33).add(D35).add(D37).add(D39).add(N25).add(M27);
            //FIXED_INTEREST_PERCENT_CAL_EL = $("[CELL='D29']");
            FIXED_INTEREST_PERCENT_CAL_EL = $(D29);
            //AVERAGE_PAYMENT_PERIOD_CAL_EL = $("[CELL='D13'],[CELL='D14'],[CELL='D30'],[CELL='N9']");
            AVERAGE_PAYMENT_PERIOD_CAL_EL = $(D13).add(D14).add(D30).add(N9);
            //AR_DAY_CAL_EL = $("[CELL='I10'],[CELL='D8'],[CELL='D9'],[CELL='D24'],[CELL='J29'],[CELL='STOCK_TABLE']");
            AR_DAY_CAL_EL = $(I10).add(D8).add(D9).add(D24).add(J29).add("[CELL='STOCK_TABLE']");
            //INVENTORY_DAY_CAL_EL = $("[CELL='I11'],[CELL='D13'],[CELL='D20'],[CELL='D21']");
            INVENTORY_DAY_CAL_EL = $(I11).add(D13).add(D20).add(D21);
            //WORKING_CAPITAL_NEED_CAL_EL = $("[CELL='I10'],[CELL='I11'],[CELL='N9']");
            WORKING_CAPITAL_NEED_CAL_EL = $(I10).add(I11).add(N9);
            //LOAN_NEED_CAL_EL = $("[CELL='O27'],[CELL='O35'],[CELL='I25'],[CELL='M27']");
            LOAN_NEED_CAL_EL = $(O27).add(O35).add(I25).add(M27);

            //ACCOUNT_PAYABLE_CAL_EL = $("[CELL='D13'],[CELL='D14'],[CELL='D15'],[CELL='D30'],[CELL='AP_TABLE']");
            ACCOUNT_PAYABLE_CAL_EL = $(D13).add(D14).add(D15).add(D30).add("[CELL='AP_TABLE']");
            //CURRENT_LIABILITY_BAY_CAL_EL = $("[CELL='D31'],[CELL='I33']");
            CURRENT_LIABILITY_BAY_CAL_EL = $(D31).add(I33);
            // OTHER_CURRENT_LIABILITY_CAL_EL = $("[CELL='D32'],[CELL='D33'],[CELL='D43'],[CELL='I33'],[CELL='I34']");
            OTHER_CURRENT_LIABILITY_CAL_EL = $(D32).add(D33).add(D43).add(I33).add(I34);
            //TOTAL_CURRENT_LIABILITY_CAL_EL = $("[CELL='N9'],[CELL='N10'],[CELL='N11']");
            TOTAL_CURRENT_LIABILITY_CAL_EL = $(N9).add(N10).add(N11);
            //LONG_TERM_LIABILITY_BAY_CAL_EL = $("[CELL='D34'],[CELL='I34']");
            LONG_TERM_LIABILITY_BAY_CAL_EL = $(D34).add(I34);
            // OTHER_LONG_TERM_LIABILITY_CAL_EL = $("[CELL='D36'],[CELL='D38'],[CELL='D44'],[CELL='I33'],[CELL='I34']");
            OTHER_LONG_TERM_LIABILITY_CAL_EL = $(D36).add(D38).add(D44).add(I33).add(I34);
            //TOTAL_LIABILITY_CAL_EL = $("[CELL='N13'],[CELL='N15'],[CELL='N16']");
            TOTAL_LIABILITY_CAL_EL = $(N13).add(N15).add(N16);
            //LOANS_REL_CO_DIRECTORS_CAL_EL = $("[CELL='D40']");
            LOANS_REL_CO_DIRECTORS_CAL_EL = $(D40);
            //EQUITY_CAL_EL = $("[CELL='I22'],[CELL='N18'],[CELL='N20']");
            EQUITY_CAL_EL = $(I22).add(N18).add(N20);
            //LIABILITY_EQUITY_CAL_EL = $("[CELL='N18'],[CELL='N20'],[CELL='N21']");
            LIABILITY_EQUITY_CAL_EL = $(N18).add(N20).add(N21);

            //WORKING_CAPITAL_APPROVE_CAL_EL = $("[CELL = 'D35'], [CELL = 'D37'], [CELL = 'D39'], [CELL = 'D43'], [CELL = 'D45'],[CELL = 'I25'],[CELL = 'I30'], [CELL = 'O35'], [CELL = 'M27'] ,[CELL='N10'],[CELL='N11']"); // N30
            WORKING_CAPITAL_APPROVE_CAL_EL = $(D35).add(D37).add(D39).add(D43).add(D45).add(I25).add(I30).add(O35).add(M27).add(N10).add(N11); // N30
            //LOAN_APPROVE_CAL_EL = $("[CELL='O34'],[CELL='O35'],[CELL='M27'],[CELL='O27'],[CELL='I25'],[CELL='D31'], [CELL='D32'],[CELL='D33'], [CELL='D35'],[CEL='D37'],[CELL='D39'],[CELL='D43'],[CELL='D45'],[CELL='I33'],[CELL='M33'],[CELL='M34'],[CELL='I34']"); // N31
            LOAN_APPROVE_CAL_EL = $(O34).add(O35).add(M27).add(O27).add(I25).add(D31).add(D32).add(D33).add(D35).add(D37).add(D39).add(D43).add(D45).add(I33).add(M33).add(M34).add(I34); // N31

            // DSCR_THIS_TIME_EL = $("[CELL='D31'],[CELL='D32'],[CELL='D33'],[CELL='D35'],[CELL='D37'],[CELL='D39'],[CELL='D43'],[CELL='D45'],[CELL='I25'],[CELL='I33'],[CELL='I25'],[CELL='I34'],[CELL='M27'],[CELL='M33'],[CELL='M34'],[CELL='O34']");
            DSCR_THIS_TIME_EL = $(D31).add(D32).add(D33).add(D35).add(D37).add(D39).add(D43).add(D45).add(I25).add(I33).add(I25).add(I34).add(M27).add(M33).add(M34).add(O34);
            // DE_THIS_TIME_EL = $("[CELL='N18'],[CELL='N21'],[CELL='N20']");
            DE_THIS_TIME_EL = $(N18).add(N21).add(N20);
            // LTV_THIS_TIME_EL = $("[CELL='D41'],[CELL='I39'],[CELL='I35'],[CELL='I40'],[CELL='I41'],[CELL='I42'],[CELL='I43'],[CELL='I44'],[CELL='N10'],[CELL='N15']");
            LTV_THIS_TIME_EL = $(D41).add(I39).add(I35).add(I40).add(I41).add(I42).add(I43).add(I44).add(N10).add(N15);
            //WORKING_CAPITAL_DEFAULT_EL = $("[CELL='D8'],[CELL='WORKING_CAPITAL_TABLE']")
            WORKING_CAPITAL_DEFAULT_EL = $(I30);
            //LOAN_DEFAULT_EL = $("[CELL='O35'],[CELL='O27'],[CELL='I25'],[CELL='N40'],[CELL='M27']");  //    N41   วงเงินที่เห้นควรอนุมัติ
            LOAN_DEFAULT_EL = $(O35).add(O27).add(I25).add(N40).add(M27);  //    N41   วงเงินที่เห้นควรอนุมัติ
            //WORKING_CAPITAL_DEFAULT_APPROVE_EL = $("[CELL='I25'],[CELL='I44'],[CELL='O35'],[CELL='N11'],[CELL='N15'],[CELL='N40'],[CELL='M27'],[CELL='D35'],[CELL='D37'],[CELL='D39'],[CELL='D41'],[CELL='D45'],[T17]");
            WORKING_CAPITAL_DEFAULT_APPROVE_EL = $(I25).add(I44).add(O35).add(N10).add(N15).add(N40).add(M27).add(D35).add(D37).add(D39).add(D41).add(D45).add(T17);
            //LOAN_DEFAULT_APPROVE_EL = $("[CELL='N10'],[CELL='N15'],[CELL='I35'],[CELL='I44'],[CELL='T17'],[CELL='O37'],[CELL='D41']");  //   N44  วงเงินที่สามารถอนุมัติ
            LOAN_DEFAULT_APPROVE_EL = $(N10).add(N15).add(I35).add(I44).add(T17).add(O37).add(D41).add(I33).add(N43);  //   N44  วงเงินที่สามารถอนุมัติ
            //TOTAL_AMOUNT_OF_COLLATERAL_EL = $("[CELL='I39'],[CELL='I40'],[CELL='I41'],[CELL='I42'],[CELL='I43']");
            TOTAL_AMOUNT_OF_COLLATERAL_EL = $(I39).add(I40).add(I41).add(I42).add(I43).add(I45).add(I46);
            //TEMP_CAL_LOAN_MAX_CAN_APPROVE_EL = $("[CELL='D35'],[CELL='D37'],[CELL='D39'],[CELL='D45'],[CELL='O35'],[CELL='M27'],[CELL='M33'],[CELL='M34'],[CELL='O27'],[CELL='O34'],[CELL='O35'],[CELL='N10'],[CELL='N11'],[CELL='I33'],[CELL='I34']");
            TEMP_CAL_LOAN_MAX_CAN_APPROVE_EL = $(D35).add(D37).add(D39).add(D45).add(O35).add(M27).add(M33).add(M34).add(O27).add(O34).add(O35).add(N10).add(N11).add(I33).add(I34);

            OTHER_FIXED_ASSETS_OTHER_BANK_CAL_EL = $(DX06);

            INPUT_EL = $(D8).add(D9).add(D10).add(D13).add(D14).add(D15).add(D17).add(D20).add(D21).add(D24).add(D25).add(D26).add(D27).add(D28).add(D29).add(D30).add(D31).add(D32).add(D33).add(D34).add(D35).add(D37).add(D36).add(D38).add(D39).add(D40).add(D41).add(D43).add(D44).add(D45).add(I39).add(I40).add(I41).add(I42).add(I43).add(I44).add(I45).add(I46).add(I47).add(I33).add(I34).add(I35).add(I36).add(I37).add(M33).add(M34).add(O34);

            CALCULATE_EL = $(I9).add(I10).add(I11).add(I13).add(I15).add(I16).add(I17).add(I18).add(I20).add(I22).add(H25).add(I25).add(I26).add(I27).add(I28).add(J28).add(J29).add(I30).add(I31).add(N9).add(N10).add(N11).add(N13).add(N15).add(N16).add(N18).add(N20).add(N21).add(N22).add(N25).add(M27).add(O27).add(O28).add(O28).add(N30).add(N31).add(M35).add(M36).add(M37).add(N40).add(N41).add(N43).add(N44).add(O35).add(O37);
            //CALCULATE_EL.addClass('purpleBG');

            INPUT_EL = $(INPUT_EL).add(COST_OF_SALESTextBox).add(COST_OF_SALES_PERCENTTextBox).add(OPERATING_EXPENSESTextBox).add(OPERATING_EXPENSES_PERCENTTextBox).add(TAXTextBox).add(OTHER_FIXED_ASSETS_OTHER_BANKTextBox).add(CURRENT_ASSET_OTHERTextBox);
            CALCULATE_EL = $(CALCULATE_EL).add(OTHER_FIXED_ASSETS_OTHER_BANK_CALTextBox).add(CURRENT_ASSET_OTHER_CALTextBox);


            // ใช้ function autonumeric จาก  js/autoNumeric

            //        $("#CREDIT_TERMTextBox").autoNumeric({ aPad: false });  // กำหนดไม่ให้มีจุดทศนิยมไว้ก่อนจะไม่ถูกทับ
            //        $("#TERM_PURCHASETextBox").autoNumeric({ aPad: false });  // กำหนดไม่ให้มีจุดทศนิยมไว้ก่อนจะไม่ถูกทับ
            //  $("#EBIDA_CALTextBox").autoNumeric({ aPad: true });  // กำหนดให้มีจุดทศนิยมไว้ก่อนจะไม่ถูกทับ
            //$("#DE_BEFORE_LOAN_CALTextBox").autoNumeric({ aPad: true });  // กำหนดให้มีจุดทศนิยมไว้ก่อนจะไม่ถูกทับ



            I26.autoNumeric({ aPad: true, vMin: '-9999999.99', vMax: '9999999.99' });  // กำหนดให้มีค่าติดลบได้และมีจุดทศนิยม
            I27.autoNumeric({ aPad: true });  // กำหนดให้มีจุดทศนิยม
            M27.autoNumeric({ aPad: true });  // กำหนดให้มีจุดทศนิยม
            M35.autoNumeric({ aPad: true, vMin: '-9999999.99', vMax: '9999999.99' });  // กำหนดให้มีจุดทศนิยม
            M36.autoNumeric({ aPad: true, vMin: '-9999999.99', vMax: '9999999.99' });  // กำหนดให้มีค่าติดลบได้และมีจุดทศนิยม
            O37.autoNumeric({ aPad: true });  // กำหนดให้มีจุดทศนิยม
            O34.autoNumeric({ aPad: true, vMin: '0', vMax: '100' });
            O35.autoNumeric({ aPad: true });
            H25.autoNumeric({ aPad: true });
            M25.autoNumeric({ aPad: true });
            M37.autoNumeric({ aPad: true });

            D9.autoNumeric({ aPad: true, vMin: '0.00', vMax: '100.00' });
            D14.autoNumeric({ aPad: true, vMin: '0.00', vMax: '100.00' });
            D17.autoNumeric({ aPad: true, vMin: '0.00', vMax: '100.00' });
            D29.autoNumeric({ aPad: true, vMin: '0.00', vMax: '100.00' });
            M33.autoNumeric({ aPad: true, vMin: '0.000', vMax: '100.000' });
            M34.autoNumeric({ aPad: true, vMin: '0.000', vMax: '100.000' });
            I36.autoNumeric({ aPad: true, vMin: '0.00', vMax: '999999999.99' });
            $("#OWNERS_EQUITY_PERCENT_INPUTTextBox").autoNumeric({ aPad: true, vMin: '0.00', vMax: '100.00' });
            COST_OF_SALES_PERCENTTextBox.autoNumeric({ aPad: true, vMin: '0.00', vMax: '100.00' });
            OPERATING_EXPENSES_PERCENTTextBox.autoNumeric({ aPad: true, vMin: '0.00', vMax: '100.00' });




            T17.hide();
            D16.hide();

            //        N30.autoNumeric({ vMin: '-9999999999', vMax: '9999999999' });
            //        N18.autoNumeric({ vMin: '-9999999999', vMax: '9999999999' });
            //        N20.autoNumeric({ vMin: '-9999999999', vMax: '9999999999' });
            //        N21.autoNumeric({ vMin: '-9999999999', vMax: '9999999999' });
            //        N22.autoNumeric({ vMin: '-9999999999', vMax: '9999999999' });

            COST_OF_SALESTextBox.autoNumeric({ aPad: false });
            COST_OF_SALES_PERCENTTextBox.autoNumeric({ aPad: true, vMin: '-100', vMax: '100' });
            OPERATING_EXPENSESTextBox.autoNumeric({ aPad: false });
            OPERATING_EXPENSES_PERCENTTextBox.autoNumeric({ aPad: true, vMin: '-100', vMax: '100' });
            TAXTextBox.autoNumeric({ aPad: true });
            OTHER_FIXED_ASSETS_OTHER_BANKTextBox.autoNumeric({ aPad: true });
            OTHER_FIXED_ASSETS_OTHER_BANK_CALTextBox.autoNumeric({ aPad: true, vMin: '-9999999999', vMax: '9999999999' });

            J28.autoNumeric({ aPad: true });
            J29.autoNumeric({ aPad: true });

            //$("#tab1 input[type='text'],#tab2 input[type='text'],#tab3 input[type='text'],#tab4 input[type='text']").autoNumeric({ aPad: false }); // ให้ใช้ autonumeric และ ไม่ให้มีทศนิยม

            INPUT_EL.focus(function () {
                $(this).select();
            });
            INPUT_EL.addClass("inputStyle");
            INPUT_EL.autoNumeric({ aPad: false });
            INPUT_EL.change(function () {
                // changeValue = true;
            });

            CALCULATE_EL.autoNumeric({ aPad: true, vMin: '-9999999999', vMax: '9999999999' });
            var cal;  // กำหนดตัวแปรเก็บค่า กรณีที่มีการลบค่าใน calculate 
            CALCULATE_EL.focus(function () {
                cal = $(this).val();
            }).blur(function () {
                if ($(this).val() != cal) {
                    $(this).val(cal);
                }
            });

            //$("#tab5 input[type='text']").autoNumeric({ aPad: false }); // ให้ใช้ autonumeric และ ไม่ให้มีทศนิยม
            $("input[type='text']").css("text-align", "right");  // กำหนดให้ text box ชิดขวาทั้งหมด
            //$("input[type='text'][title]").tooltip();
            //INPUT_EL.tooltip();
            
            // readonly

            $(O27).keydown(function () {  // อายุสัญญา cal
                $(this).blur();
            });
            $(M25).keydown(function () {  // ส่วนของเจ้าของ %
                $(this).blur();
            });
            $(O35).focus(function () { $(this).blur(); });
            $(O37).focus(function () { $(this).blur(); });

            // แก้ไขไม่ให้เปลี่ยน % ส่วนของเจ้าของ 
            $("#OWNERS_EQUITY_PERCENT_INPUTTextBox").focus(function () { $(this).blur(); });
            //            $("#OWNERS_EQUITY_PERCENT_INPUTTextBox").change(function () {
            //                M25.val($(this).val());
            //                M25.change();
            //            });

            //  I9  เงินสดเงินฝากพันธบัตร ==========

            I9.click(function () {
                CASH_BOND_CAL_EL.addClass('yellowBG');
            }).blur(function () {
                CASH_BOND_CAL_EL.removeClass('yellowBG');
            }).keydown(function () {
                $(this).blur();
            });

            CASH_BOND_CAL_EL.change(function () {
                var CASH_BOND_CAL_EL_ERR = false;
                if (D28.val() == '') {
                    obj.setD28(0);
                    D28.val(0);
                } else {
                    obj.setD28(parseFloat($(D28).autoNumericGet()));
                }
                if (I37.val() == '') {
                    obj.setI37(0);
                    I37.val(0);
                } else {
                    obj.setI37(parseFloat($(I37).autoNumericGet()));
                }

                I9.autoNumericSet(obj.I9());
                I9.change();
            });

            // End I9===========================

            // I10 ลูกหนี้การค้า======================

            I10.focus(function () {
                ACCOUNT_RECEIVABLE_CAL_EL.addClass('yellowBG');
            }).blur(function () {
                ACCOUNT_RECEIVABLE_CAL_EL.removeClass('yellowBG');
            }).keydown(function () {
                $(this).blur();
            });

            // เมื่อมีการเปลี่ยนข้อมูลในกลุ่ม ลูกหนี้การค้า 
            ACCOUNT_RECEIVABLE_CAL_EL.change(function () {
                var chkErr = false;
                if (D8.val() == '') {
                    obj.setD8(0);
                    D8.val(0);
                } else {
                    obj.setD8(parseFloat($(D8).autoNumericGet()));
                }
                if (D9.val() == '') {
                    obj.setD9(0);
                    D9.val(0);
                } else {
                    obj.setD9(parseFloat($(D9).autoNumericGet()));
                }
                if (D10.val() == '') {
                    obj.setD10(0);
                    D10.val(0);
                } else {
                    obj.setD10(parseFloat($(D10).autoNumericGet()));
                }
                if (D20.val() == '') {
                    obj.setD20(0);
                } else {
                    obj.setD20(parseFloat($(D20).autoNumericGet()));
                }
                if (D24.val() == '') {
                    obj.setD24(0);
                    D24.val(0);
                } else {
                    obj.setD24(parseFloat($(D24).autoNumericGet()));
                }

                if (CURRENT_ASSET_OTHERTextBox.val() == '') {
                    obj.setCURRENT_ASSET_OTHER(0);
                    CURRENT_ASSET_OTHERTextBox.val(0);
                } else {
                    obj.setCURRENT_ASSET_OTHER(parseFloat($(CURRENT_ASSET_OTHERTextBox).autoNumericGet()));
                    CURRENT_ASSET_OTHER_CALTextBox.autoNumericSet(parseFloat($(CURRENT_ASSET_OTHERTextBox).autoNumericGet()))
                }

                if (F10.val() == '') {
                    obj.setF10(0);
                    alert('กรุณาเลือกประเภทธุรกิจ');
                    $('#BUSINESS_ID_TABLETextBox').focus();
                    chkErr = true;
                } else {
                    obj.setF10(parseFloat($(F10).autoNumericGet()));
                }

                if (chkErr == false) {

                    I10.autoNumericSet(obj.I10());
                    I10.change();
                }

            });

            // END  I10 ลูกหนี้การค้า======================

            CURRENT_ASSET_OTHERTextBox.change(function () {
                var chkErr = false;
                if (CURRENT_ASSET_OTHERTextBox.val() == '') {
                    obj.setCURRENT_ASSET_OTHER(0);
                } else {
                    obj.setCURRENT_ASSET_OTHER(parseFloat($(CURRENT_ASSET_OTHERTextBox).autoNumericGet()));
                    CURRENT_ASSET_OTHER_CALTextBox.autoNumericSet($(CURRENT_ASSET_OTHERTextBox).autoNumericGet());
                }
            });


            // I11 สต๊อกสินค้า======================

            I11.click(function () {

                INVENTORY_CAL_EL.addClass('yellowBG');
            }).blur(function () {
                INVENTORY_CAL_EL.removeClass('yellowBG');
            }).keydown(function () {
                $(this).blur();
            });

            INVENTORY_CAL_EL.change(function () {
                var checkErr = false;
                if (D21.val() == '') {
                    obj.setD21(0);
                } else {
                    obj.setD21(parseFloat($(D21).autoNumericGet()));
                }
                if (D20.val() == '') {
                    obj.setD20(0);
                } else {
                    obj.setD20(parseFloat($(D20).autoNumericGet()));
                }
                if (D13.val() == '') {
                    obj.setD13(0);
                } else {
                    obj.setD13(parseFloat($(D13).autoNumericGet()));
                }
                if (F21.val() == '') {
                    alert('กรุณาเลือกประเภทธุรกิจ');
                    $('#BUSINESS_ID_TABLETextBox').focus();
                    checkErr = true;
                } else {
                    obj.setF21(parseFloat($(F21).autoNumericGet()));
                }

                if (checkErr == false) {
                    I11.autoNumericSet(obj.I11());
                    I11.change();
                } else {
                    I11.autoNumericSet(0);
                    I11.change();
                }

            });

            // END I11 ===================
            // I13 รวมสินทรพัย์หมุนเวียน===================

            I13.click(function () {
                TOTAL_CURRENT_ASSETS_CAL_EL.addClass('yellowBG');
            }).blur(function () {
                TOTAL_CURRENT_ASSETS_CAL_EL.removeClass('yellowBG');
            }).keydown(function () {
                $(this).blur();
            });

            TOTAL_CURRENT_ASSETS_CAL_EL.change(function () {
                var checkErr = false;
                //TOTAL_CURRENT_ASSETS_CAL_EL = $("[CELL='I9'],[CELL='I10'],[CELL='I11']");
                if (I9.val() == '') {
                    checkErr = true;
                }
                if (I10.val() == '') {
                    checkErr = true;
                }
                if (I11.val() == '') {
                    checkErr = true;
                }
                if (CURRENT_ASSET_OTHERTextBox.val() == '') {
                    checkErr = true;
                }
                if (checkErr == false) {
                    I13.autoNumericSet(obj.I13());
                    I13.change();
                } else {
                    I13.autoNumericSet(0);
                }

            });

            // END I13 ===================
            // I15  เครื่องจักรอุปกรณ์===================

            I15.click(function () {
                MACHINERY_EQUIPMENT_CAL_EL.addClass('yellowBG');
            }).blur(function () {
                MACHINERY_EQUIPMENT_CAL_EL.removeClass('yellowBG');
            }).keydown(function () {
                $(this).blur();
            });

            MACHINERY_EQUIPMENT_CAL_EL.change(function () {
                if ($(this).val() != '' || $(ele).val() == 0) {
                    obj.setD25(parseFloat($(D25).autoNumericGet()));
                    I15.autoNumericSet(obj.I15());
                    I15.change();
                } else {
                    I15.val('');
                }
            });
            // END I15  =================

            // I16 ที่ดินอาคาร  =================

            I16.click(function () {
                PROPERTY_PLANT_CAL_BUILDING_EL.addClass('yellowBG');
            }).blur(function () {
                PROPERTY_PLANT_CAL_BUILDING_EL.removeClass('yellowBG');
            }).keydown(function () {
                $(this).blur();
            });

            PROPERTY_PLANT_CAL_BUILDING_EL.change(function () {
                if ($(this).val() != '' || $(ele).val() == 0) {
                    obj.setD26(parseFloat($(D26).autoNumericGet()));
                    I16.autoNumericSet(obj.I16());
                    I16.change()
                } else {
                    I16.val('');
                }
            });

            //  END I16 ที่ดินอาคาร  =================

            //   I17 สินทรัพย์ถาวรอื่น ๆ  =================

            I17.click(function () {
                OTHER_FIXED_ASSETS_CAL_EL.addClass('yellowBG');
            }).blur(function () {
                OTHER_FIXED_ASSETS_CAL_EL.removeClass('yellowBG');
            }).keydown(function () {
                $(this).blur();
            });

            OTHER_FIXED_ASSETS_CAL_EL.change(function () {
                if (D27.val() == '') {
                    obj.setD27(0);
                } else {
                    obj.setD27(parseFloat($(D27).autoNumericGet()));
                    I17.autoNumericSet(obj.I17());
                    I17.change()
                }
            });
            //  END  I17 สินทรัพย์ถาวรอื่น ๆ  =================

            //   I18 สินทรัพย์เพิ่มจากสินเชื่อ=================

            I18.click(function () {
                ASSETS_FROM_CREDIT_CAL_EL.addClass('yellowBG');
            }).blur(function () {
                ASSETS_FROM_CREDIT_CAL_EL.removeClass('yellowBG');
            }).keydown(function () {
                $(this).blur();
            });


            ASSETS_FROM_CREDIT_CAL_EL.change(function () {
                if ($(this).val() != '') {
                    obj.setI36(parseFloat($(I36).autoNumericGet()));
                    I18.autoNumericSet(obj.I18());
                    I18.change()
                } else {
                    I18.val('');
                }
            });

            //  END  I18 สินทรัพย์เพิ่มจากสินเชื่อ=================

            //   I20 รวมสินทรัพย์ถาวร =================

            I20.click(function () {
                TOTAL_FIXED_ASSETS_CAL_EL.addClass('yellowBG');
            }).blur(function () {
                TOTAL_FIXED_ASSETS_CAL_EL.removeClass('yellowBG');
            }).keydown(function () {
                $(this).blur();
            });


            $(TOTAL_FIXED_ASSETS_CAL_EL).change(function () {
                var TOTAL_FIXED_ASSETS_CAL_EL_ERR = false;
                $.each(TOTAL_FIXED_ASSETS_CAL_EL, function (i, ele) {
                    if ($(ele).val() == '') { TOTAL_FIXED_ASSETS_CAL_EL_ERR = true; }
                });

                if (TOTAL_FIXED_ASSETS_CAL_EL_ERR == false) {
                    I20.autoNumericSet(obj.I20());
                    I20.change()
                } else {
                    I20.val('');
                }
            });
            //  END I20 รวมสินทรัพย์ถาวร =================

            //   I22 รวมสินทรัพย์ถาวร =================

            I22.click(function () {
                TOTAL_ASSETS_CAL_EL.addClass('yellowBG');
            }).blur(function () {
                TOTAL_ASSETS_CAL_EL.removeClass('yellowBG');
            }).keydown(function () {
                $(this).blur();
            });

            TOTAL_ASSETS_CAL_EL.change(function () {
                var TOTAL_ASSETS_CAL_EL_ERR = false;
                $.each(TOTAL_FIXED_ASSETS_CAL_EL, function (i, ele) {
                    if ($(ele).val() == '') { TOTAL_ASSETS_CAL_EL_ERR = true; }
                });
                if (TOTAL_ASSETS_CAL_EL_ERR == false) {
                    I22.autoNumericSet(obj.I22());
                    I22.change();
                }
            });

            // END  I22 รวมสินทรัพย์ถาวร =================

            // H25  Ebida %
            H25.click(function () {
                EBIDA_PERCENT_CAL_EL.addClass('yellowBG');
            }).blur(function () {
                EBIDA_PERCENT_CAL_EL.removeClass('yellowBG');
            }).keydown(function () {
                $(this).blur();
            });

            $(EBIDA_PERCENT_CAL_EL).change(function () {
                if (M25.val() == '') {
                    obj.setM25(0);
                } else {
                    obj.setM25(parseFloat($(M25).autoNumericGet()));
                }
                H25.autoNumericSet(obj.H25() * 100); // แสดงเป็น % คูณด้วย 100
                H25.change()
            });

            // END    H25  Ebida %

            // I25  EBIDA

            I25.click(function () {
                EBIDA_CAL_EL.addClass('yellowBG');
            }).blur(function () {
                EBIDA_CAL_EL.removeClass('yellowBG');
            }).keydown(function () {
                $(this).blur();
            });

            EBIDA_CAL_EL.change(function () {
                if (D8.val() == '') {
                    obj.setD8(0);
                } else {
                    obj.setD8(parseFloat($(D8).autoNumericGet()));
                }
                if (D16.val() == '') {
                    obj.setD16(0);
                } else {
                    obj.setD16(parseFloat($(D16).autoNumericGet()));
                }

                if (D17.val() == '') {
                    obj.setD17(0);
                } else {
                    obj.setD17(parseFloat($(D17).autoNumericGet()));
                    //obj.setMARGIN(parseFloat($(D17).autoNumericGet()));
                }

                if (H25.val() == '') {
                    obj.setM25(0);
                } else {
                    obj.setM25(parseFloat($(M25).autoNumericGet()));
                }

                I25.autoNumericSet(obj.I25());
                I25.change()

            });

            // END  I25  EBIDA

            // N25   ส่วนของเจ้าของ 
            N25.click(function () {
                OWNERS_EQUITY_CAL_EL.addClass('yellowBG');
            }).blur(function () {
                OWNERS_EQUITY_CAL_EL.removeClass('yellowBG');
            }).keydown(function () {
                $(this).blur();
            });

            OWNERS_EQUITY_CAL_EL.change(function () {
                var chkErr = false;
                $.each(OWNERS_EQUITY_CAL_EL, function (i, ele) {
                    if ($(ele).val() == '') { chkErr = true; }
                });
                if (chkErr == false) {
                    N25.autoNumericSet(obj.N25());
                    N25.change()
                }

            });


            //  I26  D/E ก่อนขอสินเชื่อ 

            I26.click(function () {
                DE_BEFORE_LOAN_CAL_EL.addClass('yellowBG');
            }).blur(function () {
                DE_BEFORE_LOAN_CAL_EL.removeClass('yellowBG');
            }).keydown(function () {
                $(this).blur();
            });

            DE_BEFORE_LOAN_CAL_EL.change(function () {
                var checkErr = false;
                if (I33.val() == '') {
                    obj.setI33(0);
                } else {
                    obj.setI33(parseFloat($(I33).autoNumericGet()));
                }
                if (I34.val() == '') {
                    obj.setI34(0);
                } else {
                    obj.setI34(parseFloat($(I34).autoNumericGet()));
                }
                if (I35.val() == '') {
                    obj.setI35(0);
                } else {
                    obj.setI35(parseFloat($(I35).autoNumericGet()));
                }
                if (I36.val() == '') {
                    obj.setI36(0);
                } else {
                    obj.setI36(parseFloat($(I36).autoNumericGet()));
                }

                if (I22.val() == '') {
                    checkErr = true;
                }
                if (N18.val() == '') {
                    checkErr = true;
                }
                //alert(checkErr);
                if (checkErr == false) {
                    I26.autoNumericSet(obj.I26());
                    I26.change();
                }

            });

            // END  D/E ก่อนขอสินเชื่อ 


            // I27 DSCR ก่อนขอสินเชื่อ 

            I27.click(function () {
                DSCR_BEFORE_LOAN_CAL_EL.addClass('yellowBG');
            }).blur(function () {
                DSCR_BEFORE_LOAN_CAL_EL.removeClass('yellowBG');
            }).keydown(function () {
                $(this).blur();
            });

            DSCR_BEFORE_LOAN_CAL_EL.change(function () {
                var chkErr = false;
                if (D31.val() == '') {
                    obj.setD31(0);
                } else {
                    obj.setD31(parseFloat($(D31).autoNumericGet()));
                }
                if (D32.val() == '') {
                    obj.setD32(0);
                } else {
                    obj.setD32(parseFloat($(D32).autoNumericGet()));
                }
                if (D33.val() == '') {
                    obj.setD33(0);
                } else {
                    obj.setD33(parseFloat($(D33).autoNumericGet()));
                }
                if (D35.val() == '') {
                    obj.setD35(0);
                } else {
                    obj.setD35(parseFloat($(D35).autoNumericGet()));
                }
                if (D37.val() == '') {
                    obj.setD37(0);
                } else {
                    obj.setD37(parseFloat($(D37).autoNumericGet()));
                }
                if (D39.val() == '') {
                    obj.setD39(0);
                } else {
                    obj.setD39(parseFloat($(D39).autoNumericGet()));
                }

        		if (M27.val() == '') {
                    obj.setD29(0);
                } else {
                    obj.setD29(parseFloat($(D29).autoNumericGet()));
                }
				//alert(obj.I27());
                if (chkErr == false) {
                    I27.autoNumericSet(obj.I27());
                    I27.change()
                } else {

                }

            });

            // End DSCR

            // M27 อัตราดอกเบี้ยที่ FIXED_INTEREST_PERCENT_CAL

            M27.click(function () {
                FIXED_INTEREST_PERCENT_CAL_EL.addClass('yellowBG');
            }).blur(function () {
                FIXED_INTEREST_PERCENT_CAL_EL.removeClass('yellowBG');
            }).keydown(function () {
                $(this).blur();
            });
            FIXED_INTEREST_PERCENT_CAL_EL.change(function () {
                var checkErr = false;
                if (D29.val() == '') {
                    obj.setD29(0);
                } else {
                    obj.setD29(parseFloat($(D29).autoNumericGet()));
                }

                if (checkErr == false) {
				   
                    M27.autoNumericSet($(D29).autoNumericGet());
                    M27.change();
			    }

            });

            // END M27 อัตราดอกเบี้ยที่ FIXED_INTEREST_PERCENT_CAL_EL

            // J28   ระยะเวลาเก็บหนี้เฉลี่ย
            J28.click(function () {
                AR_DAY_CAL_EL.addClass('yellowBG');
            }).blur(function () {
                AR_DAY_CAL_EL.removeClass('yellowBG');
            }).keydown(function () {
                $(this).blur();
            });

            AR_DAY_CAL_EL.change(function () {
                var checkErr = false;
                if (D8.val() == '') {
                    obj.setD8(0);
                } else {
                    obj.setD8(parseFloat($(D8).autoNumericGet()));
                }
                if (D9.val() == '') {
                    obj.setD9(0);
                } else {
                    obj.setD9(parseFloat($(D9).autoNumericGet()));
                }
                if (D24.val() == '') {
                    obj.setD24(0);
                } else {
                    obj.setD24(parseFloat($(D24).autoNumericGet()));
                }
                if (F21.val() == '') {
                    obj.setF21(0);
                } else {
                    obj.setF21(parseFloat($(F21).autoNumericGet()));
                }

                if (J29.val() == '') {
                    checkErr = true;
                }

                if (checkErr == false) {
                    J28.autoNumericSet(obj.J28());
                    J28.change()
                }


            });
            // End     J28   ระยะเวลาเก็บหนี้เฉลี่ย

            // O28 ระยะเวลาชำระหนี้เฉลี่ย
            O28.click(function () {

                AVERAGE_PAYMENT_PERIOD_CAL_EL.addClass('yellowBG');
            }).blur(function () {
                AVERAGE_PAYMENT_PERIOD_CAL_EL.removeClass('yellowBG');
            }).keydown(function () {
                $(this).blur();
            });
            AVERAGE_PAYMENT_PERIOD_CAL_EL.change(function () {

                var checkErr = false;
                if (D13.val() == '') {
                    obj.setD13(0);
                } else {
                    obj.setD13(parseFloat($(D13).autoNumericGet()));
                }
                if (D14.val() == '') {
                    obj.setD14(0);
                } else {
                    obj.setD14(parseFloat($(D14).autoNumericGet()));
                }
                if (D30.val() == '') {
                    obj.setD30(0);
                } else {
                    obj.setD30(parseFloat($(D30).autoNumericGet()));
                }
                if (N9.val() == '') {
                    checkErr = true
                }
                if (checkErr == false) {
                    O28.autoNumericSet(obj.O28());
                    O28.change();
                }

            });
            // END  O28 ระยะเวลาชำระหนี้เฉลี่ย


            // J29   ระยะเวลาเก็บหนี้เฉลี่ย
            J29.click(function () {
                INVENTORY_DAY_CAL_EL.addClass('yellowBG');
            }).blur(function () {
                INVENTORY_DAY_CAL_EL.removeClass('yellowBG');
            }).keydown(function () {
                $(this).blur();
            });

            INVENTORY_DAY_CAL_EL.change(function () {
                var checkErr = false;
                if (D13.val() == '') {
                    obj.setD13(0);
                } else {
                    obj.setD13(parseFloat($(D13).autoNumericGet()));
                }
                if (D20.val() == '') {
                    obj.setD20(0);
                } else {
                    obj.setD20(parseFloat($(D20).autoNumericGet()));
                }
                if (D21.val() == '') {
                    obj.setD21(0);
                } else {
                    obj.setD21(parseFloat($(D21).autoNumericGet()));
                }
                J29.autoNumericSet(obj.J29());
                J29.change();

            });
            // End     J29   ระยะเวลาเก็บหนี้เฉลี่ย



            // I30 WORKING_CAPITAL_NEED_CAL_EL
            I30.click(function () {
                $(WORKING_CAPITAL_NEED_CAL_EL).addClass('yellowBG');
            }).blur(function () {
                $(WORKING_CAPITAL_NEED_CAL_EL).removeClass('yellowBG');
            }).keydown(function () {
                $(this).blur();
            });

            WORKING_CAPITAL_NEED_CAL_EL.change(function () {
                var checkErr = false;
                if (I10.val() == '') {
                    checkErr = true;
                }
                if (I11.val() == '') {
                    checkErr = true;
                }
                if (N9.val() == '') {
                    checkErr = true;
                }
                if (checkErr == false) {
                    I30.autoNumericSet(obj.I30());
                    I30.change();
                }

            });
            // END  I30  WORKING_CAPITAL_NEED_CAL_EL

            //I31 LOAN_NEED_CAL_EL
            I31.click(function () {
                LOAN_NEED_CAL_EL.addClass('yellowBG');
            }).blur(function () {
                LOAN_NEED_CAL_EL.removeClass('yellowBG');
            }).keydown(function () {
                $(this).blur();
            });

            LOAN_NEED_CAL_EL.change(function () {
                var checkErr = false;

                if (O27.val() == '') {
                    checkErr = true;
                }
                if (O35.val() == '') {
                    checkErr = true;
                }
                if (I25.val() == '') {
                    checkErr = true;
                }
                if (M27.val() == '') {
                    checkErr = true;
                }
                if (checkErr == false) {
                    I31.autoNumericSet(obj.I31());
                    I31.change();
                }

            });
            // END  I31 LOAN_NEED_CAL_EL

            // N9   เจ้าหนี้การค้า

            N9.click(function () {
                ACCOUNT_PAYABLE_CAL_EL.addClass('yellowBG');
            }).blur(function () {
                ACCOUNT_PAYABLE_CAL_EL.removeClass('yellowBG');
            }).keydown(function () {
                $(this).blur();
            });

            ACCOUNT_PAYABLE_CAL_EL.change(function () {
                var chkErr = false;
                if (D13.val() == '') {
                    obj.setD13(0);
                } else {
                    obj.setD13(parseFloat($(D13).autoNumericGet()));
                }
                if (D14.val() == '') {
                    obj.setD14(0);
                } else {
                    obj.setD14(parseFloat($(D14).autoNumericGet()));
                }
                if (D15.val() == '') {
                    obj.setD15(0);
                } else {
                    obj.setD15(parseFloat($(D15).autoNumericGet()));
                }
                if (D30.val() == '') {
                    obj.setD30(0);
                } else {
                    obj.setD30(parseFloat($(D30).autoNumericGet()));
                }

                if (F15.val() == '') {
                    alert('กรุณาเลือกประเภทธุรกิจ');
                    $('#BUSINESS_ID_TABLETextBox').focus();
                    obj.setF15(0);
                    chkErr = true;
                } else {
                    obj.setF15(parseFloat($(F15).autoNumericGet()));
                }
                if (chkErr == false) {
                    N9.autoNumericSet(obj.N9(true));
                    N9.change();
                }

            });

            // END  N9   เจ้าหนี้การค้า

            // N10  หนี้สินหมุนเวียน Bay 

            N10.click(function () {
                $(CURRENT_LIABILITY_BAY_CAL_EL).addClass('yellowBG');
            }).blur(function () {
                $(CURRENT_LIABILITY_BAY_CAL_EL).removeClass('yellowBG');
            }).keydown(function () {
                $(this).blur();
            });

            CURRENT_LIABILITY_BAY_CAL_EL.change(function () {
                if (D31.val() == '') {
                    obj.setD31(0);
                } else {
                    obj.setD31(parseFloat($(D31).autoNumericGet()));
                }
                if (D32.val() == '') {
                    obj.setD32(0);
                } else {
                    obj.setD32(parseFloat($(D32).autoNumericGet()));
                }
                if (D43.val() == '') {
                    obj.setD43(0);
                } else {
                    obj.setD43(parseFloat($(D43).autoNumericGet()));
                }
                if (I33.val() == '') {
                    obj.setI33(0);
                } else {
                    obj.setI33(parseFloat($(I33).autoNumericGet()));
                }
                if (I34.val() == '') {
                    obj.setI34(0);
                } else {
                    obj.setI34(parseFloat($(I34).autoNumericGet()));
                }

                //            obj.setD31(parseFloat($(D31).autoNumericGet()));
                //            obj.setD32(parseFloat($(D32).autoNumericGet()));
                //            obj.setD43(parseFloat($(D43).autoNumericGet()));
                //            obj.setI33(parseFloat($(I33).autoNumericGet()));
                //            obj.setI34(parseFloat($(I34).autoNumericGet()));

                N10.autoNumericSet(obj.N10());
                N10.change();

            });

            //  END  N10  หนี้สินหมุนเวียน Bay 

            //  N11  หนี้สินหมุนเวียนอื่น ๆ 

            N11.click(function () {
                OTHER_CURRENT_LIABILITY_CAL_EL.addClass('yellowBG');
            }).blur(function () {
                OTHER_CURRENT_LIABILITY_CAL_EL.removeClass('yellowBG');
            }).keydown(function () {
                $(this).blur();
            });

            OTHER_CURRENT_LIABILITY_CAL_EL.change(function () {
                if (D32.val() == '') {
                    obj.setD32(0);
                } else {
                    obj.setD32(parseFloat($(D32).autoNumericGet()));
                }
                if (D33.val() == '') {
                    obj.setD33(0);
                } else {
                    obj.setD33(parseFloat($(D33).autoNumericGet()));
                }
                if (D43.val() == '') {
                    obj.setD43(0);
                } else {
                    obj.setD43(parseFloat($(D43).autoNumericGet()));
                }
                if (I33.val() == '' || I33.val() == null) {
                    obj.setI33(0);
                } else {
                    obj.setI33(parseFloat($(I33).autoNumericGet()));
                }
                if (I34.val() == '' || I34.val() == null) {
                    obj.setI34(0);
                } else {
                    obj.setI34(parseFloat($(I34).autoNumericGet()));
                }
                N11.autoNumericSet(obj.N11());
                N11.change();

            });

            // END  N11  หนี้สินหมุนเวียนอื่น ๆ 

            //  N13  รวมหนี้สินหมุนเวียน 

            N13.click(function () {
                TOTAL_CURRENT_LIABILITY_CAL_EL.addClass('yellowBG');
            }).blur(function () {
                TOTAL_CURRENT_LIABILITY_CAL_EL.removeClass('yellowBG');
            }).keydown(function () {
                $(this).blur();
            });

            $(TOTAL_CURRENT_LIABILITY_CAL_EL).change(function () {
                var checkErr = false;
                $.each(TOTAL_CURRENT_LIABILITY_CAL_EL, function (i, ele) {
                    if ($(ele).val() == '') { checkErr = true; }
                });

                if (checkErr == false) {
                    N13.autoNumericSet(obj.N13());
                    N13.change();
                }
            });

            //  END  N13  รวมหนี้สินหมุนเวียน 

            //  N15  หนี้สินระยะยาว Bay 

            N15.click(function () {
                LONG_TERM_LIABILITY_BAY_CAL_EL.addClass('yellowBG');
            }).blur(function () {
                LONG_TERM_LIABILITY_BAY_CAL_EL.removeClass('yellowBG');
            }).keydown(function () {
                $(this).blur();
            });

            LONG_TERM_LIABILITY_BAY_CAL_EL.change(function () {
                if (I34.val() == '') {
                    obj.setI34(0);
                } else {
                    obj.setI34(parseFloat($(I34).autoNumericGet()));
                }
                if (D34.val() == '') {
                    obj.setD34(0);
                } else {
                    obj.setD34(parseFloat($(D34).autoNumericGet()));
                }
                N15.autoNumericSet(obj.N15());
                N15.change();
            });

            //  END N15  หนี้สินระยะยาว Bay 

            //  N16  หนี้สินระยะยาวอื่น ๆ 

            N16.click(function () {
                OTHER_LONG_TERM_LIABILITY_CAL_EL.addClass('yellowBG');
            }).blur(function () {
                OTHER_LONG_TERM_LIABILITY_CAL_EL.removeClass('yellowBG');
            }).keydown(function () {
                $(this).blur();
            });

            OTHER_LONG_TERM_LIABILITY_CAL_EL.change(function () {
                if (D36.val() == '') {
                    obj.setD36(0);
                } else {
                    obj.setD36(parseFloat($(D36).autoNumericGet()));
                }
                if (D38.val() == '') {
                    obj.setD38(0);
                } else {
                    obj.setD38(parseFloat($(D38).autoNumericGet()));
                }
                if (D44.val() == '') {
                    obj.setD44(0);
                } else {
                    obj.setD44(parseFloat($(D44).autoNumericGet()));
                }
                if (I33.val() == '') {
                    obj.setI33(0);
                } else {
                    obj.setI33(parseFloat($(I33).autoNumericGet()));
                }
                if (I34.val() == '') {
                    obj.setI34(0);
                } else {
                    obj.setI34(parseFloat($(I34).autoNumericGet()));
                }
                N16.autoNumericSet(obj.N16());
                N16.change();

            });

            //  END N16  หนี้สินระยะยาวอื่น ๆ 

            //  N18  รวมหนี้สิน 

            N18.click(function () {
                TOTAL_LIABILITY_CAL_EL.addClass('yellowBG');
            }).blur(function () {
                TOTAL_LIABILITY_CAL_EL.removeClass('yellowBG');
            }).keydown(function () {
                $(this).blur();
            });

            TOTAL_LIABILITY_CAL_EL.change(function () {
                var TOTAL_LIABILITY_CAL_EL_ERR = false;
                $.each(TOTAL_LIABILITY_CAL_EL, function (i, ele) {
                    if ($(ele).val() == '') { TOTAL_LIABILITY_CAL_EL_ERR = true; }
                });

                if (TOTAL_LIABILITY_CAL_EL_ERR == false) {
                    N18.autoNumericSet(obj.N18());
                    N18.change();
                }
            });

            //  END N18   รวมหนี้สิน 

            //  N20  เงินกู้ยืมกรรมการ 

            N20.click(function () {
                LOANS_REL_CO_DIRECTORS_CAL_EL.addClass('yellowBG');
            }).blur(function () {
                LOANS_REL_CO_DIRECTORS_CAL_EL.removeClass('yellowBG');
            }).keydown(function () {
                $(this).blur();
            });

            LOANS_REL_CO_DIRECTORS_CAL_EL.change(function () {
                if (D40.val() == '') {
                    obj.setD40(0);
                } else {
                    obj.setD40(parseFloat($(D40).autoNumericGet()));
                }
                N20.autoNumericSet(obj.N20());
                N20.change();

            });

            // END   N20  เงินกู้ยืมกรรมการ 

            //  N21 ทุน 

            N21.click(function () {
                EQUITY_CAL_EL.addClass('yellowBG');
            }).blur(function () {
                EQUITY_CAL_EL.removeClass('yellowBG');
            }).keydown(function () {
                $(this).blur();
            });

            EQUITY_CAL_EL.change(function () {

                N21.autoNumericSet(obj.N21());
                N21.change();
                //}
            });

            // END  N21 ทุน 

            //  N22 รวมหนี้สิน + ทุน 

            N22.click(function () {
                LIABILITY_EQUITY_CAL_EL.addClass('yellowBG');
            }).blur(function () {
                LIABILITY_EQUITY_CAL_EL.removeClass('yellowBG');
            }).keydown(function () {
                $(this).blur();
            });


            LIABILITY_EQUITY_CAL_EL.change(function () {
                var LIABILITY_EQUITY_CAL_EL_ERR = false;
                $.each(LIABILITY_EQUITY_CAL_EL, function (i, ele) {
                    if ($(ele).val() == '') { LIABILITY_EQUITY_CAL_EL_ERR = true; }
                });

                if (LIABILITY_EQUITY_CAL_EL_ERR == false) {
                    N22.autoNumericSet(obj.N22());
                    N22.change();
                }

            });

            //  END  N22 รวมหนี้สิน + ทุน 

            // N30 Working Capital อนุมัติ
            N30.click(function () {
                WORKING_CAPITAL_APPROVE_CAL_EL.addClass('yellowBG');
            }).blur(function () {
                WORKING_CAPITAL_APPROVE_CAL_EL.removeClass('yellowBG');
            }).keydown(function () {
                $(this).blur();
            });

            WORKING_CAPITAL_APPROVE_CAL_EL.change(function () {
                var chkErr = false;
                if (D29.val() == '') {
                    obj.setD29(0);
                } else {
                    obj.setD29(parseFloat($(D29).autoNumericGet()));
                }
                if (D30.val() == '') {
                    obj.setD30(0);
                } else {
                    obj.setD30(parseFloat($(D30).autoNumericGet()));
                }
                if (D35.val() == '') {
                    obj.setD35(0);
                } else {
                    obj.setD35(parseFloat($(D35).autoNumericGet()));
                }
                if (D37.val() == '') {
                    obj.setD37(0);
                } else {
                    obj.setD37(parseFloat($(D37).autoNumericGet()));
                }
                if (D39.val() == '') {
                    obj.setD39(0);
                } else {
                    obj.setD39(parseFloat($(D39).autoNumericGet()));
                }
                if (D45.val() == '') {
                    obj.setD45(0);
                } else {
                    obj.setD45(parseFloat($(D45).autoNumericGet()));
                }
                if (I25.val() == '') {
                    chkErr = true;
                }
                if (I30.val() == '') {
                    chkErr = true;
                }
                if (O35.val() == '') {
                    obj.setO35(0);
                } else {
                    obj.setO35(parseFloat($(O35).autoNumericGet()));
                }
                if (M27.val() == '') {
                    chkErr = true;
                }

                if (N10.val() == '') {
                    chkErr = true;
                }
                if (N11.val() == '') {
                    chkErr = true;
                }

                if (chkErr == false) {
                    N30.autoNumericSet(obj.N30());
                    N30.change();
                }

            });
            //WORKING_CAPITAL_APPROVE_CAL_EL = $("[CELL = 'D35'], [CELL = 'D37'], [CELL = 'D39'], [CELL = 'D43'], [CELL = 'D45'],[CELL = 'I25'],[CELL = 'I30'], [CELL = 'O35'], [CELL = 'M27'] ,[CELL='N10'],[CELL='N11']"); // N30
            // END N30 Working Capital อนุมัติ


            // N31 Working Capital อนุมัติ
            N31.click(function () {
                LOAN_APPROVE_CAL_EL.addClass('yellowBG');
            }).blur(function () {
                LOAN_APPROVE_CAL_EL.removeClass('yellowBG');
            }).keydown(function () {
                $(this).blur();
            });

            LOAN_APPROVE_CAL_EL.change(function () {
                var chkErr = false;
                //  LOAN_APPROVE_CAL_EL = $("[CELL='O34'],[CELL='O35'],[CELL='M27'],[CELL='O27'],[CELL='I25'],[CELL='D31']
                //, [CELL='D32'],[CELL='D33'], [CELL='D35'],[CEL='D37'],[CELL='D39'],[CELL='D43'],[CELL='D45']
                //,[CELL='I33'],[CELL='M33'],[CELL='M34'],[CELL='I34']"); // N31
                if (O34.val() == '') {
                    obj.setO34(0);
                } else {
                    obj.setO34(parseFloat($(O34).autoNumericGet()));
                }
                if (O35.val() == '') {
                    obj.setO35(0);
                } else {
                    obj.setO35(parseFloat($(O35).autoNumericGet()));
                }
                if (M27.val() == '') {
                    chkErr = true;
                }
                if (O27.val() == '') {
                    chkErr = true;
                }
                if (I25.val() == '') {
                    chkErr = true;
                }
                if (D31.val() == '') {
                    obj.setD31(0);
                } else {
                    obj.setD31(parseFloat($(D31).autoNumericGet()));
                }
                if (D32.val() == '') {
                    obj.setD32(0);
                } else {
                    obj.setD32(parseFloat($(D32).autoNumericGet()));
                }
                if (D33.val() == '') {
                    obj.setD33(0);
                } else {
                    obj.setD33(parseFloat($(D33).autoNumericGet()));
                }
                if (D35.val() == '') {
                    obj.setD35(0);
                } else {
                    obj.setD35(parseFloat($(D35).autoNumericGet()));
                }
                if (D37.val() == '') {
                    obj.setD37(0);
                } else {
                    obj.setD37(parseFloat($(D37).autoNumericGet()));
                }
                if (D39.val() == '') {
                    obj.setD39(0);
                } else {
                    obj.setD39(parseFloat($(D39).autoNumericGet()));
                }
                if (D43.val() == '') {
                    obj.setD43(0);
                } else {
                    obj.setD43(parseFloat($(D43).autoNumericGet()));
                }
                if (D45.val() == '') {
                    obj.setD45(0);
                } else {
                    obj.setD45(parseFloat($(D45).autoNumericGet()));
                }
                if (I33.val() == '') {
                    obj.setI33(0);
                } else {
                    obj.setI33(parseFloat($(I33).autoNumericGet()));
                }
                if (I34.val() == '') {
                    obj.setI34(0);
                } else {
                    obj.setI34(parseFloat($(I34).autoNumericGet()));
                }

                if (M33.val() == '') {
                    obj.setM33(0);
                } else {
                    obj.setM33(parseFloat($(M33).autoNumericGet()));
                }
                if (M34.val() == '') {
                    obj.setM34(0);
                } else {
                    obj.setM34(parseFloat($(M34).autoNumericGet()));
                }
                if (O27.val() == '') {
                    obj.setO27(0);
                } else {
                    obj.setO27(parseFloat($(O27).autoNumericGet()));
                }

                if (chkErr == false) {
                    $(N31).autoNumericSet(obj.N31());
                    $(N31).change();
                }
            });
            //  LOAN_APPROVE_CAL_EL = $("[CELL='O34'],[CELL='O35'],[CELL='M27'],[CELL='O27'],[CELL='I25'],[CELL='D31'], [CELL='D32'],[CELL='D33'], [CELL='D35'],[CEL='D37'],[CELL='D39'],[CELL='D43'],[CELL='D45'],[CELL='I33'],[CELL='M33'],[CELL='M34'],[CELL='I34']"); // N31

            // END N31 Working Capital อนุมัติ

            // M35 DSCR ครั้งนี้
            M35.click(function () {
                DSCR_THIS_TIME_EL.addClass('yellowBG');
            }).blur(function () {
                DSCR_THIS_TIME_EL.removeClass('yellowBG');
            }).keydown(function () {
                $(this).blur();
            });
            DSCR_THIS_TIME_EL.change(function () {
                var chkErr = false;
                if (D31.val() == '') {
                    obj.setD31(0);
                } else {
                    obj.setD31(parseFloat($(D31).autoNumericGet()));
                }
                if (D32.val() == '') {
                    obj.setD32(0);
                } else {
                    obj.setD32(parseFloat($(D32).autoNumericGet()));
                }
                if (D33.val() == '') {
                    obj.setD33(0);
                } else {
                    obj.setD33(parseFloat($(D33).autoNumericGet()));
                }
                if (D35.val() == '') {
                    obj.setD35(0);
                } else {
                    obj.setD35(parseFloat($(D35).autoNumericGet()));
                }
                if (D37.val() == '') {
                    obj.setD37(0);
                } else {
                    obj.setD37(parseFloat($(D37).autoNumericGet()));
                }
                if (D39.val() == '') {
                    obj.setD39(0);
                } else {
                    obj.setD39(parseFloat($(D39).autoNumericGet()));
                }
                if (D43.val() == '') {
                    obj.setD43(0);
                } else {
                    obj.setD43(parseFloat($(D43).autoNumericGet()));
                }
                if (D45.val() == '') {
                    obj.setD45(0);
                } else {
                    obj.setD45(parseFloat($(D45).autoNumericGet()));
                }
                if (I25.val() == '') {
                    chkErr = true;
                }
                if (I34.val() == '') {
                    obj.setI34(0);
                } else {
                    obj.setI34(parseFloat($(I34).autoNumericGet()));
                }

                if (M27.val() == '') {
                    chkErr = true;
                }
                if (M33.val() == '') {
                    obj.setM33(0);
                } else {
                    obj.setM33(parseFloat($(M33).autoNumericGet()));
                }
                if (M34.val() == '') {
                    obj.setM34(0);
                } else {
                    obj.setM34(parseFloat($(M34).autoNumericGet()));
                }

                if (chkErr == false) {
                    //alert(obj.M35());
                    M35.autoNumericSet(obj.M35());
                    M35.change();
                }

            });


            // END M35 DSCR ครั้งนี้
            //        DE_THIS_TIME_EL = $("[CELL='N18'],[CELL='N21'],[CELL='N20']");

            // M36  D/E ครั้งนี้ 
            M36.click(function () {
                DE_THIS_TIME_EL.addClass('yellowBG');
            }).blur(function () {
                DE_THIS_TIME_EL.removeClass('yellowBG');
            }).keydown(function () {
                $(this).blur();
            });
            DE_THIS_TIME_EL.change(function () {
                var chkErr = false;
                if (N18.val() == '') {
                    chkErr = true;
                }
                if (N21.val() == '') {
                    chkErr = true;
                }
                if (N20.val() == '') {
                    chkErr = true;
                }

                //            alert('N18' + N18.val());
                //            alert('N20' + N20.val());
                //            alert('N21' + N21.val());

                if (chkErr == false) {
                    //                alert('obj.M36()' + obj.M36());
                    M36.autoNumericSet(obj.M36());
                    M36.change();
                }
            });

            // END M36  D/E ครั้งนี้ 

            // M37  LTV  ครั้งนี้

            M37.click(function () {
                LTV_THIS_TIME_EL.addClass('yellowBG');
            }).blur(function () {
                LTV_THIS_TIME_EL.removeClass('yellowBG');
            }).keydown(function () {
                $(this).blur();
            });
            LTV_THIS_TIME_EL.change(function () {
                var chkErr = false;


                if (D41.val() == '') {
                    obj.setD41(0);
                } else {
                    obj.setD41(parseFloat($(D41).autoNumericGet()));
                }
                if (I35.val() == '') {
                    obj.setI35(0);
                } else {
                    obj.setI35(parseFloat($(I35).autoNumericGet()));
                }
                if (I39.val() == '') {
                    obj.setI39(0);
                } else {
                    obj.setI39(parseFloat($(I39).autoNumericGet()));
                }
                if (I40.val() == '') {
                    obj.setI40(0);
                } else {
                    obj.setI40(parseFloat($(I40).autoNumericGet()));
                }
                if (I41.val() == '') {
                    obj.setI41(0);
                } else {
                    obj.setI41(parseFloat($(I41).autoNumericGet()));
                }
                if (I42.val() == '') {
                    obj.setI42(0);
                } else {
                    obj.setI42(parseFloat($(I42).autoNumericGet()));
                }
                if (I43.val() == '') {
                    obj.setI43(0);
                } else {
                    obj.setI43(parseFloat($(I43).autoNumericGet()));
                }
                if (I44.val() == '') {
                    obj.setI44(0);
                } else {
                    obj.setI44(parseFloat($(I44).autoNumericGet()));
                }

                obj.setI45(0);
                obj.setI46(0);

                if (N10.val() == '') {
                    chkErr = true;
                }
                if (N15.val() == '') {
                    chkErr = true;
                }

                if (chkErr == false) {

                    M37.autoNumericSet(obj.M37() * 100);  // แสดงเป็น %
                    M37.change();
                }
            });
            // END M37  LTV  ครั้งนี้

            //  N40  WORKING_CAPITAL_DEFAULT_EL วงเงินอนุมัติ ตาม default  bay
            N40.click(function () {
                WORKING_CAPITAL_DEFAULT_EL.addClass('yellowBG');
            }).blur(function () {
                WORKING_CAPITAL_DEFAULT_EL.removeClass('yellowBG');
            }).keydown(function () {
                $(this).blur();
            });
            WORKING_CAPITAL_DEFAULT_EL.change(function () {

                if (I30.val() == '') {

                } else {
                    N40.autoNumericSet(obj.N40());
                    N40.change();
                }



            });

            //  END  N40  WORKING_CAPITAL_DEFAULT_EL วงเงินอนุมัติ ตาม default  bay

            //  N41  วงเงินเห็นควรอนุมัติ  Loan maxbay
            N41.click(function () {
                LOAN_DEFAULT_EL.addClass('yellowBG');
            }).blur(function () {
                LOAN_DEFAULT_EL.removeClass('yellowBG');
            }).keydown(function () {
                $(this).blur();
            });
            LOAN_DEFAULT_EL.change(function () {
                //LOAN_DEFAULT_EL = $("[CELL='O35'],[CELL='O27'],[CELL='I25'],[CELL='N40'],[CELL='M27']");  //    N41   วงเงินที่เห้นควรอนุมัติ
                chkErr = false;
                if (O27.val() == '') {
                    obj.setO27(0);
                } else {
                    obj.setO27(parseFloat($(O27).autoNumericGet()));
                }
                if (O35.val() == '') {
                    obj.setO35(0);
                } else {
                    obj.setO35(parseFloat($(O35).autoNumericGet()));
                }
                if (I25.val() == '') {
                    chkErr = true;
                }
                if (N40.val() == '') {
                    chkErr = true;
                }
                if (M27.val() == '') {
                    chkErr = true;
                }
                if (chkErr == false) {
                    N41.autoNumericSet(obj.N41());
                    N41.change();
                }

            });

            //  END  N41 วงเงินเห็นควรอนุมัติ

            //  N43  working cap approve 

            N43.click(function () {
                WORKING_CAPITAL_DEFAULT_APPROVE_EL.addClass('yellowBG');
            }).blur(function () {
                WORKING_CAPITAL_DEFAULT_APPROVE_EL.removeClass('yellowBG');
            }).keydown(function () {
                $(this).blur();
            });
            WORKING_CAPITAL_DEFAULT_APPROVE_EL.change(function () {
                //    WORKING_CAPITAL_DEFAULT_APPROVE_EL = $("[CELL='I25'],[CELL='I44'],[CELL='O35'],[CELL='N11'],[CELL='N15'],[CELL='N40'],[CELL='M27'],[CELL='D35'],[CELL='D37'],[CELL='D39'],[CELL='D41'],[CELL='D45'],[T17]");
                chkErr = false;
                if (I25.val() == '') {

                }
                if (I44.val() == '') {
                    obj.setI44(0);
                } else {
                    obj.setI44(parseFloat($(I44).autoNumericGet()));
                }
                if (O35.val() == '') {
                    obj.setO35(0);
                } else {
                    obj.setO35(parseFloat($(O35).autoNumericGet()));
                }
                if (N11.val() == '') {
                }
                if (N15.val() == '') {
                }
                if (N40.val() == '') {
                    chkErr = true;
                }
                if (M27.val() == '') {
                }
                if (D35.val() == '') {
                    obj.setD35(0);
                } else {
                    obj.setD35(parseFloat($(D35).autoNumericGet()));
                }
                if (D37.val() == '') {
                    obj.setD37(0);
                } else {
                    obj.setD37(parseFloat($(D37).autoNumericGet()));
                }
                if (D39.val() == '') {
                    obj.setD39(0);
                } else {
                    obj.setD39(parseFloat($(D39).autoNumericGet()));
                }
                if (D41.val() == '') {
                    obj.setD41(0);
                } else {
                    obj.setD41(parseFloat($(D41).autoNumericGet()));
                }
                if (D45.val() == '') {
                    obj.setD45(0);
                } else {
                    obj.setD45(parseFloat($(D45).autoNumericGet()));
                }
                if (T17.val() == '') {
                }
                if (chkErr == false) {
                    N43.autoNumericSet(obj.N43());
                    N43.change();
                }
            });

            //  END  N43 วงเงินเห็นควรอนุมัติ

            //  N44  working cap approve 

            N44.click(function () {
                LOAN_DEFAULT_APPROVE_EL.addClass('yellowBG');
            }).blur(function () {
                LOAN_DEFAULT_APPROVE_EL.removeClass('yellowBG');
            }).keydown(function () {
                $(this).blur();
            });
            LOAN_DEFAULT_APPROVE_EL.change(function () {
                // LOAN_DEFAULT_APPROVE_EL = $("[CELL='N10'],[CELL='N15'],[CELL='I35'],[CELL='I44'],[CELL='T17'],[CELL='O37'],[CELL='D41']");  //   N44  วงเงินที่สามารถอนุมัติ
                chkErr = false;
                if (N10.val() == '') {
                    //chkErr = true;
                }
                if (N15.val() == '') {
                    // chkErr = true;
                }
                if (I44.val() == '') {
                    obj.setI44(0);
                } else {
                    obj.setI44(parseFloat($(I44).autoNumericGet()));
                }


                if (D41.val() == '') {
                    obj.setD41(0);
                } else {
                    obj.setD41(parseFloat($(D41).autoNumericGet()));
                }

                if (chkErr == false) {
                    //alert('cal N44')
                    N44.autoNumericSet(obj.N44());
                    N44.change();
                }
            });

            //  END  N44 วงเงินเห็นควรอนุมัติ


            //  T17 total  amount colateral
            T17.click(function () {
                TOTAL_AMOUNT_OF_COLLATERAL_EL.addClass('yellowBG');
            }).blur(function () {
                TOTAL_AMOUNT_OF_COLLATERAL_EL.removeClass('yellowBG');
            }).keydown(function () {
                $(this).blur();
            });
            TOTAL_AMOUNT_OF_COLLATERAL_EL.change(function () {


                var v39 = 1.0; //  Zone A  I39 0.85
                var v40 = 1.0; //  Zone B  I40 0.75
                var v41 = 1.0; //  Zone C  I41  0.60
                var v42 = 1.0; //  Zone D  I42 0.60
                var v43 = 1.0; //  Zone E  I43 0.50

                var v45 = 1.0;
                var v46 = 1.0;

                //var sum;
                if (I39.val() == '') {
                    //   v39 = 0;
                    obj.setI39(0);
                } else {
                    // v39 = parseFloat($(I39).autoNumericGet());
                    obj.setI39(parseFloat($(I39).autoNumericGet() * v39));
                }
                if (I40.val() == '') {
                    //v40 = 0;
                    obj.setI40(0);
                } else {
                    //v40 = parseFloat($(I40).autoNumericGet());
                    obj.setI40(parseFloat($(I40).autoNumericGet() * v40));
                }
                if (I41.val() == '') {
                    //v41 = 0;
                    obj.setI41(0);
                } else {
                    //v41 = parseFloat($(I41).autoNumericGet());
                    obj.setI41(parseFloat($(I41).autoNumericGet() * v41));
                }
                if (I42.val() == '') {
                    //v42 = 0;
                    obj.setI42(0);
                } else {
                    //v42 = parseFloat($(I42).autoNumericGet());
                    obj.setI42(parseFloat($(I42).autoNumericGet() * v42));
                }
                if (I43.val() == '') {
                    //v43 = 0;
                    obj.setI43(0);
                } else {
                    // v43 = parseFloat($(I43).autoNumericGet());
                    obj.setI43(parseFloat($(I43).autoNumericGet() * v43));
                }
                if (I45.val() == '') {
                    obj.setI45(0);
                } else {
                    obj.setI45(parseFloat($(I45).autoNumericGet() * v45));
                }
                if (I46.val() == '') {
                    obj.setI46(0);
                } else {
                    obj.setI46(parseFloat($(I46).autoNumericGet() * v46));
                }

                //sum = v39 + (v40 * (0.9)) + (v41 * (0.8)) + (v42 * (0.7)) + (v43 * (0.6));
                T17.autoNumericSet(obj.T17());
                T17.change();
            });
            // END T17 total amont colateral
            // R44
            TEMP_CAL_LOAN_MAX_CAN_APPROVE_EL.change(function () {
                //   TEMP_CAL_LOAN_MAX_CAN_APPROVE_EL = $("[CELL='D35'],[CELL='D37'],[CELL='D39'],[CELL='D45'],[CELL='O35'],[CELL='M27'],[CELL='M33'],[CELL='M34'],[CELL='O27'],[CELL='O34'],[CELL='O35'],[CELL='N10'],[CELL='N11'],[CELL='I33'],[CELL='I34']");
                var chkErr = false;
                if (D35.val() == '') {
                    obj.setD35(0);
                } else {
                    obj.setD35(parseFloat($(D35).autoNumericGet()));
                }
                if (D37.val() == '') {
                    obj.setD37(0);
                } else {
                    obj.setD37(parseFloat($(D37).autoNumericGet()));
                }
                if (D39.val() == '') {
                    obj.setD39(0);
                } else {
                    obj.setD39(parseFloat($(D39).autoNumericGet()));
                }
                if (D45.val() == '') {
                    obj.setD45(0);
                } else {
                    obj.setD45(parseFloat($(D45).autoNumericGet()));
                }
                if (O35.val() == '') {
                    obj.setO35(0);
                } else {
                    obj.setO35(parseFloat($(O35).autoNumericGet()));
                }

                if (M27.val() == '') {
                    chkErr = true;
                }
                if (M33.val() == '') {
                    obj.setM33(0);
                } else {
                    obj.setM33(parseFloat($(M33).autoNumericGet()));
                }
                if (M34.val() == '') {
                    obj.setM34(0);
                } else {
                    obj.setM34(parseFloat($(M34).autoNumericGet()));
                }
                if (O27.val() == '') {
                    obj.setO27(0);
                } else {
                    obj.setO27(parseFloat($(O27).autoNumericGet()));
                }
                if (O34.val() == '') {
                    obj.setO34(0);
                } else {
                    obj.setO34(parseFloat($(O34).autoNumericGet()));
                }
                if (O35.val() == '') {
                    obj.setO35(0);
                } else {
                    obj.setO35(parseFloat($(O35).autoNumericGet()));
                }
                if (N10.val() == '') {
                    chkErr = true;
                }
                if (N11.val() == '') {
                    chkErr = true;
                }
                if (I33.val() == '') {
                    obj.setI33(0);
                } else {
                    obj.setI33(parseFloat($(I33).autoNumericGet()));
                }
                if (I34.val() == '') {
                    obj.setI34(0);
                } else {
                    obj.setI34(parseFloat($(I34).autoNumericGet()));
                }

            });

            // END R44

            // Begin COST_OF_SALESTextBox

            COST_OF_SALESTextBox.change(function () {
                //  alert(parseFloat(D8.autoNumericGet()));
                //  alert(parseFloat($(this).autoNumericGet()));
                var value = parseFloat($(this).autoNumericGet());
                if (value > D8.autoNumericGet()) {
                    $(this).autoNumericSet(D8.autoNumericGet());
                    COST_OF_SALES_PERCENTTextBox.val(100);
                } else {
                    var per = (value / parseFloat(D8.autoNumericGet())) * 100
                    COST_OF_SALES_PERCENTTextBox.autoNumericSet(per);
                }

            });
            // End COST_OF_SALESTextBox
            // Begin COST_OF_SALESTextBox
            COST_OF_SALES_PERCENTTextBox.change(function () {
                //  alert(parseFloat(D8.autoNumericGet()));
                //  alert(parseFloat($(this).autoNumericGet()));
                var value = (parseFloat(D8.autoNumericGet()) * parseFloat($(this).autoNumericGet())) / 100
                COST_OF_SALESTextBox.autoNumericSet(value);
            });
            // End COST_OF_SALESTextBox
            // begin  OPERATING_EXPENSESTextBox

            OPERATING_EXPENSESTextBox.change(function () {
                var value = parseFloat($(this).autoNumericGet());
                if (value > D8.autoNumericGet()) {
                    $(this).autoNumericSet(D8.autoNumericGet());
                    OPERATING_EXPENSES_PERCENTTextBox.val(100);
                } else {
                    var per = (value / parseFloat(D8.autoNumericGet())) * 100
                    OPERATING_EXPENSES_PERCENTTextBox.autoNumericSet(per);
                }
            });
            OPERATING_EXPENSES_PERCENTTextBox.change(function () {
                var value = (parseFloat(D8.autoNumericGet()) * parseFloat($(this).autoNumericGet())) / 100
                OPERATING_EXPENSESTextBox.autoNumericSet(value);
            });
            // END  / OPERATING_EXPENSESTextBox

            DX07.click(function () {
                OTHER_FIXED_ASSETS_OTHER_BANK_CAL_EL.addClass('yellowBG');
            }).blur(function () {
                OTHER_FIXED_ASSETS_OTHER_BANK_CAL_EL.removeClass('yellowBG');
            }).keydown(function () {
                $(this).blur();
            });
            OTHER_FIXED_ASSETS_OTHER_BANK_CAL_EL.change(function () {
                if (DX06.val() == '') {
                    obj.setDX06(0);
                } else {
                    obj.setDX06(parseFloat($(DX06).autoNumericGet()));
                }
                DX07.autoNumericSet(obj.DX07());
                DX07.change();
            });


            setAllObjValue();


        });                                                                                                            // end document ready

        function maxD8() {
            return D8.autoNumericGet()
        }
        function changeVarFromTable() {
            //$("#BUSINESS_ID_TABLETextBox")[0].value);
            //$("#BUSINESS_NAME_TABLETextBox")[0].value 
            //$("#BUSINESS_GROUP_TABLETextBox")[0].value 
            //$("#MARGIN_TABLETextBox")[0].value; 
            //$("#DSCR_TABLETextBox")[0].value

            obj.setF10(parseFloat($("#AR_TABLETextBox").autoNumericGet()));
            obj.setF21(parseFloat($("#STOCK_TABLETextBox").autoNumericGet()));
            obj.setRATE(parseFloat($("#RATE_TABLETextBox").autoNumericGet()));
            obj.setO35(parseFloat($("#DSCR_TABLETextBox").autoNumericGet()));
            obj.setO37(parseFloat($("#LTV_TABLETextBox").autoNumericGet()));
            //  $(F10).change();;
            //  $(F15).change();;
            //  $(F21).change();;

            $(F10).val($("#AR_TABLETextBox").val());
            $(F10).change();
            $(D16).val(Math.round($("#MARGIN_TABLETextBox")[0].value * 100));
            $(D16).change();
            $(O27).val($("#CONTRACT_TABLETextBox")[0].value); // เขียนแบบนี้ได้ [0] เป็น object ตัวที่ 0
            $(O27).change();
            $(O35).val($("#DSCR_TABLETextBox").val());
            $(O35).change();
            $(O37).autoNumericSet($("#LTV_TABLETextBox").val() * 100);
            $(O37).change();

            //$("#LTV_TABLETextBox")[0].value

            $("#WORKING_CAPITAL_TABLETextBox").change();
            //$("#RATE_TABLETextBox")[0].value
            //$("#CONTRACT_TABLETextBox")[0].value

            //alert(O35.val());
        }
    </script>
    <script type="text/javascript">
        function setAllObjValue() {
            // กรณีเป็นการ update ให้ใส่ค่าให้ object

            // กรณีที่ มีการกดปุ่ม import ข้อมูลจาก rm กำหนดให้  textbox ที่ทำไว้เก็บค่ามี่ค่า = 0 ตอนกด import
            // กรณีนี้ไม่ต้อง clear ค่า input

            // กำหนดให้หน้านี้ไม่ใช้ table default จากระบบ 1=ใช้,0=ไม่ใช้
            obj.setUSE_TABLE(0);
            //----

            if ($("#SMES_DATA_IDTextBox").val() != '' || $("#ClearInputTextBox").val() == '0') {

                if (D28.val() == '') {
                    obj.setD28(0);
                } else {
                    obj.setD28(parseFloat($(D28).autoNumericGet()));
                }
                if (I35.val() == '') {
                    obj.setI35(0);
                } else {
                    obj.setI35(parseFloat($(I35).autoNumericGet()));
                }
                if (I36.val() == '') {
                    obj.setI36(0);
                } else {
                    obj.setI36(parseFloat($(I36).autoNumericGet()));
                }
                if (I37.val() == '') {
                    obj.setI37(0);
                } else {
                    obj.setI37(parseFloat($(I37).autoNumericGet()));
                }
                if (I39.val() == '') {
                    obj.setI39(0);
                } else {
                    obj.setI39(parseFloat($(I39).autoNumericGet()));
                }
                if (I40.val() == '') {
                    obj.setI40(0);
                } else {
                    obj.setI40(parseFloat($(I40).autoNumericGet()));
                }
                if (I41.val() == '') {
                    obj.setI41(0);
                } else {
                    obj.setI41(parseFloat($(I41).autoNumericGet()));
                }
                if (I42.val() == '') {
                    obj.setI42(0);
                } else {
                    obj.setI42(parseFloat($(I42).autoNumericGet()));
                }
                if (I43.val() == '') {
                    obj.setI43(0);
                } else {
                    obj.setI43(parseFloat($(I43).autoNumericGet()));
                }

                if (I45.val() == '') {
                    obj.setI45(0);
                } else {
                    obj.setI45(parseFloat($(I45).autoNumericGet()));
                }
                if (I46.val() == '') {
                    obj.setI46(0);
                } else {
                    obj.setI46(parseFloat($(I46).autoNumericGet()));
                }


                if (D8.val() == '') {
                    obj.setD8(0);
                } else {
                    obj.setD8(parseFloat($(D8).autoNumericGet()));
                }
                if (D9.val() == '') {
                    obj.setD9(0);
                } else {
                    obj.setD9(parseFloat($(D9).autoNumericGet()));
                }
                if (D10.val() == '') {
                    obj.setD10(0);
                } else {
                    obj.setD10(parseFloat($(D10).autoNumericGet()));
                }
                if (D13.val() == '') {
                    obj.setD13(0);
                } else {
                    obj.setD13(parseFloat($(D13).autoNumericGet()));
                }
                if (D14.val() == '') {
                    obj.setD14(0);
                } else {
                    obj.setD14(parseFloat($(D14).autoNumericGet()));
                }
                if (D15.val() == '') {
                    obj.setD15(0);
                } else {
                    obj.setD15(parseFloat($(D15).autoNumericGet()));
                }
                if (D16.val() == '') {
                    obj.setD16(0);
                } else {
                    obj.setD16(parseFloat($(D16).autoNumericGet()));
                }
                if (D17.val() == '') {
                    obj.setD17(0);
                } else {
                    obj.setD17(parseFloat($(D17).autoNumericGet()));
                }

                if (D20.val() == '') {
                    obj.setD20(0);
                } else {
                    obj.setD20(parseFloat($(D20).autoNumericGet()));
                }
                if (D21.val() == '') {
                    obj.setD21(0);
                } else {
                    obj.setD21(parseFloat($(D21).autoNumericGet()));
                }

                if (D24.val() == '') {
                    obj.setD24(0);
                } else {
                    obj.setD24(parseFloat($(D24).autoNumericGet()));
                }

                if (D25.val() == '') {
                    obj.setD25(0);
                } else {
                    obj.setD25(parseFloat($(D25).autoNumericGet()));
                }
                if (D26.val() == '') {
                    obj.setD26(0);
                } else {
                    obj.setD26(parseFloat($(D26).autoNumericGet()));
                }
                if (D27.val() == '') {
                    obj.setD27(0);
                } else {
                    obj.setD27(parseFloat($(D27).autoNumericGet()));
                }
                if (D29.val() == '') {
                    obj.setD29(0);
                } else {
                    obj.setD29(parseFloat($(D29).autoNumericGet()));
                }
                if (D30.val() == '') {
                    obj.setD30(0);
                } else {
                    obj.setD30(parseFloat($(D30).autoNumericGet()));
                }
                if (D31.val() == '') {
                    obj.setD31(0);
                } else {
                    obj.setD31(parseFloat($(D31).autoNumericGet()));
                }
                if (D32.val() == '') {
                    obj.setD32(0);
                } else {
                    obj.setD32(parseFloat($(D32).autoNumericGet()));
                }
                if (D33.val() == '') {
                    obj.setD33(0);
                } else {
                    obj.setD33(parseFloat($(D33).autoNumericGet()));
                }
                if (D34.val() == '') {
                    obj.setD34(0);
                } else {
                    obj.setD34(parseFloat($(D34).autoNumericGet()));
                }
                if (D35.val() == '') {
                    obj.setD35(0);
                } else {
                    obj.setD35(parseFloat($(D35).autoNumericGet()));
                }
                if (D36.val() == '') {
                    obj.setD36(0);
                } else {
                    obj.setD36(parseFloat($(D36).autoNumericGet()));
                }
                if (D37.val() == '') {
                    obj.setD37(0);
                } else {
                    obj.setD37(parseFloat($(D37).autoNumericGet()));
                }
                if (D38.val() == '') {
                    obj.setD38(0);
                } else {
                    obj.setD38(parseFloat($(D38).autoNumericGet()));
                }
                if (D39.val() == '') {
                    obj.setD39(0);
                } else {
                    obj.setD39(parseFloat($(D39).autoNumericGet()));
                }
                if (D40.val() == '') {
                    obj.setD40(0);
                } else {
                    obj.setD40(parseFloat($(D40).autoNumericGet()));
                }
                if (D41.val() == '') {
                    obj.setD41(0);
                } else {
                    obj.setD41(parseFloat($(D41).autoNumericGet()));
                }
                if (D43.val() == '') {
                    obj.setD43(0);
                } else {
                    obj.setD43(parseFloat($(D43).autoNumericGet()));
                }
                if (D44.val() == '') {
                    obj.setD44(0);
                } else {
                    obj.setD44(parseFloat($(D44).autoNumericGet()));
                }
                if (D45.val() == '') {
                    obj.setD45(0);
                } else {
                    obj.setD45(parseFloat($(D45).autoNumericGet()));
                }
                if (D13.val() == '') {
                    obj.setD13(0);
                } else {
                    obj.setD13(parseFloat($(D13).autoNumericGet()));
                }
                if (F10.val() == '') {
                    obj.setF10(0);
                } else {
                    obj.setF10(parseFloat($(F10).autoNumericGet()));
                }
                if (F15.val() == '') {
                    obj.setF15(0);
                } else {
                    obj.setF15(parseFloat($(F15).autoNumericGet()));
                }
                if (F21.val() == '') {
                    obj.setF21(0);
                } else {
                    obj.setF21(parseFloat($(F21).autoNumericGet()));
                }
                if (RATE_TABLE.val() == '') {
                    obj.setRATE(0);
                } else {
                    obj.setRATE(parseFloat($(RATE_TABLE).autoNumericGet()));
                }
                if (WORKING_CAPITAL_TABLE.val() == '') {
                    obj.setWORKING_CAPITAL(0);
                } else {
                    obj.setWORKING_CAPITAL(parseFloat($(WORKING_CAPITAL_TABLE).autoNumericGet()));
                }

                if (I33.val() == '') {
                    obj.setI33(0);
                } else {
                    obj.setI33(parseFloat($(I33).autoNumericGet()));
                }
                if (I34.val() == '') {
                    obj.setI34(0);
                } else {
                    obj.setI34(parseFloat($(I34).autoNumericGet()));
                }
                if (M25.val() == '') {
                    obj.setM25(0);
                } else {
                    obj.setM25(parseFloat($(M25).autoNumericGet()));
                }
                if (M33.val() == '') {
                    obj.setM33(0);
                } else {
                    obj.setM33(parseFloat($(M33).autoNumericGet()));
                }
                if (M34.val() == '') {
                    obj.setM34(0);
                } else {
                    obj.setM34(parseFloat($(M34).autoNumericGet()));
                }
                if (O27.val() == '') {
                    obj.setO27(0);
                } else {
                    obj.setO27(parseFloat($(O27).autoNumericGet()));
                }
                if (O35.val() == '') {
                    obj.setO35(0);
                } else {
                    obj.setO35(parseFloat($(O35).autoNumericGet()));
                }
                if (O34.val() == '') {
                    obj.setO34(0);
                } else {
                    obj.setO34(parseFloat($(O34).autoNumericGet()));
                }
                if (O37.val() == '') {
                    obj.setO37(0);
                } else {
                    obj.setO37(parseFloat(LTV_TABLE.autoNumericGet())); // นำค่าจากตารางแทนเพราะจะใช้ o37 แสดงเป็น %
                }
                if (DX06.val() == '') {
                    obj.setDX06(0);
                } else {
                    obj.setDX06(parseFloat($(DX06).autoNumericGet()));
                }
                if (CURRENT_ASSET_OTHERTextBox.val() == '') {
                    obj.setCURRENT_ASSET_OTHER(0);
                } else {
                    obj.setCURRENT_ASSET_OTHER(parseFloat(CURRENT_ASSET_OTHERTextBox.autoNumericGet()));
                }


            } //  if SMES_IDTextBox <> ''
            else {

                // ถ้าเป็นการเพิ่มข้อมูลใหม่กำหนดให้มีค่าเริ่มต้นเป็น 0

                obj.setD28(0);
                obj.setI33(0);
                obj.setI34(0);
                obj.setI35(0);
                obj.setI36(0);
                obj.setI37(0);
                obj.setI39(0);
                obj.setI40(0);
                obj.setI41(0);
                obj.setI42(0);
                obj.setI43(0);
                obj.setI44(0);
                obj.setI45(0);
                obj.setI46(0);
  
                obj.setD8(0);
                obj.setD9(0);
                obj.setD10(0);
                obj.setD13(0);
                obj.setD14(0);
                obj.setD15(0);
                obj.setD16(0);
                obj.setD17(0);
                obj.setD20(0);
                obj.setD21(0);
                obj.setD24(0);
                obj.setD25(0);
                obj.setD26(0);
                obj.setD27(0);
                obj.setD29(0);
                obj.setD30(0);
                obj.setD31(0);
                obj.setD32(0);
                obj.setD33(0);
                obj.setD34(0);
                obj.setD35(0);
                obj.setD36(0);
                obj.setD37(0);
                obj.setD38(0);
                obj.setD39(0);
                obj.setD40(0);
                obj.setD41(0);
                obj.setD43(0);
                obj.setD44(0);
                obj.setD45(0);
                obj.setD13(0);
                obj.setF10(0);
                obj.setF15(0);
                obj.setF21(0);
                obj.setI33(0);
                obj.setI34(0);
                obj.setM25(0);
                obj.setM33(0);
                obj.setM34(0);
                obj.setO27(0);
                obj.setO35(0);
                obj.setO34(0);
                obj.setO37(0);
                obj.setDX06(0);
                obj.setCURRENT_ASSET_OTHER(0);

                obj.setRATE(0);
                obj.setWORKING_CAPITAL(0);
       

                INPUT_EL.val(0); // กำหนดให้ filed input default เป็น 0
                CALCULATE_EL.val(0); // // กำหนดให้ filed calculate default เป็น 0


                
                H25.val(100);
                // *** สำคัญ***  ค่า rate default ในตาราง ถ้าเป็น 8% จะต้องเก็บเป็น 0.08
                D29.val(RATE_TABLE.val() * 100); // กำหนดให้อัตราดอกเบี้ยเริ่มต้นมี่ค่าเท่ากับ default

                M27.val(D29.val());
                M33.val(RATE_TABLE.val() * 100); // กำหนดให้อัตราดอกเบี้ยเริ่มต้นมี่ค่าเท่ากับ default
                M34.val(RATE_TABLE.val() * 100); // กำหนดให้อัตราดอกเบี้ยเริ่มต้นมี่ค่าเท่ากับ default
                O34.val(CONTRACT_TABLE.val());

                $("#OWNERS_EQUITY_PERCENT_INPUTTextBox").val(0);

                //            MARGIN_TABLE = $("#MARGIN_TABLEtBox");
                //            DSCR_TABLE = $("#DSCR_TABLETextBox");
                //            AP_TABLE = $("#AP_TABLETextBox");
                //            AR_TABLE = $("#AR_TABLETextBox");
                //            STOCK_TABLE = $("#STOCK_TABLETextBox");
                //            LTV_TABLE = $("#LTV_TABLETextBox");
                //            WORKING_CAPITAL_TABLE = $("#WORKING_CAPITAL_TABLETextBox");
                //            RATE_TABLE = $("#RATE_TABLETextBox");
                //            CONTRACT_TABLE = $("#CONTRACT_TABLETextBox");

                obj.setF10(parseFloat(AR_TABLE.autoNumericGet()));
                obj.setF21(parseFloat(STOCK_TABLE.autoNumericGet()));
                obj.setRATE(parseFloat(RATE_TABLE.autoNumericGet()));
                obj.setO35(parseFloat(DSCR_TABLE.autoNumericGet()));
                obj.setO37(parseFloat(LTV_TABLE.autoNumericGet()));
                obj.setO27(parseFloat(CONTRACT_TABLE.autoNumericGet()));

                F10.val(AR_TABLE.val());
                D16.val(Math.round(MARGIN_TABLE.val() * 100));
                //alert(MARGIN_TABLE.val());
                O27.val(CONTRACT_TABLE.val());
                O35.val(DSCR_TABLE.val());
                O37.autoNumericSet(LTV_TABLE.val() * 100);



            }
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

            $(window).bind('beforeunload', function () {

                if (changeValue == true) {
                    // setTimeout(userDidNotLeave, 10);
                    return "คุณได้เปลี่ยนแปลงข้อมูลในหน้านี้  \n ต้องการออกจากหน้านี้หรือไม่";
                }
            });

            $("#ClearInputTextBox").hide();

        });


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
                height: "auto !important",
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
                position: [350, 940],
                modal: "true",
                height: "auto !important",
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

            bValid = bValid && checkZero(D8, "ยอดขาย");
            bValid = bValid && checkZero(D13, "ยอดซื้อ");

            if (D9.autoNumericGet() > 0) {
                bValid = bValid && checkZero(D10, "ระยะเวลาให้เครดิต");
            }
            if (D14.autoNumericGet() > 0) {
                bValid = bValid && checkZero(D15, "ระยะเวลาได้เครดิต");
            }

            if (D34.autoNumericGet() > 0) {
                bValid = bValid && checkZero(D35, "ภาระผ่อนชำระต่อเดือน");
            }
            if (D36.autoNumericGet() > 0) {
                bValid = bValid && checkZero(D37, "ภาระผ่อนชำระต่อเดือน");
            }
            if (D38.autoNumericGet() > 0) {
                bValid = bValid && checkZero(D39, "ภาระผ่อนชำระต่อเดือน");
            }
            if (D44.autoNumericGet() > 0) {
                bValid = bValid && checkZero(D45, " ภาระการผ่อนหนี้ Loan ที่ Refinance ");
            }
            if (I33.autoNumericGet() > 0) {
                bValid = bValid && checkZero(M33, "อัตราดอกเบี้ย Working cap");
            }
            if (I34.autoNumericGet() > 0) {
                bValid = bValid && checkZero(M34, "อัตราดอกเบี้ย Loan");
            }
            if (I34.autoNumericGet() > 0) {
                bValid = bValid && checkZero(O34, "อายุสัญญา Loan");
            }
            // if (D32.autoNumericGet() != '' && D33.autoNumericGet() != '') {
            //                alert('ว่าง');
            //                alert(parseFloat(D43.autoNumericGet()));
            //                alert(parseFloat(D43.autoNumericGet()) > parseFloat(D32.autoNumericGet()) + parseFloat(D33.autoNumericGet()));

            if (parseFloat(D43.autoNumericGet()) > parseFloat(D32.autoNumericGet()) + parseFloat(D33.autoNumericGet())) {
                bValid = false;
                showErrorDialog('Refinance working capital มีค่ามากเกินไป');
            }
            if (parseFloat(D44.autoNumericGet()) > parseFloat(D36.autoNumericGet()) + parseFloat(D38.autoNumericGet())) {
                bValid = false;
                showErrorDialog('Refinance Loan มีค่ามากเกินไป');
            }
            if (parseFloat(D45.autoNumericGet()) > parseFloat(D44.autoNumericGet())) {
                bValid = false;
                showErrorDialog('ภาระการผ่อนหนี้ Loan มีค่ามากกว่า Refinance Loan');
            }
            if (parseFloat(D45.autoNumericGet()) > parseFloat(D37.autoNumericGet()) + parseFloat(D39.autoNumericGet())) {
                bValid = false;
                showErrorDialog('ภาระการผ่อนหนี้ Loan มีค่ามากกว่า ภาระผ่อนรายเดือน');
            }

            //}

            //        bValid = bValid && checkRegexp(name, /^[a-z]([0-9a-z_])+$/i, "Username may consist of a-z, 0-9, underscores, begin with a letter.");
            //         bValid = bValid && checkRegexp(email, /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i, "eg. ui@jquery.com");
            //        bValid = bValid && checkRegexp(password, /^([0-9a-zA-Z])+$/, "Password field only allow : a-z 0-9");

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
        <div id="toggle-view">
            <table style="">
                <tr>
                    <td class="style4">
                        <span id="buslabel">ประเภทธุรกิจ </span>&nbsp
                    </td>
                    <td>
                        <asp:TextBox ID="BUSINESS_ID_TABLETextBox" ToolTip="รหัสธุรกิจ" runat="server" Width="100" /><asp:TextBox
                            ID="BUSINESS_NAME_TABLETextBox" ToolTip="ประเภทธุรกิจ" runat="server" Width="250" />
                    </td>
                    <td>
                        กลุ่มธุรกิจ&nbsp;
                    </td>
                    <td>
                        <asp:TextBox ID="BUSINESS_GROUP_TABLETextBox" ToolTip="กลุ่มธุรกิจ" runat="server"
                            Width="200" />
                    </td>
                </tr>
            </table>
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
                    <td>
                        AP Table
                    </td>
                    <td>
                        <asp:TextBox ID="AP_TABLETextBox" runat="server" ToolTip="AP" CELL="AP_TABLE" />
                    </td>
                    <td>
                        AR Table
                    </td>
                    <td>
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
            </table>
        </div>
    </div>
    <div id="main">
        <div id="tab1">
            <table>
                <tr>
                    <td class="style35">
                        <span class="ui-state-highlight"><strong>สมมุติฐานงบการเงิน</strong></span>
                    </td>
                    <td class="style9">
                        &nbsp;
                    </td>
                    <td class="style37">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style35">
                        <strong>ยอดขายเฉลี่ยต่อเดือน</strong>
                    </td>
                    <td class="style9">
                        &nbsp;
                    </td>
                    <td class="style37">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style35">
                        ยอดขาย
                    </td>
                    <td class="style9">
                        <asp:TextBox ID="SALESTextBox" ToolTip="D8: ยอดขาย" CELL="D8" runat="server" Width="85px" />
                    </td>
                    <td class="style37">
                        บาท/เดือน
                    </td>
                </tr>
                <tr>
                    <td class="style6">
                        -หักต้นทุนขาย
                    </td>
                    <td class="style9">
                        <asp:TextBox ID="COST_OF_SALESTextBox" ToolTip="DX01: หักต้นทุนขาย" runat="server"
                            Width="85px" />
                    </td>
                    <td class="style37">
                        บาท
                        <asp:TextBox ID="COST_OF_SALES_PERCENTTextBox" ToolTip="DX02: หักต้นทุนขาย" runat="server"
                            Width="50px" />%
                    </td>
                </tr>
                <tr>
                    <td class="style6">
                        ขายเชื่อ
                    </td>
                    <td class="style9">
                        <asp:TextBox ID="CREDIT_SALETextBox" ToolTip="D9: ขายเชื่อ" CELL="D9" runat="server"
                            Width="85px" Text='<%# Bind("CREDIT_SALE") %>' />
                    </td>
                    <td class="style37">
                        % ของยอดขาย
                    </td>
                </tr>
                <tr>
                    <td class="style6">
                        ระยะเวลาให้เครดิต
                    </td>
                    <td class="style9">
                        <asp:TextBox ID="CREDIT_TERMTextBox" runat="server" class="auto" ToolTip="D10: ระยะเวลาให้เครดิต"
                            Width="85px" CELL="D10" Text='<%# Bind("CREDIT_TERM") %>' />
                    </td>
                    <td class="style37">
                        วัน
                    </td>
                </tr>
                <tr>
                    <td class="style36">
                        <strong>ยอดซื้อเฉลี่ยต่อเดือน</strong>
                    </td>
                    <td class="style3">
                        &nbsp;
                    </td>
                    <td class="style3">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style36">
                        ยอดซื้อ
                    </td>
                    <td class="style3">
                        <asp:TextBox ID="PURCHASETextBox" ToolTip="D13: ยอดซื้อ" CELL="D13" runat="server"
                            Width="85px" />
                    </td>
                    <td class="style3">
                        บาท/เดือน
                    </td>
                </tr>
                <tr>
                    <td class="style38">
                        ซื้อเชื่อ
                    </td>
                    <td class="style9">
                        <asp:TextBox ID="CREDIT_PURCHASETextBox" ToolTip="D14: ซื้อเชื่อ" CELL="D14" runat="server"
                            Width="85px" />
                    </td>
                    <td class="style3">
                        % ของยอดซื้อ
                    </td>
                </tr>
                <tr>
                    <td class="style38">
                        ระยะเวลาได้เครดิต
                    </td>
                    <td class="style9">
                        <asp:TextBox ID="TERM_PURCHASETextBox" ToolTip="D15: ระยะเวลาได้เครดิต" CELL="D15"
                            Width="85px" runat="server" />
                    </td>
                    <td class="style3">
                        วัน
                    </td>
                </tr>
                <tr>
                    <td class="style6">
                        -หักค่าใช้จ่ายในการดำเนินงาน
                    </td>
                    <td class="style9">
                        <asp:TextBox ID="OPERATING_EXPENSESTextBox" ToolTip="DX03:หักค่าใช้จ่ายในการดำเนินงาน "
                            CELL="DX03" Width="85px" runat="server" />
                    </td>
                    <td class="style37">
                        บาท
                        <asp:TextBox ID="OPERATING_EXPENSES_PERCENTTextBox" ToolTip="DX04:หัก % ค่าใช้จ่ายในการดำเนินงาน "
                            Width="50px" runat="server" />%
                    </td>
                </tr>
                <tr>
                    <td class="style6">
                        &nbsp;
                    </td>
                    <td class="style9">
                    </td>
                    <td class="style37">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style6">
                        กำไรจากการดำเนินงาน
                    </td>
                    <td class="style9">
                        <asp:TextBox ID="GROSS_PROFITTextBox" ToolTip="D17: กำไรจากการดำเนินงาน" CELL="D17"
                            Width="85px" runat="server" Text='<%# Bind("GROSS_PROFIT") %>' />
                    </td>
                    <td class="style37">
                        % ของยอดขาย
                    </td>
                </tr>
                <tr>
                    <td class="style6">
                        TAX
                    </td>
                    <td class="style9">
                        <asp:TextBox ID="TAXTextBox" ToolTip="DX05: TAX" Width="85px" runat="server" />
                    </td>
                    <td class="style37">
                        บาท
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
                        สต๊อกสินค้าจากการมองเห็น / ภาพถ่าย
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
                        สินทรัพย์ถาวรที่จำนอง<br />
                        สถาบันการเงินอื่นๆ
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
                        สินทรัพย์ถาวรอื่น ๆ&nbsp;
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
                        หนี้สินระยะยาวกับ<br />
                        สถาบันการเงินอื่น (เกิน 1 ปี)
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
                <tr>
                    <td class="style6" colspan="3">
                        <strong>เฉพาะการขออนุัมัติครั้งนี้มีการ Refinance </strong>
                        &nbsp;
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style6">
                        Refinance Working Capital 
                        <br />
                        จากสถาบันอื่น
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
                        CBD : Core Asset
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
                        CBD : Non Core Asset</td>
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
                        CBD : Land</td>
                    <td class="style9">
                        <asp:TextBox ID="APPRAISAL_VALUE_ZONE_CTextBox" ToolTip="I41: ราคาประเมินหลักทรัพย์ Zone C"
                            Width="85px" CELL="I41" runat="server" />
                    </td>
                    <td class="style37">
                        บาท
                    </td>
                </tr>
                <tr>
                    <td class="style35">
                        Not CBD :Core Asset
                    </td>
                    <td class="style9">
                        <asp:TextBox ID="APPRAISAL_VALUE_ZONE_DTextBox" ToolTip="I42: ราคาประเมินหลักทรัพย์ Zone D"
                            Width="85px" CELL="I42" runat="server"  />
                    </td>
                    <td class="style37">
                        บาท
                    </td>
                </tr>
                <tr>
                    <td class="style35">
                        Not CBD :Non Core Asset</td>
                    <td class="style9">
                        <asp:TextBox ID="APPRAISAL_VALUE_ZONE_ETextBox" ToolTip="I43: ราคาประเมินหลักทรัพย์ Zone E"
                            Width="85px" CELL="I43" runat="server"/>
                    </td>
                    <td class="style37">
                        บาท
                    </td>
                </tr>
                <tr>
                    <td class="style35">
                        Not CBD :Land</td>
                    <td class="style9">
                        <asp:TextBox ID="APPRAISAL_VALUE_ZONE_FTextBox" ToolTip="ราคาประเมินหลักทรัพย์ Zone F"
                            Width="85px" runat="server" />
                    </td>
                    <td class="style37">
                        บาท</td>
                </tr>
                <tr>
                    <td class="style35">
                        &nbsp;</td>
                    <td class="style9">
                        <asp:TextBox ID="APPRAISAL_VALUE_ZONE_GTextBox" ToolTip="ราคาประเมินหลักทรัพย์ Zone G"  Text="0"
                            Width="85px"  runat="server" />
                    </td>
                    <td class="style37">
                        &nbsp;</td>
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
                        บสยคำประกันรวม</td>
                    <td class="style9">
                        <asp:TextBox ID="TCG_GUARANTEETextBox" ToolTip="บสยค้ำประกัน"
                            Width="85px" runat="server" Text='<%# Bind("TCG_GUARANTEE") %>' />
                    </td>
                    <td class="style37">
                        บาท</td>
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
                        &nbsp;<asp:TextBox ID="DEFAULT_MARGINTextBox" runat="server" CELL="D16" Text='<%# Bind("DEFAULT_MARGIN") %>'
                            ToolTip="D16: Default Margin" Width="85px" />
                    </td>
                </tr>
            </table>
        </div>
        <div id="tab2">
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
                            สินทรัพย์หมุนเวียนอื่น ๆ</td>
                        <td class="style28">
                                <asp:TextBox ID="CURRENT_ASSET_OTHER_CALTextBox" Width="85px" runat="server" 
                                Text='<%# Bind("CURRENT_ASSET_OTHER_CAL") %>' />
                        </td>
                        <td class="style33">
                            &nbsp;</td>
                        <td class="style29">
                            &nbsp;</td>
                        <td class="style34">
                            &nbsp;</td>
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
                        สินทรัพย์ถาวรที่จำนอง<br />
                        สถาบันการเงินอื่น
                    </td>
                    <td class="style28">
                        <asp:TextBox ID="OTHER_FIXED_ASSETS_OTHER_BANK_CALTextBox" ToolTip="DX07: สินทรัพย์ถาวรที่จำนองสถาบันการเงินอื่นๆ "
                            Width="85px" runat="server" />
                    </td>
                    <td class="style33">
                        &nbsp;
                    </td>
                    <td class="style29">
                        &nbsp;
                    </td>
                    <td class="style34">
                        &nbsp;
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
        <div id="tab3">
            <table>
                <tr>
                    <td class="style11" colspan="5">
                        <span class="ui-state-highlight"><strong>Ration คำนวณจากสมมุติฐานงบการเงินด้านบน</strong></span>
                    </td>
                </tr>
                <tr>
                    <td class="style11">
                        Ebitda
                        <asp:TextBox ID="EBIDA_PERCENT_CALTextBox" runat="server" ToolTip="H25: % Ebitda"
                            CELL="H25" Width="40" Text='100' />
                        %
                    </td>
                    <td class="style23">
                        <asp:TextBox ID="EBIDA_CALTextBox" runat="server" ToolTip="I25: Ebitda" CELL="I25"
                            Width="85px" Text='' />
                    </td>
                    <td class="style24">
                        &nbsp;
                    </td>
                    <td class="style25">
                        ส่วนของเจ้าของ
                        <asp:TextBox ID="OWNERS_EQUITY_PERCENT_CALTextBox" runat="server" ToolTip="M25: % ส่วนของเจ้าของ"
                            CELL="M25" Text='0' Width="40px" />
                        &nbsp;%
                    </td>
                    <td class="style26">
                        <asp:TextBox ID="OWNERS_EQUITY_CALTextBox" runat="server" ToolTip="N25: ส่วนของเจ้าของ"
                            Width="85px" CELL="N25" Text='<%# Bind("OWNERS_EQUITY") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="style11">
                        D/E ก่อนขอสินเชื่อ
                    </td>
                    <td class="style23">
                        <asp:TextBox ID="DE_BEFORE_LOAN_CALTextBox" runat="server" ToolTip="I26: D/E ก่อนขอสินเชื่อ"
                            Width="70px" CELL="I26" Text='<%# Bind("DE_BEFORE_LOAN") %>' />
                        :1
                    </td>
                    <td class="style24">
                        &nbsp;
                    </td>
                    <td class="style25">
                        อัตราดอกเบี้ยที่&nbsp;
                        <asp:TextBox ID="FIXED_INTEREST_PERCENT_CALTextBox" runat="server" ToolTip="M27: อัตราดอกเบี้ย"
                            CELL="M27" Text='<%# Bind("FIXED_INTEREST_PERCENT") %>' Width="40px" />
                        &nbsp;%
                    </td>
                    <td class="style26">
                        อายุสัญญา
                        <asp:TextBox ID="PAYMENT_PERIOD_CALTextBox" runat="server" ToolTip="O27: อายุสัญญา"
                            CELL="O27" Text='<%# Bind("PAYMENT_PERIOD") %>' Width="30" />
                    </td>
                </tr>
                <tr>
                    <td class="style11">
                        DSCR ก่อนขอสินเชื่อ
                    </td>
                    <td class="style23">
                        <asp:TextBox ID="DSCR_BEFORE_LOAN_CALTextBox" runat="server" ToolTip="I27: DSCR ก่อนขอสินเชื่อ"
                            Width="85px" CELL="I27" Text='<%# Bind("DSCR_BEFORE_LOAN") %>' />
                    </td>
                    <td class="style24">
                        เท่า
                    </td>
                    <td class="style25">
                        ระยะเวลาชำระหนี้เฉลี่ย
                    </td>
                    <td class="style26">
                        <asp:TextBox ID="AVERAGE_PAYMENT_PERIOD_CALTextBox" runat="server" ToolTip="O28: ระยะเวลาชำระหนี้เฉลี่ย"
                            Width="85px" CELL="O28" Text='<%# Bind("AVERAGE_PAYMENT_PERIOD") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="style11">
                        ระยะเวลาเก็บหนี้เฉลี่ย
                    </td>
                    <td class="style23">
                        <asp:TextBox ID="AR_DAY_CALTextBox" runat="server" ToolTip="J28: ระยะเวลาเก็บหนี้เฉลี่ย"
                            Width="85px" CELL="J28" Text='<%# Bind("AR_DAY") %>' />
                    </td>
                    <td class="style24">
                        วัน
                    </td>
                    <td class="style25">
                        &nbsp;
                    </td>
                    <td class="style26">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style11">
                        ระยะเวลาสต๊อกสินค้าเฉลี่ย
                    </td>
                    <td class="style23">
                        <asp:TextBox ID="INVENTORY_DAY_CALTextBox" runat="server" ToolTip="J29: ระยะเวลาสต๊อกสินค้าเฉลี่ย"
                            Width="85px" CELL="J29" Text='<%# Bind("INVENTORY_DAY") %>' />
                    </td>
                    <td class="style24">
                        วัน
                    </td>
                    <td class="style18" colspan="2">
                        <strong>คำนวณวงเงินสินเชื่อที่ยัง<br />
                        สามารถอนุมัติเพิ่มได้</strong>
                    </td>
                </tr>
                <tr>
                    <td class="style11">
                        Working Capital Need
                    </td>
                    <td class="style23">
                        <asp:TextBox ID="WORKING_CAPITAL_NEED_CALTextBox" runat="server" ToolTip="I30: Working Capital Need"
                            Width="85px" CELL="I30" Text='<%# Bind("WORKING_CAPITAL_NEED") %>' />
                    </td>
                    <td class="style24">
                        &nbsp;
                    </td>
                    <td class="style25">
                        Working Capital
                    </td>
                    <td class="style26">
                        <asp:TextBox ID="WORKING_CAPITAL_APPROVE_CALTextBox" runat="server" ToolTip="N30: Working Capital"
                            Width="85px" CELL="N30" Text='<%# Bind("WORKING_CAPITAL_APPROVE") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="style11">
                        Loan
                    </td>
                    <td class="style23">
                        <asp:TextBox ID="LOAN_NEED_CALTextBox" runat="server" ToolTip="I31: Loan" CELL="I31"
                            Width="85px" Text='' />
                    </td>
                    <td class="style24">
                        &nbsp;
                    </td>
                    <td class="style25">
                        Loan
                    </td>
                    <td class="style26">
                        <asp:TextBox ID="LOAN_APPROVE_CALTextBox" runat="server" ToolTip="N31: Loan" CELL="N31"
                            Width="85px" Text='<%# Bind("LOAN_APPROVE") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="style11">
                        &nbsp;
                    </td>
                    <td class="style23">
                        &nbsp;
                    </td>
                    <td class="style24">
                        &nbsp;
                    </td>
                    <td class="style25">
                        &nbsp;
                    </td>
                    <td class="style26">
                        &nbsp;
                    </td>
                </tr>
            </table>
        </div>
        <div id="tab5">
            <table>
                <tr>
                    <td class="style17" colspan="5">
                        <strong class="ui-state-highlight">ความสามารถในการก่อหนี้ตาม Default BAY&nbsp; </strong>
                        &nbsp; &nbsp; &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style17" colspan="2">
                        <strong>วงเงินสินเชื่อสูงสุดที่สามารถก่อหนี้ได้</strong> &nbsp;
                    </td>
                    <td class="style15">
                        &nbsp; <strong>วงเงินสินเชื่อคงเหลือที่ยังสามารถอนุมัติเพิ่มได้</strong>
                    </td>
                    <td class="style19" colspan="2">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <table width="100%">
                            <tr>
                                <td>
                                    <span class="showDesc" desc="วงเงินหมุนเวียนที่จำเป็นสูงสุดคำนวณจากสมุติฐานของ Bay">
                                        Working Capital Default</span>
                                </td>
                                <td class="style29">
                                    <asp:TextBox ID="WORKING_CAPITAL_DEFAULTTextBox" runat="server" ToolTip="N40: Working Capital Default"
                                        Width="85px" CELL="N40" Text='<%# Bind("WORKING_CAPITAL_DEFAULT") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td class="style17">
                                    <span class="showDesc" desc="วงเงินสินเชื่อไม่หมุนเวียนที่สามารถก่อหนี้ได้สูงสุด คำนวณจาก Ebitda ของสมมุติฐานงบการเงิน">
                                        Loan Default</span>
                                </td>
                                <td class="style29">
                                    <asp:TextBox ID="LOAN_DEFAULTTextBox" runat="server" ToolTip="N41: Loan Default"
                                        Width="85px" CELL="N41" Text='<%# Bind("LOAN_DEFAULT") %>' />
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class="style15">
                        &nbsp;
                    </td>
                    <td class="style20">
                        <table>
                            <tr>
                                <td class="style19">
                                    Working Capital ที่สามารถอนุมัติได้
                                </td>
                                <td>
                                    <asp:TextBox ID="WORKING_CAPITAL_DEFAULT_APPROVETextBox" runat="server" ToolTip=" N43: Working Capital ที่สามารถอนุมัติได้"
                                        Width="85px" CELL="N43" Text='<%# Bind("WORKING_CAPITAL_DEFAULT_APPROVE") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Loan ที่สามารถอนุมัติได้
                                </td>
                                <td>
                                    <asp:TextBox ID="LOAN_DEFAULT_APPROVETextBox" runat="server" ToolTip="N44: Loan ที่สามารถอนุมัติได้"
                                        Width="85px" CELL="N44" Text='<%# Bind("LOAN_DEFAULT_APPROVE") %>' />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <div id="tab6">
            <table width="100%">
                <tr>
                    <td class="ui-state-highlight">
                        <strong>ค่าที่คำนวณจากระบบ&nbsp;</strong>
                    </td>
                    <td class="style27">
                        &nbsp;
                    </td>
                    <td class="style22">
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td class="style29">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        D/E ครั้งนี้
                    </td>
                    <td class="style27">
                        <asp:TextBox ID="DE_THIS_TIMETextBox" ToolTip="M36: D/E ครั้งนี้" CELL="M36" runat="server"
                            Width="70px" Text='' />
                        :1
                    </td>
                    <td class="style22">
                        &nbsp;
                    </td>
                    <td>
                        DSCR ครั้งนี้
                    </td>
                    <td class="style29">
                        <asp:TextBox ID="DSCR_THIS_TIMETextBox" ToolTip="M35: DSCR ครั้งนี้" CELL="M35" runat="server"
                            Width="70px" Text='<%# Bind("DSCR_THIS_TIME") %>' />:1
                        <asp:TextBox ID="DSCR_THIS_TIME_PERCENTTextBox" ToolTip="O35: DSCR %" CELL="O35"
                            runat="server" Text='<%# Bind("DSCR_THIS_TIME_PERCENT") %>' Width="45px" />
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td class="style27">
                        &nbsp;
                    </td>
                    <td class="style22">
                        &nbsp;
                    </td>
                    <td>
                        LTV
                    </td>
                    <td class="style29">
                        <asp:TextBox ID="LTV_THIS_TIMETextBox" runat="server" ToolTip="M37: LTV ครั้งนี้"
                            Width="70px" CELL="M37" />%
                        <asp:TextBox ID="LTV_THIS_TIME_PERCENTTextBox" runat="server" ToolTip="O37: % LTV ครั้งนี้"
                            CELL="037" Width="45px" />
                    </td>
                </tr>
            </table>
        </div>
        <div id="tab4">
            <table width="100%">
                <tr>
                    <td colspan="4">
                        <span class="ui-state-highlight"><strong>วงเงินสินเชื่อที่ขออนุมัติครั้งนี้ </strong>
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
                            Width="85px" CELL="I37" runat="server" Text='<%# Bind("BOND_DEPOSIT_PLEDGE_PERSON") %>' />
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
                        % ส่วนของเจ้าของ
                    </td>
                    <td>
                        <asp:TextBox ID="OWNERS_EQUITY_PERCENT_INPUTTextBox" ToolTip="กระทบ % ส่วนของเจ้าของ"
                            Width="35px" CELL="I36" runat="server"  />
                        %
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
            <div id="divSave">
                <asp:Button ID="BtnInsert" runat="server" Text="Insert/Save Data" OnClientClick="return checkValidAll()"
                    class="saveButton" Height="30px" Width="200px" />&nbsp
                <asp:Button ID="BtnUpdate" runat="server" Text="Update Data" OnClientClick="return checkValidAll()"
                    class="saveButton" Height="30px" Width="200px" />&nbsp ** บันทึกข้อมูลที่นี่
                **</div>
        </div>
        <div id="accordion">
        </div>
    </div>
    </form>
</body>
</html> 