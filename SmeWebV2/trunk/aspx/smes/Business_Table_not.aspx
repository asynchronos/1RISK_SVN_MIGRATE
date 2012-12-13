<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Business_Table.aspx.vb"
    Inherits="aspx_smes_Business_Table" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="js/common.js" type="text/javascript"></script>
    <script type="text/javascript">

        function returnValue(BUSINESS_ID,BUSINESS_NAME
                                     ,BUSINESS_GROUP_ID,BUSINESS_GROUP_NAME, MARGIN
                                     , DSCR, AP, AR, STOCK
                                     , LTV, WORKING_CAPITAL
                                     , RATE, CONTRACT) {

            var BUSINESS_ID_TABLETextBox = getValueFromQueryString("BUSINESS_ID_TABLETextBox");
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
            window.parent.$("#" + BUSINESS_NAME_TABLETextBox)[0].value = BUSINESS_NAME;
            window.parent.$("#" + BUSINESS_GROUP_ID_TABLETextBox)[0].value = BUSINESS_GROUP_ID;
            window.parent.$("#" + BUSINESS_GROUP_TABLETextBox)[0].value = BUSINESS_GROUP_NAME;
            window.parent.$("#" + MARGIN_TABLETextBox)[0].value = MARGIN;
            window.parent.$("#" + DSCR_TABLETextBox)[0].value = DSCR;
            window.parent.$("#" + AP_TABLETextBox)[0].value = AP;
            window.parent.$("#" + AR_TABLETextBox)[0].value = AR;
            window.parent.$("#" + STOCK_TABLETextBox)[0].value = STOCK;
            window.parent.$("#" + LTV_TABLETextBox)[0].value = LTV;
            window.parent.$("#" + WORKING_CAPITAL_TABLETextBox)[0].value = WORKING_CAPITAL;
            window.parent.$("#" + RATE_TABLETextBox)[0].value = RATE;
            window.parent.$("#" + CONTRACT_TABLETextBox)[0].value = CONTRACT;

            window.parent.$find('MPE').hide();
        //    window.parent.changeVarFromTable(); // ทำ function ในหน้าที่เปิดด้วย

            window.parent.$("#" + BUSINESS_GROUP_ID_TABLETextBox).change();
        }
      
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:DropDownList ID="DropDownListBusinessGroup" runat="server" 
            DataSourceID="BusinessGroupSqldatasource" 
            DataTextField="BUSINESS_GROUP_NAME"  
            DataValueField="BUSINESS_GROUP_ID" AutoPostBack="True">
        </asp:DropDownList>
        <asp:Button ID="Button1" runat="server" Text="ค้นหา" />
    </div>
    <asp:SqlDataSource runat="server" ID="BusinessGroupSqldatasource" 
        ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
        SelectCommandType="StoredProcedure" 
        SelectCommand="[SME_S].[P_SS_BUSINESS_GROUP_SELECT]"></asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ID="BusinessTypeSqldatasource" 
      ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
       SelectCommandType="StoredProcedure" 
        SelectCommand="[SME_S].[P_SS_BUSINESS_TYPE_SELECT_GROUP]">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownListBusinessGroup" 
                Name="BUSINESS_GROUP_ID" PropertyName="SelectedValue" Type="Int16" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView runat="server" EnableModelValidation="True" DataSourceID="BusinessTypeSqldatasource"
        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"
        CellPadding="4" ForeColor="Black" GridLines="Vertical" 
        style="font-size: small">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:ImageButton ID="imgLocation" runat="server" ImageUrl="~/smes/images/qmv_bb_preview.gif"
                        ToolTip="เลือกลูกค้า" 
                        OnClientClick='<%# "returnValue("""+Eval("BUSINESS_ID").toString() + """,""" + Eval("BUSINESS_NAME").toString() +""","""+Eval("BUSINESS_GROUP_ID").toString() +""","""+Eval("BUSINESS_GROUP_NAME").toString()+ """,""" + Eval("MARGIN").toString() + """,""" + Eval("DSCR").toString() + ""","""  + Eval("AP").toString() + """,""" + Eval("AR").toString() + """,""" + Eval("STOCK").toString() + """,""" + Eval("LTV").toString() + """,""" + Eval("WORKING_CAPITAL").toString() + """,""" + Eval("RATE").toString() + """,""" + Eval("CONTRACT").toString() +""") ; return false;" %>' />
                </ItemTemplate>
            </asp:TemplateField>
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
