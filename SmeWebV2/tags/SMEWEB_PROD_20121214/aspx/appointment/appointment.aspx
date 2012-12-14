<%@ Page Language="VB" AutoEventWireup="false" CodeFile="appointment.aspx.vb" Inherits="appointment"  MaintainScrollPositionOnPostback="true" %>

<%@ Register Src="~/HeaderControl/HeaderControl.ascx" TagName="HeaderControl" TagPrefix="uc1" %>
<%@ Register Src="~/HeaderControl/HeadTagControl.ascx" TagName="HeadTagControl"
    TagPrefix="uc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <uc2:HeadTagControl ID="HeadTagControl1" runat="server" />
   
<script language="javascript" type="text/javascript">

   function setValueEmp(EmpID,EmpName,EmpDep,EmpTel)
   {// รับค่าคลิกจาก SearchOffice.aspx
    document.form1.EmpIDTB.value=EmpID;
    document.form1.EmpNameTB.value=EmpName;
    document.form1.EmpDepTB.value=EmpDep;
    document.form1.EmpTelTB.value=EmpTel;
   } 
 
    function setValueCust(cif,cifName)
   {// รับค่าคลิกจาก SearchCustomerisk.aspx
    document.form1.cifTB.value=cif;
    document.form1.cifNameTB.value=cifName;
    } 
    function setValueDep(id,Name)
   {// รับค่าคลิกจาก SearchDep.aspx
    document.form1.DepIDTB.value=id;
    document.form1.DepartTB.value=Name;
    } 
  
    function setValueRisk(riskid,riskname,riskteam,risktel)
   {// รับค่าคลิกจาก SearchRisk.aspx
    document.form1.RiskIDTB.value=riskid;
    document.form1.RiskNameTB.value=riskname;
    document.form1.RiskTeamTB.value=riskteam;
    document.form1.RiskTelTB.value=risktel;
   
    } 
    
    
    
</script>

    <link href="style/StyleSheet.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            width: 431px;
        }
    </style>
