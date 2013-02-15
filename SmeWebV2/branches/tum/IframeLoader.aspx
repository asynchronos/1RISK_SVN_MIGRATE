<%@ Page Language="VB" AutoEventWireup="false" CodeFile="IframeLoader.aspx.vb" Inherits="IframeLoader" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Iframe Loader</title>
        <script type="text/javascript" src="js/ext3.0/adapter/ext/ext-base.js"></script>
        <script type="text/javascript" src="js/ext3.0/ext-all.js"></script>
        <script type="text/javascript">
            var url = "#";
            function init() {
                if (this.url) {
                    location.href = this.url;
                }
            }
        </script>
        
        <%
            Dim url As String = String.Empty
        
            If hasQueryString("url") Then
                url = getQueryString("url")
            End If
            
            Response.Write("<script type=""text/javascript"">" & vbCrLf)
            Response.Write("<!--" & vbCrLf)
            Response.Write("this.url = decodeURIComponent('" + url + "');" & vbCrLf)
            Response.Write("//-->" & vbCrLf)
            Response.Write("</script>" & vbCrLf)
        %>
        
        <style type="text/css">
            .loadingStyle
            {
	            position: absolute;
	            background-image: url(./images/progress/cicle/indicator_verybig.gif);
	            background-repeat: no-repeat;
	            text-align: center;
	            vertical-align: middle;
	            z-index: 99999;
	            width: 128px;
	            height: 128px;
	            left: 45%;
            }
        </style>
        <script type="text/javascript">
            Ext.onReady(function() {
                Ext.fly("loading").setStyle("left", new String(Math.floor((Number(this.document.body.offsetWidth) - 128) / 2)) + "px");
                //Ext.fly("loading").setStyle("top", new String(Math.floor((Number(this.document.body.offsetHeight) - 128) / 2)) + "px");
            });
        </script>
    </head>
    <body onload="init();" style="overflow:hidden;">
        <form id="form1" runat="server">
            <div id="loading" class="loadingStyle" >
                
            </div>
        </form>
    </body>

    <script type="text/javascript">
        if (document.layers) {
            document.write('<Layer src="' + this.url + '" visibility="hide"></Layer>');
        }
        else if (document.all || document.getElementById) {
            document.write('<iframe src="' + this.url + '" style="visibility:hidden;"></iframe>');
        }
        else {
            init();
        }
    </script>
</html>
