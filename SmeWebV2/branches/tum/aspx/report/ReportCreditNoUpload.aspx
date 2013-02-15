<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ReportCreditNoUpload.aspx.vb" Inherits="aspx_report_ReportCreditNoUpload" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script type="text/javascript" src="../../js/jquery.js" ></script>

   <link rel="stylesheet" type="text/css" href="../../js/ext3.0/resources/css/ext-all.css" />
    <script type="text/javascript" src="../../js/ext3.0/adapter/ext/ext-base.js"></script>
    <script type="text/javascript" src="../../js/ext3.0/ext-all.js"></script>
    <script type="text/javascript" src="../../js/ext3.0/iframeComponent.js"></script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<style type="text/css">
body {
    margin-left:5px;
}
#tb_checkupload {
   width:1300px;
   font-size:12px;
  border: 1px #666 solid;
  border-collapse: collapse;
  border-spacing: 0px;
   padding-left:5px;
    
}
#tb_checkupload  tr th {
  border-bottom: 1px #666 solid;
  font-weight: bold;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 2px;
  padding-right: 2px;
}
#tb_checkupload  tr td {
  border-bottom: 1px #aaa dotted;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 2px;
  padding-right: 2px;
}
thead  td {
   border-bottom : 1px #666 solid;
   padding-top: 4px;
   background:#5D7B9D;
    color:White;
   font-size:14px;
   padding-bottom: 8px;
   font-weight:bold;
}
.odd {
   background:#F7F6F3;
}
.link {
   cursor:pointer;
   text-decoration:underline;
   color:Highlight;
} 
.apptype {
      color:Highlight;
       width:150px
}   
.process {  
     color:Highlight;
     width:150px;

}   
.lackfile {
   color:Red;
}
.Loading {
  background-image:url("../../images/progress/cicle/icon_animated_busy.gif");
  background-repeat:no-repeat;
  
}
#divLoading
    {
        height: 26px;
        width: 80px;
         text-align:right;
         font-weight:bold ;
         color:Gray;
    }
  #tableSearch {
     border:0px;
     border-bottom:none;
  }  
  
 #sortappdate {
  cursor :pointer;
   text-decoration:underline;
    color: Blue 
  }
  #sortwaiting {
  cursor :pointer;
   text-decoration:underline;
   color: Blue 
 }
</style>
<body>

    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" 
    EnablePageMethods="true"  runat="server" />
<h4>รายการ C/A ที่ยังไม่มีไฟล์แนบในระบบ ( ขาดไฟล์หัวข้อ รายงานวิเคราะห์ และ 
     CA อนุมัติครั้งนี้ )
    <input id="btnClose" type="button" value="ปิดหน้านี้"  onclick="window.close()"/></h4>   
    <table id="tableSearch">
        <tr>
            <td>
    เลือกประเภทอำนาจ</td>
            <td>
     <select id="selectAuth" name="D1">
        <option  param="s">สินเชื่อในอำนาจบุคคล</option>
        <option  param="m">สินเชื่อในอำนาจคณะกรรมการ กสช.</option>
    </select></td>
            <td>
    
                &nbsp;</td>
            <td>
           <div id="divLoading"></div>
    </td>
        </tr>
    </table>
    <table ID="tb_checkupload">
    <thead>
                <td>No.</td>
                 <td >เลขที่หนังสือ</td>
                <td >CIF</td>
                <td >ลูกค้า</td>
                <td >พนักงาน</td> 
                <td >ประเภท</td>
                <td>ขั้นตอน</td>
                <td ><span id="sortappdate">วันที่</span></td>
               <td >ขาดเอกสาร</td>
               <td><span id="sortwaiting">รอเอกสาร</span></td>
      </thead>
     <tbody></tbody>
    </table>   
    
  </form>
