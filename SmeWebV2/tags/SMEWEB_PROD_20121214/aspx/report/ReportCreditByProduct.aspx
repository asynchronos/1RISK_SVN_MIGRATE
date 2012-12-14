<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ReportCreditByProduct.aspx.vb" Inherits="aspx_report_ReportCreditByProduct" MaintainScrollPositionOnPostback="true"  %>
<html>
<head>
<style type="text/css" >
 body {
     font-family: 'MS Sans Serif'; 
     font-size: 10px;
     font-weight:normal ;
 }
table {
     font-size:10px;
}
a {
   cursor:pointer;
}
</style>
</head>
<body>
    <form id="form1" runat="server" >
 <div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
        SelectCommand="ReportByCreditApproveSelectGroupRegionEmpLevel" 
        SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter Name="Year" QueryStringField="y" Type="Int32" 
                DefaultValue="" />
            <asp:QueryStringParameter Name="Month" QueryStringField="m" Type="Int32" 
                DefaultValue="" />
            <asp:QueryStringParameter Name="Day" QueryStringField="d" Type="Int32" 
                DefaultValue="" />
            <asp:QueryStringParameter Name="YearR" QueryStringField="yr" Type="String" 
                DefaultValue="" />
            <asp:QueryStringParameter Name="MonthR" QueryStringField="mr" Type="String" 
                DefaultValue="" />
            <asp:QueryStringParameter Name="DayR" QueryStringField="dr" Type="String" 
                DefaultValue="" />
            <asp:QueryStringParameter Name="Group" QueryStringField="g" Type="String" 
                DefaultValue="" />
            <asp:QueryStringParameter Name="RegionID" QueryStringField="r" Type="String" 
                DefaultValue="" />
            <asp:QueryStringParameter Name="EmpID" QueryStringField="e" Type="String" 
                DefaultValue="" />
            <asp:QueryStringParameter Name="Level_id" QueryStringField="l" Type="String" 
                DefaultValue="" />
            <asp:QueryStringParameter Name="NotFin" QueryStringField="f" Type="String" 
                DefaultValue="" />
        </SelectParameters>
    </asp:SqlDataSource>
  
    
                    <asp:Label ID="msg" runat="server" ForeColor="#990000"></asp:Label>
        &nbsp;
        <asp:ImageButton ID="ImageButton1" runat="server" 
        ImageUrl="~/images/excell.jpg" Width="16px" />
&nbsp;&lt;-- Export to excell&nbsp;       
     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource1" CellPadding="4" ShowFooter="True" BackColor="White" 
        BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
        ForeColor="Black" GridLines="Vertical">
        <FooterStyle BackColor="#CCCC99" />
        <RowStyle BackColor="#F7F7DE" BorderStyle="Dotted" />
        <Columns>
            <asp:HyperLinkField   Text="Select"  ControlStyle-Font-Underline="true">
                   <ControlStyle Font-Underline="True"></ControlStyle>
            </asp:HyperLinkField>
            <asp:BoundField DataField="ID" HeaderText="ID (เลขที่หนังสือ)" SortExpression="ID">
<HeaderStyle Wrap="False" BorderStyle="Solid"></HeaderStyle>
            </asp:BoundField>            <asp:BoundField DataField="REG-DATE" HeaderText="REG-DATE (วันที่ register)" ReadOnly="True"  SortExpression="REG-DATE" ItemStyle-Wrap="false"  DataFormatString="{0:d}">
<HeaderStyle Wrap="False"></HeaderStyle>

<ItemStyle Wrap="False"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="APP-DATE" HeaderText="PROCESS-DATE (วันที่ process)" HeaderStyle-Wrap="false"
                ItemStyle-Wrap="false" DataFormatString="{0:d}">
<HeaderStyle Wrap="False"></HeaderStyle>

<ItemStyle Wrap="False"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="CIF" HeaderText="CIF" ReadOnly="True"  HeaderStyle-Wrap="false"
                SortExpression="CIF" >
