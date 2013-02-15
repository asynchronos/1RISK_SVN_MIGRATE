<%@ Page Title="Refresh Cache" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="refreshCache.aspx.vb" Inherits="aspx.admin.refreshCache" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" Runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div style="text-align:center">
    
        <asp:Label ID="Label1" runat="server" Text="Refresh Cache"></asp:Label>
        <br />
    
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
            <asp:ListItem>All</asp:ListItem>
            <asp:ListItem>filterในSummary.aspx</asp:ListItem>
            <asp:ListItem>วันที่นำข้อมูลรายเดือนเข้า</asp:ListItem>
            <asp:ListItem>วันที่นำข้อมูลรายวันเข้า</asp:ListItem>
            <asp:ListItem>สายงานในcontrollingLine.aspx</asp:ListItem>
            <asp:ListItem>userทั้งหมดในสายงาน</asp:ListItem>
        </asp:DropDownList>
    
        <asp:Button ID="Button1" runat="server" Text="Button" />
        
        <br />
        <br />
        <br />
        <asp:Label ID="ResultLabel" runat="server"></asp:Label>
    
    </div>
</asp:Content>
