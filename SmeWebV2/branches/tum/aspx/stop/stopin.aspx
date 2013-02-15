<%@ Page Language="VB" AutoEventWireup="false" CodeFile="stopin.aspx.vb" Inherits="aspx_stop_stopin" MaintainScrollPositionOnPostback="true" %>

<%@ Register Src="~/HeaderControl/HeaderControl.ascx" TagName="HeaderControl" TagPrefix="uc1" %>
<%@ Register Src="~/HeaderControl/HeadTagControl.ascx" TagName="HeadTagControl" TagPrefix="uc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <uc2:HeadTagControl ID="HeadTagControl1" runat="server" />
    <style type="text/css">
       
        .style1
        {
            width: 857px;
        }
        .style2
        {
            width: 209px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
     <uc1:HeaderControl ID="HeaderControl1" runat="server" />
    <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Overline="False" 
        ForeColor="Blue" Text="STOP  PROGRAM"></asp:Label>
     <table style="width:100%;">
         <tr>             <td class="style2">
                <asp:FormView ID="FormView2" runat="server" 
         DataSourceID="SqlDataSource3" Font-Size="10pt" Width="102px">
        
         <ItemTemplate>
             &nbsp;<asp:Label ID="count_cifLabel" runat="server" Text='<%# Bind("count_cif") %>' 
                 Font-Size="10pt" />
             &nbsp;<asp:Label ID="Label8" runat="server" Font-Size="10pt" Text=": Records"></asp:Label>
         </ItemTemplate>
     </asp:FormView></td>
             <td class="style1">
                
            <asp:Label ID="Label6" runat="server" Text="SEARCH" Font-Size="10pt"></asp:Label>
            &nbsp;
            <asp:DropDownList ID="DDLSEARCH" runat="server">
            </asp:DropDownList>
            <asp:DropDownList ID="DDLregion" runat="server" 
        DataSourceID="SqlDataSource2" DataTextField="REGION_CONTROLLING_UNIT" 
        DataValueField="REGION_CONTROLLING_UNIT">
    </asp:DropDownList>
            <asp:TextBox ID="TBSearch" runat="server"></asp:TextBox>
            &nbsp;
            <asp:Button ID="BtnSearch" runat="server" ForeColor="Blue" Text="Search" />
            &nbsp;<asp:Button ID="BtnShowAll" runat="server" ForeColor="Blue" Text="Show all" 
                Width="76px" />&nbsp;<asp:Label ID="Label7" runat="server" Text="link to" 
                     Font-Size="10pt"></asp:Label>
                 &nbsp;<asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" 
                     Font-Underline="True" ForeColor="Blue" 
                     NavigateUrl="~/aspx/stop/stopHistory.aspx" Font-Size="10pt">STOP  OUT</asp:HyperLink>
             </td>

         </tr>
        
     </table>
<asp:Panel ID="Panel1" runat="server" ScrollBars="Horizontal" Width="100%"  Height="100%"
        Wrap="False">

    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" CellPadding="4" 
        DataSourceID="SqlDataSource1" Font-Size="8pt" Font-Names="Tahoma"
        GridLines="Vertical" style="margin-bottom: 0px" AllowSorting="True" 
        DataKeyNames="CIF" ForeColor="Black" HorizontalAlign="Left" BackColor="White" 
            BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
            Font-Bold="False" PageSize="15">
      <RowStyle BackColor="#F7F7DE" BorderStyle="Dotted" />

        <Columns>  
        
         <asp:BoundField    HeaderStyle-Wrap="false" DataField="CIF" HeaderText="CIF" 
                SortExpression="CIF" >
               <HeaderStyle Wrap="False" />
            </asp:BoundField>
               <asp:BoundField    HeaderStyle-Wrap="false" DataField="CUSTOMER_NAME" HeaderText="CUSTOMER_NAME" 
                SortExpression="CUSTOMER_NAME" ItemStyle-Wrap="false" >
            <HeaderStyle Wrap="False" />
<ItemStyle Wrap="False"></ItemStyle>
            </asp:BoundField>
         
         
            <asp:BoundField    HeaderStyle-Wrap="false" DataField="PRINCIPAL" HeaderText="PRINCIPAL(เงินต้น)" 
                SortExpression="PRINCIPAL" DataFormatString="{0:n}" >
            <HeaderStyle Wrap="False" />
            </asp:BoundField>
            <asp:BoundField    HeaderStyle-Wrap="false" DataField="ACCRU" 
                HeaderText="ACCRU" SortExpression="ACCRU(ดอกเบี้ยค้าง)"  
                DataFormatString="{0:n}" >
            <HeaderStyle Wrap="False" />
            </asp:BoundField>
            <asp:BoundField    HeaderStyle-Wrap="false" DataField="SUSP" HeaderText="SUSP" 
                SortExpression="SUSP(ดอกเบี้ยพัก)" DataFormatString="{0:n}" >
            <HeaderStyle Wrap="False" />
            </asp:BoundField>
            <asp:BoundField    HeaderStyle-Wrap="false" DataField="AGING_DPD" HeaderText="AGING_DPD(จำนวนเดือนค้าง)"  
                SortExpression="AGING_DPD" DataFormatString="{0:n}" >
            <HeaderStyle Wrap="False" />
            </asp:BoundField>
            <asp:BoundField    HeaderStyle-Wrap="false" DataField="AGING_DPD_C" HeaderText="AGING_DPD_C(จำนวนเดือนค้าง Commercial)" 
                SortExpression="AGING_DPD_C" DataFormatString="{0:n}" >
            <HeaderStyle Wrap="False" />
            </asp:BoundField>
            <asp:BoundField    HeaderStyle-Wrap="false" DataField="AGING_DPD_O" HeaderText="AGING_DPD_O(จำนวนเดือนค้าง OTHER)" 
                SortExpression="AGING_DPD_O" DataFormatString="{0:n}" >
            <HeaderStyle Wrap="False" />
            </asp:BoundField>
            <asp:BoundField    HeaderStyle-Wrap="false" DataField="AGING_H" HeaderText="AGING_H (กลุ่มอายุหนี้ย้อนหลัง)" 
                SortExpression="AGING_H" >
            <HeaderStyle Wrap="False" />
            </asp:BoundField>
            <asp:BoundField    HeaderStyle-Wrap="false" DataField="HAS_OTHER_CLASS" HeaderText="HAS_OTHER_CLASS(เคยมีชั้นหนี้ จ)" 
                SortExpression="HAS_OTHER_CLASS" >
            <HeaderStyle Wrap="False" />
            </asp:BoundField>
            <asp:BoundField    HeaderStyle-Wrap="false" DataField="CLASS_H" HeaderText="CLASS_H (ชั้นหนี้ย้อนหลัง)" 
                SortExpression="CLASS_H" >
            <HeaderStyle Wrap="False" />
            </asp:BoundField>
            <asp:BoundField    HeaderStyle-Wrap="false" DataField="IS_TDR" HeaderText="IS_TDR(เคยเป็น TDR)"  
                SortExpression="IS_TDR" >
            <HeaderStyle Wrap="False" />
            </asp:BoundField>
            <asp:BoundField    HeaderStyle-Wrap="false" DataField="OD_UTILIZE" HeaderText="OD_UTILIZE (เปอเซ็นการใช้วงเงิน)" 
                SortExpression="OD_UTILIZE" DataFormatString="{0:n}" >
            <HeaderStyle Wrap="False" />
            </asp:BoundField>
            <asp:BoundField    HeaderStyle-Wrap="false" DataField="JUDGEMENT" HeaderText="JUDGEMENT (กลุ่มลูกค้า)" 
                SortExpression="JUDGEMENT"  ItemStyle-Wrap="false">
            <HeaderStyle Wrap="False" />
            <ItemStyle Wrap="False" />
            </asp:BoundField>
            <asp:BoundField    HeaderStyle-Wrap="false" DataField="BUSINESS_SIM_FLAG" HeaderText="BUSINESS_SIM_FLAG(รหัสประเภท)" 
                SortExpression="BUSINESS_SIM_FLAG" >
            <HeaderStyle Wrap="False" />
            </asp:BoundField>
            <asp:BoundField    HeaderStyle-Wrap="false" DataField="BUSINESS_CODE" HeaderText="BUSINESS_CODE (รหัสปรเภทธุรกิจ)"  
                SortExpression="BUSINESS_CODE" >
            <HeaderStyle Wrap="False" />
            </asp:BoundField>
            <asp:BoundField    HeaderStyle-Wrap="false" DataField="BUSINESS_DESC" HeaderText="BUSINESS_DESC (ประเภทธุรกิจ)" 
                SortExpression="BUSINESS_DESC"    ItemStyle-Wrap="false" >
            <HeaderStyle Wrap="False" />
            <ItemStyle Wrap="False" />
            </asp:BoundField>
       
            <asp:TemplateField HeaderStyle-Wrap="false" HeaderText="DATE_IN (วันที่เข้า)" SortExpression="DATE_IN">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("DATE_IN") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("DATE_IN", "{0:d}") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle Wrap="False" />
            </asp:TemplateField>
       
            <asp:BoundField    HeaderStyle-Wrap="false" DataField="AGING_DPD_IN" HeaderText="AGING_DPD_IN (จำนวนเดือนค้างชำระ ณ วันที่เข้า)" 
                SortExpression="AGING_DPD_IN" DataFormatString="{0:n}" >
            <HeaderStyle Wrap="False" />
            </asp:BoundField>
            <asp:BoundField    HeaderStyle-Wrap="false" DataField="HAS_OTHER_CLASS_IN" HeaderText="HAS_OTHER_CLASS_IN (มีชั้นหนี้อื่น ณ วันที่เข้า)" 
                SortExpression="HAS_OTHER_CLASS_IN" >
            <HeaderStyle Wrap="False" />
            </asp:BoundField>
            <asp:BoundField    HeaderStyle-Wrap="false" DataField="IS_TDR_IN" HeaderText="IS_TDR_IN (เคยเป็น TDR ณ วันที่เข้า)" 
                SortExpression="IS_TDR_IN" >
            <HeaderStyle Wrap="False" />
            </asp:BoundField>
            <asp:BoundField    HeaderStyle-Wrap="false" DataField="OD_UTILIZE_IN" HeaderText="OD_UTILIZE_IN (เปอร์เซ็นการใช้วงเงิน ณ วันที่เข้า)" 
                SortExpression="OD_UTILIZE_IN" DataFormatString="{0:n}" >
            <HeaderStyle Wrap="False" />
            </asp:BoundField>
            <asp:BoundField    HeaderStyle-Wrap="false" DataField="JUDGEMENT_IN" HeaderText="JUDGEMENT_IN (กลุ่มลูกค้า ณ วันที่เข้า)" 
                SortExpression="JUDGEMENT_IN"  ItemStyle-Wrap="false">
        
            <HeaderStyle Wrap="False" />
            <ItemStyle Wrap="False" />
            </asp:BoundField>
        
            <asp:BoundField    HeaderStyle-Wrap="false" DataField="BUSINESS_CODE_IN" HeaderText="BUSINESS_CODE_IN (รหัสประเภท ณ วันที่เข้า)" 
                SortExpression="BUSINESS_CODE_IN" >
            <HeaderStyle Wrap="False" />
            </asp:BoundField>
            <asp:BoundField    HeaderStyle-Wrap="false" DataField="BUSINESS_DESC_IN" HeaderText="BUSINESS_DESC_IN (ประเภท ณ วันที่เข้า)"  
                 ItemStyle-Wrap="false"
                SortExpression="BUSINESS_DESC_IN"  >
            <HeaderStyle Wrap="False" />
            <ItemStyle Wrap="False" />
            </asp:BoundField>
           <asp:BoundField    HeaderStyle-Wrap="false" DataField="CM_CODE" HeaderText="CM_CODE (รหัสพนักงาน)" 
                SortExpression="CM_CODE" >
            <HeaderStyle Wrap="False" />
            </asp:BoundField>
            <asp:BoundField    HeaderStyle-Wrap="false" DataField="CM_NAME" HeaderText="CM_NAME (พนักงาน)" 
                SortExpression="CM_NAME"  ItemStyle-Wrap="false"  >
            <HeaderStyle Wrap="False" />
            <ItemStyle Wrap="False" />
            </asp:BoundField>
            <asp:BoundField    HeaderStyle-Wrap="false" DataField="LEVEL_NAME" HeaderText="LEVEL_NAME (หน่วยงาน)" 
                SortExpression="LEVEL_NAME"  ItemStyle-Wrap="false" >
            <HeaderStyle Wrap="False" />
            <ItemStyle Wrap="False" />
            </asp:BoundField>
            <asp:BoundField    HeaderStyle-Wrap="false" DataField="CONTROLLING_UNIT" HeaderText="CONTROLLING_UNIT " 
                SortExpression="CONTROLLING_UNIT"  ItemStyle-Wrap="false" >
            <HeaderStyle Wrap="False" />
            <ItemStyle Wrap="False" />
            </asp:BoundField>
           <asp:BoundField    HeaderStyle-Wrap="false" DataField="REGION_CONTROLLING_UNIT" HeaderText="REGION_CONTROLLING_UNIT" 
                SortExpression="REGION_CONTROLLING_UNIT"  ItemStyle-Wrap="false" >
         
            <HeaderStyle Wrap="False" />
            <ItemStyle Wrap="False" />
            </asp:BoundField>
         
     <asp:TemplateField HeaderStyle-Wrap="false" HeaderText="UPDATE_TDR_DATE (วันที่ Register TDR)" 
                SortExpression="UPDATE_TDR_DATE">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("UPDATE_TDR_DATE") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" 
                        Text='<%# Bind("UPDATE_TDR_DATE", "{0:d}") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle Wrap="False" />
            </asp:TemplateField>
          <asp:TemplateField HeaderStyle-Wrap="false" HeaderText="PAY_ABILITY_ID (ความสามารถในการชำระหนี้)" 
                SortExpression="UPDATE_PAY_ABILITY_ID">
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" 
                        DataSourceID="Pay_Datasorce" DataTextField="PAY_ABILITY_DETAIL" 
                        DataValueField="PAY_ABILITY_ID" 
                        SelectedValue='<%# Bind("UPDATE_PAY_ABILITY_ID") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="Pay_Datasorce" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:STOPConnectionString %>" 
                        SelectCommand="SELECT [PAY_ABILITY_ID], [PAY_ABILITY_DETAIL] FROM [STOP_PAY_ABILITY]">
                    </asp:SqlDataSource>
                </ItemTemplate>
                <HeaderStyle Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderStyle-Wrap="false" HeaderText="UPDATE_ACTION_ID (การดำเนินงาน)" 
                SortExpression="UPDATE_ACTION_ID">
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" 
                        DataSourceID="Action_Datasource" DataTextField="ACTION_DETAIL" 
                        DataValueField="ACTION_ID" SelectedValue='<%# Bind("UPDATE_ACTION_ID") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="Action_Datasource" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:STOPConnectionString %>" 
                        SelectCommand="SELECT [ACTION_ID], [ACTION_DETAIL], [ACTION_GROUP], [ACTION_PRIORITY] FROM [STOP_ACTION]">
                    </asp:SqlDataSource>
                </ItemTemplate>
                <HeaderStyle Wrap="False" />
            </asp:TemplateField>
         
            <asp:TemplateField HeaderStyle-Wrap="false" HeaderText="UPDATE_DEPT_RESOLVE_ID (วิธีการแก้ไขหนี้)" 
                SortExpression="UPDATE_DEPT_RESOLVE_ID">
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownList3" runat="server" 
                        DataSourceID="Res_Datasource" DataTextField="DEPT_RESOLVE_DETAIL" 
                        DataValueField="DEPT_RESOLVE_ID" 
                        SelectedValue='<%# Bind("UPDATE_DEPT_RESOLVE_ID") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="Res_Datasource" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:STOPConnectionString %>" 
                        SelectCommand="SELECT [DEPT_RESOLVE_ID], [DEPT_RESOLVE_DETAIL] FROM [STOP_DEPT_RESOLVE_PROCESS]">
                    </asp:SqlDataSource>
                </ItemTemplate>
                <HeaderStyle Wrap="False" />
            </asp:TemplateField>
             
            <asp:TemplateField HeaderStyle-Wrap="false" HeaderText="UPDATE_COMMENT (หมายเหตุ)" 
                SortExpression="UPDATE_COMMENT">
                <ItemTemplate>
                <asp:TextBox ID="TBUPDATE_COMMENT" Text='<%# Bind("UPDATE_COMMENT") %>' runat="server"></asp:TextBox>
                </ItemTemplate>
                <HeaderStyle Wrap="False" />
            </asp:TemplateField>
              <asp:BoundField    HeaderStyle-Wrap="false" DataField="UPDATE_ACTION_DATE" HeaderText="UPDATE_ACTION_DATE (วันที่แก้ไขล่าสุด)" 
                SortExpression="UPDATE_ACTION_DATE"  ItemStyle-Wrap="false" >
         
            <HeaderStyle Wrap="False" />
            <ItemStyle Wrap="False" />
            </asp:BoundField>
         
            <asp:TemplateField HeaderStyle-Wrap="false" HeaderText="UPDATE (บันทึก/เอาออกจาก LIST)" 
            ItemStyle-Wrap="false">
             <ItemTemplate>
                 <asp:Button ID="BtnSAve" 
                 runat="server" Font-Bold="true" 
                 Text="SAVE" 
                 commandname="update"
                 />
                 &nbsp
                  <asp:Button ID="BtnOut" 
                 runat="server" Font-Bold="true" 
                 Text="OUT" 
                 commandname="delete"
                 />
                 <asp:Button ID="BtnReject" runat="server" 
                     Font-Bold="true"                            
                     Text="REJECT"  OnClick="reject"/>
             
                 <asp:HiddenField ID="HCIF" runat="server" Value='<%# Bind("CIF") %>' />
             
             </ItemTemplate>

                <HeaderStyle Wrap="False" />

<ItemStyle Wrap="False"></ItemStyle>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#CCCC99" HorizontalAlign="Left" VerticalAlign="Top" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Left" />
        <SelectedRowStyle BackColor="#CE5D5A"  ForeColor="White" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" 
            Wrap="True" />
        <AlternatingRowStyle Font-Size="8pt" BackColor="White" />
    </asp:GridView>
      </asp:Panel>  

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:STOPConnectionString %>" 
        SelectCommand="SELECT * FROM [STOP_CUSTOMER_DESC] order by cif" 
        DeleteCommand="S05_DELETE_RECCORD_BY_CIF" DeleteCommandType="StoredProcedure" 
        UpdateCommand="S06_UPDATE_STOP_INSERT_ACTION_HISTORY" 
        UpdateCommandType="StoredProcedure"
        >
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

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:STOPConnectionString %>" 
        SelectCommand="SELECT  REGION_CONTROLLING_UNIT  FROM [STOP_CUSTOMER_DESC]
GROUP BY  REGION_CONTROLLING_UNIT  
ORDER BY REGION_CONTROLLING_UNIT  " 
        DeleteCommand="S05_DELETE_RECCORD_BY_CIF" DeleteCommandType="StoredProcedure" 
        UpdateCommand="S06_UPDATE_STOP_INSERT_ACTION_HISTORY" 
        UpdateCommandType="StoredProcedure"
        >
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
     <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
         ConnectionString="<%$ ConnectionStrings:STOPConnectionString %>" 
         SelectCommand="Select count(cif) as  count_cif  from  stop_customer_desc">
     </asp:SqlDataSource>
    <br />
    </form>
</body>
</html>
<script type="text/javascript">
    function ShowDropDownRegion(dropdown) {
      //alert(document.getElementById("DDLSEARCH").value)
      if (document.getElementById("DDLSEARCH").value == 'REGION_CONTROLLING_UNIT') {
          document.getElementById("DDLREGION").style.display = "inline";
          document.getElementById("TBSEARCH").style.display = "none";
          // alert(document.getElementById("DDLREGION").id);
    } else {
        //alert(document.getElementById("DDLREGION").id);
    document.getElementById("DDLREGION").style.display = "none";
    document.getElementById("TBSEARCH").style.display = "inline";
        
    }
  }
  
</script>