<HeaderStyle Wrap="False"></HeaderStyle>
            </asp:BoundField>
            <asp:BoundField DataField="CUSTOMER" HeaderText="CUSTOMER (ชื่อสูกค้า)" ReadOnly="True" HeaderStyle-Wrap="false" 
                SortExpression="CUSTOMER" ItemStyle-Wrap="false" >
<HeaderStyle Wrap="False"></HeaderStyle>

<ItemStyle Wrap="False"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="EMP-ID" HeaderText="EMP-ID (รหัสพนักงาน)" ReadOnly="True" HeaderStyle-Wrap="false"
                SortExpression="EMP-ID" >
<HeaderStyle Wrap="False"></HeaderStyle>
            </asp:BoundField>
            <asp:BoundField DataField="EMPLOYEE" HeaderText="EMPLOYEE (ชื่อพนักงาน)" ReadOnly="True" HeaderStyle-Wrap="false"
                SortExpression="EMPLOYEE" ItemStyle-Wrap="false" >
<HeaderStyle Wrap="False"></HeaderStyle>

<ItemStyle Wrap="False"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="BRANCH-ID" HeaderText="BRANCH-ID (รหัสสาขา)" HeaderStyle-Wrap="false"
                SortExpression="BRANCH-ID" >
<HeaderStyle Wrap="False"></HeaderStyle>
            </asp:BoundField>
            <asp:BoundField DataField="BRANCH-NAME" HeaderText="BRANCH-NAME (ชื่อสาขา)" HeaderStyle-Wrap="false" 
                ReadOnly="True" SortExpression="BRANCH-NAME" ItemStyle-Wrap="false" >
<HeaderStyle Wrap="False"></HeaderStyle>

<ItemStyle Wrap="False"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="REGION-ID" HeaderText="REGION-ID (รหัสภาค)"  HeaderStyle-Wrap="false"
                SortExpression="REGION-ID" >
<HeaderStyle Wrap="False"></HeaderStyle>
            </asp:BoundField>
            <asp:BoundField DataField="REGION-NAME" HeaderText="REGION-NAME (ชื่อภาค)"  HeaderStyle-Wrap="false"
                ReadOnly="True" SortExpression="REGION-NAME" ItemStyle-Wrap="false" >
<HeaderStyle Wrap="False"></HeaderStyle>

<ItemStyle Wrap="False"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="NEW" HeaderText="NEW" ReadOnly="True" HeaderStyle-Wrap="false"
                SortExpression="NEW" DataFormatString="{0:#,###0}" >
<HeaderStyle Wrap="False"></HeaderStyle>
            </asp:BoundField>
            <asp:BoundField DataField="OLD" HeaderText="OLD" ReadOnly="True" HeaderStyle-Wrap="false"
                SortExpression="OLD" DataFormatString="{0:#,###0}" >
            
<HeaderStyle Wrap="False"></HeaderStyle>
            </asp:BoundField>
            
                <asp:BoundField DataField="REVIEW" HeaderText="REVIEW (ทบทวน)" ReadOnly="True" HeaderStyle-Wrap="false"
                SortExpression="REVIEW" DataFormatString="{0:#,###0}" >
<HeaderStyle Wrap="False"></HeaderStyle>
            </asp:BoundField>
            <asp:BoundField DataField="EXCEPTION" HeaderText="EXCEPTION (เรื่องอื่นๆ)" ReadOnly="True" HeaderStyle-Wrap="false"
                SortExpression="EXCEPTION" DataFormatString="{0:#,###0}" >
            
<HeaderStyle Wrap="False"></HeaderStyle>
            </asp:BoundField>
                 <asp:BoundField DataField="APPROVE" HeaderText="APPROVE (วงเงิน)" ReadOnly="True" HeaderStyle-Wrap="false"
                SortExpression="APPROVE" DataFormatString="{0:#,###0}" >
            
