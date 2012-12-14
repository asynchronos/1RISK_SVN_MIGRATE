<%@ Page Language="VB" AutoEventWireup="true" CodeFile="AnnalsCredit.aspx.vb" Inherits="_AnnalsCredit"
    Trace="false" MaintainScrollPositionOnPostback="true" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>
<%@ Register Assembly="Mytextbox" Namespace="Mytextbox" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31BF3856AD364E35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<html>
<head id="Head1" runat="server">
    <title>SME CA</title>
    <script src="../../js/jquery.js" type="text/javascript"></script>
    <script src="../../js/jquery.numberformater.js" type="text/javascript"></script>
    <script type="text/javascript" id="commonJs" src="../../js/common.js"></script>
    <script type="text/javascript">
        var timerId = 0;
        var caId;
        var checkURD = false;

        $(document).ready(function () {

            $('#REFERENCETextBox').blur(function () {
                try {
                    if ($('#REFERENCETextBox').attr('CheckDup') == '' && $('#REFERENCETextBox').val() != '') {  // ถ้ายังไม่มีการเช็ค referenc ให้ทำ
                        var refid = $('#REFERENCETextBox').val();
                        findRefID(refid)
                    } //   if ($('#REFERENCETextBox').attr('checkdup') == '') {   
                }  // try
                catch (err) {
                    var txt = "There was an error on this page(on blur).\n\n";
                    txt += "Error description : " + err.description + "\n\n";
                    txt += "Click OK to close window.\n\n";
                    alert(txt);
                    window.close();
                }
            }); //  $('#REFERENCETextBox').blur(function() {
            // ถ้ามีการเปลี่ยนแปลงค่าให้ checkref ใหม่ กำหนดให้ยังไม่ได้เช็ค dup
            $('#REFERENCETextBox').change(function () {
                $('#REFERENCETextBox').attr('CheckDup', '');
                $('#ValidateResultLabel').html('');
            });

            caId = $("#LblAnnalsid").attr("title"); //getValueFromQueryString("annals_id");

            if (caId.length == 10) {
                try {

                    // var service = new SmeWeb.CAWCFService();
                    // service.IsCIFInWatchList(caId, onSuccessCheckWatchList, onFailedCheckWatchList, null);

                    // localhost.CAWCFService.IsCIFInWatchList(caId, onSuccessCheckWatchList, onFailedCheckWatchList, null);

                }
                catch (err) {

                    var txt = "There was an error on this page(CAWCFService).\n\n";
                    txt += "Error description : " + err.description + "\n\n";
                    alert(txt);

                }
            }

            timerId = setInterval(blink, 1000);
            function blink() {
                var d = $("#spanCIFWatchListByCIF");

                if (d) {
                    if (d.hasClass("navy")) {
                        d.removeClass("navy");
                        d.addClass("red");
                    } else {
                        d.removeClass("red");
                        d.addClass("navy");
                    }
                }
            }

            //remove check event on idout if already has idout
            if ($("#tbID_OUT").val().length > 0) {
                //remove check event on idout
                $("#btnIDOUT").removeAttr("onclick");
            }


            $("#tbGroupExposure").blur(function () {
                //alert($(this).val());
                if ($(this).val() != '') {

                    if ($(this).val() > 5000) {
                        $(this).val('');
                        $("#tbGroupExposureDesc").val('ข้อมูลไม่ควรเกิน 5,000 ล้านบาท');
                        return false;
                    }
                    $(this).format({ format: "#,###.000" });
                    //alert(ThaiBaht($(this).val()));
                    var txtNum = $(this).val();
                    changeGroupExposureDesc(txtNum);

                }
            });
            // หลังจากโหลดแล้วให้แสดงคำอ่านตัวเลขของ group exposure
            changeGroupExposureDesc($("#tbGroupExposure").val());

            $('#TextBoxCMControl').blur(function () {
                try {
                    if ($(this).val() != '') {
                        findEMPLOYEE($(this).val());
                    }
                }  // try
                catch (err) {
                    var txt = "There was an error on this page(on blur).\n\n";
                    txt += "Error description : " + err.description + "\n\n";
                    txt += "Click OK to close window.\n\n";
                    alert(txt);
                    window.close();
                }
            }); // 

        });   // $(document).ready

        function changeGroupExposureDesc(txtNum) {
            txtNum = txtNum.replace(',', '');
            var num = new Number(txtNum);
            // num = num * 1000000;
            $("#tbGroupExposureDesc").val(num);
            $("#tbGroupExposureDesc").format({ format: "#,###.000" });
            $("#tbGroupExposureDesc").val(ThaiBaht($("#tbGroupExposureDesc").val()));
        }
        function findRefID(refID) {
            PageMethods.findRef(refID,
               OnSucceededFindRef, OnFailedFindRef);
        }
        function OnSucceededFindRef(result) {
            try {
                var obj = eval('(' + result + ')');
                var msgOK = 'ยืนยัน';
                if (obj.id) { // มี id แสดงว่ามีค่าซ้ำ
                    if (obj.id != $('#LblAnnalsid').attr('title')) {  // ค่าซ้ำแตถ้าเป็นเลขเดียวกับหนังสือนี้แสดงว่าเป็นการเปิดมาแก้ไข ถือว่าไม่เป็นไร
                        var yearShow = parseInt(obj.id.substr(6, 4)) + 543;
                        var idShow = obj.id.substr(0, 6) + '/' + yearShow;
                        if (obj.process_group == 'A' || obj.process_group == 'B') {
                            var msgDup = 'ไม่สามารถใช้เลขที่อ้างอิงนี้ได้   \n\nเนื่องจากเรื่องนี้ถูกใช้แล้วในหนังสือหมายเลข ' + idShow + '  \n\nและหนังสือเรื่องดังกล่าวยังไม่เสร็จสิ้น';
                            var c = alert(msgDup)
                            $('#REFERENCETextBox').attr('CheckDup', '').focus().select();
                            $('#ValidateResultLabel').html('');
                        } //      if (obj.process_group == 'D') {
                        if (obj.process_group == 'C' || obj.process_group == 'D' || obj.process_group == 'E') {
                            var msgDup = 'เลขที่อ้างอิงนี้เคยเข้ามาในหนังสือเลขที่ ' + idShow + ' \n\n  เลือก ok เพื่อยืนยันใช้เลขนี้ , cancel เพื่อกรอกใหม่';
                            var c = confirm(msgDup);
                            if (c == true) {
                                $('#REFERENCETextBox').attr('CheckDup', 'pass');
                                $('#ValidateResultLabel').html(msgOK).css("color", "green");
                            } else {
                                $('#REFERENCETextBox').attr('CheckDup', '').focus().select();
                                $('#ValidateResultLabel').html('');
                            }
                        }
                    } // if (obj.id)
                    else { // ไม่มี id ส่งมาแสดงว่าไม่ซ้ำ
                        $('#REFERENCETextBox').attr('CheckDup', 'pass');
                        $('#ValidateResultLabel').html(msgOK).css("color", "green");
                    }
                } //  if (obj.id != $('#LblAnnalsid').attr('title')) {  /
                else {
                    $('#REFERENCETextBox').attr('CheckDup', 'pass');
                    $('#ValidateResultLabel').html(msgOK).css("color", "green");
                } //  if (obj.id != $('#LblAnnalsid').attr('title')) {  /            catch (err) {
            }
            catch (err) {
                var txt = "There was an error on this page(OnSucceededFindRef).\n\n";
                txt += "Error description: " + err.description + "\n\n";
                txt += "Click OK to continue.\n\n";
                alert(txt);
            }
        }
        function OnFailedFindRef(error) {
            alert(' ไม่สามารถติดต่อ server ขณะนี้ได้กรุณาลองอีกครั้ง ');
        }

        function onSuccessCheckWatchList(result, userContext, methodName) {
            //            setBtnIDOUTText();
            //            disablebtnIDOUT();

            var eleTarget = $("#spanCIFWatchList");
            //เช็คว่ามี Element นี้หรือไม่
            if (eleTarget) {//ถ้ามี Element นี้
                if (methodName == "IsCIFInWatchList") {
                    var r = eval("(" + result.detail + ")");

                    if (r.count > 0) {
                        var showText = "CA ฉบับนี้ต้อง Approve โดย CRO";
                        var cifList = "";
                        for (index in r.item) {
                            cifList = cifList + "," + r.item[index].cif;
                        }
                        cifList = cifList.substring(1); //ตัด , ตัวแรกออก

                        //show waring in span
                        eleTarget.html(showText);

                        //blink timer
                        timerId = setInterval(blink, 1000);
                        function blink() {
                            var d = $("#spanCIFWatchList");

                            if (d) {
                                if (d.hasClass("navy")) {
                                    d.removeClass("navy");
                                    d.addClass("red");
                                } else {
                                    d.removeClass("red");
                                    d.addClass("navy");
                                }
                            }
                        }

                        //                        eleTarget.dblclick(function() {
                        //                            var pass = prompt("loan review unlock code:", "password");
                        //                            if (pass == "@dmin") {
                        //                                enablebtnIDOUT();
                        //                            }
                        //                        });
                    } else {
                        //check ว่า ไม่ใช่ CA ที่สร้างใหม่
                        if (getValueFromQueryString("annals_id") != "No Query String") {
                            enablebtnIDOUT();
                        }
                    }
                } else if (methodName == "IsCIFInWatchListByCIF") {
                    alert(result.detail);
                } else {
                    if (result.status == "success") {
                        var resultObj = eval(result.detail);
                        alert(resultObj.count);
                    } else {
                        eleTarget.value = "failed to check watch list:Please, contact administrator.\n"
                            + result.detail;
                    }
                }
            }
        }

        function disablebtnIDOUT() {
            $("#btnIDOUT").attr("disabled", "true");
        }

        function enablebtnIDOUT() {
            $("#btnIDOUT").removeAttr("disabled");
        }

        function setBtnIDOUTText() {
            $("#btnIDOUT").attr("value", "Create annals out ( ออกเลขหนังสือออก)");
        }

        function onFailedCheckWatchList(error, userContext, methodName) {
            //alert(error.constructor);
            alert("ERROR:" + error.get_statusCode());
            //alert(error.get_message());
        }

        function checkRating(e) {
            //ยังไม่ใช้ function checkRating return true ไปก่อน
            return true;

            //Cancel the link behavior
            if (window.event) {// IE
                e.returnValue = false;
            } else if (e.which) {// Netscape/Firefox/Opera
                e.preventdefault();
            } else if (e.charCode) {
                //keyNum = e.charCode;
                alert("Unknown Browser");
            }

            //create box & dialog & background
            //            $("#formAnnalsCredit").append("<div id=&quot;box&quot;></div>");
            //            $("#box").append("<div id=&quot;dialog&quot; class=&quot;window&quot;>Test</div>");
            //            $("#box").append("<div id=&quot;mask&quot;></div>");

            //Get the screen height and width  
            var maskHeight = $(document).height();
            var maskWidth = $(window).width();

            //declare variable
            var mask = $("#mask");
            var dialog = $("#dialog");

            //Set height and width to mask to fill up the whole screen
            mask.css({ 'width': maskWidth, 'height': maskHeight });

            //transition effect
            mask.fadeIn(1000);
            mask.fadeTo("slow", 0.8);

            //Get the window height and width  
            var winH = $(window).height();
            var winW = $(window).width();

            //Set the popup window to center
            dialog.css('top', winH / 2 - dialog.height() / 2);
            dialog.css('left', winW / 2 - dialog.width() / 2);

            //transition effect
            dialog.fadeIn(2000);

            $("#dialogCloseButt").click(function (e) {
                //Cancel the link behavior
                if (window.event) {// IE
                    e.returnValue = false;
                } else if (e.which) {// Netscape/Firefox/Opera
                    e.preventdefault();
                } else if (e.charCode) {
                    //keyNum = e.charCode;
                    alert("Unknown Browser");
                }

                $("#mask,.window").hide();
            });

            //disable button ไว้ก่อน
            $("#dialogCloseButt").attr("disabled", "true");

            var content = $("#dialogContent");
            var waitImage = $("#waitImage");
            //add waiting bar
            waitImage.appendTo(content);
            waitImage.css({ "display": "block" });

            if (caId.length == 10) {
                //                var service = new SmeWeb.CAWCFService();
                //                service.CheckRatingUpdateDateOlder(caId, onSuccessCheckRUD, onFailedCheckRUD, null);

                //localhost.CAWCFService.CheckRatingUpdateDateOlder(caId, onSuccessCheckRUD, onFailedCheckRUD, null);
                leaer1.CAWCFService.CheckRatingUpdateDateOlder(caId, onSuccessCheckRUD, onFailedCheckRUD, null);
            }

            //alert("end");
            return checkURD;
        }

        function onFailedCheckRUD(error, userContext, methodName) {
            //alert(error.constructor);
            alert("ERROR:" + error.get_statusCode());
            //alert(error.get_message());
        }

        function onSuccessCheckRUD(result, userContext, methodName) {
            //            setBtnIDOUTText();
            //            disablebtnIDOUT();

            var eleTarget = $("#dialogContent");
            //เช็คว่ามี Element นี้หรือไม่
            if (eleTarget) {//ถ้ามี Element นี้
                //ซ่อน wait bar
                $("#waitImage").appendTo($("#dialog"));
                $("#waitImage").css({ "display": "none" });

                if (methodName == "CheckRatingUpdateDateOlder") {
                    var r = eval("(" + result.detail + ")");

                    if (r.count > 0) {
                        var showText = "CA ฉบับนี้มีลูกค้าที่ยังไม่ได้ update rating ภายใน 1 เดือน ดังนี้";
                        //show waring in span
                        eleTarget.html("<div>" + showText + "</div>");

                        for (index in r.item) {
                            if (index > 0) eleTarget.append(", ");
                            eleTarget.append("<a href=\"javascript:showDetail(" + r.item[index].cif + ");\">" + r.item[index].cif + "</a>");
                        }

                        //                        eleTarget.dblclick(function() {
                        //                            var pass = prompt("loan review unlock code:", "password");
                        //                            if (pass == "@dmin") {
                        //                                enablebtnIDOUT();
                        //                            }
                        //                        });
                    } else {
                        //check ว่า ไม่ใช่ CA ที่สร้างใหม่
                        if (getValueFromQueryString("annals_id") != "No Query String") {
                            $("#dialogContent").html("ไม่มีลูกค้าที่ต้อง update rating.");
                            checkURD = true;
                        }
                    }
                } else {
                    if (result.status == "success") {
                        var resultObj = eval(result.detail);
                        alert(resultObj.count);
                    } else {
                        eleTarget.value = "failed to check watch list:Please, contact administrator.\n"
                            + result.detail;
                    }
                }

                //check checkURD
                if (checkURD) {
                    //enable button
                    $("#dialogCloseButt").removeAttr("disabled");
                    //remove check event on idout
                    $("#btnIDOUT").removeAttr("onclick");
                }
            }
        }
        function clearReviewDate() {
            $('#ReveiwDateTextBox').val('');
        }
        function clearAnnalsDate() {
            $('#DATE_IN_ANNALS_TextBox').val('');
        }
        function showDetail(cif) {
            smePopup = window.open("../customer/SmeGroupManagement.aspx?cif=" + cif, "smePopup", "toolbar=No,resizable=yes,scrollbars=yes");
            smePopup.focus();
        }

        function ThaiBaht(Number) {
            //alert(Number)
            //ตัดสิ่งที่ไม่ต้องการทิ้งลงโถส้วม
            for (var i = 0; i < Number.length; i++) {
                Number = Number.replace(",", ""); //ไม่ต้องการเครื่องหมายคอมมาร์
                Number = Number.replace(" ", ""); //ไม่ต้องการช่องว่าง
                Number = Number.replace("บาท", ""); //ไม่ต้องการตัวหนังสือ บาท
                Number = Number.replace("฿", ""); //ไม่ต้องการสัญลักษณ์สกุลเงินบาท
            }
            //alert(Number.length);
            //สร้างอะเรย์เก็บค่าที่ต้องการใช้เอาไว้
            var TxtNumArr = new Array("ศูนย์", "หนึ่ง", "สอง", "สาม", "สี่", "ห้า", "หก", "เจ็ด", "แปด", "เก้า", "สิบ");
            var TxtDigitArr = new Array("", "สิบ", "ร้อย", "พัน", "หมื่น", "แสน", "ล้าน");
            var BahtText = "";
            //ตรวจสอบดูซะหน่อยว่าใช่ตัวเลขที่ถูกต้องหรือเปล่า ด้วย isNaN == true ถ้าเป็นข้อความ == false ถ้าเป็นตัวเลข
            if (isNaN(Number)) {
                return "ข้อมูลนำเข้าไม่ถูกต้อง";
            } else {
                //alert('ข้อมูลถูก');
                //ตรวสอบอีกสักครั้งว่าตัวเลขมากเกินความต้องการหรือเปล่า
                if ((Number - 0) > 99999999999.9999) {
                    return "ข้อมูลนำเข้าเกินขอบเขตที่ตั้งไว้";
                } else {
                    //พรากทศนิยม กับจำนวนเต็มออกจากกัน (บาปหรือเปล่าหนอเรา พรากคู่เขา)
                    //alert('split');
                    Number = Number.split(".");
                    //alert(Number.length);
                    //alert(Number[1]);
                    //ขั้นตอนต่อไปนี้เป็นการประมวลผลดูกันเอาเองครับ แบบว่าขี้เกียจจะจิ้มดีดแล้ว อิอิอิ
                    if (Number[1].length > 0) {
                        //Number[1] = Number[1].substring(0, 3);  // ไม่ต้องตัดทศนิยมเนื่องจาก format มาอยู่แล้ว
                        //alert(Number[1]);
                    }
                    var countTen = false // ตัวแปรกำหนดว่ามีค่าที่หลักสิบหรือไม่ถ้ามีให้ใส่คำว่าเอ็ด
                    var NumberLen = Number[0].length - 0;
                    //alert(Number[0].length);
                    for (var i = 0; i < NumberLen; i++) {
                        var tmp = Number[0].substring(i, i + 1) - 0;
                        if (tmp != 0) {
                            if (i == (NumberLen - 2)) {
                                // alert('true')
                                countTen = true;
                            }
                            if ((i == (NumberLen - 1)) && (tmp == 1)) {
                                if (countTen == true) {
                                    BahtText += "เอ็ด";
                                } else {
                                    BahtText += "หนึี่ง";
                                }
                            } else
                                if ((i == (NumberLen - 2)) && (tmp == 2)) {
                                    BahtText += "ยี่";
                                } else
                                    if ((i == (NumberLen - 2)) && (tmp == 1)) {
                                        BahtText += "";
                                    } else {
                                        BahtText += TxtNumArr[tmp];
                                    }
                            BahtText += TxtDigitArr[NumberLen - i - 1];
                        }
                    }
                    if (Number[0] > 0) {
                        BahtText += "ล้าน";
                    }
                    if ((Number[1] == "0") || (Number[1] == "00")) {
                        // BahtText += "ถ้วน";
                    } else {
                        //alert(Number[1]);
                        //var num1 = new Number(Number[1]);
                        num1 = Number[1] * 1000;
                        //alert(num1);
                        DecimalLen = num1.toString().length - 0;
                        //alert(DecimalLen);
                        for (var i = 0; i < DecimalLen; i++) {
                            var tmp = num1.toString().substring(i, i + 1);
                            // alert(tmp);
                            if (tmp != 0) {
                                if ((i == (DecimalLen - 1)) && (tmp == 1)) {
                                    BahtText += "เอ็ด";
                                } else
                                    if ((i == (DecimalLen - 2)) && (tmp == 2)) {
                                        BahtText += "ยี่";
                                    } else
                                        if ((i == (DecimalLen - 2)) && (tmp == 1)) {
                                            BahtText += "";
                                        } else {
                                            BahtText += TxtNumArr[tmp];
                                        }
                                BahtText += TxtDigitArr[DecimalLen - i - 1];
                            }
                        }
                        BahtText += "บาท";
                        //BahtText += "สตางค์";

                    }

                    return BahtText;
                }
            }
        }

        function findEMPLOYEE(empID) {
            PageMethods.findEMPLOYEE(empID,
               OnSucceededFindEmployee, OnFailedFindEmployee);
        }
        function OnSucceededFindEmployee(result) {
            try {
                var obj = eval('(' + result + ')');
                var msgOK = 'ยืนยัน';
                if (obj.empname) {
                    $('#LabelCMControlDetail').val(obj.empname);
                }

            } catch (err) {
                alert(err.Description);
            }
        }
        function OnFailedFindEmployee(result) {
            alert('ไม่สามารถติดต่อ server');
        }

     


    </script>
    <script type="text/javascript">
        //var timerId = 0;
        //label_InProcessJob;
        function flasher() {

            if (document.getElementById('PanelCovenant')) {
                var d = document.getElementById('PanelCovenant');

                d.style.color = (d.style.color == 'red' ? 'white' : 'red');
                //   setTimeout(this, 1000);
                //      alert(d.style.color);
            }
        }
     
        
    </script>
    <script type="text/javascript">
        function getEleByClientSelector(ClientSelector, tagName) {
            var result = null;

            if (!tagName) { tagName = "input"; }

            var eleArray = $(tagName + "[ClientSelector='" + ClientSelector + "']");

            if (eleArray.length > 0) {
                result = eleArray[0];
            } else {
                alert("Can not find ClientSelector=" + ClientSelector + ".\nPlease, contact administrator.");
            }

            return result;
        }

        function empIdChange(eleSrc, TargetClientSelector) {
            var empId = eleSrc.value;
            var eleTarget = getEleByClientSelector(TargetClientSelector);

            if (isNaN(empId) || empId.length != 6) {
                if (empId.length > 0 && empId != 0) {
                    alert("รหัสพนักงาน ต้องเป็นตัวเลข6หลักเท่านั้น");
                }

                //เช็คว่ามี Element target หรือไม่
                if (eleTarget) {
                    //เคลียร์ค่า
                    eleTarget.value = "";
                }

                eleSrc.focus();
            } else {
                eleTarget.value = "loading...";
                //GetCmFullNameByEmpId(empId,onSuccess,onFailed,userContext)
                //var service = new SmeWeb.EmployeeWCFService();
                //service.GetEmpFullNameByEmpId(empId, onSuccess, onFailed, TargetClientSelector);

                //   localhost.EmployeeWCFService.GetEmpFullNameByEmpId(empId, onSuccess, onFailed, TargetClientSelector);
                leaer1.EmployeeWCFService.GetEmpFullNameByEmpId(empId, onSuccess, onFailed, TargetClientSelector);
            }
        }

        //result - this contains any values returned from my method. In this case it will be the id of the item that was inserted.
        //userContext - this is an optional item that can be passed into the original call to the method and will just be passed on to the callback method. I am not using this parameter in this situation
        //methodName - this is the name of the method that was called which resulted in the OnSucceeded method being called. In my case, this will be the string "GetCustomersFullNameByCif"
        function onSuccess(result, userContext, methodName) {
            var eleTarget = getEleByClientSelector(userContext);
            //เช็คว่ามี Element นี้หรือไม่
            if (eleTarget) {//ถ้ามี Element นี้
                if (methodName == "GetCustomerByCif") {
                    //this for test
                    alert(result.status);
                    alert(result.detail.CIF);
                } else {
                    if (result.status == "success") {
                        //set result ใส่ element
                        eleTarget.value = result.detail;
                    } else {
                        eleTarget.value = "failed:Please, contact administrator.";
                        alert(result.detail);
                    }
                }
            }
        }

        function onFailed(error, userContext, methodName) {
            //alert(error.constructor);
            alert("ERROR:" + error.get_statusCode());
            //alert(error.get_message());
        }

    </script>
    <style type="text/css">
        body
        {
            font-size: 12px;
        }
        table
        {
            font-size: 12px;
            font-family: Tahoma;
        }
    </style>
    <style type="text/css">
        .ajax__myTab .ajax__tab_header
        {
            font-family: verdana,tahoma,helvetica;
            font-size: 11px;
            border-bottom: solid 1px #999999;
        }
        .ajax__myTab .ajax__tab_outer
        {
            padding-right: 4px;
            height: 21px;
            background-color: #C0C0C0;
            margin-right: 2px;
            border-right: solid 1px #666666;
            border-top: solid 1px #aaaaaa;
        }
        .ajax__myTab .ajax__tab_inner
        {
            padding-left: 3px;
            background-color: #C0C0C0;
        }
        .ajax__myTab .ajax__tab_tab
        {
            height: 13px;
            padding: 4px;
            margin: 0;
        }
        .ajax__myTab .ajax__tab_hover .ajax__tab_outer
        {
            background-color: #cccccc;
        }
        .ajax__myTab .ajax__tab_hover .ajax__tab_inner
        {
            background-color: #cccccc;
        }
        .ajax__myTab .ajax__tab_hover .ajax__tab_tab
        {
        }
        .ajax__myTab .ajax__tab_active .ajax__tab_outer
        {
            background-color: #fff;
            border-left: solid 1px #999999;
        }
        .ajax__myTab .ajax__tab_active .ajax__tab_inner
        {
            background-color: #fff;
        }
        .ajax__myTab .ajax__tab_active .ajax__tab_tab
        {
        }
        .ajax__myTab .ajax__tab_body
        {
            font-family: verdana,tahoma,helvetica;
            font-size: 10pt;
            border: 1px solid #999999;
            border-top: 0;
            padding: 8px;
            background-color: #ffffff;
        }
    </style>
    <style type="text/css">
        .MyTabStyle .ajax__tab_header
        {
            font-family: "Helvetica Neue" , Arial, Sans-Serif;
            font-size: 14px;
            font-weight: bold;
            display: block;
        }
        .MyTabStyle .ajax__tab_header .ajax__tab_outer
        {
            border-color: #222;
            color: #222;
            padding-left: 10px;
            margin-right: 3px;
            border: solid 1px #d7d7d7;
        }
        .MyTabStyle .ajax__tab_header .ajax__tab_inner
        {
            border-color: #666;
            color: #666;
            padding: 3px 10px 2px 0px;
        }
        .MyTabStyle .ajax__tab_hover .ajax__tab_outer
        {
            background-color: #9c3;
        }
        .MyTabStyle .ajax__tab_hover .ajax__tab_inner
        {
            color: #fff;
        }
        .MyTabStyle .ajax__tab_active .ajax__tab_outer
        {
            border-bottom-color: #ffffff;
            background-color: #d7d7d7;
        }
        .MyTabStyle .ajax__tab_active .ajax__tab_inner
        {
            color: #000;
            border-color: #333;
        }
        .MyTabStyle .ajax__tab_body
        {
            font-family: verdana,tahoma,helvetica;
            font-size: 10pt;
            background-color: #fff;
            border-top-width: 0;
            border-top-color: #ffffff;
            border: 1px solid #d7d7d7;
        }
        
        .TextBoxAlignRight
        {
            text-align: right;
        }
    </style>
