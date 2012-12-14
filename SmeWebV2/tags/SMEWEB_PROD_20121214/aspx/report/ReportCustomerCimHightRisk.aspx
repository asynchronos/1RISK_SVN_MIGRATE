<%@ Page Language="VB" AutoEventWireup="false" 
MasterPageFile="~/MasterPage.master"
CodeFile="ReportCustomerCimHightRisk.aspx.vb" Inherits="aspx_report_ReportCustomerCimHightRisk" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
<style type="text/css">
 .paddingAdd 
 {
       padding:10px
  }
    .style1
    {
        font-size: small;
    }
</style>
    <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Center">
      <asp:DropDownList ID="FilterDropDownList" 
        runat="server" AutoPostBack="True">
      <asp:ListItem Text="CIF" Value="CIF"></asp:ListItem>
      <asp:ListItem Text="ALL" Value="ALL"></asp:ListItem>
     </asp:DropDownList>
    <asp:TextBox ID="CIFTextBox" runat="server"></asp:TextBox>
    <asp:Button ID="SearchButton" runat="server" Text="Search" />
        &nbsp;
   
    <table>
    <tr>
     <td align="left">
        <asp:Panel id="ExcellExport" runat="server" Visible="false" Width="600" HorizontalAlign="Left">  
        <asp:Label  runat="server" ID="ASOFLabel" style="font-weight: 700; color: #000099"></asp:Label> &nbsp;&nbsp;&nbsp;
           <asp:ImageButton ID="ImageButton1" runat="server" 
            ImageUrl="~/images/excell.jpg" style="height: 16px" Width="16px" />
           &nbsp;<span class="style1">&lt;-- Export to excell&nbsp;</span>
        </asp:Panel>
     </td>
     </tr>
     <tr>
     <td>
     <asp:GridView ID="CIFGridView" runat="server" AllowSorting="True"  HorizontalAlign="center"
        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None"  
        EnableModelValidation="True" ForeColor="Black"  CellSpacing="0"
        GridLines="Vertical" style="font-size: small; text-align: center;" 
        AutoGenerateColumns="False">
        <AlternatingRowStyle BackColor="White" />
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <Columns>
             <asp:BoundField DataField="FLAG" HeaderText="FLAG" SortExpression="FLAG"  ControlStyle-Width="150" HeaderStyle-Width="100" ><HeaderStyle Wrap="False" /><ItemStyle HorizontalAlign="Center" /></asp:BoundField>
             <asp:BoundField DataField="AMT" HeaderText="CHANGE FROM DAY BEFORE" SortExpression="AMT" ItemStyle-CssClass="paddingAdd" ControlStyle-Width="100"  HeaderStyle-Width="100"  ItemStyle-HorizontalAlign="Right"  DataFormatString="{0:n}"></asp:BoundField>
             <asp:BoundField DataField="CIF_NO" HeaderText="CIF" SortExpression="CIF_NO" HeaderStyle-Width="100" ItemStyle-HorizontalAlign="Right"  ItemStyle-CssClass="paddingAdd" ><HeaderStyle Wrap="False" /></asp:BoundField>
             <asp:BoundField DataField="NAME_E" HeaderText="NAME_E" SortExpression="NAME_E" ItemStyle-HorizontalAlign="Left"><HeaderStyle Wrap="False" /></asp:BoundField>
            <asp:BoundField DataField="APPL_ID" HeaderText="APPL ID" SortExpression="APPL_ID" HeaderStyle-Width="70" ><HeaderStyle Wrap="False" /></asp:BoundField>
            <asp:BoundField DataField="ACCT" HeaderText="ACCNO" SortExpression="APPL_ID" HeaderStyle-Width="70" ItemStyle-HorizontalAlign="Left" ItemStyle-CssClass="paddingAdd"  ><HeaderStyle Wrap="False" /></asp:BoundField>
            <asp:BoundField DataField="CONT" HeaderText="CONT" SortExpression="CONT" HeaderStyle-Width="70" ItemStyle-HorizontalAlign="Left" ItemStyle-CssClass="paddingAdd"><HeaderStyle Wrap="False" /></asp:BoundField>
            <asp:BoundField DataField="SEQ_NO" HeaderText="SEQ_NO" SortExpression="SEQ_NO" HeaderStyle-Width="70" ItemStyle-HorizontalAlign="Left"  ItemStyle-CssClass="paddingAdd"><HeaderStyle Wrap="False" /></asp:BoundField>
            <asp:BoundField DataField="ISSU_DATE" HeaderText="ISSUE DATE" SortExpression="ISSU_DATE" HeaderStyle-Width="70" ><HeaderStyle Wrap="False" /></asp:BoundField>
            <asp:BoundField DataField="LIMIT_VALUE_APP" HeaderText="LIMIT" SortExpression="LIMIT_VALUE_APP" HeaderStyle-Width="70" ItemStyle-HorizontalAlign="Right"  DataFormatString="{0:n}"><HeaderStyle Wrap="False" /></asp:BoundField>
             <asp:BoundField DataField="OUT_PRIN" HeaderText="PRINCIPAL" SortExpression="OUT_PRIN" HeaderStyle-Width="70" ItemStyle-HorizontalAlign="Right"  DataFormatString="{0:n}"><HeaderStyle Wrap="False" /></asp:BoundField>
            <asp:BoundField DataField="OUT_ACCRU" HeaderText="ACCRU" SortExpression="OUT_ACCRU" HeaderStyle-Width="70" ItemStyle-HorizontalAlign="Right"  DataFormatString="{0:n}"><HeaderStyle Wrap="False" /></asp:BoundField>
            <asp:BoundField DataField="ASOF_DATE"  HeaderText="ASOF_DATE" SortExpression="ASOF_DATE" HeaderStyle-Width="70" ItemStyle-HorizontalAlign="Right"  DataFormatString="{0:n}"><HeaderStyle Wrap="False" /></asp:BoundField>
        </Columns>

    </asp:GridView>
     </td>
    </tr>
    </table>
   </asp:Panel>

</asp:Content>