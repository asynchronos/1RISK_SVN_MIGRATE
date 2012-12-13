<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Industry.aspx.vb" Inherits="aspx_smes_Industry" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="js/jquery-ui-1.8.18/js/jquery-1.7.1.min.js" type="text/javascript"> </script>
    <%--    <script src="js/jquery-ui-1.8.18/js/jquery-ui-1.8.18.custom.min.js" type="text/javascript"> </script>
    <link href="js/jquery-ui-1.8.18/css/redmond/jquery-ui-1.8.18.custom.css" rel="stylesheet" type="text/css" />--%>
    <script src="js/common.js" type="text/javascript"></script>
    <script type="text/javascript">


        function returnValue(BUSINESS_ID, RESEARCH_CODE_4,
                    DESCRIPTION_4, Business_Category, Income_Factor,
                    AR, INV, AP, Net_Working_Capital_Days) {

            var ShowAll = getValueFromQueryString("ShowAll");
            if (ShowAll == 'True') {
                var BUSINESS_ID_TABLETextBox = getValueFromQueryString("BUSINESS_ID_TABLETextBox");
                var BUSINESS_CODE_TABLETextBox = getValueFromQueryString("BUSINESS_CODE_TABLETextBox");
                var BUSINESS_NAME_TABLETextBox = getValueFromQueryString("BUSINESS_NAME_TABLETextBox");
                var BUSINESS_GROUP_ID_TABLETextBox = getValueFromQueryString("BUSINESS_GROUP_ID_TABLETextBox");
                var BUSINESS_GROUP_TABLETextBox = getValueFromQueryString("BUSINESS_GROUP_TABLETextBox");
                var MARGIN_TABLETextBox = getValueFromQueryString("MARGIN_TABLETextBox");
                var DSCR_TABLETextBox = getValueFromQueryString("DSCR_TABLETextBox");
                var AP_TABLETextBox = getValueFromQueryString("AP_TABLETextBox");
                var AR_TABLETextBox = getValueFromQueryString("AR_TABLETextBox");
                var STOCK_TABLETextBox = getValueFromQueryString("STOCK_TABLETextBox");
                var LTV_TABLETextBox = getValueFromQueryString("LTV_TABLETextBox");
                var WORKING_CAPITAL_TABLETextBox = getValueFromQueryString("WORKING_CAPITAL_TABLETextBox");
                var RATE_TABLETextBox = getValueFromQueryString("RATE_TABLETextBox");
                var CONTRACT_TABLETextBox = getValueFromQueryString("CONTRACT_TABLETextBox");

                //window.parent.$("input[myId='" + _proCode + "']")[0].value = proCode;
                window.parent.$("#" + BUSINESS_ID_TABLETextBox)[0].value = BUSINESS_ID;
                window.parent.$("#" + BUSINESS_CODE_TABLETextBox)[0].value = RESEARCH_CODE_4;
                window.parent.$("#" + BUSINESS_NAME_TABLETextBox)[0].value = DESCRIPTION_4;
                window.parent.$("#" + BUSINESS_GROUP_ID_TABLETextBox)[0].value = '';
                window.parent.$("#" + BUSINESS_GROUP_TABLETextBox)[0].value = Business_Category;
                window.parent.$("#" + MARGIN_TABLETextBox)[0].value = Income_Factor;
                window.parent.$("#" + DSCR_TABLETextBox)[0].value = '';
                window.parent.$("#" + AP_TABLETextBox)[0].value = AP;
                window.parent.$("#" + AR_TABLETextBox)[0].value = AR;
                window.parent.$("#" + STOCK_TABLETextBox)[0].value = INV;
                window.parent.$("#" + LTV_TABLETextBox)[0].value = '';
                window.parent.$("#" + WORKING_CAPITAL_TABLETextBox)[0].value = Net_Working_Capital_Days;
                window.parent.$("#" + RATE_TABLETextBox)[0].value = '';
                window.parent.$("#" + CONTRACT_TABLETextBox)[0].value = '';

                window.parent.$("#" + BUSINESS_GROUP_ID_TABLETextBox).change();

            } else {

                var BUSINESS_ID_TABLETextBox = getValueFromQueryString("BUSINESS_ID_TABLETextBox");
                var BUSINESS_NAME_TABLETextBox = getValueFromQueryString("BUSINESS_NAME_TABLETextBox");
                window.parent.$("#" + BUSINESS_ID_TABLETextBox)[0].value = BUSINESS_ID;
                window.parent.$("#" + BUSINESS_NAME_TABLETextBox)[0].value = DESCRIPTION_4;

            }
            window.parent.$("#modalFrame").dialog("close");

            //    window.parent.changeVarFromTable(); // ทำ function ในหน้าที่เปิดด้วย

        }
      
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#searchTextBox').keyup(function () {
                searchTable($(this).val());
            });
        });

        function searchTable(inputVal) {
            var table = $('#BusinessGridView');
            table.find('tr').each(function (index, row) {
                var allCells = $(row).find('td');
                if (allCells.length > 0) {
                    var found = false;
                    allCells.each(function (index, td) {
                        var regExp = new RegExp(inputVal, 'i');
                        if (regExp.test($(td).text())) {
                            found = true;
                            return false;
                        }
                    });
                    if (found == true) $(row).show();
                    else $(row).hide();
                }
            });
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:DropDownList ID="DropDownListIndustryGroup" runat="server" DataSourceID="IndustryGroupDataSource"
            DataTextField="BUSINESS_CATEGORY_NAME" DataValueField="BUSINESS_CATEGORY" AutoPostBack="True">
        </asp:DropDownList>
        <asp:TextBox ID="searchTextBox" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="ค้นหา" />
        <asp:SqlDataSource runat="server" ID="IndustryGroupDataSource" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
            SelectCommand="SME_S.P_SS_INDUSTRY_GROUP_SELECT" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
    </div>
    <asp:SqlDataSource runat="server" ID="IndustrySqldatasource" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
        SelectCommandType="StoredProcedure" SelectCommand="[SME_S].[P_SS_INDUSTRY_SELECT]">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownListIndustryGroup" Name="Business_Category"
                PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="BusinessGridView" runat="server" EnableModelValidation="True" DataSourceID="IndustrySqldatasource"
        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"
        CellPadding="4" ForeColor="Black" GridLines="Vertical" AutoGenerateColumns="false"
        AllowSorting="true" Style="font-size: small">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:ImageButton ID="imgLocation" runat="server" ImageUrl="~/aspx/smes/images/qmv_bb_preview.gif"
                        ToolTip="เลือกลูกค้า" OnClientClick='<%# "returnValue("""+Eval("BUSINESS_ID").toString() + """,""" +Eval("RESEARCH_CODE_4").toString() + """,""" + Eval("DESCRIPTION_4").toString() + """,""" + Eval("Business_Category").toString() + ""","""  + Eval("Income_Factor").toString() + """,""" + Eval("AR").toString() + ""","""  + Eval("INV").toString() + """,""" + Eval("AP").toString() + """,""" + Eval("Net_Working_Capital_Days").toString()  +""") ; return false;" %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="BUSINESS_ID" HeaderText="Business ID" SortExpression="BUSINESS_ID" />
            <asp:BoundField DataField="RESEARCH_CODE_4" HeaderText="Business Code" ControlStyle-Width="300"
                SortExpression="RESEARCH_CODE_4" />
            <asp:BoundField DataField="DESCRIPTION_4" HeaderText="Description" SortExpression="DESCRIPTION_4" />
            <asp:BoundField DataField="Business_Category" HeaderText="Industry" SortExpression="Business_Category" />
        </Columns>
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
    </form>
</body>
</html>
