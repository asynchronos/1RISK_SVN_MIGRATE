<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ReportPerfomance.aspx.vb" Inherits="aspx_report_ReportPerfomance" %>

<%@ Register Src="~/HeaderControl/HeaderControl.ascx" TagName="HeaderControl" TagPrefix="uc1" %>
<%@ Register Src="~/HeaderControl/HeadTagControl.ascx" TagName="HeadTagControl"
    TagPrefix="uc2" %>

<%@ Register src="~/Controls/Chart/Chart.ascx" tagname="Chart" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<head id="Head1" runat="server">
    <uc2:HeadTagControl ID="HeadTagControl1" runat="server" />

    <link href="../../css/StyleSheet.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            width: 396px;
        }
        .style3
        {
            width: 77px;
        }
        .style4
        {
            width: 153px;
        }
        .style5
        {
            width: 318px;
        }
        .style11
        {
            width: 162px;
        }
        .style15
        {
            width: 130px;
        }
        .style16
        {
            width: 370px;
        }
        .style19
        {
            width: 351px;
        }
        .style20
        {
            width: 51px;
        }
        .style21
        {
            width: 311px;
        }
        .style22
        {
            width: 94px;
        }
        .style23
        {
            width: 151px;
        }
        .style24
        {
            width: 335px;
        }
        .style25
        {
            width: 96px;
        }
        .style26
        {
            width: 149px;
        }
        .style28
        {
            width: 66px;
        }
        .style29
        {
            width: 650px;
        }
    </style>
</head>
 
   
<body style="font-size:10"> 
    <form id="form1" runat="server"> 
    <uc1:HeaderControl ID="HeaderControl1" runat="server" />
    <div>
    
 