<HeaderStyle Wrap="False"></HeaderStyle>
            </asp:BoundField>
            <asp:BoundField DataField="O-D" HeaderText="O-D" ReadOnly="True" HeaderStyle-Wrap="false"
                SortExpression="O-D" DataFormatString="{0:#,###0}" >
<HeaderStyle Wrap="False"></HeaderStyle>
            </asp:BoundField>
            <asp:BoundField DataField="(O-D)" HeaderText="(O-D)" ReadOnly="True" HeaderStyle-Wrap="false"
                SortExpression="(O-D)" DataFormatString="{0:#,###0}" >
<HeaderStyle Wrap="False"></HeaderStyle>
            </asp:BoundField>
            <asp:BoundField DataField="F-L" HeaderText="F-L" ReadOnly="True" HeaderStyle-Wrap="false"
                SortExpression="F-L" DataFormatString="{0:#,###0}" >
<HeaderStyle Wrap="False"></HeaderStyle>
            </asp:BoundField>
            <asp:BoundField DataField="(F-L)" HeaderText="(F-L)" ReadOnly="True" HeaderStyle-Wrap="false"
                SortExpression="(F-L)" DataFormatString="{0:#,###0}" >
<HeaderStyle Wrap="False"></HeaderStyle>
            </asp:BoundField>
            <asp:BoundField DataField="L-G" HeaderText="L-G" ReadOnly="True" HeaderStyle-Wrap="false"
                SortExpression="L-G" DataFormatString="{0:#,###0}" >
<HeaderStyle Wrap="False"></HeaderStyle>
            </asp:BoundField>
            <asp:BoundField DataField="(L-G)" HeaderText="(L-G)" ReadOnly="True" HeaderStyle-Wrap="false"
                SortExpression="(L-G)" DataFormatString="{0:#,###0}" >
<HeaderStyle Wrap="False"></HeaderStyle>
            </asp:BoundField>
            <asp:BoundField DataField="STL-PN" HeaderText="STL-PN" ReadOnly="True" HeaderStyle-Wrap="false"
                SortExpression="STL-PN" DataFormatString="{0:#,###0}" >
<HeaderStyle Wrap="False"></HeaderStyle>
            </asp:BoundField>
            <asp:BoundField DataField="(STL-PN)" HeaderText="(STL-PN)" ReadOnly="True" HeaderStyle-Wrap="false"
                SortExpression="(STL-PN)" DataFormatString="{0:#,###0}" >
<HeaderStyle Wrap="False"></HeaderStyle>
            </asp:BoundField>
            <asp:BoundField DataField="TRADE-FIN" HeaderText="TRADE-FIN" ReadOnly="True" HeaderStyle-Wrap="false"
                SortExpression="TRADE-FIN" DataFormatString="{0:#,###0}" >
<HeaderStyle Wrap="False"></HeaderStyle>
            </asp:BoundField>
            <asp:BoundField DataField="(TRADE-FIN)" HeaderText="(TRADE-FIN)" HeaderStyle-Wrap="false"
                ReadOnly="True" SortExpression="(TRADE-FIN)" 
                DataFormatString="{0:#,###0}" >
<HeaderStyle Wrap="False"></HeaderStyle>
            </asp:BoundField>
            <asp:BoundField DataField="OTHERS" HeaderText="OTHERS" ReadOnly="True" HeaderStyle-Wrap="false"
                SortExpression="OTHERS" DataFormatString="{0:#,###0}" >
<HeaderStyle Wrap="False"></HeaderStyle>
            </asp:BoundField>
            <asp:BoundField DataField="(OTHERS)" HeaderText="(OTHERS)" ReadOnly="True" HeaderStyle-Wrap="false"
                SortExpression="(OTHERS)" DataFormatString="{0:#,###0}" >
       
