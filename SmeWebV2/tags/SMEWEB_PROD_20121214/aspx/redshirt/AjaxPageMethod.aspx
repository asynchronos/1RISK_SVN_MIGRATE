<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AjaxPageMethod.aspx.vb" Inherits="test_AjaxPageMethod" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<link href="../../js/ext3.0/resources/css/ext-all.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/ext3.0/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="../../js/ext3.0/ext-all.js"></script>
 <script type ="text/javascript">
Ext.onReady(function(){
  Ext.get('okButton').on('click', function(){
    var msg = Ext.get("msg");
    msg.load({
        url: "AjaxPageMethod.aspx/myMethod",
        params: "param1=1",
        text: "Updating..."
    });
    msg.show();
  });
});
 </script>
  
<div id="msg" style="visibility: hidden"></div>
Name: <input type="text" id="name" /><br />
<input type="button" id="okButton" value="OK" />
</body>
</html>