<table >
    <tr>
        <td class="style1" valign="top">
               &nbsp;<asp:Panel ID="Panel1" runat="server" Height="600px" ScrollBars="Vertical" 
                   Width="373px" BackColor="White" BorderWidth="1px">
                   <asp:Label ID="Label2" runat="server" Text="วันที่"></asp:Label>
                   &nbsp;<asp:DropDownList ID="DropDownListDay" runat="server" style="margin-left: 0px">
                   </asp:DropDownList>
                   <asp:DropDownList ID="DropDownListMonth" runat="server">
                   </asp:DropDownList>
                   <asp:DropDownList ID="DropDownListYear" runat="server">
                   </asp:DropDownList>
                   <br />
        <asp:TreeView ID="LevelTree" runat="server" ExpandDepth="0" Width="100px" 
                BorderStyle="None" BorderWidth="1px" Height="180px">
            <ParentNodeStyle Font-Size="10pt" />
            <RootNodeStyle Font-Size="10pt" />
            <NodeStyle Font-Size="10pt" />
            <LeafNodeStyle NodeSpacing="0px" />
        </asp:TreeView>
        </asp:Panel>
    
        </td>
        <td valign="top" style="margin-left: 80px">
            
            <asp:Button ID="Button1" runat="server" style="height: 26px" Text="VIEW" 
        Height="17px" Width="114px" />
            
             
               
                &nbsp;* อ้างอิงจากบุคคลในโปรเซสสุดท้ายของหนังสือ<br />
            
             
               
                <asp:Label ID="lblID" runat="server" Visible="False"></asp:Label>
                <br />
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:HyperLink ID="lblName" runat="server" Font-Bold="True">[lblName]</asp:HyperLink>
                   <br />
                   <br />
                   <table>
                   <tr><td valign="top" class="style21"> <table bgcolor="WhiteSmoke" border="1" cellpadding="2" cellspacing="2">
                                <tr>
                                    <td class="style4" style="background-color: #C0C0C0">
                                        &nbsp;&nbsp;&nbsp;
                                        <asp:Label ID="lblApprove28" runat="server" Font-Bold="True" Text="รวม"></asp:Label>
                                    </td>
                                    <td class="style3" style="background-color: #C0C0C0">
                                        &nbsp;
                                        <asp:Label ID="lblApprove29" runat="server" Font-Bold="True" Text="ราย"></asp:Label>
                                    </td>
                                    <td style="background-color: #C0C0C0" class="style20">
                                        &nbsp;&nbsp;&nbsp;
                                        <asp:Label ID="lblApprove30" runat="server" Font-Bold="True" Text="จำนวน"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style4">
                                        <asp:Label ID="lblApprove39" runat="server" Text="Approve"></asp:Label>
                                    </td>
                                    <td align="right" class="style3">
                                        <asp:Label ID="lblTTCount1" runat="server" Text="0"></asp:Label>
                                    </td>
                                    <td align="right" class="style20">
                                        <asp:Label ID="lblTTNet1" runat="server" Text="0"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style4">
                                        <asp:Label ID="lblApprove42" runat="server" Text="Recject"></asp:Label>
                                    </td>
                                    <td align="right" class="style3">
                                        <asp:Label ID="lblTTCount2" runat="server" Text="0"></asp:Label>
                                    </td>
                                    <td align="right" class="style20">
                                        <asp:Label ID="lblTTNet2" runat="server" Text="0"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style4">
                                        <asp:Label ID="lblApprove46" runat="server" Text="Return"></asp:Label>
                                    </td>
                                    <td align="right" class="style3">
                                        <asp:Label ID="lblTTCount3" runat="server" Text="0"></asp:Label>
                                    </td>
                                    <td align="right" class="style20">
                                        <asp:Label ID="lblTTNet3" runat="server" Text="0"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style4">
                                        <asp:Label ID="lblApprove34" runat="server" Text="Inprocess"></asp:Label>
                                    </td>
                                    <td align="right" class="style3">
                                        <asp:Label ID="lblTTCount4" runat="server" Text="0"></asp:Label>
                                    </td>
                                    <td align="right" class="style20">
                                        <asp:Label ID="lblTTNet4" runat="server" Text="0"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style4">
                                        <asp:Label ID="lblApprove47" runat="server" Text="Summary"></asp:Label>
                                    </td>
                                    <td align="right" class="style3">
                                        <asp:Label ID="lblTTCount5" runat="server" Text="0"></asp:Label>
                                    </td>
                                    <td align="right" class="style20">
                                        <asp:Label ID="lblTTNet5" runat="server" Text="0"></asp:Label>
                                    </td>
                                </tr>
                            </table></td>
                       <td class="style19">
    <uc1:Chart ID="Chart3" runat="server"  
    ChartType="Bar"  
    chartWidth="300"   
    ChartColor="#33FF33" 
    ChartHeight="200" />
    
                       </td> 
                       </tr>
                   <tr><td class="style21">  <table bgcolor="#CCFFCC" border="1" cellpadding="2" cellspacing="2">
                                <tr>
                                    <td class="style24" style="background-color: #008080">
                                        &nbsp;&nbsp;&nbsp;
                                        <asp:Label ID="lblApprove" runat="server" Font-Bold="True" Text="Approve"></asp:Label>
                                    </td>
                                    <td class="style23" style="background-color: #008080">
                                        &nbsp;
                                        <asp:Label ID="lblApprove0" runat="server" Font-Bold="True" Text="ราย"></asp:Label>
                                    </td>
                                    <td style="background-color: #008080" class="style22">
                                        &nbsp;&nbsp;&nbsp;
                                        <asp:Label ID="lblApprove1" runat="server" Font-Bold="True" Text="จำนวน"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style24">
                                        <asp:Label ID="lblApprove2" runat="server" Text="เรื่องอนุมัติสินเชื่อ"></asp:Label>
                                    </td>
                                    <td align="right" class="style23">
                                        <asp:Label ID="lblACount1" runat="server" Text="0"></asp:Label>
                                    </td>
                                    <td align="right" class="style22">
                                        <asp:Label ID="lblANet1" runat="server" Text="0"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style24">
                                        <asp:Label ID="lblApprove3" runat="server" Text="เรื่องต่ออายุ"></asp:Label>
                                    </td>
                                    <td align="right" class="style23">
                                        <asp:Label ID="lblACount2" runat="server" Text="0"></asp:Label>
                                    </td>
                                    <td align="right" class="style22">
                                        <asp:Label ID="lblANet2" runat="server" Text="0"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style24">
                                        <asp:Label ID="lblApprove4" runat="server" Text="เรื่องอื่น ๆ"></asp:Label>
                                    </td>
                                    <td align="right" class="style23">
                                        <asp:Label ID="lblACount3" runat="server" Text="0"></asp:Label>
                                    </td>
                                    <td align="right" class="style22">
                                        <asp:Label ID="lblANet3" runat="server" Text="0"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style24">
                                        <asp:Label ID="lblApprove5" runat="server" Text="รวม"></asp:Label>
                                    </td>
                                    <td align="right" class="style23">
                                        <asp:Label ID="lblACount4" runat="server" Text="0"></asp:Label>
                                    </td>
                                    <td align="right" class="style22">
                                        <asp:Label ID="lblANet4" runat="server" Text="0"></asp:Label>
                                    </td>
                                </tr>
                            </table></td>
                       <td class="style19">
                           <table bgcolor="#FFCCFF" border="1" cellpadding="2" cellspacing="2">
                                <tr>
                                    <td class="style5" style="background-color: #FF6699">
                                        &nbsp;&nbsp;&nbsp;
                                        <asp:Label ID="lblApprove6" runat="server" Font-Bold="True" Text="ReJect"></asp:Label>
                                    </td>
                                    <td class="style26" style="background-color: #FF6699">
                                        &nbsp;
                                        <asp:Label ID="lblApprove7" runat="server" Font-Bold="True" Text="ราย"></asp:Label>
                                    </td>
                                    <td style="background-color: #FF6699" class="style25">
                                        &nbsp;&nbsp;&nbsp;
                                        <asp:Label ID="lblApprove8" runat="server" Font-Bold="True" Text="จำนวน"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style5">
                                        <asp:Label ID="lblJ1" runat="server" Text="เรื่องอนุมัติสินเชื่อ"></asp:Label>
                                    </td>
                                    <td align="right" class="style26">
                                        <asp:Label ID="lblJCount1" runat="server" Text="0"></asp:Label>
                                    </td>
                                    <td align="right" class="style25">
                                        <asp:Label ID="lblJNet1" runat="server" Text="0"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style5">
                                        <asp:Label ID="lblJ2" runat="server" Text="เรื่องต่ออายุ"></asp:Label>
                                    </td>
                                    <td align="right" class="style26">
                                        <asp:Label ID="lblJCount2" runat="server" Text="0"></asp:Label>
                                    </td>
                                    <td align="right" class="style25">
                                        <asp:Label ID="lblJNet2" runat="server" Text="0"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style5">
                                        <asp:Label ID="lblJ3" runat="server" Text="เรื่องอื่น ๆ"></asp:Label>
                                    </td>
                                    <td align="right" class="style26">
                                        <asp:Label ID="lblJCount3" runat="server" Text="0"></asp:Label>
                                    </td>
                                    <td align="right" class="style25">
                                        <asp:Label ID="lblJNet3" runat="server" Text="0"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style5">
                                        <asp:Label ID="lblJ4" runat="server" Text="รวม"></asp:Label>
                                    </td>
                                    <td align="right" class="style26">
                                        <asp:Label ID="lblJCount4" runat="server" Text="0"></asp:Label>
                                    </td>
                                    <td align="right" class="style25">
                                        <asp:Label ID="lblJNet4" runat="server" Text="0"></asp:Label>
                                    </td>
                                </tr>
                            </table></td>
                       </tr>
                   <tr><td class="style21">
                       <table bgcolor="#CCFFFF" border="1" cellpadding="2" cellspacing="2" 
                           style="width: 309px">
                           <tr>
                               <td class="style11" style="background-color: #66CCFF">
                                   &nbsp;&nbsp;&nbsp;
                                   <asp:Label ID="lblT" runat="server" Font-Bold="True" Text="Return"></asp:Label>
                               </td>
                               <td class="style28" style="background-color: #66CCFF">
                                   &nbsp;
                                   <asp:Label ID="lblApprove14" runat="server" Font-Bold="True" Text="ราย"></asp:Label>
                               </td>
                               <td style="background-color: #66CCFF">
                                   &nbsp;&nbsp;&nbsp;
                                   <asp:Label ID="lblApprove15" runat="server" Font-Bold="True" Text="จำนวน"></asp:Label>
                               </td>
                           </tr>
                           <tr>
                               <td class="style11">
                                   <asp:Label ID="lblApprove38" runat="server" Text="เรื่องอนุมัติสินเชื่อ"></asp:Label>
                               </td>
                               <td align="right" class="style28">
                                   <asp:Label ID="lblTCount1" runat="server" Text="0"></asp:Label>
                               </td>
                               <td align="right">
                                   <asp:Label ID="lblTNet1" runat="server" Text="0"></asp:Label>
                               </td>
                           </tr>
                           <tr>
                               <td class="style11">
                                   <asp:Label ID="lblApprove41" runat="server" Text="เรื่องต่ออายุ"></asp:Label>
                               </td>
                               <td align="right" class="style28">
                                   <asp:Label ID="lblTCount2" runat="server" Text="0"></asp:Label>
                               </td>
                               <td align="right">
                                   <asp:Label ID="lblTNet2" runat="server" Text="0"></asp:Label>
                               </td>
                           </tr>
                           <tr>
                               <td class="style11">
                                   <asp:Label ID="lblApprove44" runat="server" Text="เรื่องอื่น ๆ"></asp:Label>
                               </td>
                               <td align="right" class="style28">
                                   <asp:Label ID="lblTCount3" runat="server" Text="0"></asp:Label>
                               </td>
                               <td align="right">
                                   <asp:Label ID="lblTNet3" runat="server" Text="0"></asp:Label>
                               </td>
                           </tr>
                           <tr>
                               <td class="style11">
                                   <asp:Label ID="lblApprove27" runat="server" Text="รวม"></asp:Label>
                               </td>
                               <td align="right" class="style28">
                                   <asp:Label ID="lblTCount4" runat="server" Text="0"></asp:Label>
                               </td>
                               <td align="right">
                                   <asp:Label ID="lblTNet4" runat="server" Text="0"></asp:Label>
                               </td>
                           </tr>
                       </table>
                       </td>
                       <td class="style19">
                           <table bgcolor="#FFFFCC" border="1" cellpadding="2" cellspacing="2" 
                               style="width: 351px">
                               <tr>
                                   <td class="style29" style="background-color: #FFCC66">
                                       &nbsp;&nbsp;&nbsp;
                                       <asp:Label ID="lblApprove20" runat="server" Font-Bold="True" Text="Inprocess"></asp:Label>
                                   </td>
                                   <td class="style16" style="background-color: #FFCC66">
                                       &nbsp;
                                       <asp:Label ID="lblApprove21" runat="server" Font-Bold="True" Text="ราย"></asp:Label>
                                   </td>
                                   <td class="style15" style="background-color: #FFCC66">
                                       &nbsp;&nbsp;&nbsp;
                                       <asp:Label ID="lblApprove22" runat="server" Font-Bold="True" Text="จำนวน"></asp:Label>
                                   </td>
                               </tr>
                               <tr>
                                   <td class="style29">
                                       <asp:Label ID="lblApprove40" runat="server" Text="เรื่องอนุมัติสินเชื่อ"></asp:Label>
                                   </td>
                                   <td align="right" class="style16">
                                       <asp:Label ID="lblICount1" runat="server" Text="0"></asp:Label>
                                   </td>
                                   <td align="right" class="style15">
                                       <asp:Label ID="lblINet1" runat="server" Text="0"></asp:Label>
                                   </td>
                               </tr>
                               <tr>
                                   <td class="style29">
                                       <asp:Label ID="lblApprove43" runat="server" Text="เรื่องต่ออายุ"></asp:Label>
                                   </td>
                                   <td align="right" class="style16">
                                       <asp:Label ID="lblICount2" runat="server" Text="0"></asp:Label>
                                   </td>
                                   <td align="right" class="style15">
                                       <asp:Label ID="lblINet2" runat="server" Text="0"></asp:Label>
                                   </td>
                               </tr>
                               <tr>
                                   <td class="style29">
                                       <asp:Label ID="lblApprove45" runat="server" Text="เรื่องอื่น ๆ"></asp:Label>
                                   </td>
                                   <td align="right" class="style16">
                                       <asp:Label ID="lblICount3" runat="server" Text="0"></asp:Label>
                                   </td>
                                   <td align="right" class="style15">
                                       <asp:Label ID="lblINet3" runat="server" Text="0"></asp:Label>
                                   </td>
                               </tr>
                               <tr>
                                   <td class="style29">
                                       <asp:Label ID="lblApprove26" runat="server" Text="รวม"></asp:Label>
                                   </td>
                                   <td align="right" class="style16">
                                       <asp:Label ID="lblICount4" runat="server" Text="0"></asp:Label>
                                   </td>
                                   <td align="right" class="style15">
                                       <asp:Label ID="lblINet4" runat="server" Text="0"></asp:Label>
                                   </td>
                               </tr>
                           </table>
                       </td>
                       </tr>
                   </table>

        </td>
    </tr>
    </table>
      
   </div>
    </form>
    </body>
</html>
