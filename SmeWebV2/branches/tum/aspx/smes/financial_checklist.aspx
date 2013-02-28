<%@ Page Language="VB" AutoEventWireup="false" CodeFile="financial_checklist.aspx.vb"
    Inherits="smes_financial_checklist" %>

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
        
        .style1
        {
        }
        .style2
        {
            width: 353px;
            height: 23px;
        }
        #tableResult
        {
            font-size: 12px;
        }
        .style4
        {
            width: 511px;
        }
        .style5
        {
            height: 23px;
            width: 511px;
        }
        .style6
        {
            width: 168px;
        }
        .style7
        {
            width: 168px;
            height: 23px;
        }
        .ui-widget-header
        {
            border: 1px solid #e78f08;
            background: #f6a828 url('js/jquery-ui-1.8.18/css/ui-lightness/images/ui-bg_gloss-wave_35_f6a828_500x100.png') repeat-x 50% 50%;
            color: #ffffff;
            font-weight: bold;
        }
        .style8
        {
            width: 168px;
            height: 19px;
        }
        .style9
        {
            width: 353px;
            height: 19px;
        }
        .style10
        {
            width: 511px;
            height: 19px;
        }
    </style>
    <script src="js/jquery-1.7.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui-1.8.18/js/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui-1.8.18/js/jquery-ui-1.8.18.custom.min.js" type="text/javascript"></script>
    <link href="js/jquery-ui-1.8.18/css/ui-lightness/jquery-ui-1.8.18.custom.css" rel="stylesheet" />
    <script type="text/javascript">
        $(document).ready(function () {
            var heightDiv = $(document).height();
            $("#mainFrame", parent.document).height(heightDiv);  // กำหนด
            $("input[type=submit]").button();
        });
    </script>
 <script type="text/javascript">
     function changeMenu(SMES_ID) {
         //alert(SMES_ID);
         top.frames['menuFrame'].location = "financial_menu.aspx?SMES_ID=" + SMES_ID;
     }
     function changeMainFrame(SMES_ID) {
         //alert(SMES_ID);
         top.frames['mainFrame'].location = "financial_data.aspx" + "?SMES_TYPE=1&SMES_ID=" + SMES_ID;
     }
     function showDialog(msg) {
         //alert(msg);
         $("#dialog").dialog({
             autoOpen: true,
             position: [300, 200],
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
      <div id="dialog" title="">
        <p class="msg">
        </p>
    </div>
    <div id="header">
        <h3>
            <asp:Label ID="labelHead" runat="server" Text="Check List ( ผลการตรวจสอบ )" Style="font-weight: 700;
                color: #0000FF"></asp:Label>
        </h3>
    </div>
    <div>
        <table id="tableResult" style="width: 100%">
            <tr>
                <td class="style6">
                    &nbsp;
                </td>
                <td class="style1" colspan="2">
        <asp:Label ID="ResultInfoLabel" runat="server" Text="RESULT (ผลการพิจารณา)" Style="font-weight: 700;
            font-size: large;"></asp:Label>
        &nbsp;=&nbsp;
        <asp:Label ID="ResultLabel" runat="server" Text="" Style="font-weight: 700; font-size: large;
            color: #0066FF;"></asp:Label>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style6">
                    &nbsp;
                </td>
                <td class="style1">
                    Industry
                </td>
                <td class="style4">
                    <asp:Label ID="IndustryLabel" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style6">
                    &nbsp;
                </td>
                <td class="style1">
                    Business Type
                </td>
                <td class="style4">
                    <asp:Label ID="BusinessLabel" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style6">
                    &nbsp;
                </td>
                <td class="style1">
                    &nbsp;
                </td>
                <td class="style4">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style6">
                    <asp:Label ID="PurposeResultLabel" runat="server" Text=""></asp:Label>
                </td>
                <td class="style1">
                    Purpose of credit facility วัตถุประสงค์
                </td>
                <td class="style4">
                    <asp:Label ID="PurposeLabel" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style7">
                    <asp:Label ID="TenorResultLabel" runat="server" Text=""></asp:Label>
                </td>
                <td class="style2">
                    Tenor ระยะเวลากู้
                </td>
                <td class="style5">
                    <asp:Label ID="TenorLabel" runat="server" Text=""></asp:Label>
                &nbsp;ปี</td>
            </tr>
            <tr>
                <td class="style8">
                    &nbsp;</td>
                <td class="style9">
                    &nbsp;</td>
                <td class="style10">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style6">
                    &nbsp;
                </td>
                <td class="style1">
                    &nbsp;
                </td>
                <td style="font-weight: 700" class="style4">
                    &nbsp;
                </td>
            </tr>
        </table>
    </div>
    <asp:GridView ID="CustomersGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="CIF"
        ShowFooter="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None"
        BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" HeaderStyle-CssClass=" ui-widget-header"
        EnableModelValidation="True">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="CIF" HeaderText="CIF" ReadOnly="true" />
            <asp:BoundField DataField="Name" HeaderText="Customer Name" ReadOnly="true" />
            <asp:BoundField DataField="CUSTOMER_TYPE_NAME" HeaderText="Customer Type" ReadOnly="true" />
            <asp:BoundField DataField="AGE" HeaderText="AGE" ReadOnly="true" />
           <asp:BoundField DataField="AGE_RESULT" HeaderText="AGE (RESULT)" ReadOnly="true" />
            <%--<asp:BoundField DataField="NATIONALITY_LIST_RESULT" HeaderText="Nationality" ReadOnly="true" />--%>
            <%--<asp:BoundField DataField="JURISTICT_LIST_RESULT" HeaderText="Juristict" ReadOnly="true" />--%>
            <asp:BoundField DataField="EXPERIENCE_RESULT" HeaderText="Experience" ReadOnly="true" />
           <%-- <asp:BoundField DataField="BLACKLIST_LIST_RESULT" HeaderText="Blacklist" ReadOnly="true" />--%>
           <%-- <asp:BoundField DataField="NCB_LIST_RESULT" HeaderText="NCB" ReadOnly="true" />--%>
           <%-- <asp:BoundField DataField="NCB_CODE_RESULT" HeaderText="NCB Code" ReadOnly="true" />--%>
           <%-- <asp:BoundField DataField="TDR_LIST_RESULT" HeaderText="TDR" ReadOnly="true" />--%>
         <%--   <asp:BoundField DataField="RATING_LIST_RESULT" HeaderText="Rating" ReadOnly="true" />--%>
          <%--  <asp:BoundField DataField="LEGAL_LIST_RESULT" HeaderText="Legal" ReadOnly="true" />--%>
            <asp:BoundField DataField="DPD_RESULT" HeaderText="DPD" ReadOnly="true" />

           </Columns>
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
    <p>
        A (Acceptable) , R (Reject) ,O (Out of scope), E (Escalate to >=VP)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;</p>
    <p style="text-align: center">
        <asp:Label ID="ConfirmLabe" runat="server" Text="" Style="font-weight: 700; font-size: large;
            color: #0066FF;"></asp:Label>
        <asp:Button ID="RejectButton" runat="server" Text="Reject Document" Width="200px" />
        &nbsp;<asp:Button ID="NextButton" runat="server" Text="Next To Template"  Width="200px"/>
    </p>
    </form>
</body>
</html>
