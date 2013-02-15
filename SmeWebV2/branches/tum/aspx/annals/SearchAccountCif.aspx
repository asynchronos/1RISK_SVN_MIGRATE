<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SearchAccountCif.aspx.vb" Inherits="aspx_annals_SearchAccountCif" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link href="../../css/StyleSheet.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../js/common.js"></script>
    <script type="text/javascript">
    function searchDropDownIndexByText(domObj,value) {
        var result = -1 ;
      for (var i =0;i<domObj.length;i++){
        if (domObj.options[i].text == value){
            result = i;
            break;
        } 
      }
           return result
    }
  
    </script>
</head>
<body leftmargin=0 topmargin=0>
    <form id="form1" runat="server">
        <asp:Label ID="Label1" runat="server" Text="Select Account"></asp:Label><br />
        <asp:GridView ID="DailyGridView" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="2"
            DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" HorizontalAlign="Left" CellSpacing="1" PageSize="5">
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="ACCNO" HeaderText="เลขที่บัญชี" HtmlEncode="False" SortExpression="ACCNO" />
                <asp:BoundField DataField="NBRTHAI" HeaderText="สาขา" HtmlEncode="False" SortExpression="NBRTHAI" />
                <asp:BoundField DataField="DECB_RD" HeaderText="ตัวย่อ" HtmlEncode="False" SortExpression="DECB_RD">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="SUMLIMIT" DataFormatString="{0:#,0.00}" HeaderText="วงเงิน"
                    HtmlEncode="False" ReadOnly="True" SortExpression="SUMLIMIT">
                    <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="SUMPRIN" DataFormatString="{0:#,0.00}" HeaderText="เงินต้น"
                    HtmlEncode="False" ReadOnly="True" SortExpression="SUMPRIN">
                    <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="SUMACCRU" DataFormatString="{0:#,0.00}" HeaderText="ดอกเบี้ยค้าง"
                    HtmlEncode="False" ReadOnly="True" SortExpression="SUMACCRU">
                    <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="SUMSUSP" DataFormatString="{0:#,0.00}" HeaderText="ดอกเบี้ยพัก"
                    HtmlEncode="False" ReadOnly="True" SortExpression="SUMSUSP">
                    <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="MAXAGING" DataFormatString="{0:#,0.00}" HeaderText="อายุหนี้"
                    HtmlEncode="False" ReadOnly="True" SortExpression="MAXAGING">
                    <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
            </Columns>
            <SelectedRowStyle BackColor="#E2DED6" ForeColor="#333333" Font-Bold="True" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <EditRowStyle BackColor="#999999" />
        </asp:GridView>
        &nbsp;
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
            SelectCommand="SELECT Detail_ByAcc.ACCNO, Detail_ByAcc.Branch, TBM_CAT002.NBRTHAI, CIMfms.DECB_RD, MAX(Detail_ByAcc.Limit) AS SUMLIMIT, SUM(Detail_ByAcc.Principal) AS SUMPRIN, SUM(Detail_ByAcc.Accru) AS SUMACCRU, SUM(Detail_ByAcc.Susp) AS SUMSUSP, MAX(Detail_ByAcc.AGING) AS MAXAGING, SUM(Detail_ByAcc.PAY_PRIN) AS SUMPAY_PRIN, SUM(Detail_ByAcc.PAY_INT) AS SUMPAY_INT, SUM(Detail_ByAcc.PAY_SUSP) AS SUMPAY_SUSP FROM Detail_ByAcc LEFT OUTER JOIN TBM_CAT002 ON Detail_ByAcc.Branch = TBM_CAT002.IBRNO LEFT OUTER JOIN CIMfms ON Detail_ByAcc.AccGL = CIMfms.ACCGL WHERE (Detail_ByAcc.CIF = @CIF) GROUP BY Detail_ByAcc.ACCNO, Detail_ByAcc.Branch, TBM_CAT002.NBRTHAI, CIMfms.DECB_RD">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="0" Name="CIF" QueryStringField="cif" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
