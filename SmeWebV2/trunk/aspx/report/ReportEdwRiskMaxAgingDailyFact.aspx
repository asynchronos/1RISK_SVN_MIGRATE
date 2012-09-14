<%@ Page Language="VB" AutoEventWireup="false"   MasterPageFile="~/MasterPage.master" MaintainScrollPositionOnPostback="true"  CodeFile="ReportEdwRiskMaxAgingDailyFact.aspx.vb" 
Inherits="ReportEdwRiskMaxAgingDailyFact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
<title></title>
 </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    &nbsp;
 <style type="text/css" >
           #iframeReportDetail
        {
          width:900px;
        }
 </style>
 <body style="font-size:small; font-family:Tahoma ; text-align:center" >
          <iframe  frameborder="0" id="iframeReportDetail"   src="ReportEdwRiskMaxAgingDaily.aspx" name="I1">
         </iframe>
  </body>
    </asp:Content>
