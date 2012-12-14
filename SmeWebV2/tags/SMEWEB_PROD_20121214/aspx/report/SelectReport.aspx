<%@ Page Title="Report" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false"
    CodeFile="SelectReport.aspx.vb" Inherits="aspx.report.SelectReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 263px;
        }
    </style>

    <script type="text/javascript">
        function popupReport() {
            var y = 0;
            var m = 0;
            var d = 0;

            var yR = 0;
            var mR = 0;
            var dR = 0;

            var g, r, ee, l, f;
            
            var chk_DateR = Ext.select('span[myclientid=Chk_DateR]').first().child('input').dom;
            var chk_Date = Ext.select('span[myclientid=Chk_Date]').first().child('input').dom;
            var chk_Notfin = Ext.select('span[myclientid=Chk_Notfin]').first().child('input').dom;

            var ddl_DayR = Ext.select('select[myclientid=DDL_DayR]').first().dom;
            var ddl_MonthR = Ext.select('select[myclientid=DDL_MonthR]').first().dom;
            var ddl_YearR = Ext.select('select[myclientid=DDL_YearR]').first().dom;

            var ddl_Day = Ext.select('select[myclientid=DDL_Day]').first().dom;
            var ddl_Month = Ext.select('select[myclientid=DDL_Month]').first().dom;
            var ddl_Year = Ext.select('select[myclientid=DDL_Year]').first().dom;

            var ddl_Level = Ext.select('select[myclientid=DDL_Level]').first().dom;
            var ddl_Group = Ext.select('select[myclientid=DDL_Group]').first().dom;

            var txt_Region = Ext.select('input[myclientid=Txt_Region]').first().dom;
            var txt_EmpId = Ext.select('input[myclientid=Txt_EmpId]').first().dom;

            if (!chk_DateR.checked && !chk_Date.checked && !chk_Notfin.checked) {
                alert("Please select date. (กรุณาเลือกวันที่ใดวันที่หนึ่ง)");
                return false;
            } else {
                if (chk_DateR.checked) {
                    dR = ddl_DayR.options[ddl_DayR.selectedIndex].value;
                    mR = ddl_MonthR.options[ddl_MonthR.selectedIndex].value;
                    yR = ddl_YearR.options[ddl_YearR.selectedIndex].value;
                } else if (chk_Date.checked) {
                    d = ddl_Day.options[ddl_Day.selectedIndex].value;
                    m = ddl_Month.options[ddl_Month.selectedIndex].value;
                    y = ddl_Year.options[ddl_Year.selectedIndex].value;
                }

                f = chk_Notfin.checked.toString();

                l = ddl_Level.options[ddl_Level.selectedIndex].value;
                g = ddl_Group.options[ddl_Group.selectedIndex].value;
                
                if (txt_Region.value.length < 1) {
                    r = "0";
                } else {
                    r = txt_Region.value;
                }

                if (txt_EmpId.value.length < 1) {
                    ee = "0";
                } else {
                    ee = txt_EmpId.value;
                }
                
                var param = "y=" + y + "&m=" + m + "&d=" + d + "&g=" + g + "&r=" + r + "&e=" + ee + "&l=" + l + "&f=" + f + "&yr=" + yR + "&mr=" + mR + "&dr=" + dR;

                // openPopup("pop", getReportUrl(), param, "width=800,height=600,resizable=yes,status=1,scrollbars=1");
             
                var reptype = getValueFromQueryString("Reptype");
                if (reptype == "cr") {
                     url = "ReportCreditByProduct.aspx";
                } else if (reptype == "crdt") {
                     url = "ReportCreditByCustomer.aspx"; 
                }
                window.open(url + '?' + param ,'pop', 'width=800, height=600,status=1,scrollbars=1');
                 return false;
            }
            
        }

        function getReportUrl() {
     
        
         
            var result = "http://" + location.host + location.pathname.substring(0, location.pathname.lastIndexOf("/") + 1);
        
            var reptype = getValueFromQueryString("Reptype");

            if (reptype == "cr") {
                result = result + "ReportCreditByProduct.aspx"
            } else if (reptype == "crdt") {
                result = result + "ReportCreditByCustomer.aspx"
            }

            return result;
        }
        
        
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div style="font-family: 'MS Sans Serif'; font-size: 10px; font-weight: normal">
        &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
            SelectCommand="ReportByCreditApproveSelectGroupRegionEmpLevel" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter Name="Year" QueryStringField="y" Type="Int32" DefaultValue="" />
                <asp:QueryStringParameter Name="Month" QueryStringField="m" Type="Int32" DefaultValue="" />
                <asp:QueryStringParameter Name="Day" QueryStringField="d" Type="Int32" DefaultValue="" />
                <asp:QueryStringParameter Name="YearR" QueryStringField="yr" Type="String" DefaultValue="" />
                <asp:QueryStringParameter Name="MonthR" QueryStringField="mr" Type="String" DefaultValue="" />
                <asp:QueryStringParameter Name="DayR" QueryStringField="dr" Type="String" DefaultValue="" />
                <asp:QueryStringParameter Name="Group" QueryStringField="g" Type="String" DefaultValue="" />
                <asp:QueryStringParameter Name="RegionID" QueryStringField="r" Type="String" DefaultValue="" />
                <asp:QueryStringParameter Name="EmpID" QueryStringField="e" Type="String" DefaultValue="" />
                <asp:QueryStringParameter Name="Level_id" QueryStringField="l" Type="String" DefaultValue="" />
                <asp:QueryStringParameter Name="NotFin" QueryStringField="f" Type="String" DefaultValue="" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="0">
        </asp:ScriptManager>
        &nbsp;&nbsp;<asp:Label ID="lblReport" runat="server" Text="รายงานสินเชื่อรายหนังสือ"
            Style="font-weight: 700; font-size: small; color: #000099;"></asp:Label>
        <br />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <table>
                    <tr>
                        <td class="style3" width="200">
                            <asp:CheckBox ID="CheckBoxDateR" runat="server" Text="เลือกวันที่ Register" AutoPostBack="True"
                                myclientid="Chk_DateR" />
                        </td>
                        <td class="style1" width="260">
                            <asp:DropDownList ID="DropDownListDayR" runat="server" Style="margin-left: 0px" myclientid="DDL_DayR">
                            </asp:DropDownList>
                            <asp:DropDownList ID="DropDownListMonthR" runat="server" myclientid="DDL_MonthR">
                            </asp:DropDownList>
                            <asp:DropDownList ID="DropDownListYearR" runat="server" myclientid="DDL_YearR">
                            </asp:DropDownList>
                        </td>
                        <td width="200">
                            <asp:CheckBox ID="CheckBoxSection" runat="server" Text="เลือกกลุ่มงาน" AutoPostBack="True" />
                        </td>
                        <td width="500">
                            <asp:Label ID="LabelSec" runat="server" Text="กลุ่มงาน"></asp:Label>
                            &nbsp;
                            <asp:DropDownList ID="DropDownListLevel" runat="server" myclientid="DDL_Level">
                            </asp:DropDownList>
                            &nbsp; &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            <asp:CheckBox ID="CheckBoxDate" runat="server" Text="เลือกวันที่สถานะหนังสือ" AutoPostBack="True"
                                myclientid="Chk_Date" />
                        </td>
                        <td class="style1">
                            <asp:DropDownList ID="DropDownListDay" runat="server" Style="margin-left: 0px" myclientid="DDL_Day">
                            </asp:DropDownList>
                            <asp:DropDownList ID="DropDownListMonth" runat="server" myclientid="DDL_Month">
                            </asp:DropDownList>
                            <asp:DropDownList ID="DropDownListYear" runat="server" myclientid="DDL_Year">
                            </asp:DropDownList>
                        </td>
                        <td class="style11">
                            &nbsp;
                        </td>
                        <td class="style2">
                            &nbsp;&nbsp;&nbsp;
                            <asp:Label ID="LabelRegion" runat="server" Text="ภาค&nbsp;"></asp:Label>
                            &nbsp;&nbsp;
                            <asp:TextBox ID="TextBoxRegion" runat="server" MaxLength="5" Width="52px" myclientid="Txt_Region"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="LabelEmp" runat="server" Text="รหัสพนักงาน"></asp:Label>
                            &nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="TextBoxEmpID" runat="server" MaxLength="6" Width="74px" myclientid="Txt_EmpId"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            <asp:CheckBox ID="CheckBoxNotfin" runat="server" Text="แสดงงานค้าง(ไม่ขึ้นกับวันที่)"
                                AutoPostBack="True" myclientid="Chk_Notfin" />
                        </td>
                        <td class="style1" width="260">
                            &nbsp;
                        </td>
                        <td class="style11">
                            <asp:CheckBox ID="CheckBoxGroup" runat="server" AutoPostBack="True" Text="เลือกกลุ่มสถานะ" />
                        </td>
                        <td class="style2">
                            <asp:Label ID="LabelGroup" runat="server" Text="สถานะ"></asp:Label>
                            &nbsp;&nbsp;&nbsp;
                            <asp:DropDownList ID="DropDownListGroup" runat="server" myclientid="DDL_Group">
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:Button ID="Button1" runat="server" Style="height: 26px" Text="VIEW" Height="17px"
            Width="50px" OnClientClick="return popupReport();" />
        &nbsp;<asp:Label ID="msg" runat="server" ForeColor="#990000"></asp:Label>
        &nbsp;&nbsp;
    </div>
</asp:Content>
