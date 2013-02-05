<%@ Page Language="VB" AutoEventWireup="false" CodeFile="financial_compare.aspx.vb"
    Inherits="smes_financial_compare" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
        #divRef
        {
            position: absolute;
            top: 0;
            right: 0;
        }
        table
        {
            width: 800px;
        }
        
        td:first-child
        {
            width: 40%;
            font-size: 14px;
            color: #000088;
        }
        tableData
        {
            font-size: 12px;
            width: 800px;
        }
        
        .ui-state-highlight, .ui-widget-content .ui-state-highlight, .ui-widget-header .ui-state-highlight
        {
            border: 1px solid #fed22f;
            background: #ffe45c url('js/jquery-ui-1.8.18/css/ui-lightness/images/ui-bg_highlight-soft_75_ffe45c_1x100.png') repeat-x 50% top;
            color: #363636;
        }
        
        #tableSave
        {
            width: 800px;
        }
        
        input[type='text']
        {
            text-align: right;
        }
        
        .data
        {
            margin: 0 1em 1em 0;
        }
        .data-header
        {
            margin: 0.3em;
            padding-bottom: 4px;
            padding-left: 0.2em;
        }
        .data-header .ui-icon
        {
            float: right;
        }
        .data-content
        {
            padding: 0.4em;
        }
    </style>
    <script src="js/jquery-1.7.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui-1.8.18/js/jquery-ui-1.8.18.custom.min.js" type="text/javascript"></script>
    <%--    <link href="js/jquery-ui-1.8.18/css/redmond/jquery-ui-1.8.18.custom.css" rel="stylesheet"    type="text/css" />--%>
    <%--    <link href="js/jquery-ui-1.8.18/css/sunny/jquery-ui-1.8.18.custom.css" rel="stylesheet"    type="text/css" />--%>
    <link href="js/jquery-ui-1.8.18/css/ui-lightness/jquery-ui-1.8.18.custom.css" rel="stylesheet"
        type="text/css" />
    <script src="js/autoNumeric.js" type="text/javascript"></script>
    <script src="js/SSCalFunction01.js?n=1" type="text/javascript"></script>
    <script src="js/DscrCalLtv.js?n=2" type="text/javascript"></script>
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
        , I39, I40, I41, I42, I43, I44, I45, I46, T17 // หลักประกันรวม
        , J28, J29
        , M25, M27, M33, M34, M35, M36, M37
        , N9, N10, N11, N13, N15, N16, N18, N20, N21, N22
        , N30, N31, N40, N41, N43, N44
        , O27, O28, O34, O35, O37
        , R44 // Temp cal loan max
         , MARGIN_TABLE, DSCR_TABLE, AP_TABLE, AR_TABLE, STOCK_TABLE // ตัวแปรจาก table ที่ไม่มีใน excell
        , LTV_TABLE, WORKING_CAPITAL_TABLE, RATE_TABLE, CONTRACT_TABLE
        , DX06, DX07
        , CURRENT_ASSET_OTHER
        , DSCR_THIS_TIME;

        $(document).ready(function () {

            $(".data").addClass("ui-widget ui-widget-content ui-helper-clearfix ui-corner-all")
			.find(".data-header")
				.addClass("ui-state-highlight  ui-corner-all")
				.prepend("<span class='ui-icon ui-icon-minusthick'></span>")
				.end()
			.find(".data-content");

            //$(".data-header .ui-icon").click(function () {
            $(".data-header").click(function () {
                //  $(this).toggleClass("ui-icon-minusthick").toggleClass("ui-icon-plusthick");
                $(this).find(".ui-icon").toggleClass("ui-icon-minusthick").toggleClass("ui-icon-plusthick");
                $(this).parents(".data:first").find(".data-content").toggle();
            });
            $(".data-header").click(); // กำหนดให้คลิกครั้งแรก คือ กำหนดให้ซ่อนก่อน


            D8 = $("#SALES_CMTextBox");
            D9 = $("#CREDIT_SALE_CMTextBox");
            D10 = $("#CREDIT_TERM_CMTextBox");
            D13 = $("#PURCHASE_CMTextBox");
            D14 = $("#CREDIT_PURCHASE_CMTextBox");
            D15 = $("#TERM_PURCHASE_CMTextBox");
            D16 = $("#DEFAULT_MARGIN_CMTextBox");

            D17 = $("#GROSS_PROFIT_CMTextBox");

            D20 = $("#INVENTORY_INTERVIEW_CMTextBox");
            D21 = $("#INVENTORY_VISIT_CMTextBox");
            D24 = $("#ACCOUNT_RECEIVABLE_CMTextBox");
            D25 = $("#MACHINERY_EQUIPMENT_CMTextBox");
            D26 = $("#CORE_ASSETS_CMTextBox");
            D27 = $("#OTHER_FIXED_ASSETS_CMTextBox");
            D28 = $("#CASH_BOND_CMTextBox");
            D29 = $("#CALCULATE_RATE_CMTextBox");
            D30 = $("#ACCOUNT_PAYABLE_CMTextBox");
            D31 = $("#CURRENT_LIABILITY_BAY_CMTextBox");
            D32 = $("#CURRENT_LIABILITY_OTHER_BANK_CMTextBox");
            D33 = $("#OTHER_CURRENT_LIABILITY_CMTextBox");
            D34 = $("#LONG_TERM_LIABILITY_BAY_CMTextBox");
            D35 = $("#LONG_TERM_LIABILITY_BAY_REPAYMENT_CMTextBox");
            D36 = $("#LONG_TERM_LIABILITY_OTHER_BANK_CMTextBox");
            D37 = $("#LONG_TERM_LIABILITY_OTHER_REPAYMENT_CMTextBox");
            D38 = $("#LONG_TERM_OTHER_LIABILITY_CMTextBox");
            D39 = $("#LONG_TERM_OTHER_REPAYMENT_CMTextBox");
            D40 = $("#LOANS_REL_CO_DIRECTORS_CMTextBox");
            D41 = $("#LG_AVAL_BAY_CMTextBox");
            D43 = $("#REFINANCE_WORKING_CAPITAL_OTHER_CMTextBox");
            D44 = $("#REFINANCE_WORKING_LOAN_OTHER_CMTextBox");
            D45 = $("#REFINANCE_REPAYMENT_CMTextBox");

            F10 = $("[CELL='AR_TABLE']");
            F15 = $("[CELL='AP_TABLE']");
            F21 = $("[CELL='STOCK_TABLE']");


            I33 = $("#WORKING_CAPITAL_CMTextBox");
            I34 = $("#LOAN_CMTextBox");
            I35 = $("#LG_AVAL_CMTextBox");
            I36 = $("#ASSETS_INCREASE_LOAN_CMTextBox");
            I37 = $("#BOND_DEPOSIT_PLEDGE_PERSON_CMTextBox");
            I39 = $("#APPRAISAL_VALUE_ZONE_A_CMTextBox");
            I40 = $("#APPRAISAL_VALUE_ZONE_B_CMTextBox");
            I41 = $("#APPRAISAL_VALUE_ZONE_C_CMTextBox");
            I42 = $("#APPRAISAL_VALUE_ZONE_D_CMTextBox");
            I43 = $("#APPRAISAL_VALUE_ZONE_E_CMTextBox");
            I44 = $("#BOND_DEPOSIT_PLEDGE_CMTextBox");


            T17 = $("#TOTAL_AMOUNT_OF_COLLATERAL_CMTextBox");

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




            //            I9 = $("#CASH_BOND_CALTextBox");
            //            I10 = $("#ACCOUNT_RECEIVABLE_CALTextBox");
            //            I11 = $("#INVENTORY_CALTextBox");
            //            I13 = $("#TOTAL_CURRENT_ASSETS_CALTextBox");
            //            I15 = $("#MACHINERY_EQUIPMENT_CALTextBox");
            //            I16 = $("#PROPERTY_PLANT_BUILDING_CALTextBox");
            //            I17 = $("#OTHER_FIXED_ASSETS_CALTextBox");
            //            I18 = $("#ASSETS_FROM_CREDIT_CALTextBox");
            //            I20 = $("#TOTAL_FIXED_ASSETS_CALTextBox");
            //            I22 = $("#TOTAL_ASSETS_CALTextBox");

            //            I25 = $("#EBIDA_CALTextBox");
            //            I26 = $("#DE_BEFORE_LOAN_CALTextBox");
            //            I27 = $("#DSCR_BEFORE_LOAN_CALTextBox");

            //            I30 = $("#WORKING_CAPITAL_NEED_CALTextBox");
            //            I31 = $("#LOAN_NEED_CALTextBox");



            J28 = $("#AR_DAY_CAL_CMTextBox");
            J29 = $("#INVENTORY_DAY_CAL_CMTextBox");

            M25 = $("#OWNERS_EQUITY_PERCENT_CAL_CMTextBox");
            M27 = $("#FIXED_INTEREST_PERCENT_CAL_CMTextBox");
            M33 = $("#INTEREST_RATE_PERCENT_CMTextBox");
            M34 = $("#INTEREST_RATE_PERCENT_USED_CMTextBox");

            M35 = $("#DSCR_THIS_TIME_CMTextBox");

            M36 = $("#DE_THIS_TIME_CMTextBox");
            M37 = $("#LTV_THIS_TIME_CMTextBox");

            N9 = $("#ACCOUNT_PAYABLE_CAL_CMTextBox");
            N10 = $("#CURRENT_LIABILITY_BAY_CAL_CMTextBox");
            N11 = $("#OTHER_CURRENT_LIABILITY_CAL_CMTextBox");
            N13 = $("#TOTAL_CURRENT_LIABILITY_CAL_CMTextBox");
            N15 = $("#LONG_TERM_LIABILITY_BAY_CAL_CMTextBox");
            N16 = $("#OTHER_LONG_TERM_LIABILITY_CAL_CMTextBox");
            N18 = $("#TOTAL_LIABILITY_CAL_CMTextBox");
            N20 = $("#LOANS_REL_CO_DIRECTORS_CAL_CMTextBox");
            N21 = $("#EQUITY_CAL_CMTextBox");
            N22 = $("#LIABILITY_EQUITY_CAL_CMTextBox");
            N25 = $("#OWNERS_EQUITY_CAL_CMTextBox");

            H25 = $("#EBIDA_PERCENT_CAL_CMTextBox");

            N30 = $("#WORKING_CAPITAL_APPROVE_CALTextBox");
            N31 = $("#LOAN_APPROVE_CALTextBox");

            N40 = $("#WORKING_CAPITAL_DEFAULTTextBox");
            N41 = $("#LOAN_DEFAULTTextBox");

            N43 = $("#WORKING_CAPITAL_DEFAULT_APPROVETextBox");
            N44 = $("#LOAN_DEFAULT_APPROVETextBox");



            O27 = $("#PAYMENT_PERIOD_CAL_CMTextBox");
            //            O28 = $("#AVERAGE_PAYMENT_PERIOD_CALTextBox");
            O34 = $("#CONTRACT_YEAR_CMTextBox");
            O35 = $("#DSCR_THIS_TIME_PERCENT_CMTextBox");
            O37 = $("#LTV_THIS_TIME_PERCENT_CMTextBox");


            COST_OF_SALES_CMTextBox = $("#COST_OF_SALES_CMTextBox");
            COST_OF_SALES_PERCENT_CMTextBox = $("#COST_OF_SALES_PERCENT_CMTextBox");
            OPERATING_EXPENSES_CMTextBox = $("#OPERATING_EXPENSES_CMTextBox");
            OPERATING_EXPENSES_PERCENT_CMTextBox = $("#OPERATING_EXPENSES_PERCENT_CMTextBox");
            TAX_CMTextBox = $("#TAX_CMTextBox");
            OTHER_FIXED_ASSETS_OTHER_BANK_CMTextBox = $("#OTHER_FIXED_ASSETS_OTHER_BANK_CMTextBox");
            OTHER_FIXED_ASSETS_OTHER_BANK_CAL_CMTextBox = $("#OTHER_FIXED_ASSETS_OTHER_BANK_CAL_CMTextBox");

            DX06 = $("#OTHER_FIXED_ASSETS_OTHER_BANK_CMTextBox");
            DX07 = $("#OTHER_FIXED_ASSETS_OTHER_BANK_CAL_CMTextBox");

            CURRENT_ASSET_OTHER = $("#CURRENT_ASSET_OTHER_CMTextBox");

            var CALCULATE_EL = N43.add(N44).add(I30).add(I31).add(N30).add(N31);
            CALCULATE_EL.autoNumeric({ aPad: true, vMin: '-9999999999.99', vMax: '9999999999.99' });

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

            if (I33.val() == '') {
                obj.setI33(0);
            } else {
                obj.setI33(parseFloat($(I33).autoNumericGet()));
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

            // หา ltv จาก dscr ที่ได้ (default 1.0)

            var v39 = 1.0; //  Zone A  // CBD Core Asset  I39  0.85
            var v40 = 1.0; //  Zone B  // CBD Non Core Asset I40 0.75
            var v41 = 1.0; //  Zone C // CBD Land  I41  0.60
            var v42 = 1.0; //  Zone D // Not CBD Core Asset  I42 0.60
            var v43 = 1.0; //  Zone E // Not CBD Non Core Asset  I43 0.50
            var v44 = 1.0; //  Zone F // Not CBD Land  I

            var v45 = 1.0; //  Zone G //  
            var v46 = 1.0;



            if (I39.val() == '') {
                obj.setI39(0);
            } else {
                obj.setI39(parseFloat($(I39).autoNumericGet()) * v39);
            }
            if (I40.val() == '') {
                obj.setI40(0);
            } else {
                obj.setI40(parseFloat($(I40).autoNumericGet()) * v40);
            }
            if (I41.val() == '') {
                obj.setI41(0);
            } else {
                obj.setI41(parseFloat($(I41).autoNumericGet()) * v41);
            }
            if (I42.val() == '') {
                obj.setI42(0);
            } else {
                obj.setI42(parseFloat($(I42).autoNumericGet()) * v42);
            }
            if (I43.val() == '') {
                obj.setI43(0);
            } else {
                obj.setI43(parseFloat($(I43).autoNumericGet()) * v43);
            }
            if (I44.val() == '') {
                obj.setI44(0);
            } else {
                obj.setI44(parseFloat($(I44).autoNumericGet()) * v44);
            }

            obj.setI45(0);
            obj.setI46(0);

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

            // ใช้กำไรจากการดำเนินงานจาก ค่า default โดยการแทนค่า D17 ด้วย D16
            if (D17.val() == '') {
                obj.setD17(0);
            } else {
                //alert(parseFloat($(MARGIN_TABLE).autoNumericGet()));
                obj.setD17(parseFloat($(MARGIN_TABLE).autoNumericGet()) * 100);  // ต้องคูณ 100 เนื่องจากฟังชั่นรับ % เต็ม

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

            if (DX06.val() == '') {
                obj.setDX06(0);
            } else {
                obj.setDX06(parseFloat($(DX06).autoNumericGet()));
            }
            // ตัวแปรจาก table

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
            //  end ตัวแปรจาก table

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

            if (CURRENT_ASSET_OTHER.val() == '') {
                obj.setCURRENT_ASSET_OTHER(0);
            } else {

                obj.setCURRENT_ASSET_OTHER(parseFloat(CURRENT_ASSET_OTHER.val()));

            }

            //            if (DX06.val() == '') {
            //                obj.setDX06(0);
            //            } else {
            //                obj.setDX06(parseFloat($(DX06).autoNumericGet()));
            //            }

            // กำหนดค่าให้ obj ที่เป็นค่า default

            $("#SALESTextBox").val(D8.val());
            $("#CREDIT_SALETextBox").val(D9.val());
            $("#CREDIT_TERMTextBox").val(D10.val());
            $("#PURCHASETextBox").val(D13.val());
            $("#CREDIT_PURCHASETextBox").val(D14.val());
            $("#TERM_PURCHASETextBox").val(D15.val());
            $("#DEFAULT_MARGINTextBox").val(D16.val());

            $("#GROSS_PROFITTextBox").val($(MARGIN_TABLE).autoNumericGet() * 100);  // แสดงให้เห็นว่า margin มาจาก default

            $("#INVENTORY_INTERVIEWTextBox").val(D20.val());
            $("#INVENTORY_VISITTextBox").val(D21.val());
            $("#ACCOUNT_RECEIVABLETextBox").val(D24.val());

            $("#CURRENT_ASSET_OTHERTextBox").val(CURRENT_ASSET_OTHER.val());
            $("#CURRENT_ASSET_OTHER_CALTextBox").val(CURRENT_ASSET_OTHER.val());

            $("#MACHINERY_EQUIPMENTTextBox").val(D25.val());
            $("#CORE_ASSETSTextBox").val(D26.val());
            $("#OTHER_FIXED_ASSETSTextBox").val(D27.val());
            $("#CASH_BONDTextBox").val(D28.val());
            $("#CALCULATE_RATETextBox").val(D29.val());
            $("#ACCOUNT_PAYABLETextBox").val(D30.val());
            $("#CURRENT_LIABILITY_BAYTextBox").val(D31.val());
            $("#CURRENT_LIABILITY_OTHER_BANKTextBox").val(D32.val());
            $("#OTHER_CURRENT_LIABILITYTextBox").val(D33.val());
            $("#LONG_TERM_LIABILITY_BAYTextBox").val(D34.val());
            $("#LONG_TERM_LIABILITY_BAY_REPAYMENTTextBox").val(D35.val());
            $("#LONG_TERM_LIABILITY_OTHER_BANKTextBox").val(D36.val());
            $("#LONG_TERM_LIABILITY_OTHER_REPAYMENTTextBox").val(D37.val());
            $("#LONG_TERM_OTHER_LIABILITYTextBox").val(D38.val());
            $("#LONG_TERM_OTHER_REPAYMENTTextBox").val(D39.val());
            $("#LOANS_REL_CO_DIRECTORSTextBox").val(D40.val());
            $("#LG_AVAL_BAYTextBox").val(D41.val());
            $("#REFINANCE_WORKING_CAPITAL_OTHERTextBox").val(D43.val());
            $("#REFINANCE_WORKING_LOAN_OTHERTextBox").val(D44.val());
            $("#REFINANCE_REPAYMENTTextBox").val(D45.val());

            $("#COST_OF_SALESTextBox").val(COST_OF_SALES_CMTextBox.val());
            $("#COST_OF_SALES_PERCENTTextBox").val(COST_OF_SALES_PERCENT_CMTextBox.val());
            $("#OPERATING_EXPENSESTextBox").val(OPERATING_EXPENSES_CMTextBox.val());
            $("#OPERATING_EXPENSES_PERCENTTextBox").val(OPERATING_EXPENSES_PERCENT_CMTextBox.val());
            $("#TAXTextBox").val(TAX_CMTextBox.val());
            $("#OTHER_FIXED_ASSETS_OTHER_BANKTextBox").val(OTHER_FIXED_ASSETS_OTHER_BANK_CMTextBox.val());
            $("#OTHER_FIXED_ASSETS_OTHER_BANK_CALTextBox").val(OTHER_FIXED_ASSETS_OTHER_BANK_CAL_CMTextBox.val());

            $("#LG_AVALTextBox").val(I35.val());
            $("#ASSETS_INCREASE_LOANTextBox").val(I36.val());
            $("#BOND_DEPOSIT_PLEDGE_PERSONTextBox").val(I37.val());
            $("#APPRAISAL_VALUE_ZONE_ATextBox").val(I39.val());
            $("#APPRAISAL_VALUE_ZONE_BTextBox").val(I40.val());
            $("#APPRAISAL_VALUE_ZONE_CTextBox").val(I41.val());
            $("#APPRAISAL_VALUE_ZONE_DTextBox").val(I42.val());
            $("#APPRAISAL_VALUE_ZONE_ETextBox").val(I43.val());
            $("#BOND_DEPOSIT_PLEDGETextBox").val(I44.val());
            $("#TOTAL_AMOUNT_OF_COLLATERALTextBox").val(T17.val());

            // ใส่ค่าช่วงคำนวณ



            $("#ACCOUNT_PAYABLE_CALTextBox").autoNumericSet(obj.N9());
            $("#CURRENT_LIABILITY_BAY_CALTextBox").autoNumericSet(obj.N10());
            $("#OTHER_CURRENT_LIABILITY_CALTextBox").autoNumericSet(obj.N11());
            $("#TOTAL_CURRENT_LIABILITY_CALTextBox").autoNumericSet(obj.N13());
            $("#LONG_TERM_LIABILITY_BAY_CALTextBox").autoNumericSet(obj.N15());
            $("#OTHER_LONG_TERM_LIABILITY_CALTextBox").autoNumericSet(obj.N16());
            $("#TOTAL_LIABILITY_CALTextBox").autoNumericSet(obj.N18());
            $("#LOANS_REL_CO_DIRECTORS_CALTextBox").autoNumericSet(obj.N20());
            $("#EQUITY_CALTextBox").autoNumericSet(obj.N21());
            $("#LIABILITY_EQUITY_CALTextBox").autoNumericSet(obj.N22());
            $("#OWNERS_EQUITY_CALTextBox").autoNumericSet(obj.N25());
            //            
            $("#CASH_BOND_CALTextBox").autoNumericSet(obj.I9());
            $("#ACCOUNT_RECEIVABLE_CALTextBox").autoNumericSet(obj.I10());
            $("#INVENTORY_CALTextBox").autoNumericSet(obj.I11());

            $("#AR_DAY_CALTextBox").autoNumericSet(obj.J28());
            $("#INVENTORY_DAY_CALTextBox").autoNumericSet(obj.J29());

            $("#TOTAL_CURRENT_ASSETS_CALTextBox").autoNumericSet(obj.I13());
            $("#MACHINERY_EQUIPMENT_CALTextBox").autoNumericSet(obj.I15());
            $("#PROPERTY_PLANT_BUILDING_CALTextBox").autoNumericSet(obj.I16());
            $("#OTHER_FIXED_ASSETS_CALTextBox").autoNumericSet(obj.I17());
            $("#ASSETS_FROM_CREDIT_CALTextBox").autoNumericSet(obj.I18());
            $("#TOTAL_FIXED_ASSETS_CALTextBox").autoNumericSet(obj.I20());
            $("#TOTAL_ASSETS_CALTextBox").autoNumericSet(obj.I22());

            $("#EBIDA_CALTextBox").autoNumericSet(obj.I25());

            $("#DE_BEFORE_LOAN_CALTextBox").autoNumericSet(obj.I26());
            $("#DSCR_BEFORE_LOAN_CALTextBox").autoNumericSet(obj.I27());

            $("#EBIDA_PERCENT_CALTextBox").autoNumericSet(obj.H25() * 100);
            $("#WORKING_CAPITAL_NEED_CALTextBox").autoNumericSet(obj.I30());

            $("#LOAN_NEED_CALTextBox").autoNumericSet(obj.I31());
            $("#WORKING_CAPITAL_APPROVE_CALTextBox").autoNumericSet(obj.N30());
            $("#LOAN_APPROVE_CALTextBox").autoNumericSet(obj.N31());
            $("#OWNERS_EQUITY_PERCENT_CALTextBox").autoNumericSet($("#OWNERS_EQUITY_PERCENT_CAL_CMTextBox").val());
            $("#FIXED_INTEREST_PERCENT_CALTextBox").autoNumericSet(M27.val());
            $("#PAYMENT_PERIOD_CALTextBox").autoNumericSet($("#PAYMENT_PERIOD_CAL_CMTextBox").val());
            $("#AVERAGE_PAYMENT_PERIOD_CALTextBox").autoNumericSet(obj.O28());
            $("#WORKING_CAPITAL_DEFAULTTextBox").autoNumericSet(obj.N40());
            $("#LOAN_DEFAULTTextBox").autoNumericSet(obj.N41());


            $("#WORKING_CAPITAL_DEFAULT_APPROVETextBox").autoNumericSet(obj.N43());
            $("#LOAN_DEFAULT_APPROVETextBox").autoNumericSet(obj.N44());

            // alert(obj.M36());

            $("#DE_THIS_TIMETextBox").autoNumericSet(obj.M36());
            $("#DSCR_THIS_TIMETextBox").autoNumericSet(obj.M35());
            $("#DSCR_THIS_TIME_PERCENTTextBox").autoNumericSet(DSCR_TABLE.val());
            $("#LTV_THIS_TIMETextBox").autoNumericSet(obj.M37() * 100);
            $("#LTV_THIS_TIME_PERCENTTextBox").autoNumericSet(LTV_TABLE.val());

            $("#WORKING_CAPITALTextBox").autoNumericSet(I33.val());
            $("#INTEREST_RATE_PERCENTTextBox").autoNumericSet(M33.val());
            $("#LOANTextBox").autoNumericSet(I34.val());
            $("#INTEREST_RATE_PERCENT_USEDTextBox").autoNumericSet(M34.val());
            $("#CONTRACT_YEARTextBox").autoNumericSet(O34.val());
            $("#LG_AVALTextBox").autoNumericSet(I35.val());
            $("#ASSETS_INCREASE_LOANTextBox").autoNumericSet(I36.val());
            $("#BOND_DEPOSIT_PLEDGE_PERSONTextBox").autoNumericSet(I37.val());



            // คำนวณผลอนุมัติ


            // คำนวณ LTV % จาก dscr
            DSCR_THIS_TIME = $("#DSCR_THIS_TIMETextBox").val();
            switch (DSCR_THIS_TIME) {
                case DSCR_THIS_TIME <= 1.2:
                        
                case 2: result = 'two'; break;
                default: result = 'unknown';
            }

            var a;
            var b;
            var r;   // a+b;
            var result;
            var resultValue;

            rmA = parseFloat($('#WORKING_CAPITAL_RMTextBox').autoNumericGet())
                     + parseFloat($('#LOAN_RMTextBox').autoNumericGet())
                     + parseFloat($('#LG_AVAL_RMTextBox').autoNumericGet());
            cmA = parseFloat($('#WORKING_CAPITAL_CMTextBox').autoNumericGet())
                    + parseFloat($('#LOAN_CMTextBox').autoNumericGet())
                    + parseFloat($('#LG_AVAL_CMTextBox').autoNumericGet());
            sysB = parseFloat($('#LOAN_DEFAULT_APPROVETextBox').autoNumericGet());
            //alert(sysB);
            cmB = parseFloat(cmA) + parseFloat(sysB);



            //alert(a);
            //alert(b);

            if (rmA <= 0) {
                result = '';
            } else { // rmA > 0

                if (sysB >= 0) {

                    if (rmA > (cmA + sysB)) {
                        if ((rmA * 80 / 100) > (cmA + sysB)) {
                            result = 'ไม่อนุมัติ';
                        } else { // (rmA * 80 / 100) <= (cmA + sysB)
                            result = 'อนุมัติ';
                        }
                    } else {  // (rmA <= (cmA + sysB)) {
                        result = 'อนุมัติ';
                    }

                } else { // sysbB < 0
                    if ((rmA * 80) / 100 > (cmA + sysB)) {
                        result = 'ไม่อนุมัติ';
                    } else {  // (rmA * 80) / 100 <= (cmA + sysB)
                        result = 'อนุมัติ';
                    }
                }
            }
            $('#ResultApproveTextBox').val(result);

            $("#RMrequestTextBox").autoNumericSet(rmA);
            $("#CMApproveTextBox").autoNumericSet(cmA);
            $("#SystemApproveTextBox").autoNumericSet(cmB);


            $('#ResultApproveTextBox').attr('readonly', true);
            $("#RMrequestTextBox").attr('readonly', true);
            $("#CMApproveTextBox").attr('readonly', true);
            $("#SystemApproveTextBox").attr('readonly', true);

        });
    </script>
    
    <script type="text/javascript">
        $(document).ready(function () {
            // กำหนด size frame
            sizeFrame();
            // กำหนดให้ปุ่ม submit มี style เป็น button ui
            $("input[type=submit]").button();

            // ใส่  username ให้กับหน้านี้
            var userName;
            if (window.parent.document.getElementById("spanUserName")) {
                userName = window.parent.document.getElementById("spanUserName").innerText;
            } else {
                userName = 'test';
            }
            $("#USERTextBox").val(userName);

            $('#toggle-view #tableBusiness').hide();
            $('#toggle-view #buslabel').click(function () {
                var text = $(this).parent().children('#tableBusiness');
                if (text.is(':hidden')) {
                    text.slideDown('200');
                    $(this).children('span').html('-');
                } else {
                    text.slideUp('200');
                    $(this).children('span').html('+');

                }
            });

        });
        function sizeFrame() {
            var heightDiv = $(document).height();
            $("#mainFrame", parent.document).height(heightDiv + 50);
        }


        function showErrorDialog(msg) {
            var button = $('#SaveButton');
            var position = button.position();
            $("#dialog").dialog({
                autoOpen: true,
                position: [position.left, position.top],
                title: msg,
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
            var button = $('#SaveButton');
            var position = button.position();
            $("#dialog").dialog({
                autoOpen: true,
                position: [position.left, position.top],
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
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div id="dialog" title="">
            <p class="msg">
                <asp:Label Text="Compare data (เปรียบเทียบข้อมูล)" ID="labelHead" runat="server"
                    Style="font-weight: 700; color: #0000FF; font-size: medium;"></asp:Label>
            </p>
        </div>
        <div id="divRef">
            SMES_ID:<asp:TextBox ID="SMES_IDTextBox" runat="server" MaxLength="10" Width="30"></asp:TextBox>
            &nbsp;REF:&nbsp;<asp:TextBox ID="REF_IDTextBox" ToolTip="ref_id" runat="server" Width="100" />
            &nbsp;User:<asp:TextBox ID="USERTextBox" ToolTip="ref_id" runat="server" Width="100" />
        </div>
        <div id="divTable">
            <div id="toggle-view">
                <span id="buslabel">ประเภทธุรกิจ </span>&nbsp<asp:TextBox ID="BUSINESS_ID_TABLETextBox"
                    ToolTip="รหัสธุรกิจ" runat="server" Width="100" />
                <asp:TextBox ID="BUSINESS_NAME_TABLETextBox" ToolTip="ประเภทธุรกิจ" runat="server"
                    Width="250" />
                กลุ่มธุรกิจ&nbsp;
                <asp:TextBox ID="BUSINESS_GROUP_TABLETextBox" ToolTip="กลุ่มธุรกิจ" runat="server"
                    Width="200" />
                <br />
                <br />
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
        <div id="tab1">
            <div class="data">
                <div class="data-header ">
                    <b>ข้อมูลพื้นฐาน</b>
                </div>
                <div class="data-content">
                    <table style="bgcolor: #FFFFCC" class="tableData">
                        <tr>
                            <td class="style4">
                            </td>
                            <td class="style2">
                                RM
                            </td>
                            <td class="style2">
                                CM
                            </td>
                            <td class="style2">
                                DEFAULT
                            </td>
                        </tr>
                        <tr>
                            <td class="style4">
                                <strong>ยอดขายเฉลี่ยต่อเดือน</strong>
                            </td>
                            <td class="style25">
                                &nbsp;
                            </td>
                            <td class="style26">
                                &nbsp;
                            </td>
                            <td class="style23">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="style4">
                                <span class="style27">ยอดขาย</span>
                            </td>
                            <td class="style25">
                                <asp:TextBox ID="SALES_RMTextBox" ToolTip="D8: ยอดขาย" CELL="D8" runat="server" Width="85px" />
                            </td>
                            <td class="style26">
                                <asp:TextBox ID="SALES_CMTextBox" ToolTip="D8: ยอดขาย" CELL="D8" runat="server" Width="85px" />
                            </td>
                            <td class="style23">
                                <asp:TextBox ID="SALESTextBox" ToolTip="D8: ยอดขาย" CELL="D8" runat="server" Width="85px" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style4">
                                <span class="style27">หักต้นทุนขาย</span>
                            </td>
                            <td class="style25">
                                <asp:TextBox ID="COST_OF_SALES_RMTextBox" ToolTip="DX01: หักต้นทุนขาย" runat="server"
                                    Width="85px" />
                            </td>
                            <td class="style26">
                                <asp:TextBox ID="COST_OF_SALES_CMTextBox" ToolTip="DX01: หักต้นทุนขาย" runat="server"
                                    Width="85px" />
                            </td>
                            <td class="style23">
                                <asp:TextBox ID="COST_OF_SALESTextBox" ToolTip="DX01: หักต้นทุนขาย" runat="server"
                                    Width="85px" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style4">
                                หักต้นทุนขาย %
                            </td>
                            <td class="style25">
                                <asp:TextBox ID="COST_OF_SALES_PERCENT_RMTextBox" ToolTip="DX02: หักต้นทุนขาย" runat="server"
                                    Width="85px" />
                            </td>
                            <td class="style26">
                                <asp:TextBox ID="COST_OF_SALES_PERCENT_CMTextBox" ToolTip="DX02: หักต้นทุนขาย" runat="server"
                                    Width="85px" />
                            </td>
                            <td class="style23">
                                <asp:TextBox ID="COST_OF_SALES_PERCENTTextBox" ToolTip="DX02: หักต้นทุนขาย" runat="server"
                                    Width="85px" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style4">
                                <span class="style27">ขายเชื่อ</span> % <span class="style27">ของยอดขาย</span>
                            </td>
                            <td class="style25">
                                <asp:TextBox ID="CREDIT_SALE_RMTextBox" ToolTip="D9: ขายเชื่อ" CELL="D9" runat="server"
                                    Width="85px" Text='<%# Bind("CREDIT_SALE") %>' />
                            </td>
                            <td class="style26">
                                <asp:TextBox ID="CREDIT_SALE_CMTextBox" ToolTip="D9: ขายเชื่อ" CELL="D9" runat="server"
                                    Width="85px" Text='<%# Bind("CREDIT_SALE") %>' />
                            </td>
                            <td class="style23">
                                <asp:TextBox ID="CREDIT_SALETextBox" ToolTip="D9: ขายเชื่อ" CELL="D9" runat="server"
                                    Width="85px" Text='<%# Bind("CREDIT_SALE") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style4">
                                ระยะเวลาให้เครดิต (วัน)
                            </td>
                            <td class="style25">
                                <asp:TextBox ID="CREDIT_TERM_RMTextBox" runat="server" class="auto" ToolTip="D10: ระยะเวลาให้เครดิต"
                                    Width="85px" CELL="D10" Text='<%# Bind("CREDIT_TERM") %>' />
                            </td>
                            <td class="style26">
                                <asp:TextBox ID="CREDIT_TERM_CMTextBox" runat="server" class="auto" ToolTip="D10: ระยะเวลาให้เครดิต"
                                    Width="85px" CELL="D10" Text='<%# Bind("CREDIT_TERM") %>' />
                            </td>
                            <td class="style23">
                                <asp:TextBox ID="CREDIT_TERMTextBox" runat="server" class="auto" ToolTip="D10: ระยะเวลาให้เครดิต"
                                    Width="85px" CELL="D10" Text='<%# Bind("CREDIT_TERM") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style4">
                                <span class="style27"><strong>ยอดซื้อเฉลี่ยต่อเดือน</strong></span>
                            </td>
                            <td class="style25">
                                &nbsp;
                            </td>
                            <td class="style26">
                                &nbsp;
                            </td>
                            <td class="style23">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="style4">
                                ยอดซื้อ&nbsp; (บาท/เดือน )
                            </td>
                            <td class="style25">
                                <asp:TextBox ID="PURCHASE_RMTextBox" ToolTip="D13: ยอดซื้อ" CELL="D13" runat="server"
                                    Width="85px" />
                            </td>
                            <td class="style26">
                                <asp:TextBox ID="PURCHASE_CMTextBox" ToolTip="D13: ยอดซื้อ" CELL="D13" runat="server"
                                    Width="85px" />
                            </td>
                            <td class="style23">
                                <asp:TextBox ID="PURCHASETextBox" ToolTip="D13: ยอดซื้อ" CELL="D13" runat="server"
                                    Width="85px" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style4">
                                ซื้อเชื่อ
                            </td>
                            <td class="style25">
                                <asp:TextBox ID="CREDIT_PURCHASE_RMTextBox" ToolTip="D14: ซื้อเชื่อ" CELL="D14" runat="server"
                                    Width="85px" />
                            </td>
                            <td class="style26">
                                <asp:TextBox ID="CREDIT_PURCHASE_CMTextBox" ToolTip="D14: ซื้อเชื่อ" CELL="D14" runat="server"
                                    Width="85px" />
                            </td>
                            <td class="style23">
                                <asp:TextBox ID="CREDIT_PURCHASETextBox" ToolTip="D14: ซื้อเชื่อ" CELL="D14" runat="server"
                                    Width="85px" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style4">
                                ระยะเวลาได้เครดิต
                            </td>
                            <td class="style25">
                                <asp:TextBox ID="TERM_PURCHASE_RMTextBox" ToolTip="D15: ระยะเวลาได้เครดิต" CELL="D15"
                                    Width="85px" runat="server" />
                            </td>
                            <td class="style26">
                                <asp:TextBox ID="TERM_PURCHASE_CMTextBox" ToolTip="D15: ระยะเวลาได้เครดิต" CELL="D15"
                                    Width="85px" runat="server" />
                            </td>
                            <td class="style23">
                                <asp:TextBox ID="TERM_PURCHASETextBox" ToolTip="D15: ระยะเวลาได้เครดิต" CELL="D15"
                                    Width="85px" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style4">
                                หักค่าใช้จ่ายในการดำเนินงาน
                            </td>
                            <td class="style25">
                                <asp:TextBox ID="OPERATING_EXPENSES_RMTextBox" ToolTip="DX03:หักค่าใช้จ่ายในการดำเนินงาน "
                                    CELL="DX03" Width="85px" runat="server" Height="22px" />
                            </td>
                            <td class="style26">
                                <asp:TextBox ID="OPERATING_EXPENSES_CMTextBox" ToolTip="DX03:หักค่าใช้จ่ายในการดำเนินงาน "
                                    CELL="DX03" Width="85px" runat="server" />
                            </td>
                            <td class="style23">
                                <asp:TextBox ID="OPERATING_EXPENSESTextBox" ToolTip="DX03:หักค่าใช้จ่ายในการดำเนินงาน "
                                    CELL="DX03" Width="85px" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style4">
                                หักค่าใช้จ่ายในการดำเนินงาน %
                            </td>
                            <td class="style25">
                                <asp:TextBox ID="OPERATING_EXPENSES_PERCENT_RMTextBox" ToolTip="DX04:หัก % ค่าใช้จ่ายในการดำเนินงาน "
                                    Width="85px" runat="server" />
                            </td>
                            <td class="style26">
                                <asp:TextBox ID="OPERATING_EXPENSES_PERCENT_CMTextBox" ToolTip="DX04:หัก % ค่าใช้จ่ายในการดำเนินงาน "
                                    Width="85px" runat="server" />
                            </td>
                            <td class="style23">
                                <asp:TextBox ID="OPERATING_EXPENSES_PERCENTTextBox" ToolTip="DX04:หัก % ค่าใช้จ่ายในการดำเนินงาน "
                                    Width="85px" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style4">
                                TAX
                            </td>
                            <td class="style25">
                                <asp:TextBox ID="TAX_RMTextBox" ToolTip="DX05: TAX" Width="85px" runat="server" />
                            </td>
                            <td class="style26">
                                <asp:TextBox ID="TAX_CMTextBox" ToolTip="DX05: TAX" Width="85px" runat="server" />
                            </td>
                            <td class="style23">
                                <asp:TextBox ID="TAXTextBox" ToolTip="DX05: TAX" Width="85px" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style4">
                                <strong>สินทรัพย์ ของกิจการ </strong>
                            </td>
                            <td class="style25">
                                &nbsp;
                            </td>
                            <td class="style26">
                                &nbsp;
                            </td>
                            <td class="style23">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="style4">
                                สต๊อกสินค้าจาการถามลูกค้า
                            </td>
                            <td class="style25">
                                <asp:TextBox ID="INVENTORY_INTERVIEW_RMTextBox" ToolTip="D20: สต๊อกสินค้าจาการถามลูกค้า"
                                    Width="85px" CELL="D20" runat="server" Text='<%# Bind("INVENTORY_INTERVIEW") %>' />
                            </td>
                            <td class="style26">
                                <asp:TextBox ID="INVENTORY_INTERVIEW_CMTextBox" ToolTip="D20: สต๊อกสินค้าจาการถามลูกค้า"
                                    Width="85px" CELL="D20" runat="server" Text='<%# Bind("INVENTORY_INTERVIEW") %>' />
                            </td>
                            <td class="style23">
                                <asp:TextBox ID="INVENTORY_INTERVIEWTextBox" ToolTip="D20: สต๊อกสินค้าจาการถามลูกค้า"
                                    Width="85px" CELL="D20" runat="server" Text='<%# Bind("INVENTORY_INTERVIEW") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style4">
                                สต๊อกสินค้าจากการมองเห็น / ภาพถ่าย
                            </td>
                            <td class="style25">
                                <asp:TextBox ID="INVENTORY_VISIT_RMTextBox" ToolTip="D21: สต๊อกสินค้าจากการมองเห็น"
                                    Width="85px" CELL="D21" runat="server" Text='<%# Bind("INVENTORY_VISIT") %>' />
                            </td>
                            <td class="style26">
                                <asp:TextBox ID="INVENTORY_VISIT_CMTextBox" ToolTip="D21: สต๊อกสินค้าจากการมองเห็น"
                                    Width="85px" CELL="D21" runat="server" Text='<%# Bind("INVENTORY_VISIT") %>' />
                            </td>
                            <td class="style23">
                                <asp:TextBox ID="INVENTORY_VISITTextBox" ToolTip="D21: สต๊อกสินค้าจากการมองเห็น"
                                    Width="85px" CELL="D21" runat="server" Text='<%# Bind("INVENTORY_VISIT") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style4">
                                ลูกหนี้การค้า
                            </td>
                            <td class="style25">
                                <asp:TextBox ID="ACCOUNT_RECEIVABLE_RMTextBox" ToolTip="D24: ลูกหนี้การค้า" CELL="D24"
                                    Width="85px" runat="server" Text='<%# Bind("ACCOUNT_RECEIVABLE") %>' />
                            </td>
                            <td class="style26">
                                <asp:TextBox ID="ACCOUNT_RECEIVABLE_CMTextBox" ToolTip="D24: ลูกหนี้การค้า" CELL="D24"
                                    Width="85px" runat="server" Text='<%# Bind("ACCOUNT_RECEIVABLE") %>' />
                            </td>
                            <td class="style23">
                                <asp:TextBox ID="ACCOUNT_RECEIVABLETextBox" ToolTip="D24: ลูกหนี้การค้า" CELL="D24"
                                    Width="85px" runat="server" Text='<%# Bind("ACCOUNT_RECEIVABLE") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style4">
                                สินทรัพย์หมุนเวียนอื่น ๆ</td>
                            <td class="style25">
                                <asp:TextBox ID="CURRENT_ASSET_OTHER_RMTextBox" Width="85px" runat="server"/>
                            </td>
                            <td class="style26">
                                <asp:TextBox ID="CURRENT_ASSET_OTHER_CMTextBox" Width="85px" runat="server" />
                            </td>
                            <td class="style23">
                                <asp:TextBox ID="CURRENT_ASSET_OTHERTextBox" Width="85px" runat="server"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="style31">
                                เครื่องจักร / อุปกรณ์สำนักงาน
                            </td>
                            <td class="style32">
                                <asp:TextBox ID="MACHINERY_EQUIPMENT_RMTextBox" ToolTip="D25: เครื่องจักร / อุปกรณ์สำนักงาน"
                                    Width="85px" CELL="D25" runat="server" Text='<%# Bind("MACHINERY_EQUIPMENT") %>' />
                            </td>
                            <td class="style33">
                                <asp:TextBox ID="MACHINERY_EQUIPMENT_CMTextBox" ToolTip="D25: เครื่องจักร / อุปกรณ์สำนักงาน"
                                    Width="85px" CELL="D25" runat="server" Text='<%# Bind("MACHINERY_EQUIPMENT") %>' />
                            </td>
                            <td class="style35">
                                <asp:TextBox ID="MACHINERY_EQUIPMENTTextBox" ToolTip="D25: เครื่องจักร / อุปกรณ์สำนักงาน"
                                    Width="85px" CELL="D25" runat="server" Text='<%# Bind("MACHINERY_EQUIPMENT") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style4">
                                อาคาร / ที่ดิน ที่ใช้ประกอบการ
                            </td>
                            <td class="style25">
                                <asp:TextBox ID="CORE_ASSETS_RMTextBox" ToolTip="D26: อาคาร / ที่ดิน ที่ใช้ประกอบการ"
                                    Width="85px" CELL="D26" runat="server" />
                            </td>
                            <td class="style26">
                                <asp:TextBox ID="CORE_ASSETS_CMTextBox" ToolTip="D26: อาคาร / ที่ดิน ที่ใช้ประกอบการ"
                                    Width="85px" CELL="D26" runat="server" />
                            </td>
                            <td class="style23">
                                <asp:TextBox ID="CORE_ASSETSTextBox" ToolTip="D26: อาคาร / ที่ดิน ที่ใช้ประกอบการ"
                                    Width="85px" CELL="D26" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style4">
                                สินทรัพย์ถาวรที่จำนองสถาบันการเงินอื่นๆ
                            </td>
                            <td class="style25">
                                <asp:TextBox ID="OTHER_FIXED_ASSETS_OTHER_BANK_RMTextBox" ToolTip="DX06: สินทรัพย์ถาวรที่จำนองสถาบันการเงินอื่นๆ "
                                    Width="85px" runat="server" />
                            </td>
                            <td class="style26">
                                <asp:TextBox ID="OTHER_FIXED_ASSETS_OTHER_BANK_CMTextBox" ToolTip="DX06: สินทรัพย์ถาวรที่จำนองสถาบันการเงินอื่นๆ "
                                    Width="85px" runat="server" />
                            </td>
                            <td class="style23">
                                <asp:TextBox ID="OTHER_FIXED_ASSETS_OTHER_BANKTextBox" ToolTip="DX06: สินทรัพย์ถาวรที่จำนองสถาบันการเงินอื่นๆ "
                                    Width="85px" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style4">
                                สินทรัพย์ถาวรอื่น ๆ&nbsp;
                            </td>
                            <td class="style25">
                                <asp:TextBox ID="OTHER_FIXED_ASSETS_RMTextBox" ToolTip="D27: สินทรัพย์ถาวรอื่น ๆ"
                                    CELL="D27" Width="85px" runat="server" Text='<%# Bind("OTHER_FIXED_ASSETS") %>' />
                            </td>
                            <td class="style26">
                                <asp:TextBox ID="OTHER_FIXED_ASSETS_CMTextBox" ToolTip="D27: สินทรัพย์ถาวรอื่น ๆ"
                                    CELL="D27" Width="85px" runat="server" Text='<%# Bind("OTHER_FIXED_ASSETS") %>' />
                            </td>
                            <td class="style23">
                                <asp:TextBox ID="OTHER_FIXED_ASSETSTextBox" ToolTip="D27: สินทรัพย์ถาวรอื่น ๆ" CELL="D27"
                                    Width="85px" runat="server" Text='<%# Bind("OTHER_FIXED_ASSETS") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style4">
                                เงินสด / ฝาก / พันธบัตร
                            </td>
                            <td class="style25">
                                <asp:TextBox ID="CASH_BOND_RMTextBox" ToolTip="D28: เงินสด / ฝาก / พันธบัตร" CELL="D28"
                                    Width="85px" runat="server" Text='<%# Bind("CASH_BOND") %>' />
                            </td>
                            <td class="style26">
                                <asp:TextBox ID="CASH_BOND_CMTextBox" ToolTip="D28: เงินสด / ฝาก / พันธบัตร" CELL="D28"
                                    Width="85px" runat="server" Text='<%# Bind("CASH_BOND") %>' />
                            </td>
                            <td class="style23">
                                <asp:TextBox ID="CASH_BONDTextBox" ToolTip="D28: เงินสด / ฝาก / พันธบัตร" CELL="D28"
                                    Width="85px" runat="server" Text='<%# Bind("CASH_BOND") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style4">
                                <strong>หนี้สิน ของกิจการ (คำนวณที่เรท)</strong>
                            </td>
                            <td class="style25">
                                <asp:TextBox ID="CALCULATE_RATE_RMTextBox" ToolTip="D29: คำนวณที่เรท" CELL="D29"
                                    runat="server" Width="85px" Text='<%# Bind("CALCULATE_RATE") %>' />
                            </td>
                            <td class="style26">
                                <asp:TextBox ID="CALCULATE_RATE_CMTextBox" ToolTip="D29: คำนวณที่เรท" CELL="D29"
                                    runat="server" Width="85px" Text='<%# Bind("CALCULATE_RATE") %>' />
                            </td>
                            <td class="style23">
                                <asp:TextBox ID="CALCULATE_RATETextBox" ToolTip="D29: คำนวณที่เรท" CELL="D29" runat="server"
                                    Width="85px" Text='<%# Bind("CALCULATE_RATE") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style4">
                                เจ้าหนี้การค้า
                            </td>
                            <td class="style25">
                                <asp:TextBox ID="ACCOUNT_PAYABLE_RMTextBox" ToolTip="D30: เจ้าหนี้การค้า" CELL="D30"
                                    Width="85px" runat="server" Text='<%# Bind("ACCOUNT_PAYABLE") %>' />
                            </td>
                            <td class="style26">
                                <asp:TextBox ID="ACCOUNT_PAYABLE_CMTextBox" ToolTip="D30: เจ้าหนี้การค้า" CELL="D30"
                                    Width="85px" runat="server" Text='<%# Bind("ACCOUNT_PAYABLE") %>' />
                            </td>
                            <td class="style23">
                                <asp:TextBox ID="ACCOUNT_PAYABLETextBox" ToolTip="D30: เจ้าหนี้การค้า" CELL="D30"
                                    Width="85px" runat="server" Text='<%# Bind("ACCOUNT_PAYABLE") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style4">
                                หนี้สินหมุนเวียนกับ Bay
                            </td>
                            <td class="style25">
                                <asp:TextBox ID="CURRENT_LIABILITY_BAY_RMTextBox" ToolTip="D31: หนี้สินหมุนเวียนกับ Bay"
                                    Width="85px" CELL="D31" runat="server" Text='<%# Bind("CURRENT_LIABILITY_BAY") %>' />
                            </td>
                            <td class="style26">
                                <asp:TextBox ID="CURRENT_LIABILITY_BAY_CMTextBox" ToolTip="D31: หนี้สินหมุนเวียนกับ Bay"
                                    Width="85px" CELL="D31" runat="server" Text='<%# Bind("CURRENT_LIABILITY_BAY") %>' />
                            </td>
                            <td class="style23">
                                <asp:TextBox ID="CURRENT_LIABILITY_BAYTextBox" ToolTip="D31: หนี้สินหมุนเวียนกับ Bay"
                                    Width="85px" CELL="D31" runat="server" Text='<%# Bind("CURRENT_LIABILITY_BAY") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style4">
                                หนี้สินหมุนเวีัยนกับสถาบันการเงินอื่น
                            </td>
                            <td class="style25">
                                <asp:TextBox ID="CURRENT_LIABILITY_OTHER_BANK_RMTextBox" runat="server" ToolTip="D32: หนี้สินหมุนเวีัยนกับสถาบันการเงินอื่น"
                                    Width="85px" CELL="D32" Text='<%# Bind("CURRENT_LIABILITY_OTHER_BANK") %>' />
                            </td>
                            <td class="style26">
                                <asp:TextBox ID="CURRENT_LIABILITY_OTHER_BANK_CMTextBox" runat="server" ToolTip="D32: หนี้สินหมุนเวีัยนกับสถาบันการเงินอื่น"
                                    Width="85px" CELL="D32" Text='<%# Bind("CURRENT_LIABILITY_OTHER_BANK") %>' />
                            </td>
                            <td class="style23">
                                <asp:TextBox ID="CURRENT_LIABILITY_OTHER_BANKTextBox" runat="server" ToolTip="D32: หนี้สินหมุนเวีัยนกับสถาบันการเงินอื่น"
                                    Width="85px" CELL="D32" Text='<%# Bind("CURRENT_LIABILITY_OTHER_BANK") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style4">
                                หนี้สินหมุนเวียนอื่น ๆ
                            </td>
                            <td class="style25">
                                <asp:TextBox ID="OTHER_CURRENT_LIABILITY_RMTextBox" ToolTip="D33: หนี้สินหมุนเวียนอื่น ๆ"
                                    Width="85px" CELL="D33" runat="server" Text='<%# Bind("OTHER_CURRENT_LIABILITY") %>' />
                            </td>
                            <td class="style26">
                                <asp:TextBox ID="OTHER_CURRENT_LIABILITY_CMTextBox" ToolTip="D33: หนี้สินหมุนเวียนอื่น ๆ"
                                    Width="85px" CELL="D33" runat="server" Text='<%# Bind("OTHER_CURRENT_LIABILITY") %>' />
                            </td>
                            <td class="style23">
                                <asp:TextBox ID="OTHER_CURRENT_LIABILITYTextBox" ToolTip="D33: หนี้สินหมุนเวียนอื่น ๆ"
                                    Width="85px" CELL="D33" runat="server" Text='<%# Bind("OTHER_CURRENT_LIABILITY") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style4">
                                หนี้สินระยะยาวกับ Bay&nbsp;(อายุหนี้เกิน 1 ปี)
                            </td>
                            <td class="style25">
                                <asp:TextBox ID="LONG_TERM_LIABILITY_BAY_RMTextBox" ToolTip="D34: หนี้สินระยะยาวกับ Bay"
                                    Width="85px" CELL="D34" runat="server" Text='<%# Bind("LONG_TERM_LIABILITY_BAY") %>' />
                            </td>
                            <td class="style26">
                                <asp:TextBox ID="LONG_TERM_LIABILITY_BAY_CMTextBox" ToolTip="D34: หนี้สินระยะยาวกับ Bay"
                                    Width="85px" CELL="D34" runat="server" Text='<%# Bind("LONG_TERM_LIABILITY_BAY") %>' />
                            </td>
                            <td class="style23">
                                <asp:TextBox ID="LONG_TERM_LIABILITY_BAYTextBox" ToolTip="D34: หนี้สินระยะยาวกับ Bay"
                                    Width="85px" CELL="D34" runat="server" Text='<%# Bind("LONG_TERM_LIABILITY_BAY") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style4">
                                ภาระผ่อนชำระต่อเดือน
                            </td>
                            <td class="style25">
                                <asp:TextBox ID="LONG_TERM_LIABILITY_BAY_REPAYMENT_RMTextBox" runat="server" ToolTip="D35: ภาระผ่อนชำระต่อเดือน"
                                    Width="85px" CELL="D35" Text='<%# Bind("LONG_TERM_LIABILITY_BAY_REPAYMENT") %>' />
                            </td>
                            <td class="style26">
                                <asp:TextBox ID="LONG_TERM_LIABILITY_BAY_REPAYMENT_CMTextBox" runat="server" ToolTip="D35: ภาระผ่อนชำระต่อเดือน"
                                    Width="85px" CELL="D35" Text='<%# Bind("LONG_TERM_LIABILITY_BAY_REPAYMENT") %>' />
                            </td>
                            <td class="style23">
                                <asp:TextBox ID="LONG_TERM_LIABILITY_BAY_REPAYMENTTextBox" runat="server" ToolTip="D35: ภาระผ่อนชำระต่อเดือน"
                                    Width="85px" CELL="D35" Text='<%# Bind("LONG_TERM_LIABILITY_BAY_REPAYMENT") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style4">
                                หนี้สินระยะยาวกับสถาบันการเงินอื่น (เกิน 1 ปี)
                            </td>
                            <td class="style25">
                                <asp:TextBox ID="LONG_TERM_LIABILITY_OTHER_BANK_RMTextBox" runat="server" ToolTip="D36: หนี้สินระยะยาวกับสถาบันการเงินอื่น (เกิน 1 ปี)"
                                    Width="85px" CELL="D36" Text='<%# Bind("LONG_TERM_LIABILITY_OTHER_BANK") %>' />
                            </td>
                            <td class="style26">
                                <asp:TextBox ID="LONG_TERM_LIABILITY_OTHER_BANK_CMTextBox" runat="server" ToolTip="D36: หนี้สินระยะยาวกับสถาบันการเงินอื่น (เกิน 1 ปี)"
                                    Width="85px" CELL="D36" Text='<%# Bind("LONG_TERM_LIABILITY_OTHER_BANK") %>' />
                            </td>
                            <td class="style23">
                                <asp:TextBox ID="LONG_TERM_LIABILITY_OTHER_BANKTextBox" runat="server" ToolTip="D36: หนี้สินระยะยาวกับสถาบันการเงินอื่น (เกิน 1 ปี)"
                                    Width="85px" CELL="D36" Text='<%# Bind("LONG_TERM_LIABILITY_OTHER_BANK") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style4">
                                ภาระผ่อนชำระต่อเดือน
                            </td>
                            <td class="style25">
                                <asp:TextBox ID="LONG_TERM_LIABILITY_OTHER_REPAYMENT_RMTextBox" runat="server" ToolTip="D37: ภาระผ่อนชำระต่อเดือน"
                                    Width="85px" CELL="D37" Text='<%# Bind("LONG_TERM_LIABILITY_OTHER_REPAYMENT") %>' />
                            </td>
                            <td class="style26">
                                <asp:TextBox ID="LONG_TERM_LIABILITY_OTHER_REPAYMENT_CMTextBox" runat="server" ToolTip="D37: ภาระผ่อนชำระต่อเดือน"
                                    Width="85px" CELL="D37" Text='<%# Bind("LONG_TERM_LIABILITY_OTHER_REPAYMENT") %>' />
                            </td>
                            <td class="style23">
                                <asp:TextBox ID="LONG_TERM_LIABILITY_OTHER_REPAYMENTTextBox" runat="server" ToolTip="D37: ภาระผ่อนชำระต่อเดือน"
                                    Width="85px" CELL="D37" Text='<%# Bind("LONG_TERM_LIABILITY_OTHER_REPAYMENT") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style4">
                                หนี้สินระยะยาวอื่น ๆ (อายุเกิน 1 ปี)
                            </td>
                            <td class="style25">
                                <asp:TextBox ID="LONG_TERM_OTHER_LIABILITY_RMTextBox" runat="server" ToolTip="D38: หนี้สินระยะยาวอื่น ๆ (อายุเกิน 1 ปี)"
                                    Width="85px" CELL="D38" Text='<%# Bind("LONG_TERM_OTHER_LIABILITY") %>' />
                            </td>
                            <td class="style26">
                                <asp:TextBox ID="LONG_TERM_OTHER_LIABILITY_CMTextBox" runat="server" ToolTip="D38: หนี้สินระยะยาวอื่น ๆ (อายุเกิน 1 ปี)"
                                    Width="85px" CELL="D38" Text='<%# Bind("LONG_TERM_OTHER_LIABILITY") %>' />
                            </td>
                            <td class="style23">
                                <asp:TextBox ID="LONG_TERM_OTHER_LIABILITYTextBox" runat="server" ToolTip="D38: หนี้สินระยะยาวอื่น ๆ (อายุเกิน 1 ปี)"
                                    Width="85px" CELL="D38" Text='<%# Bind("LONG_TERM_OTHER_LIABILITY") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style4">
                                ภาระผ่อนชำระต่อเดือน
                            </td>
                            <td class="style25">
                                <asp:TextBox ID="LONG_TERM_OTHER_REPAYMENT_RMTextBox" runat="server" ToolTip="D39: ภาระผ่อนชำระต่อเดือน"
                                    Width="85px" CELL="D39" Text='<%# Bind("LONG_TERM_OTHER_REPAYMENT") %>' />
                            </td>
                            <td class="style26">
                                <asp:TextBox ID="LONG_TERM_OTHER_REPAYMENT_CMTextBox" runat="server" ToolTip="D39: ภาระผ่อนชำระต่อเดือน"
                                    Width="85px" CELL="D39" Text='<%# Bind("LONG_TERM_OTHER_REPAYMENT") %>' />
                            </td>
                            <td class="style23">
                                <asp:TextBox ID="LONG_TERM_OTHER_REPAYMENTTextBox" runat="server" ToolTip="D39: ภาระผ่อนชำระต่อเดือน"
                                    Width="85px" CELL="D39" Text='<%# Bind("LONG_TERM_OTHER_REPAYMENT") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style4">
                                เงินกู้ยืมกรรมการ
                            </td>
                            <td class="style25">
                                <asp:TextBox ID="LOANS_REL_CO_DIRECTORS_RMTextBox" ToolTip="D40: เงินกู้ยืมกรรมการ"
                                    Width="85px" CELL="D40" runat="server" Text='<%# Bind("LOANS_REL_CO_DIRECTORS") %>' />
                            </td>
                            <td class="style26">
                                <asp:TextBox ID="LOANS_REL_CO_DIRECTORS_CMTextBox" ToolTip="D40: เงินกู้ยืมกรรมการ"
                                    Width="85px" CELL="D40" runat="server" Text='<%# Bind("LOANS_REL_CO_DIRECTORS") %>' />
                            </td>
                            <td class="style23">
                                <asp:TextBox ID="LOANS_REL_CO_DIRECTORSTextBox" ToolTip="D40: เงินกู้ยืมกรรมการ"
                                    Width="85px" CELL="D40" runat="server" Text='<%# Bind("LOANS_REL_CO_DIRECTORS") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style4">
                                วงเงิน L/G &amp; Aval Bay (Non Cash)
                            </td>
                            <td class="style25">
                                <asp:TextBox ID="LG_AVAL_BAY_RMTextBox" ToolTip="D41: วงเงิน L/G" CELL="D41" runat="server"
                                    Width="85px" Text='<%# Bind("LG_AVAL_BAY") %>' />
                            </td>
                            <td class="style26">
                                <asp:TextBox ID="LG_AVAL_BAY_CMTextBox" ToolTip="D41: วงเงิน L/G" CELL="D41" runat="server"
                                    Width="85px" Text='<%# Bind("LG_AVAL_BAY") %>' />
                            </td>
                            <td class="style23">
                                <asp:TextBox ID="LG_AVAL_BAYTextBox" ToolTip="D41: วงเงิน L/G" CELL="D41" runat="server"
                                    Width="85px" Text='<%# Bind("LG_AVAL_BAY") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style4">
                                <strong>เฉพาะการขออนุัมัติครั้งนี้มีการ Refinance </strong>
                            </td>
                            <td class="style25">
                                &nbsp;
                            </td>
                            <td class="style26">
                                &nbsp;
                            </td>
                            <td class="style23">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="style4">
                                Refinance Working Capital จากสถาบันอื่น
                            </td>
                            <td class="style25">
                                <asp:TextBox ID="REFINANCE_WORKING_CAPITAL_OTHER_RMTextBox" runat="server" Width="85px"
                                    ToolTip="D43: Refinance Working Capital จากสถาบันอื่น" CELL="D43" Text='<%# Bind("REFINANCE_WORKING_CAPITAL_OTHER") %>' />
                            </td>
                            <td class="style26">
                                <asp:TextBox ID="REFINANCE_WORKING_CAPITAL_OTHER_CMTextBox" runat="server" Width="85px"
                                    ToolTip="D43: Refinance Working Capital จากสถาบันอื่น" CELL="D43" Text='<%# Bind("REFINANCE_WORKING_CAPITAL_OTHER") %>' />
                            </td>
                            <td class="style23">
                                <asp:TextBox ID="REFINANCE_WORKING_CAPITAL_OTHERTextBox" runat="server" Width="85px"
                                    ToolTip="D43: Refinance Working Capital จากสถาบันอื่น" CELL="D43" Text='<%# Bind("REFINANCE_WORKING_CAPITAL_OTHER") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style4">
                                Refinance Loan จากสถาบันอื่น
                            </td>
                            <td class="style25">
                                <asp:TextBox ID="REFINANCE_WORKING_LOAN_OTHER_RMTextBox" runat="server" Width="85px"
                                    ToolTip="D44: Refinance Loan จากสถาบันอื่น" CELL="D44" Text='<%# Bind("REFINANCE_WORKING_LOAN_OTHER") %>' />
                            </td>
                            <td class="style26">
                                <asp:TextBox ID="REFINANCE_WORKING_LOAN_OTHER_CMTextBox" runat="server" Width="85px"
                                    ToolTip="D44: Refinance Loan จากสถาบันอื่น" CELL="D44" Text='<%# Bind("REFINANCE_WORKING_LOAN_OTHER") %>' />
                            </td>
                            <td class="style23">
                                <asp:TextBox ID="REFINANCE_WORKING_LOAN_OTHERTextBox" runat="server" Width="85px"
                                    ToolTip="D44: Refinance Loan จากสถาบันอื่น" CELL="D44" Text='<%# Bind("REFINANCE_WORKING_LOAN_OTHER") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style4">
                                ภาระการผ่อนหนี้ Loan ที่ Refinance
                            </td>
                            <td class="style25">
                                <asp:TextBox ID="REFINANCE_REPAYMENT_RMTextBox" ToolTip="D45: ภาระการผ่อนหนี้ Loan ที่ Refinance"
                                    Width="85px" CELL="D45" runat="server" Text='<%# Bind("REFINANCE_REPAYMENT") %>' />
                            </td>
                            <td class="style26">
                                <asp:TextBox ID="REFINANCE_REPAYMENT_CMTextBox" ToolTip="D45: ภาระการผ่อนหนี้ Loan ที่ Refinance"
                                    Width="85px" CELL="D45" runat="server" Text='<%# Bind("REFINANCE_REPAYMENT") %>' />
                            </td>
                            <td class="style23">
                                <asp:TextBox ID="REFINANCE_REPAYMENTTextBox" ToolTip="D45: ภาระการผ่อนหนี้ Loan ที่ Refinance"
                                    Width="85px" CELL="D45" runat="server" Text='<%# Bind("REFINANCE_REPAYMENT") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style4">
                                <strong>หลักประกันรวมทั้งหมด </strong>
                            </td>
                            <td class="style25">
                                &nbsp;
                            </td>
                            <td class="style26">
                                &nbsp;
                            </td>
                            <td class="style23">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="style4">
                                ราคาประเมินหลักทรัพย์ Zone A
                            </td>
                            <td class="style25">
                                <asp:TextBox ID="APPRAISAL_VALUE_ZONE_A_RMTextBox" ToolTip="I39: ราคาประเมินหลักทรัพย์ Zone A"
                                    Width="85px" CELL="I39" runat="server" Text='<%# Bind("APPRAISAL_VALUE_ZONE_A") %>' />
                            </td>
                            <td class="style26">
                                <asp:TextBox ID="APPRAISAL_VALUE_ZONE_A_CMTextBox" ToolTip="I39: ราคาประเมินหลักทรัพย์ Zone A"
                                    Width="85px" CELL="I39" runat="server" Text='<%# Bind("APPRAISAL_VALUE_ZONE_A") %>' />
                            </td>
                            <td class="style23">
                                <asp:TextBox ID="APPRAISAL_VALUE_ZONE_ATextBox" ToolTip="I39: ราคาประเมินหลักทรัพย์ Zone A"
                                    Width="85px" CELL="I39" runat="server" Text='<%# Bind("APPRAISAL_VALUE_ZONE_A") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style4">
                                ราคาประเมินหลักทรัพย์ Zone B
                            </td>
                            <td class="style25">
                                <asp:TextBox ID="APPRAISAL_VALUE_ZONE_B_RMTextBox" ToolTip="I40: ราคาประเมินหลักทรัพย์ Zone B"
                                    Width="85px" CELL="I40" runat="server" Text='<%# Bind("APPRAISAL_VALUE_ZONE_B") %>' />
                            </td>
                            <td class="style26">
                                <asp:TextBox ID="APPRAISAL_VALUE_ZONE_B_CMTextBox" ToolTip="I40: ราคาประเมินหลักทรัพย์ Zone B"
                                    Width="85px" CELL="I40" runat="server" Text='<%# Bind("APPRAISAL_VALUE_ZONE_B") %>' />
                            </td>
                            <td class="style23">
                                <asp:TextBox ID="APPRAISAL_VALUE_ZONE_BTextBox" ToolTip="I40: ราคาประเมินหลักทรัพย์ Zone B"
                                    Width="85px" CELL="I40" runat="server" Text='<%# Bind("APPRAISAL_VALUE_ZONE_B") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style4">
                                ราคาประเมินหลักทรัพย์ Zone C
                            </td>
                            <td class="style25">
                                <asp:TextBox ID="APPRAISAL_VALUE_ZONE_C_RMTextBox" ToolTip="I41: ราคาประเมินหลักทรัพย์ Zone C"
                                    Width="85px" CELL="I41" runat="server" Text='<%# Bind("APPRAISAL_VALUE_ZONE_C") %>' />
                            </td>
                            <td class="style26">
                                <asp:TextBox ID="APPRAISAL_VALUE_ZONE_C_CMTextBox" ToolTip="I41: ราคาประเมินหลักทรัพย์ Zone C"
                                    Width="85px" CELL="I41" runat="server" Text='<%# Bind("APPRAISAL_VALUE_ZONE_C") %>' />
                            </td>
                            <td class="style23">
                                <asp:TextBox ID="APPRAISAL_VALUE_ZONE_CTextBox" ToolTip="I41: ราคาประเมินหลักทรัพย์ Zone C"
                                    Width="85px" CELL="I41" runat="server" Text='<%# Bind("APPRAISAL_VALUE_ZONE_C") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style4">
                                ราคาประเมินหลักทรัพย์ Zone D
                            </td>
                            <td class="style25">
                                <asp:TextBox ID="APPRAISAL_VALUE_ZONE_D_RMTextBox" ToolTip="I42: ราคาประเมินหลักทรัพย์ Zone D"
                                    Width="85px" CELL="I42" runat="server" Text='<%# Bind("APPRAISAL_VALUE_ZONE_D") %>' />
                            </td>
                            <td class="style26">
                                <asp:TextBox ID="APPRAISAL_VALUE_ZONE_D_CMTextBox" ToolTip="I42: ราคาประเมินหลักทรัพย์ Zone D"
                                    Width="85px" CELL="I42" runat="server" Text='<%# Bind("APPRAISAL_VALUE_ZONE_D") %>' />
                            </td>
                            <td class="style23">
                                <asp:TextBox ID="APPRAISAL_VALUE_ZONE_DTextBox" ToolTip="I42: ราคาประเมินหลักทรัพย์ Zone D"
                                    Width="85px" CELL="I42" runat="server" Text='<%# Bind("APPRAISAL_VALUE_ZONE_D") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style4">
                                ราคาประเมินหลักทรัพย์ Zone E
                            </td>
                            <td class="style25">
                                <asp:TextBox ID="APPRAISAL_VALUE_ZONE_E_RMTextBox" ToolTip="I43: ราคาประเมินหลักทรัพย์ Zone E"
                                    Width="85px" CELL="I43" runat="server" Text='<%# Bind("APPRAISAL_VALUE_ZONE_E") %>' />
                            </td>
                            <td class="style26">
                                <asp:TextBox ID="APPRAISAL_VALUE_ZONE_E_CMTextBox" ToolTip="I43: ราคาประเมินหลักทรัพย์ Zone E"
                                    Width="85px" CELL="I43" runat="server" Text='<%# Bind("APPRAISAL_VALUE_ZONE_E") %>' />
                            </td>
                            <td class="style23">
                                <asp:TextBox ID="APPRAISAL_VALUE_ZONE_ETextBox" ToolTip="I43: ราคาประเมินหลักทรัพย์ Zone E"
                                    Width="85px" CELL="I43" runat="server" Text='<%# Bind("APPRAISAL_VALUE_ZONE_E") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style4">
                                จำนำเงินฝาก &amp; พันธบัตร 100%
                            </td>
                            <td class="style25">
                                <asp:TextBox ID="BOND_DEPOSIT_PLEDGE_RMTextBox" ToolTip="I44: จำนำเงินฝาก" CELL="I44"
                                    Width="85px" runat="server" Text='<%# Bind("BOND_DEPOSIT_PLEDGE") %>' />
                            </td>
                            <td class="style26">
                                <asp:TextBox ID="BOND_DEPOSIT_PLEDGE_CMTextBox" ToolTip="I44: จำนำเงินฝาก" CELL="I44"
                                    Width="85px" runat="server" Text='<%# Bind("BOND_DEPOSIT_PLEDGE") %>' />
                            </td>
                            <td class="style23">
                                <asp:TextBox ID="BOND_DEPOSIT_PLEDGETextBox" ToolTip="I44: จำนำเงินฝาก" CELL="I44"
                                    Width="85px" runat="server" Text='<%# Bind("BOND_DEPOSIT_PLEDGE") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style4">
                                &nbsp;
                            </td>
                            <td class="style25">
                                <asp:TextBox ID="TOTAL_AMOUNT_OF_COLLATERAL_RMTextBox" ToolTip="T17 : ราคารวมประเมินหลักทรัพย์"
                                    Width="85px" CELL="T17" runat="server" />
                            </td>
                            <td class="style26">
                                <asp:TextBox ID="TOTAL_AMOUNT_OF_COLLATERAL_CMTextBox" ToolTip="T17 : ราคารวมประเมินหลักทรัพย์"
                                    Width="85px" CELL="T17" runat="server" />
                            </td>
                            <td class="style23">
                                <asp:TextBox ID="TOTAL_AMOUNT_OF_COLLATERALTextBox" ToolTip="T17 : ราคารวมประเมินหลักทรัพย์"
                                    Width="85px" CELL="T17" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style4">
                                &nbsp;
                            </td>
                            <td class="style25">
                                <asp:TextBox ID="DEFAULT_MARGIN_RMTextBox" runat="server" CELL="D16" Text='<%# Bind("DEFAULT_MARGIN") %>'
                                    ToolTip="D16: Default Margin" Width="85px" />
                            </td>
                            <td class="style26">
                                <asp:TextBox ID="DEFAULT_MARGIN_CMTextBox" runat="server" CELL="D16" Text='<%# Bind("DEFAULT_MARGIN") %>'
                                    ToolTip="D16: Default Margin" Width="85px" />
                            </td>
                            <td class="style23">
                                <asp:TextBox ID="DEFAULT_MARGINTextBox" runat="server" CELL="D16" ToolTip="D16: Default Margin"
                                    Width="85px" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <div id="tab2">
            <div class="data">
                <div class="data-header">
                    <b>สมมุติฐานงบการเงิน</b>
                </div>
                <div class="data-content">
                    <table style="bgcolor: #FFFFCC" class="tableData">
                        <tr>
                            <td class="style22">
                            </td>
                            <td class="style1">
                                <strong><span class="style3">RM</span></strong><span class="style3">
                            </td>
                            <td class="style1">
                                <strong><span class="style3">CM</span></strong>
                            </td>
                            <td class="style1">
                                <strong>DEFAULT</strong>
                            </td>
                        </tr>
                        <tr>
                            <td class="style22">
                                <strong>สินทรัพย์</strong>
                            </td>
                            <td class="style79">
                                &nbsp;
                            </td>
                            <td class="style2">
                                &nbsp;
                            </td>
                            <td class="style30">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="style22">
                                <strong>สินทรัุพย์หมุนเวียน</strong>
                            </td>
                            <td class="style79">
                                &nbsp;
                            </td>
                            <td class="style2">
                                &nbsp;
                            </td>
                            <td class="style30">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="style22">
                                เงินสด/ฝาก/พันธบัตร
                            </td>
                            <td class="style79">
                                <asp:TextBox ID="CASH_BOND_CAL_RMTextBox" ToolTip=" I9:เงินสด/ฝาก/พันธบัตร" CELL="I9"
                                    Width="85px" runat="server" Text='<%# Bind("CASH_BOND_CAL") %>' />
                            </td>
                            <td class="style2">
                                <asp:TextBox ID="CASH_BOND_CAL_CMTextBox" ToolTip=" I9:เงินสด/ฝาก/พันธบัตร" CELL="I9"
                                    Width="85px" runat="server" />
                            </td>
                            <td class="style30">
                                <asp:TextBox ID="CASH_BOND_CALTextBox" ToolTip=" I9:เงินสด/ฝาก/พันธบัตร" CELL="I9"
                                    Width="85px" runat="server"  />
                            </td>
                        </tr>
                        <tr>
                            <td class="style22">
                                ลูกหนี้การค้า
                            </td>
                            <td class="style79">
                                <asp:TextBox ID="ACCOUNT_RECEIVABLE_CAL_RMTextBox" ToolTip="I10: ลูกหนี้การค้า" CELL="I10"
                                    Width="85px" runat="server" Text='<%# Bind("ACCOUNT_RECEIVABLE_CAL") %>' />
                            </td>
                            <td class="style2">
                                <asp:TextBox ID="ACCOUNT_RECEIVABLE_CAL_CMTextBox" ToolTip="I10: ลูกหนี้การค้า" CELL="I10"
                                    Width="85px" runat="server" Text='<%# Bind("ACCOUNT_RECEIVABLE_CAL") %>' />
                            </td>
                            <td class="style30">
                                <asp:TextBox ID="ACCOUNT_RECEIVABLE_CALTextBox" ToolTip="I10: ลูกหนี้การค้า" CELL="I10"
                                    Width="85px" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style22">
                                สต๊อกสินค้า&nbsp;&nbsp;
                            </td>
                            <td class="style79">
                                <asp:TextBox ID="INVENTORY_CAL_RMTextBox" ToolTip="I11: สต๊อกสินค้า" CELL="I11" runat="server"
                                    Width="85px" />
                            </td>
                            <td class="style2">
                                <asp:TextBox ID="INVENTORY_CAL_CMTextBox" ToolTip="I11: สต๊อกสินค้า" CELL="I11" runat="server"
                                    Width="85px" />
                            </td>
                            <td class="style30">
                                <asp:TextBox ID="INVENTORY_CALTextBox" ToolTip="I11: สต๊อกสินค้า" CELL="I11" runat="server"
                                    Width="85px" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style22">
                                สินทรัพย์หมุนเวียนอื่น ๆ</td>
                            <td class="style79">
                                <asp:TextBox ID="CURRENT_ASSET_OTHER_CAL_RMTextBox" Width="85px" runat="server"/>
                            </td>
                            <td class="style2">
                                <asp:TextBox ID="CURRENT_ASSET_OTHER_CAL_CMTextBox" Width="85px" 
                                    runat="server"/>
                            </td>
                            <td class="style30">
                                <asp:TextBox ID="CURRENT_ASSET_OTHER_CALTextBox" Width="85px" runat="server"  />
                            </td>
                        </tr>
                        <tr>
                            <td class="style22">
                                <strong>รวมสินทรัพย์หมุนเวียน</strong>
                            </td>
                            <td class="style79">
                                <asp:TextBox ID="TOTAL_CURRENT_ASSETS_CAL_RMTextBox" ToolTip="I13:รวมสินทรัพย์หมุนเวียน"
                                    Width="85px" CELL="I13" runat="server" Text='<%# Bind("TOTAL_CURRENT_ASSETS") %>' />
                            </td>
                            <td class="style2">
                                <asp:TextBox ID="TOTAL_CURRENT_ASSETS_CAL_CMTextBox" ToolTip="I13:รวมสินทรัพย์หมุนเวียน"
                                    Width="85px" CELL="I13" runat="server" Text='<%# Bind("TOTAL_CURRENT_ASSETS") %>' />
                            </td>
                            <td class="style30">
                                <asp:TextBox ID="TOTAL_CURRENT_ASSETS_CALTextBox" ToolTip="I13:รวมสินทรัพย์หมุนเวียน"
                                    Width="85px" CELL="I13" runat="server" Text='<%# Bind("TOTAL_CURRENT_ASSETS") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style22">
                                <strong>สินทรัพย์ถาวร</strong>
                            </td>
                            <td class="style79">
                                &nbsp;
                            </td>
                            <td class="style2">
                                &nbsp;
                            </td>
                            <td class="style30">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="style22">
                                เครื่องจักร/อุปกรณ์
                            </td>
                            <td class="style79">
                                <asp:TextBox ID="MACHINERY_EQUIPMENT_CAL_RMTextBox" runat="server" ToolTip="I15:เครื่องจักร/อุปกรณ์"
                                    Width="85px" CELL="I15" Text='<%# Bind("MACHINERY_EQUIPMENT_CAL") %>' />
                            </td>
                            <td class="style2">
                                <asp:TextBox ID="MACHINERY_EQUIPMENT_CAL_CMTextBox" runat="server" ToolTip="I15:เครื่องจักร/อุปกรณ์"
                                    Width="85px" CELL="I15" Text='<%# Bind("MACHINERY_EQUIPMENT_CAL") %>' />
                            </td>
                            <td class="style30">
                                <asp:TextBox ID="MACHINERY_EQUIPMENT_CALTextBox" runat="server" ToolTip="I15:เครื่องจักร/อุปกรณ์"
                                    Width="85px" CELL="I15" Text='<%# Bind("MACHINERY_EQUIPMENT_CAL") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style22">
                                ที่ดิน/อาคาร
                            </td>
                            <td class="style79">
                                <asp:TextBox ID="PROPERTY_PLANT_BUILDING_CAL_RMTextBox" ToolTip="I16:ที่ดิน/อาคาร"
                                    CELL="I16" Width="85px" runat="server" Text='<%# Bind("PROPERTY_PLANT_BUILDING") %>' />
                            </td>
                            <td class="style2">
                                <asp:TextBox ID="PROPERTY_PLANT_BUILDING_CAL_CMTextBox" ToolTip="I16:ที่ดิน/อาคาร"
                                    CELL="I16" Width="85px" runat="server" Text='<%# Bind("PROPERTY_PLANT_BUILDING") %>' />
                            </td>
                            <td class="style30">
                                <asp:TextBox ID="PROPERTY_PLANT_BUILDING_CALTextBox" ToolTip="I16:ที่ดิน/อาคาร" CELL="I16"
                                    Width="85px" runat="server" Text='<%# Bind("PROPERTY_PLANT_BUILDING") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style22">
                                สินทรัพย์ถาวรที่จำนองสถาบันการเงินอื่น
                            </td>
                            <td class="style79">
                                <asp:TextBox ID="OTHER_FIXED_ASSETS_OTHER_BANK_CAL_RMTextBox" ToolTip="DX07: สินทรัพย์ถาวรที่จำนองสถาบันการเงินอื่นๆ "
                                    Width="85px" runat="server" />
                            </td>
                            <td class="style2">
                                <asp:TextBox ID="OTHER_FIXED_ASSETS_OTHER_BANK_CAL_CMTextBox" ToolTip="DX07: สินทรัพย์ถาวรที่จำนองสถาบันการเงินอื่นๆ "
                                    Width="85px" runat="server" />
                            </td>
                            <td class="style30">
                                <asp:TextBox ID="OTHER_FIXED_ASSETS_OTHER_BANK_CALTextBox" ToolTip="DX07: สินทรัพย์ถาวรที่จำนองสถาบันการเงินอื่นๆ "
                                    Width="85px" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style22">
                                สินทรัพย์ถาวรอื่น ๆ
                            </td>
                            <td class="style79">
                                <asp:TextBox ID="OTHER_FIXED_ASSETS_CAL_RMTextBox" ToolTip="I17:สินทรัพย์ถาวรอื่น ๆ"
                                    Width="85px" CELL="I17" runat="server" Text='<%# Bind("OTHER_FIXED_ASSETS_CAL") %>' />
                            </td>
                            <td class="style2">
                                <asp:TextBox ID="OTHER_FIXED_ASSETS_CAL_CMTextBox" ToolTip="I17:สินทรัพย์ถาวรอื่น ๆ"
                                    Width="85px" CELL="I17" runat="server" Text='<%# Bind("OTHER_FIXED_ASSETS_CAL") %>' />
                            </td>
                            <td class="style30">
                                <asp:TextBox ID="OTHER_FIXED_ASSETS_CALTextBox" ToolTip="I17:สินทรัพย์ถาวรอื่น ๆ"
                                    Width="85px" CELL="I17" runat="server" Text='<%# Bind("OTHER_FIXED_ASSETS_CAL") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style22">
                                สินทรัพย์เพิ่มจากสินเชื่อ
                            </td>
                            <td class="style79">
                                <asp:TextBox ID="ASSETS_FROM_CREDIT_CAL_RMTextBox" ToolTip="I18:สินทรัพย์เพิ่มจากสินเชื่อ"
                                    Width="85px" CELL="I18" runat="server" Text='<%# Bind("ASSETS_FROM_CREDIT") %>' />
                            </td>
                            <td class="style2">
                                <asp:TextBox ID="ASSETS_FROM_CREDIT_CAL_CMTextBox" ToolTip="I18:สินทรัพย์เพิ่มจากสินเชื่อ"
                                    Width="85px" CELL="I18" runat="server" Text='<%# Bind("ASSETS_FROM_CREDIT") %>' />
                            </td>
                            <td class="style30">
                                <asp:TextBox ID="ASSETS_FROM_CREDIT_CALTextBox" ToolTip="I18:สินทรัพย์เพิ่มจากสินเชื่อ"
                                    Width="85px" CELL="I18" runat="server" Text='<%# Bind("ASSETS_FROM_CREDIT") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style22">
                                รวมสินทรัพย์ถาวร &nbsp;
                            </td>
                            <td class="style79">
                                <asp:TextBox ID="TOTAL_FIXED_ASSETS_CAL_RMTextBox" runat="server" ToolTip="I20:รวมสินทรัพย์ถาวร"
                                    Width="85px" CELL="I20" Text='<%# Bind("TOTAL_FIXED_ASSETS") %>' />
                            </td>
                            <td class="style2">
                                <asp:TextBox ID="TOTAL_FIXED_ASSETS_CAL_CMTextBox" runat="server" ToolTip="I20:รวมสินทรัพย์ถาวร"
                                    Width="85px" CELL="I20" Text='<%# Bind("TOTAL_FIXED_ASSETS") %>' />
                            </td>
                            <td class="style30">
                                <asp:TextBox ID="TOTAL_FIXED_ASSETS_CALTextBox" runat="server" ToolTip="I20:รวมสินทรัพย์ถาวร"
                                    Width="85px" CELL="I20" Text='<%# Bind("TOTAL_FIXED_ASSETS") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style22">
                                <strong>รวมสินทรัพย์</strong>
                            </td>
                            <td class="style79">
                                <asp:TextBox ID="TOTAL_ASSETS_CAL_RMTextBox" runat="server" ToolTip="I22:รวมสินทรัพย์"
                                    Width="85px" CELL="I22" Text='<%# Bind("TOTAL_ASSETS") %>' />
                            </td>
                            <td class="style2">
                                <asp:TextBox ID="TOTAL_ASSETS_CAL_CMTextBox" runat="server" ToolTip="I22:รวมสินทรัพย์"
                                    Width="85px" CELL="I22" Text='<%# Bind("TOTAL_ASSETS") %>' />
                            </td>
                            <td class="style30">
                                <asp:TextBox ID="TOTAL_ASSETS_CALTextBox" runat="server" ToolTip="I22:รวมสินทรัพย์"
                                    Width="85px" CELL="I22" Text='<%# Bind("TOTAL_ASSETS") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style22">
                                <strong>หนี้สิน</strong>
                            </td>
                            <td class="style80">
                                &nbsp;
                            </td>
                            <td class="style34">
                                &nbsp;
                            </td>
                            <td class="style30">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="style22">
                                <strong>หนี้สินหมุนเวียน</strong>
                            </td>
                            <td class="style80">
                                &nbsp;
                            </td>
                            <td class="style34">
                                &nbsp;
                            </td>
                            <td class="style30">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="style22">
                                เจ้าหนี้การค้า
                            </td>
                            <td class="style80">
                                <asp:TextBox ID="ACCOUNT_PAYABLE_CAL_RMTextBox" ToolTip="N9:เจ้าหนี้การค้า" CELL="N9"
                                    Width="85px" runat="server" Text='<%# Bind("ACCOUNT_PAYABLE_CAL") %>' />
                            </td>
                            <td class="style34">
                                <asp:TextBox ID="ACCOUNT_PAYABLE_CAL_CMTextBox" ToolTip="N9:เจ้าหนี้การค้า" CELL="N9"
                                    Width="85px" runat="server" Text='<%# Bind("ACCOUNT_PAYABLE_CAL") %>' />
                            </td>
                            <td class="style30">
                                <asp:TextBox ID="ACCOUNT_PAYABLE_CALTextBox" ToolTip="N9:เจ้าหนี้การค้า" CELL="N9"
                                    Width="85px" runat="server" Text='<%# Bind("ACCOUNT_PAYABLE_CAL") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style22">
                                หนี้สินหมุนเวียน Bay
                            </td>
                            <td class="style80">
                                <asp:TextBox ID="CURRENT_LIABILITY_BAY_CAL_RMTextBox" ToolTip="N10:หนี้สินหมุนเวียน Bay"
                                    Width="85px" CELL="N10" runat="server" Text='' />
                            </td>
                            <td class="style34">
                                <asp:TextBox ID="CURRENT_LIABILITY_BAY_CAL_CMTextBox" ToolTip="N10:หนี้สินหมุนเวียน Bay"
                                    Width="85px" CELL="N10" runat="server" Text='' />
                            </td>
                            <td class="style30">
                                <asp:TextBox ID="CURRENT_LIABILITY_BAY_CALTextBox" ToolTip="N10:หนี้สินหมุนเวียน Bay"
                                    Width="85px" CELL="N10" runat="server" Text='' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style22">
                                หนี้สินหมุนเวียนอื่น
                            </td>
                            <td class="style80">
                                <asp:TextBox ID="OTHER_CURRENT_LIABILITY_CAL_RMTextBox" ToolTip="N11:หนี้สินหมุนเวียนอื่น"
                                    Width="85px" CELL="N11" runat="server" Text='<%# Bind("OTHER_CURRENT_LIABILITY_CAL") %>' />
                            </td>
                            <td class="style34">
                                <asp:TextBox ID="OTHER_CURRENT_LIABILITY_CAL_CMTextBox" ToolTip="N11:หนี้สินหมุนเวียนอื่น"
                                    Width="85px" CELL="N11" runat="server" Text='<%# Bind("OTHER_CURRENT_LIABILITY_CAL") %>' />
                            </td>
                            <td class="style30">
                                <asp:TextBox ID="OTHER_CURRENT_LIABILITY_CALTextBox" ToolTip="N11:หนี้สินหมุนเวียนอื่น"
                                    Width="85px" CELL="N11" runat="server" Text='<%# Bind("OTHER_CURRENT_LIABILITY_CAL") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style22">
                                <strong>รวมหนี้สินหมุนเวียน</strong>
                            </td>
                            <td class="style80">
                                <asp:TextBox ID="TOTAL_CURRENT_LIABILITY_CAL_RMTextBox" ToolTip="N13:รวมหนี้สินหมุนเวียน"
                                    Width="85px" CELL="N13" runat="server" Text='<%# Bind("TOTAL_CURRENT_LIABILITY") %>' />
                            </td>
                            <td class="style34">
                                <asp:TextBox ID="TOTAL_CURRENT_LIABILITY_CAL_CMTextBox" ToolTip="N13:รวมหนี้สินหมุนเวียน"
                                    Width="85px" CELL="N13" runat="server" Text='<%# Bind("TOTAL_CURRENT_LIABILITY") %>' />
                            </td>
                            <td class="style30">
                                <asp:TextBox ID="TOTAL_CURRENT_LIABILITY_CALTextBox" ToolTip="N13:รวมหนี้สินหมุนเวียน"
                                    Width="85px" CELL="N13" runat="server" Text='<%# Bind("TOTAL_CURRENT_LIABILITY") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style22">
                                <strong>หนี้สินระยะยาว</strong>
                            </td>
                            <td class="style80">
                                &nbsp;
                            </td>
                            <td class="style34">
                                &nbsp;
                            </td>
                            <td class="style30">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="style22">
                                หนี้สินระยะยาว Bay
                            </td>
                            <td class="style80">
                                <asp:TextBox ID="LONG_TERM_LIABILITY_BAY_CAL_RMTextBox" runat="server" CELL="N15"
                                    ToolTip="N15:หนี้สินระยะยาว Bay" Width="85px" Text='<%# Bind("LONG_TERM_LIABILITY_BAY_CAL") %>' />
                            </td>
                            <td class="style34">
                                <asp:TextBox ID="LONG_TERM_LIABILITY_BAY_CAL_CMTextBox" runat="server" CELL="N15"
                                    ToolTip="N15:หนี้สินระยะยาว Bay" Width="85px" Text='<%# Bind("LONG_TERM_LIABILITY_BAY_CAL") %>' />
                            </td>
                            <td class="style30">
                                <asp:TextBox ID="LONG_TERM_LIABILITY_BAY_CALTextBox" runat="server" CELL="N15" ToolTip="N15:หนี้สินระยะยาว Bay"
                                    Width="85px" Text='<%# Bind("LONG_TERM_LIABILITY_BAY_CAL") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style22">
                                หนี้สินระยะยาวอืน ๆ
                            </td>
                            <td class="style80">
                                <asp:TextBox ID="OTHER_LONG_TERM_LIABILITY_CAL_RMTextBox" ToolTip=" N16:หนี้สินระยะยาวอืน ๆ"
                                    Width="85px" CELL="N16" runat="server" Text='<%# Bind("OTHER_LONG_TERM_LIABILITY") %>' />
                            </td>
                            <td class="style34">
                                <asp:TextBox ID="OTHER_LONG_TERM_LIABILITY_CAL_CMTextBox" ToolTip=" N16:หนี้สินระยะยาวอืน ๆ"
                                    Width="85px" CELL="N16" runat="server" Text='<%# Bind("OTHER_LONG_TERM_LIABILITY") %>' />
                            </td>
                            <td class="style30">
                                <asp:TextBox ID="OTHER_LONG_TERM_LIABILITY_CALTextBox" ToolTip=" N16:หนี้สินระยะยาวอืน ๆ"
                                    Width="85px" CELL="N16" runat="server" Text='<%# Bind("OTHER_LONG_TERM_LIABILITY") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style22">
                                <strong>รวมหนี้สิน</strong>
                            </td>
                            <td class="style80">
                                <asp:TextBox ID="TOTAL_LIABILITY_CAL_RMTextBox" runat="server" ToolTip="N18:รวมหนี้สิน"
                                    Width="85px" CELL="N18" Text='<%# Bind("TOTAL_LIABILITY") %>' />
                            </td>
                            <td class="style34">
                                <asp:TextBox ID="TOTAL_LIABILITY_CAL_CMTextBox" runat="server" ToolTip="N18:รวมหนี้สิน"
                                    Width="85px" CELL="N18" Text='<%# Bind("TOTAL_LIABILITY") %>' />
                            </td>
                            <td class="style30">
                                <asp:TextBox ID="TOTAL_LIABILITY_CALTextBox" runat="server" ToolTip="N18:รวมหนี้สิน"
                                    Width="85px" CELL="N18" Text='<%# Bind("TOTAL_LIABILITY") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style22">
                                <strong>เงินกู้ยืมกรรมการ (ทุน)</strong>
                            </td>
                            <td class="style80">
                                <asp:TextBox ID="LOANS_REL_CO_DIRECTORS_CAL_RMTextBox" runat="server" ToolTip="N20:เงินกู้ยืมกรรมการ"
                                    Width="85px" CELL="N20" Text='<%# Bind("LOANS_REL_CO_DIRECTORS_CAL") %>' />
                            </td>
                            <td class="style34">
                                <asp:TextBox ID="LOANS_REL_CO_DIRECTORS_CAL_CMTextBox" runat="server" ToolTip="N20:เงินกู้ยืมกรรมการ"
                                    Width="85px" CELL="N20" Text='<%# Bind("LOANS_REL_CO_DIRECTORS_CAL") %>' />
                            </td>
                            <td class="style30">
                                <asp:TextBox ID="LOANS_REL_CO_DIRECTORS_CALTextBox" runat="server" ToolTip="N20:เงินกู้ยืมกรรมการ"
                                    Width="85px" CELL="N20" Text='<%# Bind("LOANS_REL_CO_DIRECTORS_CAL") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style22">
                                <strong>ทุน</strong>
                            </td>
                            <td class="style80">
                                <asp:TextBox ID="EQUITY_CAL_RMTextBox" runat="server" ToolTip="N21:ทุน" CELL="N21"
                                    Text='' Width="85px" />
                            </td>
                            <td class="style34">
                                <asp:TextBox ID="EQUITY_CAL_CMTextBox" runat="server" ToolTip="N21:ทุน" CELL="N21"
                                    Text='' Width="85px" />
                            </td>
                            <td class="style30">
                                <asp:TextBox ID="EQUITY_CALTextBox" runat="server" ToolTip="N21:ทุน" CELL="N21" Text=''
                                    Width="85px" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style22">
                                <strong>รวมหนี้สิน + ทุน</strong>
                            </td>
                            <td class="style80">
                                <asp:TextBox ID="LIABILITY_EQUITY_CAL_RMTextBox" runat="server" ToolTip="N22:รวมหนี้สิน + ทุน"
                                    Width="85px" CELL="N22" Text='<%# Bind("LIABILITY_EQUITY") %>' />
                            </td>
                            <td class="style34">
                                <asp:TextBox ID="LIABILITY_EQUITY_CAL_CMTextBox" runat="server" ToolTip="N22:รวมหนี้สิน + ทุน"
                                    Width="85px" CELL="N22" Text='<%# Bind("LIABILITY_EQUITY") %>' />
                            </td>
                            <td class="style30">
                                <asp:TextBox ID="LIABILITY_EQUITY_CALTextBox" runat="server" ToolTip="N22:รวมหนี้สิน + ทุน"
                                    Width="85px" CELL="N22" Text='<%# Bind("LIABILITY_EQUITY") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style22">
                                &nbsp;
                            </td>
                            <td class="style79">
                                &nbsp;
                            </td>
                            <td class="style2">
                                &nbsp;
                            </td>
                            <td class="style30">
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <div id="tab4">
            <div class="data">
                <div class="data-header">
                    <b>วงเงินสินเชื่อที่ขออนุมัติครั้งนี้ (RM)</b>
                </div>
                <div class="data-content">
                    <table class="style3">
                        <tr>
                            <td class="style1">
                            </td>
                            <td class="style2">
                                RM
                            </td>
                            <td class="style2">
                                CM
                            </td>
                            <td class="style2">
                                DEFAULT
                            </td>
                        </tr>
                        <tr>
                            <td class="style1">
                                Working Capital
                            </td>
                            <td class="style2">
                                <asp:TextBox ID="WORKING_CAPITAL_RMTextBox" ToolTip="I33: WORKING CAPITAL" CELL="I33"
                                    Width="85px" runat="server" Text='<%# Bind("WORKING_CAPITAL") %>' />
                            </td>
                            <td class="style2">
                                <asp:TextBox ID="WORKING_CAPITAL_CMTextBox" ToolTip="I33: WORKING CAPITAL" CELL="I33"
                                    Width="85px" runat="server" Text='<%# Bind("WORKING_CAPITAL") %>' />
                            </td>
                            <td class="style2">
                                <asp:TextBox ID="WORKING_CAPITALTextBox" ToolTip="I33: WORKING CAPITAL" CELL="I33"
                                    Width="85px" runat="server" Text='<%# Bind("WORKING_CAPITAL") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style1">
                                อัตราดอกเบี้ย Working Capital (%)
                            </td>
                            <td class="style2">
                                <asp:TextBox ID="INTEREST_RATE_PERCENT_RMTextBox" ToolTip="M33: อัตราดอกเบี้ย" CELL="M33"
                                    runat="server" Text='<%# Bind("INTEREST_RATE_PERCENT") %>' Width="85" />
                            </td>
                            <td class="style2">
                                <asp:TextBox ID="INTEREST_RATE_PERCENT_CMTextBox" ToolTip="M33: อัตราดอกเบี้ย" CELL="M33"
                                    runat="server" Text='<%# Bind("INTEREST_RATE_PERCENT") %>' Width="85" />
                            </td>
                            <td class="style2">
                                <asp:TextBox ID="INTEREST_RATE_PERCENTTextBox" ToolTip="M33: อัตราดอกเบี้ย" CELL="M33"
                                    runat="server" Text='<%# Bind("INTEREST_RATE_PERCENT") %>' Width="85px" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style1">
                                LOAN
                            </td>
                            <td class="style2">
                                <asp:TextBox ID="LOAN_RMTextBox" runat="server" ToolTip="I34: LOAN" CELL="I34" Width="85px" />
                            </td>
                            <td class="style2">
                                <asp:TextBox ID="LOAN_CMTextBox" runat="server" ToolTip="I34: LOAN" CELL="I34" Width="85px" />
                            </td>
                            <td class="style2">
                                <asp:TextBox ID="LOANTextBox" runat="server" ToolTip="I34: LOAN" CELL="I34" Width="85px" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style1">
                                อัตราดอกเบี้ย Loan (%)
                            </td>
                            <td class="style2">
                                <asp:TextBox ID="INTEREST_RATE_PERCENT_USED_RMTextBox" ToolTip="M34: อัตราดอกเบี้ย"
                                    CELL="M34" runat="server" Text='<%# Bind("INTEREST_RATE_PERCENT_USED") %>' Width="85" />
                            </td>
                            <td class="style2">
                                <asp:TextBox ID="INTEREST_RATE_PERCENT_USED_CMTextBox" ToolTip="M34: อัตราดอกเบี้ย"
                                    CELL="M34" runat="server" Text='<%# Bind("INTEREST_RATE_PERCENT_USED") %>' Width="85" />
                            </td>
                            <td class="style2">
                                <asp:TextBox ID="INTEREST_RATE_PERCENT_USEDTextBox" ToolTip="M34: อัตราดอกเบี้ย"
                                    CELL="M34" runat="server" Text='<%# Bind("INTEREST_RATE_PERCENT_USED") %>' Width="85px" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style1">
                                อายุสัญญา (ปี)
                            </td>
                            <td class="style2">
                                <asp:TextBox ID="CONTRACT_YEAR_RMTextBox" runat="server" ToolTip="O34: อายุสัญญา"
                                    Width="85" CELL="O34" Text='<%# Bind("CONTRACT_YEAR") %>' />
                            </td>
                            <td class="style2">
                                <asp:TextBox ID="CONTRACT_YEAR_CMTextBox" runat="server" ToolTip="O34: อายุสัญญา"
                                    Width="85" CELL="O34" Text='<%# Bind("CONTRACT_YEAR") %>' />
                            </td>
                            <td class="style2">
                                <asp:TextBox ID="CONTRACT_YEARTextBox" runat="server" ToolTip="O34: อายุสัญญา" Width="85"
                                    CELL="O34" Text='<%# Bind("CONTRACT_YEAR") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style1">
                                วงเงินL/G&amp;AVAL(Non-cash)
                            </td>
                            <td class="style2">
                                <asp:TextBox ID="LG_AVAL_RMTextBox" runat="server" ToolTip="I35: วงเงิน" CELL="I35"
                                    Width="85px" Text='<%# Bind("LG_AVAL") %>' />
                            </td>
                            <td class="style2">
                                <asp:TextBox ID="LG_AVAL_CMTextBox" runat="server" ToolTip="I35: วงเงิน" CELL="I35"
                                    Width="85px" Text='<%# Bind("LG_AVAL") %>' />
                            </td>
                            <td class="style2">
                                <asp:TextBox ID="LG_AVALTextBox" runat="server" ToolTip="I35: วงเงิน" CELL="I35"
                                    Width="85px" Text='<%# Bind("LG_AVAL") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style1">
                                สินทรัพย์เพิ่มจากการให้สินเชื่อ
                            </td>
                            <td class="style2">
                                <asp:TextBox ID="ASSETS_INCREASE_LOAN_RMTextBox" ToolTip="I36:สินทรัพย์เพิ่มจากการให้สินเชื่อ"
                                    Width="85px" CELL="I36" runat="server" Text='' />
                            </td>
                            <td class="style2">
                                <asp:TextBox ID="ASSETS_INCREASE_LOAN_CMTextBox" ToolTip="I36:สินทรัพย์เพิ่มจากการให้สินเชื่อ"
                                    Width="85px" CELL="I36" runat="server" Text='' />
                            </td>
                            <td class="style2">
                                <asp:TextBox ID="ASSETS_INCREASE_LOANTextBox" ToolTip="I36:สินทรัพย์เพิ่มจากการให้สินเชื่อ"
                                    Width="85px" CELL="I36" runat="server" Text='' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style1">
                                เงินฝาก/พันธบัตร บุคคลอื่นจำนำ
                            </td>
                            <td class="style2">
                                <asp:TextBox ID="BOND_DEPOSIT_PLEDGE_PERSON_RMTextBox" ToolTip="I37: เงินฝาก / พันธบัตร บุคคลอื่นจำนำ"
                                    Width="85px" CELL="I37" runat="server" Text='<%# Bind("BOND_DEPOSIT_PLEDGE_PERSON") %>' />
                            </td>
                            <td class="style2">
                                <asp:TextBox ID="BOND_DEPOSIT_PLEDGE_PERSON_CMTextBox" ToolTip="I37: เงินฝาก / พันธบัตร บุคคลอื่นจำนำ"
                                    Width="85px" CELL="I37" runat="server" Text='<%# Bind("BOND_DEPOSIT_PLEDGE_PERSON") %>' />
                            </td>
                            <td class="style2">
                                <asp:TextBox ID="BOND_DEPOSIT_PLEDGE_PERSONTextBox" ToolTip="I37: เงินฝาก / พันธบัตร บุคคลอื่นจำนำ"
                                    Width="85px" CELL="I37" runat="server" Text='<%# Bind("BOND_DEPOSIT_PLEDGE_PERSON") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style1">
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <div id="tab3">
            <table class="tableData">
                <tr>
                    <td class="style4">
                        <span class="ui-state-highlight"><strong>คำนวณจากสมมุติฐานงบการเงิน</strong></span><b>
                        </b>
                    </td>
                    <td class="style2">
                        RM
                    </td>
                    <td class="style2">
                        CM
                    </td>
                    <td class="style2">
                        DEFAULT
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        Ebitda (%)
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="EBIDA_PERCENT_CAL_RMTextBox" runat="server" ToolTip="H25: % Ebitda"
                            CELL="H25" Width="85" Text='' />
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="EBIDA_PERCENT_CAL_CMTextBox" runat="server" ToolTip="H25: % Ebitda"
                            CELL="H25" Width="85" Text='' />
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="EBIDA_PERCENT_CALTextBox" runat="server" ToolTip="H25: % Ebitda"
                            CELL="H25" Width="85px" Text='' />
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        Ebitda
                        / ปี</td>
                    <td class="style5">
                        <asp:TextBox ID="EBIDA_CAL_RMTextBox" runat="server" ToolTip="I25: Ebitda" CELL="I25"
                            Width="85px" Text='' />
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="EBIDA_CAL_CMTextBox" runat="server" ToolTip="I25: Ebitda" CELL="I25"
                            Width="85px" Text='' />
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="EBIDA_CALTextBox" runat="server" ToolTip="I25: Ebitda" CELL="I25"
                            Width="85px" Text='' />
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        D/E ก่อนขอสินเชื่อ (เท่า :1)
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="DE_BEFORE_LOAN_CAL_RMTextBox" runat="server" ToolTip="I26: D/E ก่อนขอสินเชื่อ"
                            Width="85px" CELL="I26" Text='<%# Bind("DE_BEFORE_LOAN") %>' />
                        &nbsp;
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="DE_BEFORE_LOAN_CAL_CMTextBox" runat="server" ToolTip="I26: D/E ก่อนขอสินเชื่อ"
                            Width="85px" CELL="I26" Text='<%# Bind("DE_BEFORE_LOAN") %>' />
                        &nbsp;
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="DE_BEFORE_LOAN_CALTextBox" runat="server" ToolTip="I26: D/E ก่อนขอสินเชื่อ"
                            Width="85px" CELL="I26" Text='<%# Bind("DE_BEFORE_LOAN") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="style15">
                        DSCR ก่อนขอสินเชื่อ (เท่า)
                    </td>
                    <td class="style16">
                        <asp:TextBox ID="DSCR_BEFORE_LOAN_CAL_RMTextBox" runat="server" ToolTip="I27: DSCR ก่อนขอสินเชื่อ"
                            Width="85px" CELL="I27" Text='<%# Bind("DSCR_BEFORE_LOAN") %>' />
                    </td>
                    <td class="style16">
                        <asp:TextBox ID="DSCR_BEFORE_LOAN_CAL_CMTextBox" runat="server" ToolTip="I27: DSCR ก่อนขอสินเชื่อ"
                            Width="85px" CELL="I27" Text='<%# Bind("DSCR_BEFORE_LOAN") %>' />
                    </td>
                    <td class="style16">
                        <asp:TextBox ID="DSCR_BEFORE_LOAN_CALTextBox" runat="server" ToolTip="I27: DSCR ก่อนขอสินเชื่อ"
                            Width="85px" CELL="I27" Text='<%# Bind("DSCR_BEFORE_LOAN") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        ระยะเวลาเก็บหนี้เฉลี่ย (วัน)
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="AR_DAY_CAL_RMTextBox" runat="server" ToolTip="J28: ระยะเวลาเก็บหนี้เฉลี่ย"
                            Width="85px" CELL="J28" Text='<%# Bind("AR_DAY") %>' />
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="AR_DAY_CAL_CMTextBox" runat="server" ToolTip="J28: ระยะเวลาเก็บหนี้เฉลี่ย"
                            Width="85px" CELL="J28" Text='<%# Bind("AR_DAY") %>' />
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="AR_DAY_CALTextBox" runat="server" ToolTip="J28: ระยะเวลาเก็บหนี้เฉลี่ย"
                            Width="85px" CELL="J28" Text='<%# Bind("AR_DAY") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        ระยะเวลาสต๊อกสินค้าเฉลี่ย (วัน)
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="INVENTORY_DAY_CAL_RMTextBox" runat="server" ToolTip="J29: ระยะเวลาสต๊อกสินค้าเฉลี่ย"
                            Width="85px" CELL="J29" Text='<%# Bind("INVENTORY_DAY") %>' />
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="INVENTORY_DAY_CAL_CMTextBox" runat="server" ToolTip="J29: ระยะเวลาสต๊อกสินค้าเฉลี่ย"
                            Width="85px" CELL="J29" Text='<%# Bind("INVENTORY_DAY") %>' />
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="INVENTORY_DAY_CALTextBox" runat="server" ToolTip="J29: ระยะเวลาสต๊อกสินค้าเฉลี่ย"
                            Width="85px" CELL="J29" Text='<%# Bind("INVENTORY_DAY") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        ส่วนของเจ้าของ (%)
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="OWNERS_EQUITY_PERCENT_CAL_RMTextBox" runat="server" ToolTip="M25: % ส่วนของเจ้าของ"
                            CELL="M25" Text='' Width="85px" />
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="OWNERS_EQUITY_PERCENT_CAL_CMTextBox" runat="server" ToolTip="M25: % ส่วนของเจ้าของ"
                            CELL="M25" Text='' Width="85px" />
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="OWNERS_EQUITY_PERCENT_CALTextBox" runat="server" ToolTip="M25: % ส่วนของเจ้าของ"
                            CELL="M25" Text='' Width="85px" />
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        ส่วนของเจ้าของ
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="OWNERS_EQUITY_CAL_RMTextBox" runat="server" ToolTip="N25: ส่วนของเจ้าของ"
                            Width="85px" CELL="N25" Text='<%# Bind("OWNERS_EQUITY") %>' />
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="OWNERS_EQUITY_CAL_CMTextBox" runat="server" ToolTip="N25: ส่วนของเจ้าของ"
                            Width="85px" CELL="N25" Text='<%# Bind("OWNERS_EQUITY") %>' />
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="OWNERS_EQUITY_CALTextBox" runat="server" ToolTip="N25: ส่วนของเจ้าของ"
                            Width="85px" CELL="N25" Text='<%# Bind("OWNERS_EQUITY") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        อัตราดอกเบี้ย (%)
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="FIXED_INTEREST_PERCENT_CAL_RMTextBox" runat="server" ToolTip="M27: อัตราดอกเบี้ย"
                            CELL="M27" Text='<%# Bind("FIXED_INTEREST_PERCENT") %>' Width="85px" />
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="FIXED_INTEREST_PERCENT_CAL_CMTextBox" runat="server" ToolTip="M27: อัตราดอกเบี้ย"
                            CELL="M27" Text='<%# Bind("FIXED_INTEREST_PERCENT") %>' Width="85px" />
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="FIXED_INTEREST_PERCENT_CALTextBox" runat="server" ToolTip="M27: อัตราดอกเบี้ย"
                            CELL="M27" Text='<%# Bind("FIXED_INTEREST_PERCENT") %>' Width="85px" />
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        อายุสัญญา (ปี)
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="PAYMENT_PERIOD_CAL_RMTextBox" runat="server" ToolTip="O27: อายุสัญญา"
                            CELL="O27" Text='<%# Bind("PAYMENT_PERIOD") %>' Width="85" />
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="PAYMENT_PERIOD_CAL_CMTextBox" runat="server" ToolTip="O27: อายุสัญญา"
                            CELL="O27" Text='<%# Bind("PAYMENT_PERIOD") %>' Width="85" />
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="PAYMENT_PERIOD_CALTextBox" runat="server" ToolTip="O27: อายุสัญญา"
                            Width="85px" CELL="O28" Text='<%# Bind("PAYMENT_PERIOD") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        ระยะเวลาชำระหนี้เฉลี่ย
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="AVERAGE_PAYMENT_PERIOD_CAL_RMTextBox" runat="server" ToolTip="O28: ระยะเวลาชำระหนี้เฉลี่ย"
                            Width="85px" CELL="O28" Text='<%# Bind("AVERAGE_PAYMENT_PERIOD") %>' />
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="AVERAGE_PAYMENT_PERIOD_CAL_CMTextBox" runat="server" ToolTip="O28: ระยะเวลาชำระหนี้เฉลี่ย"
                            Width="85px" CELL="O28" Text='<%# Bind("AVERAGE_PAYMENT_PERIOD") %>' />
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="AVERAGE_PAYMENT_PERIOD_CALTextBox" runat="server" ToolTip="O28: ระยะเวลาชำระหนี้เฉลี่ย"
                            Width="85px" CELL="O28" Text='<%# Bind("AVERAGE_PAYMENT_PERIOD") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        Working Capital Need
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="WORKING_CAPITAL_NEED_CAL_RMTextBox" runat="server" ToolTip="I30: Working Capital Need"
                            Width="85px" CELL="I30" Text='<%# Bind("WORKING_CAPITAL_NEED") %>' />
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="WORKING_CAPITAL_NEED_CAL_CMTextBox" runat="server" ToolTip="I30: Working Capital Need"
                            Width="85px" CELL="I30" Text='<%# Bind("WORKING_CAPITAL_NEED") %>' />
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="WORKING_CAPITAL_NEED_CALTextBox" runat="server" ToolTip="I30: Working Capital Need"
                            Width="85px" CELL="I30" Text='<%# Bind("WORKING_CAPITAL_NEED") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        Loan
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="LOAN_NEED_CAL_RMTextBox" runat="server" ToolTip="I31: Loan" CELL="I31"
                            Width="85px" Text='' />
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="LOAN_NEED_CAL_CMTextBox" runat="server" ToolTip="I31: Loan" CELL="I31"
                            Width="85px" Text='' />
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="LOAN_NEED_CALTextBox" runat="server" ToolTip="I31: Loan" CELL="I31"
                            Width="85px" Text='' />
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        Working Capital ที่ยังสามารถอนุมัติเพิ่มได้
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="WORKING_CAPITAL_APPROVE_CAL_RMTextBox" runat="server" ToolTip="N30: Working Capital"
                            Width="85px" CELL="N30" Text='<%# Bind("WORKING_CAPITAL_APPROVE") %>' />
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="WORKING_CAPITAL_APPROVE_CAL_CMTextBox" runat="server" ToolTip="N30: Working Capital"
                            Width="85px" CELL="N30" Text='<%# Bind("WORKING_CAPITAL_APPROVE") %>' />
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="WORKING_CAPITAL_APPROVE_CALTextBox" runat="server" ToolTip="N30: Working Capital"
                            Width="85px" CELL="N30" Text='<%# Bind("WORKING_CAPITAL_APPROVE") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        Loan ที่ยังสามารถอนุมัติเพิ่มได้
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="LOAN_APPROVE_CAL_RMTextBox" runat="server" ToolTip="N31: Loan" CELL="N31"
                            Width="85px" Text='<%# Bind("LOAN_APPROVE") %>' />
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="LOAN_APPROVE_CAL_CMTextBox" runat="server" ToolTip="N31: Loan" CELL="N31"
                            Width="85px" Text='<%# Bind("LOAN_APPROVE") %>' />
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="LOAN_APPROVE_CALTextBox" runat="server" ToolTip="N31: Loan" CELL="N31"
                            Width="85px" Text='<%# Bind("LOAN_APPROVE") %>' />
                    </td>
                </tr>
            </table>
        </div>
        <div id="tab5">
            <table class="style3">
                <tr>
                    <td class="style18">
                        <strong class="ui-state-highlight">ความสามารถในการก่อหนี้ </strong>&nbsp;&nbsp;
                    </td>
                    <td class="style2">
                        RM
                    </td>
                    <td class="style2">
                        CM
                    </td>
                    <td class="style2">
                        DEFAULT
                    </td>
                </tr>
                <tr>
                    <td class="style18">
                        <strong>วงเงินสินเชื่อสูงสุดที่สามารถก่อหนี้ได้</strong> &nbsp;
                    </td>
                    <td class="style2">
                        &nbsp;
                    </td>
                    <td class="style2">
                        &nbsp;
                    </td>
                    <td class="style2">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style19">
                        <span class="showDesc" desc="วงเงินหมุนเวียนที่จำเป็นสูงสุดคำนวณจากสมุติฐานของ Bay">
                            Working Capital Default</span>
                    </td>
                    <td class="style20">
                        <asp:TextBox ID="WORKING_CAPITAL_DEFAULT_RMTextBox" runat="server" ToolTip="N40: Working Capital Default"
                            Width="85px" CELL="N40" Text='<%# Bind("WORKING_CAPITAL_DEFAULT") %>' />
                    </td>
                    <td class="style20">
                        <asp:TextBox ID="WORKING_CAPITAL_DEFAULT_CMTextBox" runat="server" ToolTip="N40: Working Capital Default"
                            Width="85px" CELL="N40" Text='<%# Bind("WORKING_CAPITAL_DEFAULT") %>' />
                    </td>
                    <td class="style20">
                        <asp:TextBox ID="WORKING_CAPITAL_DEFAULTTextBox" runat="server" ToolTip="N40: Working Capital Default"
                            Width="85px" CELL="N40" Text='<%# Bind("WORKING_CAPITAL_DEFAULT") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="style18">
                        <span class="showDesc" desc="วงเงินสินเชื่อไม่หมุนเวียนที่สามารถก่อหนี้ได้สูงสุด คำนวณจาก Ebitda ของสมมุติฐานงบการเงิน">
                            Loan Default</span>
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="LOAN_DEFAULT_RMTextBox" runat="server" ToolTip="N41: Loan Default"
                            Width="85px" CELL="N41" Text='<%# Bind("LOAN_DEFAULT") %>' />
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="LOAN_DEFAULT_CMTextBox" runat="server" ToolTip="N41: Loan Default"
                            Width="85px" CELL="N41" Text='<%# Bind("LOAN_DEFAULT") %>' />
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="LOAN_DEFAULTTextBox" runat="server" ToolTip="N41: Loan Default"
                            Width="85px" CELL="N41" Text='<%# Bind("LOAN_DEFAULT") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="style18">
                        <strong>วงเงินสินเชื่อคงเหลือที่ยังสามารถอนุมัติเพิ่มได้</strong>
                    </td>
                    <td class="style2">
                        &nbsp;
                    </td>
                    <td class="style2">
                        &nbsp;
                    </td>
                    <td class="style2">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style18">
                        Working Capital ที่สามารถอนุมัติได้
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="WORKING_CAPITAL_DEFAULT_APPROVE_RMTextBox" runat="server" ToolTip=" N43: Working Capital ที่สามารถอนุมัติได้"
                            Width="85px" CELL="N43" Text='<%# Bind("WORKING_CAPITAL_DEFAULT_APPROVE") %>' />
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="WORKING_CAPITAL_DEFAULT_APPROVE_CMTextBox" runat="server" ToolTip=" N43: Working Capital ที่สามารถอนุมัติได้"
                            Width="85px" CELL="N43" Text='<%# Bind("WORKING_CAPITAL_DEFAULT_APPROVE") %>' />
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="WORKING_CAPITAL_DEFAULT_APPROVETextBox" runat="server" ToolTip=" N43: Working Capital ที่สามารถอนุมัติได้"
                            Width="85px" CELL="N43" Text='<%# Bind("WORKING_CAPITAL_DEFAULT_APPROVE") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="style18">
                        Loan ที่สามารถอนุมัติได้
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="LOAN_DEFAULT_APPROVE_RMTextBox" runat="server" ToolTip="N44: Loan ที่สามารถอนุมัติได้"
                            Width="85px" CELL="N44" Text='<%# Bind("LOAN_DEFAULT_APPROVE") %>' />
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="LOAN_DEFAULT_APPROVE_CMTextBox" runat="server" ToolTip="N44: Loan ที่สามารถอนุมัติได้"
                            Width="85px" CELL="N44" Text='<%# Bind("LOAN_DEFAULT_APPROVE") %>' />
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="LOAN_DEFAULT_APPROVETextBox" runat="server" ToolTip="N44: Loan ที่สามารถอนุมัติได้"
                            Width="85px" CELL="N44" Text='<%# Bind("LOAN_DEFAULT_APPROVE") %>' />
                    </td>
                </tr>
            </table>
        </div>
        <div id="tab6">
            <table class="style3">
                <tr>
                    <td class="style21">
                        <strong>ค่าที่คำนวณจากระบบ&nbsp;</strong>
                    </td>
                    <td class="style2">
                        &nbsp; RM
                    </td>
                    <td class="style2">
                        CM
                    </td>
                    <td class="style2">
                        DEFAULT
                    </td>
                </tr>
                <tr>
                    <td class="style21">
                        D/E ครั้งนี้ (เท่า)
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="DE_THIS_TIME_RMTextBox" ToolTip="M36: D/E ครั้งนี้" CELL="M36" runat="server"
                            Width="85px" Text='' />
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="DE_THIS_TIME_CMTextBox" ToolTip="M36: D/E ครั้งนี้" CELL="M36" runat="server"
                            Width="85px" Text='' />
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="DE_THIS_TIMETextBox" ToolTip="M36: D/E ครั้งนี้" CELL="M36" runat="server"
                            Width="85px" Text='' />
                    </td>
                </tr>
                <tr>
                    <td class="style21">
                        DSCR ครั้งนี้
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="DSCR_THIS_TIME_RMTextBox" ToolTip="M35: DSCR ครั้งนี้" CELL="M35"
                            runat="server" Width="85px" Text='<%# Bind("DSCR_THIS_TIME") %>' />
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="DSCR_THIS_TIME_CMTextBox" ToolTip="M35: DSCR ครั้งนี้" CELL="M35"
                            runat="server" Width="85px" Text='<%# Bind("DSCR_THIS_TIME") %>' />
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="DSCR_THIS_TIMETextBox" ToolTip="M35: DSCR ครั้งนี้" CELL="M35" runat="server"
                            Width="85px" Text='<%# Bind("DSCR_THIS_TIME") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="style21">
                        DSCR ครั้งนี้ (เท่า)
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="DSCR_THIS_TIME_PERCENT_RMTextBox" ToolTip="O35: DSCR %" CELL="O35"
                            runat="server" Text='<%# Bind("DSCR_THIS_TIME_PERCENT") %>' Width="85px" />
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="DSCR_THIS_TIME_PERCENT_CMTextBox" ToolTip="O35: DSCR %" CELL="O35"
                            runat="server" Text='<%# Bind("DSCR_THIS_TIME_PERCENT") %>' Width="85px" />
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="DSCR_THIS_TIME_PERCENTTextBox" ToolTip="O35: DSCR %" CELL="O35"
                            runat="server" Text='<%# Bind("DSCR_THIS_TIME_PERCENT") %>' Width="85px" />
                    </td>
                </tr>
                <tr>
                    <td class="style21">
                        LTV
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="LTV_THIS_TIME_RMTextBox" runat="server" ToolTip="M37: LTV ครั้งนี้"
                            Width="85px" CELL="M37" />
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="LTV_THIS_TIME_CMTextBox" runat="server" ToolTip="M37: LTV ครั้งนี้"
                            Width="85px" CELL="M37" />
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="LTV_THIS_TIMETextBox" runat="server" ToolTip="M37: LTV ครั้งนี้"
                            Width="85px" CELL="M37" />
                    </td>
                </tr>
                <tr>
                    <td class="style21">
                        LTV (เท่า)
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="LTV_THIS_TIME_PERCENT_RMTextBox" runat="server" ToolTip="O37: % LTV ครั้งนี้"
                            CELL="037" Width="85px" />
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="LTV_THIS_TIME_PERCENT_CMTextBox" runat="server" ToolTip="O37: % LTV ครั้งนี้"
                            CELL="037" Width="85px" />
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="LTV_THIS_TIME_PERCENTTextBox" runat="server" ToolTip="O37: % LTV ครั้งนี้"
                            CELL="037" Width="85px" />
                    </td>
                </tr>
                <tr>
                    <td class="style21">
                                กำไรจากการดำเนินงาน %
                            /เดือน</td>
                    <td class="style2">
                                <asp:TextBox ID="GROSS_PROFIT_RMTextBox" ToolTip="D17: กำไรจากการดำเนินงาน" CELL="D17"
                                    Width="85px" runat="server" Text='<%# Bind("GROSS_PROFIT") %>' />
                    </td>
                    <td class="style2">
                                <asp:TextBox ID="GROSS_PROFIT_CMTextBox" ToolTip="D17: กำไรจากการดำเนินงาน" CELL="D17"
                                    Width="85px" runat="server" Text='<%# Bind("GROSS_PROFIT") %>' />
                    </td>
                    <td class="style2">
                                <asp:TextBox ID="GROSS_PROFITTextBox" ToolTip="D17: กำไรจากการดำเนินงาน" CELL="D17"
                                    Width="85px" runat="server" Text='<%# Bind("GROSS_PROFIT") %>' />
                    </td>
                </tr>
            </table>
        </div>
        <div id="divEscalate">
            <table>
                <tr>
                    <td class="style9">
                        <span class="ui-state-highlight"><strong>ผลการคำนวณจาก Template</strong> </span>
                        &nbsp;
                    </td>
                    <td class="style11">
                    </td>
                    <td>
                        Result (ผลจาก template)
                    </td>
                </tr>
                <tr>
                    <td class="style9">
                        Debt / EBITDA
                    </td>
                    <td class="style11">
                        <asp:Label ID="DebtEbidaLabel" runat="server" Text=""></asp:Label>
                    </td>
                    <td class="style8">
                        <asp:Label ID="DebtEbidaResultLabel" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style9">
                        Debt / Equity (D/E)
                    </td>
                    <td class="style11">
                        <asp:Label ID="DebtEquityLabel" runat="server" Text=""></asp:Label>
                    </td>
                    <td class="style6">
                        <asp:Label ID="DebtEquityResultLabel" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style9">
                        DSCR
                    </td>
                    <td class="style11">
                        <asp:Label ID="DSCRLabel" runat="server" Text=""></asp:Label>
                    </td>
                    <td class="style8">
                        <asp:Label ID="DSCRResultLabel" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style9">
                        LTV
                    </td>
                    <td class="style11">
                        <asp:Label ID="LTVLabel" runat="server" Text=""></asp:Label>
                    </td>
                    <td class="style6">
                        <asp:Label ID="LTVResultLabel" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style9">
                        &nbsp;
                    </td>
                    <td class="style11">
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </table>
        </div>
        <div id="divSave">
            <table id="tableSave">
                <tr>
                    <td>
                        <span class="ui-state-highlight"><strong>ผลการอนุมัิติจากระบบ</strong></span>
                    </td>
                    <td>
                        <asp:TextBox ID="ResultApproveTextBox" runat="server" ToolTip="Rm request" Width="120px" />
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        <div id="divApprove">
                            &nbsp;</div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span class="ui-state-highlight"><strong>เปรียบเทียบผลการอนุมัติ</strong></span>
                    </td>
                    <td>
                        <table id="tableResult" style="width: 500px">
                            <tr>
                                <td>
                                    RM เสนอ
                                </td>
                                <td>
                                    CM อนุมัติ
                                </td>
                                <td>
                                    ระบบ อนุมัติ
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="RMrequestTextBox" runat="server" ToolTip="Rm request" Width="85px" />
                                </td>
                                <td>
                                    <asp:TextBox ID="CMApproveTextBox" runat="server" ToolTip="CM  approve" Width="85px" />
                                </td>
                                <td>
                                    <asp:TextBox ID="SystemApproveTextBox" runat="server" ToolTip="System approve" Width="85px" />
                                </td>
                            </tr>
                        </table>
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
                    <td>
                        <span class="ui-state-highlight"><strong>ผลการอนุมัติครั้งนี้</strong> </span>&nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        Result (ผลการอนุมัติ )
                    </td>
                    <td>
                        <asp:DropDownList ID="ProcessDropDownList" runat="server">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        หมายเหตุ
                    </td>
                    <td>
                        <asp:TextBox ID="RemarkTextBox" runat="server" Height="86px" MaxLength="500" Rows="3"
                            TextMode="MultiLine" Width="300px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        <asp:Button ID="SaveButton" runat="server" Text="Save data / บันทึกผลการอนุมัติ" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
