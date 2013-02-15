<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="smes_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <script src="js/jquery-ui-1.8.18/js/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui-1.8.18/js/jquery-ui-1.8.18.custom.min.js" type="text/javascript"></script>
    <link href="js/jquery-ui-1.8.18/css/ui-lightness/jquery-ui-1.8.18.custom.css" rel="stylesheet"
        type="text/css" />
    <style>
        .qg
        {
            background-color: #0088FF;
        }
        .qt
        {
            background-color: #FF88FF;
        }
    </style>
    <script>
        $(function () {
            $("#accordion").accordion();
        });
    </script>
</head>
<body>
    <form name="form1" method="post" action="check_list.aspx" id="form1">
    <div>
        <input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUKLTIwNjAyODU4M2RkYgSPhGz6r2PUHSfwaHAfuxx695s=" />
    </div>
    <div>
        SME SS Project Checklist
    </div>
    <div id='accordian'>
        <h3 class='ui-accordion-header ui-helper-reset ui-state-active ui-corner-top'>
            <span class='ui-icon ui-icon-triangle-1-s' /><a href='#'>Watch List</a></h3>
        <div class='ui-accordion-content ui-helper-reset ui-widget-content ui-corner-bottom ui-accordion-content-active'>
            Watch list<br>
            <input id="Radio1" type='radio' runat='server' name='Q1' value='1'>
            1. Business that is against morality (ธุรกิจที่ขัดต่อศีลธรรมอันดี)<br>
            <input id="Radio2" type='radio' runat='server' name='Q1' value='2'>
            2. Business that affect environment and not comply with environmental standard (ธุรกิจที่มีผลกระทบต่อสิ่งแวดล้อม
            และยังไม่มีการจัดการให้เรียบร้อยตามมาตรฐาน)<br>
            <input id="Radio3" type='radio' runat='server' name='Q1' value='3'>
            3. Business that has conflict with public or Government agencies (ธุรกิจที่ผู้ประกอบการกำลังมีข้อพิพาทกับชุมชน
            หรือหน่วยงานราชการ)<br>
            <input id="Radio4" type='radio' runat='server' name='Q1' value='4'>
            4. Business that may involve in money laundering (ธุรกิจที่คาดว่าเกี่ยวข้องกับความผิดมูลฐานตาม
            พรบ. ฟอกเงิน)<br>
            <input id="Radio5" type='radio' runat='server' name='Q1' value='5'>
            5. Business that is illegal (ธุรกิจผิดกฎหมาย)<br>
            <input id="Radio6" type='radio' runat='server' name='Q1' value='6'>
            6. Business that is related to BAY executives (ธุรกิจที่มีผู้บริหารระดับสูงของธนาคารฯ
            เข้าไปเกี่ยวข้อง)<br>
            <input id="Radio7" type='radio' runat='server' name='Q1' value='7'>
            7. Casino or business that involves gambling (ธุรกิจคาสิโน และธุรกิจการพนัน)<br>
            <input id="Radio8" type='radio' runat='server' name='Q1' value='8'>
            8. Firework business (ธุรกิจเกี่ยวกับพลุ ประทัด)<br>
            <input id="Radio9" type='radio' runat='server' name='Q1' value='9'>
            9. Business that involves politicians (ธุรกิจที่เกี่ยวข้องกับนักการเมือง)<br>
            <input id="Radio10" type='radio' runat='server' name='Q1' value='10'>
            10. Law firm / accounting auditor (สำนักงานกฎหมาย / บัญชี)<br>
            <input id="Radio11" type='radio' runat='server' name='Q1' value='11'>
            11 Foreign exchange service (ธุรกิจแลกเปลี่ยนเงินตราต่างประเทศ)<br>
            <input id="Radio12" type='radio' runat='server' name='Q1' value='12'>
            12. Money transfer service (ธุรกิจโอนเงินออกนอกประเทศ)<br>
            <input id="Radio13" type='radio' runat='server' name='Q1' value='13'>
            13. Weapon factory (โรงงานผลิตอาวุธยุทโธปกรณ์)<br>
            <input id="Radio14" type='radio' runat='server' name='Q1' value='14'>
            14. Weapon trading / agency "(ธุรกิจ / นายหน้าค้าอาวุธยุทโธปกรณ์)<br>
            <input id="Radio15" type='radio' runat='server' name='Q1' value='15'>
            15. Entertainment (ธุรกิจสถานบันเทิง)<br>
            <input id="Radio16" type='radio' runat='server' name='Q1' value='16'>
            16. Not in Prohibited business as above (ไม่เข้าข่ายธุรกิจต้องห้ามข้างบน)<h3 class='ui-accordion-header ui-helper-reset ui-state-active ui-corner-top'>
                <span class='ui-icon ui-icon-triangle-1-s' /><a href='#'>1. Facility terms (การให้สินเชื่อ)</a></h3>
            <div class='ui-accordion-content ui-helper-reset ui-widget-content ui-corner-bottom ui-accordion-content-active'>
                Industry อุตสาหกรรม<br>
                <input id="Radio17" type='radio' runat='server' name='Q2' value=''><h3 class='ui-accordion-header ui-helper-reset ui-state-active ui-corner-top'>
                    <span class='ui-icon ui-icon-triangle-1-s' /><a href='#'>2. Qualification (Individual)
                        คุณสมบัติของบุคคลธรรมดา</a></h3>
                <div class='ui-accordion-content ui-helper-reset ui-widget-content ui-corner-bottom ui-accordion-content-active'>
                    <br>
                    <input id="Radio18" type='radio' runat='server' name='Q' value=''><h3 class='ui-accordion-header ui-helper-reset ui-state-active ui-corner-top'>
                        <span class='ui-icon ui-icon-triangle-1-s' /><a href='#'>3. Qualification (Juristic)
                            คุณสมบัติของนิติบุคคล</a></h3>
                    <br>
                    <input id="Radio19" type='radio' runat='server' name='Q' value=''><h3 class='ui-accordion-header ui-helper-reset ui-state-active ui-corner-top'>
                        <span class='ui-icon ui-icon-triangle-1-s' /><a href='#'>4. Past payment Record (individual)
                            ประวัติการชำระหนี้ที่ผ่านมาของบุคคลธรรมดา</a></h3>
                    <br>
                    <input id="Radio20" type='radio' runat='server' name='Q' value=''><h3 class='ui-accordion-header ui-helper-reset ui-state-active ui-corner-top'>
                        <span class='ui-icon ui-icon-triangle-1-s' /><a href='#'>5. Past payment Record (Juristic)
                            ประวัติการชำระหนี้ที่ผ่านมาของนิติบุคคล</a></h3>
                    <br>
                    <input id="Radio21" type='radio' runat='server' name='Q' value=''><h3 class='ui-accordion-header ui-helper-reset ui-state-active ui-corner-top'>
                        <span class='ui-icon ui-icon-triangle-1-s' /><a href='#'>6. Collateral หลักประกัน</a></h3>
                    <br>
                    <input id="Radio22" type='radio' runat='server' name='Q' value=''><h3 class='ui-accordion-header ui-helper-reset ui-state-active ui-corner-top'>
                        <span class='ui-icon ui-icon-triangle-1-s' /><a href='#'>7. Financial performance ความสามารถในการชำระหนี้</a></h3>
                    <br>
                    <input id="Radio23" type='radio' runat='server' name='Q' value=''></div>
            </div>
            <br>
            <br>
            <input type='submit' value='Save'>
    </form>
</body>
</html>
