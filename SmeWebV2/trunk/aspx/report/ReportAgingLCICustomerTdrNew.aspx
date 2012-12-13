<%@ Page Language="VB" AutoEventWireup="false"  MasterPageFile="~/MasterPage.master" CodeFile="ReportAgingLCICustomerTdrNew.aspx.vb" Inherits="aspx_report_ReportAgingLCICustomerTdrNew" %>
<%@ Register Src="~/Controls/ControllingTree/ControllingTree.ascx" TagName="ControllingTree"
    TagPrefix="uc4" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 465px;
        }
        .style2
        {
            width: 202px;
        }
        .style3
        {
            width: 203px;
        }
        .style4
        {
            width: 212px;
        }
        .style5
        {
            width: 217px;
        }
        .style6
        {
            width: 348px;
        }
        
        div[clientselector] 
        {
             font-size:smaller;
         }
    </style>
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <asp:sqldatasource runat="server" ID="SqlDataSource1" 
        ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
      >
  
    </asp:sqldatasource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
        SelectCommand="SELECT top 1 ETL_ASOFDATE as 'DASOF'  FROM [BAY01].[dbo].[TEMP_MAX_AGING_EDW]">
    </asp:SqlDataSource>
    <table>
        <tr valign="top">
            <td style="font-size: small">
                <uc4:ControllingTree ID="ControllingTree1" runat="server" />
                <asp:HiddenField ID="Hidd_TreeSelectedValue" runat="server" />
                <asp:HiddenField ID="Hidd_TreeSelectedValueType" runat="server" />
                <asp:HiddenField ID="Hidd_TreeSelectedEmpIds" runat="server" />
            </td>
    <td>
    <table style="font-size:x-small">
        <tr>
            <td class="style1">
    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="14pt" 
        Text="แสดงข้อมูลลูกค้า sme ที่มี AGING"></asp:Label>
            &nbsp;
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                    <asp:ListItem Value="0">1-7 วัน</asp:ListItem>
                    <asp:ListItem Value="1">8-14  วัน</asp:ListItem>
                    <asp:ListItem Value="2">15-30 วัน</asp:ListItem>
                    <asp:ListItem Value="3">30-90 วัน</asp:ListItem>
                    <asp:ListItem Value="4">มากกว่า 90 วัน</asp:ListItem>
                </asp:DropDownList>
                &nbsp;</td>
            <td rowspan="3" class="style6">
                <table style="border-style: dashed; font-family: tahoma; font-size: 9px; font-weight: bold;">
                    <tr>
                        <td colspan="2" class="style4">
                            ความหมาย&nbsp; AGING_H&nbsp;&nbsp; ย้อนหลัง&nbsp;&nbsp;&nbsp; </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            1. = 0
                            <br />
                            2. &gt; 0,=&lt; 0.15<br />
                            3. &gt; 0.15,=&lt; 1.00<br />
                            4. &gt; 1.00,=&lt; 1.15
                            <br />
                        </td>
                        <td class="style5">
                            5. &gt; 1.15,=&lt; 2.00
                            <br />
                            6. &gt; 2.00,=&lt; 3.00
                            <br />
                            7. &gt; 3.00,=&lt; 4.00
                            <br />
                            8. &gt; 4.00,=&lt; 6.00
                            <br />
                            9. &gt; 6.00</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource2">
                    <EditItemTemplate>
                        DASOF:
                        <asp:TextBox ID="DASOFTextBox" runat="server" Text='<%# Bind("DASOF") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                            CommandName="Update" Text="Update" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        DASOF:
                        <asp:TextBox ID="DASOFTextBox" runat="server" Text='<%# Bind("DASOF") %>' />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                            CommandName="Insert" Text="Insert" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        Date of&nbsp; report :
                        <asp:Label ID="DASOFLabel" runat="server"  Text='<%# Bind("DASOF")%>' />
                        <br />
                    </ItemTemplate>
                </asp:FormView>
            </td>
        </tr>
        <tr>
            <td class="style1">
