<%@ Page Language="VB" AutoEventWireup="false" CodeFile="check_list.aspx.vb" Inherits="smes_check_list" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="js/jquery-ui-1.8.18/js/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui-1.8.18/js/jquery-ui-1.8.18.custom.min.js" type="text/javascript"></script>
    <link href="js/jquery-ui-1.8.18/css/ui-lightness/jquery-ui-1.8.18.custom.css" rel="stylesheet"
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
                margin:12px;

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
               margin:5px;
               float:left;
               width:30%;
            }             
            .divResultHead 
            {
                  width:100%;
                    border:1px;
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
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            var heightDiv = $(document).height();
            $("#mainFrame", parent.document).height(heightDiv + 100);  // กำหนด
            $("input[type=submit]").button();
            $("#accordion").accordion({ autoHeight: false, collapsible: true });

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

            $("#USERTextBox").val(userName);
            $("#REF_IDTextBox").val(RefID);
            $("#TemplateTextBox").val(TemplateID);

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
        &nbsp;REF:&nbsp;<asp:TextBox ID="REF_IDTextBox" ToolTip="ref_id" runat="server" Width="100" />
        &nbsp;User:<asp:TextBox ID="USERTextBox" ToolTip="ref_id" runat="server" Width="100" />
        &nbsp;Template:<asp:TextBox ID="TemplateTextBox" ToolTip="TEMPLATE_ID" runat="server"
            Width="20" />
    </div>
    <div id="header">
        <h3>
            <asp:Label ID="labelHead" runat="server" Text="Check List (ตรวจสอบข้อมูลเบื้องต้น)"
                Style="font-weight: 700; color: #0000FF"></asp:Label>
        </h3>
        <br />
        <h3>
            <asp:Label ID="label1" runat="server" Text="ผลการพิจารณา" Style="font-weight: 700;
                color: #000000"></asp:Label>
            &nbsp;
            <asp:Label ID="ResultLabel" runat="server" Text="ยังไม่ได้บันทึก"></asp:Label>
            <br />
            <br />
            <asp:Button ID="ButtonSave" runat="server" Text=" บันทึกผล " />
        </h3>
    </div>
    <div id="divTotalResult">
        <span id="spanTotalResult"></span>
        <asp:Panel runat="server" ID="PanelForm">
        </asp:Panel>
    </div>
    <asp:Button ID="ButtonSave2" runat="server" Text=" บันทึกผล " />
    </form>
</body>
</html>
