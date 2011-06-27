<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Site.master" AutoEventWireup="true"
    CodeBehind="TestGetDataFromService.aspx.cs" Inherits="UserSystem.WebPages.Test.TestGetDataFromService" %>

<%@ Register Assembly="ThaiCalendarByAsynchronous" Namespace="ThaiCalendarByAsynchronous"
    TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <cc1:ThaiCalendarExtender ID="ThaiCalendarExtender1" runat="server" TargetControlID="TextBox1">
    </cc1:ThaiCalendarExtender>
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
    <br />
    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    <asp:CalendarExtender ID="TextBox2_CalendarExtender" runat="server" DefaultView="Days"
        Enabled="True" PopupPosition="BottomLeft" TargetControlID="TextBox2">
    </asp:CalendarExtender>
    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
    <asp:Button ID="Button2" runat="server" Text="Button" OnClick="Button2_Click" />
    <br />
    End Test Calendar extender<br />
</asp:Content>