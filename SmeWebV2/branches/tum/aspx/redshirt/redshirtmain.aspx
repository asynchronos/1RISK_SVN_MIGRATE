<%@ Page Language="VB" AutoEventWireup="false" CodeFile="redshirtmain.aspx.vb" Inherits="aspx_redshirt_redshirtmain" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>List Of Red Shirt Impact</title>
<link href="../../js/ext3.0/resources/css/ext-all-notheme.css" rel="stylesheet" type="text/css" />
<link href="../../js/ext3.0/resources/css/xtheme-tp.css" rel="stylesheet"   type="text/css" />
<script type="text/javascript" src="../../js/ext3.0/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="../../js/ext3.0/ext-all.js"></script>
 <script src="../../js/ext3.0/examples/grid/ProgressBarPager.js" type="text/javascript"></script>
<script src="../../js/ext3.0/examples/locale/PagingMemoryProxy.js" type="text/javascript"></script>
<script src="../../js/ext3.0/examples/form/SearchField.js" type="text/javascript"></script>
<link href="../../js/ext3.0/examples/form/combos.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
 var EMP_ID = '<% Response.Write( User.Identity.Name)%>';
</script>
<script src="redshirtmain.js" type="text/javascript"></script>
 
 <style type="text/css">
 .add      {background-image: url(../../js/ext3.0/examples/shared/icons/fam/add.gif) !important;}
 .edit       {background-image: url(../../js/ext3.0/examples/shared/icons/fam/cog_edit.png) !important;}
 .grid      {background-image: url(../../js/ext3.0/examples/shared/icons/fam/grid.png) !important;}
 .delete {background-image: url(../../js/ext3.0/examples/shared/icons/fam/delete.gif) !important;}
 .x-grid3-cell-inner { font-size: 12px;}
 
 .G1{ color:#74DF00 }
 .G2{ color: #D7DF01 }
 .G3{ color:  #DF7401}
 .G4{ color:#DF0101 }
 .G5{ color:#191007 }
 
 
</style>

</head>
<body>

    <form id="form1" runat="server">   
    <asp:ScriptManager ID="ScriptManager1" 
    EnablePageMethods="true"  runat="server" />
    <b>RED  SHIRT  PROJECT</b>
    <div id="gridRedShirt">
    </div>

    </form>
</body>
</html>