</head>
<body bgcolor="White">
    <form id="formAnnalsCredit" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptLocalization="true"
        EnableScriptGlobalization="true" EnablePageMethods="true">
        <Services>
            <asp:ServiceReference Path="~/webservice/CAWCFService.svc" />
            <%--    <asp:ServiceReference Path="~/webservice/CustomerWCFService.svc" />--%>
            <asp:ServiceReference Path="~/webservice/EmployeeWCFService.svc" />
            <%--            <asp:ServiceReference Path="~/webservice/BranchWCFService.svc" />
            <asp:ServiceReference Path="~/webservice/BusinessTypeWCFService.svc" />--%>
        </Services>
    </asp:ScriptManager>
    <div id="boxes">
        <div id="dialog" class="window" style="display: none;">
            <div id="dialogContent" style="font-size: medium; width: 100%; height: 120px;">
            </div>
            <img id="waitImage" alt="waitImage" src="../../images/progress/rectangle/pleasewait.gif" />
            <div id="dialogFooter" style="width: 100%;">
                <input type="button" id="dialogCheckAgain" value="Check Again" onclick="return checkRating" />
                <!-- clos
                <!-- close button is defined as close class -->
            </div>
        </div>
        <div id="mask" style="display: none;">
        </div>
    </div>
    <asp:Panel ID="PanelAnnalsCredit" runat="server">
        <table width="100%">
            <tr>
                <td style="width: 220px">
                    <asp:Label ID="Label7" runat="server" Font-Bold="true" ForeColor="Navy" Text="Annals Credit (หนังสือสินเชื่อ)"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="tbANNALS_TYPE" runat="server" MaxLength="1" Width="24px" Visible="False"></asp:TextBox><asp:TextBox
                        ID="tbANNALS_YEAR" runat="server" MaxLength="4" Width="63px" Visible="False"></asp:TextBox>
                    <asp:TextBox ID="tbANNALS_SEQ_NO" runat="server" MaxLength="5" Width="52px" Visible="False"></asp:TextBox>
                    <asp:Label ID="lblUserID" runat="server" Visible="False" Width="130px" Font-Bold="true"
                        ForeColor="#000000" Height="16px"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblID" runat="server" Font-Bold="true" Text="ID (เลขที่หนังสือ ) Auto number"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="tbID" runat="server" Enabled="False" MaxLength="10" Visible="False"
                        Width="122px"></asp:TextBox>
                    <asp:Label ID="LblAnnalsid" runat="server" BackColor="#C0FFFF" BorderStyle="Inset"
                        BorderWidth="2px" Font-Bold="true" Font-Size="X-Small" ForeColor="Brown" Width="143px"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label runat="server" Text="Job Type(ประเภทงาน) * " Style="font-weight: 700"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DDLJobTypeId" runat="server">
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
                    <asp:Label ID="Label11" runat="server" Font-Bold="true" Text="Date  (วันที่ในหนังสือ) *"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="DATE_IN_ANNALS_TextBox" runat="server" MaxLength="20" Text='<%# Bind("DATE_IN_ANNALS","{0:d MMMM yyyy}") %>'
                        Width="124px"></asp:TextBox>
                    <cc2:CalendarExtender ID="cal1" runat="server" PopupPosition="Right" TargetControlID="DATE_IN_ANNALS_TextBox">
                    </cc2:CalendarExtender>
                    <img id="imgClearAnnalsDate" runat="server" alt="clear date" onclick="clearAnnalsDate()"
                        src="~/images/close_button.gif" />
                </td>
                <td>
                    <asp:Label ID="lblSME_Referral_No" runat="server" Font-Bold="true" Text="Referral no.  "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="tbSME_Referral_No" runat="server" MaxLength="6" Style="background-color: #FFFFCC"
                        Text='<%# Bind("SME_Referral_No") %>' Width="57px"></asp:TextBox>
                    /<asp:DropDownList ID="DDLReferalYear" runat="server" BackColor="#FFFFCC">
                    </asp:DropDownList>
                    &nbsp; <b>(xxxxxx/20xx)</b>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label33" runat="server" Font-Bold="true" Text="Receive From (รับจาก)"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="SENDERTextBox" runat="server" Text='<%# Bind("SENDER") %>' Width="309px"
                        Wrap="False"></asp:TextBox>
                    <asp:Image ID="SenderSearchImage" runat="server" ImageUrl="~/images/Magnifying Glass.gif" />
                </td>
                <td>
                    <asp:Label ID="Label12" runat="server" Font-Bold="true" Text="อ้างอิงถึงหนังสือเลขที่ * "
                        Width="180px"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="REFERENCETextBox" runat="server" Text='<%# Bind("REFERENCE") %>'
                        Width="210px" MaxLength="50" CheckDup=""></asp:TextBox>
                    &nbsp;<asp:Label ID="ValidateResultLabel" runat="server"></asp:Label>
                    <asp:HiddenField ID="OLDREFERENCE" runat="server" Visible="false" Value='<%# Bind("REFERENCE") %>' />
                    <asp:Label ID="lblRefid" runat="server" Text="" Visible="false"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label36" runat="server" Style="font-weight: 700" Text=" Customer Size (ประเภทลูกค้า) *"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DDLCustomer_Size" runat="server">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:Label ID="Label50" runat="server" Style="font-weight: 700" Text="Group Exposure"></asp:Label>
                    <br />
                </td>
                <td>
                    <asp:TextBox ID="tbGroupExposure" runat="server" CssClass="TextBoxAlignRight" Height="21px"
                        MaxLength="20" Width="80px"></asp:TextBox>
                    &nbsp;ล้านบาท &nbsp<asp:TextBox ID="tbGroupExposureDesc" runat="server" BackColor="#CCCCCC"
                        ReadOnly="True" Style="text-align: left; border-style: none;" Width="320px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label52" runat="server" Style="font-weight: 700" Text="วันที่ Review ลูกค้าครั้งต่อไป"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="ReveiwDateTextBox" runat="server" MaxLength="20" Text='<%# Bind("REVIEW_DATE","{0:d MMMM yyyy}") %>'
                        Width="124px"></asp:TextBox>
                    <cc2:CalendarExtender ID="ReveiwDateTextBox_CalendarExtender" runat="server" PopupButtonID="imgCalendarReview"
                        PopupPosition="Right" TargetControlID="ReveiwDateTextBox">
                    </cc2:CalendarExtender>
                    <img id="imgClearReviewDate" runat="server" alt="clear date" src="~/images/close_button.gif"
                        onclick="clearReviewDate()" />
                </td>
                <td>
                    <asp:Label ID="LabelOutofScope" runat="server" Style="font-weight: 700" Text="Out of scope  SME_R"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DDLoutofscope" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    <asp:UpdatePanel ID="UpdatePanelBranch" runat="server">
                        <ContentTemplate>
                           <table style="width: 100%; border: 0">
                                <tr>
                                    <td style="width: 218px">
                                        <asp:Label ID="Label21" runat="server" Text="Branch ID (รหัสสาขา) *" Style="font-weight: 700;"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="tbBranch_ID" runat="server" MaxLength="7" Width="100px"></asp:TextBox>
                                        &nbsp;<asp:ImageButton ID="SearchBranchBtn" runat="server" BorderColor="transparent"
                                            BorderWidth="0px" ImageUrl="~/images/Magnifying Glass.gif" />
                                        <asp:Label ID="lblBranchName" runat="server"></asp:Label>
                                        &nbsp;&nbsp;&nbsp;<asp:Label ID="Label23" runat="server" Text="ภาค"></asp:Label>
                                        &nbsp;<asp:TextBox ID="tbRegion_ID" runat="server" Enabled="False" MaxLength="10"
                                            Width="50px"></asp:TextBox>
                                        &nbsp;<asp:Label ID="lblRegName" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <table style="width: 100%; border: 0">
                        <tr>
                            <td style="width: 218px">
                                <asp:Label ID="LabelCMControl" runat="server" Text="รหัส  CM ผู้ดูแล  *" Style="font-weight: 700;"></asp:Label>
                            </td>
                            <td>
                                <%--                                <asp:TextBox ID="TextBoxCMControl" runat="server" MaxLength="10" Width="100px" onChange="empIdChange(this,'LabelCMControlDetail');"></asp:TextBox>
                                --%>
                                <asp:TextBox ID="TextBoxCMControl" runat="server" MaxLength="7" Width="100px"></asp:TextBox>
                                &nbsp;<asp:Image ID="ImageButtonCMControl" runat="server" BorderColor="transparent"
                                    BorderWidth="0px" ImageUrl="~/images/Magnifying Glass.gif" />
                                <asp:TextBox ID="LabelCMControlDetail" ClientSelector="LabelCMControlDetail" runat="server"
                                    MaxLength="10" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <div id="divCheckWatchListByCIF">
        </div>
        <table border="0" width="100%">
            <tr>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:Panel ID="PanelGridCifCA" runat="server">
                                <asp:Button ID="BtnAddCustomerDetail" runat="server" BackColor="#C0C0FF" Height="22px"
                                    Text="Add Customer Details" Width="150px" />&nbsp;<asp:Label ID="Label49" runat="server"
                                        Style="font-size: x-small; font-weight: 700" Text=" List of  Customer in CA ( ข้อมูลลูกค้าใน CA ทั้งหมด) "
                                        Width="397px" Height="24px"></asp:Label>
                                <asp:GridView ID="GridCustomer" runat="server" AutoGenerateColumns="False" Width="468px"
                                    CellPadding="1" CellSpacing="1" GridLines="None" EnableModelValidation="True"
                                    ForeColor="#333333">
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="true" ForeColor="#333333" />
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="true" ForeColor="White" />
                                    <EditRowStyle BackColor="#999999" />
                                    <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="true" />
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    <Columns>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="BtnEdit" runat="server" CommandName="Edit" ToolTip="Edit item"
                                                    ImageUrl="~/images/qmv_bb_preview.gif" />
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <table style="width: 41px; border-color: Black; padding-left: 100px; border: 0px;
                                                    background-color: #AABBAA">
                                                    <tr>
                                                        <td>
                                                            <asp:ImageButton ID="ImageButton1" runat="server" CommandName="Update" ImageUrl="~/images/qmv_bb_add.gif"
                                                                ToolTip="Save item" />
                                                        </td>
                                                        <td>
                                                            <asp:ImageButton ID="ImageButton2" runat="server" CommandName="Cancel" ImageUrl="~/images/qmv_r_button_undo_hover.gif"
                                                                ToolTip="Cancel item" />
                                                        </td>
                                                        <td style="width: 35px">
                                                            <asp:ImageButton ID="BtnDelete" runat="server" CommandName="Delete" ImageUrl="~/images/qmv_bb_delete.gif"
                                                                ToolTip="Delete item" />
                                                        </td>
                                                    </tr>
                                                </table>
                                                <table id="tableCustomerForm" style="border-color: Black; padding-left: 100px; background-color: #AABBAA;
                                                    width: 800px" border="0" cellpadding="2" cellspacing="2">
                                                    <tr>
                                                        <td>
                                                            <asp:Label runat="server" Text="Search CIF" Width="150"></asp:Label>
                                                        </td>
                                                        <td colspan="3">
                                                            <asp:TextBox ID="tbCIFSearch" runat="server" Width="100" Text='<%# Bind("CIF") %>'></asp:TextBox>
                                                            <asp:Button ID="btnSearchCIF" runat="server" Text="Find" OnClick="SearchCIFCA" />
                                                            <asp:Label ID="lblGridCifCustomer" runat="server" Text='<%# Bind("CIFNAME") %>'></asp:Label>
                                                            <asp:Image ID="BtnAddCusTemp" runat="server" BorderColor="#CCCCCC" BorderStyle="Inset"
                                                                ImageUrl="~/images/Add.jpg" />
                                                            <asp:Label ID="Label34" runat="server" Font-Bold="true" Text="&lt;&lt; เพิ่มข้อมูล CIF ใหม่ที่นี่ "></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="LabelBusinessType" runat="server" Text="BUSINESS(1st)" ToolTip="ประเภทธุรกิจหลัก"></asp:Label>
                                                        </td>
                                                        <td colspan="3">
                                                            <asp:TextBox ID="tbBusinessTypeID" onfocus="this.blur();" runat="server" Width="100"></asp:TextBox>
                                                            <asp:Image ID="btnPopUpBusinessType" runat="server" BorderColor="#CCCCCC" BorderStyle="Inset"
                                                                ImageUrl="~/images/Magnifying Glass.gif" />
                                                            <asp:TextBox ID="LabelBusinessTypeDetail" onfocus="this.blur();" runat="server" Width="300"></asp:TextBox>
                                                            <asp:ImageButton ID="ImageButtonResetBuss" runat="server" ImageUrl="~/images/close_button.gif"
                                                                OnClick="ResetBuss" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="CIF" ItemStyle-Wrap="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblGridCif" runat="server" Text='<%# Bind("CIF") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Customer" ItemStyle-Wrap="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCifCustomer" runat="server" Text='<%# Bind("CIFNAME") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>
                                        <%--                  <asp:TemplateField HeaderText="Rating" ItemStyle-Wrap="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCifRating" runat="server" Text='<%# Bind("RATING_DESC") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Rating Date" ItemStyle-Wrap="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCifRatingDate" runat="server" Text='<%# Bind("RATING_DATE","{0:d}") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>--%>
                                        <asp:TemplateField HeaderText="Business Type" ItemStyle-Wrap="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblBusinessType" runat="server" Text='<%# Bind("BUSS_TYPE_DETAIL")%>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                <br />
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="height: 0px; width: 1005px;" align="left" valign="top">
                    <asp:Label ID="spanCIFWatchListByCIF" runat="server"></asp:Label><div id="divCheckWatchList">
                        <asp:Panel ID="PanelGridAnnalsCreditAccount" runat="server" Height="50px" Width="1200px"
                            BorderStyle="None" BorderWidth="1px">
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:Button ID="BtnAddDetail" runat="server" Height="22px" Text="Add credit details"
                                                    Width="150px" BackColor="#C0C0FF" />
                                            </td>
                                            <td>
                                                <asp:Label ID="Label19" runat="server" Text=" List of  credit  ( ข้อมูลสินเชื่อ) "
                                                    Width="222px" Style="font-size: x-small; font-weight: 700"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="UpdatePanel2"
                                                    DisplayAfter="1">
                                                    <ProgressTemplate>
                                                        <img src="../../images/progress/cicle/loading_animation.gif" style="height: 20px;
                                                            width: 20px" />
                                                    </ProgressTemplate>
                                                </asp:UpdateProgress>
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:GridView ID="GridAnnalsCreditAccount" runat="server" AutoGenerateColumns="False"
                                        CellPadding="1" Width="100%" Height="16px" ForeColor="#333333" GridLines="None"
                                        CellSpacing="1">
                                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="true" ForeColor="#333333" />
                                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="true" ForeColor="White" />
                                        <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="true" />
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="BtnEdit" runat="server" CommandName="Edit" ToolTip="Edit item"
                                                        ImageUrl="~/images/qmv_bb_preview.gif" />
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <table style="width: 41px" style="border-color: Black; padding-left: 100px; border: 0px;
                                                        background-color: #AABBAA">
                                                        <tr>
                                                            <td>
                                                                <asp:ImageButton ID="BtnUpdate" runat="server" CommandName="Update" ImageUrl="~/images/qmv_bb_add.gif"
                                                                    ToolTip="Save item" />
                                                            </td>
                                                            <td>
                                                                <asp:ImageButton ID="BtnCancel" runat="server" CommandName="Cancel" ImageUrl="~/images/qmv_r_button_undo_hover.gif"
                                                                    ToolTip="Cancel item" />
                                                            </td>
                                                            <td style="width: 35px">
                                                                <asp:ImageButton ID="BtnDelete" runat="server" CommandName="Delete" ImageUrl="~/images/qmv_bb_delete.gif"
                                                                    ToolTip="Delete item" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <table id="tableAccountForm" frame="hsides" style="border-color: Black; padding-left: 100px;
                                                        background-color: #AABBAA" border="1" cellpadding="2" cellspacing="2">
                                                        <tr>
                                                            <td colspan="3">
                                                                <div id="divCheckWatchListByCIF">
                                                                    <asp:Label ID="spanCIFWatchListByCIFFORM" runat="server"></asp:Label></div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 250px">
                                                                <asp:Label ID="Label16" runat="server" Text="เลือก CIF" Width="150" Font-Bold="true"></asp:Label>
                                                            </td>
                                                            <td style="width: 350px">
                                                                <asp:DropDownList ID="ddlGridCIF" runat="server" AutoPostBack="true" OnSelectedIndexChanged="SearchDropCIF">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td style="width: 250px">
                                                                <asp:Label runat="server" Text="Customer" Font-Bold="true"></asp:Label>
                                                            </td>
                                                            <td style="width: 1000px">
                                                                <asp:TextBox ID="TBCifName" runat="server" Target="_blank" Width="250px" Style="background-color: #FFFFFF;
                                                                    height: 18px; text-decoration: none; font-size: 12px; cursor: pointer" Text=" "></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="Label20" runat="server" Text="RM ID (ผู้ดูแล)" Font-Bold="true"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="tbRM_ID" runat="server" MaxLength="10" Enabled="False" Width="120px"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Label44" runat="server" Text="RM" Font-Bold="true"></asp:Label>
                                                            </td>
                                                            <td colspan="5">
                                                                <asp:Label ID="lblRmName" runat="server" Style="background-color: #FFFFFF; height: 18px;
                                                                    border-width: thin; text-decoration: none; font-size: 12px" Width="250px"></asp:Label>
                                                            </td>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label22" runat="server" Text="Dep ID/Branch ID" Font-Bold="true"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="tbFlag" runat="server" Enabled="False" MaxLength="10" Width="17px"
                                                                        Style="margin-left: 0px"></asp:TextBox><asp:TextBox ID="tbDep_ID" runat="server"
                                                                            Enabled="False" MaxLength="10" Width="100px"></asp:TextBox>
                                                                </td>
                                                                <td>
                                                                    <asp:Label runat="server" Text=" Department / Branch" Font-Bold="true"></asp:Label>
                                                                </td>
                                                                <td colspan="2">
                                                                    <asp:Label ID="lblDepName" runat="server" Style="background-color: #FFFFFF; height: 18px;
                                                                        text-decoration: none; font-size: 12px" Width="250px"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label14" runat="server" Text="Main subject" Font-Bold="true"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="ddlSubject" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ChangeSubjectDetail">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label5" runat="server" Font-Bold="true" Text="Subject"> </asp:Label>
                                                                </td>
                                                                <td colspan="4">
                                                                    <asp:DropDownList ID="ddlSUBJECT_DETAIL_ID" runat="server">
                                                                    </asp:DropDownList>
                                                                    <asp:Label ID="Label42" runat="server" Font-Bold="True" Text="Product Code" Visible="False"></asp:Label><asp:TextBox
                                                                        ID="tbPRODUCT_CODE" runat="server" MaxLength="4" Visible="False" Width="120px"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label24" runat="server" Font-Bold="true" Text="Proposal ID"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="ddlProposal_ID" runat="server">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label41" runat="server" Text="Ref Account" Font-Bold="true"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="tbACCNO" runat="server" MaxLength="20" Width="120px"></asp:TextBox><asp:Image
                                                                        ID="btnSearchAccount" runat="server" ImageUrl="~/images/Magnifying Glass.gif"
                                                                        Style="cursor: pointer" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="LabelProgram" runat="server" Text="Program" Font-Bold="true"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="ddlPROGRAM" runat="server" OnSelectedIndexChanged="ChangeProject"
                                                                        AutoPostBack="true">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label18" runat="server" Text="Project" Font-Bold="true"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <div>
                                                                        <asp:DropDownList ID="ddlPROJECT" runat="server" OnSelectedIndexChanged="ChangeProduct"
                                                                            AutoPostBack="true">
                                                                        </asp:DropDownList>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label43" runat="server" Font-Bold="true" Text="Product Name"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="ddlDECB_RD_ID" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ChangeProduct">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="LabelProduct" runat="server" Text="Product Code" Font-Bold="true"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="ddlPRODUCT" runat="server" OnSelectedIndexChanged="ChangeProductIndex"
                                                                        AutoPostBack="true">
                                                                    </asp:DropDownList>
                                                                    <asp:DropDownList ID="ddlPRODUCT_CODE" runat="server" OnSelectedIndexChanged="ChangeProductIndex"
                                                                        AutoPostBack="true">
                                                                    </asp:DropDownList>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label6" runat="server" Text="Old Value" Font-Bold="true"> </asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="tbValue_Old" runat="server" Width="120px" MaxLength="20"></asp:TextBox>
                                                                    <cc2:MaskedEditExtender TargetControlID="tbValue_Old" runat="server" AutoComplete="false"
                                                                        Mask="9,999,999,999,999" MessageValidatorTip="true" MaskType="Number" InputDirection="RightToLeft"
                                                                        AcceptNegative="None" ErrorTooltipEnabled="True" />
                                                                </td>
                                                                <td rowspan="5">
                                                                    <asp:Label ID="Label13" runat="server" Text="Other" Font-Bold="true"> </asp:Label>
                                                                </td>
                                                                <td rowspan="5">
                                                                    <asp:TextBox ID="tbOthers" runat="server" MaxLength="255" TextMode="MultiLine" Rows="4"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label45" runat="server" Text="RM Value" Font-Bold="true"> </asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="tbValue_Customer" runat="server" Width="120px" MaxLength="20"></asp:TextBox><cc2:MaskedEditExtender
                                                                        ID="MaskedEditExtender1" TargetControlID="tbValue_Customer" runat="server" AutoComplete="false"
                                                                        Mask="9,999,999,999,999" MessageValidatorTip="true" MaskType="Number" InputDirection="RightToLeft"
                                                                        AcceptNegative="None" ErrorTooltipEnabled="True" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label46" runat="server" Text="CM Value" Font-Bold="true"> </asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="tbValue" runat="server" Width="120px" MaxLength="20"></asp:TextBox><cc2:MaskedEditExtender
                                                                        ID="MaskedEditExtender2" TargetControlID="tbValue" runat="server" AutoComplete="false"
                                                                        Mask="9,999,999,999,999" MessageValidatorTip="true" MaskType="Number" InputDirection="RightToLeft"
                                                                        AcceptNegative="None" ErrorTooltipEnabled="True" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label47" runat="server" Text="CM /Board  Approve" Font-Bold="true"> </asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="tbValue_Approve" runat="server" Width="120px" MaxLength="20"></asp:TextBox><cc2:MaskedEditExtender
                                                                        ID="MaskedEditExtender3" TargetControlID="tbValue_Approve" runat="server" AutoComplete="false"
                                                                        Mask="9,999,999,999,999" MessageValidatorTip="true" MaskType="Number" InputDirection="RightToLeft"
                                                                        AcceptNegative="None" ErrorTooltipEnabled="True" />
                                                                </td>
                                                            </tr>
                                                            <table>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="CIF">
                                                <EditItemTemplate>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblGridCif" runat="server" Text='<%# Bind("CIF") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Ref Acc No." Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label17" runat="server" Text='<%# Bind("ACCNO") %>'></asp:Label></ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Program/Project/Product">
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelPROGRAM_NAME" runat="server" Text='<%# Bind("PROGRAM_NAME") %>'></asp:Label>/
                                                    <asp:Label ID="LabelPROJECT_CODE" runat="server" Text='<%# Bind("PROJECT_CODE") %>'></asp:Label>/
                                                    <asp:Label ID="LabelPRODUCT_CODE" runat="server" Text='<%# Bind("PRODUCT_CODE") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Proposal">
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelProposal" runat="server" Text='<%# Bind("Proposal_Name") %>'></asp:Label></ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Product Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label15" runat="server" Text='<%# Bind("DECB_RD") %>' Width="213px"></asp:Label></ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Subject">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("SUBJECT_DETAIL") %>' Width="227px"></asp:Label><asp:HiddenField
                                                        runat="server" ID="HdSubject_Detail_ID" Value='<%#Bind("SUBJECT_DETAIL_ID") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Old  Value">
                                                <ItemStyle HorizontalAlign="Right" />
                                                <ItemTemplate>
                                                    <asp:Label ID="lblValue_Old" runat="server" Width="100px" Text='<%# Bind("Value_Old") %>'></asp:Label></ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="RM  Value">
                                                <ItemStyle HorizontalAlign="Right" />
                                                <ItemTemplate>
                                                    <asp:Label ID="lblValue_Customer" runat="server" Text='<%# Bind("Value_Customer") %>'
                                                        Width="100px"></asp:Label></ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="CM Value">
                                                <ItemStyle HorizontalAlign="Right" />
                                                <ItemTemplate>
                                                    <asp:Label ID="lblValue" runat="server" Text='<%# Bind("Value") %>'></asp:Label></ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="CM/Board &lt;br&gt; Approve">
                                                <ItemStyle HorizontalAlign="Right" />
                                                <ItemTemplate>
                                                    <asp:Label ID="lblValue_Approve" runat="server" Text='<%# Bind("Value_Approve") %>'
                                                        Width="89px"></asp:Label></ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Others">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("Others") %>'></asp:Label></ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <RowStyle ForeColor="#333333" BackColor="#F7F6F3" />
                                        <EmptyDataTemplate>
                                            <table id="table1" border="0" cellpadding="1" cellspacing="0" style="width: 903px;
                                                color: #333333; border-collapse: collapse; height: 0px">
                                                <tr style="font-weight: bold; color: white; background-color: #5d7b9d">
                                                    <th scope="col">
                                                    </th>
                                                    <th scope="col" style="width: 27px">
                                                        CIF
                                                    </th>
                                                    <th scope="col">
                                                        ACCNO
                                                    </th>
                                                    <th scope="col">
                                                        NBRTHAI
                                                    </th>
                                                    <th scope="col">
                                                        ACCGL
                                                    </th>
                                                    <th scope="col">
                                                        DECB_RD
                                                    </th>
                                                    <th scope="col">
                                                        Limit
                                                    </th>
                                                    <th scope="col">
                                                        Principal
                                                    </th>
                                                    <th scope="col">
                                                        Accru
                                                    </th>
                                                    <th scope="col">
                                                        SUSP
                                                    </th>
                                                    <th scope="col">
                                                        AGING
                                                    </th>
                                                    <th scope="col">
                                                        Subject
                                                    </th>
                                                    <th scope="col">
                                                        Old Value
                                                    </th>
                                                    <th scope="col">
                                                        Value
                                                    </th>
                                                    <th scope="col">
                                                        Approve Value
                                                    </th>
                                                    <th scope="col">
                                                        Others
                                                    </th>
                                                </tr>
                                            </table>
                                            Don &#39;t have data.</EmptyDataTemplate>
                                        <EditRowStyle BackColor="#999999" />
                                    </asp:GridView>
                                    <asp:Label ID="lblSubjectMsg" runat="server" ForeColor="Red"></asp:Label><br />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </asp:Panel>
                        <asp:Panel ID="PanelMsg" runat="server">
                            <asp:Label ID="Label27" runat="server" Text="**  หลังจากกรอกข้อมูลแล้วต้องคลิก" ForeColor="Red"></asp:Label>&nbsp;
                            <img src="../../images/qmv_bb_add.gif" alt="Add" />
                            <asp:Label ID="Label28" runat="server" Text="เพื่อบันทึกลงในรายการ" ForeColor="Red"></asp:Label>&nbsp;<asp:Label
                                ID="Label31" runat="server" Text="**  เมื่อกรอกข้อมูลครบแล้วต้องคลิก" ForeColor="Red"></asp:Label><asp:Label
                                    ID="Label10" runat="server" BackColor="#C0FFC0" BorderStyle="Outset" BorderWidth="1px"
                                    ForeColor="Black"></asp:Label><asp:Label ID="Label32" runat="server" Text="ด้านล่างเพื่อบันทึกข้อมูลทุกครั้ง "
                                        ForeColor="Red"></asp:Label></asp:Panel>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
                        <ContentTemplate>
                            <asp:Button ID="BtnAddProcessDetail" runat="server" Height="22px" Text="Add process"
                                Width="150px" BackColor="LightSteelBlue" />&nbsp;
                            <asp:Label ID="Label8" runat="server" Text=" List of  process  ( ข้อมูลผู้รับผิดชอบ ) "
                                Style="font-size: x-small; font-weight: 700"></asp:Label><asp:GridView ID="GridProcess"
                                    runat="server" AutoGenerateColumns="False" BorderStyle="Solid" BorderWidth="1px"
                                    CellPadding="1" CellSpacing="1" ForeColor="#333333" GridLines="None" Height="1px"
                                    PageSize="5" Width="990px">
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="true" ForeColor="White" />
                                    <Columns>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="BtnEdit" runat="server" CommandName="Edit" ImageUrl="~/images/qmv_bb_preview.gif"
                                                    ToolTip="Edit item" />
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <table style="width: 28px">
                                                    <tr>
                                                        <td style="width: 9px">
                                                            <asp:ImageButton ID="BtnUpdate" runat="server" CommandName="Update" ImageUrl="~/images/qmv_bb_add.gif"
                                                                ToolTip="Save item" />
                                                        </td>
                                                        <td style="width: 9px">
                                                            <asp:ImageButton ID="BtnCancel" runat="server" CommandName="Cancel" ImageUrl="~/images/qmv_r_button_undo_hover.gif"
                                                                ToolTip="Cancel item" />
                                                        </td>
                                                        <td style="width: 145px">
                                                            <asp:ImageButton ID="BtnDelete" runat="server" CommandName="Delete" ImageUrl="~/images/qmv_bb_delete.gif"
                                                                ToolTip="Delete item" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="EMPLOYEE">
                                            <EditItemTemplate>
                                                <table style="width: 223px">
                                                    <tr>
                                                        <td style="width: 36px">
                                                            <asp:DropDownList runat="server" ID="ddlEmp_ID">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Employee") %>' Width="149px"></asp:Label></ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="PROCESS">
                                            <EditItemTemplate>
                                                <asp:DropDownList ID="ddlPROCESS_ID" runat="server">
                                                </asp:DropDownList>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("PROCESS") %>' Width="352px"></asp:Label></ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="DATE">
                                            <EditItemTemplate>
                                                &nbsp;<asp:Label ID="lblDate" runat="server" Text='<%# Bind("PROCESS_DATE") %>' Width="121px"></asp:Label></EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("PROCESS_DATE") %>' Width="121px"></asp:Label></ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <EditRowStyle BackColor="#999999" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="true" ForeColor="#333333" />
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="true" ForeColor="White" />
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    <EmptyDataTemplate>
                                        Don &#39;t have data.</EmptyDataTemplate>
                                </asp:GridView>
                            &nbsp;
                            <asp:Panel ID="PanelCovenant" runat="server">
                                &nbsp;<asp:Label ID="Label39" runat="server" Style="font-weight: 700; color: #000066;
                                    font-size: x-small; background-color: #FFFFFF;" Text="Covenant (สิ่งที่ต้องปฏิบัติครั้งนี้)"
                                    Width="335px"></asp:Label><asp:RadioButton ID="RadioNoCovenant" runat="server" GroupName="covenant"
                                        AutoPostBack="true" Style="font-weight: 700; font-size: x-small;" Text="ไม่มี Covenant"
                                        Checked="false" />
                                &nbsp;&nbsp;<asp:RadioButton ID="RadioOldCovenant" runat="server" AutoPostBack="true"
                                    Checked="false" GroupName="covenant" Style="font-weight: 700; font-size: x-small;"
                                    Text="ใช้ Covenant เดิม" />
                                &nbsp;<asp:RadioButton ID="RadioCovenant" runat="server" AutoPostBack="true" Checked="false"
                                    GroupName="covenant" Style="font-weight: 700; font-size: x-small;" Text="มี Covenant ครั้งนี้" />
                                &nbsp;&nbsp;&nbsp;<asp:Image ID="ImgAddCovenant" runat="server" BorderColor="#CCCCCC"
                                    BorderStyle="Inset" ImageUrl="~/images/Add.jpg" />
                                &nbsp;<asp:Label ID="lblAddCovenant" runat="server" Font-Bold="true" ForeColor="#FF3300"
                                    Text="&lt;&lt; คลิกที่นี่เพื่อ เพิ่ม/ ยกเลิก/ ตรวจสอบ Covenant." Style="font-size: x-small"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;</asp:Panel>
                            &nbsp;
                            <asp:Panel ID="PanelFlood" runat="server">
                                <asp:Label ID="Label53" runat="server" Style="font-weight: 700; color: #000066; font-size: x-small;
                                    background-color: #CCFFFF;" Text=" เป็นเรื่องที่เกี่ยวกับน้ำท่วมหรือไม่" Width="335px"></asp:Label>
                                <asp:RadioButton ID="RadioNoFlood" runat="server" AutoPostBack="true" Checked="false"
                                    GroupName="flood" Style="font-weight: 700; font-size: x-small;" Text="ไม่เกี่ยวกับน้ำท่วม" />
                                <asp:RadioButton ID="RadioFloodBot" runat="server" AutoPostBack="true" Checked="false"
                                    GroupName="flood" Style="font-weight: 700; font-size: x-small;" Text="เกี่ยวกับ Flood BOT/SBCG" />
                                &nbsp;<asp:Image ID="ImageAddFloodBOT" runat="server" BorderColor="#CCCCCC" BorderStyle="Inset"
                                    ImageUrl="~/images/Add.jpg" />
                                &nbsp;<asp:Label ID="LabelAddFloodBOT" runat="server" Font-Bold="true" ForeColor="#FF3300"
                                    Style="font-size: x-small" Text="&lt;&lt; คลิกที่นี่เพื่อ เพิ่ม/ยกเลิก/ตรวจสอบข้อมูล Flood BOT"></asp:Label>
                                &nbsp;</asp:Panel>
                            <asp:Panel ID="PanelCheckNcb" runat="server">
                                &nbsp;<asp:Label ID="LabelCheckNcb" runat="server" Style="font-weight: 700; color: #000066;
                                    font-size: x-small;" Text="ข้อมูลการตรวจสอบ NCB" Width="335px"></asp:Label><asp:Label
                                        ID="LabelStatusCheckNcb" runat="server" Font-Bold="true" ForeColor="#3333FF"
                                        Style="font-size: x-small" Text=""></asp:Label>&nbsp;
                                <asp:Image ID="ImgAddCheckNcb" runat="server" BorderColor="#CCCCCC" BorderStyle="Inset"
                                    ImageUrl="~/images/Add.jpg" />
                                <asp:Label ID="lblAddCovenant0" runat="server" Font-Bold="true" ForeColor="#FF3300"
                                    Style="font-size: x-small" Text="&lt;&lt; คลิกที่นี่เพื่อบันทึกข้อมูลการตรวจสอบ NCB"></asp:Label><br />
                            </asp:Panel>
                            <br />
                            <asp:Label ID="lblSendToboard" runat="server" Style="font-weight: 700; color: #000066;
                                font-size: x-small;" Width="335px">Type of approval 
            authority (ประเภทอำนาจอนุมัติ)</asp:Label><asp:DropDownList ID="ddlSendToBoard" runat="server"
                AutoPostBack="true">
            </asp:DropDownList>
                            <br />
                            <asp:Panel ID="PanelBoarResutl" runat="server" Height="50px" Visible="False" Width="958px">
                                <table bgcolor="aliceblue" style="width: 989px">
                                    <tr>
                                        <td style="width: 1622px; height: 51px;">
                                            <table style="width: 1000px;">
                                                <tr>
                                                    <td style="width: 197">
                                                        <asp:Label ID="Label35" runat="server" Font-Bold="true" Text="Risk Result" Width="107px"></asp:Label>
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblEMP_REQUEST_ID" runat="server" Text="Request By (ผู้ขออนุมัติ)"></asp:Label>
                                                    </td>
                                                    <td colspan="2">
                                                        <asp:DropDownList ID="DDLRequestApprove" runat="server">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="LabelSubComittee1" runat="server" Text="Sub Committee ( ผู้อนุมัติเบื้องต้น ) 1"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="DDLSubcommittee1" runat="server">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="LabelSubComittee2" runat="server" Text="Sub Committee ( ผู้อนุมัติเบื้องต้น ) 2"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="DDLSubcommittee2" runat="server">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="LabelSubComittee3" runat="server" Text="Sub Committee ( ผู้อนุมัติเบื้องต้น ) 3"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="DDLSubcommittee3" runat="server">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="LabelMDoKFSFLAG" runat="server" BackColor="" Text="มีการทำ C/A  บน  KFS"></asp:Label>
                                                    </td>
                                                    <td colspan="2">
                                                        <asp:RadioButton ID="RadioButtonKFS" runat="server" AutoPostBack="true" Checked="false"
                                                            GroupName="KFSFLAG" Style="font-size: x-small;" Text="Yes" />
                                                        &nbsp;<asp:RadioButton ID="RadioButtonNoKFS" runat="server" AutoPostBack="true" Checked="false"
                                                            GroupName="KFSFLAG" Style="font-size: x-small; color: #660033;" Text="No" />
                                                        &nbsp;&nbsp;&nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblEMP_REQUEST_ID0" runat="server" Text="CM Comment(ความเห็นผู้เสนอ)"></asp:Label>
                                                    </td>
                                                    <td colspan="2">
                                                        <asp:DropDownList ID="ddlComment" runat="server">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        CM remark (อื่น ๆข้อคิดเห็น)
                                                    </td>
                                                    <td colspan="2" style="height: 29px">
                                                        <table style="width: 100%;">
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="lblEMP_REQUEST_ID1" runat="server" Font-Overline="False" Font-Underline="true"
                                                                        Text="เหตุผลประกอบการพิจารณา"></asp:Label><br />
                                                                    <asp:TextBox ID="tbReason2" runat="server" Columns="4" MaxLength="255" Rows="4" TextMode="MultiLine"
                                                                        Width="307px"></asp:TextBox>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblEMP_REQUEST_ID2" runat="server" Font-Underline="true" Text="ผลการพิจารณา"></asp:Label><br />
                                                                    <asp:TextBox ID="tbcm_remark" runat="server" Columns="4" MaxLength="255" Rows="4"
                                                                        TextMode="MultiLine" Width="307px"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblBOARD_ID" runat="server" Text="Board ( เสนอต่อบอร์ด)"></asp:Label>
                                                    </td>
                                                    <td colspan="2">
                                                        <asp:DropDownList ID="ddlBOARD_ID" runat="server">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label29" runat="server" Text="Others/Remark (อื่นๆ/ข้อคิดเห็น)"></asp:Label>
                                                    </td>
                                                    <td colspan="2" style="height: 29px">
                                                        <asp:TextBox ID="tbOthers2" runat="server" Columns="4" MaxLength="255" Rows="4" TextMode="MultiLine"
                                                            Width="490px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label30" runat="server" Text=" Result ( ผลพิจารณา) visible false"
                                                            Visible="False"></asp:Label>
                                                    </td>
                                                    <td colspan="2" style="height: 29px">
                                                        <asp:DropDownList ID="ddlResult" runat="server" Visible="False">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                            <asp:Panel ID="PanelCMResutl" runat="server" Height="50px" Visible="false" Width="958px">
                                <table>
                                    <tr>
                                        <td colspan="2">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="height: 1px">
                                            <table bgcolor="whitesmoke" bordercolor="#000099" style="width: 980px; margin-right: 66px;
                                                height: 147px;">
                                                <tr>
                                                    <td style="width: 507px">
                                                        <asp:Label ID="Label26" runat="server" Font-Bold="true" Text="Risk Result" Width="107px"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" style="width: 507px;">
                                                        <table style="width: 1000px">
                                                            <tr>
                                                                <td style="width: 197">
                                                                    <asp:Label ID="lblEMP_APPROVE_ID" runat="server" Text="Approve 1 BY (ผู้อนุมัติที่ 1)"></asp:Label>
                                                                </td>
                                                                <td colspan="2">
                                                                    <asp:DropDownList ID="DDLApprove1" runat="server">
                                                                    </asp:DropDownList>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label25" runat="server" Text="Approve 2 BY (ผู้อนุมัติที่2)" Width="154px"></asp:Label>
                                                                </td>
                                                                <td colspan="2">
                                                                    <asp:DropDownList ID="DDLApprove2" runat="server">
                                                                    </asp:DropDownList>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label37" runat="server" Text="Approve 3 BY (ผู้อนุมัติที่ 3)" Width="154px"></asp:Label>
                                                                </td>
                                                                <td colspan="2">
                                                                    <asp:DropDownList ID="DDLApprove3" runat="server">
                                                                    </asp:DropDownList>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label38" runat="server" Text="Approve 4 BY (ผู้อนุมัติที่ 4)" Width="154px"></asp:Label>
                                                                </td>
                                                                <td colspan="2">
                                                                    <asp:DropDownList ID="DDLApprove4" runat="server">
                                                                    </asp:DropDownList>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="lblOthers" runat="server" Text="Others/Remark (อื่นๆ/ข้อคิดเห็น)"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblOthers0" runat="server" Font-Underline="true" Height="16px" Text="เหตุผลประกอบการพิจารณา"></asp:Label><br />
                                                                    <asp:TextBox ID="tbReason" runat="server" Columns="4" MaxLength="255" Rows="4" TextMode="MultiLine"
                                                                        Width="307px"></asp:TextBox>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblOthers1" runat="server" Font-Underline="true" Height="16px" Text="ผลการพิจารณา"></asp:Label><br />
                                                                    <asp:TextBox ID="tbOthers" runat="server" Columns="4" MaxLength="255" Rows="4" TextMode="MultiLine"
                                                                        Width="307px"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Panel ID="PanelIDout" runat="server" Width="986px">
                        <asp:Label ID="lblID_OUT" runat="server" Font-Bold="true" Text="ID OUT( เลขที่หนังสือออก)"
                            Width="209px" Style="font-size: x-small"></asp:Label><asp:TextBox ID="tbID_OUT" runat="server"
                                MaxLength="50" Width="79px"></asp:TextBox>&nbsp;<asp:Button ID="btnIDOUT" runat="server"
                                    BackColor="#CCFFFF" Font-Bold="true" Text="Create annals out ( ออกเลขหนังสือออก)"
                                    Width="244px" OnClientClick="return checkRating(event);" />
                        <asp:Label ID="Label40" runat="server" Style="font-weight: 700; font-size: x-small;
                            color: #003300; background-color: #FFFFFF" Text="** กรุณาเลือก Update all data ก่อนออกเลข"></asp:Label></asp:Panel>
                    <br />
                    <asp:Button ID="btnUpdate" runat="server" Text="** Update all data ** " BackColor="#C0FFC0"
                        Font-Bold="true" Width="209px" />
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel ( ยกเลิกการบันทึก )" BackColor="#FFC0C0"
                        Font-Bold="true" Width="188px" />
                    <input id="BtnClose" style="font-weight: bold; width: 207px; text-indent: 10pt; background-color: #ffcc66"
                        type="button" value="Close ( ปิดหน้าจอ)" runat="server" /><asp:Button ID="BtnCancelAnnals"
                            runat="server" BackColor="Red" ForeColor="#FFFFCC" Text="ยกเลิกหนังสือ ( เฉพาะ ADMIN)"
                            Width="213px" />
                </td>
            </tr>
            <tr>
                <td colspan="3" style="width: 943px; height: 18px;">
                    <br />
                    &nbsp;<br />
                    <asp:Image ID="linkupload" runat="server" BorderStyle="Outset" BorderWidth="2px"
                        Height="20px" ImageUrl="~/images/word.gif" Visible="False" Width="26px" />
                    <asp:Label ID="lblUpload" runat="server" Font-Bold="true" Style="font-size: x-small"
                        ForeColor="Blue" Text="<< Click to upload file ( อัพโหลดเอกสาร,รูปภาพ)" Visible="False"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        &nbsp;<br />
    </asp:Panel>
    </form>
</body>
</html>
<script language="javascript" type="text/javascript">

    function setValueRisk(riskid, riskname, riskteam, risktel) {// รับค่าคลิกจาก SearchRisk.aspx
        document.formAnnalsCredit.RiskIDTB.value = riskid;
        document.formAnnalsCredit.RiskNameTB.value = riskname;
    }


</script>
