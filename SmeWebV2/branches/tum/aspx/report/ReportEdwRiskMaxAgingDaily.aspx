<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ReportEdwRiskMaxAgingDaily.aspx.vb" Inherits="ReportEdwRiskMaxAgingDaily" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<script src="../../js/jquery.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function() {

        $(".showmeanning").toggle(function() {
            hideE(".meanning");
        }, function() {
            showE(".meanning");
        });
        $(".showdaily").toggle(function() {
            hideE(".daily");
        }, function() {
            showE(".daily");
        });
        $(".showmonthly").toggle(function() {
            hideE(".monthly");
        }, function() {
            showE(".monthly");
        });
        $(".showtdr").toggle(function() {
            hideE(".tdr");
        }, function() {
            showE(".tdr");
        });
        $(".showlaw").toggle(function() {
            hideE(".law");
        }, function() {
            showE(".law");
        });
        $(".showalscom").toggle(function() {
            hideE(".alscom");
        }, function() {
            showE(".alscom");
        });
        $(".showblacklist").toggle(function() {
            hideE(".blacklist");
        }, function() {
            showE(".blacklist");
        });

        if ($("span[myid='labelCIF']")) {
           var cif = $("span[myid='labelCIF']").html()
            //            //       ส่งค่าชื่อและนามสกุลไปยัง frame blacklist
            $('#iframeALSCOM').attr('src', 'ReportPassALSCOM.aspx?cif=' + cif);
            // alert($('#iframeBlackList').attr('src'));
        }
        if ($("span[myid='labelCUS_FIRST']")[0]) {
            //var name = $(".CUS_FIRST").html();
            //var lastname = $(".CUS_LAST").html();
            var name = $("span[myid='labelCUS_FIRST']").html()
            var lastname = $("span[myid='labelCUS_LAST']").html();
            //            //       ส่งค่าชื่อและนามสกุลไปยัง frame blacklist
            $('#iframeBlackList').attr('src', 'ReportPassBlackList.aspx?name=' + escape(name) + '&lastname=' + escape(lastname));
           // alert($('#iframeBlackList').attr('src'));
        }
        
    });
    
    function showE(e) {
        $(e).animate({ height: 'show', opacity: 'show' }, 'slow');
    }
    function hideE(e) {
        $(e).animate({ height: 'hide', opacity: 'hide' }, 'slow');
    }
