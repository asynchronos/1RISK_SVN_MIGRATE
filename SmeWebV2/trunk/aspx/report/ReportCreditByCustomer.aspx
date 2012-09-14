<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ReportCreditByCustomer.aspx.vb" Inherits="aspx_report_ReportCreditByCustomer" 
MaintainScrollPositionOnPostback="true"  %>
<html>
<head>
<link href="../../css/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server" >
 <div style="font-family: 'MS Sans Serif'; font-size: 10px; font-weight: normal">

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
        SelectCommand="Report_Credit_By_Customer" SelectCommandType="StoredProcedure">
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
            <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID">
            </asp:BoundField>            
            <asp:BoundField DataField="APP-DATE" 
                HeaderText="Process Date"  SortExpression="Process Date"  ItemStyle-Wrap="false" DataFormatString="{0:d}" HeaderStyle-Wrap="false">
            </asp:BoundField>
            <asp:BoundField DataField="REG-DATE" HeaderText="Register Date" HeaderStyle-Wrap="false" DataFormatString="{0:d}"
                ItemStyle-Wrap="false" SortExpression="REG-DATE">
            </asp:BoundField>
            <asp:BoundField DataField="CIF" HeaderText="CIF"  HeaderStyle-Wrap="false"
                SortExpression="CIF" >
            </asp:BoundField>
            <asp:BoundField DataField="PROJECT_CODE" HeaderText="Project Code" HeaderStyle-Wrap="false"
                SortExpression="PROJECT_CODE" >
            </asp:BoundField>
            <asp:BoundField DataField="Project_Name" HeaderText="Project Name" HeaderStyle-Wrap="false" 
                SortExpression="Project_Name" ItemStyle-Wrap="false" >
            </asp:BoundField>
            <asp:BoundField DataField="ACCNO" HeaderText="Account No." HeaderStyle-Wrap="false"
                SortExpression="ACCNO" >
            </asp:BoundField>
            <asp:BoundField DataField="Value_Customer" HeaderText="RM  Value" HeaderStyle-Wrap="false"
                SortExpression="Value_Customer" ItemStyle-Wrap="false" >
            </asp:BoundField>
            <asp:BoundField DataField="VALUE_OLD" HeaderText="Old Value" HeaderStyle-Wrap="false"
                SortExpression="VALUE_OLD" >
            </asp:BoundField>
            <asp:BoundField DataField="VALUE" HeaderText="CM Value" HeaderStyle-Wrap="false" 
                SortExpression="VALUE" ItemStyle-Wrap="false" >
            </asp:BoundField>
            <asp:BoundField DataField="VALUE_APPROVE" HeaderText="Approve Value"  HeaderStyle-Wrap="false"
                SortExpression="VALUE_APPROVE" >
            </asp:BoundField>
            <asp:BoundField DataField="Others" HeaderText="Others"  
                HeaderStyle-Wrap="false" SortExpression="Others" ItemStyle-Wrap="false" >
            </asp:BoundField>
             <asp:BoundField DataField="SUBJECT_DETAIL" HeaderText="Subject" HeaderStyle-Wrap="false" ItemStyle-Wrap="false"
                SortExpression="SUBJECT_DETAIL" >
            
            </asp:BoundField>
            
                <asp:BoundField DataField="DECB_RD" HeaderText="Product" HeaderStyle-Wrap="false"
                SortExpression="DECB_RD" >
            </asp:BoundField>
            
            <asp:BoundField DataField="PROPOSAL_NAME" HeaderText="Proposal Name" HeaderStyle-Wrap="false"
                SortExpression="PROPOSAL_NAME" >
            </asp:BoundField>
            <asp:BoundField DataField="CUSTOMER_NAME" HeaderText="Customer Name"  ItemStyle-Wrap="false"
                ReadOnly="True" HeaderStyle-Wrap="false"
                SortExpression="CUSTOMER_NAME" >
            </asp:BoundField>
           <asp:BoundField DataField="CM_CODE" HeaderText="CM Code" HeaderStyle-Wrap="false"
                SortExpression="CM_CODE" >
            </asp:BoundField>
            <asp:BoundField DataField="CM_NAME" HeaderText="CM Name" ReadOnly="True" HeaderStyle-Wrap="false" ItemStyle-Wrap="false"
                SortExpression="CM_NAME" >
            </asp:BoundField>
            <asp:BoundField DataField="BRANCH_ID" HeaderText="Branch ID" HeaderStyle-Wrap="false"
                SortExpression="BRANCH_ID" >
            </asp:BoundField>
            <asp:BoundField DataField="BRANCH_NAME" HeaderText="Branch Name" HeaderStyle-Wrap="false" ItemStyle-Wrap="false"
                SortExpression="BRANCH_NAME" >
            </asp:BoundField>
            <asp:BoundField DataField="Id_Region" HeaderText="Region ID" 
                HeaderStyle-Wrap="false" SortExpression="Id_Region" >
            </asp:BoundField>
            <asp:BoundField DataField="REGION_NAME" HeaderText="Region Name" 
                ReadOnly="True" HeaderStyle-Wrap="false"
                SortExpression="REGION_NAME" >
            </asp:BoundField>
              <asp:BoundField DataField="GROUP_SIZE_DETAIL" HeaderText="Group Size Detail"  HeaderStyle-Wrap="false" 
                SortExpression="GROUP_SIZE_DETAIL"/>
              <asp:BoundField DataField="JUDGEMENT_DETAIL" HeaderText="Judgement" 
                SortExpression="JUDGEMENT_DETAIL"/>
            <asp:BoundField DataField="SIZE_DETAIL" HeaderText="Size Detail"   HeaderStyle-Wrap="false" 
                SortExpression="SIZE_DETAIL"  />
                    
            <asp:BoundField DataField="PROCESS_GROUP" HeaderText="Process Group"   HeaderStyle-Wrap="false" 
                SortExpression="PROCESS_GROUP" />
                
            <asp:BoundField DataField="EMP-ID" HeaderText="Emp ID" 
                SortExpression="EMP-ID" />
            <asp:BoundField DataField="EMPLOYEE" HeaderText="Emp Name"   HeaderStyle-Wrap="false" 
                SortExpression="EMPLOYEE"  ItemStyle-Wrap="false"/>
                    
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