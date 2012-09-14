<%@ Page Language="VB" AutoEventWireup="false" CodeFile="~/test/login.aspx.vb" Inherits="test_login" %>

<%@ Register Src="~/HeaderControl/HeaderControl.ascx" TagName="HeaderControl" TagPrefix="uc1" %>
<%@ Register Src="~/HeaderControl/HeadTagControl.ascx" TagName="HeadTagControl" TagPrefix="uc2" %>
 <%@ Register Src=  "~/Controls/Contents/Contents.ascx"  TagName="Contents" TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title id="h1" >SME</title>
    <uc2:HeadTagControl ID="HeadTagControl1" runat="server" />
</head>
<body>
    <script type="text/javascript">
        //<%= "window.document.location.replace('"+Page.ResolveUrl("~/aspx/logout/underConstruct.aspx")+"');" %>
    </script>
    <form id="form1" runat="server">
        <uc1:HeaderControl ID="HeaderControl1" runat="server" />
        
        <div style="text-align:left">            
            <asp:Login ID="Login1" runat="server" BackColor="#F7F7DE" BorderColor="#CCCC99" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="10pt">
                <TitleTextStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <LayoutTemplate>
                    <table border="0" cellpadding="1" cellspacing="0" style="border-collapse: collapse">
                        <tr>
                            <td>
                                <table border="0" cellpadding="0">
                                    <tr>
                                        <td align="center" colspan="2" style="font-weight: bold; color: white; background-color: #6b696b">
                                            Log In</td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="UsernameLabel" runat="server" AssociatedControlID="Username">Username:</asp:Label></td>
                                        <td>
                                            <asp:TextBox ID="Username" runat="server" Width="150px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                                ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label></td>
                                        <td>
                                            <asp:TextBox ID="Password" runat="server" TextMode="Password" Width="150px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                                ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2" style="color: red">
                                            <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" colspan="2">
                                            <asp:Button ID="LoginButton" runat="server" Text="Log In" ValidationGroup="Login1" OnClick="LoginButton_Click" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
            </asp:Login>
              <br />
            <br />
              <uc3:Contents ID="Content1" ContentID="3"  runat="server" />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            
            <asp:Label ID="Label3" runat="server" Text="µÔ´µèÍ¼Ùé´ÙáÅÃÐºº 1797,4703,2630" ></asp:Label>
        
        </div>
    </form>
        
</body>
</html>
