<%@ Page Language="VB" AutoEventWireup="false" CodeFile="check_list.aspx.vb" Inherits="smes_check_list" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="js/jquery-ui-1.8.18/js/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui-1.8.18/js/jquery-ui-1.8.18.custom.min.js" type="text/javascript"></script>
    <link href="js/jquery-ui-1.8.18/css/ui-lightness/jquery-ui-1.8.18.custom.css" rel="stylesheet"
        type="text/css" />
           <link href="js/jquery-ui-1.8.18/css/bootstrap/css/bootstrap.min.css" rel="stylesheet"
        type="text/css" />
    <style type="text/css">
        body
        {
            font-size: smaller;
            font-family: arial;
            background-image: url("images/gradient2.png");
            background-repeat: repeat-x;
            margin: 5px5px;.
            padding-left:5px;
        }
        .hidebutton
        {
            display:none;
            }
        .qg
        {
            background-color:#0088FF;
        }
        .qt 
        {
            background-color:#FF88FF;
         }
         h4 
         { font-size:16px;
            margin:1px 0px   
          }
          #mainhead 
          {
             height:20px;
            }
             .ckGroupName 
            {
                width:90%;
                font-size:large;   
                padding:5px;
                margin:5px;
             }
            .ckName 
            {
                width:90%;
                padding:5px;
                margin:5px;
                margin-bottom:0px;

             }
           .ckBox 
           {
             padding:5px;   
             margin:5px;
            }
            .divCK 
            {
              margin:10px;
              border:1px;
             }
             
            .divResult
            {
               margin:1px;
               float:left;
               width:30%;
               margin-top:0;
               margin-bottom:20px;
            }             
            .divResultHead 
            {
                 
                    border:1px;
                    padding-left :75px;
                    
             }
            #divRef
            {
                position: absolute;
                top: 0;
                right: 0;
            }
            input[type=submit] 
            {
              margin:5px;    
            }
            .clear {
    clear: both;
}
    </style>

    <style id="printStyle" type="text/css" runat="server" media="print">
        .noPrint
        {
            display:none;
        }
    </style>

    <script type="text/javascript">
        function HideButtons() {
//            document.getElementById("<%=ButtonPrint.ClientID %>").setAttribute("class", "hidebutton");
            var checklistPopup = window.open('check_list.aspx?mode=print&SMES_ID=<%= Request.QueryString("SMES_ID") & "&TEMPLATE_ID=" & Request.QueryString("TEMPLATE_ID") & "&SMES_TYPE=" & Request.QueryString("SMES_TYPE") %> ', 'checklistPopup', 'width=800,height=400');
            checklistPopup.focus();
//            alert("w:"+w);
//            w.focus();
//            w.document.getElementById("ButtonPrint").value = "change text";
//            alert("id:"+w.document.getElementById("ButtonPrint").id);
//            w.document.getElementById("ButtonPrint").setAttribute("class", "hidebutton");
//            $(w.document).find('#ButtonPrint').addClass('hidebutton');
         //$("#ButtonPrint")._addClass('hidebutton');
//            $(w.document).find('#ButtonPrint').addClass('hidebutton');


        }

        $(document).ready(function () {
            var heightDiv = $(document).height();
            $("#mainFrame", parent.document).height(heightDiv + 100);  // กำหนด
            //  $("input[type=submit]").button();
            $("#accordion").accordion({ autoHeight: false, collapsible: true });

//            if (!window.parent) {
//                userName = window.parent.document.getElementById("spanUserName").innerText;
//            } else if (!window.opener) {
//                userName = window.opener.document.getElementById("spanUserName").innerText;
//            } else {
//                alert("no parent nor opener window.");
//                //userName = getValueFromQueryString("username");
//            }

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

            //$("#USERTextBox").val(userName);
            //$("#REF_IDTextBox").val(RefID);
            //$("#TemplateTextBox").val(TemplateID);

        });

        var totalResult;
        function checkResult(newResult) {
            var spanTotalResult = $("#spanTotalResult");
            if (newResult == 'O') {
                totalResult = 'O';
                spanTotalResult.html('OUT OF SCOPE');
            } else if (newResult == 'R' && totalResult == 'A') {
                totalResult = 'R';
                spanTotalResult.html('REJECT');
            } else if (newResult == 'A') {
                totalResult = 'A';
                spanTotalResult.html('APPROVE');
            }

        }
       

    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="divRef">
        SMES_ID:<asp:TextBox ID="SMES_IDTextBox" runat="server" MaxLength="10" Width="30"></asp:TextBox>
        TYPE:<asp:TextBox ID="SMES_TYPETextBox" runat="server" MaxLength="2" Width="10"></asp:TextBox>
        &nbsp;REF:&nbsp;<asp:TextBox ID="REF_IDTextBox" ToolTip="ref_id" runat="server" Width="100" />
        &nbsp;User:<asp:TextBox ID="USERTextBox" ToolTip="ref_id" runat="server" Width="100" />
        &nbsp;Template:<asp:TextBox ID="TemplateTextBox" ToolTip="TEMPLATE_ID" runat="server"
            Width="20" />
    </div>
    <div id="header"><br /> <br /> 
       <h3>
            <asp:Label ID="labelHead" runat="server" Text="Check List (ตรวจสอบข้อมูลเบื้องต้น)"
                Style="font-weight: 700; color: #9999"></asp:Label>
        </h3>
        
        <h4>
            <asp:Label ID="label1" runat="server" Text="ผลการพิจารณา" Style="font-weight: 700;
                color: #d88403"></asp:Label>
            &nbsp;
            <asp:Label ID="ResultLabel" runat="server" Text="ยังไม่ได้บันทึก"></asp:Label>
            <br />
            <br />
           
              <asp:Button ID="ButtonSave" runat="server" Text="บันทึกผล" class ="ui-widget-header2" />
       <asp:Button ID="ButtonPrint" runat="server" Text="แสดงผลพิมพ์"   
                class ="ui-widget-header2 noPrint" onclientclick="HideButtons();return false;" UseSubmitBehavior="False" 
               />
          
              
        </h4>
    </div>
    <div id="divTotalResult">
        <span id="spanTotalResult"></span>

        <asp:Panel runat="server" ID="PanelForm">
        </asp:Panel>
    </div>
    <div class ="clear ckName ui-widget-contentChk" align="right">
    <asp:Button ID="ButtonSave2"  runat="server" Text="บันทึกผล" class ="ui-widget-header2"/></div>
    </form>
</body>
</html>
