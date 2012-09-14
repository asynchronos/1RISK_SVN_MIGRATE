<%@ Control 
    Language="VB" 
    AutoEventWireup="false" 
    CodeFile="editor_manager.ascx.vb" 
    Inherits="Controls_editor_edit_manager" %>
    
<!-- tinyMCE --  อ้างอิง path จาก popup ทีใช้ -->
<script language="javascript" type="text/javascript" 
src="<%=Page.ResolveUrl("~/Controls/Editor/tinymce/jscripts/tiny_mce/tiny_mce.js") %>"></script>
<asp:PlaceHolder ID="advacned2" runat="server" >
<script language="javascript" type="text/javascript">
    tinyMCE.init({
          mode: "textareas" ,
          theme: "advanced" , 
       theme_advanced_buttons1 : "save,newdocument,|,bold,italic,underline,strikethrough,justifyleft,justifycenter,justifyright,justifyfull",
	   theme_advanced_buttons2 : "formatselect,fontselect,fontsizeselect,forecolor,backcolor,code",
	   theme_advanced_buttons3 : "",
       theme_advanced_toolbar_location: "top",
       theme_advanced_toolbar_align: "left",
       theme_advanced_statusbar_location : "bottom"
      });
	</script>
</asp:PlaceHolder>



<!-- /tinyMCE -->