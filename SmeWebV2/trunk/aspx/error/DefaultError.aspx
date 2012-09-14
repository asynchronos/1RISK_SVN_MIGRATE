<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DefaultError.aspx.cs" Inherits="MyAspx.Error.DefaultError" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <asp:Label ID="Error_Label" runat="server" Text="Label" ForeColor="Red"></asp:Label>
    <asp:Panel ID="StackTrace_Panel" runat="server">
        <asp:Label ID="StackTrace_Label" runat="server" Text="Label" ForeColor="Red"></asp:Label>
    </asp:Panel>
    <cc1:CollapsiblePanelExtender ID="StackTracePanel_CollapsiblePanelExtender" 
        runat="server" Collapsed="True" Enabled="True" ExpandControlID="Error_Label" 
        TargetControlID="StackTrace_Panel">
    </cc1:CollapsiblePanelExtender>
</asp:Content>

