<%@ Page Language="VB" AutoEventWireup="false" CodeFile="financial_main.aspx.vb" Inherits="aspx_smes_financial_main" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<style>
        body {
            font-size: 10pt;
            font-family: Tahoma;
           background-image:url("../../images/gradient2.png");
           background-repeat:repeat-x;
          }
</style>
    <title></title>
</head>
<script type="text/javascript">
    function jsPop(jsURL, jsWindowNm, jsWidth, jsHeight) {
        var hdl;
        if (jsURL != "") {
            var jsoption = "scrollbars=yes,resizable=no,width=" + jsWidth + ",height=" + jsHeight;
            hdl = window.open(jsURL, jsWindowNm, jsoption);
        }
    }
</script>
<body>
    <form id="form1" runat="server">
    <asp:Label runat="server" Text="ข้อมูลประมาณการความสามารถในการก่อหนี้" 
        style="font-weight: 700"></asp:Label>
    <br />
    &nbsp;<asp:Label ID="Label1" runat="server" Text="ค้นหาข้อมูลจาก"></asp:Label>
    &nbsp;<asp:DropDownList ID="TypeSearchDropDownList" runat="server">
    </asp:DropDownList>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" Text="ค้นหา" />
&nbsp;
    <asp:HyperLink ID="HyperLink1" runat="server" 
        NavigateUrl="financial_data.aspx?mode=add"  Target="_parent"
        style="font-size: large; font-weight: 700">...เพิ่มข้อมูล...</asp:HyperLink>
    <div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
            SelectCommand="[SME_S].[P_SS_FINANCIAL_DATA_SELECT_ALL]" SelectCommandType="StoredProcedure">
          </asp:SqlDataSource>
    
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" DataSourceID="SqlDataSource1" 
            EnableModelValidation="True" AutoGenerateColumns="False" 
            DataKeyNames="SMES_ID" BackColor="White" BorderColor="#DEDFDE" 
            BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" 
            GridLines="Vertical">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="ลำดับ" InsertVisible="False" 
                    SortExpression="SMES_ID">
                       <ItemTemplate>
                               <a href = "#" title="click to view detail" onclick="return jsPop('financial_data.aspx?SMES_ID=<%# DataBinder.Eval (Container.DataItem,"SMES_ID")%>', 'win01', 700, 600);">
                              <%# DataBinder.Eval(Container.DataItem, "SMES_ID")%></a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="SMES_TYPE" HeaderText="SMES_TYPE" 
                    SortExpression="SMES_TYPE" />
                <asp:BoundField DataField="SMES_STATUS" HeaderText="SMES_STATUS" 
                    SortExpression="SMES_STATUS" />
                <asp:BoundField DataField="UPDATE_USER" HeaderText="UPDATE_USER" 
                    SortExpression="UPDATE_USER" />
                <asp:BoundField DataField="UPDATE_DATE" HeaderText="UPDATE_DATE" 
                    SortExpression="UPDATE_DATE" />
                <asp:BoundField DataField="SALES" HeaderText="SALES" SortExpression="SALES" />
                <asp:BoundField DataField="CREDIT_SALE" HeaderText="CREDIT_SALE" 
                    SortExpression="CREDIT_SALE" />
                <asp:BoundField DataField="CREDIT_TERM" HeaderText="CREDIT_TERM" 
                    SortExpression="CREDIT_TERM" />
            
         
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>
