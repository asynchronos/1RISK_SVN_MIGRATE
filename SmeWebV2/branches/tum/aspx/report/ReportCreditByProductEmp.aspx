<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ReportCreditByProductEmp.aspx.vb" Inherits="aspx_report_ReportCreditByProductEmp" %>


<%@ Register Src="~/HeaderControl/HeaderControl.ascx" TagName="HeaderControl" TagPrefix="uc1" %>
<%@ Register Src="~/HeaderControl/HeadTagControl.ascx" TagName="HeadTagControl"
    TagPrefix="uc2" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ตัวอย่างรายงาน </title>
     <uc2:HeadTagControl ID="HeadTagControl1" runat="server" />
</head>
<body>
    <form id="form1" runat="server" >
    <uc1:HeaderControl ID="HeaderControl1" runat="server" />
 
    <div style="font-family: 'MS Sans Serif'; font-size: 10px; font-weight: normal">
    
        ตัวอย่างรายงาน&nbsp;</div>
&nbsp;&nbsp;&nbsp;&nbsp;วันที่&nbsp;
    <asp:DropDownList ID="DropDownListDay" runat="server">
    </asp:DropDownList>
    /
    <asp:DropDownList ID="DropDownListMonth" runat="server">
    </asp:DropDownList>
    /
    <asp:DropDownList ID="DropDownListYear" runat="server">
    </asp:DropDownList>
&nbsp;
    <asp:Button ID="Button1" runat="server" style="height: 26px" Text="VIEW" 
        Height="17px" Width="50px" />
    &nbsp;
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
        SelectCommand="ReportByCreditApproveGroupByEmp" 
        SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter Name="Year" QueryStringField="y" Type="Int32" />
            <asp:QueryStringParameter Name="Month" QueryStringField="m" Type="Int32" />
            <asp:QueryStringParameter Name="Day" QueryStringField="d" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" DataSourceID="SqlDataSource1" ShowFooter="True" 
        ForeColor="Black" GridLines="Vertical">
        <FooterStyle BackColor="#CCCC99" />
        <RowStyle BackColor="#F7F7DE" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="EMP-ID" HeaderText="EMP-ID" 
                SortExpression="EMP-ID" />
            <asp:BoundField DataField="EMPLOYEE" HeaderText="EMPLOYEE"  ItemStyle-Wrap="false"
                SortExpression="EMPLOYEE" >
<ItemStyle Wrap="False"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="NEW" HeaderText="NEW" ReadOnly="True" 
                SortExpression="NEW" />
            <asp:BoundField DataField="OLD" HeaderText="OLD" ReadOnly="True" 
                SortExpression="OLD" />
            <asp:BoundField DataField="REVIEW" HeaderText="REVIEW" ReadOnly="True" 
                SortExpression="REVIEW" />
            <asp:BoundField DataField="EXCEPTION" HeaderText="EXCEPTION" ReadOnly="True" 
                SortExpression="EXCEPTION" />
            <asp:BoundField DataField="O-D" HeaderText="O-D"  DataFormatString="{0:#,###0}"  ReadOnly="True" 
                SortExpression="O-D" />
            <asp:BoundField DataField="(O-D)" HeaderText="(O-D)"  DataFormatString="{0:#,###0}" ReadOnly="True" 
                SortExpression="(O-D)" />
            <asp:BoundField DataField="F-L" HeaderText="F-L"  DataFormatString="{0:#,###0}"  ReadOnly="True" 
                SortExpression="F-L" />
            <asp:BoundField DataField="(F-L)" HeaderText="(F-L)" DataFormatString="{0:#,###0}"  ReadOnly="True" 
                SortExpression="(F-L)" />
            <asp:BoundField DataField="L-G" HeaderText="L-G" DataFormatString="{0:#,###0}"  ReadOnly="True" 
                SortExpression="L-G" />
            <asp:BoundField DataField="(L-G)" HeaderText="(L-G)" DataFormatString="{0:#,###0}" ReadOnly="True" 
                SortExpression="(L-G)" />
            <asp:BoundField DataField="STL-PN" HeaderText="STL-PN" DataFormatString="{0:#,###0}" ReadOnly="True" 
                SortExpression="STL-PN" />
            <asp:BoundField DataField="(STL-PN)" HeaderText="(STL-PN)" DataFormatString="{0:#,###0}"  ReadOnly="True" 
                SortExpression="(STL-PN)" />
            <asp:BoundField DataField="TRADE-FIN" HeaderText="TRADE-FIN" DataFormatString="{0:#,###0}"  ReadOnly="True" 
                SortExpression="TRADE-FIN" />
            <asp:BoundField DataField="(TRADE-FIN)" HeaderText="(TRADE-FIN)" DataFormatString="{0:#,###0}" 
                ReadOnly="True" SortExpression="(TRADE-FIN)" />
            <asp:BoundField DataField="OTHERS" HeaderText="OTHERS" DataFormatString="{0:#,###0}" ReadOnly="True" 
                SortExpression="OTHERS" />
            <asp:BoundField DataField="(OTHERS)" HeaderText="(OTHERS)" DataFormatString="{0:#,###0}" ReadOnly="True" 
                SortExpression="(OTHERS)" />
        </Columns>
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    </form>
</body>
</html>