</body>
</html>

   <script type="text/javascript" >
       var sort = 1;
       var sel='s';
       $(document).ready(function() {
           //Ext.onReady(function() {
           findNoUpload(sel,sort);
           // $("#tb_checkupload  >tr:odd").css("background-color", "#bbbbff")
           //           $('#btnSelect').click(function() {
           //               var sel = $('#selectAuth :selected').attr('param');    // ไม่สามารถใช้ .val() ได้จึงต้องใช้การตั้งชื่ออื่นแทน
           //                findNoUpload(sel)
           //           });
           $("#selectAuth").change(function() {

               sel = $('#selectAuth :selected').attr('param');    // ไม่สามารถใช้ .val() ได้จึงต้องใช้การตั้งชื่ออื่นแทน
               if (sel != '' && sort != '') {
                   findNoUpload(sel, sort)
               }
           }); // $("#selectAuth").change(function() {

           $("#sortappdate").click(function() {   // ถ้าเลือก sort ตามวันที่
               sort = 1;
               if (sel != '' && sort != '') {
                   findNoUpload(sel, sort)
               }
           }); //   $("#sortappdate").click(function() {
           $("#sortwaiting").click(function() {   // ถ้าเลือก sort ตามรอเอกสาร
               sort = 2;
               if (sel != '' && sort != '') {
                   findNoUpload(sel, sort)
               }
           }); //   $("#sortappdate").click(function() {

       });  // $(document).ready(function() {

       function findNoUpload(selectAuth,sortOrder) {
           $('#divLoading').addClass('Loading').html('Loading..');
           PageMethods.searchNoUpload(selectAuth,sortOrder , OnSucceeded, OnFailed);
           setTimeout("$('#divLoading').removeClass('Loading').html('')", 3000); 
       }
       function OnSucceeded(result) {
           try {
                  // alert(result);

               var LACKFILE = ''
               var WAITING = ''
               var obj = eval('(' + result + ')');
               $('#tb_checkupload  tbody').html('');  // กำหนดให้ table ว่าง
               $.each(obj.data, function(key, rows) {
                   //$.each(rows, function(index, value) {
                   //alert(index + ': ' + value);
                   //});

                   if (rows.FILE2 == '') {
                       LACKFILE = ' <li> รายงานการวิเคราะห์ ';
                   }
                   if (rows.FILE14 == '') {
                       LACKFILE = ' <li> CA อนุมัติครั้งนี้';
                   }
                   if (rows.FILE2 == '' && rows.FILE14 == '') {
                       LACKFILE = ' <li> รายงานการวิเคราะห์ <br> <li> CA อนุมัติครั้งนี้ ';
                   }
                   if (rows.WAITING == '1') {
                       WAITING = 'checked';
                   } else {
                       WAITING = ' '
                   }
                   createHtmlRow(key + 1, rows.ID, rows.CIF, rows.CUSTOMER,
                       rows.EMPLOYEE, rows.APPTYPE, rows.PROCESS, rows.APPDATE, LACKFILE, WAITING)
               });
               $("#tb_checkupload  tbody  tr:odd").addClass("odd");  // กำหนดให้แถวจำนวนคี่เป็น อีกสี
               $('.link').click(function() {
                  //  alert($(this).attr('url'));
                          openwin($(this).attr('url'));
               });
               $(".updateStatus").click(function() {
                   var ID = $(this).attr('value');
                   var ACTION
                   if ($(this).attr('checked')) {
                       ACTION = 'add';
                   } else {
                       ACTION = 'del';
                   }
                   //alert(ID);
                   //alert(ACTION);
                   $('#divLoading').addClass('Loading').html('Saving..');
                  PageMethods.updateStatusNoUpload(ID, ACTION, OnSucceededUpdate, OnFailedUpdate);
                   setTimeout("$('#divLoading').removeClass('Loading').html('')", 3000); 
               });
           }
           catch (err) {
               txt = "There was an error on this page.\n\n";
               txt += "Error description: " + err.description + "\n\n";
               txt += "Click OK to continue.\n\n";
               alert(txt);
           }
     
        }
        function OnFailed(error) {
            alert(' ไม่สามารถแสดงข้อมูลในขณะนี้ได้ ');
        }
        function OnSucceededUpdate(msg) {
            if (msg == '1') {
                //  alert(' บันทึกข้อมูลเรียบร้อย ');
            } else {
            alert(' ไม่สามารถบันทึกข้อมูลได้ในขณะนี้  \n ' + msg);
            }
        }
        function OnFailedUpdate(error) {
            alert(' ไม่สามารถบันทึกข้อมูลได้ในขณะนี้  \n ' + error );
        }

        function createHtmlRow(KEY, ID, CIF, CUSTOMER, EMPLOYEE, APPTYPE, PROCESS, APPDATE, LACKFILE, WAITING) { 
                 var row ='<tr>';
                    row += '<td>'+ KEY + '</td>';
                   row += '<td><span class="link"  url="../uploadfile/UploadFile.aspx?annals_id=' + ID + '">' + ID + '</span></td>';
                   row += '<td>' + CIF + '</td>';
                    row += '<td>' + CUSTOMER + '</td>';
                   row += '<td>' + EMPLOYEE + '</td>';
                    row += '<td class="apptype">' + APPTYPE + '</td>';
                    row += '<td class="process">' + PROCESS + '</td>';
                    row += '<td>' + APPDATE + '</td>';
                    row += '<td class="lackfile">' + LACKFILE + '</td>';
                    row += '<td><input  class="updateStatus" type="checkbox" value="' + ID + '" ' + WAITING + '></td>';
                    row += '</tr>';
                    $(row).appendTo('#tb_checkupload  tbody');
                }  
                
    
       function openwin(url) {
          mywindow = window.open(url, "mywindow","location=1,status=1,scrollbars=1,width=900,height=500");
         //mywindow.moveTo(0, 0);
           // windowFrame.render(Ext.getBody());
        //   alert(url);
//          var smeGroupWin;
//           if (!smeGroupWin) {
//               smeGroupWin = new Ext.Window({
//                   id: 'smeGroupWindow',
//                   title: 'อัพโหลดเอกสาร C/A',
//                   layout: 'fit',
//                   width: 800,
//                   height: 550,
//                   autoDestroy: true,
//                   closable: true,
//                   plain: true,
//                   items: new Ext.ux.IFrameComponent({
//                       id: 'smeGroupIframe',
//                       url: url,
//                       myId: 'smeGroupIframe'
//                   })
//               });
//           }        
//          smeGroupWin.show(this);
//          
       }    
      
   </script>