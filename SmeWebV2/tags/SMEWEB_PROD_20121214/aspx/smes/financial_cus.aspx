﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="financial_cus.aspx.vb" Inherits="smes_financial_cus" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="js/jquery-1.7.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui-1.8.18/js/jquery-ui-1.8.18.custom.min.js" type="text/javascript"></script>
<%--    <link href="js/jquery-ui-1.8.18/css/redmond/jquery-ui-1.8.18.custom.css" rel="stylesheet"    type="text/css" />--%>
        <%--    <link href="js/jquery-ui-1.8.18/css/sunny/jquery-ui-1.8.18.custom.css" rel="stylesheet"    type="text/css" />--%>
    <link href="js/jquery-ui-1.8.18/css/ui-lightness/jquery-ui-1.8.18.custom.css" rel="stylesheet"   type="text/css" />
    <script type="text/javascript">
        //  ฟังชั่นซ่อนแสดง ข้อมูล
        $(document).ready(function () {
            var userName;

            if (window.parent.document.getElementById("spanUserName")) {
                userName = window.parent.document.getElementById("spanUserName").innerText;
            } else {
                userName = 'test';
            }

            $("#USERTextBox").val(userName);

            $('#toggle-view #tableBusiness').hide();
            $('#toggle-view h3').click(function () {
                var text = $(this).parent().children('#tableBusiness');
                if (text.is(':hidden')) {
                    text.slideDown('200');
                    $(this).children('span').html('-');
                } else {
                    text.slideUp('200');
                    $(this).children('span').html('+');

                }
            });



            $("#BusinessImageButton").click(function () {
                //var popup = $find('mpeBehaviorEditProject');
                var myId = "PopUpIFrame";
                var url = "Business_Type.aspx";

                // Control ที่ส่งไปให้กับ Page ลูก เพื่อนำข้อมูลกลับมายังหน้าหลัก

                var param = "PopupModal=mpeBehaviorEditProject";
                // Parameter ที่ส่งไปให้กับ Page ลูก เพื่อนำข้อมูลกลับมายังหน้าหลัก 
                //***********************************************************************************************
                param = param + "&BUSINESS_ID_TABLETextBox=" + "BUSINESS_ID_TABLETextBox";
                param = param + "&BUSINESS_NAME_TABLETextBox=" + "BUSINESS_NAME_TABLETextBox";
                param = param + "&BUSINESS_GROUP_TABLETextBox=" + "BUSINESS_GROUP_TABLETextBox";
                param = param + "&MARGIN_TABLETextBox=" + "MARGIN_TABLETextBox";
                param = param + "&DSCR_TABLETextBox=" + "DSCR_TABLETextBox";
                param = param + "&AP_TABLETextBox=" + "AP_TABLETextBox";
                param = param + "&AR_TABLETextBox=" + "AR_TABLETextBox";
                param = param + "&STOCK_TABLETextBox=" + "STOCK_TABLETextBox";
                param = param + "&LTV_TABLETextBox=" + "LTV_TABLETextBox";
                param = param + "&WORKING_CAPITAL_TABLETextBox=" + "WORKING_CAPITAL_TABLETextBox";
                param = param + "&RATE_TABLETextBox=" + "RATE_TABLETextBox";
                param = param + "&CONTRACT_TABLETextBox=" + "CONTRACT_TABLETextBox";

                changeIframeSrcById(myId
                , url
                , param
            );

                $("#modalFrame").dialog("open");
            });

            sizeFrame();

            $("#SMES_IDTextBox,#numCustomer,#REF_IDTextBox,#USERTextBox").focus(function () {
                $(this).blur();
            });
            $("#BUSINESS_ID_TABLETextBox,#BUSINESS_NAME_TABLETextBox,#BUSINESS_GROUP_TABLETextBox,#MARGIN_TABLETextBox").focus(function () {
                $(this).blur();
            });
            $("#DSCR_TABLETextBox,#AP_TABLETextBox,#AR_TABLETextBox,#STOCK_TABLETextBox").focus(function () {
                 $(this).blur();
            });
            $("#LTV_TABLETextBox,#WORKING_CAPITAL_TABLETextBox,#RATE_TABLETextBox,#CONTRACT_TABLETextBox").focus(function () {
                 $(this).blur();
            });
      
        });


    </script>
    <script type="text/javascript">
        function sizeFrame() {
            //   $("#iframeBlackList", top.document).css({ height: 0 });   
            // กำหนดความสูงของ iframe ให้เท่ากับ 0
            var heightDiv = $(document).height();
            //        alert(heightDiv);
            //        alert($("#mainFrame", parent.document).height());
            ////        $("#mainFrame", parent.document).height(heightDiv - 100);
            //        alert($("#mainFrame", parent.document).height());

            $("#mainFrame", parent.document).height(600);  // กำหนด

            //        var mHight = $("#iframeReportDetail", parent.parent.document).height();
            //        var bHight = $("#iframeBlackList", parent.document).height();
            //        $("#iframeReportDetail", parent.parent.document).height(mHight + bHight);
            //        // กำหนดความสูงของ iframe ให้เท่ากับความสูงของ pagecontent.html   
        }
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
        function changeCustomer(SMES_ID) {
            top.frames['mainFrame'].location = "financial_cus.aspx?SMES_ID=" + SMES_ID;
        }
        function changeURLtoRM(SMES_ID) {
            top.frames['mainFrame'].location = "financial_data.aspx?insertCustomerComplete=true&SMES_TYPE=1&SMES_ID=" + SMES_ID;
        }
    </script>
    <script type="text/javascript">
        $(function () {
            $("#modalFrame").dialog({
                height: 400,
                width: 800,
                title: 'กรุณาเลือก Business',
                position: [100, 50],
                modal: true,
                autoOpen: false
            });
        });
    </script>
    <script type="text/javascript">
        $(function () {
            $("input[type=submit]").button();

            $("#dialog").dialog({
                autoOpen: false,
                show: "blind",
                hide: "blind",
                position: [300, 100],
                modal: "true",
                buttons: {
                    Ok: function () {
                        $(this).dialog("close");
                    }
                }
            });
        });
        function showErrorDialog(t) {
            $("#dialog .msg").text(t)
			  .addClass("ui-state-error");
            $("#dialog").dialog("open");
            $("#dialog").dialog("option", "title", 'Please input complete data.');

        }
        function showDialog(t) {
            $("#dialog").dialog("open");
            $("#dialog .msg").text(t)
			  .addClass("ui-state-highlight");
            $("#dialog").dialog("option", "title", t);

        }


        function checkNull(o, n) {
            if (o.val()=="") {
                o.addClass("ui-state-error");
                showErrorDialog("กรุณาระบุ" + n);
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
        function showDialog(t) {
            $("#dialog").dialog("open");
            $("#dialog .msg").text(t)
			  .addClass("ui-state-highlight");
            $("#dialog").dialog("option", "title", t);

        }

        function checkValidAll() {
            var bValid = true;
            bValid = bValid && checkNull($("#BUSINESS_ID_TABLETextBox"), "ประเภทธุรกิจ");
             if ($("#numCustomer").val() < 1) {
                bValid = false;
                showErrorDialog("กรุณาระบุข้อมูล Customer ");
            }
            if (bValid) {
                return true;
            } else {
                return false;
            }

        }
    </script>
    <style type="text/css">
        body
        {
            font-size: smaller;
            font-family: arial;
            background-image: url("images/gradient2.png");
            background-repeat: repeat-x;
        }
        #toggle-view
        {
            list-style: none;
            margin: 0;
            padding: 0;
            width: 800px;
        }
        #toggle-view li
        {
            margin: 10px;
            border-bottom: 1px solid #ccc;
            position: relative;
            cursor: pointer;
        }
        #toggle-view h3
        {
            margin: 0;
            font-size: 14px;
        }
        #toggle-view span
        {
            position: absolute;
            right: 5px;
            top: 0;
            color: #ccc;
            font-size: 13px;
        }
        #toggle-view p
        {
            margin: 5px 0;
            display: none;
        }
    </style>
    <link href="css/AjaxControlStyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="dialog" title="">
        <p class="msg">
        </p>
    </div>
    <div id="header">
        <h4>
            <asp:Label ID="labelHead" runat="server" Text="Customer data" Style="font-weight: 700;
                color: #0000FF"></asp:Label>
        </h4>
    </div>
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptLocalization="true"
        EnableScriptGlobalization="true" EnablePageMethods="true">
    </asp:ScriptManager>
    <div>
        SMES_ID:<asp:TextBox ID="SMES_IDTextBox" runat="server" MaxLength="10" Width="30"></asp:TextBox>
        &nbsp;REF:&nbsp;<asp:TextBox ID="REF_IDTextBox" ToolTip="ref_id" runat="server" Width="100" />
        &nbsp;User:<asp:TextBox ID="USERTextBox" ToolTip="ref_id" runat="server" Width="100" />
    </div>
    <table>
        <tr>
            <td>
                <asp:UpdateProgress runat="server" ID="PageUpdateProgress">
                    <ProgressTemplate>
                        <img src="images/loading_animation.gif" alt="" />
                        Loading...</ProgressTemplate>
                </asp:UpdateProgress>
                <asp:UpdatePanel ID="UpdatePanelGrid" runat="server">
                    <ContentTemplate>
                        ระบุลูกค้าในรายการด้านล่างนี้ (<asp:TextBox runat="server" ID="numCustomer" 
                            BorderStyle="None" Width="20" ></asp:TextBox>)
                        <asp:GridView ID="CustomersGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="CIF"
                            ShowFooter="True" OnRowEditing="CustomerGridEditCommand" OnRowDeleting="CustomerGridDeleteCommand"
                            OnRowUpdating="CustomerGridUpdateCommand" OnRowCancelingEdit="CustomerGridCancelCommand"
                            OnRowCommand="CustomerGridRowCommand" BackColor="White" BorderColor="#DEDFDE"
                            BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical"
                            HeaderStyle-CssClass=" ui-widget-header"
                            EnableModelValidation="True">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField HeaderText="Select">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="BtnEdit" runat="server" CommandName="Edit" ToolTip="Edit item"
                                            ImageUrl="~/smes/images/qmv_bb_preview.gif" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:ImageButton ID="ImageButton1" runat="server" CommandName="Update" ImageUrl="~/smes/images/qmv_bb_add.gif"
                                            ToolTip="Save item" />
                                        <asp:ImageButton ID="ImageButton2" runat="server" CommandName="Cancel" ImageUrl="~/smes/images/qmv_r_button_undo_hover.gif"
                                            ToolTip="Cancel item" />
                                        <asp:ImageButton ID="BtnDelete" runat="server" CommandName="Delete" ImageUrl="~/smes/images/qmv_bb_delete.gif"
                                            ToolTip="Delete item" />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:ImageButton ID="InsertImageButton" runat="server" CommandName="Insert" ImageUrl="~/smes/images/qmv_bb_add.gif"
                                            ToolTip="Save item" />
                                        <asp:ImageButton ID="CancelImageButton" runat="server" CommandName="Cancel" ImageUrl="~/smes/images/qmv_r_button_undo_hover.gif"
                                            ToolTip="Cancel item" />
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="CIF">
                                    <ItemTemplate>
                                        <%# Eval("CIF")%>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" ID="CIFTextBox" Text='<%# Bind("CIF") %>' Width="100px"
                                             />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox runat="server" ID="CIFTextBox" Text='<%# Bind("CIF") %>' Width="100px" />
                                        <asp:ImageButton ID="CustomerSearchImageButton" runat="server" BorderColor="#CCCCCC"
                                            CommandName="SearchCIFInsert" ImageUrl="~/smes/images/Magnifying Glass.gif" />
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Customer Name" HeaderStyle-Width="200">
                                    <ItemTemplate>
                                        <%# Eval("Name")%>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:Label runat="server" ID="CIFNameLabel" Text='<%# Bind("Name") %>' />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label runat="server" ID="CIFNameLabel" Text='<%# Bind("Name") %>' />
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Business Code">
                                    <ItemTemplate>
                                        <%# Eval("BusinessCode")%>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" ID="BusinessCodeTextBox" Text='<%# Bind("BusinessCode") %>'
                                            Width="100px" />
                                        <asp:Image ID="BusinessCodePopup" runat="server" BorderColor="#CCCCCC" BorderStyle="Inset"
                                            ImageUrl="~/smes/images/Update.gif" />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox runat="server" ID="BusinessCodeTextBox" Text='<%# Bind("BusinessCode") %>'
                                            Width="100px" />
                                        <asp:Image ID="BusinessCodePopup" runat="server" ImageUrl="~/smes/images/Update.gif" />
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Business Name" HeaderStyle-Width="200">
                                    <ItemTemplate>
                                        <%# Eval("BusinessName")%>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" ID="BusinessNameTextBox" Text='<%# Bind("BusinessName") %>' />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox runat="server" ID="BusinessNameTextBox" Text='<%# Bind("BusinessName") %>' />
                                    </FooterTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataTemplate>
                                <asp:TextBox runat="server" ID="NoDataFirstName" />
                                <asp:TextBox runat="server" ID="NoDataLastName" />
                                <asp:Button runat="server" ID="NoDataInsert" CommandName="NoDataInsert" Text="Insert" />
                            </EmptyDataTemplate>
                            <FooterStyle BackColor="#CCCC99" />
                            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                            <RowStyle BackColor="#F7F7DE" />
                            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
    <br />
    <div id="divTable">
        <ul id="toggle-view">
            <li>
                <h3>
                    เลือกประเภทธุรกิจ
                </h3>
                <span>+</span> ประเภทธุรกิจ &nbsp<asp:TextBox ID="BUSINESS_ID_TABLETextBox" ToolTip="รหัสธุรกิจ"
                    runat="server" Width="100" />
                <asp:Image ID="BusinessImageButton" runat="server" ImageUrl="~/smes/images/Update.gif"
                    Style="height: 16px" />
                <asp:TextBox ID="BUSINESS_NAME_TABLETextBox" ToolTip="ประเภทธุรกิจ" runat="server"
                    Width="250"  />
                กลุ่มธุรกิจ&nbsp;
                <asp:TextBox ID="BUSINESS_GROUP_TABLETextBox" ToolTip="กลุ่มธุรกิจ" runat="server" 
                    Width="200" />
                <table id="tableBusiness" style="width: 100%;">
                    <tr>
                        <td>
                            Margin Table
                        </td>
                        <td>
                            <asp:TextBox ID="MARGIN_TABLETextBox" runat="server" ToolTip="Default margin" CELL='MARGIN_TABLE'  />
                        </td>
                        <td>
                            DSCR Table
                        </td>
                        <td>
                            <asp:TextBox ID="DSCR_TABLETextBox" runat="server" ToolTip="DSCR" CELL="DSCR_TABLE"  />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            AP Table
                        </td>
                        <td>
                            <asp:TextBox ID="AP_TABLETextBox" runat="server" ToolTip="AP" CELL="AP_TABLE"  />
                        </td>
                        <td>
                            AR Table
                        </td>
                        <td>
                            <asp:TextBox ID="AR_TABLETextBox" runat="server" ToolTip="Credit Term" CELL="AR_TABLE"  />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Inventory Visit Table
                        </td>
                        <td>
                            <asp:TextBox ID="STOCK_TABLETextBox" runat="server" ToolTip="ยอดขาย" CELL="STOCK_TABLE"  />
                        </td>
                        <td>
                            &nbsp;LTV Table
                        </td>
                        <td>
                            <asp:TextBox ID="LTV_TABLETextBox" runat="server" ToolTip="LTV" CELL="LTV_TABLE"  />
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
                            <asp:TextBox ID="RATE_TABLETextBox" runat="server" ToolTip="Rate" CELL="RATE_TABLE"  />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Contract Table
                        </td>
                        <td>
                            <asp:TextBox ID="CONTRACT_TABLETextBox" runat="server" ToolTip="Contract" CELL="CONTRACT_TABLE"  />
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </li>
        </ul>
    </div>
    <asp:Button ID="InsertButton" runat="server" Text="Insert New Data" OnClientClick="return checkValidAll()"
        Height="30px" Width="200px" />&nbsp
    <asp:Button ID="UpdateButton" runat="server" Text="Update Data" OnClientClick="return checkValidAll()"
        Height="30px" Width="200px" />
    <div id="modalFrame">
        <iframe id="PopUpIFrame" width="100%" height="100%" frameborder="0"></iframe>
    </div>
    </form>
</body>
</html>
