<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ReportCreditNoUploadV2.aspx.vb" Inherits="aspx_report_ReportCreditNoUploadV2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link href="../../js/ext3.0/resources/css/ext-all.css" rel="stylesheet" type="text/css" />    

    <script src="../../js/ext3.0/adapter/ext/ext-base-debug.js" type="text/javascript"></script>
    <script src="../../js/ext3.0/ext-all-debug-new.js" type="text/javascript"></script>
     <script src="../../js/pagemethods-proxy-config.js" type="text/javascript"></script>
    <script src="../../js/ext3.0/examples/shared/examples.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/ext3.0/iframeComponent.js"></script>
 <script src="../../js/ext3.0/examples/grid/ProgressBarPager.js" type="text/javascript"></script> 
  <script type="text/javascript" src="ReportCreditNoUploadV2.js"></script>
   <style type="text/css">
   
.example-info{
	width:150px;
	border:1px solid #c3daf9;
	border-top:1px solid #DCEAFB;
	border-left:1px solid #DCEAFB;
	background:#ecf5fe url( info-bg.gif ) repeat-x;
	font-size:10px;
	padding:8px;
}
pre.code{
	background: #F8F8F8;
	border: 1px solid #e8e8e8;
	padding:10px;
	margin:10px;
	margin-left:0px;
	border-left:5px solid #e8e8e8;
	font-size: 12px !important;
	line-height:14px !important;
}
.msg .x-box-mc {
    font-size:14px;
}
#msg-div {
    position:absolute;
    left:35%;
    top:10px;
    width:250px;
    z-index:20000;
}
li {
    color:Red ;
}
.link {
    cursor:pointer ;
    color:Blue ;
     font-weight:bold;
    text-decoration:underline;
}
 .x-grid3-cell-inner { font-size: 12px;}
</style>
</head>
<body>
    <form id="form1" runat="server">   
    <asp:ScriptManager ID="ScriptManager1" 
    EnablePageMethods="true"  runat="server" />
    <b>
    <br />
    <div  id="cbAuth"></div>
    <div id="grid-ca"></div>
    </form>
</body>
</html>
