<%@ Page Language="VB" AutoEventWireup="false"   MasterPageFile="~/MasterPage.master" MaintainScrollPositionOnPostback="true"  CodeFile="REPORT_EDW_RISK_MAXAGING_DAILY_FACT.aspx.vb" 
Inherits="aspx_report_REPORT_EDW_RISK_MAXAGING_DAILY_FACT" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

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
        if ($("span[myid='labelCUS_FIRST']")[0]) {
            var name = $("span[myid='labelCUS_FIRST']")[0].innerText;
            var lastname = $("span[myid='labelCUS_LAST']")[0].innerText;
//       �觤�Ҫ�����й��ʡ����ѧ frame blacklist
            $('#iframeBlackList').attr('src', 'ReportPassBlackList.aspx?name=' + escape(name) + '&lastname=' + escape(lastname));
        }

    });
    function showE(e) {
        $(e).animate({ height: 'show', opacity: 'show' }, 'slow');
    }
    function hideE(e) {
        $(e).animate({ height: 'hide', opacity: 'hide' }, 'slow');
    }
</script>   
<title></title>
    <style type="text/css">
     .AH0  {background-color: #FFFFCC;}
     .AH1  {background-color: #FFCC99;}
     .AH2  {background-color: #FF6600;}
     
        .style1
        {
            height: 20px;
            text-align: center;
            background-color: #FFFFCC;
            width: 136px;
        }
        .style97
        {
            text-align: left;
            background-color: #FFFFCC;
        }
        .style98
        {
        }
        .style101
        {
            height: 20px;
            background-color: #FFFFCC;
            text-align: left;
            width: 99px;
            font-weight: bold;
        }
        .style103
        {
            height: 20px;
            text-align: left;
            background-color: #FFFFCC;
            width: 343px;
        }
        .style105
        {
            height: 20px;
            text-align: center;
            background-color: #FFFFCC;
        }
        .style109
        {
            text-align: center;
            background-color: #ECE9D8;
            font-weight: bold;
            width: 136px;
        }
        .style26
        {
            font-weight: 700;
        }
        .style110
        {
            background-color: #ECE9D8;
            font-weight: bold;
            width: 99px;
            text-align: center;
        }
        .style113
        {
            background-color: #FFFFCC;
            text-align: left;
            font-weight: bold;
            width: 99px;
        }
        .style116
        {
            text-align: center;
            background-color: #FFFFCC;
            width: 136px;
        }
        .style117
        {
            background-color: #ECE9D8;
            font-weight: bold;
            width: 134px;
            text-align: center;
        }
        .style118
        {
            text-align: center;
            width: 134px;
            background-color: #FFFFCC;
        }
        .style119
        {
            background-color: #ECE9D8;
            font-weight: bold;
            width: 135px;
            text-align: center;
        }
        .style120
        {
            text-align: right;
            width: 135px;
            background-color: #FFFFCC;
        }
        .style123
        {
            background-color: #FFFFCC;
            text-align: left;
            font-weight: bold;
            width: 121px;
        }
        .style124
        {
            background-color: #ECE9D8;
            font-weight: bold;
            width: 121px;
            text-align: center;
        }
        .style125
        {
            background-color: #ECE9D8;
            font-weight: bold;
            width: 130px;
            text-align: center;
        }
        .style126
        {
            text-align: right;
            background-color: #FFFFCC;
            width: 130px;
        }
        .style127
        {
            height: 20px;
            text-align: right;
            background-color: #FFFFCC;
            width: 130px;
        }
        .style129
        {
            color: #0033CC;
        }
        .style130
        {
            background-color: #ECE9D8;
            font-weight: bold;
            text-align: center;
        }
          .custinfo {
          width:362px; 
          border: thin solid #C0C0C0; font-size: small; background-color: #FFFFCC;
          margin-left :10px;
          float:left;margin:10px;
          } 
          .meanning
        {
           width:302px; 
          border: thin solid #C0C0C0; font-size: small; background-color: #FFFFCC;
          margin-left :10px; margin:10px;
        }
       .showDaily {
         float:left;     
            }
            .daily
        {
          width:800px; border: thin solid #C0C0C0; font-size: small; background-color: #FFFFCC;
        }
        .monthly
        {
          width:800px; border: thin solid #C0C0C0; font-size: small; background-color: #FFFFCC;
        }   
          .tdr
        {
          width:800px; border: thin solid #C0C0C0; font-size: small;background-color: #FFFFCC;
        }
          .law
        {
          width:800px; border: thin solid #C0C0C0; font-size: small; background-color: #FFFFCC;
        }
        .subject 
        {
         font-weight:bold;
        }
           .alscom
        {
          width:800px;height:105px;border: thin solid #C0C0C0; font-size: small; background-color: #FFFFCC;
        }
           .blacklist
        {
          width:800px; border: thin solid #C0C0C0; font-size: small; background-color: #FFFFCC;
        }
        .style131
        {
            background-color: #ECE9D8;
            font-weight: bold;
            text-align: center;
        }
        .style132
        {
            text-align: center;
            background-color: #FFFFCC;
        }
        .style133
        {
            text-align: left;
            background-color: #FFFFCC;
            width: 129px;
            height: 101px;
        }
        .style134
        {
            width: 128px;
            height: 101px;
        }
        </style>
 </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    &nbsp;<html>
 <body >
 <table 
            style="width: 83%;margin-left:20px" >
        <tr>
            <td class="style98">
            <asp:Label ID="Label3" runat="server" Text="���Ң������١��Ҩҡ�к� DWH " Font-Bold="true" ></asp:Label>&nbsp;
                <br />
<asp:Label Text="�к� CIF" runat="server" ID="lblcif" style="font-weight: 700"></asp:Label>
   &nbsp;&nbsp; <asp:TextBox runat="server" ID="tbcif" MaxLength="20"></asp:TextBox>
          &nbsp;<asp:Button runat="server" ID="tbsearch"  Text="����"/>
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
            <table  border="0" cellpadding="2" cellspacing="2" class="custinfo" 
                >
                <tr>
                    <td  style=" background-color:#CCCCCC; color: #000000; text-align: left;"
                        class="style33" >
                        <asp:Label ID="Label1" runat="server"  
                            Text="�������١���" style="font-weight: 700" ></asp:Label>
                    </td>
         
                </tr>
          
                <tr>
                    <td class="style103">
                        <span class="style72"><b>CUSTOMER:</b></span><asp:Label ID="cifLabel" runat="server" 
                            Text='<%# Bind("CIF") %>' CssClass="style72" />
                        <asp:Label ID="CUS_FIRST" runat="server" Text='<%# Bind("CUS_FIRST") %>'   myid="labelCUS_FIRST"
                            CssClass="style72" />
                            <asp:Label ID="CUS_LAST" runat="server" Text='<%# Bind("CUS_LAST") %>'   myid="labelCUS_LAST"
                            CssClass="style72" />
                            
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
                        <span class="style72"><b>���˹��Ѩ�غѹ:</b></span>
                        <asp:Label ID="adjclassLabel" runat="server" Text='<%# Bind("M_ADJCLASS") %>' 
                            CssClass="style72" />
                        &nbsp;
                    
                                <span class="style72"><b>���١��ҷ��� TDR: </b></span>
                        <asp:Label ID="TDRLabel" runat="server" Text='<%# Bind("TDR") %>' 
                            CssClass="style72" />
                    </td>
                </tr>
                <tr>
                    <td class="style103">
                    <span class="style72"><b> ���˹����͹��ѧ 24 ��͹:</b></span>   
                     <asp:Label ID="class_hLabel" runat="server" 
                            Text='<%# Bind("M_CLASS_HIST_24M") %>' CssClass="style72" />
                            ** ����� �Զع�¹ 2552
                      </td>
                </tr>
            </table>
          
      <table  class="meanning" >
        <tr>
         <td  style=" background-color:#CCCCCC; color: #000000; text-align: left;"  colspan="2"
                     >
          <b>  �ʴ���������  Aging History </b>       
         </td>
        </tr>
        <tr>
            <td class="style134" >
                <b>0. = None ������ʹ˹��<br />
                1. = 0&nbsp; ����ҧ����<br />
                2. &gt; 0,=&lt; 0.15
                <br />
                3. &gt; 0.15,=&lt; 1.00<br />
                4. &gt; 1.00,=&lt; 1.15
                <br />
                </b>
            </td>
            <td class="style133" >
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
            <br />
     <b><a href="#" class="showdaily">
      �ʴ��������١�������ѹ&nbsp; � �ѹ��� &nbsp; (
      <asp:Label ID="Label3" runat="server" Text='<%# Bind("ETL_ASOFDATE") %>' />
      &nbsp;)
          </a></b>
            <table border="0"  class="daily" >
                <tr class="style14">
                    <td  colspan="4" class="style97">
                        <span class="style72"><b>�Թ���ط�� ੾�� Cash ������ :</b></span>
                        <asp:Label ID="TOTAL_CASH_PRINCIPALLabel" runat="server" 
                            Text='<%# Bind("TOTAL_CASH_PRINCIPAL","{0:#,###0}") %>' 
                            CssClass="style72" />
                    </td>
                </tr>
                <tr class="style14">
                    <td class="style97" colspan="4">
                        <span class="style72"><b>�������Ҥ�ҧ�����٧�ش :</b></span><asp:Label ID="MAX_AGINGLabel" 
                            runat="server" Text='<%# Bind("MAX_AGING") %>' CssClass="style72" />
                        <br />
                    </td>
                </tr>
                <tr class="style14">
                    <td class="style110">
                        Product</td>
                    <td class="style125">
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
                        <span class="style72"><b>����ѵԡ�ä�ҧ�����٧�ش ��ͺ 60 �ѹ:</b></span></td>
                    <td class="style132">
                        <asp:Label ID="MAX_AGING_HIST" runat="server" CssClass="style72" 
                            Text='<%# Bind("MAX_AGING_HIST_60DAY") %>' />
                    </td>
                </tr>
            </table>
       
               <b><a href="#" class="showmonthly">�ʴ��������١��������͹&nbsp; � �ѹ���
                        (
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("M_ETL_ASOFDATE") %>' />
                        &nbsp;) ** ����� �Զع�¹ 2552
               </a>         
              </b>
            <table class="monthly" >
                <tr class="style14">
                    <td class="style97" colspan="4">
                        <span class="style72"><b>�Թ���ط�� ੾�� Cash ������ :</b></span>
                        <asp:Label ID="TOTAL_CASH_PRINCIPALLabel0" runat="server" 
                            Text='<%# Bind("M_TOTAL_CASH_PRINCIPAL","{0:#,###0}") %>' 
                            CssClass="style72" />
                    </td>
                </tr>
                <tr class="style14">
                    <td class="style97" colspan="4">
                        <span class="style72"><b>�������Ҥ�ҧ�����٧�ش :</b></span><asp:Label ID="MAX_AGINGLabel0" 
                            runat="server" Text='<%# Bind("M_MAX_AGING") %>' CssClass="style72" />
                            <br />
                    </td>
                </tr>
                <tr class="style14">
                    <td class="style124">
                        Product</td>
                    <td class="style119">
                        Principal</td>
                    <td class="style117">
                        Max Aging</td>
                    <td class="style131">
                        Aging Histoy&nbsp; 24 MONTHS
                    </td>
                </tr>
                <tr class="style23">
                    <td class="style123">
                        OD
                    </td>
                    <td class="style120" >
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
                    <td class="style120">
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
                    <td class="style120">
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
                    <td class="style120">
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
                    <td class="style120">
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
                    <td class="style120">
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
                    <td class="style120">
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
                    <td class="style120">
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
                        <span class="style72"><b>����ѵԡ�ä�ҧ�����٧�ش ��ͺ 24 ��͹:</b></span></td>
                    <td class="style132">
                        <asp:Label ID="M_MAX_AGING_HIST_24M" runat="server" CssClass="style72" 
                            Text='<%# Bind("M_MAX_AGING_HIST_24M") %>' />
                    </td>
                </tr>
            </table>
        <b><a href="#" class="showtdr" runat="server" id="showtdr">�ʴ������š�÷� TDR </a></b> 
       <table  class="tdr" >
      <tr>
         <td><asp:label class="subject" runat="server" Text="�� TDR ���駷�� :" ID="LabelHTDRCount" />
                          <asp:Label ID="LabelTDR_COUNT" runat="server" 
                            Text='<%# Bind("TDR_COUNT") %>' />
         </td>
      </tr>  
      <tr>
         <td><asp:label class="subject" runat="server" Text="�ѹ���� TDR  :" ID="LabelHTDRDate" />
         <asp:Label ID="LabelTDRDay" runat="server" Text='<%# Eval("RegiterDate").tostring()  + "/" +   Eval("RegiterMonth").tostring() + "/" +   Eval("RegiterYear").tostring()%>'/>
        </td>
         <td><asp:label class="subject" runat="server" Text="�ѹ�������ѭ�� :" ID="LabelHDateCutOFF" />
          <asp:Label ID="LabelDateCutOFF" runat="server" 
                            Text='<%# Bind("DateCutOff") %>'  />
         </td>
      </tr>
      <tr>
        <td><asp:label class="subject" runat="server" Text="���˹���͹�� TDR :" ID="LabelHClass_Before" />
         <asp:Label ID="LabelClass_Before" runat="server" 
                            Text='<%# Bind("Class_Before") %>'  />
        </td>
        <td><asp:label class="subject" runat="server" Text="���˹����ѧ�� TDR :" ID="LabelHClass_After" />
         <asp:Label ID="LabelClass_After" runat="server" 
                            Text='<%# Bind("Class_After") %>'  />
        </td>
      </tr>
      </table>
     <b><a href="#" class="showlaw" runat="server" id="showlaw"> �ʴ������Ţ�鹵͹������</a></b>
       <table  class="law">
      <tr>
         <td><asp:label class="subject" runat="server" Text="��鹵͹������ :" ID="LabelHCLineS" />
           <asp:Label ID="LabelCLineS" runat="server" 
                            Text='<%# Bind("CLineS") %>'  />
         </td>    
          <td><asp:label class="subject" runat="server" Text="��鹵͹��� :" ID="LabelHBR2_Name" />
         <asp:Label ID="LabelBR2_Name" runat="server" 
                            Text='<%# Bind("BR2_Name") %>'  />
        </td>
      </tr>
      <tr>
      <td><asp:label class="subject" runat="server" Text=" �ѹ����ͧ :" ID="LabelHC3_New" />
           <asp:Label ID="LabelC3_New" runat="server" 
                            Text='<%# Bind("C3_New") %>'  />
      </td>
      <td><asp:label class="subject" runat="server" Text="�Ţ��褴մ� : " ID="LabelHC33" />
           <asp:Label ID="LabelC33" runat="server" 
                            Text='<%# Bind("C33") %>'  />
      </tr>
      <tr>
      <td><asp:label class="subject" runat="server" Text="�ѹ�Ծҡ��  :" ID="LabelHC4_New" />
         <asp:Label ID="LabelC4_New" runat="server" 
                            Text='<%# Bind("C4_New") %>'  />
      </td>
      <td><asp:label class="subject" runat="server" Text="�Ţ��褴�ᴧ :"  ID="LabelHC44"  />
           <asp:Label ID="LabelC44" runat="server" 
                            Text='<%# Bind("C44") %>'  />
      </td>
      </tr>
      <tr>
      <td><asp:label class="subject" ID="LabelHFund"  runat="server" Text="�ع��Ѿ���ͧ :" />
          <asp:Label ID="LabelFUND" runat="server" 
                            Text='<%# Bind("FUND","{0:#,###0}") %>'  />
      </td>
     <td><asp:label class="subject" ID="LabelHChar2" runat="server" Text="�ع��Ѿ������蹿�ͧ�������� :" />
         <asp:Label ID="LabelChar2" runat="server" 
                            Text='<%# Bind("Char2","{0:#,###0}") %>'  />
     </td>
      </tr>
      <tr>
      <td><asp:Label class="subject" ID="LabelHNou"  runat ="server" Text=" �ѹ����ͧ�������� : " />
              <asp:Label ID="LabelNou" runat="server" 
                            Text='<%# Bind("NOU") %>'  />
      </td>
      <td ><asp:Label class="subject"  ID="LabelHDARA"  runat="server" Text=" �ѹ���Ծҡ���������� :" />
               <asp:Label ID="LabelDara" runat="server" 
                            Text='<%# Bind("DARA") %>'  />
      </td>
      </tr>
      </table>     
      <br />   
        </ItemTemplate>
    </asp:FormView>
    <b><asp:HyperLink class="showalscom" NavigateUrl="#" ID="ashowalscom" runat="server"> �ʴ������Ũҡ ALSCOM</asp:HyperLink>
     </b>
            <asp:Panel ID="PanelALSCOM" runat="server">
                <iframe  frameborder="0" id="iframeALSCOM" class="alscom"  
    src="<% response.write("reportPassALSCOM.aspx?cif=" & request("cif")) %>" name="I1">
                </iframe>
            </asp:Panel>
         <br />
         <a href='https://www.krungsri-bl-wl.net/' ><b>������ blacklist �ͧ�١�����¹���سҤ�ԡ�������������к� krungsri Blacklist System</b></a>
         
</td></tr></table></body></html></asp:Content>
