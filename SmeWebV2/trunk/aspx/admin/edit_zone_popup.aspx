<%@ Page Language="VB" AutoEventWireup="false" ValidateRequest="false" CodeFile="edit_zone_popup.aspx.vb" Inherits="admin_edit_zone_popup" %>
<%@ Register Src="~/Controls/Editor/editor_manager.ascx"  TagName="editor_manager" TagPrefix="uc7" %>
<%--<%@ Register Src="controls/edit_Zone.ascx" TagName="edit_Zone" TagPrefix="uc1" %>--%>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>edit zone</title>
    <link href= "<%=(Page.ResolveUrl("~/css/zone_popup.css")) %>"  rel="stylesheet" type="text/css" />
    <uc7:editor_manager ID="editor_manager1" runat="server" />
</head>
<body style=" margin-left:0; margin-top:0">

        <form runat="server" id="form1">
        <div class="popup_wrapper" style="margin:20px 0  0 50px;">
            <asp:literal ID="MessageLabel" runat="server"  />
            <asp:PlaceHolder ID="form_wrapper" runat="server">
                <asp:FormView 
                ID="EditForm" 
                runat="server" 
                DefaultMode="Edit">
                    <EditItemTemplate>
                        <strong>Name:</strong><br />
                        <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Name") %>' /><br />
                        <strong>Content:</strong><br />
                        <asp:TextBox ID="DescriptionTextBox" 
                          runat="server" 
                          Text='<%# Bind("Contents") %>' 
                          TextMode="MultiLine" Columns="100" />
                          <br />
                        <asp:LinkButton ID="UpdateButton" CssClass="button" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                        <%--<a href="default.aspx?c=<%=strZone %>" class="button TB_closeWindowButton">Cancel</a>--%>
                            <asp:LinkButton ID="DeleteButton" Visible="false" CssClass="button" commandname="Delete" runat="server" Text="Delete" />
			            <%--<span class="clr">&nbsp;</span>--%>
                    </EditItemTemplate>
                </asp:FormView>
            </asp:PlaceHolder>
       </div>
            <asp:SqlDataSource ID="data" runat="server"></asp:SqlDataSource>
       </form>
</body>
</html>