</head>
<body leftmargin="0" rightmargin="0" topmargin="0" style="font-size:12px">
    <form id="form1" runat="server">
        <uc1:HeaderControl ID="HeaderControl1" runat="server" />
       <table style="width: 800px; height: 1186px;" align="left" >
            <tr>
                <td align="left" colspan="3">
                    <br />
     
        <table border="0"  style="width: 1px; height: 1205px; background-color: ivory;">
            <tr>
                <td align="left" style="width: 122px; height: 10px" valign="top">
                    <asp:Label ID="Label1" runat="server" Width="304px" Font-Bold="True" ForeColor="Navy" Text="Select day (เลือกวันนัด)"></asp:Label><br />
                    <asp:Calendar ID="MainCalendar" runat="server" BackColor="White" BorderColor="Black" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black"
                        Height="222px" Width="307px" NextPrevFormat="ShortMonth" BorderStyle="Solid" CellSpacing="1">
                        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                        <TodayDayStyle BackColor="#999999" ForeColor="White" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <NextPrevStyle Font-Size="8pt" ForeColor="White" Font-Bold="True" />
                        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" Height="8pt" />
                        <TitleStyle BackColor="#333399" Font-Bold="True" Font-Size="12pt" ForeColor="White" BorderStyle="Solid" Height="12pt" />
                        <DayStyle BackColor="#C0FFFF" BorderColor="White" />
                    </asp:Calendar>
                    <asp:Label ID="Label19" runat="server" BackColor="#FF8000" Width="13px"></asp:Label><asp:Label ID="Label20" runat="server" Text="  แสดงวันที่มีรายการนัด" Width="270px"></asp:Label>
                    <br />
                    <asp:Label ID="Label3" runat="server" Font-Bold="True" ForeColor="#000040" Text="วันที่ :" Width="60px"></asp:Label>
                    <asp:Label ID="lblDate" runat="server" Font-Bold="True" Width="253px" Height="8px"></asp:Label><br />
                    <asp:LinkButton ID="AddBtn" runat="server" Width="315px" Font-Bold="True" ForeColor="Red">..Add..(เพิ่มข้อมูลนัด)</asp:LinkButton><br />
                    <asp:Panel ID="Panel1" runat="server" Height="600px" ScrollBars="Vertical" Width="300px">
                   <asp:DataList ID="DataList1" runat="server" DataKeyField="ID" Height="1px" 
                           OnUpdateCommand="DataList1_UpdateCommand"
                           OnDeleteCommand ="DataList1_DeleteCommand"
                           RepeatColumns="1" RepeatLayout="Flow" Width="289px">
                        <ItemTemplate>
                            <table border="1" style="width: 241px" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td style="height: 3px; width: 199px;">
                                        <table style="width: 230px; height: 67px;" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td style="height: 16px; width: 90px;">
                                                    &nbsp;<asp:Label ID="lblTime" runat="server" ForeColor="Blue" Height="10px" Text="Time (เวลานัด)"
                                                        Width="77px"></asp:Label></td>
                                                <td style="width: 48px; height: 16px;">
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("TimeBegin") & "-" & Eval("TimeEnd") %>'
                                                        Width="104px"></asp:Label>
                                           
                                                   </td>
                                                <td style="width: 48px; height: 16px">
                                                    &nbsp; &nbsp;&nbsp;
                                           <asp:ImageButton ImageUrl="~/images/Edit.gif" 
                                            ID="imageBtn1" CommandName="Edit" ToolTip="คลิกเพื่อแก้ไข"
                                            runat="server"/>
                                           </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 90px">
                                                    &nbsp;<asp:Label ID="lblEmp" runat="server" ForeColor="Blue" Text="Emp ID (ชื่อผู้นัด)"                                                       Width="104px"></asp:Label></td>
                                                <td colspan="2">
                                                    <asp:Label ID="PersonLabel" runat="server" Text='<%# Eval("PersonName") %>' Width="136px"></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td style="height: 17px; width: 90px;">
                                                    &nbsp;<asp:Label ID="Lblrisk" runat="server" ForeColor="Blue" Text="Risk ID (ชื่อผู้ถูกนัด)"
                                                        Width="101px"></asp:Label></td>
                                                <td colspan="2" style="height: 17px">
                                                    <asp:Label ID="Label" runat="server" Text='<%# Eval("RiskName") %>' Width="135px"></asp:Label></td>
                                            </tr>
                                        </table>
                                           </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <FooterTemplate>
                            &nbsp;
                        </FooterTemplate>
                    </asp:DataList></asp:Panel>
                    <br />
                    &nbsp;</td>
                 <td align="left" style="width: 370px; height: 10px" valign="top">
                     &nbsp;<asp:Panel ID="FormPanel" runat="server" Height="50px" Width="297px" 
                         Visible="False" BackColor="Info" BorderColor="#404040" BorderStyle="Solid" 
                         BorderWidth="1px">
                                <asp:Label ID="Label18" runat="server" Font-Bold="True" Text="Description (รายละเอียดการนัด)" Width="257px"></asp:Label><br />
                    <table style="width: 625px" border="0" cellpadding="2" cellspacing="0">
                        <tr>
                            <td style="width: 10px; height: 16px">
                            </td>
                            <td style="height: 16px; width: 599px;">
                                <asp:Label ID="Label4" runat="server" ForeColor="#404040" Text="ID     (Auto) " Width="139px" Font-Bold="True" Height="14px"></asp:Label>
                                <asp:Label ID="IDlabel" runat="server" Width="81px"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="width: 10px; height: 148px;">
                            </td>
                            <td style="height: 148px; width: 599px;">
                                <asp:Label ID="Label26" runat="server" ForeColor="#404040" Text="1. TO Risk ( ผู้ถูกนัด) "
                                    Width="143px" Font-Bold="True"></asp:Label>
                                <table style="width: 436px">
                                    <tr>
                                        <td>
                                <asp:Label ID="Label14" runat="server" ForeColor="Blue" Text="Risk ID  ( รหัสผู้ถูกนัด) *"
                                    Width="143px"></asp:Label></td>
                                        <td>
                                <asp:TextBox ID="RiskIDTB" runat="server"  Width="64px"></asp:TextBox>
                                <asp:Image ID="RiskSearchBTN" runat="server" ImageUrl="~/images/Magnifying Glass.gif" /></td>
                                    </tr>
                                    <tr>
                                        <td>
                                <asp:Label ID="Label15" runat="server" ForeColor="Blue" Text="Risk (ชื่อผู้ถูกนัด)"
                                    Width="91px"></asp:Label></td>
                                        <td>
                                <asp:TextBox ID="RiskNameTB" runat="server" Width="280px"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td>
                                <asp:Label ID="Label16" runat="server" ForeColor="Blue" Text="Risk Team  ( ทีม ) "
                                    Width="92px"></asp:Label></td>
                                        <td>
                                <asp:TextBox ID="RiskTeamTB" runat="server" Width="281px"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label17" runat="server" ForeColor="Blue" Text="Tel  ( เบอร์ติดต่อ)"
                                    Width="88px"></asp:Label></td>
                                        <td>
                                <asp:TextBox ID="RiskTelTB" runat="server" Width="280px"></asp:TextBox></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 10px;">
                            </td>
                            <td rowspan="3" style="width: 599px">
                                <asp:Label ID="Label5" runat="server" ForeColor="#404040" Text="2.Select Time (เวลานัด)" Width="139px" Height="15px" Font-Bold="True"></asp:Label>
                                <asp:DropDownList ID="StimeDdl" runat="server" Width="84px">
                                </asp:DropDownList>
                                &nbsp;<asp:Label ID="Label31" runat="server" Font-Bold="True" Text="To (ถึงเวลา)"></asp:Label>
                                <asp:DropDownList ID="STimeMDdl" runat="server" Width="86px">
                                </asp:DropDownList><br />
                                <table style="width: 294px; ">
                                    <tr>
                                        <td align="left" valign="top" class="style1">
                                <asp:Label ID="Label6" runat="server" ForeColor="#404040" Text="3.Select Date (วันที่นัด) "
                                    Height="20px" Font-Bold="True" Width="221px"></asp:Label>
                                            <br />
                                            <asp:TextBox ID="SdateTB" runat="server" ReadOnly="True" Width="97px"></asp:TextBox>
                                            <asp:Button ID="SelDateBtn" runat="server" BackColor="Navy" Font-Bold="True" 
                                                Font-Names="Verdana" Font-Size="X-Small" ForeColor="Yellow" Height="20px" 
                                                Text="Show Calendar" Width="112px" />
                                            &nbsp;<asp:Panel ID="CalendarPanel" runat="server" Visible="False" Width="125px">
                                                <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="Black" Font-Names="Verdana" Font-Size="9pt"
                                                    ForeColor="Black" Height="191px" Width="287px" BorderStyle="Solid" CellSpacing="1" NextPrevFormat="ShortMonth">
                                                    <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                                    <TodayDayStyle BackColor="#999999" ForeColor="White" />
                                                    <OtherMonthDayStyle ForeColor="#999999" />
                                                    <NextPrevStyle Font-Size="8pt" ForeColor="White" Font-Bold="True" />
                                                    <DayHeaderStyle Font-Bold="True" Height="8pt" Font-Size="8pt" ForeColor="#333333" />
                                                    <TitleStyle BackColor="#333399" Font-Bold="True" Font-Size="12pt" ForeColor="White" BorderStyle="Solid" Height="12pt" />
                                                    <DayStyle BackColor="#C0FFFF" />
                                                </asp:Calendar>
                                                &nbsp;<asp:Label ID="Label29" runat="server" ForeColor="Red" 
                                                    Text="** แสดงวันนัดของ risk" Width="136px"></asp:Label>
                                            </asp:Panel>
                                            
                                            </td>
                                        <td  align="left" valign="top">
                                            <br />
                                          
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 10px;">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 10px;">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 10px;">
                            </td>
                            <td valign="top" rowspan="3" 
                                style="background-color: lightyellow; width: 599px;">
                                <asp:Label ID="Label7" runat="server" ForeColor="#404040" Text="4.From Employee (ผู้นัด)"
                                    Width="216px" Height="20px" Font-Bold="True"></asp:Label>
                                <table style="width: 489px">
                                    <tr>
                                        <td style="width: 142px">
                                <asp:Label ID="Label8" runat="server" ForeColor="Blue" Height="20px" Text="ID" Width="10px"></asp:Label></td>
                                        <td style="width: 335px">
                                <asp:TextBox ID="EmpIDTB" runat="server" Height="16px" 
                                    Width="60px" AutoCompleteType="Search" MaxLength="20"></asp:TextBox>
                                <asp:Image ID="EmpSearchBtn" runat="server" ImageUrl="~/images/Magnifying Glass.gif" /></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 142px">
                                <asp:Label ID="lblNameEmp" runat="server" ForeColor="Blue" Height="20px" Text="Name"
                                    Width="10px"></asp:Label></td>
                                        <td style="width: 335px">
                                            <asp:TextBox ID="EmpNameTB" runat="server"  Width="271px" AutoCompleteType="FirstName" Height="16px"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 142px">
                                <asp:Label ID="Label9" runat="server" ForeColor="Blue" Text="Department (หน่วยงานผู้นัด)"
                                    Width="142px" Height="13px"></asp:Label></td>
                                        <td style="width: 335px">
                                <asp:TextBox ID="EmpDepTB" runat="server" Width="271px"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 142px">
                                <asp:Label ID="Label10" runat="server" ForeColor="Blue" Text="Tel  (เบอร์ติดต่อ)"
                                    Width="84px" Height="14px"></asp:Label></td>
                                        <td style="width: 335px">
                                <asp:TextBox ID="EmpTelTB" runat="server" Width="271px"></asp:TextBox></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 10px;">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 10px;">
                            </td>
                        </tr>
                     
                        <tr>
                            <td style="width: 10px; height: 23px;">
                            </td>
                            <td style="height: 23px; width: 599px;" valign="top">
                                <asp:Label ID="Label11" runat="server" ForeColor="#404040" Text="5.Objective (วัตถุประสงค์)"
                                    Width="218px" Height="19px" Font-Bold="True"></asp:Label><br />
                                <asp:TextBox ID="ObjectiveTB" runat="server" Height="61px" Rows="2"
                                    TextMode="MultiLine" Width="429px" ForeColor="Blue"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 10px; height: 23px">
                            </td>
                            <td valign="top" rowspan="2" 
                                style="background-color: lightyellow; width: 599px;">
                                <asp:Label ID="Label22" runat="server" ForeColor="#404040" Text="6.Customer (ลูกค้า)" Width="222px" Height="19px" Font-Bold="True"></asp:Label>&nbsp;<table
                                    style="width: 388px">
                                    <tr>
                                        <td style="width: 156px">
                                <asp:Label ID="Label21" runat="server" ForeColor="Blue" Height="19px" Text="CIF (ลูกค้า)"
                                    Width="60px"></asp:Label></td>
                                        <td>
                                <asp:TextBox ID="cifTB" runat="server" Width="59px"></asp:TextBox>
                                <asp:Image ID="CifSearchBTN" runat="server" ImageUrl="~/images/Magnifying Glass.gif" /></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 156px">
                                <asp:Label ID="Label23" runat="server" ForeColor="Blue" Text="Customer Name (ชื่อลูกค้า)"
                                    Width="141px" Height="19px"></asp:Label></td>
                                        <td>
                                <asp:TextBox ID="cifNameTB" runat="server" Width="270px"></asp:TextBox></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 10px; height: 23px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 10px; height: 23px">
                            </td>
                            <td valign="top" rowspan="2" 
                                style="background-color: lightyellow; width: 599px;">
                                <asp:Label ID="Label28" runat="server" ForeColor="#404040" Text="7.Department (สาขา)"
                                    Width="222px" Height="19px" Font-Bold="True"></asp:Label>&nbsp;<table style="width: 434px">
                                        <tr>
                                            <td>
                                <asp:Label ID="Label25" runat="server" ForeColor="Blue" Height="19px" Text="ID Department (รหัส สาขา)"
                                    Width="141px"></asp:Label></td>
                                            <td>
                                <asp:TextBox ID="DepIDTB" runat="server" Width="65px"></asp:TextBox>
                                <asp:Image ID="DepSearchBTN" runat="server" ImageUrl="~/images/Magnifying Glass.gif" /></td>
                                        </tr>
                                        <tr>
                                            <td>
                                <asp:Label ID="Label24" runat="server" ForeColor="Blue" Text="Department (ชื่อ สาขา)"
                                    Width="124px" Height="19px"></asp:Label></td>
                                            <td>
                                                <asp:TextBox ID="DepartTB" runat="server" Width="272px"></asp:TextBox></td>
                                        </tr>
                                    </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 10px; height: 23px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 10px">
                            </td>
                            <td valign="top" style="width: 599px">
                                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 10px">
                            </td>
                            <td valign="top">
                                <asp:Label ID="Label12" runat="server" Font-Bold="True" ForeColor="#404040" Height="13px"
                                    Text="8.Location (จังหวัด)" Width="219px"></asp:Label>&nbsp;<br />
                                <asp:Label ID="Label27" runat="server" ForeColor="Blue" Height="13px" Text="จังหวัด"
                                    Width="89px"></asp:Label>
                                <asp:DropDownList ID="LocationDDL" runat="server" Width="273px">
                                </asp:DropDownList>
                                <table style="width: 440px">
                                    <tr>
                                        <td style="width: 158px">
                                            <asp:CheckBox ID="OfficeChk" runat="server" Text=" Office (สำนักงาน)" ForeColor="Blue" /></td>
                                        <td>
                                <asp:CheckBox ID="HomeChk" runat="server" Text="House (บ้าน)" ForeColor="Blue" /></td>
                                        <td>
                                            <asp:CheckBox ID="ShopChk" runat="server" Text=" Shop (ร้าน)" ForeColor="Blue" /></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 158px">
                                <asp:CheckBox ID="FacChk" runat="server" Text="Factory (โรงงาน)" ForeColor="Blue" /></td>
                                        <td>
                                <asp:CheckBox ID="CollChk" runat="server" Text="Colaterals (ชิ้นทรัพย์)" ForeColor="Blue" /></td>
                                        <td>
                                        </td>
                                    </tr>
                                </table>
                            <asp:Label ID="Label30" runat="server" ForeColor="Blue" Text="other ( อื่น ๆ ระบุ)"></asp:Label>
                                <asp:TextBox ID="OtherTB" runat="server" Width="269px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 10px; height: 27px;">
                            </td>
                            <td valign="top" style="height: 27px; width: 599px;">
                                <asp:Label ID="Label13" runat="server" ForeColor="#404040" Text="9.Days    (จำนวนวัน)"
                                    Width="127px" Height="14px" Font-Bold="True"></asp:Label><br />
                                &nbsp;&nbsp;
                                <asp:RadioButton ID="RestRadio0" GroupName="Rest" runat="server" Text="1 Day (ไปกลับ)" Width="97px" ForeColor="Blue" />&nbsp;<br />
                                &nbsp;&nbsp;
                                <asp:RadioButton ID="RestRadio1" GroupName="Rest" runat="server" Text="Stay (ค้างคืน)" ForeColor="Blue" Width="97px" />
                                <asp:TextBox ID="DaysTB" runat="server" Height="16px" MaxLength="2" 
                                    Width="18px"></asp:TextBox>
                                <asp:Label ID="Label32" runat="server" ForeColor="Blue" Text="Days (วัน)" Width="56px"></asp:Label></td>
                        </tr> 
                        <tr>
                            <td colspan="2" style="height: 22px" align="center">
                                <br />
                                <asp:Button ID="SaveBtn" runat="server" Text="Save" Width="106px" />
                                <asp:Button ID="CancelBtn" runat="server" Text="Cancel" Width="106px" />
                                <asp:Button ID="DeleteBtn" runat="server" Text="Delete" Width="106px" />
                            </td>
                        </tr>
                    </table>
                         <br />
                     </asp:Panel>
                </td>
            </tr>
        </table>
 
   
            </td>
        </tr>
        </table>
    </form>
</body>
</html>