<HeaderStyle Wrap="False"></HeaderStyle>
            </asp:BoundField>
           <asp:BoundField DataField="SUM-INCREASE" HeaderText="SUM-INCREASE (เพิ่มรวม)" DataFormatString="{0:#,###0}"/>
            <asp:BoundField DataField="SUM-DECREASE" HeaderText="SUM-DECREASE (ลดรวม)"  DataFormatString="{0:#,###0}"/>
            <asp:BoundField DataField="NET" HeaderText="NET (รวม)" DataFormatString="{0:#,###0}"/>
            <asp:BoundField DataField="TTY" HeaderText="TIME TO YES (ระยะเวลาในการอนุมัติ)"  />
            <asp:BoundField DataField="PAT" HeaderText="PRE APPROVE TIME(ระยะเวลาที่ใช้ในการปฏิบัติงาน)"  />
            <asp:BoundField DataField="App-Type" HeaderText="APPROVAL AUTHORITY(อำนาจอนุมัติ))" ItemStyle-Wrap="false" >
<HeaderStyle Wrap="False"></HeaderStyle>

<ItemStyle Wrap="False"></ItemStyle>
            </asp:BoundField>
             <asp:BoundField DataField="Process" HeaderText="PROCESS (ขั้นตอนปฏิบัตงาน)" ItemStyle-Wrap="false"
                HeaderStyle-Wrap="false" >
<HeaderStyle Wrap="False"></HeaderStyle>

<ItemStyle Wrap="False"></ItemStyle>
             </asp:BoundField>
        
             <asp:BoundField DataField="LEVEL_Name" HeaderText="SECTION (กลุ่มงาน)" ItemStyle-Wrap="false" />
             <asp:BoundField DataField="JOB_TYPE" HeaderText="JOB TYPE (ประเภทงาน)" ItemStyle-Wrap="false" />
             <asp:BoundField DataField="BOARD" HeaderText="BOARD (ประเภทบอร์ด)" ItemStyle-Wrap="false" />
             <asp:BoundField DataField="REFERRAL_NO" HeaderText="REFERRAL NO. (เลขที่งาน)" ItemStyle-Wrap="false" />
             <asp:BoundField DataField="REFERENCE" HeaderText="REFERENCE (เลขอ้างอิงCA)" ItemStyle-Wrap="false" />
             <asp:BoundField DataField="SUM-RM_VALUE" HeaderText="SUM-RM-VALUE] (จำนวนเงินที่เสนอ )" ItemStyle-Wrap="false" />
             <asp:BoundField DataField="BUSINESS_ID" HeaderText="BUSINESS_ID (รหัสปรเภทธุรกิจ Bay )" ItemStyle-Wrap="false" />
             <asp:BoundField DataField="BUSINESS_TYPE" HeaderText="BUSINESS_TYPE (ประเภทธุรกิจ Bay)" ItemStyle-Wrap="false" />
             <asp:BoundField DataField="reason_remark" HeaderText="REASON (เหตุผลประกอบพิจารณา)" ItemStyle-Wrap="false" />
             <asp:BoundField DataField="result_remark" HeaderText="RESULT(ผลการพิจารณา)" ItemStyle-Wrap="false" />
             <asp:BoundField DataField="Size_Detail" HeaderText="Customer Size (ประเภทลูกค้า)" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" />
             <asp:BoundField DataField="EMP_APPROVE" HeaderText="APPROVE 1 (ผู้อนุมัติ1)" ItemStyle-Wrap="false" />
             <asp:BoundField DataField="EMP_APPROVE2" HeaderText="APPROVE 2 (ผู้อนุมัติ2)" ItemStyle-Wrap="false"  />
             <asp:BoundField DataField="GROUP_EXPOSURE" HeaderText="GROUP  EXPOSURE (ล้านบาท)"
              ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Right"  DataFormatString="{0:N4}"/>
              <asp:BoundField DataField="FLOOD_BOT" HeaderText="FLOOD BOT" ItemStyle-Wrap="false" />
                    
        </Columns>
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BorderStyle="Dotted" BackColor="White" />
    </asp:GridView>
    </div>
    </form>
</body>
</html>