</script>   
<head runat="server">
    <title></title>
    <style type="text/css">

        .style103
        {
            height: 20px;
            text-align: left;
            background-color: #FFFFCC;
        }
        .style97
        {
            text-align: left;
            background-color: #FFFFCC;
        }
        .style26
        {
            font-weight: 700;
        }
          .meanning
        {
          width:314px; 
border: thin solid #C0C0C0; font-size: small; background-color: #FFFFCC;
            height: 66px;
        }
            .daily
        {
          width:761px; 
border: thin solid #C0C0C0; font-size: small; background-color: #FFFFCC;
        }
        .style110
        {
            background-color: #ECE9D8;
            font-weight: bold;
            width: 99px;
            text-align: center;
        }
        .style109
        {
            text-align: center;
            background-color: #ECE9D8;
            font-weight: bold;
            width:106px;
        }
        .style130
        {
            background-color: #ECE9D8;
            font-weight: bold;
            text-align: center;
        }
          .style113
        {
            background-color: #FFFFCC;
            text-align: left;
            font-weight: bold;
            width: 99px;
        }
        .style126
        {
            text-align: right;
            background-color: #FFFFCC;
            width: 98px;
        }
        .style116
        {
            text-align: center;
            background-color: #FFFFCC;
            width: 106px;
        }
        .style132
        {
            text-align: center;
            background-color: #FFFFCC;
        }
        .style101
        {
            height: 20px;
            background-color: #FFFFCC;
            text-align: left;
            width: 99px;
            font-weight: bold;
        }
        .style127
        {
            height: 20px;
            text-align: right;
            background-color: #FFFFCC;
            width: 98px;
        }
             
        .style1
        {
            height: 20px;
            text-align: center;
            background-color: #FFFFCC;
            width: 106px;
        }
        .style105
        {
            height: 20px;
            text-align: center;
            background-color: #FFFFCC;
        }
        .monthly
        {
          width:760px; 
border: thin solid #C0C0C0; font-size: small; background-color: #FFFFCC;
        }   
          .style124
        {
            background-color: #ECE9D8;
            font-weight: bold;
            width: 121px;
            text-align: center;
        }
        .style131
        {
            background-color: #ECE9D8;
            font-weight: bold;
            text-align: center;
        }
        .style123
        {
            background-color: #FFFFCC;
            text-align: left;
            font-weight: bold;
            width: 121px;
        }
        .style129
        {
            color: #0033CC;
        }
        .style118
        {
            text-align: center;
            width: 103px;
            background-color: #FFFFCC;
        }
          .tdr
        {
          width:759px; 
border: thin solid #C0C0C0; font-size: small;background-color: #FFFFCC;
        }
          .subject 
        {
         font-weight:bold;
        }
           .law
        {
          width:759px; 
border: thin solid #C0C0C0; font-size: small; background-color: #FFFFCC;
        }
           .alscom
        {
          width:757px;
height:105px;border: thin solid #C0C0C0; font-size: small; background-color: #FFFFCC;
        }
           .blacklist
        {
          width:758px; 
border: thin solid #C0C0C0; font-size: small; background-color: #FFFFCC;
        }
        .style133
        {
            background-color: #ECE9D8;
            font-weight: bold;
            width: 103px;
            text-align: center;
        }
        .style135
        {
            text-align: right;
            background-color: #FFFFCC;
            width: 115px;
        }
        .style136
        {
            background-color: #ECE9D8;
            font-weight: bold;
            width: 115px;
            text-align: center;
        }
        .style137
        {
            background-color: #ECE9D8;
            font-weight: bold;
            width: 98px;
            text-align: center;
        }
        .style138
        {
            text-align: left;
            background-color: #FFFFCC;
            width: 144px;
        }
        .style139
        {
            width: 445px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
     
 &nbsp;<table style="width: 86%; margin-left:20px">
 <tr><td>
        <asp:Label ID="Label3" runat="server" Text="ค้นหาข้อมูลลูกค้าจากระบบ DWH " Font-Bold="true" ></asp:Label>
     <br />
<asp:Label Text="ระบุ CIF" runat="server" ID="lblcif" style="font-weight: 700"></asp:Label>
        <asp:TextBox runat="server" ID="tbcif" MaxLength="20"></asp:TextBox>
          <asp:Button runat="server" ID="tbsearch"  Text="ค้นหา"/>
     <br />
 
 </td>
 </tr>
 </table>
 
     
 
 <table 
            style="width: 83%;margin-left:20px" >
        <tr>
            <td class="style98">
    <asp:SqlDataSource ID="SqlDataSourceRISK" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
        SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="CIF" QueryStringField="cif" />
        </SelectParameters>
    </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
        <td>

    <asp:FormView ID="FormView1" runat="server" 
     
        DataSourceID="SqlDataSourceRISK" 
      >
        <FooterStyle BackColor="#CCCC99" />

        <ItemTemplate>
        
        <table>
        <tr>
        <td>       
            <table  border="0" cellpadding="2" cellspacing="0" style="width: 394px; font-size: small; margin-left:20; border: thin solid #C0C0C0; height: 118px;" 
                >
                <tr>
                    <td  style=" background-color:#CCCCCC; color: #000000; text-align: left;" 
                        class="style33" >
                        <asp:Label ID="Label1" runat="server"  
                            Text="ข้อมูลลูกค้า" style="font-weight: 700" ></asp:Label>
                    </td>
         
                </tr>
          
                <tr>
                    <td class="style103">
                        <span class="style72"><b>CUSTOMER:</b></span><asp:Label ID="cifLabel" runat="server"  myid="labelCIF"
                            Text='<%# Bind("CIF") %>' />
                        <asp:Label ID="CUS_FIRST" runat="server" Text='<%# Bind("CUS_FIRST") %>'   myid="labelCUS_FIRST"
                            />
                            <asp:Label ID="CUS_LAST" runat="server" Text='<%# Bind("CUS_LAST") %>'   myid="labelCUS_LAST"
                             />
                            
                    </td>
                    
                </tr>
                <tr>
                    <td class="style97">
                        <span class="style26">CUSTOMER SIZE (SME) :</span>
                        <asp:Label ID="custsizeLabel" runat="server" Text='<%# Bind("SIZE_DETAIL") %>' 
                            CssClass="style72" />
                    </td>
                </tr>
                <tr>
                    <td class="style103">
                        <span class="style72"><b>ชั้นหนี้ปัจจุบัน:</b></span>
                        <asp:Label ID="adjclassLabel" runat="server" Text='<%# Bind("M_ADJCLASS") %>' 
                            CssClass="style72" />
                        &nbsp;
                    
                                <span class="style72"><b>เป็นลูกค้าที่ทำ TDR: </b></span>
                        <asp:Label ID="TDRLabel" runat="server" Text='<%# Bind("TDR") %>' 
                            CssClass="style72" />
                    </td>
                </tr>
                <tr>
                    <td class="style103">
                    <span class="style72"><b> ชั้นหนี้ย้อนหลัง 24 เดือน:</b></span>   
                     <asp:Label ID="class_hLabel" runat="server" 
                            Text='<%# Bind("M_CLASS_HIST_24M") %>' CssClass="style72" />
                            ** เริ่ม มิถุนายน 2552
                      </td>
                </tr>
            </table></td>
        <td>
          <b> <a href="#" class="showmeanning"> แสดงความหมาย  Aging History </a>          </b>           
      <table  class="meanning">
        <tr>
            <td class="style138" >
                <b>0. = None ไม่มียอดหนี้<br />
                1. = 0&nbsp; ไม่ค้างชำระ<br />
                2. &gt; 0,=&lt; 0.15
                <br />
                3. &gt; 0.15,=&lt; 1.00<br />
                4. &gt; 1.00,=&lt; 1.15
                <br />
                </b>
            </td>
            <td class="style97" >
                <b>5. &gt; 1.15,=&lt; 2.00
                <br />
                6. &gt; 2.00,=&lt; 3.00
                <br />
                7. &gt; 3.00,=&lt; 4.00
                <br />
                8. &gt; 4.00,=&lt; 6.00
                <br />
                9. &gt; 6.00</b></td>
        </tr>
    </table>
        </td>
        </tr>
        </table>
     
     <b><a href="#" class="showdaily">
      แสดงข้อมูลลูกค้ารายวัน&nbsp; ณ วันที่ &nbsp; (
      <asp:Label ID="Label3" runat="server" Text='<%# Bind("ETL_ASOFDATE") %>' />
      &nbsp;)
          </a></b>
            <table border="0"  class="daily" >
                <tr class="style14">
                    <td  colspan="4" class="style97">
                        <span class="style72"><b>เงินต้นสุทธิ เฉพาะ Cash ทั้งหมด :</b></span>
                        <asp:Label ID="TOTAL_CASH_PRINCIPALLabel" runat="server" 
                            Text='<%# Bind("TOTAL_CASH_PRINCIPAL","{0:#,###0}") %>' 
                            CssClass="style72" />
                    </td>
                </tr>
                <tr class="style14">
                    <td class="style97" colspan="4">
                        <span class="style72"><b>ระยะเวลาค้างชำระสูงสุด :</b></span><asp:Label ID="MAX_AGINGLabel" 
                            runat="server" Text='<%# Bind("MAX_AGING") %>' CssClass="style72" />
                        <br />
                    </td>
                </tr>
                <tr class="style14">
                    <td class="style110">
                        Product</td>
                    <td class="style137">
                        Principal</td>
                    <td class="style109">
                        Max Aging</td>
                    <td class="style130">
                        Aging Histoy 60 Days      
                   </td>
                </tr>
                <tr>
                    <td class="style113">
                        OD
                    </td>
                    <td class="style126">
                        <asp:Label ID="OD_PRIN" runat="server" CssClass="style72" 
                            Text='<%# Bind("OD_PRINCIPAL","{0:#,###0}") %>' style="color: #0033CC" />
                    </td>
                    <td class="style116">
                        <asp:Label ID="OD_MAX" runat="server" CssClass="style72" 
                            Text='<%# Bind("OD_MAX_AGING") %>' style="color: #0033CC" />
                    </td>
                    <td class="style132">
                        <asp:Label ID="OD_AGING_HIST" runat="server" CssClass="style72" 
                            Text='<%# Bind("OD_MAX_AGING_HIST_60DAY") %>' />
                    </td>
                </tr>
                <tr class="style23">
                    <td class="style113">
                        PN
                    </td>
                    <td class="style126">
                        <asp:Label ID="PN_PRIN" runat="server" CssClass="style72" 
                            Text='<%# Bind("PN_PRINCIPAL","{0:#,###0}") %>' style="color: #0033CC" />
                    </td>
                    <td class="style116">
                        <asp:Label ID="PN_MAX" runat="server" CssClass="style72" 
                            Text='<%# Bind("PN_MAX_AGING") %>' style="color: #0033CC" />
                    </td>
                    <td class="style132">
                        <asp:Label ID="PN_AGING_HIST" runat="server" CssClass="style72" 
                            Text='<%# Bind("PN_MAX_AGING_HIST_60DAY") %>' />
                    </td>
                </tr>
                <tr class="style23">
                    <td class="style113">
                        T/L (CL)</td>
                    <td class="style126">
                        <asp:Label ID="TL_COM_PRIN" runat="server" 
                            Text='<%# Bind("TL_COM_PRINCIPAL","{0:#,###0}") %>' CssClass="style72" 
                            style="color: #0033CC" />
                    </td>
                    <td class="style116">
                        <asp:Label ID="TL_COM_MAX" runat="server" 
                            Text='<%# Bind("TL_COM_MAX_AGING") %>' CssClass="style72" 
                            style="color: #0033CC" />
                    </td>
                    <td class="style132">
                        <asp:Label ID="TL_COM_AGING_HIST" runat="server" 
                            Text='<%# Bind("TL_COM_MAX_AGING_HIST_60DAY") %>' CssClass="style72" />
                    </td>
                </tr>
                <tr class="style23">
                    <td class="style113">
                        T/L(HL,PL,SL)</td>
                    <td class="style126">
                        <asp:Label ID="TL_HL_PRIN" runat="server" 
                            Text='<%# Bind("TL_HL_PL_STF_PRINCIPAL","{0:#,###0}") %>' 
                            CssClass="style72" style="color: #0033CC" />
                    </td>
                    <td class="style116">
                        <asp:Label ID="TL_MAX" runat="server" 
                            Text='<%# Bind("TL_HL_PL_STF_MAX_AGING") %>' CssClass="style72" 
                            style="color: #0033CC" />
                    </td>
                    <td class="style132">
                        <asp:Label ID="TL_HL_AGING_HIST" runat="server" 
                            Text='<%# Bind("TL_HL_PL_STF_MAX_AGING_60DAY") %>' CssClass="style72" />
                    </td>
                </tr>
                <tr class="style23">
                    <td class="style113">
                        TRADE FIN.</td>
                    <td class="style126">
                        <asp:Label ID="TRADE_PRIN" runat="server" 
                            Text='<%# Bind("TRADE_PRINCIPAL","{0:#,###0}") %>' CssClass="style72" 
                            style="color: #0033CC" />
                    </td>
                    <td class="style116">
                        <asp:Label ID="TRADE_MAX" runat="server" 
                            Text='<%# Bind("TRADE_MAX_AGING") %>' CssClass="style72" 
                            style="color: #0033CC" />
                    </td>
                    <td class="style132">
                        <asp:Label ID="TRADE_AGING_HIST" runat="server" 
                            Text='<%# Bind("TRADE_MAX_AGING_HIST_60DAY") %>' CssClass="style72" />
                    </td>
                </tr>
                <tr class="style23">
                    <td class="style101">
                        BD</td>
                    <td class="style127">
                        <asp:Label ID="BD_PRIN" runat="server" 
                            Text='<%# Bind("BD_PRINCIPAL","{0:#,###0}") %>' CssClass="style72" 
                            style="color: #0033CC" />
                    </td>
                    <td class="style1">
                        <asp:Label ID="BD_MAX" runat="server" 
                            Text='<%# Bind("BD_MAX_AGING") %>' CssClass="style72" 
                            style="color: #0033CC" />
                    </td>
                    <td class="style105">
                        <asp:Label ID="BD_AGING_HIST" runat="server" 
                            Text='<%# Bind("BD_MAX_AGING_HIST_60DAY") %>' CssClass="style72" />
                    </td>
                </tr>
                <tr class="style23">
                    <td class="style113">
                        CLAIM</td>
                    <td class="style126">
                        <asp:Label ID="CLAIM_PRIN" runat="server" 
                            Text='<%# Bind("CLAIM_PRINCIPAL","{0:#,###0}") %>' CssClass="style72" 
                            style="color: #0033CC" />
                    </td>
                    <td class="style116">
                        <asp:Label ID="CLAIM_MAX" runat="server" 
                            Text='<%# Bind("CLAIM_MAX_AGING") %>' CssClass="style72" 
                            style="color: #0033CC" />
                    </td>
                    <td class="style132">
                        <asp:Label ID="CLAIM_AGING_HIST" runat="server" 
                            Text='<%# Bind("CLAIM_MAX_AGING_HIST_60DAY") %>' CssClass="style72" />
                    </td>
                </tr>
                <tr class="style23">
                    <td class="style113">
                        FNX</td>
                    <td class="style126">
                        <asp:Label ID="FNX_PRIN" runat="server" 
                            Text='<%# Bind("FNX_PRINCIPAL","{0:#,###0}") %>' CssClass="style72" 
                            style="color: #0033CC" />
                    </td>
                    <td class="style116">
                        <asp:Label ID="FNX_MAX" runat="server" 
                            Text='<%# Bind("FNX_MAX_AGING") %>' CssClass="style72" 
                            style="color: #0033CC" />
                    </td>
                    <td class="style132">
                        <asp:Label ID="FNX_AGING_HIST" runat="server" 
                            Text='<%# Bind("FNX_MAX_AGING_HIST_60DAY") %>' CssClass="style72" />
                    </td>
                </tr>
                <tr class="style23">
                    <td class="style97" colspan="3">
                        <span class="style72"><b>ประวัติการค้างชำระสูงสุด ในรอบ 60 วัน:</b></span></td>
                    <td class="style132">
                        <asp:Label ID="MAX_AGING_HIST" runat="server" CssClass="style72" 
                            Text='<%# Bind("MAX_AGING_HIST_60DAY") %>' />
                    </td>
                </tr>
            </table>
       
               <b><a href="#" class="showmonthly">แสดงข้อมูลลูกค้ารายเดือน&nbsp; ณ วันที่
                        (
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("M_ETL_ASOFDATE") %>' />
                        &nbsp;) ** เริ่ม มิถุนายน 2552
               </a>         
              </b>
            <table class="monthly" >
                <tr class="style14">
                    <td class="style97" colspan="4">
                        <span class="style72"><b>เงินต้นสุทธิ เฉพาะ Cash ทั้งหมด :</b></span>
                        <asp:Label ID="TOTAL_CASH_PRINCIPALLabel0" runat="server" 
                            Text='<%# Bind("M_TOTAL_CASH_PRINCIPAL","{0:#,###0}") %>' 
                            CssClass="style72" />
                    </td>
                </tr>
                <tr class="style14">
                    <td class="style97" colspan="4">
                        <span class="style72"><b>ระยะเวลาค้างชำระสูงสุด :</b></span><asp:Label ID="MAX_AGINGLabel0" 
                            runat="server" Text='<%# Bind("M_MAX_AGING") %>' CssClass="style72" />
                            <br />
                    </td>
                </tr>
                <tr class="style14">
                    <td class="style124">
                        Product</td>
                    <td class="style136">
                        Principal</td>
                    <td class="style133">
                        Max Aging</td>
                    <td class="style131">
                        Aging Histoy&nbsp; 24 MONTHS
                    </td>
                </tr>
                <tr class="style23">
                    <td class="style123">
                        OD
                    </td>
                    <td class="style135" >
                        <asp:Label ID="M_OD_PRIN" runat="server" 
                            Text='<%# Bind("M_OD_PRINCIPAL","{0:#,###0}") %>' CssClass="style129" />
                    </td>
                    <td class="style118">
                        <asp:Label ID="M_OD_MAX" runat="server" CssClass="style72" 
                            Text='<%# Bind("M_OD_MAX_AGING") %>' style="color: #0033CC" />
                    </td>
                    <td class="style132">
                        <asp:Label ID="M_OD_MAX_AGING_HIST_24M" runat="server" CssClass="style72" 
                            Text='<%# Bind("M_OD_MAX_AGING_HIST_24M") %>' />
                    </td>
                </tr>
                <tr class="style23">
                    <td class="style123">
                        PN
                    </td>
                    <td class="style135">
                        <asp:Label ID="M_PN_PRIN" runat="server" CssClass="style72" 
                            Text='<%# Bind("M_PN_PRINCIPAL","{0:#,###0}") %>' style="color: #0033CC" />
                    </td>
                    <td class="style118">
                        <asp:Label ID="M_PN_MAX" runat="server" CssClass="style72" 
                            Text='<%# Bind("M_PN_MAX_AGING") %>' style="color: #0033CC" />
                    </td>
                    <td class="style132">
                        <asp:Label ID="M_PN_MAX_AGING_HIST_24M" runat="server" CssClass="style72" 
                            Text='<%# Bind("M_PN_MAX_AGING_HIST_24M") %>' />
                    </td>
                </tr>
                <tr class="style23">
                    <td class="style123">
                        T/L (CL)</td>
                    <td class="style135">
                        <asp:Label ID="M_TL_PRIN" runat="server" CssClass="style72" 
                            Text='<%# Bind("M_TL_COM_PRINCIPAL","{0:#,###0}") %>' 
                            style="color: #0033CC" />
                    </td>
                    <td class="style118">
                        <asp:Label ID="M_TL_MAX" runat="server" CssClass="style72" 
                            Text='<%# Bind("M_TL_COM_MAX_AGING") %>' style="color: #0033CC" />
                    </td>
                    <td class="style132">
                        <asp:Label ID="M_TL_COM_MAX_AGING_HIST_24M" runat="server" 
                            CssClass="style72" Text='<%# Bind("M_TL_COM_MAX_AGING_HIST_24M") %>' />
                    </td>
                </tr>
                <tr class="style23">
                    <td class="style123">
                        T/L(HL,PL,SL)</td>
                    <td class="style135">
                        <asp:Label ID="M_TL_PL_PRIN" runat="server" CssClass="style72" 
                            Text='<%# Bind("M_TL_HL_PL_STF_PRINCIPAL","{0:#,###0}") %>' 
                            style="color: #0033CC" />
                    </td>
                    <td class="style118">
                        <asp:Label ID="M_TL_HL_MAX" runat="server" CssClass="style72" 
                            Text='<%# Bind("M_TL_HL_PL_STF_MAX_AGING") %>' style="color: #0033CC" />
                    </td>
                    <td class="style132">
                        <asp:Label ID="M_TL_HL_PL_STF_MAX_AGING_24M" runat="server" 
                            CssClass="style72" Text='<%# Bind("M_TL_HL_PL_STF_MAX_AGING_24M") %>' />
                    </td>
                </tr>
                <tr class="style23">
                    <td class="style123">
                        TRADE FIN.</td>
                    <td class="style135">
                        <asp:Label ID="M_TRADE_PRIN" runat="server" CssClass="style72" 
                            Text='<%# Bind("M_TRADE_PRINCIPAL","{0:#,###0}") %>' 
                            style="color: #0033CC" />
                    </td>
                    <td class="style118">
                        <asp:Label ID="M_TRADE_MAX" runat="server" CssClass="style72" 
                            Text='<%# Bind("M_TRADE_MAX_AGING") %>' style="color: #0033CC" />
                    </td>
                    <td class="style132">
                        <asp:Label ID="M_TRADE_MAX_AGING_HIST_24M" runat="server" 
                            CssClass="style72" Text='<%# Bind("M_TRADE_MAX_AGING_HIST_24M") %>' />
                    </td>
                </tr>
                <tr class="style23">
                    <td class="style123">
                        BD</td>
                    <td class="style135">
                        <asp:Label ID="M_BD_PRINCIPAL" runat="server" CssClass="style72" 
                            Text='<%# Bind("M_BD_PRINCIPAL","{0:#,###0}") %>' style="color: #0033CC" />
                    </td>
                    <td class="style118">
                        <asp:Label ID="M_BD_MAX" runat="server" CssClass="style72" 
                            Text='<%# Bind("M_BD_MAX_AGING") %>' style="color: #0033CC" />
                    </td>
                    <td class="style132">
                        <asp:Label ID="M_BD_MAX_AGING_HIST_24M" runat="server" CssClass="style72" 
                            Text='<%# Bind("M_BD_MAX_AGING_HIST_24M") %>' />
                    </td>
                </tr>
                <tr class="style23">
                    <td class="style123">
                        CLAIM</td>
                    <td class="style135">
                        <asp:Label ID="M_CLAIM_PRIN" runat="server" CssClass="style72" 
                            Text='<%# Bind("M_CLAIM_PRINCIPAL","{0:#,###0}") %>' 
                            style="color: #0033CC" />
                    </td>
                    <td class="style118">
                        <asp:Label ID="M_CLAIM_MAX" runat="server" CssClass="style72" 
                            Text='<%# Bind("M_CLAIM_MAX_AGING") %>' style="color: #0033CC" />
                    </td>
                    <td class="style132">
                        <asp:Label ID="M_CLAIM_MAX_AGING_HIST_24M" runat="server" 
                            CssClass="style72" Text='<%# Bind("M_CLAIM_MAX_AGING_HIST_24M") %>' />
                    </td>
                </tr>
                <tr class="style23">
                    <td class="style123">
                        FNX</td>
                    <td class="style135">
                        <asp:Label ID="M_FNX_PRIN" runat="server" CssClass="style72" 
                            Text='<%# Bind("M_FNX_PRINCIPAL","{0:#,###0}") %>' 
                            style="color: #0033CC" />
                    </td>
                    <td class="style118">
                        <asp:Label ID="M_FNX_MAX" runat="server" CssClass="style72" 
                            Text='<%# Bind("M_FNX_MAX_AGING") %>' style="color: #0033CC" />
                    </td>
                    <td class="style132">
                        <asp:Label ID="M_FNX_MAX_AGING_HIST_24M" runat="server" 
                            CssClass="style72" Text='<%# Bind("M_FNX_MAX_AGING_HIST_24M") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="style97" colspan="3">
                        <span class="style72"><b>ประวัติการค้างชำระสูงสุด ในรอบ 24 เดือน:</b></span></td>
                    <td class="style132">
                        <asp:Label ID="M_MAX_AGING_HIST_24M" runat="server" CssClass="style72" 
                            Text='<%# Bind("M_MAX_AGING_HIST_24M") %>' />
                    </td>
                </tr>
            </table>
        <b><a href="#" class="showtdr" runat="server" id="showtdr">แสดงข้อมูลการทำ TDR </a></b> 
       <table  class="tdr" >
      <tr>
         <td><asp:label class="subject" runat="server" Text="ทำ TDR ครั้งที่ :" ID="LabelHTDRCount" />
                          <asp:Label ID="LabelTDR_COUNT" runat="server" 
                            Text='<%# Bind("TDR_COUNT") %>' />
         </td>
      </tr>  
      <tr>
         <td><asp:label class="subject" runat="server" Text="วันที่ทำ TDR  :" ID="LabelHTDRDate" />
         <asp:Label ID="LabelTDRDay" runat="server" Text='<%# Eval("RegiterDate").tostring()  + "/" +   Eval("RegiterMonth").tostring() + "/" +   Eval("RegiterYear").tostring()%>'/>
        </td>
         <td><asp:label class="subject" runat="server" Text="วันที่หมดสัญญา :" ID="LabelHDateCutOFF" />
          <asp:Label ID="LabelDateCutOFF" runat="server" 
                            Text='<%# Bind("DateCutOff") %>'  />
         </td>
      </tr>
      <tr>
        <td><asp:label class="subject" runat="server" Text="ชั้นหนี้ก่อนทำ TDR :" ID="LabelHClass_Before" />
         <asp:Label ID="LabelClass_Before" runat="server" 
                            Text='<%# Bind("Class_Before") %>'  />
        </td>
        <td><asp:label class="subject" runat="server" Text="ชั้นหนี้หลังทำ TDR :" ID="LabelHClass_After" />
         <asp:Label ID="LabelClass_After" runat="server" 
                            Text='<%# Bind("Class_After") %>'  />
        </td>
      </tr>
      </table>
     <b><a href="#" class="showlaw" runat="server" id="showlaw"> แสดงข้อมูลขั้นตอนกฎหมาย</a></b>
       <table  class="law">
      <tr>
         <td><asp:label class="subject" runat="server" Text="ขั้นตอนกฏหมาย :" ID="LabelHCLineS" />
           <asp:Label ID="LabelCLineS" runat="server" 
                            Text='<%# Bind("CLineS") %>'  />
         </td>
      </tr>
      <tr>
        <td><asp:label class="subject" runat="server" Text="ขั้นตอนศาล :" ID="LabelHBR2_Name" />
         <asp:Label ID="LabelBR2_Name" runat="server" 
                            Text='<%# Bind("BR2_Name") %>'  />
        </td>
      </tr>
      <tr>
      <td><asp:label class="subject" runat="server" Text=" วันที่ฟ้อง :" ID="LabelHC3_New" />
           <asp:Label ID="LabelC3_New" runat="server" 
                            Text='<%# Bind("C3_New") %>'  />
      </td>
      <td class="style139"><asp:label class="subject" runat="server" Text="เลขที่คดีดำ : " ID="LabelHC33" />
           <asp:Label ID="LabelC33" runat="server" 
                            Text='<%# Bind("C33") %>'  />
      </tr>
      <tr>
      <td><asp:label class="subject" runat="server" Text="วันพิพากษา  :" ID="LabelHC4_New" />
         <asp:Label ID="LabelC4_New" runat="server" 
                            Text='<%# Bind("C4_New") %>'  />
      </td>
      <td class="style139"><asp:label class="subject" runat="server" Text="เลขที่คดีแดง :"  ID="LabelHC44"  />
           <asp:Label ID="LabelC44" runat="server" 
                            Text='<%# Bind("C44") %>'  />
      </td>
      </tr>
      <tr>
      <td><asp:label class="subject" ID="LabelHFund"  runat="server" Text="ทุนทรัพย์ฟ้อง :" />
          <asp:Label ID="LabelFUND" runat="server" 
                            Text='<%# Bind("FUND","{0:#,###0}") %>'  />
      </td>
     <td class="style139"><asp:label class="subject" ID="LabelHChar2" runat="server" Text="ทุนทรัพย์ที่ยื่นฟ้องล้มละลาย :" />
         <asp:Label ID="LabelChar2" runat="server" 
                            Text='<%# Bind("Char2","{0:#,###0}") %>'  />
     </td>
      </tr>
      <tr>
      <td><asp:Label class="subject" ID="LabelHNou"  runat ="server" Text=" วันที่ฟ้องล้มละลาย : " />
              <asp:Label ID="LabelNou" runat="server" 
                            Text='<%# Bind("NOU") %>'  />
      </td>
      <td class="style139" ><asp:Label class="subject"  ID="LabelHDARA"  runat="server" Text=" วันที่พิพากษาล้มละลาย :" />
               <asp:Label ID="LabelDara" runat="server" 
                            Text='<%# Bind("DARA") %>'  />
      </td>
      </tr>
      </table>     
        </ItemTemplate>
    </asp:FormView>
    <b><asp:HyperLink class="showalscom" NavigateUrl="#" ID="ashowalscom" runat="server"> แสดงข้อมูลจาก ALSCOM</asp:HyperLink>
     </b>
            <asp:Panel ID="PanelALSCOM" runat="server">
                <iframe  frameborder="0" id="iframeALSCOM" class="alscom">
                </iframe>
            </asp:Panel>
            <DIV style="page-break-after:always"></DIV>
            <b>
              <a href='https://www.krungsri-bl-wl.net/'  target="_blank"><b>ข้อมูล blacklist ของลูกค้ารายนี้กรุณาคลิกที่นี่เพื่อเข้าระบบ krungsri Blacklist System</b></a>

         </b>
  
            <asp:Panel ID="PanelBlackList" runat="server">
            </asp:Panel>
            <br/> 
        
</td></tr></table>
    
    </div>
    </form>
</body>
</html>

<script type="text/javascript">
    function sizeFrame() {
        //   $("#iframeBlackList", top.document).css({ height: 0 });   
        // กำหนดความสูงของ iframe ให้เท่ากับ 0
        var heightDiv = $(document).height();
        // หาความสูงของเพจ pagecontent.html
        //var blackListHeight = $('#PanelBlackList').height();
        //$("#iframeReportDetail", parent.document).height(heightDiv + blackListHeight);
        $("#iframeReportDetail", parent.document).height(heightDiv);
        // กำหนดความสูงของ iframe ให้เท่ากับความสูงของ pagecontent.html   
    }
    $(function() {
        sizeFrame();
        //// เรียกใช้ฟังก์ขันเมื่อไฟล์ pagecontent.html โหลดเสร็จแล้ว
        $("#iframeReportDetail").load(sizeFrame);
        //// เรียกใช้ฟังก์ขันเมื่อ iframe โหลด ไฟล์  pagecontent.html
    });

</script>  