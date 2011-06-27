<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Site.master" AutoEventWireup="true"
    CodeBehind="DefaultError.aspx.cs" Inherits="UserSystem.WebPages.Error.DefaultError" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Error_Label" runat="server" Text="Label" ForeColor="Red"></asp:Label>
</asp:Content>