<%@ Page Title="Stop&SM&TDR Request" Language="VB" MasterPageFile="~/MasterPage.master"
    AutoEventWireup="false" CodeFile="stop_in.aspx.vb" Inherits="aspx.stop.stop_in"
    EnableEventValidation="false" %>

<%@ Register Src="../../Controls/ExportControl/ExportControl.ascx" TagName="ExportControl"
    TagPrefix="uc3" %>
    
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style2
        {
            width: 608px;
        }
        .style3
        {
            width: 894px;
        }
        .style4
        {
            width: 202px;
            font-size: x-small;
        }
        .style5
        {
            width: 300px;
        }
        .style6
        {
            width: 226px;
        }
        .style7
        {
            width: 180px;
        }
        .style8
        {
            width: 380px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="LblHead" runat="server" Font-Bold="True" Font-Overline="False" ForeColor="Blue"
        Text="STOP  PROGRAM"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <asp:HyperLink ID="HyperLink2" runat="server" Font-Bold="True" NavigateUrl="~/aspx/stop/stop_summary.aspx">&lt;&lt; BACK</asp:HyperLink>
    <table style="width: 100%;">
        <tr>
            <td class="style2">
                <table>
                    <tr>
                        <td style="background-color: CadetBlue">
                            &nbsp&nbsp
                        </td>
                        <td class="style7">
                            <asp:Label ID="lblmaxday" runat="server" Text="ข้อมูลรายวันวันที่ "></asp:Label>
                        </td>
                        <td rowspan="2" class="style8">
                            <table style="border-style: dashed; width: 100%; font-family: tahoma; font-size: 9px;
                                font-weight: bold;">
                                <tr>
                                    <td colspan="2" class="style4">
                                        ความหมาย&nbsp; AGING_H&nbsp;&nbsp; ย้อนหลัง
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style6">
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
                                        9. &gt; 6.00
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="background-color: BlueViolet">
                            &nbsp&nbsp
                        </td>
                        <td class="style7">
                            <asp:Label ID="lblmaxmonth" runat="server" Text="ข้อมูลรายเดือนวันที่ "></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
            <td class="style3">
                &nbsp;<asp:Label ID="Label1" runat="server" Text="ค้นหาจาก"></asp:Label>
                <asp:DropDownList ID="DDLSEARCH" runat="server">
                </asp:DropDownList>
                <asp:DropDownList ID="DDLregion" runat="server" DataSourceID="SqlDataSource2" DataTextField="REGION_NAME"
                    DataValueField="REGION_NAME">
                </asp:DropDownList>
                &nbsp;
                <asp:DropDownList ID="DDLaction" runat="server" DataSourceID="SqlDataSource3" DataTextField="ACTION_DETAIL"
                    DataValueField="ACTION_DETAIL">
                </asp:DropDownList>
                <asp:DropDownList ID="DDLpay" runat="server" DataSourceID="SqlDataSource4" DataTextField="PAY_STATUS_DETAIL"
                    DataValueField="PAY_STATUS_DETAIL">
                </asp:DropDownList>
                <asp:TextBox ID="TBSearch" runat="server"></asp:TextBox>
                &nbsp;&nbsp;<asp:Button ID="BtnSearch" runat="server" ForeColor="Blue" Text="Search" />
                &nbsp;<asp:Button ID="BtnShowAll" runat="server" ForeColor="Blue" Text="Show all"
                    Width="76px" />&nbsp;&nbsp;
                <br />
                <asp:CheckBox ID="CheckBox1" runat="server" Text="ลูกค้าที่ยังไม่ได้ดำเนินการ" />
                <uc3:exportcontrol id="ExportControl1" runat="server" controlname="GridView1" exportmode="Excel"
                    autogeneratecolumns="True" buttontext="Export To Excell" />
            </td>
        </tr>
    </table>
    <asp:Panel ID="Panel1" runat="server" ScrollBars="Horizontal" Width="100%" Height="100%"
        Wrap="False">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
            CellPadding="4" DataSourceID="SqlDataSource1" Font-Size="8pt" Font-Names="Tahoma"
            GridLines="Vertical" Style="margin-bottom: 0px" DataKeyNames="CIF" ForeColor="Black"
            HorizontalAlign="Left" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None"
            BorderWidth="1px" Font-Bold="False" PageSize="15">
            <RowStyle BackColor="#F7F7DE" BorderStyle="Dotted" />
            <Columns>
                <asp:TemplateField HeaderStyle-Wrap="false" HeaderText="บันทึก" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:HyperLink ID="ImgEdit" runat="server" ImageUrl="../../images/Edit.gif">&nbsp</asp:HyperLink>
                        <asp:HiddenField ID="HCIF" runat="server" Value='<%# Bind("CIF") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderStyle-Wrap="false" DataField="CIF" HeaderText="CIF" SortExpression="CIF">
                    <HeaderStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField HeaderStyle-Wrap="false" DataField="CUSTOMER_NAME" HeaderText="ชื่อลูกค้า"
                    SortExpression="CUSTOMER_NAME" ItemStyle-Wrap="false">
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField HeaderStyle-Wrap="false" DataField="CM_CODE" HeaderText="รหัสพนักงาน"
                    SortExpression="CM_CODE">
                    <HeaderStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField HeaderStyle-Wrap="false" DataField="CM_NAME" HeaderText="พนักงาน"
                    SortExpression="CM_NAME" ItemStyle-Wrap="false">
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField HeaderStyle-Wrap="false" DataField="LEVEL_NAME" HeaderText="หน่วยงาน"
                    SortExpression="LEVEL_NAME" ItemStyle-Wrap="false">
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField HeaderStyle-Wrap="false" DataField="CONTROLLING_UNIT" HeaderText="CONTROLLING_UNIT "
                    SortExpression="CONTROLLING_UNIT" ItemStyle-Wrap="false">
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField HeaderStyle-Wrap="false" DataField="REGION_CONTROLLING_UNIT" HeaderText="REGION_CONTROLLING_UNIT"
                    SortExpression="REGION_CONTROLLING_UNIT" ItemStyle-Wrap="false">
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField HeaderStyle-Wrap="false" DataField="PRINCIPAL" HeaderText="เงินต้น"
                    SortExpression="PRINCIPAL" DataFormatString="{0:n}" ItemStyle-HorizontalAlign="Right">
                    <HeaderStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField HeaderStyle-Wrap="false" DataField="AGING_DPD" HeaderText="AGING"
                    ItemStyle-HorizontalAlign="Right" SortExpression="AGING_DPD" DataFormatString="{0:n}">
                    <HeaderStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="AGING_DPD_C" HeaderText=" AGING เฉพาะบัญชี Commercial "
                    ItemStyle-HorizontalAlign="Right" SortExpression="AGING_DPD_C" DataFormatString="{0:n}">
                    <HeaderStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField HeaderStyle-Wrap="false" DataField="AGING_DPD_O" HeaderText="AGING บัญชีอื่น ๆ"
                    ItemStyle-HorizontalAlign="Right" SortExpression="AGING_DPD_O" DataFormatString="{0:n}">
                    <HeaderStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField HeaderStyle-Wrap="false" DataField="AGING_H" HeaderText="AGING ย้อนหลัง"
                    SortExpression="AGING_H">
                    <HeaderStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField HeaderStyle-Wrap="false" DataField="HAS_OTHER_CLASS" HeaderText="เคยมีชั้นหนี้อื่นที่ไม่ใช่ จ."
                    SortExpression="HAS_OTHER_CLASS">
                    <HeaderStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField HeaderStyle-Wrap="false" DataField="CLASS_H" HeaderText="ชั้นหนี้ย้อนหลัง"
                    SortExpression="CLASS_H">
                    <HeaderStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField HeaderStyle-Wrap="false" DataField="IS_TDR" HeaderText="เคยเป็น TDR"
                    SortExpression="IS_TDR">
                    <HeaderStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField HeaderStyle-Wrap="false" DataField="OD_UTILIZE" HeaderText="% การใช้วงเงิน"
                    SortExpression="OD_UTILIZE" DataFormatString="{0:n}">
                    <HeaderStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField HeaderStyle-Wrap="false" DataField="JUDGEMENT" HeaderText="การจัดลำดับความเสี่ยง"
                    SortExpression="JUDGEMENT" ItemStyle-Wrap="false">
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField HeaderStyle-Wrap="false" DataField="BUSINESS_CIM_FLAG" HeaderText="รหัสธุรกิจจาก CIM"
                    SortExpression="BUSINESS_CIM_FLAG">
                    <HeaderStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField HeaderStyle-Wrap="false" DataField="BUSINESS_CODE" HeaderText="รหัสประเภทธุรกิจ"
                    SortExpression="BUSINESS_CODE">
                    <HeaderStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField HeaderStyle-Wrap="false" DataField="BUSINESS_DESC" HeaderText="ประเภทธุรกิจ"
                    SortExpression="BUSINESS_DESC" ItemStyle-Wrap="false">
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField HeaderStyle-Wrap="false" DataField="DATE_IN" HeaderText="วันที่ข้อมูลเข้า STOP"
                    DataFormatString="{0:d}" SortExpression="DATE_IN" ItemStyle-Wrap="false">
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField HeaderStyle-Wrap="false" DataField="UPDATE_ACTION_DATE" HeaderText="วันเวลาที่บันทึกข้อมูล "
                    SortExpression="UPDATE_ACTION_DATE" ItemStyle-Wrap="false">
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField HeaderStyle-Wrap="false" DataField="PAY_STATUS_DETAIL" HeaderText="รายละเอียดการชำระ"
                    SortExpression="PAY_STATUS_DETAIL" ItemStyle-Wrap="false">
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField HeaderStyle-Wrap="false" DataField="ACTION_DETAIL" HeaderText="การดำเนินการ "
                    SortExpression="ACTION_DETAIL" ItemStyle-Wrap="false">
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField HeaderStyle-Wrap="false" DataField="DEPT_RESOLVE_DETAIL" HeaderText="วิธีการแก้ไข "
                    SortExpression="DEPT_RESOLVE_DETAIL" ItemStyle-Wrap="false">
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="#CCCC99" HorizontalAlign="Left" VerticalAlign="Top" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Left" />
            <SelectedRowStyle BackColor="#CE5D5A" ForeColor="White" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" Wrap="True" />
            <AlternatingRowStyle Font-Size="8pt" BackColor="White" />
        </asp:GridView>
    </asp:Panel>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:STOPConnectionString %>"
        DeleteCommand="S05_DELETE_RECCORD_BY_CIF" DeleteCommandType="StoredProcedure"
        UpdateCommand="S06_UPDATE_STOP_INSERT_ACTION_HISTORY" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="CIF" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="CIF" Type="Int32" />
            <asp:Parameter Name="DATE_IN" Type="DateTime" />
            <asp:Parameter Name="UPDATE_ACTION_ID" Type="String" />
            <asp:Parameter Name="UPDATE_ACTION_USER" Type="String" />
            <asp:Parameter Name="UPDATE_PAY_ABILITY_ID" Type="String" />
            <asp:Parameter Name="UPDATE_DEPT_RESOLVE_ID" Type="String" />
            <asp:Parameter Name="UPDATE_TDR_DATE" Type="DateTime" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:HiddenField ID="Hsql1" runat="server" />
    <asp:HiddenField ID="HcommandType" runat="server" />
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:STOPConnectionString %>"
        DeleteCommand="S05_DELETE_RECCORD_BY_CIF" DeleteCommandType="StoredProcedure"
        UpdateCommand="S06_UPDATE_STOP_INSERT_ACTION_HISTORY" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="CIF" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="CIF" Type="Int32" />
            <asp:Parameter Name="DATE_IN" Type="DateTime" />
            <asp:Parameter Name="UPDATE_ACTION_ID" Type="String" />
            <asp:Parameter Name="UPDATE_ACTION_USER" Type="String" />
            <asp:Parameter Name="UPDATE_PAY_ABILITY_ID" Type="String" />
            <asp:Parameter Name="UPDATE_DEPT_RESOLVE_ID" Type="String" />
            <asp:Parameter Name="UPDATE_COMMENT" Type="String" />
            <asp:Parameter Name="UPDATE_TDR_DATE" Type="DateTime" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:STOPConnectionString %>">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:STOPConnectionString %>">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:STOPConnectionString %>"
        SelectCommand="SELECT 
MAX(DASOF) as MAXDAY
,MAX(OD_AS_OF) as MAXMONTH
FROM STOP_CUSTOMER"></asp:SqlDataSource>
    <br />

    <script type="text/javascript">
        function ShowDropDownRegion(dropdown) {
            //alert(document.getElementById("ctl00_ContentPlaceHolder2_DDLregion").value)
            document.getElementById("ctl00_ContentPlaceHolder2_DDLregion").style.display = "none";
            document.getElementById("ctl00_ContentPlaceHolder2_TBSearch").style.display = "none";
            document.getElementById( "ctl00_ContentPlaceHolder2_DDLaction").style.display = "none";
            document.getElementById("ctl00_ContentPlaceHolder2_DDLpay").style.display = "none";
            
            if (document.getElementById( "ctl00_ContentPlaceHolder2_DDLSEARCH").value == 'REGION_NAME') {
                document.getElementById( "ctl00_ContentPlaceHolder2_DDLregion").style.display = "inline";
            }
            else if (document.getElementById("ctl00_ContentPlaceHolder2_DDLSEARCH").value ==  'ACTION_DETAIL') {
                  document.getElementById( "ctl00_ContentPlaceHolder2_DDLaction").style.display = "inline";
           } else if (document.getElementById("ctl00_ContentPlaceHolder2_DDLSEARCH").value == 'PAY_STATUS_DETAIL') {
                   document.getElementById("ctl00_ContentPlaceHolder2_DDLpay").style.display = "inline";
            }
            else {
                document.getElementById("ctl00_ContentPlaceHolder2_TBSearch").style.display = "inline";
            }
        }
  
    </script>

</asp:Content>