<asp:ImageButton ID="ImageButton1" runat="server" 
        ImageUrl="~/images/excell.jpg" Width="16px" />
    &nbsp;&lt; -- Export to excell&nbsp;
                <br />
                <asp:Label ID="TreeSelectedLabel" runat="server" Text="Label" Font-Bold="True" Font-Italic="False"
                    Font-Size="Larger" ForeColor="Red" Font-Underline="True"></asp:Label>
    </td>
        </tr>
    </table>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="3"  BackColor="White" BorderColor="#CCCCCC"  DataSourceID="SqlDataSource1"
        BorderStyle="None" BorderWidth="1px"  Font-Size="Small" 
        AllowSorting="True" PageSize="20"   EnableModelValidation="True">
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <RowStyle ForeColor="#000066" />
        <Columns>
            <asp:BoundField DataField="Last_Date_In" HeaderText="CA Last date" 
                ReadOnly="True" SortExpression="Last_Date_In" DataFormatString="{0:d}" />
           <asp:BoundField DataField="process" HeaderText="Process" 
                SortExpression="process" ItemStyle-Wrap="false" >
<ItemStyle Wrap="False"></ItemStyle>
            </asp:BoundField>
           <asp:BoundField DataField="judgement_detail" HeaderText="Judgement" 
                SortExpression="judgement_detail" ItemStyle-Wrap="false" >
         
<ItemStyle Wrap="False"></ItemStyle>
            </asp:BoundField>
         
            <asp:BoundField DataField="cif" HeaderText="cif" SortExpression="CIF" />
            <asp:BoundField DataField="custname" HeaderText="Customer Name"  ItemStyle-Wrap="false" 
                SortExpression="custname" >
<ItemStyle Wrap="False"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="aging" HeaderText="Aging" SortExpression="aging"  
                ItemStyle-BackColor="#FF99CC" >
<ItemStyle BackColor="#FF99CC"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="aging_h" HeaderText="Aging History" SortExpression="aging_h"  ItemStyle-Wrap="false" 
                ItemStyle-BackColor="#FF99CC" >
<ItemStyle BackColor="#FF99CC"></ItemStyle>
            </asp:BoundField>  
             <asp:BoundField DataField=">3 in 6 Month" HeaderText=">=3 in 6 Month" SortExpression=">3 in 6 Month"  
                ItemStyle-BackColor="#FF99CC" >
<ItemStyle BackColor="#FF99CC"></ItemStyle>
            </asp:BoundField>  
           <%--  ระงับการ show เนื่องจากไม่มี source ที่ update--%>
             <asp:BoundField DataField="class_h" HeaderText="class_h"  Visible="false" SortExpression="class_h"  ItemStyle-Wrap="false" 
                ItemStyle-BackColor="#FF99CC" >
<ItemStyle BackColor="#FF99CC"></ItemStyle>
            </asp:BoundField>
               <asp:BoundField DataField="cm_code" HeaderText="cm_code ReadOnly="True"  ItemStyle-Wrap="false" 
                SortExpression="cm_code" >
<ItemStyle Wrap="False"></ItemStyle>
            </asp:BoundField>
                <asp:BoundField DataField="cm_name" HeaderText="cm_name" ReadOnly="True"  ItemStyle-Wrap="false" 
                SortExpression="cm_name" >
<ItemStyle Wrap="False"></ItemStyle>
            </asp:BoundField>
               <asp:BoundField DataField="level_name" HeaderText="level_name" ReadOnly="True"  ItemStyle-Wrap="false" 
                SortExpression="cm_name" >
<ItemStyle Wrap="False"></ItemStyle>
            </asp:BoundField>
               <asp:BoundField DataField="controlling_unit" HeaderText="controlling_unit" ReadOnly="True"  ItemStyle-Wrap="false" 
                SortExpression="controlling_unit" >
<ItemStyle Wrap="False"></ItemStyle>
                 </asp:BoundField>
        
<%--            <asp:BoundField DataField="busi_type" HeaderText="busi_type" 
                SortExpression="busi_type" ItemStyle-Wrap="false" >
<ItemStyle Wrap="False"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="busi_desc" HeaderText="busi_desc" 
                SortExpression="busi_desc"  ItemStyle-Wrap="false">
<ItemStyle Wrap="False"></ItemStyle>
            </asp:BoundField>
     --%>
        </Columns>
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
    </td>
    </tr>
    </table>
    


</asp:Content>