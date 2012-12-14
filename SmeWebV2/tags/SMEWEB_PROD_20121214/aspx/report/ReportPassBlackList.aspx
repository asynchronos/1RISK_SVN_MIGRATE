<%@ Page Language="VB" 
          AutoEventWireup="false" 
          CodeFile="ReportPassBlackList.aspx.vb"  Inherits= "aspx_report_ReportPassBlackList"  %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<style>
body 
     {
      font-size:smaller; background-color:#FFFFCC;
      }
</style>
</head>
<body>
    <form id="form1" runat="server">
   <div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
        SelectCommand="REPORT_EDW_PASS_BLACKLIST" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBoxname" Name="name" PropertyName="Text" 
                Type="String" />
            <asp:ControlParameter ControlID="TextBoxLastname" Name="lastname" 
                PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
           ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
           SelectCommand="REPORT_EDW_PASS_DEFEND" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter Name="name" QueryStringField="name" Type="String" />
            <asp:QueryStringParameter DefaultValue="" Name="lastname" 
                QueryStringField="lastname" Type="String" />
        </SelectParameters>
       </asp:SqlDataSource>

    
        &nbsp;<asp:Label ID="LabelName" runat="server" Text="ค้นหาชื่อ"></asp:Label>
        &nbsp;<asp:TextBox ID="TextBoxname" runat="server"></asp:TextBox>
        &nbsp;<asp:Label ID="LabelLastName" runat="server" Text="นามสกุล"></asp:Label>
        &nbsp;<asp:TextBox ID="TextBoxLastname" runat="server"></asp:TextBox>
        &nbsp;<asp:Button ID="ButtonSearch" runat="server" Text="ค้นหา" />
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="รายชื่อลูกค้าที่ถูกปิดบัญชี" 
            style="font-weight: 700; color: #0000FF"></asp:Label>
    </div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#DEDFDE" 
        BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" 
        GridLines="Vertical" AllowPaging="True" PageSize="5" 
        ToolTip="ประวัติลูกค้าที่มีปัญหาทางด้านการเงินกับธนาคาร">
        <RowStyle BackColor="#F7F7DE" />
        <Columns>
             <asp:BoundField DataField="TITLE" HeaderText="คำนำหน้าชื่อ" SortExpression="TITLE" />
            <asp:BoundField DataField="ACCOUNT_NAME" HeaderText="ชื่อบัญชี" 
                SortExpression="ACCOUNT_NAME" />
            <asp:BoundField DataField="OWNER_NAME" HeaderText="ชื่อเจ้าของบัญชี" 
                SortExpression="OWNER_NAME" />
            <asp:BoundField DataField="ADDRESS" HeaderText="ที่อยู่" 
                SortExpression="ADDRESS" />
            <asp:BoundField DataField="CLOSE_DATE" HeaderText="วันที่ปิดบัญชี (เดือน-ปี)" 
/>
                
           </Columns>
        <FooterStyle BackColor="#CCCC99" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <EmptyDataTemplate>
            ไม่พบรายชื่อลูกค้า
        </EmptyDataTemplate>
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <br />
        <asp:Label ID="Label2" runat="server" Text="รายชื่อลูกค้าที่มีประวัติการถูกพิทักษ์ทรัพย์,ล้มละลาย,ยกเลิกล้มละลาย,และถูกยึดทรัพย์" 
            style="font-weight: 700; color: #0000FF"></asp:Label>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="Black" 
        GridLines="Vertical" AllowPaging="True" PageSize="5">
        <RowStyle BackColor="#F7F7DE" />
        <Columns>
            <asp:BoundField DataField="DASOF" HeaderText="วันที่ข้อมูล" DataFormatString="{0:dd/M/yyyy}"/>
             <asp:BoundField DataField="CASE_NO" HeaderText="หมายเลขคดี" 
                SortExpression="CASE_NO" />      
             <asp:BoundField DataField="PERSON_DESC" HeaderText="ประเภทบุคคล" 
                ReadOnly="True" SortExpression="PERSON_DESC" />
              <asp:BoundField DataField="PERSON_NO" HeaderText="ลำดับที่" 
                SortExpression="PERSON_NO" />
            <asp:BoundField DataField="TITLE" HeaderText="คำนำหน้าชื่อ"  />
            <asp:BoundField DataField="DEFENDANT_NAME" HeaderText="ชื่อ" 
                SortExpression="DEFENDANT_NAME" />
            <asp:BoundField DataField="DEFENDANT_SURNAME" HeaderText="นามสกุล" 
                SortExpression="DEFENDANT_SURNAME" />
     
            <asp:BoundField DataField="DEFENDANT_DESC" HeaderText="รายละเอียดคดี" 
                ReadOnly="True" SortExpression="DEFENDANT_DESC" />
            <asp:BoundField DataField="CONFIS_DESC" HeaderText="รายละเอียดการยึดทรัพย์" 
                ReadOnly="True" SortExpression="CONFIS_DESC" />
        </Columns>
        <FooterStyle BackColor="#CCCC99" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <EmptyDataTemplate>
            ไม่พบรายชื่อลูกค้า
        </EmptyDataTemplate>
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    </form>
</body>
</html>
<script src="../../js/jquery.js" type="text/javascript"></script>

<script type="text/javascript">    
 function sizeFrame() {
  //   $("#iframeBlackList", top.document).css({ height: 0 });   
// กำหนดความสูงของ iframe ให้เท่ากับ 0
     var heightDiv = $(document).height();
     //alert(heightDiv);
     // หาความสูงของเพจ pagecontent.html

     $("#iframeBlackList", parent.document).height(heightDiv);
     var mHight = $("#iframeReportDetail", parent.parent.document).height();
     var bHight = $("#iframeBlackList", parent.document).height();
     $("#iframeReportDetail", parent.parent.document).height(mHight + bHight);
// กำหนดความสูงของ iframe ให้เท่ากับความสูงของ pagecontent.html   
}   
$(function(){   
          sizeFrame();    
          // เรียกใช้ฟังก์ขันเมื่อไฟล์ pagecontent.html โหลดเสร็จแล้ว
          $("#iframeBlackList").load(sizeFrame);    
         // เรียกใช้ฟังก์ขันเมื่อ iframe โหลด ไฟล์  pagecontent.html
      });
     if (document.getElementById('TextBoxLastname').value == '%') {
            document.getElementById('TextBoxLastname').value = ''
       }
</script>  
