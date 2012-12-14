<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ThProvince.aspx.vb" Inherits="aspx_common_ThProvince" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../../js/jquery.js" type="text/javascript"></script>
    <script src="../../js/common.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#DropDownListSubDistrict").change(function () {
                // alert($(this).val());
                var sd = $("#DropDownListSubDistrict  option:selected");
                var d = $("#DropDownListDistrict  option:selected");
                var p = $("#DropDownListProvince  option:selected");
                var locationName;
                if (p.val() == '10') {
                     locationName = 'แขวง' + sd.text() + ' เขต' + d.text() + ' ' + p.text();
                } else {
                     locationName = 'ต.' + sd.text() + ' อ.' + d.text() + ' จ.' + p.text();
                }
                ReturnValue(sd.val(), locationName);
            });
        });
        function ReturnValue(subDistrictID,locationName) {
            var control1 = getValueFromQueryString("control1");
            var control2 = getValueFromQueryString("control2");
            // window.parent.$("#" + control)[0].value = subDistrictID;
            // var control = window.opener.jQuery("#" + getValueFromQueryString("control"));
            //alert(control);
            //            $("input[myid*='" + control + "']").each(function (index) {
            //               alert($(this).val());
            //            });
           // var el = window.opener.$("input[myid*='" + control + "']");
            $("input[myid*='" + control1 + "']", window.opener.document).val(subDistrictID);
            $("input[myid*='" + control2 + "']", window.opener.document).val(locationName);

            window.close();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>จังหวัด:<asp:DropDownList ID="DropDownListProvince" runat="server" DataSourceID="SqlDataSourceProvince"
            DataTextField="PROVINCE_NAME" DataValueField="PROVINCE_ID" AutoPostBack="True">
            <asp:ListItem Text="...โปรดเลือก..." Value=""></asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSourceProvince" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
            SelectCommand="SELECT [PROVINCE_ID], [PROVINCE_NAME], [PROVINCE_ID_FLOOD] FROM [TB_TH_PROVINCE]">
        </asp:SqlDataSource>
        เขต/อำเภอ:<asp:DropDownList ID="DropDownListDistrict" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceDistrict"
            DataTextField="DISTRICT_NAME" DataValueField="DISTRICT_ID">
            <asp:ListItem Text="...โปรดเลือก..." Value=""></asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSourceDistrict" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
            SelectCommand="SELECT [DISTRICT_ID], [DISTRICT_NAME], [PROVINCE_ID] FROM [TB_TH_DISTRICT] WHERE ([PROVINCE_ID] = @PROVINCE_ID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownListProvince" Name="PROVINCE_ID" PropertyName="SelectedValue"
                    Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        แขวง/ตำบล:
        <asp:DropDownList ID="DropDownListSubDistrict" runat="server" DataSourceID="SqlDataSourceSubDistrict"
            DataTextField="SUB_DISTRICT_NAME" DataValueField="SUB_DISTRICT_ID">
            <asp:ListItem Text="...โปรดเลือก..." Value=""></asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSourceSubDistrict" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
            SelectCommand="SELECT [SUB_DISTRICT_ID], [SUB_DISTRICT_NAME], [SUB_DISTRICT_ID_FLOOD], [DISTRICT_ID] FROM [TB_TH_SUB_DISTRICT] WHERE ([DISTRICT_ID] = @DISTRICT_ID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownListDistrict" Name="DISTRICT_ID" PropertyName="SelectedValue"
                    Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
    </div>
    </form>
</body>
</html>
