
<%@ Control Language="VB"   AutoEventWireup="false" CodeFile="Contents.ascx.vb" Inherits="Controls_Content_Content" %>

<link href="<% Response.write(Page.ResolveUrl("~/css/thickbox.css"))%>" rel="stylesheet" type="text/css" /> 
<script type="text/javascript" src="<% Response.write(Page.ResolveUrl("~/js/jquery.js"))%>"></script>
<script type="text/javascript" src="<% Response.write(Page.ResolveUrl("~/js/thickbox.js"))%>"></script>
<asp:Literal ID="zone_button" runat="server" />
<asp:Literal ID="LableText" runat="server" />



