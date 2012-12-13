$("#TabContainer1_TabPanel1  input[type='text']").change(function () {
    // alert($(this).val());
    //alert(this.id)
    //$("#TabContainer1_TabPanel2  input[type='text']").val($(this).val());
    //alert($("[CELL='D8']").val());
    C5 = '1';
    C6 = '1';
    D8 = $("[CELL='D8']").val();
    D9 = $("[CELL='D9']").val();
    D10 = $("[CELL='D10']").val();
    D13 = $("[CELL='D13']").val();
    D14 = $("[CELL='D14']").val();
    D15 = $("[CELL='D15']").val();
    D16 = $("[CELL='D16']").val();
    D17 = $("[CELL='D17']").val();
    D20 = $("[CELL='D20']").val();
    D21 = $("[CELL='D21']").val();
    D24 = $("[CELL='D24']").val();
    D25 = $("[CELL='D25']").val();
    D26 = $("[CELL='D26']").val();
    D27 = $("[CELL='D27']").val();
    D28 = parseFloat($("[CELL='D28']").val());
    D29 = $("[CELL='D29']").val();
    D30 = $("[CELL='D30']").val();
    D31 = $("[CELL='D31']").val();
    D32 = $("[CELL='D32']").val();
    D33 = $("[CELL='D33']").val();
    D34 = $("[CELL='D34']").val();
    D35 = $("[CELL='D35']").val();
    D36 = $("[CELL='D36']").val();
    D37 = $("[CELL='D37']").val();
    D38 = $("[CELL='D38']").val();
    D39 = $("[CELL='D39']").val();
    D40 = $("[CELL='D40']").val();
    D41 = $("[CELL='D41']").val();
    D43 = $("[CELL='D43']").val();
    D44 = $("[CELL='D44']").val();
    D45 = $("[CELL='D45']").val();
    I33 = $("[CELL='I33']").val();
    I34 = $("[CELL='I34']").val();
    I35 = $("[CELL='I35']").val();
    I36 = $("[CELL='I36']").val();
    I37 = parseFloat($("[CELL='I37']").val());
    I39 = $("[CELL='I39']").val();
    I40 = $("[CELL='I40']").val();
    I41 = $("[CELL='I41']").val();
    I42 = $("[CELL='I42']").val();
    I43 = $("[CELL='I43']").val();
    I44 = $("[CELL='I44']").val();

});


function showData(C5, C6
                                , D8, D9, D10
                                , D13, D14, D15, D16, D17
                                , D20, D21, D24, D25, D26, D27, D28, D29, D30, D31, D32, D33, D34, D35, D36, D37, D38, D39, D40, D41
                                , D43, D44, D45
                                , I33, I34, I35, I36, I37
                                , I39, I40, I41, I42, I43, I44) {
    // obj.setC5(10000);
    //alert(obj);
    obj.setC5(C5);
    obj.setC6(C6);
    obj.setD8(D8);
    obj.setD9(D9);
    obj.setD10(D10);
    obj.setD13(D13);
    obj.setD14(D14);
    obj.setD15(D15);
    obj.setD16(D16);
    obj.setD17(D17);
    obj.setD20(D20);
    obj.setD21(D21);
    obj.setD24(D24);
    obj.setD25(D25);
    obj.setD26(D26);
    obj.setD27(D27);
    obj.setD28(D28);
    obj.setD29(D29);
    obj.setD30(D30);
    obj.setD31(D31);
    obj.setD32(D32);
    obj.setD33(D33);
    obj.setD34(D34);
    obj.setD35(D35);
    obj.setD36(D36);
    obj.setD37(D37);
    obj.setD38(D38);
    obj.setD39(D39);
    obj.setD40(D40);
    obj.setD41(D41);
    obj.setD43(D43);
    obj.setD44(D44);
    obj.setD45(D45);
    obj.setI33(I33);
    obj.setI34(I34);
    obj.setI35(I35);
    obj.setI36(I36);
    obj.setI37(I37);
    obj.setI39(I39);
    obj.setI40(I40);
    obj.setI41(I41);
    obj.setI42(I42);
    obj.setI43(I43);
    obj.setI44(I44);

    //$("[CELL='D8']").val(obj.getD8.toString());
    //alert(obj.I9());
    if ((D28) && (I37)) {
        $("[CELL='I9']").val(obj.I9());
    } else {
        $("[CELL='I9']").val('');
    }


}